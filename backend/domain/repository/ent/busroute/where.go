// Code generated by ent, DO NOT EDIT.

package busroute

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldEQ(FieldID, id))
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldEQ(FieldID, id))
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldNEQ(FieldID, id))
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldIn(FieldID, ids...))
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldNotIn(FieldID, ids...))
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldGT(FieldID, id))
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldGTE(FieldID, id))
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldLT(FieldID, id))
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldLTE(FieldID, id))
}

// CreatedAt applies equality check predicate on the "created_at" field. It's identical to CreatedAtEQ.
func CreatedAt(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldEQ(FieldCreatedAt, v))
}

// UpdatedAt applies equality check predicate on the "updated_at" field. It's identical to UpdatedAtEQ.
func UpdatedAt(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldEQ(FieldUpdatedAt, v))
}

// BusTypeEQ applies the EQ predicate on the "bus_type" field.
func BusTypeEQ(v BusType) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldEQ(FieldBusType, v))
}

// BusTypeNEQ applies the NEQ predicate on the "bus_type" field.
func BusTypeNEQ(v BusType) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldNEQ(FieldBusType, v))
}

// BusTypeIn applies the In predicate on the "bus_type" field.
func BusTypeIn(vs ...BusType) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldIn(FieldBusType, vs...))
}

// BusTypeNotIn applies the NotIn predicate on the "bus_type" field.
func BusTypeNotIn(vs ...BusType) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldNotIn(FieldBusType, vs...))
}

// CreatedAtEQ applies the EQ predicate on the "created_at" field.
func CreatedAtEQ(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldEQ(FieldCreatedAt, v))
}

// CreatedAtNEQ applies the NEQ predicate on the "created_at" field.
func CreatedAtNEQ(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldNEQ(FieldCreatedAt, v))
}

// CreatedAtIn applies the In predicate on the "created_at" field.
func CreatedAtIn(vs ...time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldIn(FieldCreatedAt, vs...))
}

// CreatedAtNotIn applies the NotIn predicate on the "created_at" field.
func CreatedAtNotIn(vs ...time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldNotIn(FieldCreatedAt, vs...))
}

// CreatedAtGT applies the GT predicate on the "created_at" field.
func CreatedAtGT(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldGT(FieldCreatedAt, v))
}

// CreatedAtGTE applies the GTE predicate on the "created_at" field.
func CreatedAtGTE(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldGTE(FieldCreatedAt, v))
}

// CreatedAtLT applies the LT predicate on the "created_at" field.
func CreatedAtLT(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldLT(FieldCreatedAt, v))
}

// CreatedAtLTE applies the LTE predicate on the "created_at" field.
func CreatedAtLTE(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldLTE(FieldCreatedAt, v))
}

// UpdatedAtEQ applies the EQ predicate on the "updated_at" field.
func UpdatedAtEQ(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldEQ(FieldUpdatedAt, v))
}

// UpdatedAtNEQ applies the NEQ predicate on the "updated_at" field.
func UpdatedAtNEQ(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldNEQ(FieldUpdatedAt, v))
}

// UpdatedAtIn applies the In predicate on the "updated_at" field.
func UpdatedAtIn(vs ...time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldIn(FieldUpdatedAt, vs...))
}

// UpdatedAtNotIn applies the NotIn predicate on the "updated_at" field.
func UpdatedAtNotIn(vs ...time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldNotIn(FieldUpdatedAt, vs...))
}

// UpdatedAtGT applies the GT predicate on the "updated_at" field.
func UpdatedAtGT(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldGT(FieldUpdatedAt, v))
}

// UpdatedAtGTE applies the GTE predicate on the "updated_at" field.
func UpdatedAtGTE(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldGTE(FieldUpdatedAt, v))
}

// UpdatedAtLT applies the LT predicate on the "updated_at" field.
func UpdatedAtLT(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldLT(FieldUpdatedAt, v))
}

// UpdatedAtLTE applies the LTE predicate on the "updated_at" field.
func UpdatedAtLTE(v time.Time) predicate.BusRoute {
	return predicate.BusRoute(sql.FieldLTE(FieldUpdatedAt, v))
}

// HasBus applies the HasEdge predicate on the "bus" edge.
func HasBus() predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.M2M, false, BusTable, BusPrimaryKey...),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasBusWith applies the HasEdge predicate on the "bus" edge with a given conditions (other predicates).
func HasBusWith(preds ...predicate.Bus) predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := newBusStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasChildBusAssociations applies the HasEdge predicate on the "childBusAssociations" edge.
func HasChildBusAssociations() predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, ChildBusAssociationsTable, ChildBusAssociationsColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasChildBusAssociationsWith applies the HasEdge predicate on the "childBusAssociations" edge with a given conditions (other predicates).
func HasChildBusAssociationsWith(preds ...predicate.ChildBusAssociation) predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := newChildBusAssociationsStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasBusRouteAssociations applies the HasEdge predicate on the "busRouteAssociations" edge.
func HasBusRouteAssociations() predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, BusRouteAssociationsTable, BusRouteAssociationsColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasBusRouteAssociationsWith applies the HasEdge predicate on the "busRouteAssociations" edge with a given conditions (other predicates).
func HasBusRouteAssociationsWith(preds ...predicate.BusRouteAssociation) predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := newBusRouteAssociationsStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasMorningBuses applies the HasEdge predicate on the "morning_buses" edge.
func HasMorningBuses() predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, true, MorningBusesTable, MorningBusesColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasMorningBusesWith applies the HasEdge predicate on the "morning_buses" edge with a given conditions (other predicates).
func HasMorningBusesWith(preds ...predicate.Bus) predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := newMorningBusesStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasEveningBuses applies the HasEdge predicate on the "evening_buses" edge.
func HasEveningBuses() predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, true, EveningBusesTable, EveningBusesColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasEveningBusesWith applies the HasEdge predicate on the "evening_buses" edge with a given conditions (other predicates).
func HasEveningBusesWith(preds ...predicate.Bus) predicate.BusRoute {
	return predicate.BusRoute(func(s *sql.Selector) {
		step := newEveningBusesStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.BusRoute) predicate.BusRoute {
	return predicate.BusRoute(sql.AndPredicates(predicates...))
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.BusRoute) predicate.BusRoute {
	return predicate.BusRoute(sql.OrPredicates(predicates...))
}

// Not applies the not operator on the given predicate.
func Not(p predicate.BusRoute) predicate.BusRoute {
	return predicate.BusRoute(sql.NotPredicates(p))
}