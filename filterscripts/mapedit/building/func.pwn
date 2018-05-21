LoadBuildingCache() {
    g_DBResult = db_query(g_ResourceDB, "SELECT * FROM `building_data`");

    new
        rows = db_num_rows(g_DBResult),
        buildings_loaded,
        buildingid
    ;

    for(new row; row < rows; row ++) {
        buildingid = db_get_field_assoc_int(g_DBResult, "buildingid");

        if( IsValidBuildingID(buildingid) && !g_BuildingData[buildingid][BUILDING_DATA_ISLOADED] ) {
            g_BuildingData[buildingid][BUILDING_DATA_MODEL]    = db_get_field_assoc_int  (g_DBResult, "model");
            g_BuildingData[buildingid][BUILDING_DATA_LODMODEL] = db_get_field_assoc_int  (g_DBResult, "lodmodel");
            g_BuildingData[buildingid][BUILDING_DATA_X]        = db_get_field_assoc_float(g_DBResult, "x");
            g_BuildingData[buildingid][BUILDING_DATA_Y]        = db_get_field_assoc_float(g_DBResult, "y");
            g_BuildingData[buildingid][BUILDING_DATA_Z]        = db_get_field_assoc_float(g_DBResult, "z");
            g_BuildingData[buildingid][BUILDING_DATA_RX]       = db_get_field_assoc_float(g_DBResult, "rx");
            g_BuildingData[buildingid][BUILDING_DATA_RY]       = db_get_field_assoc_float(g_DBResult, "ry");
            g_BuildingData[buildingid][BUILDING_DATA_RZ]       = db_get_field_assoc_float(g_DBResult, "rz");
            g_BuildingData[buildingid][BUILDING_DATA_OFFSET]   = db_get_field_assoc_float(g_DBResult, "offset");
            g_BuildingData[buildingid][BUILDING_DATA_ISLOADED] = true;

            buildings_loaded ++;
        }

        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);

    if( buildings_loaded != BUILDING_DATA_SIZE ) {
        printf("error: %i / %i buildings were loaded!", buildings_loaded, BUILDING_DATA_SIZE);
    }
}

RemoveBuildingIDForPlayer(playerid, buildingid) {
    RemoveBuildingForPlayer(playerid,
        .modelid = g_BuildingData[buildingid][BUILDING_DATA_MODEL],
        .fX      = g_BuildingData[buildingid][BUILDING_DATA_X],
        .fY      = g_BuildingData[buildingid][BUILDING_DATA_Y],
        .fZ      = g_BuildingData[buildingid][BUILDING_DATA_Z],
        .fRadius = g_BuildingData[buildingid][BUILDING_DATA_OFFSET] + REMOVE_BUILDING_RANGE
    );

    if( g_BuildingData[buildingid][BUILDING_DATA_LODMODEL] != INVALID_BUILDING_LODMODEL ) {
        RemoveBuildingForPlayer(playerid,
            .modelid = g_BuildingData[buildingid][BUILDING_DATA_LODMODEL],
            .fX      = g_BuildingData[buildingid][BUILDING_DATA_X],
            .fY      = g_BuildingData[buildingid][BUILDING_DATA_Y],
            .fZ      = g_BuildingData[buildingid][BUILDING_DATA_Z],
            .fRadius = g_BuildingData[buildingid][BUILDING_DATA_OFFSET] + REMOVE_BUILDING_RANGE
        );
    }
}

RemoveBuildingIDForAll(buildingid) {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            RemoveBuildingIDForPlayer(playerid, buildingid);
        }
    }
}

GetBuildingsInRange(result[], result_size, search_modelid, Float:search_x, Float:search_y, Float:search_z, Float:search_radius) {
    new
               result_count,
               building_modelid,
        Float: building_x,
        Float: building_y,
        Float: building_z,
        Float: building_distance
    ;

    for(new b; b < BUILDING_DATA_SIZE; b ++) {
        if( result_count >= result_size ) {
            break;
        }

        building_modelid  = g_BuildingData[b][BUILDING_DATA_MODEL];
        building_x        = g_BuildingData[b][BUILDING_DATA_X];
        building_y        = g_BuildingData[b][BUILDING_DATA_Y];
        building_z        = g_BuildingData[b][BUILDING_DATA_Z];
        building_distance = GetDistanceBetweenPoints(search_x, search_y, search_z, building_x, building_y, building_z);
        
        if( ( search_modelid == -1 || search_modelid == building_modelid ) && building_distance <= search_radius ) {
            result[result_count ++] = b;
        }
    }

    return result_count;
}

GetNearestBuilding(Float:search_x, Float:search_y, Float:search_z, &Float:ret_distance, Float:min_distance = 0.0, incmode = BUILDING_INCMODE_ALL) {
    new
               ret_buildingid = INVALID_BUILDING_ID,
        Float: building_x,
        Float: building_y,
        Float: building_z,
        Float: building_distance
    ;

    for(new b; b < BUILDING_DATA_SIZE; b ++) {
        building_x        = g_BuildingData[b][BUILDING_DATA_X];
        building_y        = g_BuildingData[b][BUILDING_DATA_Y];
        building_z        = g_BuildingData[b][BUILDING_DATA_Z];
        building_distance = GetDistanceBetweenPoints(search_x, search_y, search_z, building_x, building_y, building_z);

        if(
            ( incmode == BUILDING_INCMODE_ALL || ( incmode == BUILDING_INCMODE_REMOVED && g_BuildingData[b][BUILDING_DATA_ISREMOVED] ) || ( incmode == BUILDING_INCMODE_EXISTING && !g_BuildingData[b][BUILDING_DATA_ISREMOVED] ) ) &&
            ( min_distance == 0.0 || building_distance > min_distance ) &&
            ( ret_buildingid == INVALID_BUILDING_ID || building_distance < ret_distance )
        ) {
            ret_buildingid = b;
            ret_distance = building_distance;
        }
    }

    return ret_buildingid;
}

FindBuildings(result[], result_size, offset, incmode, Float:x, Float:y, Float:z) {
    new
               buildingid,
               rows_found,
               rows_added,
        Float: min_distance
    ;

    for(new b; b < BUILDING_DATA_SIZE; b ++) {
        buildingid = GetNearestBuilding(x, y, z, min_distance, min_distance, incmode);

        if( buildingid == INVALID_BUILDING_ID ) {
            break;
        }

        if( rows_found ++ < offset ) {
            continue;
        }

        if( rows_added >= result_size ) {
            break;
        }

        result[rows_added ++] = buildingid;
    }

    return rows_added;
}
