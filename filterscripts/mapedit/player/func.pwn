DefaultPlayerData(playerid) {
    g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE;
    g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT] = INVALID_OBJECT_ID;
    g_PlayerData[playerid][PLAYER_DATA_EDIT_MATERIALOBJ] = INVALID_OBJECT_ID;
    g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID] = INVALID_OBJECT_ID;
    g_PlayerData[playerid][PLAYER_DATA_SELECTTD] = false;
    g_PlayerData[playerid][PLAYER_DATA_TDMODE] = TDMODE_NONE;
    g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] = false;
}

GetPlayerEditVehicle(playerid) {
    if(g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] == ID_TYPE_VEHICLE) {
        return g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
    }
    return INVALID_VEHICLE_ID;
}

GetPlayerEditPickup(playerid) {
    if(g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] == ID_TYPE_PICKUP) {
        return g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
    }
    return INVALID_PICKUP_ID;
}

GetPlayerEditActor(playerid) {
    if(g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] == ID_TYPE_ACTOR) {
        return g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
    }
    return INVALID_ACTOR_ID;
}

GetPlayerEditObject(playerid){
    if(g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] == ID_TYPE_OBJECT) {
        return g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
    }
    return INVALID_OBJECT_ID;
}

GetPlayerEditAttached(playerid) {
    if( g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] == ID_TYPE_ATTACH ) {
        return g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
    }
    return INVALID_PLAYERATTACH_INDEX;
}

GetPlayerEditBuilding(playerid) {
    if( g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] == ID_TYPE_BUILDING ) {
        return g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
    }
    return INVALID_BUILDING_ID;
}

GetPlayerNearestObject(playerid, Float:max_distance) {
    new
        near_objectid = INVALID_OBJECT_ID,
        Float: near_distance = max_distance
    ;

    for(new objectid = 1, Float:x, Float:y, Float:z, Float:distance; objectid <= MAX_OBJECTS; objectid ++) {
        if( !IsValidObject(objectid) ) {
            continue;
        }

        GetObjectPos(objectid, x, y, z);
        distance = GetPlayerDistanceFromPoint(playerid, x, y, z);

        if( distance < near_distance ) {
            near_objectid = objectid;
            near_distance = distance;
        }
    }

    return near_objectid;
}

GetPlayerNearestVehicle(playerid, Float:max_distance) {
    new
        near_vehicleid = INVALID_VEHICLE_ID,
        Float: near_distance = max_distance
    ;

    for(new vehicleid = 1, max_vehicleid = GetVehiclePoolSize(), Float:x, Float:y, Float:z, Float:distance; vehicleid <= max_vehicleid; vehicleid ++) {
        if( !IsValidVehicle(vehicleid) ) {
            continue;
        }

        GetVehiclePos(vehicleid, x, y, z);
        distance = GetPlayerDistanceFromPoint(playerid, x, y, z);

        if( distance < near_distance ) {
            near_vehicleid = vehicleid;
            near_distance = distance;
        }
    }
    return near_vehicleid;
}

GetPlayerNearestPickup(playerid, Float:max_distance) {
    new
        near_pickupid = INVALID_PICKUP_ID,
        Float: near_distance = max_distance
    ;

    for(new pickupid, Float:x, Float:y, Float:z, Float:distance; pickupid < MAX_PICKUPS; pickupid ++) {
        if( !g_PickupData[pickupid][PICKUP_DATA_ISVALID] ) {
            continue;
        }

        x = g_PickupData[pickupid][PICKUP_DATA_X];
        y = g_PickupData[pickupid][PICKUP_DATA_Y];
        z = g_PickupData[pickupid][PICKUP_DATA_Z];
        distance = GetPlayerDistanceFromPoint(playerid, x, y, z);

        if( distance < near_distance ) {
            near_pickupid = pickupid;
            near_distance = distance;
        }
    }

    return near_pickupid;
}

GetPlayerNearestActor(playerid, Float:max_distance) {
    new
        near_actorid = INVALID_ACTOR_ID,
        Float: near_distance = max_distance
    ;

    for(new actorid, max_actorid = GetActorPoolSize(), Float:x, Float:y, Float:z, Float:distance; actorid <= max_actorid; actorid ++) {
        if( !IsValidActor(actorid) ) {
            continue;
        }

        GetActorPos(actorid, x, y, z);
        distance = GetPlayerDistanceFromPoint(playerid, x, y, z);

        if( distance < near_distance ) {
            near_actorid = actorid;
            near_distance = distance;
        }
    }

    return near_actorid;
}
