// Code generated by ent, DO NOT EDIT.

package bus

import (
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the bus type in the database.
	Label = "bus"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldName holds the string denoting the name field in the database.
	FieldName = "name"
	// FieldPlateNumber holds the string denoting the plate_number field in the database.
	FieldPlateNumber = "plate_number"
	// FieldLatitude holds the string denoting the latitude field in the database.
	FieldLatitude = "latitude"
	// FieldLongitude holds the string denoting the longitude field in the database.
	FieldLongitude = "longitude"
	// FieldStatus holds the string denoting the status field in the database.
	FieldStatus = "status"
	// FieldEnableFaceRecognition holds the string denoting the enable_face_recognition field in the database.
	FieldEnableFaceRecognition = "enable_face_recognition"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// FieldUpdatedAt holds the string denoting the updated_at field in the database.
	FieldUpdatedAt = "updated_at"
	// EdgeNursery holds the string denoting the nursery edge name in mutations.
	EdgeNursery = "nursery"
	// EdgeStations holds the string denoting the stations edge name in mutations.
	EdgeStations = "stations"
	// EdgeBoardingRecords holds the string denoting the boarding_records edge name in mutations.
	EdgeBoardingRecords = "boarding_records"
	// EdgeChildBusAssociations holds the string denoting the childbusassociations edge name in mutations.
	EdgeChildBusAssociations = "childBusAssociations"
	// EdgeNextStation holds the string denoting the next_station edge name in mutations.
	EdgeNextStation = "next_station"
	// EdgeMorningFirstStation holds the string denoting the morning_first_station edge name in mutations.
	EdgeMorningFirstStation = "morning_first_station"
	// EdgeEveningFirstStation holds the string denoting the evening_first_station edge name in mutations.
	EdgeEveningFirstStation = "evening_first_station"
	// Table holds the table name of the bus in the database.
	Table = "bus"
	// NurseryTable is the table that holds the nursery relation/edge.
	NurseryTable = "bus"
	// NurseryInverseTable is the table name for the Nursery entity.
	// It exists in this package in order to avoid circular dependency with the "nursery" package.
	NurseryInverseTable = "nurseries"
	// NurseryColumn is the table column denoting the nursery relation/edge.
	NurseryColumn = "bus_nursery"
	// StationsTable is the table that holds the stations relation/edge. The primary key declared below.
	StationsTable = "bus_stations"
	// StationsInverseTable is the table name for the Station entity.
	// It exists in this package in order to avoid circular dependency with the "station" package.
	StationsInverseTable = "stations"
	// BoardingRecordsTable is the table that holds the boarding_records relation/edge.
	BoardingRecordsTable = "boarding_records"
	// BoardingRecordsInverseTable is the table name for the BoardingRecord entity.
	// It exists in this package in order to avoid circular dependency with the "boardingrecord" package.
	BoardingRecordsInverseTable = "boarding_records"
	// BoardingRecordsColumn is the table column denoting the boarding_records relation/edge.
	BoardingRecordsColumn = "bus_boarding_records"
	// ChildBusAssociationsTable is the table that holds the childBusAssociations relation/edge.
	ChildBusAssociationsTable = "child_bus_associations"
	// ChildBusAssociationsInverseTable is the table name for the ChildBusAssociation entity.
	// It exists in this package in order to avoid circular dependency with the "childbusassociation" package.
	ChildBusAssociationsInverseTable = "child_bus_associations"
	// ChildBusAssociationsColumn is the table column denoting the childBusAssociations relation/edge.
	ChildBusAssociationsColumn = "bus_id"
	// NextStationTable is the table that holds the next_station relation/edge.
	NextStationTable = "bus"
	// NextStationInverseTable is the table name for the Station entity.
	// It exists in this package in order to avoid circular dependency with the "station" package.
	NextStationInverseTable = "stations"
	// NextStationColumn is the table column denoting the next_station relation/edge.
	NextStationColumn = "bus_next_station"
	// MorningFirstStationTable is the table that holds the morning_first_station relation/edge.
	MorningFirstStationTable = "bus"
	// MorningFirstStationInverseTable is the table name for the Station entity.
	// It exists in this package in order to avoid circular dependency with the "station" package.
	MorningFirstStationInverseTable = "stations"
	// MorningFirstStationColumn is the table column denoting the morning_first_station relation/edge.
	MorningFirstStationColumn = "bus_morning_first_station"
	// EveningFirstStationTable is the table that holds the evening_first_station relation/edge.
	EveningFirstStationTable = "bus"
	// EveningFirstStationInverseTable is the table name for the Station entity.
	// It exists in this package in order to avoid circular dependency with the "station" package.
	EveningFirstStationInverseTable = "stations"
	// EveningFirstStationColumn is the table column denoting the evening_first_station relation/edge.
	EveningFirstStationColumn = "bus_evening_first_station"
)

// Columns holds all SQL columns for bus fields.
var Columns = []string{
	FieldID,
	FieldName,
	FieldPlateNumber,
	FieldLatitude,
	FieldLongitude,
	FieldStatus,
	FieldEnableFaceRecognition,
	FieldCreatedAt,
	FieldUpdatedAt,
}

// ForeignKeys holds the SQL foreign-keys that are owned by the "bus"
// table and are not defined as standalone fields in the schema.
var ForeignKeys = []string{
	"bus_nursery",
	"bus_next_station",
	"bus_morning_first_station",
	"bus_evening_first_station",
}

