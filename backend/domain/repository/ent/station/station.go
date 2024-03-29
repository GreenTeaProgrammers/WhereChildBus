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
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// FieldUpdatedAt holds the string denoting the updated_at field in the database.
	FieldUpdatedAt = "updated_at"
	// EdgeGuardian holds the string denoting the guardian edge name in mutations.
	EdgeGuardian = "guardian"
	// EdgeNextForBuses holds the string denoting the next_for_buses edge name in mutations.
	EdgeNextForBuses = "next_for_buses"
	// EdgeBusRouteAssociations holds the string denoting the busrouteassociations edge name in mutations.
	EdgeBusRouteAssociations = "busRouteAssociations"
	// Table holds the table name of the station in the database.
	Table = "stations"
	// GuardianTable is the table that holds the guardian relation/edge.
	GuardianTable = "stations"
	// GuardianInverseTable is the table name for the Guardian entity.
	// It exists in this package in order to avoid circular dependency with the "guardian" package.
	GuardianInverseTable = "guardians"
	// GuardianColumn is the table column denoting the guardian relation/edge.
	GuardianColumn = "guardian_station"
	// NextForBusesTable is the table that holds the next_for_buses relation/edge.
	NextForBusesTable = "bus"
	// NextForBusesInverseTable is the table name for the Bus entity.
	// It exists in this package in order to avoid circular dependency with the "bus" package.
	NextForBusesInverseTable = "bus"
	// NextForBusesColumn is the table column denoting the next_for_buses relation/edge.
	NextForBusesColumn = "bus_next_station"
	// BusRouteAssociationsTable is the table that holds the busRouteAssociations relation/edge.
	BusRouteAssociationsTable = "bus_route_associations"
	// BusRouteAssociationsInverseTable is the table name for the BusRouteAssociation entity.
	// It exists in this package in order to avoid circular dependency with the "busrouteassociation" package.
	BusRouteAssociationsInverseTable = "bus_route_associations"
	// BusRouteAssociationsColumn is the table column denoting the busRouteAssociations relation/edge.
	BusRouteAssociationsColumn = "station_id"
)

// Columns holds all SQL columns for station fields.
var Columns = []string{
	FieldID,
	FieldLatitude,
	FieldLongitude,
	FieldCreatedAt,
	FieldUpdatedAt,
}

// ForeignKeys holds the SQL foreign-keys that are owned by the "stations"
// table and are not defined as standalone fields in the schema.
var ForeignKeys = []string{
	"guardian_station",
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
	// DefaultLatitude holds the default value on creation for the "latitude" field.
	DefaultLatitude float64
	// DefaultLongitude holds the default value on creation for the "longitude" field.
	DefaultLongitude float64
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

// ByNextForBusesCount orders the results by next_for_buses count.
func ByNextForBusesCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newNextForBusesStep(), opts...)
	}
}

// ByNextForBuses orders the results by next_for_buses terms.
func ByNextForBuses(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newNextForBusesStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByBusRouteAssociationsCount orders the results by busRouteAssociations count.
func ByBusRouteAssociationsCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newBusRouteAssociationsStep(), opts...)
	}
}

// ByBusRouteAssociations orders the results by busRouteAssociations terms.
func ByBusRouteAssociations(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newBusRouteAssociationsStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}
func newGuardianStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(GuardianInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2O, true, GuardianTable, GuardianColumn),
	)
}
func newNextForBusesStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(NextForBusesInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, true, NextForBusesTable, NextForBusesColumn),
	)
}
func newBusRouteAssociationsStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(BusRouteAssociationsInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, false, BusRouteAssociationsTable, BusRouteAssociationsColumn),
	)
}
