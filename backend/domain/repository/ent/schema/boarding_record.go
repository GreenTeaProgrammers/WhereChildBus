package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// BoardingRecord holds the schema definition for the Bus entity.
type BoardingRecord struct {
	ent.Schema
}

// Fields of the BoardingRecord.
func (BoardingRecord) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).StorageKey("id").Unique(),
		field.Time("timestamp").Default(time.Now).Comment("乗降時刻"),
		field.Bool("is_boarding").Comment("乗車時はtrue、降車時はfalse")}
}

// Edges of the BoardingRecord.
func (BoardingRecord) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("child", Child.Type).
			Ref("boarding_record").
			Unique(),
		edge.From("bus", Bus.Type).
			Ref("boarding_records").
			Unique(),
	}
}
