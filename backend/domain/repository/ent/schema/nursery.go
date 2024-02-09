package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// Nursery holds the schema definition for the Nursery entity.

type Nursery struct {
	ent.Schema
}

// Fields of the Nursery.
func (Nursery) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).StorageKey("id").Unique(),
		field.String("name"),
		field.String("address"),
		field.String("phone_number").Optional(),
		field.String("email").Optional(),
		field.Time("created_at").Default(time.Now),
		field.Time("updated_at").Default(time.Now).UpdateDefault(time.Now),
	}
}

// Edges of the Nursery.
func (Nursery) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("children", Child.Type).
			Ref("nursery"),
		edge.From("guardians", Guardian.Type).
			Ref("nursery"),
		edge.From("buses", Bus.Type).
			Ref("nursery"),
	}
}
