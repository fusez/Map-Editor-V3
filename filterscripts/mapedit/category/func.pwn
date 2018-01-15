IsModelCategoryIDCreated(categoryid) {
    format(g_QueryString, sizeof g_QueryString, "SELECT * FROM model_category_data WHERE categoryid = '%i' LIMIT 1", categoryid);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new category_found = db_num_rows(g_DBResult) > 0;

    db_free_result(g_DBResult);

    return category_found;
}

IsVehicleCategoryIDCreated(categoryid) {
    format(g_QueryString, sizeof g_QueryString, "SELECT * FROM veh_category_data WHERE categoryid = '%i' LIMIT 1", categoryid);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new category_found = db_num_rows(g_DBResult) > 0;

    db_free_result(g_DBResult);

    return category_found;
}

IsSkinCategoryIDCreated(categoryid) {
    format(g_QueryString, sizeof g_QueryString, "SELECT * FROM skin_category_data WHERE categoryid = '%i' LIMIT 1", categoryid);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new category_found = db_num_rows(g_DBResult) > 0;

    db_free_result(g_DBResult);

    return category_found;
}

IsTextureCategoryIDCreated(categoryid) {
    format(g_QueryString, sizeof g_QueryString, "SELECT * FROM texture_category_data WHERE categoryid = '%i' LIMIT 1", categoryid);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new category_found = db_num_rows(g_DBResult) > 0;

    db_free_result(g_DBResult);

    return category_found;
}

IsModelCategoryNameCreated(name[]) {
    format(g_QueryString, sizeof g_QueryString, "SELECT * FROM model_category_data WHERE lower(name) = lower('%q') LIMIT 1", name);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new category_found = db_num_rows(g_DBResult) > 0;

    db_free_result(g_DBResult);

    return category_found;
}

IsVehicleCategoryNameCreated(name[]) {
    format(g_QueryString, sizeof g_QueryString, "SELECT * FROM veh_category_data WHERE lower(name) = lower('%q') LIMIT 1", name);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new category_found = db_num_rows(g_DBResult) > 0;

    db_free_result(g_DBResult);

    return category_found;
}

IsSkinCategoryNameCreated(name[]) {
    format(g_QueryString, sizeof g_QueryString, "SELECT * FROM skin_category_data WHERE lower(name) = lower('%q') LIMIT 1", name);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new category_found = db_num_rows(g_DBResult) > 0;

    db_free_result(g_DBResult);

    return category_found;
}

IsTextureCategoryNameCreated(name[]) {
    format(g_QueryString, sizeof g_QueryString, "SELECT * FROM texture_category_data WHERE lower(name) = lower('%q') LIMIT 1", name);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new category_found = db_num_rows(g_DBResult) > 0;

    db_free_result(g_DBResult);

    return category_found;
}

GetModelCategoryName(categoryid, name[], name_size) {
    new category_found;

    format(g_QueryString, sizeof g_QueryString,
        "SELECT name FROM model_category_data WHERE categoryid = '%i' LIMIT 1", categoryid
    );

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    category_found = db_num_rows(g_DBResult) > 0;

    if( category_found ) {
        db_get_field(g_DBResult, 0, name, name_size);
    } else {
        format(name, name_size, "Unknown");
    }

    db_free_result(g_DBResult);

    return category_found;
}

GetVehicleCategoryName(categoryid, name[], name_size) {
    new category_found;

    format(g_QueryString, sizeof g_QueryString,
        "SELECT name FROM veh_category_data WHERE categoryid = '%i' LIMIT 1", categoryid
    );

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    category_found = db_num_rows(g_DBResult) > 0;

    if( category_found ) {
        db_get_field(g_DBResult, 0, name, name_size);
    } else {
        format(name, name_size, "Unknown");
    }

    db_free_result(g_DBResult);

    return category_found;
}

GetSkinCategoryName(categoryid, name[], name_size) {
    new category_found;

    format(g_QueryString, sizeof g_QueryString,
        "SELECT name FROM skin_category_data WHERE categoryid = '%i' LIMIT 1", categoryid
    );

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    category_found = db_num_rows(g_DBResult) > 0;

    if( category_found ) {
        db_get_field(g_DBResult, 0, name, name_size);
    } else {
        format(name, name_size, "Unknown");
    }

    db_free_result(g_DBResult);

    return category_found;
}