var (
	// StationsPrimaryKey and StationsColumn2 are the table columns denoting the
	// primary key for the stations relation (M2M).
	StationsPrimaryKey = []string{"bus_id", "station_id"}
)

// ValidColumn reports if the column name is valid (part of the table columns).
func ValidColumn(column string) bool {
	for i := range Columns {
		if column == Columns[i] {
			return true
		}
	}
	for i := range ForeignKeys {
		if column == ForeignKeys[i] {
			return true
		}
	}
	return false
}

var (
	// DefaultEnableFaceRecognition holds the default value on creation for the "enable_face_recognition" field.
	DefaultEnableFaceRecognition bool
	// DefaultCreatedAt holds the default value on creation for the "created_at" field.
	DefaultCreatedAt func() time.Time
	// DefaultUpdatedAt holds the default value on creation for the "updated_at" field.
	DefaultUpdatedAt func() time.Time
	// UpdateDefaultUpdatedAt holds the default value on update for the "updated_at" field.
	UpdateDefaultUpdatedAt func() time.Time
	// DefaultID holds the default value on creation for the "id" field.
	DefaultID func() uuid.UUID
)

// Status defines the type for the "status" enum field.
type Status string

// StatusStopped is the default value of the Status enum.
const DefaultStatus = StatusStopped

// Status values.
const (
	StatusStopped     Status = "stopped"
	StatusRunning     Status = "running"
	StatusMaintenance Status = "maintenance"
)

func (s Status) String() string {
	return string(s)
}

// StatusValidator is a validator for the "status" field enum values. It is called by the builders before save.
func StatusValidator(s Status) error {
	switch s {
	case StatusStopped, StatusRunning, StatusMaintenance:
		return nil
	default:
		return fmt.Errorf("bus: invalid enum value for status field: %q", s)
	}
}

// OrderOption defines the ordering options for the Bus queries.
type OrderOption func(*sql.Selector)

// ByID orders the results by the id field.
func ByID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldID, opts...).ToFunc()
}

// ByName orders the results by the name field.
func ByName(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldName, opts...).ToFunc()
}

// ByPlateNumber orders the results by the plate_number field.
func ByPlateNumber(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldPlateNumber, opts...).ToFunc()
}

// ByLatitude orders the results by the latitude field.
func ByLatitude(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldLatitude, opts...).ToFunc()
}

// ByLongitude orders the results by the longitude field.
func ByLongitude(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldLongitude, opts...).ToFunc()
}

// ByStatus orders the results by the status field.
func ByStatus(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldStatus, opts...).ToFunc()
}

// ByEnableFaceRecognition orders the results by the enable_face_recognition field.
func ByEnableFaceRecognition(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldEnableFaceRecognition, opts...).ToFunc()
}

// ByCreatedAt orders the results by the created_at field.
func ByCreatedAt(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldCreatedAt, opts...).ToFunc()
}

// ByUpdatedAt orders the results by the updated_at field.
func ByUpdatedAt(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldUpdatedAt, opts...).ToFunc()
}

// ByNurseryField orders the results by nursery field.
func ByNurseryField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newNurseryStep(), sql.OrderByField(field, opts...))
	}
}

// ByStationsCount orders the results by stations count.
func ByStationsCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newStationsStep(), opts...)
	}
}

// ByStations orders the results by stations terms.
func ByStations(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newStationsStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByBoardingRecordsCount orders the results by boarding_records count.
func ByBoardingRecordsCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newBoardingRecordsStep(), opts...)
	}
}

// ByBoardingRecords orders the results by boarding_records terms.
func ByBoardingRecords(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newBoardingRecordsStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByChildBusAssociationsCount orders the results by childBusAssociations count.
func ByChildBusAssociationsCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newChildBusAssociationsStep(), opts...)
	}
}

// ByChildBusAssociations orders the results by childBusAssociations terms.
func ByChildBusAssociations(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newChildBusAssociationsStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByNextStationField orders the results by next_station field.
func ByNextStationField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newNextStationStep(), sql.OrderByField(field, opts...))
	}
}

// ByMorningFirstStationField orders the results by morning_first_station field.
func ByMorningFirstStationField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newMorningFirstStationStep(), sql.OrderByField(field, opts...))
	}
}

// ByEveningFirstStationField orders the results by evening_first_station field.
func ByEveningFirstStationField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newEveningFirstStationStep(), sql.OrderByField(field, opts...))
	}
}
func newNurseryStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(NurseryInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, false, NurseryTable, NurseryColumn),
	)
}
func newStationsStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(StationsInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2M, false, StationsTable, StationsPrimaryKey...),
	)
}
func newBoardingRecordsStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(BoardingRecordsInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, false, BoardingRecordsTable, BoardingRecordsColumn),
	)
}
func newChildBusAssociationsStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(ChildBusAssociationsInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, false, ChildBusAssociationsTable, ChildBusAssociationsColumn),
	)
}
func newNextStationStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(NextStationInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, false, NextStationTable, NextStationColumn),
	)
}
func newMorningFirstStationStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(MorningFirstStationInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, false, MorningFirstStationTable, MorningFirstStationColumn),
	)
}
func newEveningFirstStationStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(EveningFirstStationInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, false, EveningFirstStationTable, EveningFirstStationColumn),
	)
}
