// Code generated by ent, DO NOT EDIT.

package migrate

import (
	"entgo.io/ent/dialect/sql/schema"
	"entgo.io/ent/schema/field"
)

var (
	// BoardingRecordsColumns holds the columns for the "boarding_records" table.
	BoardingRecordsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID, Unique: true},
		{Name: "timestamp", Type: field.TypeTime},
		{Name: "is_boarding", Type: field.TypeBool, Default: false},
		{Name: "bus_boarding_records", Type: field.TypeUUID, Nullable: true},
		{Name: "child_boarding_record", Type: field.TypeUUID, Nullable: true},
	}
	// BoardingRecordsTable holds the schema information for the "boarding_records" table.
	BoardingRecordsTable = &schema.Table{
		Name:       "boarding_records",
		Columns:    BoardingRecordsColumns,
		PrimaryKey: []*schema.Column{BoardingRecordsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "boarding_records_bus_boarding_records",
				Columns:    []*schema.Column{BoardingRecordsColumns[3]},
				RefColumns: []*schema.Column{BusColumns[0]},
				OnDelete:   schema.SetNull,
			},
			{
				Symbol:     "boarding_records_childs_boarding_record",
				Columns:    []*schema.Column{BoardingRecordsColumns[4]},
				RefColumns: []*schema.Column{ChildsColumns[0]},
				OnDelete:   schema.SetNull,
			},
		},
	}
	// BusColumns holds the columns for the "bus" table.
	BusColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID, Unique: true},
		{Name: "name", Type: field.TypeString},
		{Name: "plate_number", Type: field.TypeString, Nullable: true},
		{Name: "latitude", Type: field.TypeFloat64, Nullable: true},
		{Name: "longitude", Type: field.TypeFloat64, Nullable: true},
		{Name: "status", Type: field.TypeEnum, Enums: []string{"stopped", "running", "maintenance"}, Default: "stopped"},
		{Name: "enable_face_recognition", Type: field.TypeBool, Default: false},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "bus_nursery", Type: field.TypeUUID, Nullable: true},
		{Name: "bus_next_station", Type: field.TypeUUID, Nullable: true},
		{Name: "bus_latest_morning_route", Type: field.TypeUUID, Nullable: true},
		{Name: "bus_latest_evening_route", Type: field.TypeUUID, Nullable: true},
	}
	// BusTable holds the schema information for the "bus" table.
	BusTable = &schema.Table{
		Name:       "bus",
		Columns:    BusColumns,
		PrimaryKey: []*schema.Column{BusColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "bus_nurseries_nursery",
				Columns:    []*schema.Column{BusColumns[9]},
				RefColumns: []*schema.Column{NurseriesColumns[0]},
				OnDelete:   schema.SetNull,
			},
			{
				Symbol:     "bus_stations_next_station",
				Columns:    []*schema.Column{BusColumns[10]},
				RefColumns: []*schema.Column{StationsColumns[0]},
				OnDelete:   schema.SetNull,
			},
			{
				Symbol:     "bus_bus_routes_latest_morning_route",
				Columns:    []*schema.Column{BusColumns[11]},
				RefColumns: []*schema.Column{BusRoutesColumns[0]},
				OnDelete:   schema.SetNull,
			},
			{
				Symbol:     "bus_bus_routes_latest_evening_route",
				Columns:    []*schema.Column{BusColumns[12]},
				RefColumns: []*schema.Column{BusRoutesColumns[0]},
				OnDelete:   schema.SetNull,
			},
		},
	}
	// BusRoutesColumns holds the columns for the "bus_routes" table.
	BusRoutesColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID, Unique: true},
		{Name: "bus_type", Type: field.TypeEnum, Enums: []string{"morning", "evening"}},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
	}
	// BusRoutesTable holds the schema information for the "bus_routes" table.
	BusRoutesTable = &schema.Table{
		Name:       "bus_routes",
		Columns:    BusRoutesColumns,
		PrimaryKey: []*schema.Column{BusRoutesColumns[0]},
	}
	// BusRouteAssociationsColumns holds the columns for the "bus_route_associations" table.
	BusRouteAssociationsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeInt, Increment: true},
		{Name: "order", Type: field.TypeInt32},
		{Name: "bus_route_id", Type: field.TypeUUID},
		{Name: "station_id", Type: field.TypeUUID},
	}
	// BusRouteAssociationsTable holds the schema information for the "bus_route_associations" table.
	BusRouteAssociationsTable = &schema.Table{
		Name:       "bus_route_associations",
		Columns:    BusRouteAssociationsColumns,
		PrimaryKey: []*schema.Column{BusRouteAssociationsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "bus_route_associations_bus_routes_busRouteAssociations",
				Columns:    []*schema.Column{BusRouteAssociationsColumns[2]},
				RefColumns: []*schema.Column{BusRoutesColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "bus_route_associations_stations_busRouteAssociations",
				Columns:    []*schema.Column{BusRouteAssociationsColumns[3]},
				RefColumns: []*schema.Column{StationsColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
	}
	// ChildsColumns holds the columns for the "childs" table.
	ChildsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID, Unique: true},
		{Name: "name", Type: field.TypeString},
		{Name: "age", Type: field.TypeInt},
		{Name: "sex", Type: field.TypeEnum, Enums: []string{"man", "woman", "other"}},
		{Name: "check_for_missing_items", Type: field.TypeBool, Default: false},
		{Name: "has_bag", Type: field.TypeBool, Default: true},
		{Name: "has_lunch_box", Type: field.TypeBool, Default: true},
		{Name: "has_water_bottle", Type: field.TypeBool, Default: true},
		{Name: "has_umbrella", Type: field.TypeBool, Default: true},
		{Name: "has_other", Type: field.TypeBool, Default: true},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "guardian_children", Type: field.TypeUUID, Nullable: true},
	}
	// ChildsTable holds the schema information for the "childs" table.
	ChildsTable = &schema.Table{
		Name:       "childs",
		Columns:    ChildsColumns,
		PrimaryKey: []*schema.Column{ChildsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "childs_guardians_children",
				Columns:    []*schema.Column{ChildsColumns[12]},
				RefColumns: []*schema.Column{GuardiansColumns[0]},
				OnDelete:   schema.SetNull,
			},
		},
	}
	// ChildBusAssociationsColumns holds the columns for the "child_bus_associations" table.
	ChildBusAssociationsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeInt, Increment: true},
		{Name: "bus_route_id", Type: field.TypeUUID},
		{Name: "child_id", Type: field.TypeUUID},
	}
	// ChildBusAssociationsTable holds the schema information for the "child_bus_associations" table.
	ChildBusAssociationsTable = &schema.Table{
		Name:       "child_bus_associations",
		Columns:    ChildBusAssociationsColumns,
		PrimaryKey: []*schema.Column{ChildBusAssociationsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "child_bus_associations_bus_routes_childBusAssociations",
				Columns:    []*schema.Column{ChildBusAssociationsColumns[1]},
				RefColumns: []*schema.Column{BusRoutesColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "child_bus_associations_childs_childBusAssociations",
				Columns:    []*schema.Column{ChildBusAssociationsColumns[2]},
				RefColumns: []*schema.Column{ChildsColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
	}
	// ChildPhotosColumns holds the columns for the "child_photos" table.
	ChildPhotosColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID, Unique: true},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "child_photos", Type: field.TypeUUID, Nullable: true},
	}
	// ChildPhotosTable holds the schema information for the "child_photos" table.
	ChildPhotosTable = &schema.Table{
		Name:       "child_photos",
		Columns:    ChildPhotosColumns,
		PrimaryKey: []*schema.Column{ChildPhotosColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "child_photos_childs_photos",
				Columns:    []*schema.Column{ChildPhotosColumns[3]},
				RefColumns: []*schema.Column{ChildsColumns[0]},
				OnDelete:   schema.SetNull,
			},
		},
	}
	// GuardiansColumns holds the columns for the "guardians" table.
	GuardiansColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID, Unique: true},
		{Name: "email", Type: field.TypeString, Unique: true},
		{Name: "hashed_password", Type: field.TypeString},
		{Name: "name", Type: field.TypeString},
		{Name: "phone_number", Type: field.TypeString, Nullable: true},
		{Name: "is_use_morning_bus", Type: field.TypeBool, Default: true},
		{Name: "is_use_evening_bus", Type: field.TypeBool, Default: true},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "guardian_nursery", Type: field.TypeUUID, Nullable: true},
	}
	// GuardiansTable holds the schema information for the "guardians" table.
	GuardiansTable = &schema.Table{
		Name:       "guardians",
		Columns:    GuardiansColumns,
		PrimaryKey: []*schema.Column{GuardiansColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "guardians_nurseries_nursery",
				Columns:    []*schema.Column{GuardiansColumns[9]},
				RefColumns: []*schema.Column{NurseriesColumns[0]},
				OnDelete:   schema.SetNull,
			},
		},
	}
	// NurseriesColumns holds the columns for the "nurseries" table.
	NurseriesColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID, Unique: true},
		{Name: "nursery_code", Type: field.TypeString, Unique: true},
		{Name: "email", Type: field.TypeString, Unique: true},
		{Name: "hashed_password", Type: field.TypeString},
		{Name: "name", Type: field.TypeString},
		{Name: "address", Type: field.TypeString, Nullable: true},
		{Name: "phone_number", Type: field.TypeString, Nullable: true},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
	}
	// NurseriesTable holds the schema information for the "nurseries" table.
	NurseriesTable = &schema.Table{
		Name:       "nurseries",
		Columns:    NurseriesColumns,
		PrimaryKey: []*schema.Column{NurseriesColumns[0]},
	}
	// StationsColumns holds the columns for the "stations" table.
	StationsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID, Unique: true},
		{Name: "latitude", Type: field.TypeFloat64, Nullable: true, Default: 0},
		{Name: "longitude", Type: field.TypeFloat64, Nullable: true, Default: 0},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "guardian_station", Type: field.TypeUUID, Unique: true, Nullable: true},
	}
	// StationsTable holds the schema information for the "stations" table.
	StationsTable = &schema.Table{
		Name:       "stations",
		Columns:    StationsColumns,
		PrimaryKey: []*schema.Column{StationsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "stations_guardians_station",
				Columns:    []*schema.Column{StationsColumns[5]},
				RefColumns: []*schema.Column{GuardiansColumns[0]},
				OnDelete:   schema.SetNull,
			},
		},
	}
	// BusRouteBusColumns holds the columns for the "bus_route_bus" table.
	BusRouteBusColumns = []*schema.Column{
		{Name: "bus_route_id", Type: field.TypeUUID},
		{Name: "bus_id", Type: field.TypeUUID},
	}
	// BusRouteBusTable holds the schema information for the "bus_route_bus" table.
	BusRouteBusTable = &schema.Table{
		Name:       "bus_route_bus",
		Columns:    BusRouteBusColumns,
		PrimaryKey: []*schema.Column{BusRouteBusColumns[0], BusRouteBusColumns[1]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "bus_route_bus_bus_route_id",
				Columns:    []*schema.Column{BusRouteBusColumns[0]},
				RefColumns: []*schema.Column{BusRoutesColumns[0]},
				OnDelete:   schema.Cascade,
			},
			{
				Symbol:     "bus_route_bus_bus_id",
				Columns:    []*schema.Column{BusRouteBusColumns[1]},
				RefColumns: []*schema.Column{BusColumns[0]},
				OnDelete:   schema.Cascade,
			},
		},
	}
	// Tables holds all the tables in the schema.
	Tables = []*schema.Table{
		BoardingRecordsTable,
		BusTable,
		BusRoutesTable,
		BusRouteAssociationsTable,
		ChildsTable,
		ChildBusAssociationsTable,
		ChildPhotosTable,
		GuardiansTable,
		NurseriesTable,
		StationsTable,
		BusRouteBusTable,
	}
)

