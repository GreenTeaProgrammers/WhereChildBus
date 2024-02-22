package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// BusRoute holds the schema definition for the BusRoute entity.
type BusRoute struct {
	ent.Schema
}

// Fields of the BusRoute.
func (BusRoute) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).StorageKey("id").Unique(),
		field.Enum("bus_type").
			Values("morning", "evening").Comment("朝のバスか放課後のバスかを示す"),
	}
}

// Edges of the BusRoute.
func (BusRoute) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("bus", Bus.Type),
		edge.To("childBusAssociations", ChildBusAssociation.Type),
		edge.To("busRouteAssociations", BusRouteAssociation.Type),
	}
}
