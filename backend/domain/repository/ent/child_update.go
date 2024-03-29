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
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childbusassociation"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childphoto"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ChildUpdate is the builder for updating Child entities.
type ChildUpdate struct {
	config
	hooks    []Hook
	mutation *ChildMutation
}

// Where appends a list predicates to the ChildUpdate builder.
func (cu *ChildUpdate) Where(ps ...predicate.Child) *ChildUpdate {
	cu.mutation.Where(ps...)
	return cu
}

// SetName sets the "name" field.
func (cu *ChildUpdate) SetName(s string) *ChildUpdate {
	cu.mutation.SetName(s)
	return cu
}

// SetNillableName sets the "name" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableName(s *string) *ChildUpdate {
	if s != nil {
		cu.SetName(*s)
	}
	return cu
}

// SetAge sets the "age" field.
func (cu *ChildUpdate) SetAge(i int) *ChildUpdate {
	cu.mutation.ResetAge()
	cu.mutation.SetAge(i)
	return cu
}

// SetNillableAge sets the "age" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableAge(i *int) *ChildUpdate {
	if i != nil {
		cu.SetAge(*i)
	}
	return cu
}

// AddAge adds i to the "age" field.
func (cu *ChildUpdate) AddAge(i int) *ChildUpdate {
	cu.mutation.AddAge(i)
	return cu
}

// SetSex sets the "sex" field.
func (cu *ChildUpdate) SetSex(c child.Sex) *ChildUpdate {
	cu.mutation.SetSex(c)
	return cu
}

// SetNillableSex sets the "sex" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableSex(c *child.Sex) *ChildUpdate {
	if c != nil {
		cu.SetSex(*c)
	}
	return cu
}

// SetCheckForMissingItems sets the "check_for_missing_items" field.
func (cu *ChildUpdate) SetCheckForMissingItems(b bool) *ChildUpdate {
	cu.mutation.SetCheckForMissingItems(b)
	return cu
}

// SetNillableCheckForMissingItems sets the "check_for_missing_items" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableCheckForMissingItems(b *bool) *ChildUpdate {
	if b != nil {
		cu.SetCheckForMissingItems(*b)
	}
	return cu
}

// SetHasBag sets the "has_bag" field.
func (cu *ChildUpdate) SetHasBag(b bool) *ChildUpdate {
	cu.mutation.SetHasBag(b)
	return cu
}

// SetNillableHasBag sets the "has_bag" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableHasBag(b *bool) *ChildUpdate {
	if b != nil {
		cu.SetHasBag(*b)
	}
	return cu
}

// SetHasLunchBox sets the "has_lunch_box" field.
func (cu *ChildUpdate) SetHasLunchBox(b bool) *ChildUpdate {
	cu.mutation.SetHasLunchBox(b)
	return cu
}

// SetNillableHasLunchBox sets the "has_lunch_box" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableHasLunchBox(b *bool) *ChildUpdate {
	if b != nil {
		cu.SetHasLunchBox(*b)
	}
	return cu
}

// SetHasWaterBottle sets the "has_water_bottle" field.
func (cu *ChildUpdate) SetHasWaterBottle(b bool) *ChildUpdate {
	cu.mutation.SetHasWaterBottle(b)
	return cu
}

// SetNillableHasWaterBottle sets the "has_water_bottle" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableHasWaterBottle(b *bool) *ChildUpdate {
	if b != nil {
		cu.SetHasWaterBottle(*b)
	}
	return cu
}

// SetHasUmbrella sets the "has_umbrella" field.
func (cu *ChildUpdate) SetHasUmbrella(b bool) *ChildUpdate {
	cu.mutation.SetHasUmbrella(b)
	return cu
}

// SetNillableHasUmbrella sets the "has_umbrella" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableHasUmbrella(b *bool) *ChildUpdate {
	if b != nil {
		cu.SetHasUmbrella(*b)
	}
	return cu
}

// SetHasOther sets the "has_other" field.
func (cu *ChildUpdate) SetHasOther(b bool) *ChildUpdate {
	cu.mutation.SetHasOther(b)
	return cu
}

// SetNillableHasOther sets the "has_other" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableHasOther(b *bool) *ChildUpdate {
	if b != nil {
		cu.SetHasOther(*b)
	}
	return cu
}

