// Code generated by ent, DO NOT EDIT.

package station

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldID, id))
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldID, id))
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.Station {
	return predicate.Station(sql.FieldNEQ(FieldID, id))
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.Station {
	return predicate.Station(sql.FieldIn(FieldID, ids...))
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.Station {
	return predicate.Station(sql.FieldNotIn(FieldID, ids...))
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.Station {
	return predicate.Station(sql.FieldGT(FieldID, id))
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.Station {
	return predicate.Station(sql.FieldGTE(FieldID, id))
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.Station {
	return predicate.Station(sql.FieldLT(FieldID, id))
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.Station {
	return predicate.Station(sql.FieldLTE(FieldID, id))
}

// Latitude applies equality check predicate on the "latitude" field. It's identical to LatitudeEQ.
func Latitude(v float64) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldLatitude, v))
}

// Longitude applies equality check predicate on the "longitude" field. It's identical to LongitudeEQ.
func Longitude(v float64) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldLongitude, v))
}

// MorningOrder applies equality check predicate on the "morning_order" field. It's identical to MorningOrderEQ.
func MorningOrder(v int) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldMorningOrder, v))
}

// EveningOrder applies equality check predicate on the "evening_order" field. It's identical to EveningOrderEQ.
func EveningOrder(v int) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldEveningOrder, v))
}

// CreatedAt applies equality check predicate on the "created_at" field. It's identical to CreatedAtEQ.
func CreatedAt(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldCreatedAt, v))
}

// UpdatedAt applies equality check predicate on the "updated_at" field. It's identical to UpdatedAtEQ.
func UpdatedAt(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldUpdatedAt, v))
}

// LatitudeEQ applies the EQ predicate on the "latitude" field.
func LatitudeEQ(v float64) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldLatitude, v))
}

// LatitudeNEQ applies the NEQ predicate on the "latitude" field.
func LatitudeNEQ(v float64) predicate.Station {
	return predicate.Station(sql.FieldNEQ(FieldLatitude, v))
}

// LatitudeIn applies the In predicate on the "latitude" field.
func LatitudeIn(vs ...float64) predicate.Station {
	return predicate.Station(sql.FieldIn(FieldLatitude, vs...))
}

// LatitudeNotIn applies the NotIn predicate on the "latitude" field.
func LatitudeNotIn(vs ...float64) predicate.Station {
	return predicate.Station(sql.FieldNotIn(FieldLatitude, vs...))
}

// LatitudeGT applies the GT predicate on the "latitude" field.
func LatitudeGT(v float64) predicate.Station {
	return predicate.Station(sql.FieldGT(FieldLatitude, v))
}

// LatitudeGTE applies the GTE predicate on the "latitude" field.
func LatitudeGTE(v float64) predicate.Station {
	return predicate.Station(sql.FieldGTE(FieldLatitude, v))
}

// LatitudeLT applies the LT predicate on the "latitude" field.
func LatitudeLT(v float64) predicate.Station {
	return predicate.Station(sql.FieldLT(FieldLatitude, v))
}

// LatitudeLTE applies the LTE predicate on the "latitude" field.
func LatitudeLTE(v float64) predicate.Station {
	return predicate.Station(sql.FieldLTE(FieldLatitude, v))
}

// LatitudeIsNil applies the IsNil predicate on the "latitude" field.
func LatitudeIsNil() predicate.Station {
	return predicate.Station(sql.FieldIsNull(FieldLatitude))
}

// LatitudeNotNil applies the NotNil predicate on the "latitude" field.
func LatitudeNotNil() predicate.Station {
	return predicate.Station(sql.FieldNotNull(FieldLatitude))
}

// LongitudeEQ applies the EQ predicate on the "longitude" field.
func LongitudeEQ(v float64) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldLongitude, v))
}

// LongitudeNEQ applies the NEQ predicate on the "longitude" field.
func LongitudeNEQ(v float64) predicate.Station {
	return predicate.Station(sql.FieldNEQ(FieldLongitude, v))
}

// LongitudeIn applies the In predicate on the "longitude" field.
func LongitudeIn(vs ...float64) predicate.Station {
	return predicate.Station(sql.FieldIn(FieldLongitude, vs...))
}

// LongitudeNotIn applies the NotIn predicate on the "longitude" field.
func LongitudeNotIn(vs ...float64) predicate.Station {
	return predicate.Station(sql.FieldNotIn(FieldLongitude, vs...))
}

