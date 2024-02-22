// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busroute"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busrouteassociation"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
	"github.com/google/uuid"
)

// BusRouteAssociationUpdate is the builder for updating BusRouteAssociation entities.
type BusRouteAssociationUpdate struct {
	config
	hooks    []Hook
	mutation *BusRouteAssociationMutation
}

// Where appends a list predicates to the BusRouteAssociationUpdate builder.
func (brau *BusRouteAssociationUpdate) Where(ps ...predicate.BusRouteAssociation) *BusRouteAssociationUpdate {
	brau.mutation.Where(ps...)
	return brau
}

// SetStationID sets the "station_id" field.
func (brau *BusRouteAssociationUpdate) SetStationID(u uuid.UUID) *BusRouteAssociationUpdate {
	brau.mutation.SetStationID(u)
	return brau
}

// SetNillableStationID sets the "station_id" field if the given value is not nil.
func (brau *BusRouteAssociationUpdate) SetNillableStationID(u *uuid.UUID) *BusRouteAssociationUpdate {
	if u != nil {
		brau.SetStationID(*u)
	}
	return brau
}

// SetBusRouteID sets the "bus_route_id" field.
func (brau *BusRouteAssociationUpdate) SetBusRouteID(u uuid.UUID) *BusRouteAssociationUpdate {
	brau.mutation.SetBusRouteID(u)
	return brau
}

// SetNillableBusRouteID sets the "bus_route_id" field if the given value is not nil.
func (brau *BusRouteAssociationUpdate) SetNillableBusRouteID(u *uuid.UUID) *BusRouteAssociationUpdate {
	if u != nil {
		brau.SetBusRouteID(*u)
	}
	return brau
}

// SetOrder sets the "order" field.
func (brau *BusRouteAssociationUpdate) SetOrder(i int32) *BusRouteAssociationUpdate {
	brau.mutation.ResetOrder()
	brau.mutation.SetOrder(i)
	return brau
}

// SetNillableOrder sets the "order" field if the given value is not nil.
func (brau *BusRouteAssociationUpdate) SetNillableOrder(i *int32) *BusRouteAssociationUpdate {
	if i != nil {
		brau.SetOrder(*i)
	}
	return brau
}

// AddOrder adds i to the "order" field.
func (brau *BusRouteAssociationUpdate) AddOrder(i int32) *BusRouteAssociationUpdate {
	brau.mutation.AddOrder(i)
	return brau
}

// SetStation sets the "station" edge to the Station entity.
func (brau *BusRouteAssociationUpdate) SetStation(s *Station) *BusRouteAssociationUpdate {
	return brau.SetStationID(s.ID)
}

// SetBusRoute sets the "busRoute" edge to the BusRoute entity.
func (brau *BusRouteAssociationUpdate) SetBusRoute(b *BusRoute) *BusRouteAssociationUpdate {
	return brau.SetBusRouteID(b.ID)
}

// Mutation returns the BusRouteAssociationMutation object of the builder.
func (brau *BusRouteAssociationUpdate) Mutation() *BusRouteAssociationMutation {
	return brau.mutation
}

// ClearStation clears the "station" edge to the Station entity.
func (brau *BusRouteAssociationUpdate) ClearStation() *BusRouteAssociationUpdate {
	brau.mutation.ClearStation()
	return brau
}

