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
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childphoto"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ChildPhotoUpdate is the builder for updating ChildPhoto entities.
type ChildPhotoUpdate struct {
	config
	hooks    []Hook
	mutation *ChildPhotoMutation
}

// Where appends a list predicates to the ChildPhotoUpdate builder.
func (cpu *ChildPhotoUpdate) Where(ps ...predicate.ChildPhoto) *ChildPhotoUpdate {
	cpu.mutation.Where(ps...)
	return cpu
}

// SetS3Bucket sets the "s3_bucket" field.
func (cpu *ChildPhotoUpdate) SetS3Bucket(s string) *ChildPhotoUpdate {
	cpu.mutation.SetS3Bucket(s)
	return cpu
}

// SetNillableS3Bucket sets the "s3_bucket" field if the given value is not nil.
func (cpu *ChildPhotoUpdate) SetNillableS3Bucket(s *string) *ChildPhotoUpdate {
	if s != nil {
		cpu.SetS3Bucket(*s)
	}
	return cpu
}

// SetS3Key sets the "s3_key" field.
func (cpu *ChildPhotoUpdate) SetS3Key(s string) *ChildPhotoUpdate {
	cpu.mutation.SetS3Key(s)
	return cpu
}

// SetNillableS3Key sets the "s3_key" field if the given value is not nil.
func (cpu *ChildPhotoUpdate) SetNillableS3Key(s *string) *ChildPhotoUpdate {
	if s != nil {
		cpu.SetS3Key(*s)
	}
	return cpu
}

