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
		field.Float("latitude").Optional().Comment("現在の緯度"),
		field.Float("longitude").Optional().Comment("現在の経度"),
		field.Enum("status").Default("stopped").Comment("バスのステータス（運行中、停止中など）").
			Values("stopped", "running", "maintenance"),
		field.String("morning_first_station_id"),
		field.String("evening_first_station_id"),
		field.Bool("enable_face_recognition").Default(false).Comment("顔識別が有効かどうか"),
		field.UUID("next_station_id", uuid.UUID{}).Optional().Comment("次のステーションのID"),
		field.Time("created_at").Default(time.Now),
		field.Time("updated_at").Default(time.Now).UpdateDefault(time.Now),
	}
}

// Edges of the Bus.
func (Bus) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("nursery", Nursery.Type).Unique(),
		edge.To("stations", Station.Type),
		edge.To("boarding_records", BoardingRecord.Type),
		edge.To("childBusAssociations", ChildBusAssociation.Type),
	}
}
