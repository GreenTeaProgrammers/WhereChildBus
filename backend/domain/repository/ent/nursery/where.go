// Code generated by ent, DO NOT EDIT.

package nursery

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldID, id))
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldID, id))
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.Nursery {
	return predicate.Nursery(sql.FieldNEQ(FieldID, id))
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.Nursery {
	return predicate.Nursery(sql.FieldIn(FieldID, ids...))
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.Nursery {
	return predicate.Nursery(sql.FieldNotIn(FieldID, ids...))
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.Nursery {
	return predicate.Nursery(sql.FieldGT(FieldID, id))
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.Nursery {
	return predicate.Nursery(sql.FieldGTE(FieldID, id))
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.Nursery {
	return predicate.Nursery(sql.FieldLT(FieldID, id))
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.Nursery {
	return predicate.Nursery(sql.FieldLTE(FieldID, id))
}

// NurseryCode applies equality check predicate on the "nursery_code" field. It's identical to NurseryCodeEQ.
func NurseryCode(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldNurseryCode, v))
}

// Name applies equality check predicate on the "name" field. It's identical to NameEQ.
func Name(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldName, v))
}

// Address applies equality check predicate on the "address" field. It's identical to AddressEQ.
func Address(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldAddress, v))
}

// PhoneNumber applies equality check predicate on the "phone_number" field. It's identical to PhoneNumberEQ.
func PhoneNumber(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldPhoneNumber, v))
}

// Email applies equality check predicate on the "email" field. It's identical to EmailEQ.
func Email(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldEmail, v))
}

// CreatedAt applies equality check predicate on the "created_at" field. It's identical to CreatedAtEQ.
func CreatedAt(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldCreatedAt, v))
}

// UpdatedAt applies equality check predicate on the "updated_at" field. It's identical to UpdatedAtEQ.
func UpdatedAt(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldUpdatedAt, v))
}

// NurseryCodeEQ applies the EQ predicate on the "nursery_code" field.
func NurseryCodeEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldNurseryCode, v))
}

// NurseryCodeNEQ applies the NEQ predicate on the "nursery_code" field.
func NurseryCodeNEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNEQ(FieldNurseryCode, v))
}

// NurseryCodeIn applies the In predicate on the "nursery_code" field.
func NurseryCodeIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldIn(FieldNurseryCode, vs...))
}

// NurseryCodeNotIn applies the NotIn predicate on the "nursery_code" field.
func NurseryCodeNotIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNotIn(FieldNurseryCode, vs...))
}

// NurseryCodeGT applies the GT predicate on the "nursery_code" field.
func NurseryCodeGT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGT(FieldNurseryCode, v))
}

// NurseryCodeGTE applies the GTE predicate on the "nursery_code" field.
func NurseryCodeGTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGTE(FieldNurseryCode, v))
}

// NurseryCodeLT applies the LT predicate on the "nursery_code" field.
func NurseryCodeLT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLT(FieldNurseryCode, v))
}

// NurseryCodeLTE applies the LTE predicate on the "nursery_code" field.
func NurseryCodeLTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLTE(FieldNurseryCode, v))
}

// NurseryCodeContains applies the Contains predicate on the "nursery_code" field.
func NurseryCodeContains(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContains(FieldNurseryCode, v))
}

// NurseryCodeHasPrefix applies the HasPrefix predicate on the "nursery_code" field.
func NurseryCodeHasPrefix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasPrefix(FieldNurseryCode, v))
}

// NurseryCodeHasSuffix applies the HasSuffix predicate on the "nursery_code" field.
func NurseryCodeHasSuffix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasSuffix(FieldNurseryCode, v))
}

// NurseryCodeEqualFold applies the EqualFold predicate on the "nursery_code" field.
func NurseryCodeEqualFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEqualFold(FieldNurseryCode, v))
}

// NurseryCodeContainsFold applies the ContainsFold predicate on the "nursery_code" field.
func NurseryCodeContainsFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContainsFold(FieldNurseryCode, v))
}

// NameEQ applies the EQ predicate on the "name" field.
func NameEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldName, v))
}

