// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
	"github.com/google/uuid"
)

// GuardianCreate is the builder for creating a Guardian entity.
type GuardianCreate struct {
	config
	mutation *GuardianMutation
	hooks    []Hook
}

// SetEmail sets the "email" field.
func (gc *GuardianCreate) SetEmail(s string) *GuardianCreate {
	gc.mutation.SetEmail(s)
	return gc
}

// SetHashedPassword sets the "hashed_password" field.
func (gc *GuardianCreate) SetHashedPassword(s string) *GuardianCreate {
	gc.mutation.SetHashedPassword(s)
	return gc
}

// SetName sets the "name" field.
func (gc *GuardianCreate) SetName(s string) *GuardianCreate {
	gc.mutation.SetName(s)
	return gc
}

// SetPhoneNumber sets the "phone_number" field.
func (gc *GuardianCreate) SetPhoneNumber(s string) *GuardianCreate {
	gc.mutation.SetPhoneNumber(s)
	return gc
}

// SetNillablePhoneNumber sets the "phone_number" field if the given value is not nil.
func (gc *GuardianCreate) SetNillablePhoneNumber(s *string) *GuardianCreate {
	if s != nil {
		gc.SetPhoneNumber(*s)
	}
	return gc
}

// SetIsUseMorningBus sets the "is_use_morning_bus" field.
func (gc *GuardianCreate) SetIsUseMorningBus(b bool) *GuardianCreate {
	gc.mutation.SetIsUseMorningBus(b)
	return gc
}

// SetNillableIsUseMorningBus sets the "is_use_morning_bus" field if the given value is not nil.
func (gc *GuardianCreate) SetNillableIsUseMorningBus(b *bool) *GuardianCreate {
	if b != nil {
		gc.SetIsUseMorningBus(*b)
	}
	return gc
}

// SetIsUseEveningBus sets the "is_use_evening_bus" field.
func (gc *GuardianCreate) SetIsUseEveningBus(b bool) *GuardianCreate {
	gc.mutation.SetIsUseEveningBus(b)
	return gc
}

// SetNillableIsUseEveningBus sets the "is_use_evening_bus" field if the given value is not nil.
func (gc *GuardianCreate) SetNillableIsUseEveningBus(b *bool) *GuardianCreate {
	if b != nil {
		gc.SetIsUseEveningBus(*b)
	}
	return gc
}