GetTextureCategoryName(categoryid, name[], name_size) {
    new category_found;

    format(g_QueryString, sizeof g_QueryString,
        "SELECT name FROM texture_category_data WHERE categoryid = '%i' LIMIT 1", categoryid
    );

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    category_found = db_num_rows(g_DBResult) > 0;

    if( category_found ) {
        db_get_field(g_DBResult, 0, name, name_size);
    } else {
        format(name, name_size, "Unknown");
    }

    db_free_result(g_DBResult);

    return category_found;
}

FindModelCategories(result[], result_size, search[], offset, &max_offset) {
    new rows_added;

    if( isempty(search) ) {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT categoryid, \
            (SELECT COUNT(*) FROM model_category_data) AS max_rowcount \
            FROM model_category_data \
            LIMIT %i OFFSET %i",
            result_size, offset
        );
    } else {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT categoryid, \
            (SELECT COUNT(*) FROM model_category_data WHERE categoryid LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
            FROM model_category_data \
            WHERE categoryid LIKE '%%%q%%' OR name LIKE '%%%q%%' \
            LIMIT %i OFFSET %i",
            search, search,
            search, search,
            result_size, offset
        );
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

        result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "categoryid");
        db_next_row(g_DBResult);
    }
    db_free_result(g_DBResult);

    return rows_added;
}

FindVehicleCategories(result[], result_size, search[], offset, &max_offset) {
    new rows_added;

    if( isempty(search) ) {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT categoryid, \
            (SELECT COUNT(*) FROM veh_category_data) AS max_rowcount \
            FROM veh_category_data \
            LIMIT %i OFFSET %i",
            result_size, offset
        );
    } else {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT categoryid, \
            (SELECT COUNT(*) FROM veh_category_data WHERE categoryid LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
            FROM veh_category_data \
            WHERE categoryid LIKE '%%%q%%' OR name LIKE '%%%q%%' \
            LIMIT %i OFFSET %i",
            search, search,
            search, search,
            result_size, offset
        );
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

        result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "categoryid");
        db_next_row(g_DBResult);
    }
    db_free_result(g_DBResult);

    return rows_added;
}

FindSkinCategories(result[], result_size, search[], offset, &max_offset) {
    new rows_added;

    if( isempty(search) ) {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT categoryid, \
            (SELECT COUNT(*) FROM skin_category_data) AS max_rowcount \
            FROM skin_category_data \
            LIMIT %i OFFSET %i",
            result_size, offset
        );
    } else {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT categoryid, \
            (SELECT COUNT(*) FROM skin_category_data WHERE categoryid LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
            FROM skin_category_data \
            WHERE categoryid LIKE '%%%q%%' OR name LIKE '%%%q%%' \
            LIMIT %i OFFSET %i",
            search, search,
            search, search,
            result_size, offset
        );
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

        result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "categoryid");
        db_next_row(g_DBResult);
    }
    db_free_result(g_DBResult);

    return rows_added;
}

FindTextureCategories(result[], result_size, search[], offset, &max_offset) {
    new rows_added;

    if( isempty(search) ) {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT categoryid, \
            (SELECT COUNT(*) FROM texture_category_data) AS max_rowcount \
            FROM texture_category_data \
            LIMIT %i OFFSET %i",
            result_size, offset
        );
    } else {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT categoryid, \
            (SELECT COUNT(*) FROM texture_category_data WHERE categoryid LIKE '%%%q%%' OR name LIKE '%%%q%%') \
            FROM texture_category_data \
            WHERE categoryid LIKE '%%%q%%' OR name LIKE '%%%q%%' \
            LIMIT %i OFFSET %i",
            search, search,
            search, search,
            result_size, offset
        );
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

        result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "categoryid");
        db_next_row(g_DBResult);
    }
    db_free_result(g_DBResult);

    return rows_added;
}

CreateModelCategory(name[]) {
    if( IsModelCategoryNameCreated(name) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "INSERT INTO model_category_data (name) VALUES ('%q')", name);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return IsModelCategoryNameCreated(name);
}

CreateVehicleCategory(name[]) {
    if( IsVehicleCategoryNameCreated(name) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "INSERT INTO veh_category_data (name) VALUES ('%q')", name);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return IsVehicleCategoryNameCreated(name);
}

