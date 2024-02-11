// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"fmt"
	"math"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childbusassociation"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/google/uuid"
)

// ChildBusAssociationQuery is the builder for querying ChildBusAssociation entities.
type ChildBusAssociationQuery struct {
	config
	ctx        *QueryContext
	order      []childbusassociation.OrderOption
	inters     []Interceptor
	predicates []predicate.ChildBusAssociation
	withChild  *ChildQuery
	withBus    *BusQuery
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the ChildBusAssociationQuery builder.
func (cbaq *ChildBusAssociationQuery) Where(ps ...predicate.ChildBusAssociation) *ChildBusAssociationQuery {
	cbaq.predicates = append(cbaq.predicates, ps...)
	return cbaq
}

// Limit the number of records to be returned by this query.
func (cbaq *ChildBusAssociationQuery) Limit(limit int) *ChildBusAssociationQuery {
	cbaq.ctx.Limit = &limit
	return cbaq
}

// Offset to start from.
func (cbaq *ChildBusAssociationQuery) Offset(offset int) *ChildBusAssociationQuery {
	cbaq.ctx.Offset = &offset
	return cbaq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (cbaq *ChildBusAssociationQuery) Unique(unique bool) *ChildBusAssociationQuery {
	cbaq.ctx.Unique = &unique
	return cbaq
}

// Order specifies how the records should be ordered.
func (cbaq *ChildBusAssociationQuery) Order(o ...childbusassociation.OrderOption) *ChildBusAssociationQuery {
	cbaq.order = append(cbaq.order, o...)
	return cbaq
}

// QueryChild chains the current query on the "child" edge.
func (cbaq *ChildBusAssociationQuery) QueryChild() *ChildQuery {
	query := (&ChildClient{config: cbaq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := cbaq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := cbaq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(childbusassociation.Table, childbusassociation.FieldID, selector),
			sqlgraph.To(child.Table, child.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, childbusassociation.ChildTable, childbusassociation.ChildColumn),
		)
		fromU = sqlgraph.SetNeighbors(cbaq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryBus chains the current query on the "bus" edge.
func (cbaq *ChildBusAssociationQuery) QueryBus() *BusQuery {
	query := (&BusClient{config: cbaq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := cbaq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := cbaq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(childbusassociation.Table, childbusassociation.FieldID, selector),
			sqlgraph.To(bus.Table, bus.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, childbusassociation.BusTable, childbusassociation.BusColumn),
		)
		fromU = sqlgraph.SetNeighbors(cbaq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first ChildBusAssociation entity from the query.
// Returns a *NotFoundError when no ChildBusAssociation was found.
func (cbaq *ChildBusAssociationQuery) First(ctx context.Context) (*ChildBusAssociation, error) {
	nodes, err := cbaq.Limit(1).All(setContextOp(ctx, cbaq.ctx, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{childbusassociation.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (cbaq *ChildBusAssociationQuery) FirstX(ctx context.Context) *ChildBusAssociation {
	node, err := cbaq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first ChildBusAssociation ID from the query.
// Returns a *NotFoundError when no ChildBusAssociation ID was found.
func (cbaq *ChildBusAssociationQuery) FirstID(ctx context.Context) (id int, err error) {
	var ids []int
	if ids, err = cbaq.Limit(1).IDs(setContextOp(ctx, cbaq.ctx, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{childbusassociation.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (cbaq *ChildBusAssociationQuery) FirstIDX(ctx context.Context) int {
	id, err := cbaq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single ChildBusAssociation entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one ChildBusAssociation entity is found.
// Returns a *NotFoundError when no ChildBusAssociation entities are found.
func (cbaq *ChildBusAssociationQuery) Only(ctx context.Context) (*ChildBusAssociation, error) {
	nodes, err := cbaq.Limit(2).All(setContextOp(ctx, cbaq.ctx, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{childbusassociation.Label}
	default:
		return nil, &NotSingularError{childbusassociation.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (cbaq *ChildBusAssociationQuery) OnlyX(ctx context.Context) *ChildBusAssociation {
	node, err := cbaq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only ChildBusAssociation ID in the query.
// Returns a *NotSingularError when more than one ChildBusAssociation ID is found.
// Returns a *NotFoundError when no entities are found.
func (cbaq *ChildBusAssociationQuery) OnlyID(ctx context.Context) (id int, err error) {
	var ids []int
	if ids, err = cbaq.Limit(2).IDs(setContextOp(ctx, cbaq.ctx, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{childbusassociation.Label}
	default:
		err = &NotSingularError{childbusassociation.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (cbaq *ChildBusAssociationQuery) OnlyIDX(ctx context.Context) int {
	id, err := cbaq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of ChildBusAssociations.
func (cbaq *ChildBusAssociationQuery) All(ctx context.Context) ([]*ChildBusAssociation, error) {
	ctx = setContextOp(ctx, cbaq.ctx, "All")
	if err := cbaq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*ChildBusAssociation, *ChildBusAssociationQuery]()
	return withInterceptors[[]*ChildBusAssociation](ctx, cbaq, qr, cbaq.inters)
}

// AllX is like All, but panics if an error occurs.
func (cbaq *ChildBusAssociationQuery) AllX(ctx context.Context) []*ChildBusAssociation {
	nodes, err := cbaq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of ChildBusAssociation IDs.
func (cbaq *ChildBusAssociationQuery) IDs(ctx context.Context) (ids []int, err error) {
	if cbaq.ctx.Unique == nil && cbaq.path != nil {
		cbaq.Unique(true)
	}
	ctx = setContextOp(ctx, cbaq.ctx, "IDs")
	if err = cbaq.Select(childbusassociation.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (cbaq *ChildBusAssociationQuery) IDsX(ctx context.Context) []int {
	ids, err := cbaq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (cbaq *ChildBusAssociationQuery) Count(ctx context.Context) (int, error) {
	ctx = setContextOp(ctx, cbaq.ctx, "Count")
	if err := cbaq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, cbaq, querierCount[*ChildBusAssociationQuery](), cbaq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (cbaq *ChildBusAssociationQuery) CountX(ctx context.Context) int {
	count, err := cbaq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (cbaq *ChildBusAssociationQuery) Exist(ctx context.Context) (bool, error) {
	ctx = setContextOp(ctx, cbaq.ctx, "Exist")
	switch _, err := cbaq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (cbaq *ChildBusAssociationQuery) ExistX(ctx context.Context) bool {
	exist, err := cbaq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the ChildBusAssociationQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (cbaq *ChildBusAssociationQuery) Clone() *ChildBusAssociationQuery {
	if cbaq == nil {
		return nil
	}
	return &ChildBusAssociationQuery{
		config:     cbaq.config,
		ctx:        cbaq.ctx.Clone(),
		order:      append([]childbusassociation.OrderOption{}, cbaq.order...),
		inters:     append([]Interceptor{}, cbaq.inters...),
		predicates: append([]predicate.ChildBusAssociation{}, cbaq.predicates...),
		withChild:  cbaq.withChild.Clone(),
		withBus:    cbaq.withBus.Clone(),
		// clone intermediate query.
		sql:  cbaq.sql.Clone(),
		path: cbaq.path,
	}
}

// WithChild tells the query-builder to eager-load the nodes that are connected to
// the "child" edge. The optional arguments are used to configure the query builder of the edge.
func (cbaq *ChildBusAssociationQuery) WithChild(opts ...func(*ChildQuery)) *ChildBusAssociationQuery {
	query := (&ChildClient{config: cbaq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	cbaq.withChild = query
	return cbaq
}

// WithBus tells the query-builder to eager-load the nodes that are connected to
// the "bus" edge. The optional arguments are used to configure the query builder of the edge.
func (cbaq *ChildBusAssociationQuery) WithBus(opts ...func(*BusQuery)) *ChildBusAssociationQuery {
	query := (&BusClient{config: cbaq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	cbaq.withBus = query
	return cbaq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		ChildID uuid.UUID `json:"child_id,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.ChildBusAssociation.Query().
//		GroupBy(childbusassociation.FieldChildID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (cbaq *ChildBusAssociationQuery) GroupBy(field string, fields ...string) *ChildBusAssociationGroupBy {
	cbaq.ctx.Fields = append([]string{field}, fields...)
	grbuild := &ChildBusAssociationGroupBy{build: cbaq}
	grbuild.flds = &cbaq.ctx.Fields
	grbuild.label = childbusassociation.Label
	grbuild.scan = grbuild.Scan
	return grbuild
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		ChildID uuid.UUID `json:"child_id,omitempty"`
//	}
//
//	client.ChildBusAssociation.Query().
//		Select(childbusassociation.FieldChildID).
//		Scan(ctx, &v)
func (cbaq *ChildBusAssociationQuery) Select(fields ...string) *ChildBusAssociationSelect {
	cbaq.ctx.Fields = append(cbaq.ctx.Fields, fields...)
	sbuild := &ChildBusAssociationSelect{ChildBusAssociationQuery: cbaq}
	sbuild.label = childbusassociation.Label
	sbuild.flds, sbuild.scan = &cbaq.ctx.Fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a ChildBusAssociationSelect configured with the given aggregations.
func (cbaq *ChildBusAssociationQuery) Aggregate(fns ...AggregateFunc) *ChildBusAssociationSelect {
	return cbaq.Select().Aggregate(fns...)
}

func (cbaq *ChildBusAssociationQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range cbaq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, cbaq); err != nil {
				return err
			}
		}
	}
	for _, f := range cbaq.ctx.Fields {
		if !childbusassociation.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if cbaq.path != nil {
		prev, err := cbaq.path(ctx)
		if err != nil {
			return err
		}
		cbaq.sql = prev
	}
	return nil
}

func (cbaq *ChildBusAssociationQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*ChildBusAssociation, error) {
	var (
		nodes       = []*ChildBusAssociation{}
		_spec       = cbaq.querySpec()
		loadedTypes = [2]bool{
			cbaq.withChild != nil,
			cbaq.withBus != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*ChildBusAssociation).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &ChildBusAssociation{config: cbaq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, cbaq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := cbaq.withChild; query != nil {
		if err := cbaq.loadChild(ctx, query, nodes, nil,
			func(n *ChildBusAssociation, e *Child) { n.Edges.Child = e }); err != nil {
			return nil, err
		}
	}
	if query := cbaq.withBus; query != nil {
		if err := cbaq.loadBus(ctx, query, nodes, nil,
			func(n *ChildBusAssociation, e *Bus) { n.Edges.Bus = e }); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (cbaq *ChildBusAssociationQuery) loadChild(ctx context.Context, query *ChildQuery, nodes []*ChildBusAssociation, init func(*ChildBusAssociation), assign func(*ChildBusAssociation, *Child)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*ChildBusAssociation)
	for i := range nodes {
		fk := nodes[i].ChildID
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	if len(ids) == 0 {
		return nil
	}
	query.Where(child.IDIn(ids...))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		nodes, ok := nodeids[n.ID]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "child_id" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}
func (cbaq *ChildBusAssociationQuery) loadBus(ctx context.Context, query *BusQuery, nodes []*ChildBusAssociation, init func(*ChildBusAssociation), assign func(*ChildBusAssociation, *Bus)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*ChildBusAssociation)
	for i := range nodes {
		fk := nodes[i].BusID
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	if len(ids) == 0 {
		return nil
	}
	query.Where(bus.IDIn(ids...))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		nodes, ok := nodeids[n.ID]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "bus_id" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}

func (cbaq *ChildBusAssociationQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := cbaq.querySpec()
	_spec.Node.Columns = cbaq.ctx.Fields
	if len(cbaq.ctx.Fields) > 0 {
		_spec.Unique = cbaq.ctx.Unique != nil && *cbaq.ctx.Unique
	}
	return sqlgraph.CountNodes(ctx, cbaq.driver, _spec)
}

func (cbaq *ChildBusAssociationQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := sqlgraph.NewQuerySpec(childbusassociation.Table, childbusassociation.Columns, sqlgraph.NewFieldSpec(childbusassociation.FieldID, field.TypeInt))
	_spec.From = cbaq.sql
	if unique := cbaq.ctx.Unique; unique != nil {
		_spec.Unique = *unique
	} else if cbaq.path != nil {
		_spec.Unique = true
	}
	if fields := cbaq.ctx.Fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, childbusassociation.FieldID)
		for i := range fields {
			if fields[i] != childbusassociation.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
		if cbaq.withChild != nil {
			_spec.Node.AddColumnOnce(childbusassociation.FieldChildID)
		}
		if cbaq.withBus != nil {
			_spec.Node.AddColumnOnce(childbusassociation.FieldBusID)
		}
	}
	if ps := cbaq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := cbaq.ctx.Limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := cbaq.ctx.Offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := cbaq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (cbaq *ChildBusAssociationQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(cbaq.driver.Dialect())
	t1 := builder.Table(childbusassociation.Table)
	columns := cbaq.ctx.Fields
	if len(columns) == 0 {
		columns = childbusassociation.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if cbaq.sql != nil {
		selector = cbaq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if cbaq.ctx.Unique != nil && *cbaq.ctx.Unique {
		selector.Distinct()
	}
	for _, p := range cbaq.predicates {
		p(selector)
	}
	for _, p := range cbaq.order {
		p(selector)
	}
	if offset := cbaq.ctx.Offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := cbaq.ctx.Limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// ChildBusAssociationGroupBy is the group-by builder for ChildBusAssociation entities.
type ChildBusAssociationGroupBy struct {
	selector
	build *ChildBusAssociationQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (cbagb *ChildBusAssociationGroupBy) Aggregate(fns ...AggregateFunc) *ChildBusAssociationGroupBy {
	cbagb.fns = append(cbagb.fns, fns...)
	return cbagb
}

// Scan applies the selector query and scans the result into the given value.
func (cbagb *ChildBusAssociationGroupBy) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, cbagb.build.ctx, "GroupBy")
	if err := cbagb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*ChildBusAssociationQuery, *ChildBusAssociationGroupBy](ctx, cbagb.build, cbagb, cbagb.build.inters, v)
}

func (cbagb *ChildBusAssociationGroupBy) sqlScan(ctx context.Context, root *ChildBusAssociationQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(cbagb.fns))
	for _, fn := range cbagb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*cbagb.flds)+len(cbagb.fns))
		for _, f := range *cbagb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*cbagb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := cbagb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// ChildBusAssociationSelect is the builder for selecting fields of ChildBusAssociation entities.
type ChildBusAssociationSelect struct {
	*ChildBusAssociationQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (cbas *ChildBusAssociationSelect) Aggregate(fns ...AggregateFunc) *ChildBusAssociationSelect {
	cbas.fns = append(cbas.fns, fns...)
	return cbas
}

// Scan applies the selector query and scans the result into the given value.
func (cbas *ChildBusAssociationSelect) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, cbas.ctx, "Select")
	if err := cbas.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*ChildBusAssociationQuery, *ChildBusAssociationSelect](ctx, cbas.ChildBusAssociationQuery, cbas, cbas.inters, v)
}

func (cbas *ChildBusAssociationSelect) sqlScan(ctx context.Context, root *ChildBusAssociationQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(cbas.fns))
	for _, fn := range cbas.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*cbas.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := cbas.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}