// Code generated by ent, DO NOT EDIT.

package guardian

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldID, id))
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldID, id))
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.Guardian {
	return predicate.Guardian(sql.FieldNEQ(FieldID, id))
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.Guardian {
	return predicate.Guardian(sql.FieldIn(FieldID, ids...))
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.Guardian {
	return predicate.Guardian(sql.FieldNotIn(FieldID, ids...))
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.Guardian {
	return predicate.Guardian(sql.FieldGT(FieldID, id))
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.Guardian {
	return predicate.Guardian(sql.FieldGTE(FieldID, id))
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.Guardian {
	return predicate.Guardian(sql.FieldLT(FieldID, id))
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.Guardian {
	return predicate.Guardian(sql.FieldLTE(FieldID, id))
}

// Email applies equality check predicate on the "email" field. It's identical to EmailEQ.
func Email(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldEmail, v))
}

// EncryptedPassword applies equality check predicate on the "encrypted_password" field. It's identical to EncryptedPasswordEQ.
func EncryptedPassword(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldEncryptedPassword, v))
}

// Name applies equality check predicate on the "name" field. It's identical to NameEQ.
func Name(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldName, v))
}

// Phone applies equality check predicate on the "phone" field. It's identical to PhoneEQ.
func Phone(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldPhone, v))
}

// CreatedAt applies equality check predicate on the "created_at" field. It's identical to CreatedAtEQ.
func CreatedAt(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldCreatedAt, v))
}

// UpdatedAt applies equality check predicate on the "updated_at" field. It's identical to UpdatedAtEQ.
func UpdatedAt(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldUpdatedAt, v))
}

// EmailEQ applies the EQ predicate on the "email" field.
func EmailEQ(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldEmail, v))
}

// EmailNEQ applies the NEQ predicate on the "email" field.
func EmailNEQ(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldNEQ(FieldEmail, v))
}

// EmailIn applies the In predicate on the "email" field.
func EmailIn(vs ...string) predicate.Guardian {
	return predicate.Guardian(sql.FieldIn(FieldEmail, vs...))
}

// EmailNotIn applies the NotIn predicate on the "email" field.
func EmailNotIn(vs ...string) predicate.Guardian {
	return predicate.Guardian(sql.FieldNotIn(FieldEmail, vs...))
}

// EmailGT applies the GT predicate on the "email" field.
func EmailGT(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldGT(FieldEmail, v))
}

// EmailGTE applies the GTE predicate on the "email" field.
func EmailGTE(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldGTE(FieldEmail, v))
}

// EmailLT applies the LT predicate on the "email" field.
func EmailLT(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldLT(FieldEmail, v))
}

// EmailLTE applies the LTE predicate on the "email" field.
func EmailLTE(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldLTE(FieldEmail, v))
}

// EmailContains applies the Contains predicate on the "email" field.
func EmailContains(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldContains(FieldEmail, v))
}

// EmailHasPrefix applies the HasPrefix predicate on the "email" field.
func EmailHasPrefix(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldHasPrefix(FieldEmail, v))
}

// EmailHasSuffix applies the HasSuffix predicate on the "email" field.
func EmailHasSuffix(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldHasSuffix(FieldEmail, v))
}

// EmailEqualFold applies the EqualFold predicate on the "email" field.
func EmailEqualFold(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEqualFold(FieldEmail, v))
}

// EmailContainsFold applies the ContainsFold predicate on the "email" field.
func EmailContainsFold(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldContainsFold(FieldEmail, v))
}

// EncryptedPasswordEQ applies the EQ predicate on the "encrypted_password" field.
func EncryptedPasswordEQ(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldEncryptedPassword, v))
}

// EncryptedPasswordNEQ applies the NEQ predicate on the "encrypted_password" field.
func EncryptedPasswordNEQ(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldNEQ(FieldEncryptedPassword, v))
}

// EncryptedPasswordIn applies the In predicate on the "encrypted_password" field.
func EncryptedPasswordIn(vs ...string) predicate.Guardian {
	return predicate.Guardian(sql.FieldIn(FieldEncryptedPassword, vs...))
}

// EncryptedPasswordNotIn applies the NotIn predicate on the "encrypted_password" field.
func EncryptedPasswordNotIn(vs ...string) predicate.Guardian {
	return predicate.Guardian(sql.FieldNotIn(FieldEncryptedPassword, vs...))
}

// EncryptedPasswordGT applies the GT predicate on the "encrypted_password" field.
func EncryptedPasswordGT(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldGT(FieldEncryptedPassword, v))
}

// EncryptedPasswordGTE applies the GTE predicate on the "encrypted_password" field.
func EncryptedPasswordGTE(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldGTE(FieldEncryptedPassword, v))
}

// EncryptedPasswordLT applies the LT predicate on the "encrypted_password" field.
func EncryptedPasswordLT(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldLT(FieldEncryptedPassword, v))
}

