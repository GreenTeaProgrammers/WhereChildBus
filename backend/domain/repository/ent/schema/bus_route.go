package schema

import (
	"time"

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
		field.Time("created_at").Default(time.Now()),
		field.Time("updated_at").Default(time.Now).UpdateDefault(time.Now),
	}
}

// Edges of the BusRoute.
func (BusRoute) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("bus", Bus.Type),
		edge.To("childBusAssociations", ChildBusAssociation.Type),
		edge.To("busRouteAssociations", BusRouteAssociation.Type),
		// このバスルートを朝の最新ルートとして参照するバス
		edge.From("morning_buses", Bus.Type).
			Ref("latest_morning_route"),
		// このバスルートを夕方の最新ルートとして参照するバス
		edge.From("evening_buses", Bus.Type).
			Ref("latest_evening_route"),
	}
}
