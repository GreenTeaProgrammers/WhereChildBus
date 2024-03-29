// Code generated by ent, DO NOT EDIT.

package boardingrecord

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldEQ(FieldID, id))
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldEQ(FieldID, id))
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldNEQ(FieldID, id))
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldIn(FieldID, ids...))
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldNotIn(FieldID, ids...))
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldGT(FieldID, id))
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldGTE(FieldID, id))
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldLT(FieldID, id))
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldLTE(FieldID, id))
}

// Timestamp applies equality check predicate on the "timestamp" field. It's identical to TimestampEQ.
func Timestamp(v time.Time) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldEQ(FieldTimestamp, v))
}

// IsBoarding applies equality check predicate on the "is_boarding" field. It's identical to IsBoardingEQ.
func IsBoarding(v bool) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldEQ(FieldIsBoarding, v))
}

// TimestampEQ applies the EQ predicate on the "timestamp" field.
func TimestampEQ(v time.Time) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldEQ(FieldTimestamp, v))
}

// TimestampNEQ applies the NEQ predicate on the "timestamp" field.
func TimestampNEQ(v time.Time) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldNEQ(FieldTimestamp, v))
}

// TimestampIn applies the In predicate on the "timestamp" field.
func TimestampIn(vs ...time.Time) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldIn(FieldTimestamp, vs...))
}

// TimestampNotIn applies the NotIn predicate on the "timestamp" field.
func TimestampNotIn(vs ...time.Time) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldNotIn(FieldTimestamp, vs...))
}

// TimestampGT applies the GT predicate on the "timestamp" field.
func TimestampGT(v time.Time) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldGT(FieldTimestamp, v))
}

// TimestampGTE applies the GTE predicate on the "timestamp" field.
func TimestampGTE(v time.Time) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldGTE(FieldTimestamp, v))
}

// TimestampLT applies the LT predicate on the "timestamp" field.
func TimestampLT(v time.Time) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldLT(FieldTimestamp, v))
}

// TimestampLTE applies the LTE predicate on the "timestamp" field.
func TimestampLTE(v time.Time) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldLTE(FieldTimestamp, v))
}

// IsBoardingEQ applies the EQ predicate on the "is_boarding" field.
func IsBoardingEQ(v bool) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldEQ(FieldIsBoarding, v))
}

// IsBoardingNEQ applies the NEQ predicate on the "is_boarding" field.
func IsBoardingNEQ(v bool) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.FieldNEQ(FieldIsBoarding, v))
}

// HasChild applies the HasEdge predicate on the "child" edge.
func HasChild() predicate.BoardingRecord {
	return predicate.BoardingRecord(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, ChildTable, ChildColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasChildWith applies the HasEdge predicate on the "child" edge with a given conditions (other predicates).
func HasChildWith(preds ...predicate.Child) predicate.BoardingRecord {
	return predicate.BoardingRecord(func(s *sql.Selector) {
		step := newChildStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasBus applies the HasEdge predicate on the "bus" edge.
func HasBus() predicate.BoardingRecord {
	return predicate.BoardingRecord(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, BusTable, BusColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasBusWith applies the HasEdge predicate on the "bus" edge with a given conditions (other predicates).
func HasBusWith(preds ...predicate.Bus) predicate.BoardingRecord {
	return predicate.BoardingRecord(func(s *sql.Selector) {
		step := newBusStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.BoardingRecord) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.AndPredicates(predicates...))
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.BoardingRecord) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.OrPredicates(predicates...))
}

// Not applies the not operator on the given predicate.
func Not(p predicate.BoardingRecord) predicate.BoardingRecord {
	return predicate.BoardingRecord(sql.NotPredicates(p))
}
