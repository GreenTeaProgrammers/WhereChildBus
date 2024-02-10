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
		// TODO: s3周りのfieldを要件等
		field.String("s3_bucket").Comment("AWS S3のバケット名"),
		field.String("s3_key").Comment("S3内の画像ファイルのキー（ファイルパス含む）"),
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
