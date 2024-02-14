// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/boardingrecord"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childbusassociation"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childphoto"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	"github.com/google/uuid"
)

// ChildCreate is the builder for creating a Child entity.
type ChildCreate struct {
	config
	mutation *ChildMutation
	hooks    []Hook
}

// SetName sets the "name" field.
func (cc *ChildCreate) SetName(s string) *ChildCreate {
	cc.mutation.SetName(s)
	return cc
}

// SetAge sets the "age" field.
func (cc *ChildCreate) SetAge(i int) *ChildCreate {
	cc.mutation.SetAge(i)
	return cc
}

// SetSex sets the "sex" field.
func (cc *ChildCreate) SetSex(c child.Sex) *ChildCreate {
	cc.mutation.SetSex(c)
	return cc
}

// SetCheckForMissingItems sets the "check_for_missing_items" field.
func (cc *ChildCreate) SetCheckForMissingItems(b bool) *ChildCreate {
	cc.mutation.SetCheckForMissingItems(b)
	return cc
}

// SetNillableCheckForMissingItems sets the "check_for_missing_items" field if the given value is not nil.
func (cc *ChildCreate) SetNillableCheckForMissingItems(b *bool) *ChildCreate {
	if b != nil {
		cc.SetCheckForMissingItems(*b)
	}
	return cc
}

// SetHasBag sets the "has_bag" field.
func (cc *ChildCreate) SetHasBag(b bool) *ChildCreate {
	cc.mutation.SetHasBag(b)
	return cc
}

// SetNillableHasBag sets the "has_bag" field if the given value is not nil.
func (cc *ChildCreate) SetNillableHasBag(b *bool) *ChildCreate {
	if b != nil {
		cc.SetHasBag(*b)
	}
	return cc
}

// SetHasLunchBox sets the "has_lunch_box" field.
func (cc *ChildCreate) SetHasLunchBox(b bool) *ChildCreate {
	cc.mutation.SetHasLunchBox(b)
	return cc
}

// SetNillableHasLunchBox sets the "has_lunch_box" field if the given value is not nil.
func (cc *ChildCreate) SetNillableHasLunchBox(b *bool) *ChildCreate {
	if b != nil {
		cc.SetHasLunchBox(*b)
	}
	return cc
}

// SetHasWaterBottle sets the "has_water_bottle" field.
func (cc *ChildCreate) SetHasWaterBottle(b bool) *ChildCreate {
	cc.mutation.SetHasWaterBottle(b)
	return cc
}

// SetNillableHasWaterBottle sets the "has_water_bottle" field if the given value is not nil.
func (cc *ChildCreate) SetNillableHasWaterBottle(b *bool) *ChildCreate {
	if b != nil {
		cc.SetHasWaterBottle(*b)
	}
	return cc
}

// SetHasUmbrella sets the "has_umbrella" field.
func (cc *ChildCreate) SetHasUmbrella(b bool) *ChildCreate {
	cc.mutation.SetHasUmbrella(b)
	return cc
}

// SetNillableHasUmbrella sets the "has_umbrella" field if the given value is not nil.
func (cc *ChildCreate) SetNillableHasUmbrella(b *bool) *ChildCreate {
	if b != nil {
		cc.SetHasUmbrella(*b)
	}
	return cc
}

// SetHasOther sets the "has_other" field.
func (cc *ChildCreate) SetHasOther(b bool) *ChildCreate {
	cc.mutation.SetHasOther(b)
	return cc
}

// SetNillableHasOther sets the "has_other" field if the given value is not nil.
func (cc *ChildCreate) SetNillableHasOther(b *bool) *ChildCreate {
	if b != nil {
		cc.SetHasOther(*b)
	}
	return cc
}