// LongitudeGT applies the GT predicate on the "longitude" field.
func LongitudeGT(v float64) predicate.Station {
	return predicate.Station(sql.FieldGT(FieldLongitude, v))
}

// LongitudeGTE applies the GTE predicate on the "longitude" field.
func LongitudeGTE(v float64) predicate.Station {
	return predicate.Station(sql.FieldGTE(FieldLongitude, v))
}

// LongitudeLT applies the LT predicate on the "longitude" field.
func LongitudeLT(v float64) predicate.Station {
	return predicate.Station(sql.FieldLT(FieldLongitude, v))
}

// LongitudeLTE applies the LTE predicate on the "longitude" field.
func LongitudeLTE(v float64) predicate.Station {
	return predicate.Station(sql.FieldLTE(FieldLongitude, v))
}

// LongitudeIsNil applies the IsNil predicate on the "longitude" field.
func LongitudeIsNil() predicate.Station {
	return predicate.Station(sql.FieldIsNull(FieldLongitude))
}

// LongitudeNotNil applies the NotNil predicate on the "longitude" field.
func LongitudeNotNil() predicate.Station {
	return predicate.Station(sql.FieldNotNull(FieldLongitude))
}

// MorningOrderEQ applies the EQ predicate on the "morning_order" field.
func MorningOrderEQ(v int) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldMorningOrder, v))
}

// MorningOrderNEQ applies the NEQ predicate on the "morning_order" field.
func MorningOrderNEQ(v int) predicate.Station {
	return predicate.Station(sql.FieldNEQ(FieldMorningOrder, v))
}

// MorningOrderIn applies the In predicate on the "morning_order" field.
func MorningOrderIn(vs ...int) predicate.Station {
	return predicate.Station(sql.FieldIn(FieldMorningOrder, vs...))
}

// MorningOrderNotIn applies the NotIn predicate on the "morning_order" field.
func MorningOrderNotIn(vs ...int) predicate.Station {
	return predicate.Station(sql.FieldNotIn(FieldMorningOrder, vs...))
}

// MorningOrderGT applies the GT predicate on the "morning_order" field.
func MorningOrderGT(v int) predicate.Station {
	return predicate.Station(sql.FieldGT(FieldMorningOrder, v))
}

// MorningOrderGTE applies the GTE predicate on the "morning_order" field.
func MorningOrderGTE(v int) predicate.Station {
	return predicate.Station(sql.FieldGTE(FieldMorningOrder, v))
}

// MorningOrderLT applies the LT predicate on the "morning_order" field.
func MorningOrderLT(v int) predicate.Station {
	return predicate.Station(sql.FieldLT(FieldMorningOrder, v))
}

// MorningOrderLTE applies the LTE predicate on the "morning_order" field.
func MorningOrderLTE(v int) predicate.Station {
	return predicate.Station(sql.FieldLTE(FieldMorningOrder, v))
}

// EveningOrderEQ applies the EQ predicate on the "evening_order" field.
func EveningOrderEQ(v int) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldEveningOrder, v))
}

// EveningOrderNEQ applies the NEQ predicate on the "evening_order" field.
func EveningOrderNEQ(v int) predicate.Station {
	return predicate.Station(sql.FieldNEQ(FieldEveningOrder, v))
}

// EveningOrderIn applies the In predicate on the "evening_order" field.
func EveningOrderIn(vs ...int) predicate.Station {
	return predicate.Station(sql.FieldIn(FieldEveningOrder, vs...))
}

// EveningOrderNotIn applies the NotIn predicate on the "evening_order" field.
func EveningOrderNotIn(vs ...int) predicate.Station {
	return predicate.Station(sql.FieldNotIn(FieldEveningOrder, vs...))
}

// EveningOrderGT applies the GT predicate on the "evening_order" field.
func EveningOrderGT(v int) predicate.Station {
	return predicate.Station(sql.FieldGT(FieldEveningOrder, v))
}

// EveningOrderGTE applies the GTE predicate on the "evening_order" field.
func EveningOrderGTE(v int) predicate.Station {
	return predicate.Station(sql.FieldGTE(FieldEveningOrder, v))
}

// EveningOrderLT applies the LT predicate on the "evening_order" field.
func EveningOrderLT(v int) predicate.Station {
	return predicate.Station(sql.FieldLT(FieldEveningOrder, v))
}

