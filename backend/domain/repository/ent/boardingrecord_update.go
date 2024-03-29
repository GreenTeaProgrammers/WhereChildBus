// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/boardingrecord"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// BoardingRecordUpdate is the builder for updating BoardingRecord entities.
type BoardingRecordUpdate struct {
	config
	hooks    []Hook
	mutation *BoardingRecordMutation
}

// Where appends a list predicates to the BoardingRecordUpdate builder.
func (bru *BoardingRecordUpdate) Where(ps ...predicate.BoardingRecord) *BoardingRecordUpdate {
	bru.mutation.Where(ps...)
	return bru
}

// SetTimestamp sets the "timestamp" field.
func (bru *BoardingRecordUpdate) SetTimestamp(t time.Time) *BoardingRecordUpdate {
	bru.mutation.SetTimestamp(t)
	return bru
}

// SetNillableTimestamp sets the "timestamp" field if the given value is not nil.
func (bru *BoardingRecordUpdate) SetNillableTimestamp(t *time.Time) *BoardingRecordUpdate {
	if t != nil {
		bru.SetTimestamp(*t)
	}
	return bru
}

// SetIsBoarding sets the "is_boarding" field.
func (bru *BoardingRecordUpdate) SetIsBoarding(b bool) *BoardingRecordUpdate {
	bru.mutation.SetIsBoarding(b)
	return bru
}

// SetNillableIsBoarding sets the "is_boarding" field if the given value is not nil.
func (bru *BoardingRecordUpdate) SetNillableIsBoarding(b *bool) *BoardingRecordUpdate {
	if b != nil {
		bru.SetIsBoarding(*b)
	}
	return bru
}

// SetChildID sets the "child" edge to the Child entity by ID.
func (bru *BoardingRecordUpdate) SetChildID(id uuid.UUID) *BoardingRecordUpdate {
	bru.mutation.SetChildID(id)
	return bru
}

// SetNillableChildID sets the "child" edge to the Child entity by ID if the given value is not nil.
func (bru *BoardingRecordUpdate) SetNillableChildID(id *uuid.UUID) *BoardingRecordUpdate {
	if id != nil {
		bru = bru.SetChildID(*id)
	}
	return bru
}

// SetChild sets the "child" edge to the Child entity.
func (bru *BoardingRecordUpdate) SetChild(c *Child) *BoardingRecordUpdate {
	return bru.SetChildID(c.ID)
}

// SetBusID sets the "bus" edge to the Bus entity by ID.
func (bru *BoardingRecordUpdate) SetBusID(id uuid.UUID) *BoardingRecordUpdate {
	bru.mutation.SetBusID(id)
	return bru
}

// SetNillableBusID sets the "bus" edge to the Bus entity by ID if the given value is not nil.
func (bru *BoardingRecordUpdate) SetNillableBusID(id *uuid.UUID) *BoardingRecordUpdate {
	if id != nil {
		bru = bru.SetBusID(*id)
	}
	return bru
}

// SetBus sets the "bus" edge to the Bus entity.
func (bru *BoardingRecordUpdate) SetBus(b *Bus) *BoardingRecordUpdate {
	return bru.SetBusID(b.ID)
}

// Mutation returns the BoardingRecordMutation object of the builder.
func (bru *BoardingRecordUpdate) Mutation() *BoardingRecordMutation {
	return bru.mutation
}

// ClearChild clears the "child" edge to the Child entity.
func (bru *BoardingRecordUpdate) ClearChild() *BoardingRecordUpdate {
	bru.mutation.ClearChild()
	return bru
}

