// Code generated by ent, DO NOT EDIT.

package child

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldID, id))
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldID, id))
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldID, id))
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.Child {
	return predicate.Child(sql.FieldIn(FieldID, ids...))
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.Child {
	return predicate.Child(sql.FieldNotIn(FieldID, ids...))
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.Child {
	return predicate.Child(sql.FieldGT(FieldID, id))
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.Child {
	return predicate.Child(sql.FieldGTE(FieldID, id))
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.Child {
	return predicate.Child(sql.FieldLT(FieldID, id))
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.Child {
	return predicate.Child(sql.FieldLTE(FieldID, id))
}

// Name applies equality check predicate on the "name" field. It's identical to NameEQ.
func Name(v string) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldName, v))
}

// Age applies equality check predicate on the "age" field. It's identical to AgeEQ.
func Age(v int) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldAge, v))
}

// CheckForMissingItems applies equality check predicate on the "check_for_missing_items" field. It's identical to CheckForMissingItemsEQ.
func CheckForMissingItems(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldCheckForMissingItems, v))
}

// HasBag applies equality check predicate on the "has_bag" field. It's identical to HasBagEQ.
func HasBag(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasBag, v))
}

// HasLunchBox applies equality check predicate on the "has_lunch_box" field. It's identical to HasLunchBoxEQ.
func HasLunchBox(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasLunchBox, v))
}

// HasWaterBottle applies equality check predicate on the "has_water_bottle" field. It's identical to HasWaterBottleEQ.
func HasWaterBottle(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasWaterBottle, v))
}

// HasUmbrella applies equality check predicate on the "has_umbrella" field. It's identical to HasUmbrellaEQ.
func HasUmbrella(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasUmbrella, v))
}

// HasOther applies equality check predicate on the "has_other" field. It's identical to HasOtherEQ.
func HasOther(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasOther, v))
}

// CreatedAt applies equality check predicate on the "created_at" field. It's identical to CreatedAtEQ.
func CreatedAt(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldCreatedAt, v))
}

// UpdatedAt applies equality check predicate on the "updated_at" field. It's identical to UpdatedAtEQ.
func UpdatedAt(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldUpdatedAt, v))
}

// NameEQ applies the EQ predicate on the "name" field.
func NameEQ(v string) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldName, v))
}

// NameNEQ applies the NEQ predicate on the "name" field.
func NameNEQ(v string) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldName, v))
}

// NameIn applies the In predicate on the "name" field.
func NameIn(vs ...string) predicate.Child {
	return predicate.Child(sql.FieldIn(FieldName, vs...))
}

// NameNotIn applies the NotIn predicate on the "name" field.
func NameNotIn(vs ...string) predicate.Child {
	return predicate.Child(sql.FieldNotIn(FieldName, vs...))
}

// NameGT applies the GT predicate on the "name" field.
func NameGT(v string) predicate.Child {
	return predicate.Child(sql.FieldGT(FieldName, v))
}

// NameGTE applies the GTE predicate on the "name" field.
func NameGTE(v string) predicate.Child {
	return predicate.Child(sql.FieldGTE(FieldName, v))
}

// NameLT applies the LT predicate on the "name" field.
func NameLT(v string) predicate.Child {
	return predicate.Child(sql.FieldLT(FieldName, v))
}

// NameLTE applies the LTE predicate on the "name" field.
func NameLTE(v string) predicate.Child {
	return predicate.Child(sql.FieldLTE(FieldName, v))
}

// NameContains applies the Contains predicate on the "name" field.
func NameContains(v string) predicate.Child {
	return predicate.Child(sql.FieldContains(FieldName, v))
}

// NameHasPrefix applies the HasPrefix predicate on the "name" field.
func NameHasPrefix(v string) predicate.Child {
	return predicate.Child(sql.FieldHasPrefix(FieldName, v))
}

// NameHasSuffix applies the HasSuffix predicate on the "name" field.
func NameHasSuffix(v string) predicate.Child {
	return predicate.Child(sql.FieldHasSuffix(FieldName, v))
}

// NameEqualFold applies the EqualFold predicate on the "name" field.
func NameEqualFold(v string) predicate.Child {
	return predicate.Child(sql.FieldEqualFold(FieldName, v))
}

// NameContainsFold applies the ContainsFold predicate on the "name" field.
func NameContainsFold(v string) predicate.Child {
	return predicate.Child(sql.FieldContainsFold(FieldName, v))
}

