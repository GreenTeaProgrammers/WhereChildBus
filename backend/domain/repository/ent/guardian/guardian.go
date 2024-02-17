// Code generated by ent, DO NOT EDIT.

package guardian

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the guardian type in the database.
	Label = "guardian"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldEmail holds the string denoting the email field in the database.
	FieldEmail = "email"
	// FieldHashedPassword holds the string denoting the hashed_password field in the database.
	FieldHashedPassword = "hashed_password"
	// FieldName holds the string denoting the name field in the database.
	FieldName = "name"
	// FieldPhoneNumber holds the string denoting the phone_number field in the database.
	FieldPhoneNumber = "phone_number"
	// FieldIsUseMorningBus holds the string denoting the is_use_morning_bus field in the database.
	FieldIsUseMorningBus = "is_use_morning_bus"
	// FieldIsUseEveningBus holds the string denoting the is_use_evening_bus field in the database.
	FieldIsUseEveningBus = "is_use_evening_bus"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// FieldUpdatedAt holds the string denoting the updated_at field in the database.
	FieldUpdatedAt = "updated_at"
	// EdgeChildren holds the string denoting the children edge name in mutations.
	EdgeChildren = "children"
	// EdgeNursery holds the string denoting the nursery edge name in mutations.
	EdgeNursery = "nursery"
	// EdgeStation holds the string denoting the station edge name in mutations.
	EdgeStation = "station"
	// Table holds the table name of the guardian in the database.
	Table = "guardians"
	// ChildrenTable is the table that holds the children relation/edge.
	ChildrenTable = "childs"
	// ChildrenInverseTable is the table name for the Child entity.
	// It exists in this package in order to avoid circular dependency with the "child" package.
	ChildrenInverseTable = "childs"
	// ChildrenColumn is the table column denoting the children relation/edge.
	ChildrenColumn = "guardian_children"
	// NurseryTable is the table that holds the nursery relation/edge.
	NurseryTable = "guardians"
	// NurseryInverseTable is the table name for the Nursery entity.
	// It exists in this package in order to avoid circular dependency with the "nursery" package.
	NurseryInverseTable = "nurseries"
	// NurseryColumn is the table column denoting the nursery relation/edge.
	NurseryColumn = "guardian_nursery"
	// StationTable is the table that holds the station relation/edge.
	StationTable = "stations"
	// StationInverseTable is the table name for the Station entity.
	// It exists in this package in order to avoid circular dependency with the "station" package.
	StationInverseTable = "stations"
	// StationColumn is the table column denoting the station relation/edge.
	StationColumn = "guardian_station"
)

// Columns holds all SQL columns for guardian fields.
var Columns = []string{
	FieldID,
	FieldEmail,
	FieldHashedPassword,
	FieldName,
	FieldPhoneNumber,
	FieldIsUseMorningBus,
	FieldIsUseEveningBus,
	FieldCreatedAt,
	FieldUpdatedAt,
}

// ForeignKeys holds the SQL foreign-keys that are owned by the "guardians"
// table and are not defined as standalone fields in the schema.
var ForeignKeys = []string{
	"guardian_nursery",
}

// ValidColumn reports if the column name is valid (part of the table columns).
func ValidColumn(column string) bool {
	for i := range Columns {
		if column == Columns[i] {
			return true
		}
	}
	for i := range ForeignKeys {
		if column == ForeignKeys[i] {
			return true
		}
	}
	return false
}

var (
	// DefaultIsUseMorningBus holds the default value on creation for the "is_use_morning_bus" field.
	DefaultIsUseMorningBus bool
	// DefaultIsUseEveningBus holds the default value on creation for the "is_use_evening_bus" field.
	DefaultIsUseEveningBus bool
	// DefaultCreatedAt holds the default value on creation for the "created_at" field.
	DefaultCreatedAt func() time.Time
	// DefaultUpdatedAt holds the default value on creation for the "updated_at" field.
	DefaultUpdatedAt func() time.Time
	// UpdateDefaultUpdatedAt holds the default value on update for the "updated_at" field.
	UpdateDefaultUpdatedAt func() time.Time
	// DefaultID holds the default value on creation for the "id" field.
	DefaultID func() uuid.UUID
)

// OrderOption defines the ordering options for the Guardian queries.
type OrderOption func(*sql.Selector)

// ByID orders the results by the id field.
func ByID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldID, opts...).ToFunc()
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

// ByPhoneNumber orders the results by the phone_number field.
func ByPhoneNumber(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldPhoneNumber, opts...).ToFunc()
}

// ByIsUseMorningBus orders the results by the is_use_morning_bus field.
func ByIsUseMorningBus(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldIsUseMorningBus, opts...).ToFunc()
}

// ByIsUseEveningBus orders the results by the is_use_evening_bus field.
func ByIsUseEveningBus(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldIsUseEveningBus, opts...).ToFunc()
}

// ByCreatedAt orders the results by the created_at field.
func ByCreatedAt(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldCreatedAt, opts...).ToFunc()
}

// ByUpdatedAt orders the results by the updated_at field.
func ByUpdatedAt(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldUpdatedAt, opts...).ToFunc()
}

// ByChildrenCount orders the results by children count.
func ByChildrenCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newChildrenStep(), opts...)
	}
}

// ByChildren orders the results by children terms.
func ByChildren(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newChildrenStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByNurseryField orders the results by nursery field.
func ByNurseryField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newNurseryStep(), sql.OrderByField(field, opts...))
	}
}

// ByStationField orders the results by station field.
func ByStationField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newStationStep(), sql.OrderByField(field, opts...))
	}
}
func newChildrenStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(ChildrenInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, false, ChildrenTable, ChildrenColumn),
	)
}
func newNurseryStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(NurseryInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, false, NurseryTable, NurseryColumn),
	)
}
func newStationStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(StationInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2O, false, StationTable, StationColumn),
	)
}
