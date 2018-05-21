ShowMapSaveDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_MAP_SAVE_AS: {
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Save Map", "Enter a name for this map:", "Save", "Cancel");
        }
        case DIALOGID_MAP_SAVE_CONFIRM: {
            format(g_DialogInfo, sizeof g_DialogInfo, "Type & Enter \"%s\" to save this map.", SAVEMAP_COMMAND);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Save Map", g_DialogInfo, "Save", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}

SaveMap(
    mapname[],
    &objects_saved,
    &vehicles_saved,
    &pickups_saved,
    &actors_saved,
    &attachments_saved,
    &buildings_saved,
    playerid = INVALID_PLAYER_ID
) {
    GetMapFilePath(mapname, g_FilePathString, sizeof g_FilePathString);

    new File:file_handle = fopen(g_FilePathString, io_write);
    if( !file_handle ) {
        return 0;
    }

    new
        slot_objectid   [MAX_OBJECTS],
        objectid_slot   [MAX_OBJECTS],
        valid_objects,

        slot_vehicleid  [MAX_VEHICLES],
        vehicleid_slot  [MAX_VEHICLES],
        valid_vehicles,

        slot_pickupid   [MAX_PICKUPS],
        valid_pickups,

        slot_actorid    [MAX_ACTORS],
        valid_actors
    ;

    for(new objectid = 1; objectid <= MAX_OBJECTS; objectid ++) {
        if(!IsValidObject(objectid)) {
            continue;
        }

        slot_objectid[valid_objects] = objectid;
        objectid_slot[objectid-1] = valid_objects ++;
    }

    for(new vehicleid = 1, max_vehicleid = GetVehiclePoolSize(); vehicleid <= max_vehicleid; vehicleid ++) {
        if( !IsValidVehicle(vehicleid) ) {
            continue;
        }

        slot_vehicleid[valid_vehicles] = vehicleid;
        vehicleid_slot[vehicleid-1] = valid_vehicles ++;
    }

    for(new pickupid; pickupid < MAX_PICKUPS; pickupid ++) {
        if( !g_PickupData[pickupid][PICKUP_DATA_ISVALID] ) {
            continue;
        }

        slot_pickupid[valid_pickups ++] = pickupid;
    }

    for(new actorid, max_actorid = GetActorPoolSize(); actorid <= max_actorid; actorid ++) {
        if( !IsValidActor(actorid) ) {
            continue;
        }

        slot_actorid[valid_actors ++] = actorid;
    }

    new write_string[500];
    if(valid_objects > 0) {
        format(write_string, sizeof write_string, "new g_Object[%i];\r\n", valid_objects);
        fwrite(file_handle, write_string);
    }

    if(valid_vehicles > 0) {
        format(write_string, sizeof write_string, "new g_Vehicle[%i];\r\n", valid_vehicles);
        fwrite(file_handle, write_string);
    }

    if(valid_pickups > 0) {
        format(write_string, sizeof write_string, "new g_Pickup[%i];\r\n", valid_pickups);
        fwrite(file_handle, write_string);
    }

    if(valid_actors > 0) {
        format(write_string, sizeof write_string, "new g_Actor[%i];\r\n", valid_actors);
        fwrite(file_handle, write_string);
    }

    for(new o; o < valid_objects; o ++) {
        new
            objectid = slot_objectid[o],
            Float:x,
            Float:y,
            Float:z,
            Float:rx,
            Float:ry,
            Float:rz
        ;

        GetObjectPos(objectid, x, y, z);
        GetObjectRot(objectid, rx, ry, rz);
        strunpack(g_CommentString, g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], MAX_COMMENT_LEN+1);

        format(write_string, sizeof write_string,
            "g_Object[%i] = CreateObject(%i, %.4f, %.4f, %.4f, %.4f, %.4f, %.4f); //%s\r\n",
            o, GetObjectModel(objectid), x, y, z, rx, ry, rz, g_CommentString
        );
        fwrite(file_handle, write_string);

        for(new materialindex; materialindex < MAX_OBJECT_INDEX; materialindex ++) {
            switch( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] ) {
                case MATERIALINDEX_TYPE_TEXTURE: {
                    new
                        textureid = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][materialindex],
                        modelid,
                        txd[MAX_TEXTURE_TXD+1],
                        name[MAX_TEXTURE_NAME+1]
                    ;


                    GetTextureData(textureid, modelid, txd, sizeof txd, name, sizeof name);

                    format(write_string, sizeof write_string,
                        "SetObjectMaterial(g_Object[%i], %i, %i, \"%s\", \"%s\", 0x%08x);\r\n",    o, materialindex, modelid, txd, name, g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex]
                    );
                    fwrite(file_handle, write_string);
                }
                case MATERIALINDEX_TYPE_TEXT: {
                    strunpack(g_ObjectTextString, g_ObjectText[objectid-1][materialindex], MAX_OBJECT_TEXT+1);
                    strunpack(g_FontString, g_ObjectFont[objectid-1][materialindex], MAX_FONTNAME_LEN+1);
                    GetMaterialSizeName( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_SIZE][materialindex], g_MaterialSizeString, sizeof g_MaterialSizeString );

                    format(write_string, sizeof write_string,
                        "SetObjectMaterialText(g_Object[%i], \"%s\", %i, %s, \"%s\", %i, %i, 0x%08x, 0x%08x, %i);\r\n", o,
                        g_ObjectTextString,
                        materialindex,
                        g_MaterialSizeString,
                        g_FontString,
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTSIZE][materialindex],
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ISBOLD][materialindex],
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex],
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex],
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][materialindex]
                    );
                    fwrite(file_handle, write_string);
                }
            }
        }
    }

    for(new v; v < valid_vehicles; v ++) {
        new vehicleid = slot_vehicleid[v], Float:x, Float:y, Float:z, Float:r;

        GetVehiclePos(vehicleid, x, y, z);
        GetVehicleZAngle(vehicleid, r);
        strunpack(g_CommentString, g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], MAX_COMMENT_LEN+1); // Get Vehicle Comment

        format(write_string, sizeof write_string,
            "g_Vehicle[%i] = CreateVehicle(%i, %.4f, %.4f, %.4f, %.4f, %i, %i, -1); //%s\r\n", v,
            GetVehicleModel(vehicleid),
            x, y, z, r,
            g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_1],
            g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_2],
            g_CommentString
        );
        fwrite(file_handle, write_string);

        for(new slot; slot < 14; slot ++) {
            new componentid = GetVehicleComponentInSlot(vehicleid, slot);
            if(componentid) {
                GetModelName(componentid, g_ModelString, sizeof g_ModelString);

                format(write_string, sizeof write_string, "AddVehicleComponent(g_Vehicle[%i], %i);//%s\r\n", v, componentid, g_ModelString);
                fwrite(file_handle, write_string);
            }

            new paintjobid = g_VehicleData[vehicleid-1][VEHICLE_DATA_PAINTJOB];
            if( paintjobid != INVALID_PAINTJOB_ID ) {
                format(write_string, sizeof write_string, "ChangeVehiclePaintjob(g_Vehicle[%i], %i);\r\n", v, paintjobid);
                fwrite(file_handle, write_string);
            }
         }
    }

    for(new p; p < valid_pickups; p ++) {
        new
            pickupid = slot_pickupid[p],
            modelid = g_PickupData[pickupid][PICKUP_DATA_MODEL],
            Float:x = g_PickupData[pickupid][PICKUP_DATA_X],
            Float:y = g_PickupData[pickupid][PICKUP_DATA_Y],
            Float:z = g_PickupData[pickupid][PICKUP_DATA_Z]
        ;

        strunpack(g_CommentString, g_PickupData[pickupid][PICKUP_DATA_COMMENT], MAX_COMMENT_LEN+1); // Get Comment

        format(write_string, sizeof write_string,
            "g_Pickup[%i] = CreatePickup(%i, 1, %.4f, %.4f, %.4f, -1); //%s\r\n", p, modelid, x, y, z, g_CommentString
        );
        fwrite(file_handle, write_string);
    }

    for(new a; a < valid_actors; a ++) {
        new actorid = slot_actorid[a], Float:x, Float:y, Float:z, Float:r;
        GetActorPos(actorid, x, y, z);
        GetActorFacingAngle(actorid, r);
        strunpack(g_CommentString, g_ActorData[actorid][ACTOR_DATA_COMMENT], MAX_COMMENT_LEN+1);

        format(write_string, sizeof write_string,
            "g_Actor[%i] = CreateActor(%i, %.4f, %.4f, %.4f, %.4f); //%s\r\n", a, g_ActorData[actorid][ACTOR_DATA_SKIN], x, y, z, r, g_CommentString
        );
        fwrite(file_handle, write_string);

        new anim_index = g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX];
        if(anim_index != INVALID_ANIM_INDEX) {
            new lib[MAX_ANIM_LIB+1], name[MAX_ANIM_NAME+1];
            GetAnimationName(anim_index, lib, MAX_ANIM_LIB+1, name, MAX_ANIM_NAME+1);

            format(write_string, sizeof write_string,
                "ApplyActorAnimation(g_Actor[%i], \"%s\", \"%s\", %.4f, %i, %i, %i, %i, %i);\r\n", a, lib, name,
                g_ActorData[actorid][ACTOR_DATA_ANIM_DELTA],
                g_ActorData[actorid][ACTOR_DATA_ANIM_LOOP],
                g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKX],
                g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKY],
                g_ActorData[actorid][ACTOR_DATA_ANIM_FREEZE],
                g_ActorData[actorid][ACTOR_DATA_ANIM_TIME]
            );
            fwrite(file_handle, write_string);
        }
    }

    for(new o; o < valid_objects; o ++) {
        new objectid = slot_objectid[o];

        switch( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] ) {
            case ID_TYPE_OBJECT: {
                new
                    attachtoid = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID],
                    attachtoslot = objectid_slot[attachtoid-1]
                ;

                format(write_string, sizeof write_string,
                    "AttachObjectToObject(g_Object[%i], g_Object[%i], %.4f, %.4f, %.4f, %.4f, %.4f, %.4f);\r\n", o, attachtoslot,
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ]
                );
                fwrite(file_handle, write_string);
            }
            case ID_TYPE_VEHICLE: {
                new
                    vehicleid = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID],
                    vehicleslot = vehicleid_slot[vehicleid-1]
                ;

                format(write_string, sizeof write_string,
                    "AttachObjectToVehicle(g_Object[%i], g_Vehicle[%i], %.4f, %.4f, %.4f, %.4f, %.4f, %.4f);\r\n", o, vehicleslot,
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY],
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ]
                );
                fwrite(file_handle, write_string);
            }
        }
    }

    if( playerid != INVALID_PLAYER_ID ) {
        new playername[MAX_PLAYER_NAME+1];
        GetPlayerName(playerid, playername, sizeof playername);

        for(new index; index < MAX_PLAYERATTACH_INDEX; index ++) {
            if( !g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                continue;
            }

            GetModelName(g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_MODEL], g_ModelString, sizeof g_ModelString);
            GetBoneName(g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_BONE], g_BoneString, sizeof g_BoneString);

            format(write_string, sizeof write_string,
                "SetPlayerAttachedObject(playerid, %i, %i, %i, %.4f, %.4f, %.4f, %.4f, %.4f, %.4f, %.4f, %.4f, %.4f, 0x%08x, 0x%08x); // %s attached to the %s of %s\r\n",
                index,
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_MODEL],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_BONE],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_X ],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Y ],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Z ],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RX],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RY],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RZ],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SX],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SY],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SZ],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR1],
                g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR2],
                g_ModelString,
                g_BoneString,
                playername
            );
            fwrite(file_handle, write_string);
            
            attachments_saved ++;
        }
    }

    for(new b; b < BUILDING_DATA_SIZE; b ++) {
        if( !g_BuildingData[b][BUILDING_DATA_ISLOADED] ) {
            continue;
        }

        if( !g_BuildingData[b][BUILDING_DATA_ISREMOVED] ) {
            continue;
        }

        GetModelName(g_BuildingData[b][BUILDING_DATA_MODEL], g_ModelString, sizeof g_ModelString);

        format(write_string, sizeof write_string,
            "RemoveBuildingForPlayer(playerid, %i, %.4f, %.4f, %.4f, %.2f); // %s\r\n",
            g_BuildingData[b][BUILDING_DATA_MODEL],
            g_BuildingData[b][BUILDING_DATA_X],
            g_BuildingData[b][BUILDING_DATA_Y],
            g_BuildingData[b][BUILDING_DATA_Z],
            g_BuildingData[b][BUILDING_DATA_OFFSET] + REMOVE_BUILDING_RANGE,
            g_ModelString
        );
        fwrite(file_handle, write_string);

        if( g_BuildingData[b][BUILDING_DATA_LODMODEL] != INVALID_BUILDING_LODMODEL ) {
            format(write_string, sizeof write_string,
                "RemoveBuildingForPlayer(playerid, %i, %.4f, %.4f, %.4f, %.2f); // LOD Model of %s\r\n",
                g_BuildingData[b][BUILDING_DATA_LODMODEL],
                g_BuildingData[b][BUILDING_DATA_X],
                g_BuildingData[b][BUILDING_DATA_Y],
                g_BuildingData[b][BUILDING_DATA_Z],
                g_BuildingData[b][BUILDING_DATA_OFFSET] + REMOVE_BUILDING_RANGE,
                g_ModelString
            );
            fwrite(file_handle, write_string);
        }

        buildings_saved ++;
    }

    objects_saved = valid_objects;
    vehicles_saved = valid_vehicles;
    pickups_saved = valid_pickups;
    actors_saved = valid_actors;

    fclose(file_handle);
    return 1;
}