// EveningOrderLTE applies the LTE predicate on the "evening_order" field.
func EveningOrderLTE(v int) predicate.Station {
	return predicate.Station(sql.FieldLTE(FieldEveningOrder, v))
}

// CreatedAtEQ applies the EQ predicate on the "created_at" field.
func CreatedAtEQ(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldCreatedAt, v))
}

// CreatedAtNEQ applies the NEQ predicate on the "created_at" field.
func CreatedAtNEQ(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldNEQ(FieldCreatedAt, v))
}

// CreatedAtIn applies the In predicate on the "created_at" field.
func CreatedAtIn(vs ...time.Time) predicate.Station {
	return predicate.Station(sql.FieldIn(FieldCreatedAt, vs...))
}

// CreatedAtNotIn applies the NotIn predicate on the "created_at" field.
func CreatedAtNotIn(vs ...time.Time) predicate.Station {
	return predicate.Station(sql.FieldNotIn(FieldCreatedAt, vs...))
}

// CreatedAtGT applies the GT predicate on the "created_at" field.
func CreatedAtGT(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldGT(FieldCreatedAt, v))
}

// CreatedAtGTE applies the GTE predicate on the "created_at" field.
func CreatedAtGTE(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldGTE(FieldCreatedAt, v))
}

// CreatedAtLT applies the LT predicate on the "created_at" field.
func CreatedAtLT(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldLT(FieldCreatedAt, v))
}

// CreatedAtLTE applies the LTE predicate on the "created_at" field.
func CreatedAtLTE(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldLTE(FieldCreatedAt, v))
}

// UpdatedAtEQ applies the EQ predicate on the "updated_at" field.
func UpdatedAtEQ(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldEQ(FieldUpdatedAt, v))
}

// UpdatedAtNEQ applies the NEQ predicate on the "updated_at" field.
func UpdatedAtNEQ(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldNEQ(FieldUpdatedAt, v))
}

// UpdatedAtIn applies the In predicate on the "updated_at" field.
func UpdatedAtIn(vs ...time.Time) predicate.Station {
	return predicate.Station(sql.FieldIn(FieldUpdatedAt, vs...))
}

// UpdatedAtNotIn applies the NotIn predicate on the "updated_at" field.
func UpdatedAtNotIn(vs ...time.Time) predicate.Station {
	return predicate.Station(sql.FieldNotIn(FieldUpdatedAt, vs...))
}

// UpdatedAtGT applies the GT predicate on the "updated_at" field.
func UpdatedAtGT(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldGT(FieldUpdatedAt, v))
}

// UpdatedAtGTE applies the GTE predicate on the "updated_at" field.
func UpdatedAtGTE(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldGTE(FieldUpdatedAt, v))
}

// UpdatedAtLT applies the LT predicate on the "updated_at" field.
func UpdatedAtLT(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldLT(FieldUpdatedAt, v))
}

// UpdatedAtLTE applies the LTE predicate on the "updated_at" field.
func UpdatedAtLTE(v time.Time) predicate.Station {
	return predicate.Station(sql.FieldLTE(FieldUpdatedAt, v))
}

// HasGuardian applies the HasEdge predicate on the "guardian" edge.
func HasGuardian() predicate.Station {
	return predicate.Station(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2O, true, GuardianTable, GuardianColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasGuardianWith applies the HasEdge predicate on the "guardian" edge with a given conditions (other predicates).
func HasGuardianWith(preds ...predicate.Guardian) predicate.Station {
	return predicate.Station(func(s *sql.Selector) {
		step := newGuardianStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasBus applies the HasEdge predicate on the "bus" edge.
func HasBus() predicate.Station {
	return predicate.Station(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.M2M, true, BusTable, BusPrimaryKey...),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasBusWith applies the HasEdge predicate on the "bus" edge with a given conditions (other predicates).
func HasBusWith(preds ...predicate.Bus) predicate.Station {
	return predicate.Station(func(s *sql.Selector) {
		step := newBusStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.Station) predicate.Station {
	return predicate.Station(sql.AndPredicates(predicates...))
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.Station) predicate.Station {
	return predicate.Station(sql.OrPredicates(predicates...))
}

// Not applies the not operator on the given predicate.
func Not(p predicate.Station) predicate.Station {
	return predicate.Station(sql.NotPredicates(p))
}