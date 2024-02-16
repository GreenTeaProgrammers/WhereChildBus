// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent"
	"entgo.io/ent/dialect/sql"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	"github.com/google/uuid"
)

// Nursery is the model entity for the Nursery schema.
type Nursery struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// ユニークな数字(文字列)のコード
	NurseryCode string `json:"nursery_code,omitempty"`
	// Email holds the value of the "email" field.
	Email string `json:"email,omitempty"`
	// HashedPassword holds the value of the "hashed_password" field.
	HashedPassword string `json:"hashed_password,omitempty"`
	// Name holds the value of the "name" field.
	Name string `json:"name,omitempty"`
	// Address holds the value of the "address" field.
	Address string `json:"address,omitempty"`
	// PhoneNumber holds the value of the "phone_number" field.
	PhoneNumber string `json:"phone_number,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// UpdatedAt holds the value of the "updated_at" field.
	UpdatedAt time.Time `json:"updated_at,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the NurseryQuery when eager-loading is set.
	Edges        NurseryEdges `json:"edges"`
	selectValues sql.SelectValues
}

// NurseryEdges holds the relations/edges for other nodes in the graph.
type NurseryEdges struct {
	// Guardians holds the value of the guardians edge.
	Guardians []*Guardian `json:"guardians,omitempty"`
	// Buses holds the value of the buses edge.
	Buses []*Bus `json:"buses,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [2]bool
}

// GuardiansOrErr returns the Guardians value or an error if the edge
// was not loaded in eager-loading.
func (e NurseryEdges) GuardiansOrErr() ([]*Guardian, error) {
	if e.loadedTypes[0] {
		return e.Guardians, nil
	}
	return nil, &NotLoadedError{edge: "guardians"}
}

// BusesOrErr returns the Buses value or an error if the edge
// was not loaded in eager-loading.
func (e NurseryEdges) BusesOrErr() ([]*Bus, error) {
	if e.loadedTypes[1] {
		return e.Buses, nil
	}
	return nil, &NotLoadedError{edge: "buses"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*Nursery) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case nursery.FieldNurseryCode, nursery.FieldEmail, nursery.FieldHashedPassword, nursery.FieldName, nursery.FieldAddress, nursery.FieldPhoneNumber:
			values[i] = new(sql.NullString)
		case nursery.FieldCreatedAt, nursery.FieldUpdatedAt:
			values[i] = new(sql.NullTime)
		case nursery.FieldID:
			values[i] = new(uuid.UUID)
		default:
			values[i] = new(sql.UnknownType)
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the Nursery fields.
func (n *Nursery) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case nursery.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				n.ID = *value
			}
		case nursery.FieldNurseryCode:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field nursery_code", values[i])
			} else if value.Valid {
				n.NurseryCode = value.String
			}
		case nursery.FieldEmail:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field email", values[i])
			} else if value.Valid {
				n.Email = value.String
			}
		case nursery.FieldHashedPassword:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field hashed_password", values[i])
			} else if value.Valid {
				n.HashedPassword = value.String
			}
		case nursery.FieldName:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field name", values[i])
			} else if value.Valid {
				n.Name = value.String
			}
		case nursery.FieldAddress:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field address", values[i])
			} else if value.Valid {
				n.Address = value.String
			}
		case nursery.FieldPhoneNumber:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field phone_number", values[i])
			} else if value.Valid {
				n.PhoneNumber = value.String
			}
		case nursery.FieldCreatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[i])
			} else if value.Valid {
				n.CreatedAt = value.Time
			}
		case nursery.FieldUpdatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field updated_at", values[i])
			} else if value.Valid {
				n.UpdatedAt = value.Time
			}
		default:
			n.selectValues.Set(columns[i], values[i])
		}
	}
	return nil
}

// Value returns the ent.Value that was dynamically selected and assigned to the Nursery.
// This includes values selected through modifiers, order, etc.
func (n *Nursery) Value(name string) (ent.Value, error) {
	return n.selectValues.Get(name)
}

// QueryGuardians queries the "guardians" edge of the Nursery entity.
func (n *Nursery) QueryGuardians() *GuardianQuery {
	return NewNurseryClient(n.config).QueryGuardians(n)
}

// QueryBuses queries the "buses" edge of the Nursery entity.
func (n *Nursery) QueryBuses() *BusQuery {
	return NewNurseryClient(n.config).QueryBuses(n)
}

// Update returns a builder for updating this Nursery.
// Note that you need to call Nursery.Unwrap() before calling this method if this Nursery
// was returned from a transaction, and the transaction was committed or rolled back.
func (n *Nursery) Update() *NurseryUpdateOne {
	return NewNurseryClient(n.config).UpdateOne(n)
}

// Unwrap unwraps the Nursery entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (n *Nursery) Unwrap() *Nursery {
	_tx, ok := n.config.driver.(*txDriver)
	if !ok {
		panic("ent: Nursery is not a transactional entity")
	}
	n.config.driver = _tx.drv
	return n
}

// String implements the fmt.Stringer.
func (n *Nursery) String() string {
	var builder strings.Builder
	builder.WriteString("Nursery(")
	builder.WriteString(fmt.Sprintf("id=%v, ", n.ID))
	builder.WriteString("nursery_code=")
	builder.WriteString(n.NurseryCode)
	builder.WriteString(", ")
	builder.WriteString("email=")
	builder.WriteString(n.Email)
	builder.WriteString(", ")
	builder.WriteString("hashed_password=")
	builder.WriteString(n.HashedPassword)
	builder.WriteString(", ")
	builder.WriteString("name=")
	builder.WriteString(n.Name)
	builder.WriteString(", ")
	builder.WriteString("address=")
	builder.WriteString(n.Address)
	builder.WriteString(", ")
	builder.WriteString("phone_number=")
	builder.WriteString(n.PhoneNumber)
	builder.WriteString(", ")
	builder.WriteString("created_at=")
	builder.WriteString(n.CreatedAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("updated_at=")
	builder.WriteString(n.UpdatedAt.Format(time.ANSIC))
	builder.WriteByte(')')
	return builder.String()
}

// Nurseries is a parsable slice of Nursery.
type Nurseries []*Nursery
