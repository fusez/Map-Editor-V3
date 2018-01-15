DefaultClickDragObjectData(playerid) {
    g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID] = INVALID_OBJECT_ID;
}

RefreshClickDragObject(playerid) {
    new
        Float:x,
        Float:y,
        Float:z,
        Float:a
    ;

    switch( g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] ) {
        case ID_TYPE_VEHICLE: {
            new vehicleid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
            GetVehiclePos(vehicleid, x, y, z);
            GetVehicleZAngle(vehicleid, a);
        }
        case ID_TYPE_PICKUP: {
            new pickupid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
            x = g_PickupData[pickupid][PICKUP_DATA_X];
            y = g_PickupData[pickupid][PICKUP_DATA_Y];
            z = g_PickupData[pickupid][PICKUP_DATA_Z];
        }
        case ID_TYPE_ACTOR: {
            new actorid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
            GetActorPos(actorid, x, y, z);
            GetActorFacingAngle(actorid, a);
        }
        default: {
            return INVALID_OBJECT_ID;
        }
    }

    if( g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID] == INVALID_OBJECT_ID ) {
        g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID] = CreatePlayerObject(playerid, 19300, x, y, z, 0.0, 0.0, a);
    } else {
        SetPlayerObjectPos(playerid, g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID], x, y, z);
        SetPlayerObjectRot(playerid, g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID], 0.0, 0.0, a);
    }
    return g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID];
}

DestroyClickDragObject(playerid) {
    if( g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID] != INVALID_OBJECT_ID ) {
        DestroyPlayerObject(playerid, g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID]);
        g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID] = INVALID_OBJECT_ID;
    }
}
