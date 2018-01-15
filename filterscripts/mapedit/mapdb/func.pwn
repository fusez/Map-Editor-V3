CreateMapID(mapname[]) {
    format(g_QueryString, sizeof g_QueryString, "INSERT INTO maps (name) VALUES ('%q')", mapname);

    db_free_result( db_query(g_MapDB, g_QueryString) );
}

DestroyMapID(mapid) {
    format(g_QueryString, sizeof g_QueryString, "DELETE FROM maps WHERE mapid = '%i'", mapid);

    db_free_result( db_query(g_MapDB, g_QueryString) );
}

GetMapID(mapname[]) {
    new mapid = INVALID_MAP_ID;

    format(g_QueryString, sizeof g_QueryString, "SELECT mapid FROM maps WHERE lower(name) = lower('%q')", mapname);

    g_DBResult = db_query(g_MapDB, g_QueryString);

    if( db_num_rows(g_DBResult) > 0 ) {
        mapid = db_get_field_int(g_DBResult);
    }

    db_free_result(g_DBResult);

    return mapid;
}

GetMapName(mapid, name[], name_size) {
    format(g_QueryString, sizeof g_QueryString, "SELECT name FROM maps WHERE mapid = '%i'", mapid);

    g_DBResult = db_query(g_MapDB, g_QueryString);

    new mapfound = db_num_rows(g_DBResult) > 0;
    if( mapfound ) {
        db_get_field(g_DBResult, 0, name, name_size);
    } else {
        format(name, name_size, "Unknown Map");
    }

    db_free_result(g_DBResult);

    return mapfound;
}

FindMaps(result[], result_size, search[], offset, &max_offset) {
    new rows_added;

    if( isempty(search) ) {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT mapid, \
            (SELECT COUNT(*) FROM maps) AS max_rowcount \
            FROM maps \
            LIMIT %i OFFSET %i",
            result_size, offset
        );
    } else {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT mapid, \
            (SELECT COUNT(*) FROM maps WHERE mapid LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
            FROM maps \
            WHERE mapid LIKE '%%%q%%' OR name LIKE '%%%q%%' \
            LIMIT %i OFFSET %i",
            search, search,
            search, search,
            result_size, offset
        );
    }

    g_DBResult = db_query(g_MapDB, g_QueryString);

    new result_rows = db_num_rows(g_DBResult);

    if( result_rows > 0 ) {
        max_offset = db_get_field_assoc_int(g_DBResult, "max_rowcount") - 1;
        if( max_offset < 0 ) {
            max_offset = 0;
        }
    }

    for(new row; row < result_rows; row ++) {
        if( rows_added >= result_size ) {
            break;
        }

        result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "mapid");
        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);

    return rows_added;
}
