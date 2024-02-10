package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// ChildBusAssociation holds the schema definition for the association between Child and Bus.

type ChildBusAssociation struct {
	ent.Schema
}

// Fields of the ChildBusAssociation.
func (ChildBusAssociation) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("child_id", uuid.UUID{}),
		field.UUID("bus_id", uuid.UUID{}),
		field.Enum("bus_type").
			Values("morning", "evening").Comment("朝のバスか放課後のバスかを示す"),
	}
}

// Edges of the ChildBusAssociation.
func (ChildBusAssociation) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("child", Child.Type).
			Ref("childBusAssociations"). // Childエンティティ側の参照名を合わせる
			Unique().                    // 一つのChildBusAssociationは一人の子供に紐づく
			Required().                  // 必ずChildBusAssociationが存在する
			Field("child_id"),
		edge.From("bus", Bus.Type).
			Ref("childBusAssociations"). // Busエンティティ側の参照名を合わせる
			Unique().                    // 一つのChildBusAssociationは一台のバスに紐づく
			Required().                  // 必ずChildBusAssociationが存在する
			Field("bus_id"),
	}
}
