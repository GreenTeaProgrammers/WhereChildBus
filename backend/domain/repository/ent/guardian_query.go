// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"database/sql/driver"
	"fmt"
	"math"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
	"github.com/google/uuid"
)

// GuardianQuery is the builder for querying Guardian entities.
type GuardianQuery struct {
	config
	ctx          *QueryContext
	order        []guardian.OrderOption
	inters       []Interceptor
	predicates   []predicate.Guardian
	withChildren *ChildQuery
	withNursery  *NurseryQuery
	withStation  *StationQuery
	withFKs      bool
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the GuardianQuery builder.
func (gq *GuardianQuery) Where(ps ...predicate.Guardian) *GuardianQuery {
	gq.predicates = append(gq.predicates, ps...)
	return gq
}

// Limit the number of records to be returned by this query.
func (gq *GuardianQuery) Limit(limit int) *GuardianQuery {
	gq.ctx.Limit = &limit
	return gq
}

// Offset to start from.
func (gq *GuardianQuery) Offset(offset int) *GuardianQuery {
	gq.ctx.Offset = &offset
	return gq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (gq *GuardianQuery) Unique(unique bool) *GuardianQuery {
	gq.ctx.Unique = &unique
	return gq
}

// Order specifies how the records should be ordered.
func (gq *GuardianQuery) Order(o ...guardian.OrderOption) *GuardianQuery {
	gq.order = append(gq.order, o...)
	return gq
}

// QueryChildren chains the current query on the "children" edge.
func (gq *GuardianQuery) QueryChildren() *ChildQuery {
	query := (&ChildClient{config: gq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := gq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := gq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(guardian.Table, guardian.FieldID, selector),
			sqlgraph.To(child.Table, child.FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, guardian.ChildrenTable, guardian.ChildrenColumn),
		)
		fromU = sqlgraph.SetNeighbors(gq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryNursery chains the current query on the "nursery" edge.
func (gq *GuardianQuery) QueryNursery() *NurseryQuery {
	query := (&NurseryClient{config: gq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := gq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := gq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(guardian.Table, guardian.FieldID, selector),
			sqlgraph.To(nursery.Table, nursery.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, guardian.NurseryTable, guardian.NurseryColumn),
		)
		fromU = sqlgraph.SetNeighbors(gq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryStation chains the current query on the "station" edge.
func (gq *GuardianQuery) QueryStation() *StationQuery {
	query := (&StationClient{config: gq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := gq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := gq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(guardian.Table, guardian.FieldID, selector),
			sqlgraph.To(station.Table, station.FieldID),
			sqlgraph.Edge(sqlgraph.O2O, false, guardian.StationTable, guardian.StationColumn),
		)
		fromU = sqlgraph.SetNeighbors(gq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first Guardian entity from the query.
// Returns a *NotFoundError when no Guardian was found.
func (gq *GuardianQuery) First(ctx context.Context) (*Guardian, error) {
	nodes, err := gq.Limit(1).All(setContextOp(ctx, gq.ctx, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{guardian.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (gq *GuardianQuery) FirstX(ctx context.Context) *Guardian {
	node, err := gq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first Guardian ID from the query.
// Returns a *NotFoundError when no Guardian ID was found.
func (gq *GuardianQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = gq.Limit(1).IDs(setContextOp(ctx, gq.ctx, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{guardian.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (gq *GuardianQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := gq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single Guardian entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one Guardian entity is found.
// Returns a *NotFoundError when no Guardian entities are found.
func (gq *GuardianQuery) Only(ctx context.Context) (*Guardian, error) {
	nodes, err := gq.Limit(2).All(setContextOp(ctx, gq.ctx, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{guardian.Label}
	default:
		return nil, &NotSingularError{guardian.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (gq *GuardianQuery) OnlyX(ctx context.Context) *Guardian {
	node, err := gq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only Guardian ID in the query.
// Returns a *NotSingularError when more than one Guardian ID is found.
// Returns a *NotFoundError when no entities are found.
func (gq *GuardianQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = gq.Limit(2).IDs(setContextOp(ctx, gq.ctx, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{guardian.Label}
	default:
		err = &NotSingularError{guardian.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (gq *GuardianQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := gq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of Guardians.
func (gq *GuardianQuery) All(ctx context.Context) ([]*Guardian, error) {
	ctx = setContextOp(ctx, gq.ctx, "All")
	if err := gq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*Guardian, *GuardianQuery]()
	return withInterceptors[[]*Guardian](ctx, gq, qr, gq.inters)
}

// AllX is like All, but panics if an error occurs.
func (gq *GuardianQuery) AllX(ctx context.Context) []*Guardian {
	nodes, err := gq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of Guardian IDs.
func (gq *GuardianQuery) IDs(ctx context.Context) (ids []uuid.UUID, err error) {
	if gq.ctx.Unique == nil && gq.path != nil {
		gq.Unique(true)
	}
	ctx = setContextOp(ctx, gq.ctx, "IDs")
	if err = gq.Select(guardian.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (gq *GuardianQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := gq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (gq *GuardianQuery) Count(ctx context.Context) (int, error) {
	ctx = setContextOp(ctx, gq.ctx, "Count")
	if err := gq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, gq, querierCount[*GuardianQuery](), gq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (gq *GuardianQuery) CountX(ctx context.Context) int {
	count, err := gq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (gq *GuardianQuery) Exist(ctx context.Context) (bool, error) {
	ctx = setContextOp(ctx, gq.ctx, "Exist")
	switch _, err := gq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (gq *GuardianQuery) ExistX(ctx context.Context) bool {
	exist, err := gq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the GuardianQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (gq *GuardianQuery) Clone() *GuardianQuery {
	if gq == nil {
		return nil
	}
	return &GuardianQuery{
		config:       gq.config,
		ctx:          gq.ctx.Clone(),
		order:        append([]guardian.OrderOption{}, gq.order...),
		inters:       append([]Interceptor{}, gq.inters...),
		predicates:   append([]predicate.Guardian{}, gq.predicates...),
		withChildren: gq.withChildren.Clone(),
		withNursery:  gq.withNursery.Clone(),
		withStation:  gq.withStation.Clone(),
		// clone intermediate query.
		sql:  gq.sql.Clone(),
		path: gq.path,
	}
}

// WithChildren tells the query-builder to eager-load the nodes that are connected to
// the "children" edge. The optional arguments are used to configure the query builder of the edge.
func (gq *GuardianQuery) WithChildren(opts ...func(*ChildQuery)) *GuardianQuery {
	query := (&ChildClient{config: gq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	gq.withChildren = query
	return gq
}

// WithNursery tells the query-builder to eager-load the nodes that are connected to
// the "nursery" edge. The optional arguments are used to configure the query builder of the edge.
func (gq *GuardianQuery) WithNursery(opts ...func(*NurseryQuery)) *GuardianQuery {
	query := (&NurseryClient{config: gq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	gq.withNursery = query
	return gq
}

// WithStation tells the query-builder to eager-load the nodes that are connected to
// the "station" edge. The optional arguments are used to configure the query builder of the edge.
func (gq *GuardianQuery) WithStation(opts ...func(*StationQuery)) *GuardianQuery {
	query := (&StationClient{config: gq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	gq.withStation = query
	return gq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		Email string `json:"email,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.Guardian.Query().
//		GroupBy(guardian.FieldEmail).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (gq *GuardianQuery) GroupBy(field string, fields ...string) *GuardianGroupBy {
	gq.ctx.Fields = append([]string{field}, fields...)
	grbuild := &GuardianGroupBy{build: gq}
	grbuild.flds = &gq.ctx.Fields
	grbuild.label = guardian.Label
	grbuild.scan = grbuild.Scan
	return grbuild
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		Email string `json:"email,omitempty"`
//	}
//
//	client.Guardian.Query().
//		Select(guardian.FieldEmail).
//		Scan(ctx, &v)
func (gq *GuardianQuery) Select(fields ...string) *GuardianSelect {
	gq.ctx.Fields = append(gq.ctx.Fields, fields...)
	sbuild := &GuardianSelect{GuardianQuery: gq}
	sbuild.label = guardian.Label
	sbuild.flds, sbuild.scan = &gq.ctx.Fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a GuardianSelect configured with the given aggregations.
func (gq *GuardianQuery) Aggregate(fns ...AggregateFunc) *GuardianSelect {
	return gq.Select().Aggregate(fns...)
}

func (gq *GuardianQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range gq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, gq); err != nil {
				return err
			}
		}
	}
	for _, f := range gq.ctx.Fields {
		if !guardian.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if gq.path != nil {
		prev, err := gq.path(ctx)
		if err != nil {
			return err
		}
		gq.sql = prev
	}
	return nil
}

func (gq *GuardianQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*Guardian, error) {
	var (
		nodes       = []*Guardian{}
		withFKs     = gq.withFKs
		_spec       = gq.querySpec()
		loadedTypes = [3]bool{
			gq.withChildren != nil,
			gq.withNursery != nil,
			gq.withStation != nil,
		}
	)
	if gq.withNursery != nil {
		withFKs = true
	}
	if withFKs {
		_spec.Node.Columns = append(_spec.Node.Columns, guardian.ForeignKeys...)
	}
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*Guardian).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &Guardian{config: gq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, gq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := gq.withChildren; query != nil {
		if err := gq.loadChildren(ctx, query, nodes,
			func(n *Guardian) { n.Edges.Children = []*Child{} },
			func(n *Guardian, e *Child) { n.Edges.Children = append(n.Edges.Children, e) }); err != nil {
			return nil, err
		}
	}
	if query := gq.withNursery; query != nil {
		if err := gq.loadNursery(ctx, query, nodes, nil,
			func(n *Guardian, e *Nursery) { n.Edges.Nursery = e }); err != nil {
			return nil, err
		}
	}
	if query := gq.withStation; query != nil {
		if err := gq.loadStation(ctx, query, nodes, nil,
			func(n *Guardian, e *Station) { n.Edges.Station = e }); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (gq *GuardianQuery) loadChildren(ctx context.Context, query *ChildQuery, nodes []*Guardian, init func(*Guardian), assign func(*Guardian, *Child)) error {
	fks := make([]driver.Value, 0, len(nodes))
	nodeids := make(map[uuid.UUID]*Guardian)
	for i := range nodes {
		fks = append(fks, nodes[i].ID)
		nodeids[nodes[i].ID] = nodes[i]
		if init != nil {
			init(nodes[i])
		}
	}
	query.withFKs = true
	query.Where(predicate.Child(func(s *sql.Selector) {
		s.Where(sql.InValues(s.C(guardian.ChildrenColumn), fks...))
	}))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		fk := n.guardian_children
		if fk == nil {
			return fmt.Errorf(`foreign-key "guardian_children" is nil for node %v`, n.ID)
		}
		node, ok := nodeids[*fk]
		if !ok {
			return fmt.Errorf(`unexpected referenced foreign-key "guardian_children" returned %v for node %v`, *fk, n.ID)
		}
		assign(node, n)
	}
	return nil
}
func (gq *GuardianQuery) loadNursery(ctx context.Context, query *NurseryQuery, nodes []*Guardian, init func(*Guardian), assign func(*Guardian, *Nursery)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*Guardian)
	for i := range nodes {
		if nodes[i].guardian_nursery == nil {
			continue
		}
		fk := *nodes[i].guardian_nursery
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	if len(ids) == 0 {
		return nil
	}
	query.Where(nursery.IDIn(ids...))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		nodes, ok := nodeids[n.ID]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "guardian_nursery" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}
func (gq *GuardianQuery) loadStation(ctx context.Context, query *StationQuery, nodes []*Guardian, init func(*Guardian), assign func(*Guardian, *Station)) error {
	fks := make([]driver.Value, 0, len(nodes))
	nodeids := make(map[uuid.UUID]*Guardian)
	for i := range nodes {
		fks = append(fks, nodes[i].ID)
		nodeids[nodes[i].ID] = nodes[i]
	}
	query.withFKs = true
	query.Where(predicate.Station(func(s *sql.Selector) {
		s.Where(sql.InValues(s.C(guardian.StationColumn), fks...))
	}))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		fk := n.guardian_station
		if fk == nil {
			return fmt.Errorf(`foreign-key "guardian_station" is nil for node %v`, n.ID)
		}
		node, ok := nodeids[*fk]
		if !ok {
			return fmt.Errorf(`unexpected referenced foreign-key "guardian_station" returned %v for node %v`, *fk, n.ID)
		}
		assign(node, n)
	}
	return nil
}

func (gq *GuardianQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := gq.querySpec()
	_spec.Node.Columns = gq.ctx.Fields
	if len(gq.ctx.Fields) > 0 {
		_spec.Unique = gq.ctx.Unique != nil && *gq.ctx.Unique
	}
	return sqlgraph.CountNodes(ctx, gq.driver, _spec)
}

func (gq *GuardianQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := sqlgraph.NewQuerySpec(guardian.Table, guardian.Columns, sqlgraph.NewFieldSpec(guardian.FieldID, field.TypeUUID))
	_spec.From = gq.sql
	if unique := gq.ctx.Unique; unique != nil {
		_spec.Unique = *unique
	} else if gq.path != nil {
		_spec.Unique = true
	}
	if fields := gq.ctx.Fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, guardian.FieldID)
		for i := range fields {
			if fields[i] != guardian.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := gq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := gq.ctx.Limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := gq.ctx.Offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := gq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (gq *GuardianQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(gq.driver.Dialect())
	t1 := builder.Table(guardian.Table)
	columns := gq.ctx.Fields
	if len(columns) == 0 {
		columns = guardian.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if gq.sql != nil {
		selector = gq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if gq.ctx.Unique != nil && *gq.ctx.Unique {
		selector.Distinct()
	}
	for _, p := range gq.predicates {
		p(selector)
	}
	for _, p := range gq.order {
		p(selector)
	}
	if offset := gq.ctx.Offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := gq.ctx.Limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// GuardianGroupBy is the group-by builder for Guardian entities.
type GuardianGroupBy struct {
	selector
	build *GuardianQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (ggb *GuardianGroupBy) Aggregate(fns ...AggregateFunc) *GuardianGroupBy {
	ggb.fns = append(ggb.fns, fns...)
	return ggb
}

// Scan applies the selector query and scans the result into the given value.
func (ggb *GuardianGroupBy) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, ggb.build.ctx, "GroupBy")
	if err := ggb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*GuardianQuery, *GuardianGroupBy](ctx, ggb.build, ggb, ggb.build.inters, v)
}

func (ggb *GuardianGroupBy) sqlScan(ctx context.Context, root *GuardianQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(ggb.fns))
	for _, fn := range ggb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*ggb.flds)+len(ggb.fns))
		for _, f := range *ggb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*ggb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := ggb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// GuardianSelect is the builder for selecting fields of Guardian entities.
type GuardianSelect struct {
	*GuardianQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (gs *GuardianSelect) Aggregate(fns ...AggregateFunc) *GuardianSelect {
	gs.fns = append(gs.fns, fns...)
	return gs
}

// Scan applies the selector query and scans the result into the given value.
func (gs *GuardianSelect) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, gs.ctx, "Select")
	if err := gs.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*GuardianQuery, *GuardianSelect](ctx, gs.GuardianQuery, gs, gs.inters, v)
}

func (gs *GuardianSelect) sqlScan(ctx context.Context, root *GuardianQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(gs.fns))
	for _, fn := range gs.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*gs.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := gs.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
