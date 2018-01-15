GetFontName(fontid, name[], name_size) {
    if( !IsValidFontID(fontid) ) {
        return 0;
    }

    strunpack(name, g_FontCache[fontid], name_size);
    return 1;
}

FindFonts(result[], result_size, search[], offset, &max_offset) {
    new rows_added;

    if( isempty(search) ) {
        for(new fontid = offset; fontid < MAX_FONTS; fontid ++) {
            if( rows_added >= result_size ) {
                break;
            }

            result[rows_added ++] = fontid;
        }

        max_offset = MAX_FONTS - 1;
    } else {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT fontid, \
            (SELECT COUNT(*) FROM font_data WHERE fontid LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
            FROM font_data \
            WHERE fontid LIKE '%%%q%%' OR name LIKE '%%%q%%' \
            LIMIT %i OFFSET %i",
            search, search,
            search, search,
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

            result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "fontid");
            db_next_row(g_DBResult);
        }

        db_free_result(g_DBResult);
    }
    return rows_added;
}

LoadFontCache() {
    g_DBResult = db_query(g_ResourceDB, "SELECT * FROM font_data");

    for(new row, rows = db_num_rows(g_DBResult), fontid; row < rows; row ++) {
        fontid = db_get_field_assoc_int(g_DBResult, "fontid");
        if( IsValidFontID(fontid) ) {
            db_get_field_assoc(g_DBResult, "name", g_FontString, sizeof g_FontString);
            strpack(g_FontCache[fontid], g_FontString, MAX_FONTNAME_LEN+1);
        }
        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);
}
