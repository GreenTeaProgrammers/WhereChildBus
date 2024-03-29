// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"

	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busroute"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childbusassociation"
	"github.com/google/uuid"
)

// ChildBusAssociationCreate is the builder for creating a ChildBusAssociation entity.
type ChildBusAssociationCreate struct {
	config
	mutation *ChildBusAssociationMutation
	hooks    []Hook
}

// SetChildID sets the "child_id" field.
func (cbac *ChildBusAssociationCreate) SetChildID(u uuid.UUID) *ChildBusAssociationCreate {
	cbac.mutation.SetChildID(u)
	return cbac
}

// SetBusRouteID sets the "bus_route_id" field.
func (cbac *ChildBusAssociationCreate) SetBusRouteID(u uuid.UUID) *ChildBusAssociationCreate {
	cbac.mutation.SetBusRouteID(u)
	return cbac
}

// SetChild sets the "child" edge to the Child entity.
func (cbac *ChildBusAssociationCreate) SetChild(c *Child) *ChildBusAssociationCreate {
	return cbac.SetChildID(c.ID)
}

// SetBusRoute sets the "bus_route" edge to the BusRoute entity.
func (cbac *ChildBusAssociationCreate) SetBusRoute(b *BusRoute) *ChildBusAssociationCreate {
	return cbac.SetBusRouteID(b.ID)
}

// Mutation returns the ChildBusAssociationMutation object of the builder.
func (cbac *ChildBusAssociationCreate) Mutation() *ChildBusAssociationMutation {
	return cbac.mutation
}

// Save creates the ChildBusAssociation in the database.
func (cbac *ChildBusAssociationCreate) Save(ctx context.Context) (*ChildBusAssociation, error) {
	return withHooks(ctx, cbac.sqlSave, cbac.mutation, cbac.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (cbac *ChildBusAssociationCreate) SaveX(ctx context.Context) *ChildBusAssociation {
	v, err := cbac.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (cbac *ChildBusAssociationCreate) Exec(ctx context.Context) error {
	_, err := cbac.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cbac *ChildBusAssociationCreate) ExecX(ctx context.Context) {
	if err := cbac.Exec(ctx); err != nil {
		panic(err)
	}
}

// check runs all checks and user-defined validators on the builder.
func (cbac *ChildBusAssociationCreate) check() error {
	if _, ok := cbac.mutation.ChildID(); !ok {
		return &ValidationError{Name: "child_id", err: errors.New(`ent: missing required field "ChildBusAssociation.child_id"`)}
	}
	if _, ok := cbac.mutation.BusRouteID(); !ok {
		return &ValidationError{Name: "bus_route_id", err: errors.New(`ent: missing required field "ChildBusAssociation.bus_route_id"`)}
	}
	if _, ok := cbac.mutation.ChildID(); !ok {
		return &ValidationError{Name: "child", err: errors.New(`ent: missing required edge "ChildBusAssociation.child"`)}
	}
	if _, ok := cbac.mutation.BusRouteID(); !ok {
		return &ValidationError{Name: "bus_route", err: errors.New(`ent: missing required edge "ChildBusAssociation.bus_route"`)}
	}
	return nil
}

func (cbac *ChildBusAssociationCreate) sqlSave(ctx context.Context) (*ChildBusAssociation, error) {
	if err := cbac.check(); err != nil {
		return nil, err
	}
	_node, _spec := cbac.createSpec()
	if err := sqlgraph.CreateNode(ctx, cbac.driver, _spec); err != nil {
		if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	id := _spec.ID.Value.(int64)
	_node.ID = int(id)
	cbac.mutation.id = &_node.ID
	cbac.mutation.done = true
	return _node, nil
}

func (cbac *ChildBusAssociationCreate) createSpec() (*ChildBusAssociation, *sqlgraph.CreateSpec) {
	var (
		_node = &ChildBusAssociation{config: cbac.config}
		_spec = sqlgraph.NewCreateSpec(childbusassociation.Table, sqlgraph.NewFieldSpec(childbusassociation.FieldID, field.TypeInt))
	)
	if nodes := cbac.mutation.ChildIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childbusassociation.ChildTable,
			Columns: []string{childbusassociation.ChildColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(child.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_node.ChildID = nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := cbac.mutation.BusRouteIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childbusassociation.BusRouteTable,
			Columns: []string{childbusassociation.BusRouteColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(busroute.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_node.BusRouteID = nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// ChildBusAssociationCreateBulk is the builder for creating many ChildBusAssociation entities in bulk.
type ChildBusAssociationCreateBulk struct {
	config
	err      error
	builders []*ChildBusAssociationCreate
}

// Save creates the ChildBusAssociation entities in the database.
func (cbacb *ChildBusAssociationCreateBulk) Save(ctx context.Context) ([]*ChildBusAssociation, error) {
	if cbacb.err != nil {
		return nil, cbacb.err
	}
	specs := make([]*sqlgraph.CreateSpec, len(cbacb.builders))
	nodes := make([]*ChildBusAssociation, len(cbacb.builders))
	mutators := make([]Mutator, len(cbacb.builders))
	for i := range cbacb.builders {
		func(i int, root context.Context) {
			builder := cbacb.builders[i]
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*ChildBusAssociationMutation)
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
					_, err = mutators[i+1].Mutate(root, cbacb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, cbacb.driver, spec); err != nil {
						if sqlgraph.IsConstraintError(err) {
							err = &ConstraintError{msg: err.Error(), wrap: err}
						}
					}
				}
				if err != nil {
					return nil, err
				}
				mutation.id = &nodes[i].ID
				if specs[i].ID.Value != nil {
					id := specs[i].ID.Value.(int64)
					nodes[i].ID = int(id)
				}
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
		if _, err := mutators[0].Mutate(ctx, cbacb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (cbacb *ChildBusAssociationCreateBulk) SaveX(ctx context.Context) []*ChildBusAssociation {
	v, err := cbacb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (cbacb *ChildBusAssociationCreateBulk) Exec(ctx context.Context) error {
	_, err := cbacb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cbacb *ChildBusAssociationCreateBulk) ExecX(ctx context.Context) {
	if err := cbacb.Exec(ctx); err != nil {
		panic(err)
	}
}
