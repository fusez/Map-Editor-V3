RefreshPlayerEditMarker(playerid) {
    new
        objectid = INVALID_OBJECT_ID,
        vehicleid = INVALID_VEHICLE_ID,
        pickupid = INVALID_PICKUP_ID,
        actorid = INVALID_ACTOR_ID,
        modelid = INVALID_MODEL_ID,
        buildingid = INVALID_BUILDING_ID,
        bool:untoggle = true
    ;

    switch( g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] ) {
        case ID_TYPE_OBJECT: {
            objectid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
            if( IsValidObject(objectid) ) {
                modelid = GetObjectModel(objectid);
                untoggle = false;
            }
        }
        case ID_TYPE_VEHICLE: {
            vehicleid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
            if( IsValidVehicle(vehicleid) ) {
                modelid = GetVehicleModel(vehicleid);
                untoggle = false;
            }
        }
        case ID_TYPE_PICKUP: {
            pickupid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
            if( IsValidPickup(pickupid) ) {
                modelid = g_PickupData[pickupid][PICKUP_DATA_MODEL];
                untoggle = false;
            }
        }
        case ID_TYPE_ACTOR: {
            actorid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
            if( IsValidActor(actorid) ) {
                modelid = g_ActorData[actorid][ACTOR_DATA_SKIN];
                untoggle = false;
            }
        }
        case ID_TYPE_BUILDING: {
            buildingid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ID];
            if( IsValidBuildingID(buildingid) ) {
                modelid = g_BuildingData[buildingid][BUILDING_DATA_MODEL];
                untoggle = false;
            }
        }
    }

    if( untoggle ) {
        if( g_EditMarkerData[playerid][EDITMARKER_DATA_ON] ) {
            RemovePlayerMapIcon(playerid, EDITMARKER_MAPICONID);

            if( IsValidPlayerObject(playerid, g_EditMarkerData[playerid][EDITMARKER_DATA_POID]) ) {
                DestroyPlayerObject(playerid, g_EditMarkerData[playerid][EDITMARKER_DATA_POID]);
            }

            DefaultEditMarkerData(playerid);
        }
        return 1;
    }

    if( !g_EditMarkerData[playerid][EDITMARKER_DATA_ON] ) {
        g_EditMarkerData[playerid][EDITMARKER_DATA_ON] = true;
    }

    if( modelid != g_EditMarkerData[playerid][EDITMARKER_DATA_MODEL] ) {
        switch( g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] ) {
            case ID_TYPE_OBJECT, ID_TYPE_PICKUP, ID_TYPE_BUILDING: {
                GetModelMaxZ(modelid, g_EditMarkerData[playerid][EDITMARKER_DATA_Z]);
                g_EditMarkerData[playerid][EDITMARKER_DATA_Z] += 1.5;
            }
            case ID_TYPE_VEHICLE: {
                new Float:temp;
                GetVehicleModelInfo(modelid, VEHICLE_MODEL_INFO_SIZE, temp, temp, g_EditMarkerData[playerid][EDITMARKER_DATA_Z]);
                g_EditMarkerData[playerid][EDITMARKER_DATA_Z] += 1.5;
            }
            default: {
                g_EditMarkerData[playerid][EDITMARKER_DATA_Z] = 2.0;
            }
        }
        g_EditMarkerData[playerid][EDITMARKER_DATA_MODEL] = modelid;
    }

    // Get Next Marker Pos
    new
        attachto_objectid = INVALID_OBJECT_ID,
        attachto_vehicleid = INVALID_VEHICLE_ID,
        Float:x,
        Float:y,
        Float:z,
        Float:attach_off_x,
        Float:attach_off_y,
        Float:attach_off_z
    ;

    switch( g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] ) {
        case ID_TYPE_OBJECT: {
            attachto_objectid = GetObjectAttachObject(objectid);
            attachto_vehicleid = GetObjectAttachVehicle(objectid);

            if( IsValidObject(attachto_objectid) ) {
                new
                    Float: obj_x,
                    Float: obj_y,
                    Float: obj_z,
                    Float: obj_rx,
                    Float: obj_ry,
                    Float: obj_rz
				;

				GetObjectPos(attachto_objectid, obj_x,  obj_y,  obj_z);
				GetObjectRot(attachto_objectid, obj_rx, obj_ry, obj_rz);
                attach_off_x = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X];
                attach_off_y = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y];
                attach_off_z = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z];
                PositionFromOffset(obj_x, obj_y, obj_z, obj_rx, obj_ry, obj_rz, attach_off_x, attach_off_y, attach_off_z, x, y, z);
            } else if( IsValidVehicle(attachto_vehicleid) ) {
                GetVehiclePos(attachto_vehicleid, x, y, z);
                attach_off_x = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X];
                attach_off_y = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y];
                attach_off_z = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z];
            } else {
                GetObjectPos(objectid, x, y, z);
            }
        }
        case ID_TYPE_VEHICLE: {
            GetVehiclePos(vehicleid, x, y, z);
        }
        case ID_TYPE_PICKUP: {
            x = g_PickupData[pickupid][PICKUP_DATA_X];
            y = g_PickupData[pickupid][PICKUP_DATA_Y];
            z = g_PickupData[pickupid][PICKUP_DATA_Z];
        }
        case ID_TYPE_ACTOR: {
            GetActorPos(actorid, x, y, z);
        }
        case ID_TYPE_BUILDING: {
            x = g_BuildingData[buildingid][BUILDING_DATA_X];
            y = g_BuildingData[buildingid][BUILDING_DATA_Y];
            z = g_BuildingData[buildingid][BUILDING_DATA_Z];
        }
        default: {
            GetPlayerPos(playerid, x, y, z);
        }
    }

    z += g_EditMarkerData[playerid][EDITMARKER_DATA_Z];
    attach_off_z += g_EditMarkerData[playerid][EDITMARKER_DATA_Z];

    if( g_EditMarkerData[playerid][EDITMARKER_DATA_ATTACH] && !IsValidVehicle(attachto_vehicleid) ) {
        if( IsValidPlayerObject(playerid, g_EditMarkerData[playerid][EDITMARKER_DATA_POID]) ) {
            DestroyPlayerObject(playerid, g_EditMarkerData[playerid][EDITMARKER_DATA_POID]);
        }

        g_EditMarkerData[playerid][EDITMARKER_DATA_POID] = INVALID_OBJECT_ID;

        g_EditMarkerData[playerid][EDITMARKER_DATA_ATTACH] = false;
    }

    if( !IsValidPlayerObject(playerid, g_EditMarkerData[playerid][EDITMARKER_DATA_POID]) ) {
        g_EditMarkerData[playerid][EDITMARKER_DATA_POID] = CreatePlayerObject(playerid, EDITMARKER_MODELID, x, y, z, 0.0, 0.0, 0.0); // Create Marker Object
    }

    if( IsValidPlayerObject(playerid, g_EditMarkerData[playerid][EDITMARKER_DATA_POID]) ) {
        if( IsValidVehicle(attachto_vehicleid) ) {
            AttachPlayerObjectToVehicle(playerid, g_EditMarkerData[playerid][EDITMARKER_DATA_POID], attachto_vehicleid, attach_off_x, attach_off_y, attach_off_z, 0.0, 0.0, 0.0);
            g_EditMarkerData[playerid][EDITMARKER_DATA_ATTACH] = true;
        } else {
            SetPlayerObjectPos(playerid, g_EditMarkerData[playerid][EDITMARKER_DATA_POID], x, y, z);
        }
    }

    SetPlayerMapIcon(playerid, EDITMARKER_MAPICONID, x, y, z, 0, RGBA_YELLOW, MAPICON_GLOBAL); // Set Map Icon
    
    return 1;
}

DefaultEditMarkerData(playerid) {
    g_EditMarkerData[playerid][EDITMARKER_DATA_ON] = false;
    g_EditMarkerData[playerid][EDITMARKER_DATA_ATTACH] = false;
    g_EditMarkerData[playerid][EDITMARKER_DATA_POID] = INVALID_OBJECT_ID;
    g_EditMarkerData[playerid][EDITMARKER_DATA_Z] = 0.0;
    g_EditMarkerData[playerid][EDITMARKER_DATA_TICK] = 0;
    g_EditMarkerData[playerid][EDITMARKER_DATA_MODEL] = INVALID_MODEL_ID;
}
