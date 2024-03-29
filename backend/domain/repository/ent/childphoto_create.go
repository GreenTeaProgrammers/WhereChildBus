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
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childphoto"
	"github.com/google/uuid"
)

// ChildPhotoCreate is the builder for creating a ChildPhoto entity.
type ChildPhotoCreate struct {
	config
	mutation *ChildPhotoMutation
	hooks    []Hook
}

// SetCreatedAt sets the "created_at" field.
func (cpc *ChildPhotoCreate) SetCreatedAt(t time.Time) *ChildPhotoCreate {
	cpc.mutation.SetCreatedAt(t)
	return cpc
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (cpc *ChildPhotoCreate) SetNillableCreatedAt(t *time.Time) *ChildPhotoCreate {
	if t != nil {
		cpc.SetCreatedAt(*t)
	}
	return cpc
}

// SetUpdatedAt sets the "updated_at" field.
func (cpc *ChildPhotoCreate) SetUpdatedAt(t time.Time) *ChildPhotoCreate {
	cpc.mutation.SetUpdatedAt(t)
	return cpc
}

// SetNillableUpdatedAt sets the "updated_at" field if the given value is not nil.
func (cpc *ChildPhotoCreate) SetNillableUpdatedAt(t *time.Time) *ChildPhotoCreate {
	if t != nil {
		cpc.SetUpdatedAt(*t)
	}
	return cpc
}

// SetID sets the "id" field.
func (cpc *ChildPhotoCreate) SetID(u uuid.UUID) *ChildPhotoCreate {
	cpc.mutation.SetID(u)
	return cpc
}

// SetNillableID sets the "id" field if the given value is not nil.
func (cpc *ChildPhotoCreate) SetNillableID(u *uuid.UUID) *ChildPhotoCreate {
	if u != nil {
		cpc.SetID(*u)
	}
	return cpc
}

// SetChildID sets the "child" edge to the Child entity by ID.
func (cpc *ChildPhotoCreate) SetChildID(id uuid.UUID) *ChildPhotoCreate {
	cpc.mutation.SetChildID(id)
	return cpc
}

// SetNillableChildID sets the "child" edge to the Child entity by ID if the given value is not nil.
func (cpc *ChildPhotoCreate) SetNillableChildID(id *uuid.UUID) *ChildPhotoCreate {
	if id != nil {
		cpc = cpc.SetChildID(*id)
	}
	return cpc
}

// SetChild sets the "child" edge to the Child entity.
func (cpc *ChildPhotoCreate) SetChild(c *Child) *ChildPhotoCreate {
	return cpc.SetChildID(c.ID)
}

// Mutation returns the ChildPhotoMutation object of the builder.
func (cpc *ChildPhotoCreate) Mutation() *ChildPhotoMutation {
	return cpc.mutation
}

// Save creates the ChildPhoto in the database.
func (cpc *ChildPhotoCreate) Save(ctx context.Context) (*ChildPhoto, error) {
	cpc.defaults()
	return withHooks(ctx, cpc.sqlSave, cpc.mutation, cpc.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (cpc *ChildPhotoCreate) SaveX(ctx context.Context) *ChildPhoto {
	v, err := cpc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (cpc *ChildPhotoCreate) Exec(ctx context.Context) error {
	_, err := cpc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cpc *ChildPhotoCreate) ExecX(ctx context.Context) {
	if err := cpc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (cpc *ChildPhotoCreate) defaults() {
	if _, ok := cpc.mutation.CreatedAt(); !ok {
		v := childphoto.DefaultCreatedAt()
		cpc.mutation.SetCreatedAt(v)
	}
	if _, ok := cpc.mutation.UpdatedAt(); !ok {
		v := childphoto.DefaultUpdatedAt()
		cpc.mutation.SetUpdatedAt(v)
	}
	if _, ok := cpc.mutation.ID(); !ok {
		v := childphoto.DefaultID()
		cpc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (cpc *ChildPhotoCreate) check() error {
	if _, ok := cpc.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "ChildPhoto.created_at"`)}
	}
	if _, ok := cpc.mutation.UpdatedAt(); !ok {
		return &ValidationError{Name: "updated_at", err: errors.New(`ent: missing required field "ChildPhoto.updated_at"`)}
	}
	return nil
}

func (cpc *ChildPhotoCreate) sqlSave(ctx context.Context) (*ChildPhoto, error) {
	if err := cpc.check(); err != nil {
		return nil, err
	}
	_node, _spec := cpc.createSpec()
	if err := sqlgraph.CreateNode(ctx, cpc.driver, _spec); err != nil {
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
	cpc.mutation.id = &_node.ID
	cpc.mutation.done = true
	return _node, nil
}

func (cpc *ChildPhotoCreate) createSpec() (*ChildPhoto, *sqlgraph.CreateSpec) {
	var (
		_node = &ChildPhoto{config: cpc.config}
		_spec = sqlgraph.NewCreateSpec(childphoto.Table, sqlgraph.NewFieldSpec(childphoto.FieldID, field.TypeUUID))
	)
	if id, ok := cpc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := cpc.mutation.CreatedAt(); ok {
		_spec.SetField(childphoto.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if value, ok := cpc.mutation.UpdatedAt(); ok {
		_spec.SetField(childphoto.FieldUpdatedAt, field.TypeTime, value)
		_node.UpdatedAt = value
	}
	if nodes := cpc.mutation.ChildIDs(); len(nodes) > 0 {
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
		_node.child_photos = &nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// ChildPhotoCreateBulk is the builder for creating many ChildPhoto entities in bulk.
type ChildPhotoCreateBulk struct {
	config
	err      error
	builders []*ChildPhotoCreate
}

// Save creates the ChildPhoto entities in the database.
func (cpcb *ChildPhotoCreateBulk) Save(ctx context.Context) ([]*ChildPhoto, error) {
	if cpcb.err != nil {
		return nil, cpcb.err
	}
	specs := make([]*sqlgraph.CreateSpec, len(cpcb.builders))
	nodes := make([]*ChildPhoto, len(cpcb.builders))
	mutators := make([]Mutator, len(cpcb.builders))
	for i := range cpcb.builders {
		func(i int, root context.Context) {
			builder := cpcb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*ChildPhotoMutation)
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
					_, err = mutators[i+1].Mutate(root, cpcb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, cpcb.driver, spec); err != nil {
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
		if _, err := mutators[0].Mutate(ctx, cpcb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (cpcb *ChildPhotoCreateBulk) SaveX(ctx context.Context) []*ChildPhoto {
	v, err := cpcb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (cpcb *ChildPhotoCreateBulk) Exec(ctx context.Context) error {
	_, err := cpcb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cpcb *ChildPhotoCreateBulk) ExecX(ctx context.Context) {
	if err := cpcb.Exec(ctx); err != nil {
		panic(err)
	}
}