// SetCreatedAt sets the "created_at" field.
func (cu *ChildUpdate) SetCreatedAt(t time.Time) *ChildUpdate {
	cu.mutation.SetCreatedAt(t)
	return cu
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (cu *ChildUpdate) SetNillableCreatedAt(t *time.Time) *ChildUpdate {
	if t != nil {
		cu.SetCreatedAt(*t)
	}
	return cu
}

// SetUpdatedAt sets the "updated_at" field.
func (cu *ChildUpdate) SetUpdatedAt(t time.Time) *ChildUpdate {
	cu.mutation.SetUpdatedAt(t)
	return cu
}

// SetGuardianID sets the "guardian" edge to the Guardian entity by ID.
func (cu *ChildUpdate) SetGuardianID(id uuid.UUID) *ChildUpdate {
	cu.mutation.SetGuardianID(id)
	return cu
}

// SetNillableGuardianID sets the "guardian" edge to the Guardian entity by ID if the given value is not nil.
func (cu *ChildUpdate) SetNillableGuardianID(id *uuid.UUID) *ChildUpdate {
	if id != nil {
		cu = cu.SetGuardianID(*id)
	}
	return cu
}

// SetGuardian sets the "guardian" edge to the Guardian entity.
func (cu *ChildUpdate) SetGuardian(g *Guardian) *ChildUpdate {
	return cu.SetGuardianID(g.ID)
}

// AddChildBusAssociationIDs adds the "childBusAssociations" edge to the ChildBusAssociation entity by IDs.
func (cu *ChildUpdate) AddChildBusAssociationIDs(ids ...int) *ChildUpdate {
	cu.mutation.AddChildBusAssociationIDs(ids...)
	return cu
}

// AddChildBusAssociations adds the "childBusAssociations" edges to the ChildBusAssociation entity.
func (cu *ChildUpdate) AddChildBusAssociations(c ...*ChildBusAssociation) *ChildUpdate {
	ids := make([]int, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cu.AddChildBusAssociationIDs(ids...)
}

// AddBoardingRecordIDs adds the "boarding_record" edge to the BoardingRecord entity by IDs.
func (cu *ChildUpdate) AddBoardingRecordIDs(ids ...uuid.UUID) *ChildUpdate {
	cu.mutation.AddBoardingRecordIDs(ids...)
	return cu
}

// AddBoardingRecord adds the "boarding_record" edges to the BoardingRecord entity.
func (cu *ChildUpdate) AddBoardingRecord(b ...*BoardingRecord) *ChildUpdate {
	ids := make([]uuid.UUID, len(b))
	for i := range b {
		ids[i] = b[i].ID
	}
	return cu.AddBoardingRecordIDs(ids...)
}

// AddPhotoIDs adds the "photos" edge to the ChildPhoto entity by IDs.
func (cu *ChildUpdate) AddPhotoIDs(ids ...uuid.UUID) *ChildUpdate {
	cu.mutation.AddPhotoIDs(ids...)
	return cu
}

// AddPhotos adds the "photos" edges to the ChildPhoto entity.
func (cu *ChildUpdate) AddPhotos(c ...*ChildPhoto) *ChildUpdate {
	ids := make([]uuid.UUID, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cu.AddPhotoIDs(ids...)
}

// Mutation returns the ChildMutation object of the builder.
func (cu *ChildUpdate) Mutation() *ChildMutation {
	return cu.mutation
}

// ClearGuardian clears the "guardian" edge to the Guardian entity.
func (cu *ChildUpdate) ClearGuardian() *ChildUpdate {
	cu.mutation.ClearGuardian()
	return cu
}

// ClearChildBusAssociations clears all "childBusAssociations" edges to the ChildBusAssociation entity.
func (cu *ChildUpdate) ClearChildBusAssociations() *ChildUpdate {
	cu.mutation.ClearChildBusAssociations()
	return cu
}

// RemoveChildBusAssociationIDs removes the "childBusAssociations" edge to ChildBusAssociation entities by IDs.
func (cu *ChildUpdate) RemoveChildBusAssociationIDs(ids ...int) *ChildUpdate {
	cu.mutation.RemoveChildBusAssociationIDs(ids...)
	return cu
}

// RemoveChildBusAssociations removes "childBusAssociations" edges to ChildBusAssociation entities.
func (cu *ChildUpdate) RemoveChildBusAssociations(c ...*ChildBusAssociation) *ChildUpdate {
	ids := make([]int, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cu.RemoveChildBusAssociationIDs(ids...)
}

// ClearBoardingRecord clears all "boarding_record" edges to the BoardingRecord entity.
func (cu *ChildUpdate) ClearBoardingRecord() *ChildUpdate {
	cu.mutation.ClearBoardingRecord()
	return cu
}

// RemoveBoardingRecordIDs removes the "boarding_record" edge to BoardingRecord entities by IDs.
func (cu *ChildUpdate) RemoveBoardingRecordIDs(ids ...uuid.UUID) *ChildUpdate {
	cu.mutation.RemoveBoardingRecordIDs(ids...)
	return cu
}

// RemoveBoardingRecord removes "boarding_record" edges to BoardingRecord entities.
func (cu *ChildUpdate) RemoveBoardingRecord(b ...*BoardingRecord) *ChildUpdate {
	ids := make([]uuid.UUID, len(b))
	for i := range b {
		ids[i] = b[i].ID
	}
	return cu.RemoveBoardingRecordIDs(ids...)
}

// ClearPhotos clears all "photos" edges to the ChildPhoto entity.
func (cu *ChildUpdate) ClearPhotos() *ChildUpdate {
	cu.mutation.ClearPhotos()
	return cu
}

// RemovePhotoIDs removes the "photos" edge to ChildPhoto entities by IDs.
func (cu *ChildUpdate) RemovePhotoIDs(ids ...uuid.UUID) *ChildUpdate {
	cu.mutation.RemovePhotoIDs(ids...)
	return cu
}

// RemovePhotos removes "photos" edges to ChildPhoto entities.
func (cu *ChildUpdate) RemovePhotos(c ...*ChildPhoto) *ChildUpdate {
	ids := make([]uuid.UUID, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cu.RemovePhotoIDs(ids...)
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (cu *ChildUpdate) Save(ctx context.Context) (int, error) {
	cu.defaults()
	return withHooks(ctx, cu.sqlSave, cu.mutation, cu.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (cu *ChildUpdate) SaveX(ctx context.Context) int {
	affected, err := cu.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (cu *ChildUpdate) Exec(ctx context.Context) error {
	_, err := cu.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cu *ChildUpdate) ExecX(ctx context.Context) {
	if err := cu.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (cu *ChildUpdate) defaults() {
	if _, ok := cu.mutation.UpdatedAt(); !ok {
		v := child.UpdateDefaultUpdatedAt()
		cu.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (cu *ChildUpdate) check() error {
	if v, ok := cu.mutation.Sex(); ok {
		if err := child.SexValidator(v); err != nil {
			return &ValidationError{Name: "sex", err: fmt.Errorf(`ent: validator failed for field "Child.sex": %w`, err)}
		}
	}
	return nil
}

func (cu *ChildUpdate) sqlSave(ctx context.Context) (n int, err error) {
	if err := cu.check(); err != nil {
		return n, err
	}
	_spec := sqlgraph.NewUpdateSpec(child.Table, child.Columns, sqlgraph.NewFieldSpec(child.FieldID, field.TypeUUID))
	if ps := cu.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := cu.mutation.Name(); ok {
		_spec.SetField(child.FieldName, field.TypeString, value)
	}
	if value, ok := cu.mutation.Age(); ok {
		_spec.SetField(child.FieldAge, field.TypeInt, value)
	}
	if value, ok := cu.mutation.AddedAge(); ok {
		_spec.AddField(child.FieldAge, field.TypeInt, value)
	}
	if value, ok := cu.mutation.Sex(); ok {
		_spec.SetField(child.FieldSex, field.TypeEnum, value)
	}
	if value, ok := cu.mutation.CheckForMissingItems(); ok {
		_spec.SetField(child.FieldCheckForMissingItems, field.TypeBool, value)
	}
	if value, ok := cu.mutation.HasBag(); ok {
		_spec.SetField(child.FieldHasBag, field.TypeBool, value)
	}
	if value, ok := cu.mutation.HasLunchBox(); ok {
		_spec.SetField(child.FieldHasLunchBox, field.TypeBool, value)
	}
	if value, ok := cu.mutation.HasWaterBottle(); ok {
		_spec.SetField(child.FieldHasWaterBottle, field.TypeBool, value)
	}
	if value, ok := cu.mutation.HasUmbrella(); ok {
		_spec.SetField(child.FieldHasUmbrella, field.TypeBool, value)
	}
	if value, ok := cu.mutation.HasOther(); ok {
		_spec.SetField(child.FieldHasOther, field.TypeBool, value)
	}
	if value, ok := cu.mutation.CreatedAt(); ok {
		_spec.SetField(child.FieldCreatedAt, field.TypeTime, value)
	}
	if value, ok := cu.mutation.UpdatedAt(); ok {
		_spec.SetField(child.FieldUpdatedAt, field.TypeTime, value)
	}
	if cu.mutation.GuardianCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cu.mutation.GuardianIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if cu.mutation.ChildBusAssociationsCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cu.mutation.RemovedChildBusAssociationsIDs(); len(nodes) > 0 && !cu.mutation.ChildBusAssociationsCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cu.mutation.ChildBusAssociationsIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if cu.mutation.BoardingRecordCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cu.mutation.RemovedBoardingRecordIDs(); len(nodes) > 0 && !cu.mutation.BoardingRecordCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cu.mutation.BoardingRecordIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if cu.mutation.PhotosCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cu.mutation.RemovedPhotosIDs(); len(nodes) > 0 && !cu.mutation.PhotosCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cu.mutation.PhotosIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if n, err = sqlgraph.UpdateNodes(ctx, cu.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{child.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	cu.mutation.done = true
	return n, nil
}

// ChildUpdateOne is the builder for updating a single Child entity.
type ChildUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *ChildMutation
}

// SetName sets the "name" field.
func (cuo *ChildUpdateOne) SetName(s string) *ChildUpdateOne {
	cuo.mutation.SetName(s)
	return cuo
}

// SetNillableName sets the "name" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableName(s *string) *ChildUpdateOne {
	if s != nil {
		cuo.SetName(*s)
	}
	return cuo
}

// SetAge sets the "age" field.
func (cuo *ChildUpdateOne) SetAge(i int) *ChildUpdateOne {
	cuo.mutation.ResetAge()
	cuo.mutation.SetAge(i)
	return cuo
}

// SetNillableAge sets the "age" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableAge(i *int) *ChildUpdateOne {
	if i != nil {
		cuo.SetAge(*i)
	}
	return cuo
}

// AddAge adds i to the "age" field.
func (cuo *ChildUpdateOne) AddAge(i int) *ChildUpdateOne {
	cuo.mutation.AddAge(i)
	return cuo
}

// SetSex sets the "sex" field.
func (cuo *ChildUpdateOne) SetSex(c child.Sex) *ChildUpdateOne {
	cuo.mutation.SetSex(c)
	return cuo
}

// SetNillableSex sets the "sex" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableSex(c *child.Sex) *ChildUpdateOne {
	if c != nil {
		cuo.SetSex(*c)
	}
	return cuo
}

// SetCheckForMissingItems sets the "check_for_missing_items" field.
func (cuo *ChildUpdateOne) SetCheckForMissingItems(b bool) *ChildUpdateOne {
	cuo.mutation.SetCheckForMissingItems(b)
	return cuo
}

// SetNillableCheckForMissingItems sets the "check_for_missing_items" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableCheckForMissingItems(b *bool) *ChildUpdateOne {
	if b != nil {
		cuo.SetCheckForMissingItems(*b)
	}
	return cuo
}

// SetHasBag sets the "has_bag" field.
func (cuo *ChildUpdateOne) SetHasBag(b bool) *ChildUpdateOne {
	cuo.mutation.SetHasBag(b)
	return cuo
}

// SetNillableHasBag sets the "has_bag" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableHasBag(b *bool) *ChildUpdateOne {
	if b != nil {
		cuo.SetHasBag(*b)
	}
	return cuo
}

// SetHasLunchBox sets the "has_lunch_box" field.
func (cuo *ChildUpdateOne) SetHasLunchBox(b bool) *ChildUpdateOne {
	cuo.mutation.SetHasLunchBox(b)
	return cuo
}

// SetNillableHasLunchBox sets the "has_lunch_box" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableHasLunchBox(b *bool) *ChildUpdateOne {
	if b != nil {
		cuo.SetHasLunchBox(*b)
	}
	return cuo
}

// SetHasWaterBottle sets the "has_water_bottle" field.
func (cuo *ChildUpdateOne) SetHasWaterBottle(b bool) *ChildUpdateOne {
	cuo.mutation.SetHasWaterBottle(b)
	return cuo
}

// SetNillableHasWaterBottle sets the "has_water_bottle" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableHasWaterBottle(b *bool) *ChildUpdateOne {
	if b != nil {
		cuo.SetHasWaterBottle(*b)
	}
	return cuo
}

// SetHasUmbrella sets the "has_umbrella" field.
func (cuo *ChildUpdateOne) SetHasUmbrella(b bool) *ChildUpdateOne {
	cuo.mutation.SetHasUmbrella(b)
	return cuo
}

// SetNillableHasUmbrella sets the "has_umbrella" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableHasUmbrella(b *bool) *ChildUpdateOne {
	if b != nil {
		cuo.SetHasUmbrella(*b)
	}
	return cuo
}

// SetHasOther sets the "has_other" field.
func (cuo *ChildUpdateOne) SetHasOther(b bool) *ChildUpdateOne {
	cuo.mutation.SetHasOther(b)
	return cuo
}

// SetNillableHasOther sets the "has_other" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableHasOther(b *bool) *ChildUpdateOne {
	if b != nil {
		cuo.SetHasOther(*b)
	}
	return cuo
}

// SetCreatedAt sets the "created_at" field.
func (cuo *ChildUpdateOne) SetCreatedAt(t time.Time) *ChildUpdateOne {
	cuo.mutation.SetCreatedAt(t)
	return cuo
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableCreatedAt(t *time.Time) *ChildUpdateOne {
	if t != nil {
		cuo.SetCreatedAt(*t)
	}
	return cuo
}

// SetUpdatedAt sets the "updated_at" field.
func (cuo *ChildUpdateOne) SetUpdatedAt(t time.Time) *ChildUpdateOne {
	cuo.mutation.SetUpdatedAt(t)
	return cuo
}

// SetGuardianID sets the "guardian" edge to the Guardian entity by ID.
func (cuo *ChildUpdateOne) SetGuardianID(id uuid.UUID) *ChildUpdateOne {
	cuo.mutation.SetGuardianID(id)
	return cuo
}

// SetNillableGuardianID sets the "guardian" edge to the Guardian entity by ID if the given value is not nil.
func (cuo *ChildUpdateOne) SetNillableGuardianID(id *uuid.UUID) *ChildUpdateOne {
	if id != nil {
		cuo = cuo.SetGuardianID(*id)
	}
	return cuo
}

// SetGuardian sets the "guardian" edge to the Guardian entity.
func (cuo *ChildUpdateOne) SetGuardian(g *Guardian) *ChildUpdateOne {
	return cuo.SetGuardianID(g.ID)
}

// AddChildBusAssociationIDs adds the "childBusAssociations" edge to the ChildBusAssociation entity by IDs.
func (cuo *ChildUpdateOne) AddChildBusAssociationIDs(ids ...int) *ChildUpdateOne {
	cuo.mutation.AddChildBusAssociationIDs(ids...)
	return cuo
}

// AddChildBusAssociations adds the "childBusAssociations" edges to the ChildBusAssociation entity.
func (cuo *ChildUpdateOne) AddChildBusAssociations(c ...*ChildBusAssociation) *ChildUpdateOne {
	ids := make([]int, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cuo.AddChildBusAssociationIDs(ids...)
}

// AddBoardingRecordIDs adds the "boarding_record" edge to the BoardingRecord entity by IDs.
func (cuo *ChildUpdateOne) AddBoardingRecordIDs(ids ...uuid.UUID) *ChildUpdateOne {
	cuo.mutation.AddBoardingRecordIDs(ids...)
	return cuo
}

// AddBoardingRecord adds the "boarding_record" edges to the BoardingRecord entity.
func (cuo *ChildUpdateOne) AddBoardingRecord(b ...*BoardingRecord) *ChildUpdateOne {
	ids := make([]uuid.UUID, len(b))
	for i := range b {
		ids[i] = b[i].ID
	}
	return cuo.AddBoardingRecordIDs(ids...)
}

// AddPhotoIDs adds the "photos" edge to the ChildPhoto entity by IDs.
func (cuo *ChildUpdateOne) AddPhotoIDs(ids ...uuid.UUID) *ChildUpdateOne {
	cuo.mutation.AddPhotoIDs(ids...)
	return cuo
}

// AddPhotos adds the "photos" edges to the ChildPhoto entity.
func (cuo *ChildUpdateOne) AddPhotos(c ...*ChildPhoto) *ChildUpdateOne {
	ids := make([]uuid.UUID, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cuo.AddPhotoIDs(ids...)
}

// Mutation returns the ChildMutation object of the builder.
func (cuo *ChildUpdateOne) Mutation() *ChildMutation {
	return cuo.mutation
}

// ClearGuardian clears the "guardian" edge to the Guardian entity.
func (cuo *ChildUpdateOne) ClearGuardian() *ChildUpdateOne {
	cuo.mutation.ClearGuardian()
	return cuo
}

// ClearChildBusAssociations clears all "childBusAssociations" edges to the ChildBusAssociation entity.
func (cuo *ChildUpdateOne) ClearChildBusAssociations() *ChildUpdateOne {
	cuo.mutation.ClearChildBusAssociations()
	return cuo
}

// RemoveChildBusAssociationIDs removes the "childBusAssociations" edge to ChildBusAssociation entities by IDs.
func (cuo *ChildUpdateOne) RemoveChildBusAssociationIDs(ids ...int) *ChildUpdateOne {
	cuo.mutation.RemoveChildBusAssociationIDs(ids...)
	return cuo
}

// RemoveChildBusAssociations removes "childBusAssociations" edges to ChildBusAssociation entities.
func (cuo *ChildUpdateOne) RemoveChildBusAssociations(c ...*ChildBusAssociation) *ChildUpdateOne {
	ids := make([]int, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cuo.RemoveChildBusAssociationIDs(ids...)
}

// ClearBoardingRecord clears all "boarding_record" edges to the BoardingRecord entity.
func (cuo *ChildUpdateOne) ClearBoardingRecord() *ChildUpdateOne {
	cuo.mutation.ClearBoardingRecord()
	return cuo
}

// RemoveBoardingRecordIDs removes the "boarding_record" edge to BoardingRecord entities by IDs.
func (cuo *ChildUpdateOne) RemoveBoardingRecordIDs(ids ...uuid.UUID) *ChildUpdateOne {
	cuo.mutation.RemoveBoardingRecordIDs(ids...)
	return cuo
}

// RemoveBoardingRecord removes "boarding_record" edges to BoardingRecord entities.
func (cuo *ChildUpdateOne) RemoveBoardingRecord(b ...*BoardingRecord) *ChildUpdateOne {
	ids := make([]uuid.UUID, len(b))
	for i := range b {
		ids[i] = b[i].ID
	}
	return cuo.RemoveBoardingRecordIDs(ids...)
}

// ClearPhotos clears all "photos" edges to the ChildPhoto entity.
func (cuo *ChildUpdateOne) ClearPhotos() *ChildUpdateOne {
	cuo.mutation.ClearPhotos()
	return cuo
}

// RemovePhotoIDs removes the "photos" edge to ChildPhoto entities by IDs.
func (cuo *ChildUpdateOne) RemovePhotoIDs(ids ...uuid.UUID) *ChildUpdateOne {
	cuo.mutation.RemovePhotoIDs(ids...)
	return cuo
}

// RemovePhotos removes "photos" edges to ChildPhoto entities.
func (cuo *ChildUpdateOne) RemovePhotos(c ...*ChildPhoto) *ChildUpdateOne {
	ids := make([]uuid.UUID, len(c))
	for i := range c {
		ids[i] = c[i].ID
	}
	return cuo.RemovePhotoIDs(ids...)
}

// Where appends a list predicates to the ChildUpdate builder.
func (cuo *ChildUpdateOne) Where(ps ...predicate.Child) *ChildUpdateOne {
	cuo.mutation.Where(ps...)
	return cuo
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (cuo *ChildUpdateOne) Select(field string, fields ...string) *ChildUpdateOne {
	cuo.fields = append([]string{field}, fields...)
	return cuo
}

// Save executes the query and returns the updated Child entity.
func (cuo *ChildUpdateOne) Save(ctx context.Context) (*Child, error) {
	cuo.defaults()
	return withHooks(ctx, cuo.sqlSave, cuo.mutation, cuo.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (cuo *ChildUpdateOne) SaveX(ctx context.Context) *Child {
	node, err := cuo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (cuo *ChildUpdateOne) Exec(ctx context.Context) error {
	_, err := cuo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (cuo *ChildUpdateOne) ExecX(ctx context.Context) {
	if err := cuo.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (cuo *ChildUpdateOne) defaults() {
	if _, ok := cuo.mutation.UpdatedAt(); !ok {
		v := child.UpdateDefaultUpdatedAt()
		cuo.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (cuo *ChildUpdateOne) check() error {
	if v, ok := cuo.mutation.Sex(); ok {
		if err := child.SexValidator(v); err != nil {
			return &ValidationError{Name: "sex", err: fmt.Errorf(`ent: validator failed for field "Child.sex": %w`, err)}
		}
	}
	return nil
}

func (cuo *ChildUpdateOne) sqlSave(ctx context.Context) (_node *Child, err error) {
	if err := cuo.check(); err != nil {
		return _node, err
	}
	_spec := sqlgraph.NewUpdateSpec(child.Table, child.Columns, sqlgraph.NewFieldSpec(child.FieldID, field.TypeUUID))
	id, ok := cuo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "Child.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := cuo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, child.FieldID)
		for _, f := range fields {
			if !child.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != child.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := cuo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := cuo.mutation.Name(); ok {
		_spec.SetField(child.FieldName, field.TypeString, value)
	}
	if value, ok := cuo.mutation.Age(); ok {
		_spec.SetField(child.FieldAge, field.TypeInt, value)
	}
	if value, ok := cuo.mutation.AddedAge(); ok {
		_spec.AddField(child.FieldAge, field.TypeInt, value)
	}
	if value, ok := cuo.mutation.Sex(); ok {
		_spec.SetField(child.FieldSex, field.TypeEnum, value)
	}
	if value, ok := cuo.mutation.CheckForMissingItems(); ok {
		_spec.SetField(child.FieldCheckForMissingItems, field.TypeBool, value)
	}
	if value, ok := cuo.mutation.HasBag(); ok {
		_spec.SetField(child.FieldHasBag, field.TypeBool, value)
	}
	if value, ok := cuo.mutation.HasLunchBox(); ok {
		_spec.SetField(child.FieldHasLunchBox, field.TypeBool, value)
	}
	if value, ok := cuo.mutation.HasWaterBottle(); ok {
		_spec.SetField(child.FieldHasWaterBottle, field.TypeBool, value)
	}
	if value, ok := cuo.mutation.HasUmbrella(); ok {
		_spec.SetField(child.FieldHasUmbrella, field.TypeBool, value)
	}
	if value, ok := cuo.mutation.HasOther(); ok {
		_spec.SetField(child.FieldHasOther, field.TypeBool, value)
	}
	if value, ok := cuo.mutation.CreatedAt(); ok {
		_spec.SetField(child.FieldCreatedAt, field.TypeTime, value)
	}
	if value, ok := cuo.mutation.UpdatedAt(); ok {
		_spec.SetField(child.FieldUpdatedAt, field.TypeTime, value)
	}
	if cuo.mutation.GuardianCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cuo.mutation.GuardianIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if cuo.mutation.ChildBusAssociationsCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cuo.mutation.RemovedChildBusAssociationsIDs(); len(nodes) > 0 && !cuo.mutation.ChildBusAssociationsCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cuo.mutation.ChildBusAssociationsIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if cuo.mutation.BoardingRecordCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cuo.mutation.RemovedBoardingRecordIDs(); len(nodes) > 0 && !cuo.mutation.BoardingRecordCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cuo.mutation.BoardingRecordIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if cuo.mutation.PhotosCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cuo.mutation.RemovedPhotosIDs(); len(nodes) > 0 && !cuo.mutation.PhotosCleared() {
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
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := cuo.mutation.PhotosIDs(); len(nodes) > 0 {
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
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	_node = &Child{config: cuo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, cuo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{child.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	cuo.mutation.done = true
	return _node, nil
}
