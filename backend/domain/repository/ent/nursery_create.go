// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	"github.com/google/uuid"
)

// NurseryCreate is the builder for creating a Nursery entity.
type NurseryCreate struct {
	config
	mutation *NurseryMutation
	hooks    []Hook
}

// SetNurseryCode sets the "nursery_code" field.
func (nc *NurseryCreate) SetNurseryCode(s string) *NurseryCreate {
	nc.mutation.SetNurseryCode(s)
	return nc
}

// SetEmail sets the "email" field.
func (nc *NurseryCreate) SetEmail(s string) *NurseryCreate {
	nc.mutation.SetEmail(s)
	return nc
}

// SetHashedPassword sets the "hashed_password" field.
func (nc *NurseryCreate) SetHashedPassword(s string) *NurseryCreate {
	nc.mutation.SetHashedPassword(s)
	return nc
}

// SetName sets the "name" field.
func (nc *NurseryCreate) SetName(s string) *NurseryCreate {
	nc.mutation.SetName(s)
	return nc
}

// SetAddress sets the "address" field.
func (nc *NurseryCreate) SetAddress(s string) *NurseryCreate {
	nc.mutation.SetAddress(s)
	return nc
}

// SetNillableAddress sets the "address" field if the given value is not nil.
func (nc *NurseryCreate) SetNillableAddress(s *string) *NurseryCreate {
	if s != nil {
		nc.SetAddress(*s)
	}
	return nc
}

// SetPhoneNumber sets the "phone_number" field.
func (nc *NurseryCreate) SetPhoneNumber(s string) *NurseryCreate {
	nc.mutation.SetPhoneNumber(s)
	return nc
}

// SetNillablePhoneNumber sets the "phone_number" field if the given value is not nil.
func (nc *NurseryCreate) SetNillablePhoneNumber(s *string) *NurseryCreate {
	if s != nil {
		nc.SetPhoneNumber(*s)
	}
	return nc
}