// AgeEQ applies the EQ predicate on the "age" field.
func AgeEQ(v int) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldAge, v))
}

// AgeNEQ applies the NEQ predicate on the "age" field.
func AgeNEQ(v int) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldAge, v))
}

// AgeIn applies the In predicate on the "age" field.
func AgeIn(vs ...int) predicate.Child {
	return predicate.Child(sql.FieldIn(FieldAge, vs...))
}

// AgeNotIn applies the NotIn predicate on the "age" field.
func AgeNotIn(vs ...int) predicate.Child {
	return predicate.Child(sql.FieldNotIn(FieldAge, vs...))
}

// AgeGT applies the GT predicate on the "age" field.
func AgeGT(v int) predicate.Child {
	return predicate.Child(sql.FieldGT(FieldAge, v))
}

// AgeGTE applies the GTE predicate on the "age" field.
func AgeGTE(v int) predicate.Child {
	return predicate.Child(sql.FieldGTE(FieldAge, v))
}

// AgeLT applies the LT predicate on the "age" field.
func AgeLT(v int) predicate.Child {
	return predicate.Child(sql.FieldLT(FieldAge, v))
}

// AgeLTE applies the LTE predicate on the "age" field.
func AgeLTE(v int) predicate.Child {
	return predicate.Child(sql.FieldLTE(FieldAge, v))
}

// SexEQ applies the EQ predicate on the "sex" field.
func SexEQ(v Sex) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldSex, v))
}

// SexNEQ applies the NEQ predicate on the "sex" field.
func SexNEQ(v Sex) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldSex, v))
}

// SexIn applies the In predicate on the "sex" field.
func SexIn(vs ...Sex) predicate.Child {
	return predicate.Child(sql.FieldIn(FieldSex, vs...))
}

// SexNotIn applies the NotIn predicate on the "sex" field.
func SexNotIn(vs ...Sex) predicate.Child {
	return predicate.Child(sql.FieldNotIn(FieldSex, vs...))
}

// CheckForMissingItemsEQ applies the EQ predicate on the "check_for_missing_items" field.
func CheckForMissingItemsEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldCheckForMissingItems, v))
}

// CheckForMissingItemsNEQ applies the NEQ predicate on the "check_for_missing_items" field.
func CheckForMissingItemsNEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldCheckForMissingItems, v))
}

// HasBagEQ applies the EQ predicate on the "has_bag" field.
func HasBagEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasBag, v))
}

// HasBagNEQ applies the NEQ predicate on the "has_bag" field.
func HasBagNEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldHasBag, v))
}

// HasLunchBoxEQ applies the EQ predicate on the "has_lunch_box" field.
func HasLunchBoxEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasLunchBox, v))
}

// HasLunchBoxNEQ applies the NEQ predicate on the "has_lunch_box" field.
func HasLunchBoxNEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldHasLunchBox, v))
}

// HasWaterBottleEQ applies the EQ predicate on the "has_water_bottle" field.
func HasWaterBottleEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasWaterBottle, v))
}

// HasWaterBottleNEQ applies the NEQ predicate on the "has_water_bottle" field.
func HasWaterBottleNEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldHasWaterBottle, v))
}

// HasUmbrellaEQ applies the EQ predicate on the "has_umbrella" field.
func HasUmbrellaEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasUmbrella, v))
}

// HasUmbrellaNEQ applies the NEQ predicate on the "has_umbrella" field.
func HasUmbrellaNEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldHasUmbrella, v))
}

// HasOtherEQ applies the EQ predicate on the "has_other" field.
func HasOtherEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldHasOther, v))
}

// HasOtherNEQ applies the NEQ predicate on the "has_other" field.
func HasOtherNEQ(v bool) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldHasOther, v))
}

// CreatedAtEQ applies the EQ predicate on the "created_at" field.
func CreatedAtEQ(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldCreatedAt, v))
}

// CreatedAtNEQ applies the NEQ predicate on the "created_at" field.
func CreatedAtNEQ(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldCreatedAt, v))
}

// CreatedAtIn applies the In predicate on the "created_at" field.
func CreatedAtIn(vs ...time.Time) predicate.Child {
	return predicate.Child(sql.FieldIn(FieldCreatedAt, vs...))
}

// CreatedAtNotIn applies the NotIn predicate on the "created_at" field.
func CreatedAtNotIn(vs ...time.Time) predicate.Child {
	return predicate.Child(sql.FieldNotIn(FieldCreatedAt, vs...))
}

