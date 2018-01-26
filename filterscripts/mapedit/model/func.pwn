LoadModelCache() {
    g_ModelCacheLimit = 0;

    g_DBResult = db_query(g_ResourceDB, "SELECT * FROM model_data");

    for(new row, rows = db_num_rows(g_DBResult), modelid; row < rows; row ++) {
        if( g_ModelCacheLimit < MAX_MODELS ) {
            modelid = db_get_field_assoc_int(g_DBResult, "modelid");

            if( modelid >= MIN_MODEL_ID && modelid <= MAX_MODEL_ID ) {
                g_ModelCacheIndex[ modelid - MIN_MODEL_ID ] = g_ModelCacheLimit;
            }

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_ID] = modelid;

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_SPHERE_RADIUS] = db_get_field_assoc_float(g_DBResult, "sphere_radius");

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_SPHERE_OFF_X] = db_get_field_assoc_float(g_DBResult, "sphere_off_x");

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_SPHERE_OFF_Y] = db_get_field_assoc_float(g_DBResult, "sphere_off_y");

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_SPHERE_OFF_Z] = db_get_field_assoc_float(g_DBResult, "sphere_off_z");

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_MIN_X] = db_get_field_assoc_float(g_DBResult, "min_x");

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_MIN_Y] = db_get_field_assoc_float(g_DBResult, "min_y");

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_MIN_Z] = db_get_field_assoc_float(g_DBResult, "min_z");

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_MAX_X] = db_get_field_assoc_float(g_DBResult, "max_x");

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_MAX_Y] = db_get_field_assoc_float(g_DBResult, "max_y");

            g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_MAX_Z] = db_get_field_assoc_float(g_DBResult, "max_z");

            db_get_field_assoc(g_DBResult, "name", g_ModelString, sizeof g_ModelString);

            strpack( g_ModelCache[g_ModelCacheLimit][MODEL_CACHE_NAME], g_ModelString, MAX_MODELNAME_LEN+1);
        }
        g_ModelCacheLimit ++;

        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);
}

