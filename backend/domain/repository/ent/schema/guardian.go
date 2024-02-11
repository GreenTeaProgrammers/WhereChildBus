package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// Guardian holds the schema definition for the Guardian entity.
type Guardian struct {
	ent.Schema
}

// Fields of the Guardian.
func (Guardian) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).StorageKey("id").Unique(),
		field.String("email"),
		field.String("encrypted_password"),
		field.String("name"),
		field.String("phone").Optional(),
		field.Time("created_at").Default(time.Now),
		field.Time("updated_at").Default(time.Now).UpdateDefault(time.Now),
	}
}

// Edges of the Guardian.
func (Guardian) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("children", Child.Type),
		edge.To("nursery", Nursery.Type).
			Unique(),
		edge.To("station", Station.Type).
			Unique(),
	}
}