// SetCreatedAt sets the "created_at" field.
func (cc *ChildCreate) SetCreatedAt(t time.Time) *ChildCreate {
	cc.mutation.SetCreatedAt(t)
	return cc
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (cc *ChildCreate) SetNillableCreatedAt(t *time.Time) *ChildCreate {
	if t != nil {
		cc.SetCreatedAt(*t)
	}
	return cc
}

// SetUpdatedAt sets the "updated_at" field.
func (cc *ChildCreate) SetUpdatedAt(t time.Time) *ChildCreate {
	cc.mutation.SetUpdatedAt(t)
	return cc
}

// SetNillableUpdatedAt sets the "updated_at" field if the given value is not nil.
func (cc *ChildCreate) SetNillableUpdatedAt(t *time.Time) *ChildCreate {
	if t != nil {
		cc.SetUpdatedAt(*t)
	}
	return cc
}

// SetID sets the "id" field.
func (cc *ChildCreate) SetID(u uuid.UUID) *ChildCreate {
	cc.mutation.SetID(u)
	return cc
}

// SetNillableID sets the "id" field if the given value is not nil.
func (cc *ChildCreate) SetNillableID(u *uuid.UUID) *ChildCreate {
	if u != nil {
		cc.SetID(*u)
	}
	return cc
}

// SetGuardianID sets the "guardian" edge to the Guardian entity by ID.
func (cc *ChildCreate) SetGuardianID(id uuid.UUID) *ChildCreate {
	cc.mutation.SetGuardianID(id)
	return cc
}

// SetNillableGuardianID sets the "guardian" edge to the Guardian entity by ID if the given value is not nil.
func (cc *ChildCreate) SetNillableGuardianID(id *uuid.UUID) *ChildCreate {
	if id != nil {
		cc = cc.SetGuardianID(*id)
	}
	return cc
}

// SetGuardian sets the "guardian" edge to the Guardian entity.
func (cc *ChildCreate) SetGuardian(g *Guardian) *ChildCreate {
	return cc.SetGuardianID(g.ID)
}

// AddChildBusAssociationIDs adds the "childBusAssociations" edge to the ChildBusAssociation entity by IDs.
func (cc *ChildCreate) AddChildBusAssociationIDs(ids ...int) *ChildCreate {
	cc.mutation.AddChildBusAssociationIDs(ids...)
	return cc
}

// AddChildBusAssociations adds the "childBusAssociations" edges to the ChildBusAssociation entity.
func (cc *ChildCreate) AddChildBusAssociations(c ...*ChildBusAssociation) *ChildCreate {
	ids := make([]int, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cc.AddChildBusAssociationIDs(ids...)
}

// SetNurseryID sets the "nursery" edge to the Nursery entity by ID.
func (cc *ChildCreate) SetNurseryID(id uuid.UUID) *ChildCreate {
	cc.mutation.SetNurseryID(id)
	return cc
}

// SetNillableNurseryID sets the "nursery" edge to the Nursery entity by ID if the given value is not nil.
func (cc *ChildCreate) SetNillableNurseryID(id *uuid.UUID) *ChildCreate {
	if id != nil {
		cc = cc.SetNurseryID(*id)
	}
	return cc
}

// SetNursery sets the "nursery" edge to the Nursery entity.
func (cc *ChildCreate) SetNursery(n *Nursery) *ChildCreate {
	return cc.SetNurseryID(n.ID)
}

// AddBoardingRecordIDs adds the "boarding_record" edge to the BoardingRecord entity by IDs.
func (cc *ChildCreate) AddBoardingRecordIDs(ids ...uuid.UUID) *ChildCreate {
	cc.mutation.AddBoardingRecordIDs(ids...)
	return cc
}

// AddBoardingRecord adds the "boarding_record" edges to the BoardingRecord entity.
func (cc *ChildCreate) AddBoardingRecord(b ...*BoardingRecord) *ChildCreate {
	ids := make([]uuid.UUID, len(b))
	for i := range b {
		ids[i] = b[i].ID
	}
	return cc.AddBoardingRecordIDs(ids...)
}

// AddPhotoIDs adds the "photos" edge to the ChildPhoto entity by IDs.
func (cc *ChildCreate) AddPhotoIDs(ids ...uuid.UUID) *ChildCreate {
	cc.mutation.AddPhotoIDs(ids...)
	return cc
}

// AddPhotos adds the "photos" edges to the ChildPhoto entity.
func (cc *ChildCreate) AddPhotos(c ...*ChildPhoto) *ChildCreate {
	ids := make([]uuid.UUID, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cc.AddPhotoIDs(ids...)
}

// Mutation returns the ChildMutation object of the builder.
func (cc *ChildCreate) Mutation() *ChildMutation {
	return cc.mutation
}

// Save creates the Child in the database.
func (cc *ChildCreate) Save(ctx context.Context) (*Child, error) {
	cc.defaults()
	return withHooks(ctx, cc.sqlSave, cc.mutation, cc.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (cc *ChildCreate) SaveX(ctx context.Context) *Child {
	v, err := cc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (cc *ChildCreate) Exec(ctx context.Context) error {
	_, err := cc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cc *ChildCreate) ExecX(ctx context.Context) {
	if err := cc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (cc *ChildCreate) defaults() {
	if _, ok := cc.mutation.CheckForMissingItems(); !ok {
		v := child.DefaultCheckForMissingItems
		cc.mutation.SetCheckForMissingItems(v)
	}
	if _, ok := cc.mutation.HasBag(); !ok {
		v := child.DefaultHasBag
		cc.mutation.SetHasBag(v)
	}
	if _, ok := cc.mutation.HasLunchBox(); !ok {
		v := child.DefaultHasLunchBox
		cc.mutation.SetHasLunchBox(v)
	}
	if _, ok := cc.mutation.HasWaterBottle(); !ok {
		v := child.DefaultHasWaterBottle
		cc.mutation.SetHasWaterBottle(v)
	}
	if _, ok := cc.mutation.HasUmbrella(); !ok {
		v := child.DefaultHasUmbrella
		cc.mutation.SetHasUmbrella(v)
	}
	if _, ok := cc.mutation.HasOther(); !ok {
		v := child.DefaultHasOther
		cc.mutation.SetHasOther(v)
	}
	if _, ok := cc.mutation.CreatedAt(); !ok {
		v := child.DefaultCreatedAt()
		cc.mutation.SetCreatedAt(v)
	}
	if _, ok := cc.mutation.UpdatedAt(); !ok {
		v := child.DefaultUpdatedAt()
		cc.mutation.SetUpdatedAt(v)
	}
	if _, ok := cc.mutation.ID(); !ok {
		v := child.DefaultID()
		cc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (cc *ChildCreate) check() error {
	if _, ok := cc.mutation.Name(); !ok {
		return &ValidationError{Name: "name", err: errors.New(`ent: missing required field "Child.name"`)}
	}
	if _, ok := cc.mutation.Age(); !ok {
		return &ValidationError{Name: "age", err: errors.New(`ent: missing required field "Child.age"`)}
	}
	if _, ok := cc.mutation.Sex(); !ok {
		return &ValidationError{Name: "sex", err: errors.New(`ent: missing required field "Child.sex"`)}
	}
	if v, ok := cc.mutation.Sex(); ok {
		if err := child.SexValidator(v); err != nil {
			return &ValidationError{Name: "sex", err: fmt.Errorf(`ent: validator failed for field "Child.sex": %w`, err)}
		}
	}
	if _, ok := cc.mutation.CheckForMissingItems(); !ok {
		return &ValidationError{Name: "check_for_missing_items", err: errors.New(`ent: missing required field "Child.check_for_missing_items"`)}
	}
	if _, ok := cc.mutation.HasBag(); !ok {
		return &ValidationError{Name: "has_bag", err: errors.New(`ent: missing required field "Child.has_bag"`)}
	}
	if _, ok := cc.mutation.HasLunchBox(); !ok {
		return &ValidationError{Name: "has_lunch_box", err: errors.New(`ent: missing required field "Child.has_lunch_box"`)}
	}
	if _, ok := cc.mutation.HasWaterBottle(); !ok {
		return &ValidationError{Name: "has_water_bottle", err: errors.New(`ent: missing required field "Child.has_water_bottle"`)}
	}
	if _, ok := cc.mutation.HasUmbrella(); !ok {
		return &ValidationError{Name: "has_umbrella", err: errors.New(`ent: missing required field "Child.has_umbrella"`)}
	}
	if _, ok := cc.mutation.HasOther(); !ok {
		return &ValidationError{Name: "has_other", err: errors.New(`ent: missing required field "Child.has_other"`)}
	}
	if _, ok := cc.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "Child.created_at"`)}
	}
	if _, ok := cc.mutation.UpdatedAt(); !ok {
		return &ValidationError{Name: "updated_at", err: errors.New(`ent: missing required field "Child.updated_at"`)}
	}
	return nil
}

func (cc *ChildCreate) sqlSave(ctx context.Context) (*Child, error) {
	if err := cc.check(); err != nil {
		return nil, err
	}
	_node, _spec := cc.createSpec()
	if err := sqlgraph.CreateNode(ctx, cc.driver, _spec); err != nil {
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
	cc.mutation.id = &_node.ID
	cc.mutation.done = true
	return _node, nil
}

func (cc *ChildCreate) createSpec() (*Child, *sqlgraph.CreateSpec) {
	var (
		_node = &Child{config: cc.config}
		_spec = sqlgraph.NewCreateSpec(child.Table, sqlgraph.NewFieldSpec(child.FieldID, field.TypeUUID))
	)
	if id, ok := cc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := cc.mutation.Name(); ok {
		_spec.SetField(child.FieldName, field.TypeString, value)
		_node.Name = value
	}
	if value, ok := cc.mutation.Age(); ok {
		_spec.SetField(child.FieldAge, field.TypeInt, value)
		_node.Age = value
	}
	if value, ok := cc.mutation.Sex(); ok {
		_spec.SetField(child.FieldSex, field.TypeEnum, value)
		_node.Sex = value
	}
	if value, ok := cc.mutation.CheckForMissingItems(); ok {
		_spec.SetField(child.FieldCheckForMissingItems, field.TypeBool, value)
		_node.CheckForMissingItems = value
	}
	if value, ok := cc.mutation.HasBag(); ok {
		_spec.SetField(child.FieldHasBag, field.TypeBool, value)
		_node.HasBag = value
	}
	if value, ok := cc.mutation.HasLunchBox(); ok {
		_spec.SetField(child.FieldHasLunchBox, field.TypeBool, value)
		_node.HasLunchBox = value
	}
	if value, ok := cc.mutation.HasWaterBottle(); ok {
		_spec.SetField(child.FieldHasWaterBottle, field.TypeBool, value)
		_node.HasWaterBottle = value
	}
	if value, ok := cc.mutation.HasUmbrella(); ok {
		_spec.SetField(child.FieldHasUmbrella, field.TypeBool, value)
		_node.HasUmbrella = value
	}
	if value, ok := cc.mutation.HasOther(); ok {
		_spec.SetField(child.FieldHasOther, field.TypeBool, value)
		_node.HasOther = value
	}
	if value, ok := cc.mutation.CreatedAt(); ok {
		_spec.SetField(child.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if value, ok := cc.mutation.UpdatedAt(); ok {
		_spec.SetField(child.FieldUpdatedAt, field.TypeTime, value)
		_node.UpdatedAt = value
	}
	if nodes := cc.mutation.GuardianIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   child.GuardianTable,
			Columns: []string{child.GuardianColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(guardian.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_node.guardian_children = &nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := cc.mutation.ChildBusAssociationsIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: false,
			Table:   child.ChildBusAssociationsTable,
			Columns: []string{child.ChildBusAssociationsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(childbusassociation.FieldID, field.TypeInt),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := cc.mutation.NurseryIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   child.NurseryTable,
			Columns: []string{child.NurseryColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(nursery.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_node.child_nursery = &nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := cc.mutation.BoardingRecordIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: false,
			Table:   child.BoardingRecordTable,
			Columns: []string{child.BoardingRecordColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(boardingrecord.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := cc.mutation.PhotosIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: false,
			Table:   child.PhotosTable,
			Columns: []string{child.PhotosColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(childphoto.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// ChildCreateBulk is the builder for creating many Child entities in bulk.
type ChildCreateBulk struct {
	config
	err      error
	builders []*ChildCreate
}

// Save creates the Child entities in the database.
func (ccb *ChildCreateBulk) Save(ctx context.Context) ([]*Child, error) {
	if ccb.err != nil {
		return nil, ccb.err
	}
	specs := make([]*sqlgraph.CreateSpec, len(ccb.builders))
	nodes := make([]*Child, len(ccb.builders))
	mutators := make([]Mutator, len(ccb.builders))
	for i := range ccb.builders {
		func(i int, root context.Context) {
			builder := ccb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*ChildMutation)
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
					_, err = mutators[i+1].Mutate(root, ccb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, ccb.driver, spec); err != nil {
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
		if _, err := mutators[0].Mutate(ctx, ccb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (ccb *ChildCreateBulk) SaveX(ctx context.Context) []*Child {
	v, err := ccb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (ccb *ChildCreateBulk) Exec(ctx context.Context) error {
	_, err := ccb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (ccb *ChildCreateBulk) ExecX(ctx context.Context) {
	if err := ccb.Exec(ctx); err != nil {
		panic(err)
	}
}
