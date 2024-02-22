// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"

	"entgo.io/ent"
	"entgo.io/ent/dialect/sql"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busroute"
	"github.com/google/uuid"
)

// BusRoute is the model entity for the BusRoute schema.
type BusRoute struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// 朝のバスか放課後のバスかを示す
	BusType busroute.BusType `json:"bus_type,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the BusRouteQuery when eager-loading is set.
	Edges        BusRouteEdges `json:"edges"`
	selectValues sql.SelectValues
}

// BusRouteEdges holds the relations/edges for other nodes in the graph.
type BusRouteEdges struct {
	// Bus holds the value of the bus edge.
	Bus []*Bus `json:"bus,omitempty"`
	// ChildBusAssociations holds the value of the childBusAssociations edge.
	ChildBusAssociations []*ChildBusAssociation `json:"childBusAssociations,omitempty"`
	// BusRouteAssociations holds the value of the busRouteAssociations edge.
	BusRouteAssociations []*BusRouteAssociation `json:"busRouteAssociations,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [3]bool
}

// BusOrErr returns the Bus value or an error if the edge
// was not loaded in eager-loading.
func (e BusRouteEdges) BusOrErr() ([]*Bus, error) {
	if e.loadedTypes[0] {
		return e.Bus, nil
	}
	return nil, &NotLoadedError{edge: "bus"}
}

// ChildBusAssociationsOrErr returns the ChildBusAssociations value or an error if the edge
// was not loaded in eager-loading.
func (e BusRouteEdges) ChildBusAssociationsOrErr() ([]*ChildBusAssociation, error) {
	if e.loadedTypes[1] {
		return e.ChildBusAssociations, nil
	}
	return nil, &NotLoadedError{edge: "childBusAssociations"}
}

// BusRouteAssociationsOrErr returns the BusRouteAssociations value or an error if the edge
// was not loaded in eager-loading.
func (e BusRouteEdges) BusRouteAssociationsOrErr() ([]*BusRouteAssociation, error) {
	if e.loadedTypes[2] {
		return e.BusRouteAssociations, nil
	}
	return nil, &NotLoadedError{edge: "busRouteAssociations"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*BusRoute) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case busroute.FieldBusType:
			values[i] = new(sql.NullString)
		case busroute.FieldID:
			values[i] = new(uuid.UUID)
		default:
			values[i] = new(sql.UnknownType)
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the BusRoute fields.
func (br *BusRoute) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case busroute.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				br.ID = *value
			}
		case busroute.FieldBusType:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field bus_type", values[i])
			} else if value.Valid {
				br.BusType = busroute.BusType(value.String)
			}
		default:
			br.selectValues.Set(columns[i], values[i])
		}
	}
	return nil
}

// Value returns the ent.Value that was dynamically selected and assigned to the BusRoute.
// This includes values selected through modifiers, order, etc.
func (br *BusRoute) Value(name string) (ent.Value, error) {
	return br.selectValues.Get(name)
}

// QueryBus queries the "bus" edge of the BusRoute entity.
func (br *BusRoute) QueryBus() *BusQuery {
	return NewBusRouteClient(br.config).QueryBus(br)
}

// QueryChildBusAssociations queries the "childBusAssociations" edge of the BusRoute entity.
func (br *BusRoute) QueryChildBusAssociations() *ChildBusAssociationQuery {
	return NewBusRouteClient(br.config).QueryChildBusAssociations(br)
}

// QueryBusRouteAssociations queries the "busRouteAssociations" edge of the BusRoute entity.
func (br *BusRoute) QueryBusRouteAssociations() *BusRouteAssociationQuery {
	return NewBusRouteClient(br.config).QueryBusRouteAssociations(br)
}

// Update returns a builder for updating this BusRoute.
// Note that you need to call BusRoute.Unwrap() before calling this method if this BusRoute
// was returned from a transaction, and the transaction was committed or rolled back.
func (br *BusRoute) Update() *BusRouteUpdateOne {
	return NewBusRouteClient(br.config).UpdateOne(br)
}

// Unwrap unwraps the BusRoute entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (br *BusRoute) Unwrap() *BusRoute {
	_tx, ok := br.config.driver.(*txDriver)
	if !ok {
		panic("ent: BusRoute is not a transactional entity")
	}
	br.config.driver = _tx.drv
	return br
}

// String implements the fmt.Stringer.
func (br *BusRoute) String() string {
	var builder strings.Builder
	builder.WriteString("BusRoute(")
	builder.WriteString(fmt.Sprintf("id=%v, ", br.ID))
	builder.WriteString("bus_type=")
	builder.WriteString(fmt.Sprintf("%v", br.BusType))
	builder.WriteByte(')')
	return builder.String()
}

// BusRoutes is a parsable slice of BusRoute.
type BusRoutes []*BusRoute
