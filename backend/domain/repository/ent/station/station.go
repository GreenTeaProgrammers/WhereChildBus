// Code generated by ent, DO NOT EDIT.

package station

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the station type in the database.
	Label = "station"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldLatitude holds the string denoting the latitude field in the database.
	FieldLatitude = "latitude"
	// FieldLongitude holds the string denoting the longitude field in the database.
	FieldLongitude = "longitude"
	// FieldMorningOrder holds the string denoting the morning_order field in the database.
	FieldMorningOrder = "morning_order"
	// FieldEveningOrder holds the string denoting the evening_order field in the database.
	FieldEveningOrder = "evening_order"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// FieldUpdatedAt holds the string denoting the updated_at field in the database.
	FieldUpdatedAt = "updated_at"
	// EdgeGuardian holds the string denoting the guardian edge name in mutations.
	EdgeGuardian = "guardian"
	// EdgeBus holds the string denoting the bus edge name in mutations.
	EdgeBus = "bus"
	// Table holds the table name of the station in the database.
	Table = "stations"
	// GuardianTable is the table that holds the guardian relation/edge.
	GuardianTable = "stations"
	// GuardianInverseTable is the table name for the Guardian entity.
	// It exists in this package in order to avoid circular dependency with the "guardian" package.
	GuardianInverseTable = "guardians"
	// GuardianColumn is the table column denoting the guardian relation/edge.
	GuardianColumn = "guardian_station"
	// BusTable is the table that holds the bus relation/edge. The primary key declared below.
	BusTable = "bus_stations"
	// BusInverseTable is the table name for the Bus entity.
	// It exists in this package in order to avoid circular dependency with the "bus" package.
	BusInverseTable = "bus"
)

// Columns holds all SQL columns for station fields.
var Columns = []string{
	FieldID,
	FieldLatitude,
	FieldLongitude,
	FieldMorningOrder,
	FieldEveningOrder,
	FieldCreatedAt,
	FieldUpdatedAt,
}

// ForeignKeys holds the SQL foreign-keys that are owned by the "stations"
// table and are not defined as standalone fields in the schema.
var ForeignKeys = []string{
	"guardian_station",
}

var (
	// BusPrimaryKey and BusColumn2 are the table columns denoting the
	// primary key for the bus relation (M2M).
	BusPrimaryKey = []string{"bus_id", "station_id"}
)

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
	// DefaultCreatedAt holds the default value on creation for the "created_at" field.
	DefaultCreatedAt func() time.Time
	// DefaultUpdatedAt holds the default value on creation for the "updated_at" field.
	DefaultUpdatedAt func() time.Time
	// UpdateDefaultUpdatedAt holds the default value on update for the "updated_at" field.
	UpdateDefaultUpdatedAt func() time.Time
	// DefaultID holds the default value on creation for the "id" field.
	DefaultID func() uuid.UUID
)

// OrderOption defines the ordering options for the Station queries.
type OrderOption func(*sql.Selector)

// ByID orders the results by the id field.
func ByID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldID, opts...).ToFunc()
}

// ByLatitude orders the results by the latitude field.
func ByLatitude(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldLatitude, opts...).ToFunc()
}

// ByLongitude orders the results by the longitude field.
func ByLongitude(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldLongitude, opts...).ToFunc()
}

// ByMorningOrder orders the results by the morning_order field.
func ByMorningOrder(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldMorningOrder, opts...).ToFunc()
}

// ByEveningOrder orders the results by the evening_order field.
func ByEveningOrder(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldEveningOrder, opts...).ToFunc()
}

// ByCreatedAt orders the results by the created_at field.
func ByCreatedAt(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldCreatedAt, opts...).ToFunc()
}

// ByUpdatedAt orders the results by the updated_at field.
func ByUpdatedAt(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldUpdatedAt, opts...).ToFunc()
}

// ByGuardianField orders the results by guardian field.
func ByGuardianField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newGuardianStep(), sql.OrderByField(field, opts...))
	}
}

// ByBusCount orders the results by bus count.
func ByBusCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newBusStep(), opts...)
	}
}

// ByBus orders the results by bus terms.
func ByBus(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newBusStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}
func newGuardianStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(GuardianInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2O, true, GuardianTable, GuardianColumn),
	)
}
func newBusStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(BusInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2M, true, BusTable, BusPrimaryKey...),
	)
}
