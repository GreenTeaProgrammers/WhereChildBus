package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// Bus holds the schema definition for the Bus entity.
type Bus struct {
	ent.Schema
}

// Fields of the Bus.
func (Bus) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).StorageKey("id").Unique(),
		field.String("name"),
		field.String("plate_number").Optional(),
		field.Time("created_at").Default(time.Now),
		field.Time("updated_at").Default(time.Now).UpdateDefault(time.Now),
	}
}

// Edges of the Bus.
func (Bus) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("nursery", Nursery.Type).
			Unique(),
		edge.To("guardians", Guardian.Type),
	}
}