// SetCreatedAt sets the "created_at" field.
func (nc *NurseryCreate) SetCreatedAt(t time.Time) *NurseryCreate {
	nc.mutation.SetCreatedAt(t)
	return nc
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (nc *NurseryCreate) SetNillableCreatedAt(t *time.Time) *NurseryCreate {
	if t != nil {
		nc.SetCreatedAt(*t)
	}
	return nc
}

// SetUpdatedAt sets the "updated_at" field.
func (nc *NurseryCreate) SetUpdatedAt(t time.Time) *NurseryCreate {
	nc.mutation.SetUpdatedAt(t)
	return nc
}

// SetNillableUpdatedAt sets the "updated_at" field if the given value is not nil.
func (nc *NurseryCreate) SetNillableUpdatedAt(t *time.Time) *NurseryCreate {
	if t != nil {
		nc.SetUpdatedAt(*t)
	}
	return nc
}

// SetID sets the "id" field.
func (nc *NurseryCreate) SetID(u uuid.UUID) *NurseryCreate {
	nc.mutation.SetID(u)
	return nc
}

// SetNillableID sets the "id" field if the given value is not nil.
func (nc *NurseryCreate) SetNillableID(u *uuid.UUID) *NurseryCreate {
	if u != nil {
		nc.SetID(*u)
	}
	return nc
}

// AddGuardianIDs adds the "guardians" edge to the Guardian entity by IDs.
func (nc *NurseryCreate) AddGuardianIDs(ids ...uuid.UUID) *NurseryCreate {
	nc.mutation.AddGuardianIDs(ids...)
	return nc
}

// AddGuardians adds the "guardians" edges to the Guardian entity.
func (nc *NurseryCreate) AddGuardians(g ...*Guardian) *NurseryCreate {
	ids := make([]uuid.UUID, len(g))
	for i := range g {
		ids[i] = g[i].ID
	}
	return nc.AddGuardianIDs(ids...)
}

// AddBusIDs adds the "buses" edge to the Bus entity by IDs.
func (nc *NurseryCreate) AddBusIDs(ids ...uuid.UUID) *NurseryCreate {
	nc.mutation.AddBusIDs(ids...)
	return nc
}

// AddBuses adds the "buses" edges to the Bus entity.
func (nc *NurseryCreate) AddBuses(b ...*Bus) *NurseryCreate {
	ids := make([]uuid.UUID, len(b))
	for i := range b {
		ids[i] = b[i].ID
	}
	return nc.AddBusIDs(ids...)
}

// Mutation returns the NurseryMutation object of the builder.
func (nc *NurseryCreate) Mutation() *NurseryMutation {
	return nc.mutation
}

// Save creates the Nursery in the database.
func (nc *NurseryCreate) Save(ctx context.Context) (*Nursery, error) {
	nc.defaults()
	return withHooks(ctx, nc.sqlSave, nc.mutation, nc.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (nc *NurseryCreate) SaveX(ctx context.Context) *Nursery {
	v, err := nc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (nc *NurseryCreate) Exec(ctx context.Context) error {
	_, err := nc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (nc *NurseryCreate) ExecX(ctx context.Context) {
	if err := nc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (nc *NurseryCreate) defaults() {
	if _, ok := nc.mutation.CreatedAt(); !ok {
		v := nursery.DefaultCreatedAt()
		nc.mutation.SetCreatedAt(v)
	}
	if _, ok := nc.mutation.UpdatedAt(); !ok {
		v := nursery.DefaultUpdatedAt()
		nc.mutation.SetUpdatedAt(v)
	}
	if _, ok := nc.mutation.ID(); !ok {
		v := nursery.DefaultID()
		nc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (nc *NurseryCreate) check() error {
	if _, ok := nc.mutation.NurseryCode(); !ok {
		return &ValidationError{Name: "nursery_code", err: errors.New(`ent: missing required field "Nursery.nursery_code"`)}
	}
	if _, ok := nc.mutation.Email(); !ok {
		return &ValidationError{Name: "email", err: errors.New(`ent: missing required field "Nursery.email"`)}
	}
	if _, ok := nc.mutation.HashedPassword(); !ok {
		return &ValidationError{Name: "hashed_password", err: errors.New(`ent: missing required field "Nursery.hashed_password"`)}
	}
	if _, ok := nc.mutation.Name(); !ok {
		return &ValidationError{Name: "name", err: errors.New(`ent: missing required field "Nursery.name"`)}
	}
	if _, ok := nc.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "Nursery.created_at"`)}
	}
	if _, ok := nc.mutation.UpdatedAt(); !ok {
		return &ValidationError{Name: "updated_at", err: errors.New(`ent: missing required field "Nursery.updated_at"`)}
	}
	return nil
}

func (nc *NurseryCreate) sqlSave(ctx context.Context) (*Nursery, error) {
	if err := nc.check(); err != nil {
		return nil, err
	}
	_node, _spec := nc.createSpec()
	if err := sqlgraph.CreateNode(ctx, nc.driver, _spec); err != nil {
		if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	if _spec.ID.Value != nil {
		if id, ok := _spec.ID.Value.(*uuid.UUID); ok {
			_node.ID = *id
		} else if err := _node.ID.Scan(_spec.ID.Value); err != nil {
			return nil, err
		}
	}
	nc.mutation.id = &_node.ID
	nc.mutation.done = true
	return _node, nil
}

func (nc *NurseryCreate) createSpec() (*Nursery, *sqlgraph.CreateSpec) {
	var (
		_node = &Nursery{config: nc.config}
		_spec = sqlgraph.NewCreateSpec(nursery.Table, sqlgraph.NewFieldSpec(nursery.FieldID, field.TypeUUID))
	)
	if id, ok := nc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := nc.mutation.NurseryCode(); ok {
		_spec.SetField(nursery.FieldNurseryCode, field.TypeString, value)
		_node.NurseryCode = value
	}
	if value, ok := nc.mutation.Email(); ok {
		_spec.SetField(nursery.FieldEmail, field.TypeString, value)
		_node.Email = value
	}
	if value, ok := nc.mutation.HashedPassword(); ok {
		_spec.SetField(nursery.FieldHashedPassword, field.TypeString, value)
		_node.HashedPassword = value
	}
	if value, ok := nc.mutation.Name(); ok {
		_spec.SetField(nursery.FieldName, field.TypeString, value)
		_node.Name = value
	}
	if value, ok := nc.mutation.Address(); ok {
		_spec.SetField(nursery.FieldAddress, field.TypeString, value)
		_node.Address = value
	}
	if value, ok := nc.mutation.PhoneNumber(); ok {
		_spec.SetField(nursery.FieldPhoneNumber, field.TypeString, value)
		_node.PhoneNumber = value
	}
	if value, ok := nc.mutation.CreatedAt(); ok {
		_spec.SetField(nursery.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if value, ok := nc.mutation.UpdatedAt(); ok {
		_spec.SetField(nursery.FieldUpdatedAt, field.TypeTime, value)
		_node.UpdatedAt = value
	}
	if nodes := nc.mutation.GuardiansIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   nursery.GuardiansTable,
			Columns: []string{nursery.GuardiansColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(guardian.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := nc.mutation.BusesIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   nursery.BusesTable,
			Columns: []string{nursery.BusesColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(bus.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// NurseryCreateBulk is the builder for creating many Nursery entities in bulk.
type NurseryCreateBulk struct {
	config
	err      error
	builders []*NurseryCreate
}

// Save creates the Nursery entities in the database.
func (ncb *NurseryCreateBulk) Save(ctx context.Context) ([]*Nursery, error) {
	if ncb.err != nil {
		return nil, ncb.err
	}
	specs := make([]*sqlgraph.CreateSpec, len(ncb.builders))
	nodes := make([]*Nursery, len(ncb.builders))
	mutators := make([]Mutator, len(ncb.builders))
	for i := range ncb.builders {
		func(i int, root context.Context) {
			builder := ncb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*NurseryMutation)
				if !ok {
					return nil, fmt.Errorf("unexpected mutation type %T", m)
				}
				if err := builder.check(); err != nil {
					return nil, err
				}
				builder.mutation = mutation
				var err error
				nodes[i], specs[i] = builder.createSpec()
				if i < len(mutators)-1 {
					_, err = mutators[i+1].Mutate(root, ncb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, ncb.driver, spec); err != nil {
						if sqlgraph.IsConstraintError(err) {
							err = &ConstraintError{msg: err.Error(), wrap: err}
						}
					}
				}
				if err != nil {
					return nil, err
				}
				mutation.id = &nodes[i].ID
				mutation.done = true
				return nodes[i], nil
			})
			for i := len(builder.hooks) - 1; i >= 0; i-- {
				mut = builder.hooks[i](mut)
			}
			mutators[i] = mut
		}(i, ctx)
	}
	if len(mutators) > 0 {
		if _, err := mutators[0].Mutate(ctx, ncb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (ncb *NurseryCreateBulk) SaveX(ctx context.Context) []*Nursery {
	v, err := ncb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (ncb *NurseryCreateBulk) Exec(ctx context.Context) error {
	_, err := ncb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (ncb *NurseryCreateBulk) ExecX(ctx context.Context) {
	if err := ncb.Exec(ctx); err != nil {
		panic(err)
	}
}