// NameNEQ applies the NEQ predicate on the "name" field.
func NameNEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNEQ(FieldName, v))
}

// NameIn applies the In predicate on the "name" field.
func NameIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldIn(FieldName, vs...))
}

// NameNotIn applies the NotIn predicate on the "name" field.
func NameNotIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNotIn(FieldName, vs...))
}

// NameGT applies the GT predicate on the "name" field.
func NameGT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGT(FieldName, v))
}

// NameGTE applies the GTE predicate on the "name" field.
func NameGTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGTE(FieldName, v))
}

// NameLT applies the LT predicate on the "name" field.
func NameLT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLT(FieldName, v))
}

// NameLTE applies the LTE predicate on the "name" field.
func NameLTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLTE(FieldName, v))
}

// NameContains applies the Contains predicate on the "name" field.
func NameContains(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContains(FieldName, v))
}

// NameHasPrefix applies the HasPrefix predicate on the "name" field.
func NameHasPrefix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasPrefix(FieldName, v))
}

// NameHasSuffix applies the HasSuffix predicate on the "name" field.
func NameHasSuffix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasSuffix(FieldName, v))
}

// NameEqualFold applies the EqualFold predicate on the "name" field.
func NameEqualFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEqualFold(FieldName, v))
}

// NameContainsFold applies the ContainsFold predicate on the "name" field.
func NameContainsFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContainsFold(FieldName, v))
}

// AddressEQ applies the EQ predicate on the "address" field.
func AddressEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldAddress, v))
}

// AddressNEQ applies the NEQ predicate on the "address" field.
func AddressNEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNEQ(FieldAddress, v))
}

// AddressIn applies the In predicate on the "address" field.
func AddressIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldIn(FieldAddress, vs...))
}

// AddressNotIn applies the NotIn predicate on the "address" field.
func AddressNotIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNotIn(FieldAddress, vs...))
}

// AddressGT applies the GT predicate on the "address" field.
func AddressGT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGT(FieldAddress, v))
}

// AddressGTE applies the GTE predicate on the "address" field.
func AddressGTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGTE(FieldAddress, v))
}

// AddressLT applies the LT predicate on the "address" field.
func AddressLT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLT(FieldAddress, v))
}

// AddressLTE applies the LTE predicate on the "address" field.
func AddressLTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLTE(FieldAddress, v))
}

// AddressContains applies the Contains predicate on the "address" field.
func AddressContains(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContains(FieldAddress, v))
}

// AddressHasPrefix applies the HasPrefix predicate on the "address" field.
func AddressHasPrefix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasPrefix(FieldAddress, v))
}

// AddressHasSuffix applies the HasSuffix predicate on the "address" field.
func AddressHasSuffix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasSuffix(FieldAddress, v))
}

// AddressEqualFold applies the EqualFold predicate on the "address" field.
func AddressEqualFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEqualFold(FieldAddress, v))
}

// AddressContainsFold applies the ContainsFold predicate on the "address" field.
func AddressContainsFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContainsFold(FieldAddress, v))
}

// PhoneNumberEQ applies the EQ predicate on the "phone_number" field.
func PhoneNumberEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldPhoneNumber, v))
}

// PhoneNumberNEQ applies the NEQ predicate on the "phone_number" field.
func PhoneNumberNEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNEQ(FieldPhoneNumber, v))
}

// PhoneNumberIn applies the In predicate on the "phone_number" field.
func PhoneNumberIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldIn(FieldPhoneNumber, vs...))
}

// PhoneNumberNotIn applies the NotIn predicate on the "phone_number" field.
func PhoneNumberNotIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNotIn(FieldPhoneNumber, vs...))
}

// PhoneNumberGT applies the GT predicate on the "phone_number" field.
func PhoneNumberGT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGT(FieldPhoneNumber, v))
}

// PhoneNumberGTE applies the GTE predicate on the "phone_number" field.
func PhoneNumberGTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGTE(FieldPhoneNumber, v))
}

// PhoneNumberLT applies the LT predicate on the "phone_number" field.
func PhoneNumberLT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLT(FieldPhoneNumber, v))
}