// SetCreatedAt sets the "created_at" field.
func (cpu *ChildPhotoUpdate) SetCreatedAt(t time.Time) *ChildPhotoUpdate {
	cpu.mutation.SetCreatedAt(t)
	return cpu
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (cpu *ChildPhotoUpdate) SetNillableCreatedAt(t *time.Time) *ChildPhotoUpdate {
	if t != nil {
		cpu.SetCreatedAt(*t)
	}
	return cpu
}

// SetUpdatedAt sets the "updated_at" field.
func (cpu *ChildPhotoUpdate) SetUpdatedAt(t time.Time) *ChildPhotoUpdate {
	cpu.mutation.SetUpdatedAt(t)
	return cpu
}

// SetChildID sets the "child" edge to the Child entity by ID.
func (cpu *ChildPhotoUpdate) SetChildID(id uuid.UUID) *ChildPhotoUpdate {
	cpu.mutation.SetChildID(id)
	return cpu
}

// SetNillableChildID sets the "child" edge to the Child entity by ID if the given value is not nil.
func (cpu *ChildPhotoUpdate) SetNillableChildID(id *uuid.UUID) *ChildPhotoUpdate {
	if id != nil {
		cpu = cpu.SetChildID(*id)
	}
	return cpu
}

// SetChild sets the "child" edge to the Child entity.
func (cpu *ChildPhotoUpdate) SetChild(c *Child) *ChildPhotoUpdate {
	return cpu.SetChildID(c.ID)
}

// Mutation returns the ChildPhotoMutation object of the builder.
func (cpu *ChildPhotoUpdate) Mutation() *ChildPhotoMutation {
	return cpu.mutation
}

// ClearChild clears the "child" edge to the Child entity.
func (cpu *ChildPhotoUpdate) ClearChild() *ChildPhotoUpdate {
	cpu.mutation.ClearChild()
	return cpu
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (cpu *ChildPhotoUpdate) Save(ctx context.Context) (int, error) {
	cpu.defaults()
	return withHooks(ctx, cpu.sqlSave, cpu.mutation, cpu.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (cpu *ChildPhotoUpdate) SaveX(ctx context.Context) int {
	affected, err := cpu.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (cpu *ChildPhotoUpdate) Exec(ctx context.Context) error {
	_, err := cpu.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cpu *ChildPhotoUpdate) ExecX(ctx context.Context) {
	if err := cpu.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (cpu *ChildPhotoUpdate) defaults() {
	if _, ok := cpu.mutation.UpdatedAt(); !ok {
		v := childphoto.UpdateDefaultUpdatedAt()
		cpu.mutation.SetUpdatedAt(v)
	}
}

func (cpu *ChildPhotoUpdate) sqlSave(ctx context.Context) (n int, err error) {
	_spec := sqlgraph.NewUpdateSpec(childphoto.Table, childphoto.Columns, sqlgraph.NewFieldSpec(childphoto.FieldID, field.TypeUUID))
	if ps := cpu.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := cpu.mutation.S3Bucket(); ok {
		_spec.SetField(childphoto.FieldS3Bucket, field.TypeString, value)
	}
	if value, ok := cpu.mutation.S3Key(); ok {
		_spec.SetField(childphoto.FieldS3Key, field.TypeString, value)
	}
	if value, ok := cpu.mutation.CreatedAt(); ok {
		_spec.SetField(childphoto.FieldCreatedAt, field.TypeTime, value)
	}
	if value, ok := cpu.mutation.UpdatedAt(); ok {
		_spec.SetField(childphoto.FieldUpdatedAt, field.TypeTime, value)
	}
	if cpu.mutation.ChildCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childphoto.ChildTable,
			Columns: []string{childphoto.ChildColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(child.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cpu.mutation.ChildIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childphoto.ChildTable,
			Columns: []string{childphoto.ChildColumn},
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
	if n, err = sqlgraph.UpdateNodes(ctx, cpu.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{childphoto.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	cpu.mutation.done = true
	return n, nil
}

// ChildPhotoUpdateOne is the builder for updating a single ChildPhoto entity.
type ChildPhotoUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *ChildPhotoMutation
}

// SetS3Bucket sets the "s3_bucket" field.
func (cpuo *ChildPhotoUpdateOne) SetS3Bucket(s string) *ChildPhotoUpdateOne {
	cpuo.mutation.SetS3Bucket(s)
	return cpuo
}

// SetNillableS3Bucket sets the "s3_bucket" field if the given value is not nil.
func (cpuo *ChildPhotoUpdateOne) SetNillableS3Bucket(s *string) *ChildPhotoUpdateOne {
	if s != nil {
		cpuo.SetS3Bucket(*s)
	}
	return cpuo
}

// SetS3Key sets the "s3_key" field.
func (cpuo *ChildPhotoUpdateOne) SetS3Key(s string) *ChildPhotoUpdateOne {
	cpuo.mutation.SetS3Key(s)
	return cpuo
}

// SetNillableS3Key sets the "s3_key" field if the given value is not nil.
func (cpuo *ChildPhotoUpdateOne) SetNillableS3Key(s *string) *ChildPhotoUpdateOne {
	if s != nil {
		cpuo.SetS3Key(*s)
	}
	return cpuo
}

// SetCreatedAt sets the "created_at" field.
func (cpuo *ChildPhotoUpdateOne) SetCreatedAt(t time.Time) *ChildPhotoUpdateOne {
	cpuo.mutation.SetCreatedAt(t)
	return cpuo
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (cpuo *ChildPhotoUpdateOne) SetNillableCreatedAt(t *time.Time) *ChildPhotoUpdateOne {
	if t != nil {
		cpuo.SetCreatedAt(*t)
	}
	return cpuo
}

// SetUpdatedAt sets the "updated_at" field.
func (cpuo *ChildPhotoUpdateOne) SetUpdatedAt(t time.Time) *ChildPhotoUpdateOne {
	cpuo.mutation.SetUpdatedAt(t)
	return cpuo
}

// SetChildID sets the "child" edge to the Child entity by ID.
func (cpuo *ChildPhotoUpdateOne) SetChildID(id uuid.UUID) *ChildPhotoUpdateOne {
	cpuo.mutation.SetChildID(id)
	return cpuo
}

// SetNillableChildID sets the "child" edge to the Child entity by ID if the given value is not nil.
func (cpuo *ChildPhotoUpdateOne) SetNillableChildID(id *uuid.UUID) *ChildPhotoUpdateOne {
	if id != nil {
		cpuo = cpuo.SetChildID(*id)
	}
	return cpuo
}

// SetChild sets the "child" edge to the Child entity.
func (cpuo *ChildPhotoUpdateOne) SetChild(c *Child) *ChildPhotoUpdateOne {
	return cpuo.SetChildID(c.ID)
}

// Mutation returns the ChildPhotoMutation object of the builder.
func (cpuo *ChildPhotoUpdateOne) Mutation() *ChildPhotoMutation {
	return cpuo.mutation
}

// ClearChild clears the "child" edge to the Child entity.
func (cpuo *ChildPhotoUpdateOne) ClearChild() *ChildPhotoUpdateOne {
	cpuo.mutation.ClearChild()
	return cpuo
}

// Where appends a list predicates to the ChildPhotoUpdate builder.
func (cpuo *ChildPhotoUpdateOne) Where(ps ...predicate.ChildPhoto) *ChildPhotoUpdateOne {
	cpuo.mutation.Where(ps...)
	return cpuo
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (cpuo *ChildPhotoUpdateOne) Select(field string, fields ...string) *ChildPhotoUpdateOne {
	cpuo.fields = append([]string{field}, fields...)
	return cpuo
}

// Save executes the query and returns the updated ChildPhoto entity.
func (cpuo *ChildPhotoUpdateOne) Save(ctx context.Context) (*ChildPhoto, error) {
	cpuo.defaults()
	return withHooks(ctx, cpuo.sqlSave, cpuo.mutation, cpuo.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (cpuo *ChildPhotoUpdateOne) SaveX(ctx context.Context) *ChildPhoto {
	node, err := cpuo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (cpuo *ChildPhotoUpdateOne) Exec(ctx context.Context) error {
	_, err := cpuo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cpuo *ChildPhotoUpdateOne) ExecX(ctx context.Context) {
	if err := cpuo.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (cpuo *ChildPhotoUpdateOne) defaults() {
	if _, ok := cpuo.mutation.UpdatedAt(); !ok {
		v := childphoto.UpdateDefaultUpdatedAt()
		cpuo.mutation.SetUpdatedAt(v)
	}
}

func (cpuo *ChildPhotoUpdateOne) sqlSave(ctx context.Context) (_node *ChildPhoto, err error) {
	_spec := sqlgraph.NewUpdateSpec(childphoto.Table, childphoto.Columns, sqlgraph.NewFieldSpec(childphoto.FieldID, field.TypeUUID))
	id, ok := cpuo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "ChildPhoto.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := cpuo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, childphoto.FieldID)
		for _, f := range fields {
			if !childphoto.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != childphoto.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := cpuo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := cpuo.mutation.S3Bucket(); ok {
		_spec.SetField(childphoto.FieldS3Bucket, field.TypeString, value)
	}
	if value, ok := cpuo.mutation.S3Key(); ok {
		_spec.SetField(childphoto.FieldS3Key, field.TypeString, value)
	}
	if value, ok := cpuo.mutation.CreatedAt(); ok {
		_spec.SetField(childphoto.FieldCreatedAt, field.TypeTime, value)
	}
	if value, ok := cpuo.mutation.UpdatedAt(); ok {
		_spec.SetField(childphoto.FieldUpdatedAt, field.TypeTime, value)
	}
	if cpuo.mutation.ChildCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childphoto.ChildTable,
			Columns: []string{childphoto.ChildColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(child.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cpuo.mutation.ChildIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   childphoto.ChildTable,
			Columns: []string{childphoto.ChildColumn},
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
	_node = &ChildPhoto{config: cpuo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, cpuo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{childphoto.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	cpuo.mutation.done = true
	return _node, nil
}