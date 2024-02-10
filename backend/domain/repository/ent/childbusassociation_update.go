// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childbusassociation"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ChildBusAssociationUpdate is the builder for updating ChildBusAssociation entities.
type ChildBusAssociationUpdate struct {
	config
	hooks    []Hook
	mutation *ChildBusAssociationMutation
}

// Where appends a list predicates to the ChildBusAssociationUpdate builder.
func (cbau *ChildBusAssociationUpdate) Where(ps ...predicate.ChildBusAssociation) *ChildBusAssociationUpdate {
	cbau.mutation.Where(ps...)
	return cbau
}

// SetChildID sets the "child_id" field.
func (cbau *ChildBusAssociationUpdate) SetChildID(u uuid.UUID) *ChildBusAssociationUpdate {
	cbau.mutation.SetChildID(u)
	return cbau
}

// SetNillableChildID sets the "child_id" field if the given value is not nil.
func (cbau *ChildBusAssociationUpdate) SetNillableChildID(u *uuid.UUID) *ChildBusAssociationUpdate {
	if u != nil {
		cbau.SetChildID(*u)
	}
	return cbau
}

// SetBusID sets the "bus_id" field.
func (cbau *ChildBusAssociationUpdate) SetBusID(u uuid.UUID) *ChildBusAssociationUpdate {
	cbau.mutation.SetBusID(u)
	return cbau
}

// SetNillableBusID sets the "bus_id" field if the given value is not nil.
func (cbau *ChildBusAssociationUpdate) SetNillableBusID(u *uuid.UUID) *ChildBusAssociationUpdate {
	if u != nil {
		cbau.SetBusID(*u)
	}
	return cbau
}

// SetBusType sets the "bus_type" field.
func (cbau *ChildBusAssociationUpdate) SetBusType(ct childbusassociation.BusType) *ChildBusAssociationUpdate {
	cbau.mutation.SetBusType(ct)
	return cbau
}

// SetNillableBusType sets the "bus_type" field if the given value is not nil.
func (cbau *ChildBusAssociationUpdate) SetNillableBusType(ct *childbusassociation.BusType) *ChildBusAssociationUpdate {
	if ct != nil {
		cbau.SetBusType(*ct)
	}
	return cbau
}

// SetChild sets the "child" edge to the Child entity.
func (cbau *ChildBusAssociationUpdate) SetChild(c *Child) *ChildBusAssociationUpdate {
	return cbau.SetChildID(c.ID)
}

// SetBus sets the "bus" edge to the Bus entity.
func (cbau *ChildBusAssociationUpdate) SetBus(b *Bus) *ChildBusAssociationUpdate {
	return cbau.SetBusID(b.ID)
}

// Mutation returns the ChildBusAssociationMutation object of the builder.
func (cbau *ChildBusAssociationUpdate) Mutation() *ChildBusAssociationMutation {
	return cbau.mutation
}

// ClearChild clears the "child" edge to the Child entity.
func (cbau *ChildBusAssociationUpdate) ClearChild() *ChildBusAssociationUpdate {
	cbau.mutation.ClearChild()
	return cbau
}

