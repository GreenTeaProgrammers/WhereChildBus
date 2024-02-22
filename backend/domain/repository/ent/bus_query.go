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
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/boardingrecord"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busroute"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/predicate"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
	"github.com/google/uuid"
)

// BusQuery is the builder for querying Bus entities.
type BusQuery struct {
	config
	ctx                 *QueryContext
	order               []bus.OrderOption
	inters              []Interceptor
	predicates          []predicate.Bus
	withNursery         *NurseryQuery
	withBoardingRecords *BoardingRecordQuery
	withNextStation     *StationQuery
	withBusRoute        *BusRouteQuery
	withFKs             bool
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the BusQuery builder.
func (bq *BusQuery) Where(ps ...predicate.Bus) *BusQuery {
	bq.predicates = append(bq.predicates, ps...)
	return bq
}

// Limit the number of records to be returned by this query.
func (bq *BusQuery) Limit(limit int) *BusQuery {
	bq.ctx.Limit = &limit
	return bq
}

// Offset to start from.
func (bq *BusQuery) Offset(offset int) *BusQuery {
	bq.ctx.Offset = &offset
	return bq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (bq *BusQuery) Unique(unique bool) *BusQuery {
	bq.ctx.Unique = &unique
	return bq
}

// Order specifies how the records should be ordered.
func (bq *BusQuery) Order(o ...bus.OrderOption) *BusQuery {
	bq.order = append(bq.order, o...)
	return bq
}

// QueryNursery chains the current query on the "nursery" edge.
func (bq *BusQuery) QueryNursery() *NurseryQuery {
	query := (&NurseryClient{config: bq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := bq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := bq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(bus.Table, bus.FieldID, selector),
			sqlgraph.To(nursery.Table, nursery.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, bus.NurseryTable, bus.NurseryColumn),
		)
		fromU = sqlgraph.SetNeighbors(bq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryBoardingRecords chains the current query on the "boarding_records" edge.
func (bq *BusQuery) QueryBoardingRecords() *BoardingRecordQuery {
	query := (&BoardingRecordClient{config: bq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := bq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := bq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(bus.Table, bus.FieldID, selector),
			sqlgraph.To(boardingrecord.Table, boardingrecord.FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, bus.BoardingRecordsTable, bus.BoardingRecordsColumn),
		)
		fromU = sqlgraph.SetNeighbors(bq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryNextStation chains the current query on the "next_station" edge.
func (bq *BusQuery) QueryNextStation() *StationQuery {
	query := (&StationClient{config: bq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := bq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := bq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(bus.Table, bus.FieldID, selector),
			sqlgraph.To(station.Table, station.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, bus.NextStationTable, bus.NextStationColumn),
		)
		fromU = sqlgraph.SetNeighbors(bq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryBusRoute chains the current query on the "bus_route" edge.
func (bq *BusQuery) QueryBusRoute() *BusRouteQuery {
	query := (&BusRouteClient{config: bq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := bq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := bq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(bus.Table, bus.FieldID, selector),
			sqlgraph.To(busroute.Table, busroute.FieldID),
			sqlgraph.Edge(sqlgraph.M2M, true, bus.BusRouteTable, bus.BusRoutePrimaryKey...),
		)
		fromU = sqlgraph.SetNeighbors(bq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first Bus entity from the query.
// Returns a *NotFoundError when no Bus was found.
func (bq *BusQuery) First(ctx context.Context) (*Bus, error) {
	nodes, err := bq.Limit(1).All(setContextOp(ctx, bq.ctx, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{bus.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (bq *BusQuery) FirstX(ctx context.Context) *Bus {
	node, err := bq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first Bus ID from the query.
// Returns a *NotFoundError when no Bus ID was found.
func (bq *BusQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = bq.Limit(1).IDs(setContextOp(ctx, bq.ctx, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{bus.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (bq *BusQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := bq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single Bus entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one Bus entity is found.
// Returns a *NotFoundError when no Bus entities are found.
func (bq *BusQuery) Only(ctx context.Context) (*Bus, error) {
	nodes, err := bq.Limit(2).All(setContextOp(ctx, bq.ctx, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{bus.Label}
	default:
		return nil, &NotSingularError{bus.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (bq *BusQuery) OnlyX(ctx context.Context) *Bus {
	node, err := bq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only Bus ID in the query.
// Returns a *NotSingularError when more than one Bus ID is found.
// Returns a *NotFoundError when no entities are found.
func (bq *BusQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = bq.Limit(2).IDs(setContextOp(ctx, bq.ctx, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{bus.Label}
	default:
		err = &NotSingularError{bus.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (bq *BusQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := bq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of BusSlice.
func (bq *BusQuery) All(ctx context.Context) ([]*Bus, error) {
	ctx = setContextOp(ctx, bq.ctx, "All")
	if err := bq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*Bus, *BusQuery]()
	return withInterceptors[[]*Bus](ctx, bq, qr, bq.inters)
}

// AllX is like All, but panics if an error occurs.
func (bq *BusQuery) AllX(ctx context.Context) []*Bus {
	nodes, err := bq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of Bus IDs.
func (bq *BusQuery) IDs(ctx context.Context) (ids []uuid.UUID, err error) {
	if bq.ctx.Unique == nil && bq.path != nil {
		bq.Unique(true)
	}
	ctx = setContextOp(ctx, bq.ctx, "IDs")
	if err = bq.Select(bus.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (bq *BusQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := bq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (bq *BusQuery) Count(ctx context.Context) (int, error) {
	ctx = setContextOp(ctx, bq.ctx, "Count")
	if err := bq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, bq, querierCount[*BusQuery](), bq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (bq *BusQuery) CountX(ctx context.Context) int {
	count, err := bq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (bq *BusQuery) Exist(ctx context.Context) (bool, error) {
	ctx = setContextOp(ctx, bq.ctx, "Exist")
	switch _, err := bq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (bq *BusQuery) ExistX(ctx context.Context) bool {
	exist, err := bq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the BusQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (bq *BusQuery) Clone() *BusQuery {
	if bq == nil {
		return nil
	}
	return &BusQuery{
		config:              bq.config,
		ctx:                 bq.ctx.Clone(),
		order:               append([]bus.OrderOption{}, bq.order...),
		inters:              append([]Interceptor{}, bq.inters...),
		predicates:          append([]predicate.Bus{}, bq.predicates...),
		withNursery:         bq.withNursery.Clone(),
		withBoardingRecords: bq.withBoardingRecords.Clone(),
		withNextStation:     bq.withNextStation.Clone(),
		withBusRoute:        bq.withBusRoute.Clone(),
		// clone intermediate query.
		sql:  bq.sql.Clone(),
		path: bq.path,
	}
}

// WithNursery tells the query-builder to eager-load the nodes that are connected to
// the "nursery" edge. The optional arguments are used to configure the query builder of the edge.
func (bq *BusQuery) WithNursery(opts ...func(*NurseryQuery)) *BusQuery {
	query := (&NurseryClient{config: bq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	bq.withNursery = query
	return bq
}

// WithBoardingRecords tells the query-builder to eager-load the nodes that are connected to
// the "boarding_records" edge. The optional arguments are used to configure the query builder of the edge.
func (bq *BusQuery) WithBoardingRecords(opts ...func(*BoardingRecordQuery)) *BusQuery {
	query := (&BoardingRecordClient{config: bq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	bq.withBoardingRecords = query
	return bq
}

// WithNextStation tells the query-builder to eager-load the nodes that are connected to
// the "next_station" edge. The optional arguments are used to configure the query builder of the edge.
func (bq *BusQuery) WithNextStation(opts ...func(*StationQuery)) *BusQuery {
	query := (&StationClient{config: bq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	bq.withNextStation = query
	return bq
}

// WithBusRoute tells the query-builder to eager-load the nodes that are connected to
// the "bus_route" edge. The optional arguments are used to configure the query builder of the edge.
func (bq *BusQuery) WithBusRoute(opts ...func(*BusRouteQuery)) *BusQuery {
	query := (&BusRouteClient{config: bq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	bq.withBusRoute = query
	return bq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		Name string `json:"name,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.Bus.Query().
//		GroupBy(bus.FieldName).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (bq *BusQuery) GroupBy(field string, fields ...string) *BusGroupBy {
	bq.ctx.Fields = append([]string{field}, fields...)
	grbuild := &BusGroupBy{build: bq}
	grbuild.flds = &bq.ctx.Fields
	grbuild.label = bus.Label
	grbuild.scan = grbuild.Scan
	return grbuild
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		Name string `json:"name,omitempty"`
//	}
//
//	client.Bus.Query().
//		Select(bus.FieldName).
//		Scan(ctx, &v)
func (bq *BusQuery) Select(fields ...string) *BusSelect {
	bq.ctx.Fields = append(bq.ctx.Fields, fields...)
	sbuild := &BusSelect{BusQuery: bq}
	sbuild.label = bus.Label
	sbuild.flds, sbuild.scan = &bq.ctx.Fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a BusSelect configured with the given aggregations.
func (bq *BusQuery) Aggregate(fns ...AggregateFunc) *BusSelect {
	return bq.Select().Aggregate(fns...)
}

func (bq *BusQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range bq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, bq); err != nil {
				return err
			}
		}
	}
	for _, f := range bq.ctx.Fields {
		if !bus.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if bq.path != nil {
		prev, err := bq.path(ctx)
		if err != nil {
			return err
		}
		bq.sql = prev
	}
	return nil
}

func (bq *BusQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*Bus, error) {
	var (
		nodes       = []*Bus{}
		withFKs     = bq.withFKs
		_spec       = bq.querySpec()
		loadedTypes = [4]bool{
			bq.withNursery != nil,
			bq.withBoardingRecords != nil,
			bq.withNextStation != nil,
			bq.withBusRoute != nil,
		}
	)
	if bq.withNursery != nil || bq.withNextStation != nil {
		withFKs = true
	}
	if withFKs {
		_spec.Node.Columns = append(_spec.Node.Columns, bus.ForeignKeys...)
	}
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*Bus).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &Bus{config: bq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, bq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := bq.withNursery; query != nil {
		if err := bq.loadNursery(ctx, query, nodes, nil,
			func(n *Bus, e *Nursery) { n.Edges.Nursery = e }); err != nil {
			return nil, err
		}
	}
	if query := bq.withBoardingRecords; query != nil {
		if err := bq.loadBoardingRecords(ctx, query, nodes,
			func(n *Bus) { n.Edges.BoardingRecords = []*BoardingRecord{} },
			func(n *Bus, e *BoardingRecord) { n.Edges.BoardingRecords = append(n.Edges.BoardingRecords, e) }); err != nil {
			return nil, err
		}
	}
	if query := bq.withNextStation; query != nil {
		if err := bq.loadNextStation(ctx, query, nodes, nil,
			func(n *Bus, e *Station) { n.Edges.NextStation = e }); err != nil {
			return nil, err
		}
	}
	if query := bq.withBusRoute; query != nil {
		if err := bq.loadBusRoute(ctx, query, nodes,
			func(n *Bus) { n.Edges.BusRoute = []*BusRoute{} },
			func(n *Bus, e *BusRoute) { n.Edges.BusRoute = append(n.Edges.BusRoute, e) }); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (bq *BusQuery) loadNursery(ctx context.Context, query *NurseryQuery, nodes []*Bus, init func(*Bus), assign func(*Bus, *Nursery)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*Bus)
	for i := range nodes {
		if nodes[i].bus_nursery == nil {
			continue
		}
		fk := *nodes[i].bus_nursery
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
			return fmt.Errorf(`unexpected foreign-key "bus_nursery" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}
func (bq *BusQuery) loadBoardingRecords(ctx context.Context, query *BoardingRecordQuery, nodes []*Bus, init func(*Bus), assign func(*Bus, *BoardingRecord)) error {
	fks := make([]driver.Value, 0, len(nodes))
	nodeids := make(map[uuid.UUID]*Bus)
	for i := range nodes {
		fks = append(fks, nodes[i].ID)
		nodeids[nodes[i].ID] = nodes[i]
		if init != nil {
			init(nodes[i])
		}
	}
	query.withFKs = true
	query.Where(predicate.BoardingRecord(func(s *sql.Selector) {
		s.Where(sql.InValues(s.C(bus.BoardingRecordsColumn), fks...))
	}))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		fk := n.bus_boarding_records
		if fk == nil {
			return fmt.Errorf(`foreign-key "bus_boarding_records" is nil for node %v`, n.ID)
		}
		node, ok := nodeids[*fk]
		if !ok {
			return fmt.Errorf(`unexpected referenced foreign-key "bus_boarding_records" returned %v for node %v`, *fk, n.ID)
		}
		assign(node, n)
	}
	return nil
}
func (bq *BusQuery) loadNextStation(ctx context.Context, query *StationQuery, nodes []*Bus, init func(*Bus), assign func(*Bus, *Station)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*Bus)
	for i := range nodes {
		if nodes[i].bus_next_station == nil {
			continue
		}
		fk := *nodes[i].bus_next_station
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	if len(ids) == 0 {
		return nil
	}
	query.Where(station.IDIn(ids...))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		nodes, ok := nodeids[n.ID]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "bus_next_station" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}
func (bq *BusQuery) loadBusRoute(ctx context.Context, query *BusRouteQuery, nodes []*Bus, init func(*Bus), assign func(*Bus, *BusRoute)) error {
	edgeIDs := make([]driver.Value, len(nodes))
	byID := make(map[uuid.UUID]*Bus)
	nids := make(map[uuid.UUID]map[*Bus]struct{})
	for i, node := range nodes {
		edgeIDs[i] = node.ID
		byID[node.ID] = node
		if init != nil {
			init(node)
		}
	}
	query.Where(func(s *sql.Selector) {
		joinT := sql.Table(bus.BusRouteTable)
		s.Join(joinT).On(s.C(busroute.FieldID), joinT.C(bus.BusRoutePrimaryKey[0]))
		s.Where(sql.InValues(joinT.C(bus.BusRoutePrimaryKey[1]), edgeIDs...))
		columns := s.SelectedColumns()
		s.Select(joinT.C(bus.BusRoutePrimaryKey[1]))
		s.AppendSelect(columns...)
		s.SetDistinct(false)
	})
	if err := query.prepareQuery(ctx); err != nil {
		return err
	}
	qr := QuerierFunc(func(ctx context.Context, q Query) (Value, error) {
		return query.sqlAll(ctx, func(_ context.Context, spec *sqlgraph.QuerySpec) {
			assign := spec.Assign
			values := spec.ScanValues
			spec.ScanValues = func(columns []string) ([]any, error) {
				values, err := values(columns[1:])
				if err != nil {
					return nil, err
				}
				return append([]any{new(uuid.UUID)}, values...), nil
			}
			spec.Assign = func(columns []string, values []any) error {
				outValue := *values[0].(*uuid.UUID)
				inValue := *values[1].(*uuid.UUID)
				if nids[inValue] == nil {
					nids[inValue] = map[*Bus]struct{}{byID[outValue]: {}}
					return assign(columns[1:], values[1:])
				}
				nids[inValue][byID[outValue]] = struct{}{}
				return nil
			}
		})
	})
	neighbors, err := withInterceptors[[]*BusRoute](ctx, query, qr, query.inters)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		nodes, ok := nids[n.ID]
		if !ok {
			return fmt.Errorf(`unexpected "bus_route" node returned %v`, n.ID)
		}
		for kn := range nodes {
			assign(kn, n)
		}
	}
	return nil
}

func (bq *BusQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := bq.querySpec()
	_spec.Node.Columns = bq.ctx.Fields
	if len(bq.ctx.Fields) > 0 {
		_spec.Unique = bq.ctx.Unique != nil && *bq.ctx.Unique
	}
	return sqlgraph.CountNodes(ctx, bq.driver, _spec)
}

func (bq *BusQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := sqlgraph.NewQuerySpec(bus.Table, bus.Columns, sqlgraph.NewFieldSpec(bus.FieldID, field.TypeUUID))
	_spec.From = bq.sql
	if unique := bq.ctx.Unique; unique != nil {
		_spec.Unique = *unique
	} else if bq.path != nil {
		_spec.Unique = true
	}
	if fields := bq.ctx.Fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, bus.FieldID)
		for i := range fields {
			if fields[i] != bus.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := bq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := bq.ctx.Limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := bq.ctx.Offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := bq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (bq *BusQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(bq.driver.Dialect())
	t1 := builder.Table(bus.Table)
	columns := bq.ctx.Fields
	if len(columns) == 0 {
		columns = bus.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if bq.sql != nil {
		selector = bq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if bq.ctx.Unique != nil && *bq.ctx.Unique {
		selector.Distinct()
	}
	for _, p := range bq.predicates {
		p(selector)
	}
	for _, p := range bq.order {
		p(selector)
	}
	if offset := bq.ctx.Offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := bq.ctx.Limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// BusGroupBy is the group-by builder for Bus entities.
type BusGroupBy struct {
	selector
	build *BusQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (bgb *BusGroupBy) Aggregate(fns ...AggregateFunc) *BusGroupBy {
	bgb.fns = append(bgb.fns, fns...)
	return bgb
}

// Scan applies the selector query and scans the result into the given value.
func (bgb *BusGroupBy) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, bgb.build.ctx, "GroupBy")
	if err := bgb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*BusQuery, *BusGroupBy](ctx, bgb.build, bgb, bgb.build.inters, v)
}

func (bgb *BusGroupBy) sqlScan(ctx context.Context, root *BusQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(bgb.fns))
	for _, fn := range bgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*bgb.flds)+len(bgb.fns))
		for _, f := range *bgb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*bgb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := bgb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// BusSelect is the builder for selecting fields of Bus entities.
type BusSelect struct {
	*BusQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (bs *BusSelect) Aggregate(fns ...AggregateFunc) *BusSelect {
	bs.fns = append(bs.fns, fns...)
	return bs
}

// Scan applies the selector query and scans the result into the given value.
func (bs *BusSelect) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, bs.ctx, "Select")
	if err := bs.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*BusQuery, *BusSelect](ctx, bs.BusQuery, bs, bs.inters, v)
}

func (bs *BusSelect) sqlScan(ctx context.Context, root *BusQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(bs.fns))
	for _, fn := range bs.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*bs.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := bs.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