// PhoneNumberLTE applies the LTE predicate on the "phone_number" field.
func PhoneNumberLTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLTE(FieldPhoneNumber, v))
}

// PhoneNumberContains applies the Contains predicate on the "phone_number" field.
func PhoneNumberContains(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContains(FieldPhoneNumber, v))
}

// PhoneNumberHasPrefix applies the HasPrefix predicate on the "phone_number" field.
func PhoneNumberHasPrefix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasPrefix(FieldPhoneNumber, v))
}

// PhoneNumberHasSuffix applies the HasSuffix predicate on the "phone_number" field.
func PhoneNumberHasSuffix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasSuffix(FieldPhoneNumber, v))
}

// PhoneNumberIsNil applies the IsNil predicate on the "phone_number" field.
func PhoneNumberIsNil() predicate.Nursery {
	return predicate.Nursery(sql.FieldIsNull(FieldPhoneNumber))
}

// PhoneNumberNotNil applies the NotNil predicate on the "phone_number" field.
func PhoneNumberNotNil() predicate.Nursery {
	return predicate.Nursery(sql.FieldNotNull(FieldPhoneNumber))
}

// PhoneNumberEqualFold applies the EqualFold predicate on the "phone_number" field.
func PhoneNumberEqualFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEqualFold(FieldPhoneNumber, v))
}

// PhoneNumberContainsFold applies the ContainsFold predicate on the "phone_number" field.
func PhoneNumberContainsFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContainsFold(FieldPhoneNumber, v))
}

// EmailEQ applies the EQ predicate on the "email" field.
func EmailEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldEmail, v))
}

// EmailNEQ applies the NEQ predicate on the "email" field.
func EmailNEQ(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNEQ(FieldEmail, v))
}

// EmailIn applies the In predicate on the "email" field.
func EmailIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldIn(FieldEmail, vs...))
}

// EmailNotIn applies the NotIn predicate on the "email" field.
func EmailNotIn(vs ...string) predicate.Nursery {
	return predicate.Nursery(sql.FieldNotIn(FieldEmail, vs...))
}

// EmailGT applies the GT predicate on the "email" field.
func EmailGT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGT(FieldEmail, v))
}

// EmailGTE applies the GTE predicate on the "email" field.
func EmailGTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldGTE(FieldEmail, v))
}

// EmailLT applies the LT predicate on the "email" field.
func EmailLT(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLT(FieldEmail, v))
}

// EmailLTE applies the LTE predicate on the "email" field.
func EmailLTE(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldLTE(FieldEmail, v))
}

// EmailContains applies the Contains predicate on the "email" field.
func EmailContains(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContains(FieldEmail, v))
}

// EmailHasPrefix applies the HasPrefix predicate on the "email" field.
func EmailHasPrefix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasPrefix(FieldEmail, v))
}

// EmailHasSuffix applies the HasSuffix predicate on the "email" field.
func EmailHasSuffix(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldHasSuffix(FieldEmail, v))
}

// EmailIsNil applies the IsNil predicate on the "email" field.
func EmailIsNil() predicate.Nursery {
	return predicate.Nursery(sql.FieldIsNull(FieldEmail))
}

// EmailNotNil applies the NotNil predicate on the "email" field.
func EmailNotNil() predicate.Nursery {
	return predicate.Nursery(sql.FieldNotNull(FieldEmail))
}

// EmailEqualFold applies the EqualFold predicate on the "email" field.
func EmailEqualFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldEqualFold(FieldEmail, v))
}

// EmailContainsFold applies the ContainsFold predicate on the "email" field.
func EmailContainsFold(v string) predicate.Nursery {
	return predicate.Nursery(sql.FieldContainsFold(FieldEmail, v))
}

// CreatedAtEQ applies the EQ predicate on the "created_at" field.
func CreatedAtEQ(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldCreatedAt, v))
}

// CreatedAtNEQ applies the NEQ predicate on the "created_at" field.
func CreatedAtNEQ(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldNEQ(FieldCreatedAt, v))
}

