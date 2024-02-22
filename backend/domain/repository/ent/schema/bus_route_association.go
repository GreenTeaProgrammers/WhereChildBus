package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// BusRouteAssociation holds the schema definition for the association between Bus and BusRoute.
type BusRouteAssociation struct {
	ent.Schema
}

// Fields of the BusRouteAssociation.
func (BusRouteAssociation) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("station_id", uuid.UUID{}),
		field.UUID("bus_route_id", uuid.UUID{}),
		field.Int32("order"),
	}
}

// Edges of the BusRouteAssociation.
func (BusRouteAssociation) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("station", Station.Type).
			Ref("busRouteAssociations").
			Unique().
			Required().
			Field("station_id"),
		edge.From("busRoute", BusRoute.Type).
			Ref("busRouteAssociations").
			Unique().
			Required().
			Field("bus_route_id"),
	}
}