// ClearBus clears the "bus" edge to the Bus entity.
func (cbau *ChildBusAssociationUpdate) ClearBus() *ChildBusAssociationUpdate {
	cbau.mutation.ClearBus()
	return cbau
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (cbau *ChildBusAssociationUpdate) Save(ctx context.Context) (int, error) {
	return withHooks(ctx, cbau.sqlSave, cbau.mutation, cbau.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (cbau *ChildBusAssociationUpdate) SaveX(ctx context.Context) int {
	affected, err := cbau.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (cbau *ChildBusAssociationUpdate) Exec(ctx context.Context) error {
	_, err := cbau.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cbau *ChildBusAssociationUpdate) ExecX(ctx context.Context) {
	if err := cbau.Exec(ctx); err != nil {
		panic(err)
	}
}

// check runs all checks and user-defined validators on the builder.
func (cbau *ChildBusAssociationUpdate) check() error {
	if v, ok := cbau.mutation.BusType(); ok {
		if err := childbusassociation.BusTypeValidator(v); err != nil {
			return &ValidationError{Name: "bus_type", err: fmt.Errorf(`ent: validator failed for field "ChildBusAssociation.bus_type": %w`, err)}
		}
	}
	if _, ok := cbau.mutation.ChildID(); cbau.mutation.ChildCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "ChildBusAssociation.child"`)
	}
	if _, ok := cbau.mutation.BusID(); cbau.mutation.BusCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "ChildBusAssociation.bus"`)
	}
	return nil
}

func (cbau *ChildBusAssociationUpdate) sqlSave(ctx context.Context) (n int, err error) {
	if err := cbau.check(); err != nil {
		return n, err
	}
	_spec := sqlgraph.NewUpdateSpec(childbusassociation.Table, childbusassociation.Columns, sqlgraph.NewFieldSpec(childbusassociation.FieldID, field.TypeInt))
	if ps := cbau.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := cbau.mutation.BusType(); ok {
		_spec.SetField(childbusassociation.FieldBusType, field.TypeEnum, value)
	}
	if cbau.mutation.ChildCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cbau.mutation.ChildIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if cbau.mutation.BusCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childbusassociation.BusTable,
			Columns: []string{childbusassociation.BusColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(bus.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cbau.mutation.BusIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childbusassociation.BusTable,
			Columns: []string{childbusassociation.BusColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(bus.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if n, err = sqlgraph.UpdateNodes(ctx, cbau.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{childbusassociation.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	cbau.mutation.done = true
	return n, nil
}

// ChildBusAssociationUpdateOne is the builder for updating a single ChildBusAssociation entity.
type ChildBusAssociationUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *ChildBusAssociationMutation
}

// SetChildID sets the "child_id" field.
func (cbauo *ChildBusAssociationUpdateOne) SetChildID(u uuid.UUID) *ChildBusAssociationUpdateOne {
	cbauo.mutation.SetChildID(u)
	return cbauo
}

// SetNillableChildID sets the "child_id" field if the given value is not nil.
func (cbauo *ChildBusAssociationUpdateOne) SetNillableChildID(u *uuid.UUID) *ChildBusAssociationUpdateOne {
	if u != nil {
		cbauo.SetChildID(*u)
	}
	return cbauo
}

// SetBusID sets the "bus_id" field.
func (cbauo *ChildBusAssociationUpdateOne) SetBusID(u uuid.UUID) *ChildBusAssociationUpdateOne {
	cbauo.mutation.SetBusID(u)
	return cbauo
}

// SetNillableBusID sets the "bus_id" field if the given value is not nil.
func (cbauo *ChildBusAssociationUpdateOne) SetNillableBusID(u *uuid.UUID) *ChildBusAssociationUpdateOne {
	if u != nil {
		cbauo.SetBusID(*u)
	}
	return cbauo
}

// SetBusType sets the "bus_type" field.
func (cbauo *ChildBusAssociationUpdateOne) SetBusType(ct childbusassociation.BusType) *ChildBusAssociationUpdateOne {
	cbauo.mutation.SetBusType(ct)
	return cbauo
}

// SetNillableBusType sets the "bus_type" field if the given value is not nil.
func (cbauo *ChildBusAssociationUpdateOne) SetNillableBusType(ct *childbusassociation.BusType) *ChildBusAssociationUpdateOne {
	if ct != nil {
		cbauo.SetBusType(*ct)
	}
	return cbauo
}

// SetChild sets the "child" edge to the Child entity.
func (cbauo *ChildBusAssociationUpdateOne) SetChild(c *Child) *ChildBusAssociationUpdateOne {
	return cbauo.SetChildID(c.ID)
}

// SetBus sets the "bus" edge to the Bus entity.
func (cbauo *ChildBusAssociationUpdateOne) SetBus(b *Bus) *ChildBusAssociationUpdateOne {
	return cbauo.SetBusID(b.ID)
}

// Mutation returns the ChildBusAssociationMutation object of the builder.
func (cbauo *ChildBusAssociationUpdateOne) Mutation() *ChildBusAssociationMutation {
	return cbauo.mutation
}

// ClearChild clears the "child" edge to the Child entity.
func (cbauo *ChildBusAssociationUpdateOne) ClearChild() *ChildBusAssociationUpdateOne {
	cbauo.mutation.ClearChild()
	return cbauo
}

// ClearBus clears the "bus" edge to the Bus entity.
func (cbauo *ChildBusAssociationUpdateOne) ClearBus() *ChildBusAssociationUpdateOne {
	cbauo.mutation.ClearBus()
	return cbauo
}

// Where appends a list predicates to the ChildBusAssociationUpdate builder.
func (cbauo *ChildBusAssociationUpdateOne) Where(ps ...predicate.ChildBusAssociation) *ChildBusAssociationUpdateOne {
	cbauo.mutation.Where(ps...)
	return cbauo
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (cbauo *ChildBusAssociationUpdateOne) Select(field string, fields ...string) *ChildBusAssociationUpdateOne {
	cbauo.fields = append([]string{field}, fields...)
	return cbauo
}

// Save executes the query and returns the updated ChildBusAssociation entity.
func (cbauo *ChildBusAssociationUpdateOne) Save(ctx context.Context) (*ChildBusAssociation, error) {
	return withHooks(ctx, cbauo.sqlSave, cbauo.mutation, cbauo.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (cbauo *ChildBusAssociationUpdateOne) SaveX(ctx context.Context) *ChildBusAssociation {
	node, err := cbauo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (cbauo *ChildBusAssociationUpdateOne) Exec(ctx context.Context) error {
	_, err := cbauo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cbauo *ChildBusAssociationUpdateOne) ExecX(ctx context.Context) {
	if err := cbauo.Exec(ctx); err != nil {
		panic(err)
	}
}

// check runs all checks and user-defined validators on the builder.
func (cbauo *ChildBusAssociationUpdateOne) check() error {
	if v, ok := cbauo.mutation.BusType(); ok {
		if err := childbusassociation.BusTypeValidator(v); err != nil {
			return &ValidationError{Name: "bus_type", err: fmt.Errorf(`ent: validator failed for field "ChildBusAssociation.bus_type": %w`, err)}
		}
	}
	if _, ok := cbauo.mutation.ChildID(); cbauo.mutation.ChildCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "ChildBusAssociation.child"`)
	}
	if _, ok := cbauo.mutation.BusID(); cbauo.mutation.BusCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "ChildBusAssociation.bus"`)
	}
	return nil
}

func (cbauo *ChildBusAssociationUpdateOne) sqlSave(ctx context.Context) (_node *ChildBusAssociation, err error) {
	if err := cbauo.check(); err != nil {
		return _node, err
	}
	_spec := sqlgraph.NewUpdateSpec(childbusassociation.Table, childbusassociation.Columns, sqlgraph.NewFieldSpec(childbusassociation.FieldID, field.TypeInt))
	id, ok := cbauo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "ChildBusAssociation.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := cbauo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, childbusassociation.FieldID)
		for _, f := range fields {
			if !childbusassociation.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != childbusassociation.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := cbauo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := cbauo.mutation.BusType(); ok {
		_spec.SetField(childbusassociation.FieldBusType, field.TypeEnum, value)
	}
	if cbauo.mutation.ChildCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cbauo.mutation.ChildIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if cbauo.mutation.BusCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childbusassociation.BusTable,
			Columns: []string{childbusassociation.BusColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(bus.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cbauo.mutation.BusIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childbusassociation.BusTable,
			Columns: []string{childbusassociation.BusColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(bus.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	_node = &ChildBusAssociation{config: cbauo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, cbauo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{childbusassociation.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	cbauo.mutation.done = true
	return _node, nil
}
