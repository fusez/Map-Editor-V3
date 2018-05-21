ShowMapNewDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_MAP_NEW: {
            format(g_DialogInfo, sizeof g_DialogInfo, "Type & Enter \"%s\" to create a new map.", NEWMAP_COMMAND);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "New Map", g_DialogInfo, "Confirm", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}

NewMap(
    &objects_removed,
    &vehicles_removed,
    &pickups_removed,
    &actors_removed,
    &buildings_recreated,
    &attachments_removed,
    playerid = INVALID_PLAYER_ID
) {
    for(new objectid = 1; objectid <= MAX_OBJECTS; objectid ++) {
        if( IsValidObject(objectid) ) {
            DestroyObject(objectid);
            objects_removed ++;
        }
    }

    for(new vehicleid = 1, max_vehicleid = GetVehiclePoolSize(); vehicleid <= max_vehicleid; vehicleid ++) {
        if( IsValidVehicle(vehicleid) ) {
            DestroyVehicle(vehicleid);
            vehicles_removed ++;
        }
    }

    for(new pickupid; pickupid < MAX_PICKUPS; pickupid ++) {
        if( g_PickupData[pickupid][PICKUP_DATA_ISVALID] ) {
            pickups_removed ++;
        }
        DestroyPickup(pickupid);
    }

    for(new actorid, max_actorid = GetActorPoolSize(); actorid <= max_actorid; actorid ++) {
        if( DestroyActor(actorid) ) {
            actors_removed ++;
        }
    }
    
    for(new b; b < BUILDING_DATA_SIZE; b ++) {
        if( g_BuildingData[b][BUILDING_DATA_ISREMOVED] ) {
            g_BuildingData[b][BUILDING_DATA_ISREMOVED] = false;
            buildings_recreated ++;
        }
    }

    if( playerid != INVALID_PLAYER_ID ) {
        for(new i; i < MAX_PLAYERATTACH_INDEX; i ++) {
            if( g_PlayerAttachData[playerid][i][PLAYERATTACH_DATA_TOGGLE] ) {
                attachments_removed ++;
            }
            DefaultPlayerAttachData(playerid, i);
            RemovePlayerAttachedObject(playerid, i);
        }
    }
}