CreateSkinCategory(name[]) {
    if( IsSkinCategoryNameCreated(name) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "INSERT INTO skin_category_data (name) VALUES ('%q')", name);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return IsSkinCategoryNameCreated(name);
}

CreateTextureCategory(name[]) {
    if( IsTextureCategoryNameCreated(name) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "INSERT INTO texture_category_data (name) VALUES ('%q')", name);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return IsTextureCategoryNameCreated(name);
}

DestroyModelCategory(categoryid) {
    if( !IsModelCategoryIDCreated(categoryid) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "DELETE FROM model_category_data WHERE categoryid = '%i'", categoryid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return !IsModelCategoryIDCreated(categoryid);
}

DestroyVehicleCategory(categoryid) {
    if( !IsVehicleCategoryIDCreated(categoryid) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "DELETE FROM veh_category_data WHERE categoryid = '%i'", categoryid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return !IsVehicleCategoryIDCreated(categoryid);
}

DestroySkinCategory(categoryid) {
    if( !IsSkinCategoryIDCreated(categoryid) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "DELETE FROM skin_category_data WHERE categoryid = '%i'", categoryid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return !IsSkinCategoryIDCreated(categoryid);
}

DestroyTextureCategory(categoryid) {
    if( !IsTextureCategoryIDCreated(categoryid) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "DELETE FROM texture_category_data WHERE categoryid = '%i'", categoryid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return !IsTextureCategoryIDCreated(categoryid);
}

RenameModelCategory(categoryid, newname[]) {
    if( !IsModelCategoryIDCreated(categoryid) || IsModelCategoryNameCreated(newname) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "UPDATE model_category_data SET name = '%q' WHERE categoryid = '%i'", newname, categoryid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return IsModelCategoryNameCreated(newname);
}

RenameVehicleCategory(categoryid, newname[]) {
    if( !IsVehicleCategoryIDCreated(categoryid) || IsVehicleCategoryNameCreated(newname) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "UPDATE veh_category_data SET name = '%q' WHERE categoryid = '%i'", newname, categoryid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return IsVehicleCategoryNameCreated(newname);
}

RenameSkinCategory(categoryid, newname[]) {
    if( !IsSkinCategoryIDCreated(categoryid) || IsSkinCategoryNameCreated(newname) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "UPDATE skin_category_data SET name = '%q' WHERE categoryid = '%i'", newname, categoryid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return IsSkinCategoryNameCreated(newname);
}

RenameTextureCategory(categoryid, newname[]) {
    if( !IsTextureCategoryIDCreated(categoryid) || IsTextureCategoryNameCreated(newname) ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "UPDATE texture_category_data SET name = '%q' WHERE categoryid = '%i'", newname, categoryid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return IsTextureCategoryNameCreated(newname);
}

GetModelCategoryBindID(categoryid, modelid) {
    format(g_QueryString, sizeof g_QueryString, "SELECT bindid FROM model_category_bind WHERE categoryid = '%i' AND modelid = '%i' LIMIT 1", categoryid, modelid);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new bindid = INVALID_CATEGORY_BIND_ID;

    if( db_num_rows(g_DBResult) > 0 ) {
        bindid = db_get_field_int(g_DBResult);
    }

    db_free_result(g_DBResult);

    return bindid;
}

GetVehicleCategoryBindID(categoryid, modelid) {
    format(g_QueryString, sizeof g_QueryString, "SELECT bindid FROM veh_category_bind WHERE categoryid = '%i' AND modelid = '%i' LIMIT 1", categoryid, modelid);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new bindid = INVALID_CATEGORY_BIND_ID;

    if( db_num_rows(g_DBResult) > 0 ) {
        bindid = db_get_field_int(g_DBResult);
    }

    db_free_result(g_DBResult);

    return bindid;
}

GetSkinCategoryBindID(categoryid, modelid) {
    format(g_QueryString, sizeof g_QueryString, "SELECT bindid FROM skin_category_bind WHERE categoryid = '%i' AND modelid = '%i' LIMIT 1", categoryid, modelid);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new bindid = INVALID_CATEGORY_BIND_ID;

    if( db_num_rows(g_DBResult) > 0 ) {
        bindid = db_get_field_int(g_DBResult);
    }

    db_free_result(g_DBResult);

    return bindid;
}

GetTextureCategoryBindID(categoryid, textureid) {
    format(g_QueryString, sizeof g_QueryString, "SELECT bindid FROM texture_category_bind WHERE categoryid = '%i' AND textureid = '%i' LIMIT 1", categoryid, textureid);

    g_DBResult = db_query(g_ResourceDB, g_QueryString);

    new bindid = INVALID_CATEGORY_BIND_ID;

    if( db_num_rows(g_DBResult) > 0 ) {
        bindid = db_get_field_int(g_DBResult);
    }

    db_free_result(g_DBResult);

    return bindid;
}

CreateModelCategoryBind(categoryid, modelid) {
    if( !IsModelCategoryIDCreated(categoryid) || GetModelCategoryBindID(categoryid, modelid) != INVALID_CATEGORY_BIND_ID ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "INSERT INTO model_category_bind (categoryid, modelid) VALUES ('%i', %i)", categoryid, modelid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return GetModelCategoryBindID(categoryid, modelid) != INVALID_CATEGORY_BIND_ID;
}

CreateVehicleCategoryBind(categoryid, modelid) {
    if( !IsVehicleCategoryIDCreated(categoryid) || GetVehicleCategoryBindID(categoryid, modelid) != INVALID_CATEGORY_BIND_ID ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "INSERT INTO veh_category_bind (categoryid, modelid) VALUES ('%i', %i)", categoryid, modelid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return GetVehicleCategoryBindID(categoryid, modelid) != INVALID_CATEGORY_BIND_ID;
}

CreateSkinCategoryBind(categoryid, modelid) {
    if( !IsSkinCategoryIDCreated(categoryid) || GetSkinCategoryBindID(categoryid, modelid) != INVALID_CATEGORY_BIND_ID ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "INSERT INTO skin_category_bind (categoryid, modelid) VALUES ('%i', %i)", categoryid, modelid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return GetSkinCategoryBindID(categoryid, modelid) != INVALID_CATEGORY_BIND_ID;
}

CreateTextureCategoryBind(categoryid, textureid) {
    if( !IsTextureCategoryIDCreated(categoryid) || GetTextureCategoryBindID(categoryid, textureid) != INVALID_CATEGORY_BIND_ID ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "INSERT INTO texture_category_bind (categoryid, textureid) VALUES ('%i', %i)", categoryid, textureid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return GetTextureCategoryBindID(categoryid, textureid) != INVALID_CATEGORY_BIND_ID;
}

DestroyModelCategoryBind(categoryid, modelid) {
    new bindid = GetModelCategoryBindID(categoryid, modelid);
    if( bindid == INVALID_CATEGORY_BIND_ID ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "DELETE FROM model_category_bind WHERE bindid = '%i'", bindid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return GetModelCategoryBindID(categoryid, modelid) == INVALID_CATEGORY_BIND_ID;
}

DestroyVehicleCategoryBind(categoryid, modelid) {
    new bindid = GetVehicleCategoryBindID(categoryid, modelid);
    if( bindid == INVALID_CATEGORY_BIND_ID ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "DELETE FROM veh_category_bind WHERE bindid = '%i'", bindid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return GetVehicleCategoryBindID(categoryid, modelid) == INVALID_CATEGORY_BIND_ID;
}

DestroySkinCategoryBind(categoryid, modelid) {
    new bindid = GetSkinCategoryBindID(categoryid, modelid);
    if( bindid == INVALID_CATEGORY_BIND_ID ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "DELETE FROM skin_category_bind WHERE bindid = '%i'", bindid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return GetSkinCategoryBindID(categoryid, modelid) == INVALID_CATEGORY_BIND_ID;
}

DestroyTextureCategoryBind(categoryid, textureid) {
    new bindid = GetTextureCategoryBindID(categoryid, textureid);
    if( bindid == INVALID_CATEGORY_BIND_ID ) {
        return 0;
    }

    format(g_QueryString, sizeof g_QueryString, "DELETE FROM texture_category_bind WHERE bindid = '%i'", bindid);
    db_free_result( db_query(g_ResourceDB, g_QueryString) );

    return GetTextureCategoryBindID(categoryid, textureid) == INVALID_CATEGORY_BIND_ID;
}