// EncryptedPasswordLTE applies the LTE predicate on the "encrypted_password" field.
func EncryptedPasswordLTE(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldLTE(FieldEncryptedPassword, v))
}

// EncryptedPasswordContains applies the Contains predicate on the "encrypted_password" field.
func EncryptedPasswordContains(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldContains(FieldEncryptedPassword, v))
}

// EncryptedPasswordHasPrefix applies the HasPrefix predicate on the "encrypted_password" field.
func EncryptedPasswordHasPrefix(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldHasPrefix(FieldEncryptedPassword, v))
}

// EncryptedPasswordHasSuffix applies the HasSuffix predicate on the "encrypted_password" field.
func EncryptedPasswordHasSuffix(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldHasSuffix(FieldEncryptedPassword, v))
}

// EncryptedPasswordEqualFold applies the EqualFold predicate on the "encrypted_password" field.
func EncryptedPasswordEqualFold(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEqualFold(FieldEncryptedPassword, v))
}

// EncryptedPasswordContainsFold applies the ContainsFold predicate on the "encrypted_password" field.
func EncryptedPasswordContainsFold(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldContainsFold(FieldEncryptedPassword, v))
}

// NameEQ applies the EQ predicate on the "name" field.
func NameEQ(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldName, v))
}

// NameNEQ applies the NEQ predicate on the "name" field.
func NameNEQ(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldNEQ(FieldName, v))
}

// NameIn applies the In predicate on the "name" field.
func NameIn(vs ...string) predicate.Guardian {
	return predicate.Guardian(sql.FieldIn(FieldName, vs...))
}

// NameNotIn applies the NotIn predicate on the "name" field.
func NameNotIn(vs ...string) predicate.Guardian {
	return predicate.Guardian(sql.FieldNotIn(FieldName, vs...))
}

// NameGT applies the GT predicate on the "name" field.
func NameGT(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldGT(FieldName, v))
}

// NameGTE applies the GTE predicate on the "name" field.
func NameGTE(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldGTE(FieldName, v))
}

// NameLT applies the LT predicate on the "name" field.
func NameLT(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldLT(FieldName, v))
}

// NameLTE applies the LTE predicate on the "name" field.
func NameLTE(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldLTE(FieldName, v))
}

// NameContains applies the Contains predicate on the "name" field.
func NameContains(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldContains(FieldName, v))
}

// NameHasPrefix applies the HasPrefix predicate on the "name" field.
func NameHasPrefix(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldHasPrefix(FieldName, v))
}

// NameHasSuffix applies the HasSuffix predicate on the "name" field.
func NameHasSuffix(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldHasSuffix(FieldName, v))
}

// NameEqualFold applies the EqualFold predicate on the "name" field.
func NameEqualFold(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEqualFold(FieldName, v))
}

// NameContainsFold applies the ContainsFold predicate on the "name" field.
func NameContainsFold(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldContainsFold(FieldName, v))
}

// PhoneEQ applies the EQ predicate on the "phone" field.
func PhoneEQ(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldPhone, v))
}

// PhoneNEQ applies the NEQ predicate on the "phone" field.
func PhoneNEQ(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldNEQ(FieldPhone, v))
}

// PhoneIn applies the In predicate on the "phone" field.
func PhoneIn(vs ...string) predicate.Guardian {
	return predicate.Guardian(sql.FieldIn(FieldPhone, vs...))
}

// PhoneNotIn applies the NotIn predicate on the "phone" field.
func PhoneNotIn(vs ...string) predicate.Guardian {
	return predicate.Guardian(sql.FieldNotIn(FieldPhone, vs...))
}

// PhoneGT applies the GT predicate on the "phone" field.
func PhoneGT(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldGT(FieldPhone, v))
}

// PhoneGTE applies the GTE predicate on the "phone" field.
func PhoneGTE(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldGTE(FieldPhone, v))
}

// PhoneLT applies the LT predicate on the "phone" field.
func PhoneLT(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldLT(FieldPhone, v))
}

// PhoneLTE applies the LTE predicate on the "phone" field.
func PhoneLTE(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldLTE(FieldPhone, v))
}

// PhoneContains applies the Contains predicate on the "phone" field.
func PhoneContains(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldContains(FieldPhone, v))
}

// PhoneHasPrefix applies the HasPrefix predicate on the "phone" field.
func PhoneHasPrefix(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldHasPrefix(FieldPhone, v))
}

// PhoneHasSuffix applies the HasSuffix predicate on the "phone" field.
func PhoneHasSuffix(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldHasSuffix(FieldPhone, v))
}

// PhoneIsNil applies the IsNil predicate on the "phone" field.
func PhoneIsNil() predicate.Guardian {
	return predicate.Guardian(sql.FieldIsNull(FieldPhone))
}

