// Code generated by ent, DO NOT EDIT.

package childbusassociation

import (
	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
)

const (
	// Label holds the string label denoting the childbusassociation type in the database.
	Label = "child_bus_association"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldChildID holds the string denoting the child_id field in the database.
	FieldChildID = "child_id"
	// FieldBusRouteID holds the string denoting the bus_route_id field in the database.
	FieldBusRouteID = "bus_route_id"
	// EdgeChild holds the string denoting the child edge name in mutations.
	EdgeChild = "child"
	// EdgeBusRoute holds the string denoting the bus_route edge name in mutations.
	EdgeBusRoute = "bus_route"
	// Table holds the table name of the childbusassociation in the database.
	Table = "child_bus_associations"
	// ChildTable is the table that holds the child relation/edge.
	ChildTable = "child_bus_associations"
	// ChildInverseTable is the table name for the Child entity.
	// It exists in this package in order to avoid circular dependency with the "child" package.
	ChildInverseTable = "childs"
	// ChildColumn is the table column denoting the child relation/edge.
	ChildColumn = "child_id"
	// BusRouteTable is the table that holds the bus_route relation/edge.
	BusRouteTable = "child_bus_associations"
	// BusRouteInverseTable is the table name for the BusRoute entity.
	// It exists in this package in order to avoid circular dependency with the "busroute" package.
	BusRouteInverseTable = "bus_routes"
	// BusRouteColumn is the table column denoting the bus_route relation/edge.
	BusRouteColumn = "bus_route_id"
)

// Columns holds all SQL columns for childbusassociation fields.
var Columns = []string{
	FieldID,
	FieldChildID,
	FieldBusRouteID,
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

// OrderOption defines the ordering options for the ChildBusAssociation queries.
type OrderOption func(*sql.Selector)

// ByID orders the results by the id field.
func ByID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldID, opts...).ToFunc()
}

// ByChildID orders the results by the child_id field.
func ByChildID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldChildID, opts...).ToFunc()
}

// ByBusRouteID orders the results by the bus_route_id field.
func ByBusRouteID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldBusRouteID, opts...).ToFunc()
}

// ByChildField orders the results by child field.
func ByChildField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newChildStep(), sql.OrderByField(field, opts...))
	}
}

// ByBusRouteField orders the results by bus_route field.
func ByBusRouteField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newBusRouteStep(), sql.OrderByField(field, opts...))
	}
}
func newChildStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(ChildInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, true, ChildTable, ChildColumn),
	)
}
func newBusRouteStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(BusRouteInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, true, BusRouteTable, BusRouteColumn),
	)
}
