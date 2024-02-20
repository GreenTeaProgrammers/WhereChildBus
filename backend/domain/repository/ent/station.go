// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent"
	"entgo.io/ent/dialect/sql"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
	"github.com/google/uuid"
)

// Station is the model entity for the Station schema.
type Station struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// Latitude holds the value of the "latitude" field.
	Latitude float64 `json:"latitude,omitempty"`
	// Longitude holds the value of the "longitude" field.
	Longitude float64 `json:"longitude,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// UpdatedAt holds the value of the "updated_at" field.
	UpdatedAt time.Time `json:"updated_at,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the StationQuery when eager-loading is set.
	Edges                        StationEdges `json:"edges"`
	guardian_station             *uuid.UUID
	station_morning_next_station *uuid.UUID
	station_evening_next_station *uuid.UUID
	selectValues                 sql.SelectValues
}

// StationEdges holds the relations/edges for other nodes in the graph.
type StationEdges struct {
	// Guardian holds the value of the guardian edge.
	Guardian *Guardian `json:"guardian,omitempty"`
	// Bus holds the value of the bus edge.
	Bus []*Bus `json:"bus,omitempty"`
	// MorningPreviousStation holds the value of the morning_previous_station edge.
	MorningPreviousStation *Station `json:"morning_previous_station,omitempty"`
	// MorningNextStation holds the value of the morning_next_station edge.
	MorningNextStation []*Station `json:"morning_next_station,omitempty"`
	// EveningPreviousStation holds the value of the evening_previous_station edge.
	EveningPreviousStation *Station `json:"evening_previous_station,omitempty"`
	// EveningNextStation holds the value of the evening_next_station edge.
	EveningNextStation []*Station `json:"evening_next_station,omitempty"`
	// DestinationForBuses holds the value of the destination_for_buses edge.
	DestinationForBuses []*Bus `json:"destination_for_buses,omitempty"`
	// MorningFirstForBuses holds the value of the morning_first_for_buses edge.
	MorningFirstForBuses []*Bus `json:"morning_first_for_buses,omitempty"`
	// EveningFirstForBuses holds the value of the evening_first_for_buses edge.
	EveningFirstForBuses []*Bus `json:"evening_first_for_buses,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [9]bool
}

// GuardianOrErr returns the Guardian value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e StationEdges) GuardianOrErr() (*Guardian, error) {
	if e.loadedTypes[0] {
		if e.Guardian == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: guardian.Label}
		}
		return e.Guardian, nil
	}
	return nil, &NotLoadedError{edge: "guardian"}
}

// BusOrErr returns the Bus value or an error if the edge
// was not loaded in eager-loading.
func (e StationEdges) BusOrErr() ([]*Bus, error) {
	if e.loadedTypes[1] {
		return e.Bus, nil
	}
	return nil, &NotLoadedError{edge: "bus"}
}

// MorningPreviousStationOrErr returns the MorningPreviousStation value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e StationEdges) MorningPreviousStationOrErr() (*Station, error) {
	if e.loadedTypes[2] {
		if e.MorningPreviousStation == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: station.Label}
		}
		return e.MorningPreviousStation, nil
	}
	return nil, &NotLoadedError{edge: "morning_previous_station"}
}

// MorningNextStationOrErr returns the MorningNextStation value or an error if the edge
// was not loaded in eager-loading.
func (e StationEdges) MorningNextStationOrErr() ([]*Station, error) {
	if e.loadedTypes[3] {
		return e.MorningNextStation, nil
	}
	return nil, &NotLoadedError{edge: "morning_next_station"}
}

// EveningPreviousStationOrErr returns the EveningPreviousStation value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e StationEdges) EveningPreviousStationOrErr() (*Station, error) {
	if e.loadedTypes[4] {
		if e.EveningPreviousStation == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: station.Label}
		}
		return e.EveningPreviousStation, nil
	}
	return nil, &NotLoadedError{edge: "evening_previous_station"}
}

// EveningNextStationOrErr returns the EveningNextStation value or an error if the edge
// was not loaded in eager-loading.
func (e StationEdges) EveningNextStationOrErr() ([]*Station, error) {
	if e.loadedTypes[5] {
		return e.EveningNextStation, nil
	}
	return nil, &NotLoadedError{edge: "evening_next_station"}
}

// DestinationForBusesOrErr returns the DestinationForBuses value or an error if the edge
// was not loaded in eager-loading.
func (e StationEdges) DestinationForBusesOrErr() ([]*Bus, error) {
	if e.loadedTypes[6] {
		return e.DestinationForBuses, nil
	}
	return nil, &NotLoadedError{edge: "destination_for_buses"}
}

// MorningFirstForBusesOrErr returns the MorningFirstForBuses value or an error if the edge
// was not loaded in eager-loading.
func (e StationEdges) MorningFirstForBusesOrErr() ([]*Bus, error) {
	if e.loadedTypes[7] {
		return e.MorningFirstForBuses, nil
	}
	return nil, &NotLoadedError{edge: "morning_first_for_buses"}
}

// EveningFirstForBusesOrErr returns the EveningFirstForBuses value or an error if the edge
// was not loaded in eager-loading.
func (e StationEdges) EveningFirstForBusesOrErr() ([]*Bus, error) {
	if e.loadedTypes[8] {
		return e.EveningFirstForBuses, nil
	}
	return nil, &NotLoadedError{edge: "evening_first_for_buses"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*Station) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case station.FieldLatitude, station.FieldLongitude:
			values[i] = new(sql.NullFloat64)
		case station.FieldCreatedAt, station.FieldUpdatedAt:
			values[i] = new(sql.NullTime)
		case station.FieldID:
			values[i] = new(uuid.UUID)
		case station.ForeignKeys[0]: // guardian_station
			values[i] = &sql.NullScanner{S: new(uuid.UUID)}
		case station.ForeignKeys[1]: // station_morning_next_station
			values[i] = &sql.NullScanner{S: new(uuid.UUID)}
		case station.ForeignKeys[2]: // station_evening_next_station
			values[i] = &sql.NullScanner{S: new(uuid.UUID)}
		default:
			values[i] = new(sql.UnknownType)
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the Station fields.
func (s *Station) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case station.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				s.ID = *value
			}
		case station.FieldLatitude:
			if value, ok := values[i].(*sql.NullFloat64); !ok {
				return fmt.Errorf("unexpected type %T for field latitude", values[i])
			} else if value.Valid {
				s.Latitude = value.Float64
			}
		case station.FieldLongitude:
			if value, ok := values[i].(*sql.NullFloat64); !ok {
				return fmt.Errorf("unexpected type %T for field longitude", values[i])
			} else if value.Valid {
				s.Longitude = value.Float64
			}
		case station.FieldCreatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[i])
			} else if value.Valid {
				s.CreatedAt = value.Time
			}
		case station.FieldUpdatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field updated_at", values[i])
			} else if value.Valid {
				s.UpdatedAt = value.Time
			}
		case station.ForeignKeys[0]:
			if value, ok := values[i].(*sql.NullScanner); !ok {
				return fmt.Errorf("unexpected type %T for field guardian_station", values[i])
			} else if value.Valid {
				s.guardian_station = new(uuid.UUID)
				*s.guardian_station = *value.S.(*uuid.UUID)
			}
		case station.ForeignKeys[1]:
			if value, ok := values[i].(*sql.NullScanner); !ok {
				return fmt.Errorf("unexpected type %T for field station_morning_next_station", values[i])
			} else if value.Valid {
				s.station_morning_next_station = new(uuid.UUID)
				*s.station_morning_next_station = *value.S.(*uuid.UUID)
			}
		case station.ForeignKeys[2]:
			if value, ok := values[i].(*sql.NullScanner); !ok {
				return fmt.Errorf("unexpected type %T for field station_evening_next_station", values[i])
			} else if value.Valid {
				s.station_evening_next_station = new(uuid.UUID)
				*s.station_evening_next_station = *value.S.(*uuid.UUID)
			}
		default:
			s.selectValues.Set(columns[i], values[i])
		}
	}
	return nil
}

// Value returns the ent.Value that was dynamically selected and assigned to the Station.
// This includes values selected through modifiers, order, etc.
func (s *Station) Value(name string) (ent.Value, error) {
	return s.selectValues.Get(name)
}

// QueryGuardian queries the "guardian" edge of the Station entity.
func (s *Station) QueryGuardian() *GuardianQuery {
	return NewStationClient(s.config).QueryGuardian(s)
}

// QueryBus queries the "bus" edge of the Station entity.
func (s *Station) QueryBus() *BusQuery {
	return NewStationClient(s.config).QueryBus(s)
}

// QueryMorningPreviousStation queries the "morning_previous_station" edge of the Station entity.
func (s *Station) QueryMorningPreviousStation() *StationQuery {
	return NewStationClient(s.config).QueryMorningPreviousStation(s)
}

// QueryMorningNextStation queries the "morning_next_station" edge of the Station entity.
func (s *Station) QueryMorningNextStation() *StationQuery {
	return NewStationClient(s.config).QueryMorningNextStation(s)
}

// QueryEveningPreviousStation queries the "evening_previous_station" edge of the Station entity.
func (s *Station) QueryEveningPreviousStation() *StationQuery {
	return NewStationClient(s.config).QueryEveningPreviousStation(s)
}

// QueryEveningNextStation queries the "evening_next_station" edge of the Station entity.
func (s *Station) QueryEveningNextStation() *StationQuery {
	return NewStationClient(s.config).QueryEveningNextStation(s)
}

// QueryDestinationForBuses queries the "destination_for_buses" edge of the Station entity.
func (s *Station) QueryDestinationForBuses() *BusQuery {
	return NewStationClient(s.config).QueryDestinationForBuses(s)
}

// QueryMorningFirstForBuses queries the "morning_first_for_buses" edge of the Station entity.
func (s *Station) QueryMorningFirstForBuses() *BusQuery {
	return NewStationClient(s.config).QueryMorningFirstForBuses(s)
}

// QueryEveningFirstForBuses queries the "evening_first_for_buses" edge of the Station entity.
func (s *Station) QueryEveningFirstForBuses() *BusQuery {
	return NewStationClient(s.config).QueryEveningFirstForBuses(s)
}

// Update returns a builder for updating this Station.
// Note that you need to call Station.Unwrap() before calling this method if this Station
// was returned from a transaction, and the transaction was committed or rolled back.
func (s *Station) Update() *StationUpdateOne {
	return NewStationClient(s.config).UpdateOne(s)
}

// Unwrap unwraps the Station entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (s *Station) Unwrap() *Station {
	_tx, ok := s.config.driver.(*txDriver)
	if !ok {
		panic("ent: Station is not a transactional entity")
	}
	s.config.driver = _tx.drv
	return s
}

// String implements the fmt.Stringer.
func (s *Station) String() string {
	var builder strings.Builder
	builder.WriteString("Station(")
	builder.WriteString(fmt.Sprintf("id=%v, ", s.ID))
	builder.WriteString("latitude=")
	builder.WriteString(fmt.Sprintf("%v", s.Latitude))
	builder.WriteString(", ")
	builder.WriteString("longitude=")
	builder.WriteString(fmt.Sprintf("%v", s.Longitude))
	builder.WriteString(", ")
	builder.WriteString("created_at=")
	builder.WriteString(s.CreatedAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("updated_at=")
	builder.WriteString(s.UpdatedAt.Format(time.ANSIC))
	builder.WriteByte(')')
	return builder.String()
}

// Stations is a parsable slice of Station.
type Stations []*Station