// CreatedAtGT applies the GT predicate on the "created_at" field.
func CreatedAtGT(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldGT(FieldCreatedAt, v))
}

// CreatedAtGTE applies the GTE predicate on the "created_at" field.
func CreatedAtGTE(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldGTE(FieldCreatedAt, v))
}

// CreatedAtLT applies the LT predicate on the "created_at" field.
func CreatedAtLT(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldLT(FieldCreatedAt, v))
}

// CreatedAtLTE applies the LTE predicate on the "created_at" field.
func CreatedAtLTE(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldLTE(FieldCreatedAt, v))
}

// UpdatedAtEQ applies the EQ predicate on the "updated_at" field.
func UpdatedAtEQ(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldEQ(FieldUpdatedAt, v))
}

// UpdatedAtNEQ applies the NEQ predicate on the "updated_at" field.
func UpdatedAtNEQ(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldNEQ(FieldUpdatedAt, v))
}

// UpdatedAtIn applies the In predicate on the "updated_at" field.
func UpdatedAtIn(vs ...time.Time) predicate.Child {
	return predicate.Child(sql.FieldIn(FieldUpdatedAt, vs...))
}

// UpdatedAtNotIn applies the NotIn predicate on the "updated_at" field.
func UpdatedAtNotIn(vs ...time.Time) predicate.Child {
	return predicate.Child(sql.FieldNotIn(FieldUpdatedAt, vs...))
}

// UpdatedAtGT applies the GT predicate on the "updated_at" field.
func UpdatedAtGT(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldGT(FieldUpdatedAt, v))
}

// UpdatedAtGTE applies the GTE predicate on the "updated_at" field.
func UpdatedAtGTE(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldGTE(FieldUpdatedAt, v))
}

// UpdatedAtLT applies the LT predicate on the "updated_at" field.
func UpdatedAtLT(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldLT(FieldUpdatedAt, v))
}

// UpdatedAtLTE applies the LTE predicate on the "updated_at" field.
func UpdatedAtLTE(v time.Time) predicate.Child {
	return predicate.Child(sql.FieldLTE(FieldUpdatedAt, v))
}

// HasGuardian applies the HasEdge predicate on the "guardian" edge.
func HasGuardian() predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, GuardianTable, GuardianColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasGuardianWith applies the HasEdge predicate on the "guardian" edge with a given conditions (other predicates).
func HasGuardianWith(preds ...predicate.Guardian) predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := newGuardianStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasChildBusAssociations applies the HasEdge predicate on the "childBusAssociations" edge.
func HasChildBusAssociations() predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, ChildBusAssociationsTable, ChildBusAssociationsColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasChildBusAssociationsWith applies the HasEdge predicate on the "childBusAssociations" edge with a given conditions (other predicates).
func HasChildBusAssociationsWith(preds ...predicate.ChildBusAssociation) predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := newChildBusAssociationsStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasNursery applies the HasEdge predicate on the "nursery" edge.
func HasNursery() predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, NurseryTable, NurseryColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasNurseryWith applies the HasEdge predicate on the "nursery" edge with a given conditions (other predicates).
func HasNurseryWith(preds ...predicate.Nursery) predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := newNurseryStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasBoardingRecord applies the HasEdge predicate on the "boarding_record" edge.
func HasBoardingRecord() predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, BoardingRecordTable, BoardingRecordColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasBoardingRecordWith applies the HasEdge predicate on the "boarding_record" edge with a given conditions (other predicates).
func HasBoardingRecordWith(preds ...predicate.BoardingRecord) predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := newBoardingRecordStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasPhotos applies the HasEdge predicate on the "photos" edge.
func HasPhotos() predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, PhotosTable, PhotosColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasPhotosWith applies the HasEdge predicate on the "photos" edge with a given conditions (other predicates).
func HasPhotosWith(preds ...predicate.ChildPhoto) predicate.Child {
	return predicate.Child(func(s *sql.Selector) {
		step := newPhotosStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.Child) predicate.Child {
	return predicate.Child(sql.AndPredicates(predicates...))
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.Child) predicate.Child {
	return predicate.Child(sql.OrPredicates(predicates...))
}

// Not applies the not operator on the given predicate.
func Not(p predicate.Child) predicate.Child {
	return predicate.Child(sql.NotPredicates(p))
}
