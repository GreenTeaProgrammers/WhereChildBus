package utils

import (
	"context"
	"database/sql"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	busrouteRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busroute"
	busrouteassociationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busrouteassociation"
	stationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
	"github.com/google/uuid"
	"golang.org/x/exp/slog"
)

func StartTransaction(ctx context.Context, entClient *ent.Client, logger *slog.Logger) (*ent.Tx, error) {
	tx, err := entClient.Tx(ctx)
	if err != nil {
		logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	return tx, nil
}

func CommitTx(tx *ent.Tx, logger *slog.Logger) error {
	if err := tx.Commit(); err != nil {
		logger.Error("failed to commit transaction", err)
		return err
	}
	return nil
}

// RollbackTx はトランザクションのロールバックを試み、エラーがあればロギングします。
func RollbackTx(tx *ent.Tx, logger *slog.Logger) {
	// txがコミット済みの場合はロールバックしない
	if tx == nil {
		logger.Error("failed to rollback transaction", "error", "tx is nil")
		return
	}
	if err := tx.Rollback(); err != nil {
		if err != sql.ErrTxDone {
			logger.Error("failed to rollback transaction", "error", err)
		}
	}
}

func ParseUUID(idStr string, logger *slog.Logger) (uuid.UUID, error) {
	parsedID, err := uuid.Parse(idStr)
	if err != nil {
		logger.Error("failed to parse UUID", "error", err)
		return uuid.UUID{}, err
	}
	return parsedID, nil
}

// ValidateBusStations は、すべてのバスの全ステーションの座標が正しく設定されているかを検証します。
// すべてのステーションに有効な座標が設定されていない場合、バスのステータスをメンテナンスに更新します。
// バスがメンテナンス状態であり、すべてのステーションに座標が設定されている場合、
// バスのステータスを停止状態に戻します。全ての座標が有効であれば true を、
// 一つでも無効な座標があれば false を返します。
func ValidateBusStations(ctx context.Context, tx *ent.Tx, logger *slog.Logger) error {
	buses, err := tx.Bus.Query().
		Where(
			busRepo.Or(
				busRepo.StatusEQ(busRepo.StatusMaintenance),
				busRepo.StatusEQ(busRepo.StatusStopped),
			),
		).
		All(ctx)

	if err != nil {
		logger.Error("failed to get bus", "error", err)
		return err
	}

	for _, bus := range buses {
		exist, err := tx.Station.Query().
			Where(
				stationRepo.HasBusRouteAssociationsWith(
					busrouteassociationRepo.HasBusRouteWith(
						busrouteRepo.HasBusWith(busRepo.IDEQ(bus.ID)),
					),
				),
			).
			Where(stationRepo.Or(
				stationRepo.LatitudeEQ(0), stationRepo.LongitudeEQ(0)),
			).
			Exist(ctx)
		if err != nil {
			logger.Error("failed to get stations for bus", "error", err, "busID", bus.ID)
			return err
		}

		if !exist {
			// バスがメンテナンス状態であり、全てのステーションに座標が設定されている場合、バスのステータスを停止状態に戻す
			if bus.Status == busRepo.StatusMaintenance {
				revertBusStatusFromMaintenance(ctx, logger, bus)
			}
			continue
		} else {
			updateBusStatusToMaintenance(ctx, logger, bus)
		}
	}
	return nil
}

func updateBusStatusToMaintenance(ctx context.Context, logger slog.Logger, bus *ent.Bus) (bool, error) {
	_, err := bus.Update().SetStatus(busRepo.StatusMaintenance).Save(ctx)
	if err != nil {
		logger.Error("failed to set bus status to maintenance", "error", err, "busID", bus.ID)
		return false, err
	}
	return false, nil // 座標が不足しているため、falseを返す
}

func revertBusStatusFromMaintenance(ctx context.Context, logger slog.Logger, bus *ent.Bus) (bool, error) {
	_, err := bus.Update().SetStatus(busRepo.StatusStopped).Save(ctx)
	if err != nil {
		logger.Error("failed to revert bus status from maintenance", "error", err, "busID", bus.ID)
		return false, err
	}
	return true, nil
}
