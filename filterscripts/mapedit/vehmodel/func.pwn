LoadVehicleModelCache() {
    g_DBResult = db_query(g_ResourceDB, "SELECT * FROM veh_data");

    for(new row, rows = db_num_rows(g_DBResult), modelid; row < rows; row ++) {
        modelid = db_get_field_assoc_int(g_DBResult, "modelid");
        if( IsValidVehicleModel(modelid) ) {
            db_get_field_assoc(g_DBResult, "name", g_VehModelString, sizeof g_VehModelString);
            strpack(g_VehModelNameCache[modelid - MIN_VEHMODEL_ID], g_VehModelString, MAX_VEHMODELNAME_LEN+1);
        }
        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);
}

GetVehicleModelCacheIndex(modelid) {
    if( !IsValidVehicleModel(modelid) ) {
        return INVALID_ARRAY_INDEX;
    }
    return modelid - MIN_VEHMODEL_ID;
}

GetVehicleModelName(modelid, name[], name_size) {
    if( !IsValidVehicleModel(modelid) ) {
        return 0;
    }

    strunpack(name, g_VehModelNameCache[modelid - MIN_VEHMODEL_ID], name_size);
    return 1;
}

FindVehicleModels(result[], result_size, search[], categoryid, offset, &max_offset) {
    new rows_added;

    if( categoryid == INVALID_CATEGORY_ID ) {
        if( isempty(search) ) {
            for(new i = offset; i < MAX_VEHMODELS; i ++) {
                if( rows_added >= result_size ) {
                    break;
                }

                result[rows_added ++] = i + MIN_VEHMODEL_ID;
            }

            max_offset = MAX_VEHMODELS - 1;

            return rows_added;
        } else {
            format(g_QueryString, sizeof g_QueryString, "\
                SELECT modelid, \
                (SELECT COUNT(*) FROM veh_data WHERE modelid LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
                FROM veh_data \
                WHERE modelid LIKE '%%%q%%' OR name LIKE '%%%q%%' \
                LIMIT %i OFFSET %i",
                search,    search,
                search,    search,
                result_size, offset
            );
        }
    } else {
        if( isempty(search) ) {
            format(g_QueryString, sizeof g_QueryString, "\
                SELECT modelid, \
                (SELECT COUNT(*) FROM veh_category_bind WHERE categoryid = '%i') AS max_rowcount \
                FROM veh_category_bind \
                WHERE categoryid = '%i' \
                LIMIT %i OFFSET %i",
                categoryid,
                categoryid,
                result_size, offset
            );
        } else {
            format(g_QueryString, sizeof g_QueryString, "\
                SELECT b.modelid AS modelid, \
                (\
                    SELECT COUNT(*) \
                    FROM veh_category_bind b \
                    INNER JOIN veh_data d ON b.modelid = d.modelid \
                    WHERE b.categoryid = '%i' AND (d.modelid LIKE '%%%q%%' OR d.name LIKE '%%%q%%') \
                ) AS max_rowcount \
                FROM veh_category_bind b \
                INNER JOIN veh_data d ON b.modelid = d.modelid \
                WHERE b.categoryid = '%i' AND (d.modelid LIKE '%%%q%%' OR d.name LIKE '%%%q%%') \
                LIMIT %i OFFSET %i",
                categoryid,    search, search,
                categoryid,    search, search,
                result_size, offset
            );
        }
    }

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

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

        result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "modelid");
        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);

    return rows_added;
}
