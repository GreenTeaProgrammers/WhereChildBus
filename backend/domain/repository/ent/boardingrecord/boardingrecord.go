// Code generated by ent, DO NOT EDIT.

package boardingrecord

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the boardingrecord type in the database.
	Label = "boarding_record"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldTimestamp holds the string denoting the timestamp field in the database.
	FieldTimestamp = "timestamp"
	// FieldIsBoarding holds the string denoting the is_boarding field in the database.
	FieldIsBoarding = "is_boarding"
	// EdgeChild holds the string denoting the child edge name in mutations.
	EdgeChild = "child"
	// EdgeBus holds the string denoting the bus edge name in mutations.
	EdgeBus = "bus"
	// Table holds the table name of the boardingrecord in the database.
	Table = "boarding_records"
	// ChildTable is the table that holds the child relation/edge.
	ChildTable = "boarding_records"
	// ChildInverseTable is the table name for the Child entity.
	// It exists in this package in order to avoid circular dependency with the "child" package.
	ChildInverseTable = "childs"
	// ChildColumn is the table column denoting the child relation/edge.
	ChildColumn = "child_boarding_record"
	// BusTable is the table that holds the bus relation/edge.
	BusTable = "boarding_records"
	// BusInverseTable is the table name for the Bus entity.
	// It exists in this package in order to avoid circular dependency with the "bus" package.
	BusInverseTable = "bus"
	// BusColumn is the table column denoting the bus relation/edge.
	BusColumn = "bus_boarding_records"
)

// Columns holds all SQL columns for boardingrecord fields.
var Columns = []string{
	FieldID,
	FieldTimestamp,
	FieldIsBoarding,
}

// ForeignKeys holds the SQL foreign-keys that are owned by the "boarding_records"
// table and are not defined as standalone fields in the schema.
var ForeignKeys = []string{
	"bus_boarding_records",
	"child_boarding_record",
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
	// DefaultTimestamp holds the default value on creation for the "timestamp" field.
	DefaultTimestamp func() time.Time
	// DefaultIsBoarding holds the default value on creation for the "is_boarding" field.
	DefaultIsBoarding bool
	// DefaultID holds the default value on creation for the "id" field.
	DefaultID func() uuid.UUID
)

// OrderOption defines the ordering options for the BoardingRecord queries.
type OrderOption func(*sql.Selector)

// ByID orders the results by the id field.
func ByID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldID, opts...).ToFunc()
}

// ByTimestamp orders the results by the timestamp field.
func ByTimestamp(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldTimestamp, opts...).ToFunc()
}

// ByIsBoarding orders the results by the is_boarding field.
func ByIsBoarding(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldIsBoarding, opts...).ToFunc()
}

// ByChildField orders the results by child field.
func ByChildField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newChildStep(), sql.OrderByField(field, opts...))
	}
}

// ByBusField orders the results by bus field.
func ByBusField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newBusStep(), sql.OrderByField(field, opts...))
	}
}
func newChildStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(ChildInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, true, ChildTable, ChildColumn),
	)
}
func newBusStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(BusInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, true, BusTable, BusColumn),
	)
}