// SetCreatedAt sets the "created_at" field.
func (gc *GuardianCreate) SetCreatedAt(t time.Time) *GuardianCreate {
	gc.mutation.SetCreatedAt(t)
	return gc
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (gc *GuardianCreate) SetNillableCreatedAt(t *time.Time) *GuardianCreate {
	if t != nil {
		gc.SetCreatedAt(*t)
	}
	return gc
}

// SetUpdatedAt sets the "updated_at" field.
func (gc *GuardianCreate) SetUpdatedAt(t time.Time) *GuardianCreate {
	gc.mutation.SetUpdatedAt(t)
	return gc
}

// SetNillableUpdatedAt sets the "updated_at" field if the given value is not nil.
func (gc *GuardianCreate) SetNillableUpdatedAt(t *time.Time) *GuardianCreate {
	if t != nil {
		gc.SetUpdatedAt(*t)
	}
	return gc
}

// SetID sets the "id" field.
func (gc *GuardianCreate) SetID(u uuid.UUID) *GuardianCreate {
	gc.mutation.SetID(u)
	return gc
}

// SetNillableID sets the "id" field if the given value is not nil.
func (gc *GuardianCreate) SetNillableID(u *uuid.UUID) *GuardianCreate {
	if u != nil {
		gc.SetID(*u)
	}
	return gc
}

// AddChildIDs adds the "children" edge to the Child entity by IDs.
func (gc *GuardianCreate) AddChildIDs(ids ...uuid.UUID) *GuardianCreate {
	gc.mutation.AddChildIDs(ids...)
	return gc
}

// AddChildren adds the "children" edges to the Child entity.
func (gc *GuardianCreate) AddChildren(c ...*Child) *GuardianCreate {
	ids := make([]uuid.UUID, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return gc.AddChildIDs(ids...)
}

// SetNurseryID sets the "nursery" edge to the Nursery entity by ID.
func (gc *GuardianCreate) SetNurseryID(id uuid.UUID) *GuardianCreate {
	gc.mutation.SetNurseryID(id)
	return gc
}

// SetNillableNurseryID sets the "nursery" edge to the Nursery entity by ID if the given value is not nil.
func (gc *GuardianCreate) SetNillableNurseryID(id *uuid.UUID) *GuardianCreate {
	if id != nil {
		gc = gc.SetNurseryID(*id)
	}
	return gc
}

// SetNursery sets the "nursery" edge to the Nursery entity.
func (gc *GuardianCreate) SetNursery(n *Nursery) *GuardianCreate {
	return gc.SetNurseryID(n.ID)
}

// SetStationID sets the "station" edge to the Station entity by ID.
func (gc *GuardianCreate) SetStationID(id uuid.UUID) *GuardianCreate {
	gc.mutation.SetStationID(id)
	return gc
}

// SetNillableStationID sets the "station" edge to the Station entity by ID if the given value is not nil.
func (gc *GuardianCreate) SetNillableStationID(id *uuid.UUID) *GuardianCreate {
	if id != nil {
		gc = gc.SetStationID(*id)
	}
	return gc
}

// SetStation sets the "station" edge to the Station entity.
func (gc *GuardianCreate) SetStation(s *Station) *GuardianCreate {
	return gc.SetStationID(s.ID)
}

// Mutation returns the GuardianMutation object of the builder.
func (gc *GuardianCreate) Mutation() *GuardianMutation {
	return gc.mutation
}

// Save creates the Guardian in the database.
func (gc *GuardianCreate) Save(ctx context.Context) (*Guardian, error) {
	gc.defaults()
	return withHooks(ctx, gc.sqlSave, gc.mutation, gc.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (gc *GuardianCreate) SaveX(ctx context.Context) *Guardian {
	v, err := gc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (gc *GuardianCreate) Exec(ctx context.Context) error {
	_, err := gc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (gc *GuardianCreate) ExecX(ctx context.Context) {
	if err := gc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (gc *GuardianCreate) defaults() {
	if _, ok := gc.mutation.IsUseMorningBus(); !ok {
		v := guardian.DefaultIsUseMorningBus
		gc.mutation.SetIsUseMorningBus(v)
	}
	if _, ok := gc.mutation.IsUseEveningBus(); !ok {
		v := guardian.DefaultIsUseEveningBus
		gc.mutation.SetIsUseEveningBus(v)
	}
	if _, ok := gc.mutation.CreatedAt(); !ok {
		v := guardian.DefaultCreatedAt()
		gc.mutation.SetCreatedAt(v)
	}
	if _, ok := gc.mutation.UpdatedAt(); !ok {
		v := guardian.DefaultUpdatedAt()
		gc.mutation.SetUpdatedAt(v)
	}
	if _, ok := gc.mutation.ID(); !ok {
		v := guardian.DefaultID()
		gc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (gc *GuardianCreate) check() error {
	if _, ok := gc.mutation.Email(); !ok {
		return &ValidationError{Name: "email", err: errors.New(`ent: missing required field "Guardian.email"`)}
	}
	if _, ok := gc.mutation.HashedPassword(); !ok {
		return &ValidationError{Name: "hashed_password", err: errors.New(`ent: missing required field "Guardian.hashed_password"`)}
	}
	if _, ok := gc.mutation.Name(); !ok {
		return &ValidationError{Name: "name", err: errors.New(`ent: missing required field "Guardian.name"`)}
	}
	if _, ok := gc.mutation.IsUseMorningBus(); !ok {
		return &ValidationError{Name: "is_use_morning_bus", err: errors.New(`ent: missing required field "Guardian.is_use_morning_bus"`)}
	}
	if _, ok := gc.mutation.IsUseEveningBus(); !ok {
		return &ValidationError{Name: "is_use_evening_bus", err: errors.New(`ent: missing required field "Guardian.is_use_evening_bus"`)}
	}
	if _, ok := gc.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "Guardian.created_at"`)}
	}
	if _, ok := gc.mutation.UpdatedAt(); !ok {
		return &ValidationError{Name: "updated_at", err: errors.New(`ent: missing required field "Guardian.updated_at"`)}
	}
	return nil
}

func (gc *GuardianCreate) sqlSave(ctx context.Context) (*Guardian, error) {
	if err := gc.check(); err != nil {
		return nil, err
	}
	_node, _spec := gc.createSpec()
	if err := sqlgraph.CreateNode(ctx, gc.driver, _spec); err != nil {
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
	gc.mutation.id = &_node.ID
	gc.mutation.done = true
	return _node, nil
}

func (gc *GuardianCreate) createSpec() (*Guardian, *sqlgraph.CreateSpec) {
	var (
		_node = &Guardian{config: gc.config}
		_spec = sqlgraph.NewCreateSpec(guardian.Table, sqlgraph.NewFieldSpec(guardian.FieldID, field.TypeUUID))
	)
	if id, ok := gc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := gc.mutation.Email(); ok {
		_spec.SetField(guardian.FieldEmail, field.TypeString, value)
		_node.Email = value
	}
	if value, ok := gc.mutation.HashedPassword(); ok {
		_spec.SetField(guardian.FieldHashedPassword, field.TypeString, value)
		_node.HashedPassword = value
	}
	if value, ok := gc.mutation.Name(); ok {
		_spec.SetField(guardian.FieldName, field.TypeString, value)
		_node.Name = value
	}
	if value, ok := gc.mutation.PhoneNumber(); ok {
		_spec.SetField(guardian.FieldPhoneNumber, field.TypeString, value)
		_node.PhoneNumber = value
	}
	if value, ok := gc.mutation.IsUseMorningBus(); ok {
		_spec.SetField(guardian.FieldIsUseMorningBus, field.TypeBool, value)
		_node.IsUseMorningBus = value
	}
	if value, ok := gc.mutation.IsUseEveningBus(); ok {
		_spec.SetField(guardian.FieldIsUseEveningBus, field.TypeBool, value)
		_node.IsUseEveningBus = value
	}
	if value, ok := gc.mutation.CreatedAt(); ok {
		_spec.SetField(guardian.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if value, ok := gc.mutation.UpdatedAt(); ok {
		_spec.SetField(guardian.FieldUpdatedAt, field.TypeTime, value)
		_node.UpdatedAt = value
	}
	if nodes := gc.mutation.ChildrenIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: false,
			Table:   guardian.ChildrenTable,
			Columns: []string{guardian.ChildrenColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(child.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := gc.mutation.NurseryIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   guardian.NurseryTable,
			Columns: []string{guardian.NurseryColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(nursery.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_node.guardian_nursery = &nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := gc.mutation.StationIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2O,
			Inverse: false,
			Table:   guardian.StationTable,
			Columns: []string{guardian.StationColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(station.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// GuardianCreateBulk is the builder for creating many Guardian entities in bulk.
type GuardianCreateBulk struct {
	config
	err      error
	builders []*GuardianCreate
}

// Save creates the Guardian entities in the database.
func (gcb *GuardianCreateBulk) Save(ctx context.Context) ([]*Guardian, error) {
	if gcb.err != nil {
		return nil, gcb.err
	}
	specs := make([]*sqlgraph.CreateSpec, len(gcb.builders))
	nodes := make([]*Guardian, len(gcb.builders))
	mutators := make([]Mutator, len(gcb.builders))
	for i := range gcb.builders {
		func(i int, root context.Context) {
			builder := gcb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*GuardianMutation)
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
					_, err = mutators[i+1].Mutate(root, gcb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, gcb.driver, spec); err != nil {
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
		if _, err := mutators[0].Mutate(ctx, gcb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (gcb *GuardianCreateBulk) SaveX(ctx context.Context) []*Guardian {
	v, err := gcb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (gcb *GuardianCreateBulk) Exec(ctx context.Context) error {
	_, err := gcb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (gcb *GuardianCreateBulk) ExecX(ctx context.Context) {
	if err := gcb.Exec(ctx); err != nil {
		panic(err)
	}
}
