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
		field.Float("latitude").Optional(),
		field.Float("longitude").Optional(),
		field.Int("morning_order").Comment("朝のバス停の順番"),
		field.Int("evening_order").Comment("帰りのバス停の順番"),
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
		edge.From("bus", Bus.Type).
			Ref("stations"),
	}
}