// CreatedAtIn applies the In predicate on the "created_at" field.
func CreatedAtIn(vs ...time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldIn(FieldCreatedAt, vs...))
}

// CreatedAtNotIn applies the NotIn predicate on the "created_at" field.
func CreatedAtNotIn(vs ...time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldNotIn(FieldCreatedAt, vs...))
}

// CreatedAtGT applies the GT predicate on the "created_at" field.
func CreatedAtGT(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldGT(FieldCreatedAt, v))
}

// CreatedAtGTE applies the GTE predicate on the "created_at" field.
func CreatedAtGTE(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldGTE(FieldCreatedAt, v))
}

// CreatedAtLT applies the LT predicate on the "created_at" field.
func CreatedAtLT(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldLT(FieldCreatedAt, v))
}

// CreatedAtLTE applies the LTE predicate on the "created_at" field.
func CreatedAtLTE(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldLTE(FieldCreatedAt, v))
}

// UpdatedAtEQ applies the EQ predicate on the "updated_at" field.
func UpdatedAtEQ(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldEQ(FieldUpdatedAt, v))
}

// UpdatedAtNEQ applies the NEQ predicate on the "updated_at" field.
func UpdatedAtNEQ(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldNEQ(FieldUpdatedAt, v))
}

// UpdatedAtIn applies the In predicate on the "updated_at" field.
func UpdatedAtIn(vs ...time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldIn(FieldUpdatedAt, vs...))
}

// UpdatedAtNotIn applies the NotIn predicate on the "updated_at" field.
func UpdatedAtNotIn(vs ...time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldNotIn(FieldUpdatedAt, vs...))
}

// UpdatedAtGT applies the GT predicate on the "updated_at" field.
func UpdatedAtGT(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldGT(FieldUpdatedAt, v))
}

// UpdatedAtGTE applies the GTE predicate on the "updated_at" field.
func UpdatedAtGTE(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldGTE(FieldUpdatedAt, v))
}

// UpdatedAtLT applies the LT predicate on the "updated_at" field.
func UpdatedAtLT(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldLT(FieldUpdatedAt, v))
}

// UpdatedAtLTE applies the LTE predicate on the "updated_at" field.
func UpdatedAtLTE(v time.Time) predicate.Nursery {
	return predicate.Nursery(sql.FieldLTE(FieldUpdatedAt, v))
}

// HasChildren applies the HasEdge predicate on the "children" edge.
func HasChildren() predicate.Nursery {
	return predicate.Nursery(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, true, ChildrenTable, ChildrenColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasChildrenWith applies the HasEdge predicate on the "children" edge with a given conditions (other predicates).
func HasChildrenWith(preds ...predicate.Child) predicate.Nursery {
	return predicate.Nursery(func(s *sql.Selector) {
		step := newChildrenStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasGuardians applies the HasEdge predicate on the "guardians" edge.
func HasGuardians() predicate.Nursery {
	return predicate.Nursery(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, true, GuardiansTable, GuardiansColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasGuardiansWith applies the HasEdge predicate on the "guardians" edge with a given conditions (other predicates).
func HasGuardiansWith(preds ...predicate.Guardian) predicate.Nursery {
	return predicate.Nursery(func(s *sql.Selector) {
		step := newGuardiansStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasBuses applies the HasEdge predicate on the "buses" edge.
func HasBuses() predicate.Nursery {
	return predicate.Nursery(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.O2M, true, BusesTable, BusesColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasBusesWith applies the HasEdge predicate on the "buses" edge with a given conditions (other predicates).
func HasBusesWith(preds ...predicate.Bus) predicate.Nursery {
	return predicate.Nursery(func(s *sql.Selector) {
		step := newBusesStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.Nursery) predicate.Nursery {
	return predicate.Nursery(sql.AndPredicates(predicates...))
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.Nursery) predicate.Nursery {
	return predicate.Nursery(sql.OrPredicates(predicates...))
}

// Not applies the not operator on the given predicate.
func Not(p predicate.Nursery) predicate.Nursery {
	return predicate.Nursery(sql.NotPredicates(p))
}