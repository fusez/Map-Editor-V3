FindAnimations(result[], result_size, search[], offset, &max_offset) {
    new rows_added;

    if( isempty(search) ) {
        for(new animid = MIN_ANIM_ID + offset; animid <= MAX_ANIM_ID; animid ++) {
            if( rows_added >= result_size ) {
                break;
            }

            result[rows_added ++] = animid;
        }

        max_offset = MAX_ANIMS - 1;
    } else {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT animidx, \
            (SELECT COUNT(*) FROM anim_data WHERE animidx LIKE '%%%q%%' OR lib LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
            FROM anim_data \
            WHERE animidx LIKE '%%%q%%' OR lib LIKE '%%%q%%' OR name LIKE '%%%q%%' \
            LIMIT %i OFFSET %i",
            search, search, search,
            search, search, search,
            result_size, offset
        );

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

            result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "animidx");
            db_next_row(g_DBResult);
        }

        db_free_result(g_DBResult);
    }

    return rows_added;
}

GetAnimationIndex(lib[], name[]) {
    new index = INVALID_ANIM_INDEX;

    if( isempty(lib) || isempty(name) ) {
        return index;
    }

    format(g_QueryString, sizeof g_QueryString, "\
        SELECT animidx FROM anim_data WHERE lib = '%q' AND name = '%q' LIMIT 1", lib, name
    );

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    if( db_num_rows(g_DBResult) > 0 ) {
        index = db_get_field_int(g_DBResult);
    }

    db_free_result(g_DBResult);

    return index;
}
