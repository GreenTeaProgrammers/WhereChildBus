package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// ChildPhoto holds the schema definition for the ChildPhoto entity.
type ChildPhoto struct {
	ent.Schema
}

// Fields of the ChildPhoto.
func (ChildPhoto) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).StorageKey("id").Unique(),
		field.Time("created_at").Default(time.Now).Comment("レコードの作成日時"),
		field.Time("updated_at").Default(time.Now).UpdateDefault(time.Now).Comment("レコードの最終更新日時"),
	}
}

// Edges of the ChildPhoto.
func (ChildPhoto) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("child", Child.Type).
			Ref("photos").
			Unique(),
	}
}
