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

NewMap(playerid = INVALID_PLAYER_ID) {
    for(new objectid = 1; objectid <= MAX_OBJECTS; objectid ++) {
        if( IsValidObject(objectid) ) {
            DestroyObject(objectid);
        }
    }

    for(new vehicleid = 1, max_vehicleid = GetVehiclePoolSize(); vehicleid <= max_vehicleid; vehicleid ++) {
        DestroyVehicle(vehicleid);
    }

    for(new pickupid; pickupid < MAX_PICKUPS; pickupid ++) {
        DestroyPickup(pickupid);
    }

    for(new actorid, max_actorid = GetActorPoolSize(); actorid <= max_actorid; actorid ++) {
        DestroyActor(actorid);
    }

    if( playerid != INVALID_PLAYER_ID ) {
        for(new i; i < MAX_PLAYERATTACH_INDEX; i ++) {
            DefaultPlayerAttachData(playerid, i);
            RemovePlayerAttachedObject(playerid, i);
        }
    }
}
