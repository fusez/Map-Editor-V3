LoadTextureCache() {
    g_DBResult = db_query(g_ResourceDB, "SELECT * FROM texture_data");

    for(new row, rows = db_num_rows(g_DBResult), textureid; row < rows; row ++) {
        textureid = db_get_field_assoc_int(g_DBResult, "textureid");

        if( IsValidTextureID(textureid) ) {
            g_TextureCache[textureid][TEXTURE_CACHE_MODELID] = db_get_field_assoc_int(g_DBResult, "modelid");
            db_get_field_assoc(g_DBResult, "txd", g_TextureTXDString, sizeof g_TextureTXDString);
            db_get_field_assoc(g_DBResult, "name", g_TextureNameString, sizeof g_TextureNameString);
            strpack(g_TextureCache[textureid][TEXTURE_CACHE_TXD], g_TextureTXDString, MAX_TEXTURE_TXD+1);
            strpack(g_TextureCache[textureid][TEXTURE_CACHE_NAME], g_TextureNameString, MAX_TEXTURE_NAME+1);
        }
        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);
}

GetTextureID(modelid, txd[], name[]) {
    new textureid = INVALID_TEXTURE_ID;

    format(g_QueryString, sizeof g_QueryString,
        "SELECT textureid FROM texture_data WHERE modelid = '%i' AND txd = '%q' AND name = '%q' LIMIT 1", modelid, txd, name
    );

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    if( db_num_rows(g_DBResult) > 0 ) {
        textureid = db_get_field_int(g_DBResult);
    }

    db_free_result(g_DBResult);

    return textureid;
}

GetTextureData(textureid, &modelid, txd[], txd_size, name[], name_size) {
    if( !IsValidTextureID(textureid) ) {
        modelid = -1;
        format(txd, txd_size, "none");
        format(name, name_size, "none");
        return 0;
    }

    modelid = g_TextureCache[textureid][TEXTURE_CACHE_MODELID];
    strunpack(txd, g_TextureCache[textureid][TEXTURE_CACHE_TXD], txd_size);
    strunpack(name, g_TextureCache[textureid][TEXTURE_CACHE_NAME], name_size);
    return 1;
}

FindTextures(result[], result_size, search[], categoryid, offset, &max_offset) {
    new rows_added;

    if( categoryid == INVALID_CATEGORY_ID ) {
        if( isempty(search) ) {
            for(new textureid = offset; textureid < MAX_TEXTURES; textureid ++) {
                if( rows_added >= result_size ) {
                    break;
                }

                result[rows_added ++] = textureid;
            }

            max_offset = MAX_TEXTURES - 1;

            return rows_added;
        } else {
            format(g_QueryString, sizeof g_QueryString, "\
                SELECT textureid, \
                (\
                    SELECT COUNT(*) \
                    FROM texture_data \
                    WHERE textureid LIKE '%%%q%%' OR modelid LIKE '%%%q%%' OR txd LIKE '%%%q%%' OR name LIKE '%%%q%%'\
                ) AS max_rowcount \
                FROM texture_data \
                WHERE textureid LIKE '%%%q%%' OR modelid LIKE '%%%q%%' OR txd LIKE '%%%q%%' OR name LIKE '%%%q%%' \
                LIMIT %i OFFSET %i",
                search, search, search, search,
                search, search, search, search,
                result_size, offset
            );
        }
    } else {
        if( isempty(search) ) {
            format(g_QueryString, sizeof g_QueryString, "\
                SELECT textureid, \
                (SELECT COUNT(*) FROM texture_category_bind WHERE categoryid = '%i') AS max_rowcount \
                FROM texture_category_bind \
                WHERE categoryid = '%i' \
                LIMIT %i OFFSET %i",
                categoryid,
                categoryid,
                result_size, offset
            );
        } else {
            g_QueryString = "SELECT b.textureid AS textureid,";

            format(g_SubQueryString, sizeof g_SubQueryString, "\
                (\
                    SELECT COUNT(*) FROM texture_category_bind b \
                    INNER JOIN texture_data d ON b.textureid = d.textureid \
                    WHERE b.categoryid = '%i' AND (d.textureid LIKE '%%%q%%' OR d.modelid LIKE '%%%q%%' OR d.txd LIKE '%%%q%%' OR d.name LIKE '%%%q%%')\
                ) AS max_rowcount ",
                categoryid,    search, search, search, search
            );
            strcat(g_QueryString, g_SubQueryString);

            format(g_SubQueryString, sizeof g_SubQueryString, "\
                FROM texture_category_bind b \
                INNER JOIN texture_data d ON b.textureid = d.textureid \
                WHERE b.categoryid = '%i' AND (d.textureid LIKE '%%%q%%' OR d.modelid LIKE '%%%q%%' OR d.txd LIKE '%%%q%%' OR d.name LIKE '%%%q%%') \
                LIMIT %i OFFSET %i",

                categoryid,    search, search, search, search,
                result_size, offset
            );
            strcat(g_QueryString, g_SubQueryString);
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

        result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "textureid");
        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);

    return rows_added;
}
