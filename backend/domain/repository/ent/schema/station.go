package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// Station holds the schema definition for the Station entity.
type Station struct {
	ent.Schema
}

// Fields of the Station.
func (Station) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).StorageKey("id").Unique(),
		field.Float("latitude").Optional().Default(0),
		field.Float("longitude").Optional().Default(0),
		field.Time("created_at").Default(time.Now),
		field.Time("updated_at").Default(time.Now).UpdateDefault(time.Now),
	}
}

// Edges of the Station.
func (Station) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("guardian", Guardian.Type).
			Ref("station").
			Unique(),
		// このステーションが「現在」の目的地であるバス
		edge.From("next_for_buses", Bus.Type).
			Ref("next_station"),
		edge.To("busRouteAssociations", BusRouteAssociation.Type),
	}
}
