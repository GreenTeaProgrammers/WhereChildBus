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
			Values("man", "woman", "other"),
		field.Bool("check_for_missing_items").Default(false).Comment("持ち物が欠けていないかをチェックするかどうか"),
		// ?: 持ち物エンティティを作成する?
		field.Bool("has_bag").Default(true),
		field.Bool("has_lunch_box").Default(true),
		field.Bool("has_water_bottle").Default(true),
		field.Bool("has_umbrella").Default(true),
		field.Bool("has_other").Default(true),
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
		edge.To("childBusAssociations", ChildBusAssociation.Type),
		edge.To("nursery", Nursery.Type).
			Unique(),
		edge.To("boarding_record", BoardingRecord.Type),
		edge.To("photos", ChildPhoto.Type),
	}
}