// PhoneNotNil applies the NotNil predicate on the "phone" field.
func PhoneNotNil() predicate.Guardian {
	return predicate.Guardian(sql.FieldNotNull(FieldPhone))
}

// PhoneEqualFold applies the EqualFold predicate on the "phone" field.
func PhoneEqualFold(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldEqualFold(FieldPhone, v))
}

// PhoneContainsFold applies the ContainsFold predicate on the "phone" field.
func PhoneContainsFold(v string) predicate.Guardian {
	return predicate.Guardian(sql.FieldContainsFold(FieldPhone, v))
}

// CreatedAtEQ applies the EQ predicate on the "created_at" field.
func CreatedAtEQ(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldCreatedAt, v))
}

// CreatedAtNEQ applies the NEQ predicate on the "created_at" field.
func CreatedAtNEQ(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldNEQ(FieldCreatedAt, v))
}

// CreatedAtIn applies the In predicate on the "created_at" field.
func CreatedAtIn(vs ...time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldIn(FieldCreatedAt, vs...))
}

// CreatedAtNotIn applies the NotIn predicate on the "created_at" field.
func CreatedAtNotIn(vs ...time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldNotIn(FieldCreatedAt, vs...))
}

// CreatedAtGT applies the GT predicate on the "created_at" field.
func CreatedAtGT(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldGT(FieldCreatedAt, v))
}

// CreatedAtGTE applies the GTE predicate on the "created_at" field.
func CreatedAtGTE(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldGTE(FieldCreatedAt, v))
}

// CreatedAtLT applies the LT predicate on the "created_at" field.
func CreatedAtLT(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldLT(FieldCreatedAt, v))
}

// CreatedAtLTE applies the LTE predicate on the "created_at" field.
func CreatedAtLTE(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldLTE(FieldCreatedAt, v))
}

// UpdatedAtEQ applies the EQ predicate on the "updated_at" field.
func UpdatedAtEQ(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldEQ(FieldUpdatedAt, v))
}

// UpdatedAtNEQ applies the NEQ predicate on the "updated_at" field.
func UpdatedAtNEQ(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldNEQ(FieldUpdatedAt, v))
}

// UpdatedAtIn applies the In predicate on the "updated_at" field.
func UpdatedAtIn(vs ...time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldIn(FieldUpdatedAt, vs...))
}

// UpdatedAtNotIn applies the NotIn predicate on the "updated_at" field.
func UpdatedAtNotIn(vs ...time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldNotIn(FieldUpdatedAt, vs...))
}

// UpdatedAtGT applies the GT predicate on the "updated_at" field.
func UpdatedAtGT(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldGT(FieldUpdatedAt, v))
}

// UpdatedAtGTE applies the GTE predicate on the "updated_at" field.
func UpdatedAtGTE(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldGTE(FieldUpdatedAt, v))
}

// UpdatedAtLT applies the LT predicate on the "updated_at" field.
func UpdatedAtLT(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldLT(FieldUpdatedAt, v))
}

// UpdatedAtLTE applies the LTE predicate on the "updated_at" field.
func UpdatedAtLTE(v time.Time) predicate.Guardian {
	return predicate.Guardian(sql.FieldLTE(FieldUpdatedAt, v))
}

// HasChildren applies the HasEdge predicate on the "children" edge.
func HasChildren() predicate.Guardian {
	return predicate.Guardian(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, ChildrenTable, ChildrenColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasChildrenWith applies the HasEdge predicate on the "children" edge with a given conditions (other predicates).
func HasChildrenWith(preds ...predicate.Child) predicate.Guardian {
	return predicate.Guardian(func(s *sql.Selector) {
		step := newChildrenStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasNursery applies the HasEdge predicate on the "nursery" edge.
func HasNursery() predicate.Guardian {
	return predicate.Guardian(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, NurseryTable, NurseryColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasNurseryWith applies the HasEdge predicate on the "nursery" edge with a given conditions (other predicates).
func HasNurseryWith(preds ...predicate.Nursery) predicate.Guardian {
	return predicate.Guardian(func(s *sql.Selector) {
		step := newNurseryStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasStation applies the HasEdge predicate on the "station" edge.
func HasStation() predicate.Guardian {
	return predicate.Guardian(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2O, false, StationTable, StationColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasStationWith applies the HasEdge predicate on the "station" edge with a given conditions (other predicates).
func HasStationWith(preds ...predicate.Station) predicate.Guardian {
	return predicate.Guardian(func(s *sql.Selector) {
		step := newStationStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.Guardian) predicate.Guardian {
	return predicate.Guardian(sql.AndPredicates(predicates...))
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.Guardian) predicate.Guardian {
	return predicate.Guardian(sql.OrPredicates(predicates...))
}

// Not applies the not operator on the given predicate.
func Not(p predicate.Guardian) predicate.Guardian {
	return predicate.Guardian(sql.NotPredicates(p))
}
