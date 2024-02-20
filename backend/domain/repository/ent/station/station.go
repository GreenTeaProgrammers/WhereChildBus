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
	// EdgeBus holds the string denoting the bus edge name in mutations.
	EdgeBus = "bus"
	// EdgeMorningPreviousStation holds the string denoting the morning_previous_station edge name in mutations.
	EdgeMorningPreviousStation = "morning_previous_station"
	// EdgeMorningNextStation holds the string denoting the morning_next_station edge name in mutations.
	EdgeMorningNextStation = "morning_next_station"
	// EdgeEveningPreviousStation holds the string denoting the evening_previous_station edge name in mutations.
	EdgeEveningPreviousStation = "evening_previous_station"
	// EdgeEveningNextStation holds the string denoting the evening_next_station edge name in mutations.
	EdgeEveningNextStation = "evening_next_station"
	// EdgeDestinationForBuses holds the string denoting the destination_for_buses edge name in mutations.
	EdgeDestinationForBuses = "destination_for_buses"
	// EdgeMorningFirstForBuses holds the string denoting the morning_first_for_buses edge name in mutations.
	EdgeMorningFirstForBuses = "morning_first_for_buses"
	// EdgeEveningFirstForBuses holds the string denoting the evening_first_for_buses edge name in mutations.
	EdgeEveningFirstForBuses = "evening_first_for_buses"
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
	// MorningPreviousStationTable is the table that holds the morning_previous_station relation/edge.
	MorningPreviousStationTable = "stations"
	// MorningPreviousStationColumn is the table column denoting the morning_previous_station relation/edge.
	MorningPreviousStationColumn = "station_morning_next_station"
	// MorningNextStationTable is the table that holds the morning_next_station relation/edge.
	MorningNextStationTable = "stations"
	// MorningNextStationColumn is the table column denoting the morning_next_station relation/edge.
	MorningNextStationColumn = "station_morning_next_station"
	// EveningPreviousStationTable is the table that holds the evening_previous_station relation/edge.
	EveningPreviousStationTable = "stations"
	// EveningPreviousStationColumn is the table column denoting the evening_previous_station relation/edge.
	EveningPreviousStationColumn = "station_evening_next_station"
	// EveningNextStationTable is the table that holds the evening_next_station relation/edge.
	EveningNextStationTable = "stations"
	// EveningNextStationColumn is the table column denoting the evening_next_station relation/edge.
	EveningNextStationColumn = "station_evening_next_station"
	// DestinationForBusesTable is the table that holds the destination_for_buses relation/edge.
	DestinationForBusesTable = "bus"
	// DestinationForBusesInverseTable is the table name for the Bus entity.
	// It exists in this package in order to avoid circular dependency with the "bus" package.
	DestinationForBusesInverseTable = "bus"
	// DestinationForBusesColumn is the table column denoting the destination_for_buses relation/edge.
	DestinationForBusesColumn = "bus_destination_station"
	// MorningFirstForBusesTable is the table that holds the morning_first_for_buses relation/edge.
	MorningFirstForBusesTable = "bus"
	// MorningFirstForBusesInverseTable is the table name for the Bus entity.
	// It exists in this package in order to avoid circular dependency with the "bus" package.
	MorningFirstForBusesInverseTable = "bus"
	// MorningFirstForBusesColumn is the table column denoting the morning_first_for_buses relation/edge.
	MorningFirstForBusesColumn = "bus_morning_first_station"
	// EveningFirstForBusesTable is the table that holds the evening_first_for_buses relation/edge.
	EveningFirstForBusesTable = "bus"
	// EveningFirstForBusesInverseTable is the table name for the Bus entity.
	// It exists in this package in order to avoid circular dependency with the "bus" package.
	EveningFirstForBusesInverseTable = "bus"
	// EveningFirstForBusesColumn is the table column denoting the evening_first_for_buses relation/edge.
	EveningFirstForBusesColumn = "bus_evening_first_station"
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
	"station_morning_next_station",
	"station_evening_next_station",
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

// ByMorningPreviousStationField orders the results by morning_previous_station field.
func ByMorningPreviousStationField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newMorningPreviousStationStep(), sql.OrderByField(field, opts...))
	}
}

// ByMorningNextStationCount orders the results by morning_next_station count.
func ByMorningNextStationCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newMorningNextStationStep(), opts...)
	}
}

// ByMorningNextStation orders the results by morning_next_station terms.
func ByMorningNextStation(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newMorningNextStationStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByEveningPreviousStationField orders the results by evening_previous_station field.
func ByEveningPreviousStationField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newEveningPreviousStationStep(), sql.OrderByField(field, opts...))
	}
}

// ByEveningNextStationCount orders the results by evening_next_station count.
func ByEveningNextStationCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newEveningNextStationStep(), opts...)
	}
}

// ByEveningNextStation orders the results by evening_next_station terms.
func ByEveningNextStation(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newEveningNextStationStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByDestinationForBusesCount orders the results by destination_for_buses count.
func ByDestinationForBusesCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newDestinationForBusesStep(), opts...)
	}
}

// ByDestinationForBuses orders the results by destination_for_buses terms.
func ByDestinationForBuses(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newDestinationForBusesStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByMorningFirstForBusesCount orders the results by morning_first_for_buses count.
func ByMorningFirstForBusesCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newMorningFirstForBusesStep(), opts...)
	}
}

// ByMorningFirstForBuses orders the results by morning_first_for_buses terms.
func ByMorningFirstForBuses(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newMorningFirstForBusesStep(), append([]sql.OrderTerm{term}, terms...)...)
	}
}

// ByEveningFirstForBusesCount orders the results by evening_first_for_buses count.
func ByEveningFirstForBusesCount(opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborsCount(s, newEveningFirstForBusesStep(), opts...)
	}
}

// ByEveningFirstForBuses orders the results by evening_first_for_buses terms.
func ByEveningFirstForBuses(term sql.OrderTerm, terms ...sql.OrderTerm) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newEveningFirstForBusesStep(), append([]sql.OrderTerm{term}, terms...)...)
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
func newMorningPreviousStationStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(Table, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, true, MorningPreviousStationTable, MorningPreviousStationColumn),
	)
}
func newMorningNextStationStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(Table, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, false, MorningNextStationTable, MorningNextStationColumn),
	)
}
func newEveningPreviousStationStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(Table, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, true, EveningPreviousStationTable, EveningPreviousStationColumn),
	)
}
func newEveningNextStationStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(Table, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, false, EveningNextStationTable, EveningNextStationColumn),
	)
}
func newDestinationForBusesStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(DestinationForBusesInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, true, DestinationForBusesTable, DestinationForBusesColumn),
	)
}
func newMorningFirstForBusesStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(MorningFirstForBusesInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, true, MorningFirstForBusesTable, MorningFirstForBusesColumn),
	)
}
func newEveningFirstForBusesStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(EveningFirstForBusesInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.O2M, true, EveningFirstForBusesTable, EveningFirstForBusesColumn),
	)
}