// ClearBusRoute clears the "busRoute" edge to the BusRoute entity.
func (brau *BusRouteAssociationUpdate) ClearBusRoute() *BusRouteAssociationUpdate {
	brau.mutation.ClearBusRoute()
	return brau
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (brau *BusRouteAssociationUpdate) Save(ctx context.Context) (int, error) {
	return withHooks(ctx, brau.sqlSave, brau.mutation, brau.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (brau *BusRouteAssociationUpdate) SaveX(ctx context.Context) int {
	affected, err := brau.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (brau *BusRouteAssociationUpdate) Exec(ctx context.Context) error {
	_, err := brau.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (brau *BusRouteAssociationUpdate) ExecX(ctx context.Context) {
	if err := brau.Exec(ctx); err != nil {
		panic(err)
	}
}

// check runs all checks and user-defined validators on the builder.
func (brau *BusRouteAssociationUpdate) check() error {
	if _, ok := brau.mutation.StationID(); brau.mutation.StationCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "BusRouteAssociation.station"`)
	}
	if _, ok := brau.mutation.BusRouteID(); brau.mutation.BusRouteCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "BusRouteAssociation.busRoute"`)
	}
	return nil
}

func (brau *BusRouteAssociationUpdate) sqlSave(ctx context.Context) (n int, err error) {
	if err := brau.check(); err != nil {
		return n, err
	}
	_spec := sqlgraph.NewUpdateSpec(busrouteassociation.Table, busrouteassociation.Columns, sqlgraph.NewFieldSpec(busrouteassociation.FieldID, field.TypeInt))
	if ps := brau.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := brau.mutation.Order(); ok {
		_spec.SetField(busrouteassociation.FieldOrder, field.TypeInt32, value)
	}
	if value, ok := brau.mutation.AddedOrder(); ok {
		_spec.AddField(busrouteassociation.FieldOrder, field.TypeInt32, value)
	}
	if brau.mutation.StationCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   busrouteassociation.StationTable,
			Columns: []string{busrouteassociation.StationColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(station.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := brau.mutation.StationIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   busrouteassociation.StationTable,
			Columns: []string{busrouteassociation.StationColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(station.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if brau.mutation.BusRouteCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   busrouteassociation.BusRouteTable,
			Columns: []string{busrouteassociation.BusRouteColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(busroute.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := brau.mutation.BusRouteIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   busrouteassociation.BusRouteTable,
			Columns: []string{busrouteassociation.BusRouteColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(busroute.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if n, err = sqlgraph.UpdateNodes(ctx, brau.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{busrouteassociation.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	brau.mutation.done = true
	return n, nil
}

// BusRouteAssociationUpdateOne is the builder for updating a single BusRouteAssociation entity.
type BusRouteAssociationUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *BusRouteAssociationMutation
}

// SetStationID sets the "station_id" field.
func (brauo *BusRouteAssociationUpdateOne) SetStationID(u uuid.UUID) *BusRouteAssociationUpdateOne {
	brauo.mutation.SetStationID(u)
	return brauo
}

// SetNillableStationID sets the "station_id" field if the given value is not nil.
func (brauo *BusRouteAssociationUpdateOne) SetNillableStationID(u *uuid.UUID) *BusRouteAssociationUpdateOne {
	if u != nil {
		brauo.SetStationID(*u)
	}
	return brauo
}

// SetBusRouteID sets the "bus_route_id" field.
func (brauo *BusRouteAssociationUpdateOne) SetBusRouteID(u uuid.UUID) *BusRouteAssociationUpdateOne {
	brauo.mutation.SetBusRouteID(u)
	return brauo
}

// SetNillableBusRouteID sets the "bus_route_id" field if the given value is not nil.
func (brauo *BusRouteAssociationUpdateOne) SetNillableBusRouteID(u *uuid.UUID) *BusRouteAssociationUpdateOne {
	if u != nil {
		brauo.SetBusRouteID(*u)
	}
	return brauo
}

// SetOrder sets the "order" field.
func (brauo *BusRouteAssociationUpdateOne) SetOrder(i int32) *BusRouteAssociationUpdateOne {
	brauo.mutation.ResetOrder()
	brauo.mutation.SetOrder(i)
	return brauo
}

// SetNillableOrder sets the "order" field if the given value is not nil.
func (brauo *BusRouteAssociationUpdateOne) SetNillableOrder(i *int32) *BusRouteAssociationUpdateOne {
	if i != nil {
		brauo.SetOrder(*i)
	}
	return brauo
}

// AddOrder adds i to the "order" field.
func (brauo *BusRouteAssociationUpdateOne) AddOrder(i int32) *BusRouteAssociationUpdateOne {
	brauo.mutation.AddOrder(i)
	return brauo
}

// SetStation sets the "station" edge to the Station entity.
func (brauo *BusRouteAssociationUpdateOne) SetStation(s *Station) *BusRouteAssociationUpdateOne {
	return brauo.SetStationID(s.ID)
}

// SetBusRoute sets the "busRoute" edge to the BusRoute entity.
func (brauo *BusRouteAssociationUpdateOne) SetBusRoute(b *BusRoute) *BusRouteAssociationUpdateOne {
	return brauo.SetBusRouteID(b.ID)
}

// Mutation returns the BusRouteAssociationMutation object of the builder.
func (brauo *BusRouteAssociationUpdateOne) Mutation() *BusRouteAssociationMutation {
	return brauo.mutation
}

// ClearStation clears the "station" edge to the Station entity.
func (brauo *BusRouteAssociationUpdateOne) ClearStation() *BusRouteAssociationUpdateOne {
	brauo.mutation.ClearStation()
	return brauo
}

// ClearBusRoute clears the "busRoute" edge to the BusRoute entity.
func (brauo *BusRouteAssociationUpdateOne) ClearBusRoute() *BusRouteAssociationUpdateOne {
	brauo.mutation.ClearBusRoute()
	return brauo
}

// Where appends a list predicates to the BusRouteAssociationUpdate builder.
func (brauo *BusRouteAssociationUpdateOne) Where(ps ...predicate.BusRouteAssociation) *BusRouteAssociationUpdateOne {
	brauo.mutation.Where(ps...)
	return brauo
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (brauo *BusRouteAssociationUpdateOne) Select(field string, fields ...string) *BusRouteAssociationUpdateOne {
	brauo.fields = append([]string{field}, fields...)
	return brauo
}

// Save executes the query and returns the updated BusRouteAssociation entity.
func (brauo *BusRouteAssociationUpdateOne) Save(ctx context.Context) (*BusRouteAssociation, error) {
	return withHooks(ctx, brauo.sqlSave, brauo.mutation, brauo.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (brauo *BusRouteAssociationUpdateOne) SaveX(ctx context.Context) *BusRouteAssociation {
	node, err := brauo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (brauo *BusRouteAssociationUpdateOne) Exec(ctx context.Context) error {
	_, err := brauo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (brauo *BusRouteAssociationUpdateOne) ExecX(ctx context.Context) {
	if err := brauo.Exec(ctx); err != nil {
		panic(err)
	}
}

// check runs all checks and user-defined validators on the builder.
func (brauo *BusRouteAssociationUpdateOne) check() error {
	if _, ok := brauo.mutation.StationID(); brauo.mutation.StationCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "BusRouteAssociation.station"`)
	}
	if _, ok := brauo.mutation.BusRouteID(); brauo.mutation.BusRouteCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "BusRouteAssociation.busRoute"`)
	}
	return nil
}

func (brauo *BusRouteAssociationUpdateOne) sqlSave(ctx context.Context) (_node *BusRouteAssociation, err error) {
	if err := brauo.check(); err != nil {
		return _node, err
	}
	_spec := sqlgraph.NewUpdateSpec(busrouteassociation.Table, busrouteassociation.Columns, sqlgraph.NewFieldSpec(busrouteassociation.FieldID, field.TypeInt))
	id, ok := brauo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "BusRouteAssociation.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := brauo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, busrouteassociation.FieldID)
		for _, f := range fields {
			if !busrouteassociation.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != busrouteassociation.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := brauo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := brauo.mutation.Order(); ok {
		_spec.SetField(busrouteassociation.FieldOrder, field.TypeInt32, value)
	}
	if value, ok := brauo.mutation.AddedOrder(); ok {
		_spec.AddField(busrouteassociation.FieldOrder, field.TypeInt32, value)
	}
	if brauo.mutation.StationCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   busrouteassociation.StationTable,
			Columns: []string{busrouteassociation.StationColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(station.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := brauo.mutation.StationIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   busrouteassociation.StationTable,
			Columns: []string{busrouteassociation.StationColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(station.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if brauo.mutation.BusRouteCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   busrouteassociation.BusRouteTable,
			Columns: []string{busrouteassociation.BusRouteColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(busroute.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := brauo.mutation.BusRouteIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   busrouteassociation.BusRouteTable,
			Columns: []string{busrouteassociation.BusRouteColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(busroute.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	_node = &BusRouteAssociation{config: brauo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, brauo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{busrouteassociation.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	brauo.mutation.done = true
	return _node, nil
}