FindModels(result[], result_size, search[], categoryid, offset, &max_offset) {
    new added_rows;

    if( categoryid == INVALID_CATEGORY_ID ) {
        if( isempty(search) ) {
            for(new i = offset; i < g_ModelCacheLimit; i ++) {
                if( added_rows >= result_size ) {
                    break;
                }

                result[added_rows ++] = g_ModelCache[i][MODEL_CACHE_ID];
            }

            max_offset = g_ModelCacheLimit - 1;

            return added_rows;
        } else {
            format(g_QueryString, sizeof g_QueryString, "\
                SELECT modelid, \
                (SELECT COUNT(*) FROM model_data WHERE modelid LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
                FROM model_data \
                WHERE modelid LIKE '%%%q%%' OR name LIKE '%%%q%%' \
                LIMIT %i OFFSET %i",
                search, search,
                search, search,
                result_size, offset
            );
        }
    } else {
        if( isempty(search) ) {
            format(g_QueryString, sizeof g_QueryString, "\
                SELECT modelid, \
                (SELECT COUNT(*) FROM model_category_bind WHERE categoryid = '%i') AS max_rowcount \
                FROM model_category_bind \
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
                    FROM model_category_bind b \
                    INNER JOIN model_data d ON b.modelid = d.modelid \
                    WHERE b.categoryid = '%i' AND (d.modelid LIKE '%%%q%%' OR d.name LIKE '%%%q%%')\
                ) AS max_rowcount \
                FROM model_category_bind b \
                INNER JOIN model_data d ON b.modelid = d.modelid \
                WHERE b.categoryid = '%i' AND (d.modelid LIKE '%%%q%%' OR d.name LIKE '%%%q%%') \
                LIMIT %i OFFSET %i",
                categoryid, search, search,
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
        if( added_rows >= result_size ) {
            break;
        }

        result[added_rows ++] = db_get_field_assoc_int(g_DBResult, "modelid");
        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);

    return added_rows;
}

GetModelCacheIndex(modelid) {
    if( modelid >= MIN_MODEL_ID && modelid <= MAX_MODEL_ID ) {
        new cache_index = g_ModelCacheIndex[modelid - MIN_MODEL_ID];

        if( g_ModelCache[cache_index][MODEL_CACHE_ID] == modelid ) {
            return cache_index;
        }
    }
    return INVALID_ARRAY_INDEX;
}

GetModelName(modelid, name[], name_size) {
    new cache_index = GetModelCacheIndex(modelid);
    if( cache_index == INVALID_ARRAY_INDEX ) {
        return format(name, name_size, "Unknown Model"), 0;
    }

    return strunpack(name, g_ModelCache[cache_index][MODEL_CACHE_NAME], name_size), 1;
}

stock GetModelSphere(modelid, &Float:radius, &Float:off_x, &Float:off_y, &Float:off_z) {
    new cache_index = GetModelCacheIndex(modelid);
    if( cache_index == INVALID_ARRAY_INDEX ) {
        return 0;
    }

    radius = g_ModelCache[cache_index][MODEL_CACHE_SPHERE_RADIUS];
    off_x = g_ModelCache[cache_index][MODEL_CACHE_SPHERE_OFF_X];
    off_y = g_ModelCache[cache_index][MODEL_CACHE_SPHERE_OFF_Y];
    off_z = g_ModelCache[cache_index][MODEL_CACHE_SPHERE_OFF_Z];
    return 1;
}

stock GetModelMinMaxXYZ(modelid, &Float:min_x, &Float:min_y, &Float:min_z, &Float:max_x, &Float:max_y, &Float:max_z) {
    new cache_index = GetModelCacheIndex(modelid);
    if( cache_index == INVALID_ARRAY_INDEX ) {
        return 0;
    }

    min_x = g_ModelCache[cache_index][MODEL_CACHE_MIN_X];
    min_y = g_ModelCache[cache_index][MODEL_CACHE_MIN_Y];
    min_z = g_ModelCache[cache_index][MODEL_CACHE_MIN_Z];
    max_x = g_ModelCache[cache_index][MODEL_CACHE_MAX_X];
    max_y = g_ModelCache[cache_index][MODEL_CACHE_MAX_Y];
    max_z = g_ModelCache[cache_index][MODEL_CACHE_MAX_Z];
    return 1;
}

stock GetModelMinX(modelid, &Float:min) {
    new cache_index = GetModelCacheIndex(modelid);
    if( cache_index == INVALID_ARRAY_INDEX ) {
        return 0;
    }

    min = g_ModelCache[cache_index][MODEL_CACHE_MIN_X];
    return 1;
}

stock GetModelMinY(modelid, &Float:min) {
    new cache_index = GetModelCacheIndex(modelid);
    if( cache_index == INVALID_ARRAY_INDEX ) {
        return 0;
    }

    min = g_ModelCache[cache_index][MODEL_CACHE_MIN_Y];
    return 1;
}

stock GetModelMinZ(modelid, &Float:min) {
    new cache_index = GetModelCacheIndex(modelid);
    if( cache_index == INVALID_ARRAY_INDEX ) {
        return 0;
    }

    min = g_ModelCache[cache_index][MODEL_CACHE_MIN_Z];
    return 1;
}

stock GetModelMaxX(modelid, &Float:max) {
    new cache_index = GetModelCacheIndex(modelid);
    if( cache_index == INVALID_ARRAY_INDEX ) {
        return 0;
    }

    max = g_ModelCache[cache_index][MODEL_CACHE_MAX_X];
    return 1;
}

stock GetModelMaxY(modelid, &Float:max) {
    new cache_index = GetModelCacheIndex(modelid);
    if( cache_index == INVALID_ARRAY_INDEX ) {
        return 0;
    }

    max = g_ModelCache[cache_index][MODEL_CACHE_MAX_Y];
    return 1;
}

stock GetModelMaxZ(modelid, &Float:max) {
    new cache_index = GetModelCacheIndex(modelid);
    if( cache_index == INVALID_ARRAY_INDEX ) {
        return 0;
    }

    max = g_ModelCache[cache_index][MODEL_CACHE_MAX_Z];
    return 1;
}
