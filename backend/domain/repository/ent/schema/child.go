package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// Child holds the schema definition for the Child entity.
type Child struct {
	ent.Schema
}

// Fields of the Child.
func (Child) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).StorageKey("id").Unique(),
		field.String("name"),
		field.Int("age"),
		field.Enum("sex").
			Values("man", "women", "other"),
		field.Time("created_at").Default(time.Now),
		field.Time("updated_at").Default(time.Now).UpdateDefault(time.Now),
	}
}

// Edges of the Child.
func (Child) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("guardian", Guardian.Type).
			Ref("children").
			Unique(),
		edge.To("nursery", Nursery.Type).
			Unique(),
	}
}
