LoadSkinCache() {
    g_DBResult = db_query(g_ResourceDB, "SELECT * FROM skin_data");

    for(new row, rows = db_num_rows(g_DBResult), skinid; row < rows; row ++) {
        skinid = db_get_field_assoc_int(g_DBResult, "modelid");
        if( IsValidSkin(skinid) ) {
            db_get_field_assoc(g_DBResult, "name", g_SkinString, sizeof g_SkinString);
            strpack(g_SkinNameCache[skinid], g_SkinString, MAX_SKINNAME_LEN+1);
        }
        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);
}

GetSkinName(skinid, name[], name_size) {
    if( !IsValidSkin(skinid) ) {
        return 0;
    }

    strunpack(name, g_SkinNameCache[skinid], name_size);
    return 1;
}

FindSkins(result[], result_size, search[], categoryid, offset, &max_offset) {
    new rows_added;

    if( categoryid == INVALID_CATEGORY_ID ) {
        if( isempty(search) ) {
            for(new skinid = offset; skinid < MAX_SKINS; skinid ++) {
                if( rows_added >= result_size ) {
                    break;
                }

                result[rows_added ++] = skinid;
            }

            max_offset = MAX_SKINS - 1;

            return rows_added;
        } else {
            format(g_QueryString, sizeof g_QueryString, "\
                SELECT modelid, \
                (SELECT COUNT(*) FROM skin_data WHERE modelid LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
                FROM skin_data \
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
                (SELECT COUNT(*) FROM skin_category_bind WHERE categoryid = '%i') AS max_rowcount \
                FROM skin_category_bind \
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
                    FROM skin_category_bind b \
                    INNER JOIN skin_data d ON b.modelid = d.modelid \
                    WHERE b.categoryid = '%i' AND (d.modelid LIKE '%%%q%%' OR d.name LIKE '%%%q%%')\
                ) AS max_rowcount \
                FROM skin_category_bind b \
                INNER JOIN skin_data d ON b.modelid = d.modelid \
                WHERE b.categoryid = '%i' AND (d.modelid LIKE '%%%q%%' OR d.name LIKE '%%%q%%') \
                LIMIT %i OFFSET %i",
                categoryid,    search,    search,
                categoryid,    search,    search,
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
