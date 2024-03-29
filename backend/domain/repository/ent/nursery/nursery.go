// Code generated by ent, DO NOT EDIT.

package nursery

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the nursery type in the database.
	Label = "nursery"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldNurseryCode holds the string denoting the nursery_code field in the database.
	FieldNurseryCode = "nursery_code"
	// FieldEmail holds the string denoting the email field in the database.
	FieldEmail = "email"
	// FieldHashedPassword holds the string denoting the hashed_password field in the database.
	FieldHashedPassword = "hashed_password"
	// FieldName holds the string denoting the name field in the database.
	FieldName = "name"
	// FieldAddress holds the string denoting the address field in the database.
	FieldAddress = "address"
	// FieldPhoneNumber holds the string denoting the phone_number field in the database.
	FieldPhoneNumber = "phone_number"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// FieldUpdatedAt holds the string denoting the updated_at field in the database.
	FieldUpdatedAt = "updated_at"
	// EdgeGuardians holds the string denoting the guardians edge name in mutations.
	EdgeGuardians = "guardians"
	// EdgeBuses holds the string denoting the buses edge name in mutations.
	EdgeBuses = "buses"
	// Table holds the table name of the nursery in the database.
	Table = "nurseries"
	// GuardiansTable is the table that holds the guardians relation/edge.
	GuardiansTable = "guardians"
	// GuardiansInverseTable is the table name for the Guardian entity.
	// It exists in this package in order to avoid circular dependency with the "guardian" package.
	GuardiansInverseTable = "guardians"
	// GuardiansColumn is the table column denoting the guardians relation/edge.
	GuardiansColumn = "guardian_nursery"
	// BusesTable is the table that holds the buses relation/edge.
	BusesTable = "bus"
	// BusesInverseTable is the table name for the Bus entity.
	// It exists in this package in order to avoid circular dependency with the "bus" package.
	BusesInverseTable = "bus"
	// BusesColumn is the table column denoting the buses relation/edge.
	BusesColumn = "bus_nursery"
)

// Columns holds all SQL columns for nursery fields.
var Columns = []string{
	FieldID,
	FieldNurseryCode,
	FieldEmail,
	FieldHashedPassword,
	FieldName,
	FieldAddress,
	FieldPhoneNumber,
	FieldCreatedAt,
	FieldUpdatedAt,
}

// ValidColumn reports if the column name is valid (part of the table columns).
func ValidColumn(column string) bool {
	for i := range Columns {
		if column == Columns[i] {
			return true
		}
	}
	return false
}

var (
	// DefaultCreatedAt holds the default value on creation for the "created_at" field.
	DefaultCreatedAt func() time.Time
	// DefaultUpdatedAt holds the default value on creation for the "updated_at" field.
	DefaultUpdatedAt func() time.Time
	// UpdateDefaultUpdatedAt holds the default value on update for the "updated_at" field.
	UpdateDefaultUpdatedAt func() time.Time
	// DefaultID holds the default value on creation for the "id" field.
	DefaultID func() uuid.UUID
)

// OrderOption defines the ordering options for the Nursery queries.
type OrderOption func(*sql.Selector)

// ByID orders the results by the id field.
func ByID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldID, opts...).ToFunc()
}

// ByNurseryCode orders the results by the nursery_code field.
func ByNurseryCode(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldNurseryCode, opts...).ToFunc()
}

// ByEmail orders the results by the email field.
func ByEmail(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldEmail, opts...).ToFunc()
}

// ByHashedPassword orders the results by the hashed_password field.
func ByHashedPassword(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldHashedPassword, opts...).ToFunc()
}

// ByName orders the results by the name field.
func ByName(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldName, opts...).ToFunc()
}

// ByAddress orders the results by the address field.
func ByAddress(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldAddress, opts...).ToFunc()
}

// ByPhoneNumber orders the results by the phone_number field.
func ByPhoneNumber(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldPhoneNumber, opts...).ToFunc()
}

// ByCreatedAt orders the results by the created_at field.
func ByCreatedAt(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldCreatedAt, opts...).ToFunc()
}

// ByUpdatedAt orders the results by the updated_at field.
func ByUpdatedAt(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldUpdatedAt, opts...).ToFunc()
}

// ByGuardiansCount orders the results by guardians count.
func ByGuardiansCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newGuardiansStep(), opts...)
	}
}

// ByGuardians orders the results by guardians terms.
func ByGuardians(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newGuardiansStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByBusesCount orders the results by buses count.
func ByBusesCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newBusesStep(), opts...)
	}
}

// ByBuses orders the results by buses terms.
func ByBuses(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newBusesStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}
func newGuardiansStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(GuardiansInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, true, GuardiansTable, GuardiansColumn),
	)
}
func newBusesStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(BusesInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, true, BusesTable, BusesColumn),
	)
}
