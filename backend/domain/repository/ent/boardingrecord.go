// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent"
	"entgo.io/ent/dialect/sql"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/boardingrecord"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/google/uuid"
)

// BoardingRecord is the model entity for the BoardingRecord schema.
type BoardingRecord struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// 乗降時刻
	Timestamp time.Time `json:"timestamp,omitempty"`
	// 乗車時はtrue、降車時はfalse
	IsBoarding bool `json:"is_boarding,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the BoardingRecordQuery when eager-loading is set.
	Edges                 BoardingRecordEdges `json:"edges"`
	bus_boarding_records  *uuid.UUID
	child_boarding_record *uuid.UUID
	selectValues          sql.SelectValues
}

// BoardingRecordEdges holds the relations/edges for other nodes in the graph.
type BoardingRecordEdges struct {
	// Child holds the value of the child edge.
	Child *Child `json:"child,omitempty"`
	// Bus holds the value of the bus edge.
	Bus *Bus `json:"bus,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [2]bool
}

// ChildOrErr returns the Child value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e BoardingRecordEdges) ChildOrErr() (*Child, error) {
	if e.loadedTypes[0] {
		if e.Child == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: child.Label}
		}
		return e.Child, nil
	}
	return nil, &NotLoadedError{edge: "child"}
}

// BusOrErr returns the Bus value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e BoardingRecordEdges) BusOrErr() (*Bus, error) {
	if e.loadedTypes[1] {
		if e.Bus == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: bus.Label}
		}
		return e.Bus, nil
	}
	return nil, &NotLoadedError{edge: "bus"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*BoardingRecord) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case boardingrecord.FieldIsBoarding:
			values[i] = new(sql.NullBool)
		case boardingrecord.FieldTimestamp:
			values[i] = new(sql.NullTime)
		case boardingrecord.FieldID:
			values[i] = new(uuid.UUID)
		case boardingrecord.ForeignKeys[0]: // bus_boarding_records
			values[i] = &sql.NullScanner{S: new(uuid.UUID)}
		case boardingrecord.ForeignKeys[1]: // child_boarding_record
			values[i] = &sql.NullScanner{S: new(uuid.UUID)}
		default:
			values[i] = new(sql.UnknownType)
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the BoardingRecord fields.
func (br *BoardingRecord) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case boardingrecord.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				br.ID = *value
			}
		case boardingrecord.FieldTimestamp:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field timestamp", values[i])
			} else if value.Valid {
				br.Timestamp = value.Time
			}
		case boardingrecord.FieldIsBoarding:
			if value, ok := values[i].(*sql.NullBool); !ok {
				return fmt.Errorf("unexpected type %T for field is_boarding", values[i])
			} else if value.Valid {
				br.IsBoarding = value.Bool
			}
		case boardingrecord.ForeignKeys[0]:
			if value, ok := values[i].(*sql.NullScanner); !ok {
				return fmt.Errorf("unexpected type %T for field bus_boarding_records", values[i])
			} else if value.Valid {
				br.bus_boarding_records = new(uuid.UUID)
				*br.bus_boarding_records = *value.S.(*uuid.UUID)
			}
		case boardingrecord.ForeignKeys[1]:
			if value, ok := values[i].(*sql.NullScanner); !ok {
				return fmt.Errorf("unexpected type %T for field child_boarding_record", values[i])
			} else if value.Valid {
				br.child_boarding_record = new(uuid.UUID)
				*br.child_boarding_record = *value.S.(*uuid.UUID)
			}
		default:
			br.selectValues.Set(columns[i], values[i])
		}
	}
	return nil
}

// Value returns the ent.Value that was dynamically selected and assigned to the BoardingRecord.
// This includes values selected through modifiers, order, etc.
func (br *BoardingRecord) Value(name string) (ent.Value, error) {
	return br.selectValues.Get(name)
}

// QueryChild queries the "child" edge of the BoardingRecord entity.
func (br *BoardingRecord) QueryChild() *ChildQuery {
	return NewBoardingRecordClient(br.config).QueryChild(br)
}

// QueryBus queries the "bus" edge of the BoardingRecord entity.
func (br *BoardingRecord) QueryBus() *BusQuery {
	return NewBoardingRecordClient(br.config).QueryBus(br)
}

// Update returns a builder for updating this BoardingRecord.
// Note that you need to call BoardingRecord.Unwrap() before calling this method if this BoardingRecord
// was returned from a transaction, and the transaction was committed or rolled back.
func (br *BoardingRecord) Update() *BoardingRecordUpdateOne {
	return NewBoardingRecordClient(br.config).UpdateOne(br)
}

// Unwrap unwraps the BoardingRecord entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (br *BoardingRecord) Unwrap() *BoardingRecord {
	_tx, ok := br.config.driver.(*txDriver)
	if !ok {
		panic("ent: BoardingRecord is not a transactional entity")
	}
	br.config.driver = _tx.drv
	return br
}

// String implements the fmt.Stringer.
func (br *BoardingRecord) String() string {
	var builder strings.Builder
	builder.WriteString("BoardingRecord(")
	builder.WriteString(fmt.Sprintf("id=%v, ", br.ID))
	builder.WriteString("timestamp=")
	builder.WriteString(br.Timestamp.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("is_boarding=")
	builder.WriteString(fmt.Sprintf("%v", br.IsBoarding))
	builder.WriteByte(')')
	return builder.String()
}

// BoardingRecords is a parsable slice of BoardingRecord.
type BoardingRecords []*BoardingRecord