// ClearBus clears the "bus" edge to the Bus entity.
func (bru *BoardingRecordUpdate) ClearBus() *BoardingRecordUpdate {
	bru.mutation.ClearBus()
	return bru
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (bru *BoardingRecordUpdate) Save(ctx context.Context) (int, error) {
	return withHooks(ctx, bru.sqlSave, bru.mutation, bru.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (bru *BoardingRecordUpdate) SaveX(ctx context.Context) int {
	affected, err := bru.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (bru *BoardingRecordUpdate) Exec(ctx context.Context) error {
	_, err := bru.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (bru *BoardingRecordUpdate) ExecX(ctx context.Context) {
	if err := bru.Exec(ctx); err != nil {
		panic(err)
	}
}

func (bru *BoardingRecordUpdate) sqlSave(ctx context.Context) (n int, err error) {
	_spec := sqlgraph.NewUpdateSpec(boardingrecord.Table, boardingrecord.Columns, sqlgraph.NewFieldSpec(boardingrecord.FieldID, field.TypeUUID))
	if ps := bru.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := bru.mutation.Timestamp(); ok {
		_spec.SetField(boardingrecord.FieldTimestamp, field.TypeTime, value)
	}
	if value, ok := bru.mutation.IsBoarding(); ok {
		_spec.SetField(boardingrecord.FieldIsBoarding, field.TypeBool, value)
	}
	if bru.mutation.ChildCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   boardingrecord.ChildTable,
			Columns: []string{boardingrecord.ChildColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(child.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := bru.mutation.ChildIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   boardingrecord.ChildTable,
			Columns: []string{boardingrecord.ChildColumn},
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
	if bru.mutation.BusCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   boardingrecord.BusTable,
			Columns: []string{boardingrecord.BusColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(bus.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := bru.mutation.BusIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   boardingrecord.BusTable,
			Columns: []string{boardingrecord.BusColumn},
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
	if n, err = sqlgraph.UpdateNodes(ctx, bru.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{boardingrecord.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	bru.mutation.done = true
	return n, nil
}

// BoardingRecordUpdateOne is the builder for updating a single BoardingRecord entity.
type BoardingRecordUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *BoardingRecordMutation
}

// SetTimestamp sets the "timestamp" field.
func (bruo *BoardingRecordUpdateOne) SetTimestamp(t time.Time) *BoardingRecordUpdateOne {
	bruo.mutation.SetTimestamp(t)
	return bruo
}

// SetNillableTimestamp sets the "timestamp" field if the given value is not nil.
func (bruo *BoardingRecordUpdateOne) SetNillableTimestamp(t *time.Time) *BoardingRecordUpdateOne {
	if t != nil {
		bruo.SetTimestamp(*t)
	}
	return bruo
}

// SetIsBoarding sets the "is_boarding" field.
func (bruo *BoardingRecordUpdateOne) SetIsBoarding(b bool) *BoardingRecordUpdateOne {
	bruo.mutation.SetIsBoarding(b)
	return bruo
}

// SetNillableIsBoarding sets the "is_boarding" field if the given value is not nil.
func (bruo *BoardingRecordUpdateOne) SetNillableIsBoarding(b *bool) *BoardingRecordUpdateOne {
	if b != nil {
		bruo.SetIsBoarding(*b)
	}
	return bruo
}

// SetChildID sets the "child" edge to the Child entity by ID.
func (bruo *BoardingRecordUpdateOne) SetChildID(id uuid.UUID) *BoardingRecordUpdateOne {
	bruo.mutation.SetChildID(id)
	return bruo
}

// SetNillableChildID sets the "child" edge to the Child entity by ID if the given value is not nil.
func (bruo *BoardingRecordUpdateOne) SetNillableChildID(id *uuid.UUID) *BoardingRecordUpdateOne {
	if id != nil {
		bruo = bruo.SetChildID(*id)
	}
	return bruo
}

// SetChild sets the "child" edge to the Child entity.
func (bruo *BoardingRecordUpdateOne) SetChild(c *Child) *BoardingRecordUpdateOne {
	return bruo.SetChildID(c.ID)
}

// SetBusID sets the "bus" edge to the Bus entity by ID.
func (bruo *BoardingRecordUpdateOne) SetBusID(id uuid.UUID) *BoardingRecordUpdateOne {
	bruo.mutation.SetBusID(id)
	return bruo
}

// SetNillableBusID sets the "bus" edge to the Bus entity by ID if the given value is not nil.
func (bruo *BoardingRecordUpdateOne) SetNillableBusID(id *uuid.UUID) *BoardingRecordUpdateOne {
	if id != nil {
		bruo = bruo.SetBusID(*id)
	}
	return bruo
}

// SetBus sets the "bus" edge to the Bus entity.
func (bruo *BoardingRecordUpdateOne) SetBus(b *Bus) *BoardingRecordUpdateOne {
	return bruo.SetBusID(b.ID)
}

// Mutation returns the BoardingRecordMutation object of the builder.
func (bruo *BoardingRecordUpdateOne) Mutation() *BoardingRecordMutation {
	return bruo.mutation
}

// ClearChild clears the "child" edge to the Child entity.
func (bruo *BoardingRecordUpdateOne) ClearChild() *BoardingRecordUpdateOne {
	bruo.mutation.ClearChild()
	return bruo
}

// ClearBus clears the "bus" edge to the Bus entity.
func (bruo *BoardingRecordUpdateOne) ClearBus() *BoardingRecordUpdateOne {
	bruo.mutation.ClearBus()
	return bruo
}

// Where appends a list predicates to the BoardingRecordUpdate builder.
func (bruo *BoardingRecordUpdateOne) Where(ps ...predicate.BoardingRecord) *BoardingRecordUpdateOne {
	bruo.mutation.Where(ps...)
	return bruo
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (bruo *BoardingRecordUpdateOne) Select(field string, fields ...string) *BoardingRecordUpdateOne {
	bruo.fields = append([]string{field}, fields...)
	return bruo
}

// Save executes the query and returns the updated BoardingRecord entity.
func (bruo *BoardingRecordUpdateOne) Save(ctx context.Context) (*BoardingRecord, error) {
	return withHooks(ctx, bruo.sqlSave, bruo.mutation, bruo.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (bruo *BoardingRecordUpdateOne) SaveX(ctx context.Context) *BoardingRecord {
	node, err := bruo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (bruo *BoardingRecordUpdateOne) Exec(ctx context.Context) error {
	_, err := bruo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (bruo *BoardingRecordUpdateOne) ExecX(ctx context.Context) {
	if err := bruo.Exec(ctx); err != nil {
		panic(err)
	}
}

func (bruo *BoardingRecordUpdateOne) sqlSave(ctx context.Context) (_node *BoardingRecord, err error) {
	_spec := sqlgraph.NewUpdateSpec(boardingrecord.Table, boardingrecord.Columns, sqlgraph.NewFieldSpec(boardingrecord.FieldID, field.TypeUUID))
	id, ok := bruo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "BoardingRecord.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := bruo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, boardingrecord.FieldID)
		for _, f := range fields {
			if !boardingrecord.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != boardingrecord.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := bruo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := bruo.mutation.Timestamp(); ok {
		_spec.SetField(boardingrecord.FieldTimestamp, field.TypeTime, value)
	}
	if value, ok := bruo.mutation.IsBoarding(); ok {
		_spec.SetField(boardingrecord.FieldIsBoarding, field.TypeBool, value)
	}
	if bruo.mutation.ChildCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   boardingrecord.ChildTable,
			Columns: []string{boardingrecord.ChildColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(child.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := bruo.mutation.ChildIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   boardingrecord.ChildTable,
			Columns: []string{boardingrecord.ChildColumn},
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
	if bruo.mutation.BusCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   boardingrecord.BusTable,
			Columns: []string{boardingrecord.BusColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(bus.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := bruo.mutation.BusIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   boardingrecord.BusTable,
			Columns: []string{boardingrecord.BusColumn},
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
	_node = &BoardingRecord{config: bruo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, bruo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{boardingrecord.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	bruo.mutation.done = true
	return _node, nil
}