func init() {
	BoardingRecordsTable.ForeignKeys[0].RefTable = BusTable
	BoardingRecordsTable.ForeignKeys[1].RefTable = ChildsTable
	BusTable.ForeignKeys[0].RefTable = NurseriesTable
	BusTable.ForeignKeys[1].RefTable = StationsTable
	BusTable.ForeignKeys[2].RefTable = BusRoutesTable
	BusTable.ForeignKeys[3].RefTable = BusRoutesTable
	BusRouteAssociationsTable.ForeignKeys[0].RefTable = BusRoutesTable
	BusRouteAssociationsTable.ForeignKeys[1].RefTable = StationsTable
	ChildsTable.ForeignKeys[0].RefTable = GuardiansTable
	ChildBusAssociationsTable.ForeignKeys[0].RefTable = BusRoutesTable
	ChildBusAssociationsTable.ForeignKeys[1].RefTable = ChildsTable
	ChildPhotosTable.ForeignKeys[0].RefTable = ChildsTable
	GuardiansTable.ForeignKeys[0].RefTable = NurseriesTable
	StationsTable.ForeignKeys[0].RefTable = GuardiansTable
	BusRouteBusTable.ForeignKeys[0].RefTable = BusRoutesTable
	BusRouteBusTable.ForeignKeys[1].RefTable = BusTable
}
