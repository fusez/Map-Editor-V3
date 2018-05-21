#define MAX_MAPLOAD_VARNAME 30

enum MAPLOAD_TYPE_DATA {
    MAPLOAD_TYPE_ID,
    MAPLOAD_TYPE_VARNAME[MAX_MAPLOAD_VARNAME+1 char]
}

static
    l_ObjectData    [MAX_OBJECTS][MAPLOAD_TYPE_DATA],
    l_VehicleData   [MAX_VEHICLES][MAPLOAD_TYPE_DATA],
    l_ActorData     [MAX_ACTORS][MAPLOAD_TYPE_DATA],

    l_ObjectsAdded,
    l_VehiclesAdded,
    l_ActorsAdded
;

ShowMapLoadDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_MAP_LOAD: {
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Load Map", "Enter the name of the map you would like to load:", "Load", "Cancel");
        }

        default: {
            return 0;
        }
    }
    return 1;
}

mapload_CreateVarname(id, idtype, varname[]) {
    switch(idtype) {
        case ID_TYPE_OBJECT: {
            if(l_ObjectsAdded >= MAX_OBJECTS) {
                return 0;
            }

            l_ObjectData[l_ObjectsAdded][MAPLOAD_TYPE_ID] = id;
            strpack(l_ObjectData[l_ObjectsAdded][MAPLOAD_TYPE_VARNAME], varname, MAX_MAPLOAD_VARNAME+1);
            l_ObjectsAdded ++;
        }
        case ID_TYPE_VEHICLE: {
            if(l_VehiclesAdded >= MAX_VEHICLES) {
                return 0;
            }

            l_VehicleData[l_VehiclesAdded][MAPLOAD_TYPE_ID] = id;
            strpack(l_VehicleData[l_VehiclesAdded][MAPLOAD_TYPE_VARNAME], varname, MAX_MAPLOAD_VARNAME+1);
            l_VehiclesAdded ++;
        }
        case ID_TYPE_ACTOR: {
            if(l_ActorsAdded >= MAX_ACTORS) {
                return 0;
            }

            l_ActorData[l_ActorsAdded][MAPLOAD_TYPE_ID] = id;
            strpack(l_ActorData[l_ActorsAdded][MAPLOAD_TYPE_VARNAME], varname, MAX_MAPLOAD_VARNAME+1);
            l_ActorsAdded ++;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

mapload_GetVarname(idtype, varname[]) {
    new packed_varname[MAX_MAPLOAD_VARNAME+1];

    strpack(packed_varname, varname, sizeof packed_varname);

    switch(idtype) {
        case ID_TYPE_OBJECT: {
            if(l_ObjectsAdded == 0) {
                return INVALID_OBJECT_ID;
            }

            for(new i = l_ObjectsAdded - 1; i >= 0; i --) {
                if(!strcmp(packed_varname, l_ObjectData[i][MAPLOAD_TYPE_VARNAME])) {
                    return l_ObjectData[i][MAPLOAD_TYPE_ID];
                }
            }
            return INVALID_OBJECT_ID;
        }
        case ID_TYPE_VEHICLE: {
            if(l_VehiclesAdded == 0) {
                return INVALID_VEHICLE_ID;
            }

            for(new i = l_VehiclesAdded - 1; i >= 0; i --) {
                if(!strcmp(packed_varname, l_VehicleData[i][MAPLOAD_TYPE_VARNAME])) {
                    return l_VehicleData[i][MAPLOAD_TYPE_ID];
                }
            }
            return INVALID_VEHICLE_ID;
        }
        case ID_TYPE_ACTOR: {
            if(l_ActorsAdded == 0) {
                return INVALID_ACTOR_ID;
            }

            for(new i = l_ActorsAdded - 1; i >= 0; i --) {
                if(!strcmp(packed_varname, l_ActorData[i][MAPLOAD_TYPE_VARNAME])) {
                    return l_ActorData[i][MAPLOAD_TYPE_ID];
                }
            }
            return INVALID_ACTOR_ID;
        }
    }
    return 0;
}

mapload_ResetVariables() {
    while(l_ObjectsAdded > 0) {
        l_ObjectsAdded --;
        l_ObjectData[l_ObjectsAdded][MAPLOAD_TYPE_ID] = INVALID_OBJECT_ID;
        strpack(l_ObjectData[l_ObjectsAdded][MAPLOAD_TYPE_VARNAME], "", MAX_MAPLOAD_VARNAME+1);
    }

    while(l_VehiclesAdded > 0) {
        l_VehiclesAdded --;
        l_VehicleData[l_VehiclesAdded][MAPLOAD_TYPE_ID] = INVALID_VEHICLE_ID;
        strpack(l_VehicleData[l_VehiclesAdded][MAPLOAD_TYPE_VARNAME], "", MAX_MAPLOAD_VARNAME+1);
    }

    while(l_ActorsAdded > 0) {
        l_ActorsAdded --;
        l_ActorData[l_ActorsAdded][MAPLOAD_TYPE_ID] = INVALID_ACTOR_ID;
        strpack(l_ActorData[l_ActorsAdded][MAPLOAD_TYPE_VARNAME], "", MAX_MAPLOAD_VARNAME+1);
    }
}

MapLoad(
    mapname[],
    &objects_loaded,
    &vehicles_loaded,
    &pickups_loaded,
    &actors_loaded,
    &attachments_loaded,
    &buildings_loaded,
    playerid = INVALID_PLAYER_ID
) {
    GetMapFilePath(mapname, g_FilePathString, sizeof g_FilePathString);
    if( !fexist(g_FilePathString) ) {
        return 0;
    }

    new File:file_handle = fopen(g_FilePathString, io_read);
    if( !file_handle ) {
        return 0;
    }

    mapload_ResetVariables();

    static
        buffer[500],
        func[100],
        params[300],
        comment[100]
    ;

    while( fread(file_handle, buffer) ) {
        strtrim(buffer);

        if( sscanf(buffer, "p<(>s[100]p<;>s[300]S(no comment)[100]", func, params, comment) ) {
            continue;
        }

        strtrim(params, " )");
        strtrim(comment, " /");

        if( isempty(comment) ) {
            format(comment, sizeof comment, "no comment");
        }

        if( strfind(func, "CreateObject") != -1 ) {
            static
                modelid,
                Float:x,
                Float:y,
                Float:z,
                Float:rx,
                Float:ry,
                Float:rz,
                Float:drawdistance,
                objectid,
                varname[MAX_MAPLOAD_VARNAME+1]
            ;

            if( sscanf(params, "p<,>iffffffF(0)", modelid, x, y, z, rx, ry, rz, drawdistance) ) {
                continue;
            }

            objectid = CreateObject(modelid, x, y, z, rx, ry, rz, drawdistance);
            if( objectid == INVALID_OBJECT_ID ) {
                continue;
            }

            strpack(g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], comment, MAX_COMMENT_LEN+1);

            if( !sscanf(func, "p<=>s[31]{s[100]}", varname) ) {
                strtrim(varname, " ");
                mapload_CreateVarname(objectid, ID_TYPE_OBJECT, varname);
            }
            
            objects_loaded ++;
        }

        else if(
            strfind(func, "AddStaticVehicleEx") != -1 ||
            strfind(func, "AddStaticVehicle") != -1 ||
            strfind(func, "CreateVehicle") != -1
        ) {
            static
                modelid,
                Float:x,
                Float:y,
                Float:z,
                Float:r,
                color1,
                color2,
                vehicleid,
                varname[MAX_MAPLOAD_VARNAME+1]
            ;

            if( sscanf(params, "p<,>iffffii{s[100]}", modelid, x, y, z, r, color1, color2) ) {
                continue;
            }

            vehicleid = CreateVehicle(modelid, x, y, z, r, color1, color2, -1);
            if( vehicleid == INVALID_VEHICLE_ID ) {
                continue;
            }

            strpack(g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], comment, MAX_COMMENT_LEN+1); // Set Vehicle Comment

            if( !sscanf(func, "p<=>s[31]{s[100]}", varname) ) {
                strtrim(varname, " ");
                mapload_CreateVarname(vehicleid, ID_TYPE_VEHICLE, varname);
            }
            
            vehicles_loaded ++;
        }

        else if(
            strfind(func, "AddStaticPickup") != -1 ||
            strfind(func, "CreatePickup") != -1
        ) {
            static
                modelid,
                Float:x,
                Float:y,
                Float:z,
                pickupid
            ;

            if( sscanf(params, "p<,>i{s[100]}fff{s[100]}", modelid, x, y, z) ) {
                continue;
            }

            pickupid = CreatePickup(modelid, 1, x, y, z);
            if( pickupid != INVALID_PICKUP_ID ) {
                strpack(g_PickupData[pickupid][PICKUP_DATA_COMMENT], comment, MAX_COMMENT_LEN+1); // Set Comment
            }
            
            pickups_loaded ++;
         }

        else if( strfind(func, "CreateActor") != -1 ) {
            static
                modelid,
                Float:x,
                Float:y,
                Float:z,
                Float:r,
                actorid,
                varname[MAX_MAPLOAD_VARNAME+1]
            ;

            if( sscanf(params, "p<,>iffff", modelid, x, y, z, r) ) {
                continue;
            }

            actorid = CreateActor(modelid, x, y, z, r);
            if( actorid == INVALID_ACTOR_ID ) {
                continue;
            }

            strpack(g_ActorData[actorid][ACTOR_DATA_COMMENT], comment, MAX_COMMENT_LEN+1); // Set Comment

            if( !sscanf(func, "p<=>s[31]{s[100]}", varname) ) {
                strtrim(varname, " ");
                mapload_CreateVarname(actorid, ID_TYPE_ACTOR, varname);
            }
            
            actors_loaded ++;
        }

        else if( strfind(func, "SetObjectMaterialText") != -1 ) {
            static
                varname[MAX_MAPLOAD_VARNAME+1],
                text[100],
                matindex,
                matsize_name[100],
                matsize_int,
                font[100],
                fontsize,
                isbold,
                fontcolor,
                backcolor,
                alignment,
                objectid
            ;

            if(
                sscanf(params, "p<,>s[31]s[100]I(0)S(90)[100]S(Arial)[100]I(24)I(1)H(0xFFFFFFFF)H(0x0)I(0)", varname, text, matindex, matsize_name, font, fontsize, isbold, fontcolor, backcolor, alignment) &&
                sscanf(params, "p<,>s[31]s[100]I(0)S(90)[100]S(Arial)[100]I(24)I(1)I(-1)I(0)I(0)",           varname, text, matindex, matsize_name, font, fontsize, isbold, fontcolor, backcolor, alignment)
            ) {
                continue;
            }

            strtrim(varname, " ");
            strtrim(matsize_name, " ");
            strtrim(text, " \"");
            strtrim(font, " \"");

            objectid = mapload_GetVarname(ID_TYPE_OBJECT, varname);
            if( objectid == INVALID_OBJECT_ID ) {
                continue;
            }

            if( !IsValidMaterialIndex(matindex) ) {
                continue;
            }

            matsize_int = GetMaterialSize(matsize_name);
            if( matsize_int == INVALID_MATERIAL_SIZE ) {
                continue;
            }

            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][matindex] = MATERIALINDEX_TYPE_TEXT;
            strpack(g_ObjectText[objectid-1][matindex], text, MAX_OBJECT_TEXT+1);
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_SIZE][matindex] = matsize_int;
            strpack(g_ObjectFont[objectid-1][matindex], font, MAX_FONTNAME_LEN+1);
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTSIZE][matindex] = fontsize;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ISBOLD][matindex] = isbold ? true : false;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][matindex] = fontcolor;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][matindex] = backcolor;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][matindex] = alignment;

            ApplyObjectMaterialIndexData(objectid, matindex);
        }

        else if( strfind(func, "SetObjectMaterial") != -1 ) {
            static
                varname[MAX_MAPLOAD_VARNAME+1],
                matindex,
                texturemodelid,
                texturetxd[100],
                texturename[100],
                matcolor,
                objectid,
                textureid
            ;

            if(
                sscanf(params, "p<,>s[31]iis[100]s[100]H(0x0)", varname, matindex, texturemodelid, texturetxd, texturename, matcolor) &&
                sscanf(params, "p<,>s[31]iis[100]s[100]I(0)",   varname, matindex, texturemodelid, texturetxd, texturename, matcolor)
            ){
                continue;
            }

            strtrim(varname, " ");
            strtrim(texturetxd, " \"");
            strtrim(texturename, " \"");

            if( !IsValidMaterialIndex(matindex) ) {
                continue;
            }

            objectid = mapload_GetVarname(ID_TYPE_OBJECT, varname);
            if( objectid == INVALID_OBJECT_ID ) {
                continue;
            }

            textureid = GetTextureID(texturemodelid, texturetxd, texturename);
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][matindex] = MATERIALINDEX_TYPE_TEXTURE;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][matindex] = textureid;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][matindex] = matcolor;

            ApplyObjectMaterialIndexData(objectid, matindex);
        }

        else if( strfind(func, "AddVehicleComponent") != -1 ) {
            static
                componentid,
                vehicleid,
                varname[MAX_MAPLOAD_VARNAME+1]
            ;

            if( sscanf(params, "p<,>s[31]i", varname, componentid) ) {
                continue;
            }

            strtrim(varname, " ");

            vehicleid = mapload_GetVarname(ID_TYPE_VEHICLE, varname);
            if( vehicleid != INVALID_VEHICLE_ID ) {
                AddVehicleComponent(vehicleid, componentid);
            }
        }

        else if( strfind(func, "ChangeVehiclePaintjob") != -1 ) {
            static
                paintjobid,
                vehicleid,
                varname[MAX_MAPLOAD_VARNAME+1]
            ;

            if( sscanf(params, "p<,>s[31]i", varname, paintjobid) ) {
                continue;
            }

            strtrim(varname, " ");

            vehicleid = mapload_GetVarname(ID_TYPE_VEHICLE, varname);
            if( vehicleid == INVALID_VEHICLE_ID ) {
                continue;
            }

            g_VehicleData[vehicleid-1][VEHICLE_DATA_PAINTJOB] = paintjobid;
            ChangeVehiclePaintjob(vehicleid, paintjobid);
        }

        else if( strfind(func, "AttachObjectToObject") != -1 ) {
            static
                varname[MAX_MAPLOAD_VARNAME+1],
                attachto_varname[MAX_MAPLOAD_VARNAME+1],
                Float:x,
                Float:y,
                Float:z,
                Float:rx,
                Float:ry,
                Float:rz,
                objectid,
                attachtoid
            ;

            if( sscanf(params, "p<,>s[31]s[31]ffffff", varname, attachto_varname, x, y, z, rx, ry, rz) ) {
                continue;
            }

            strtrim(varname, " ");
            strtrim(attachto_varname, " ");

            objectid = mapload_GetVarname(ID_TYPE_OBJECT, varname);
            if( objectid == INVALID_OBJECT_ID ) {
                continue;
            }

            attachtoid = mapload_GetVarname(ID_TYPE_OBJECT, attachto_varname);
            if( attachtoid == INVALID_OBJECT_ID ) {
                continue;
            }

            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] = ID_TYPE_OBJECT;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID] = attachtoid;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X] = x;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y] = y;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z] = z;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX] = rx;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY] = ry;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ] = rz;
            ApplyObjectAttachData(objectid);
        }

        else if( strfind(func, "AttachObjectToVehicle") != -1 ) {
            static
                varname[MAX_MAPLOAD_VARNAME+1],
                attachto_varname[MAX_MAPLOAD_VARNAME+1],
                Float:x,
                Float:y,
                Float:z,
                Float:rx,
                Float:ry,
                Float:rz,
                objectid,
                attachtoid
            ;

            if( sscanf(params, "p<,>s[31]s[31]ffffff", varname, attachto_varname, x, y, z, rx, ry, rz) ) {
                continue;
            }

            strtrim(varname, " ");
            strtrim(attachto_varname, " ");

            objectid = mapload_GetVarname(ID_TYPE_OBJECT, varname);
            if( objectid == INVALID_OBJECT_ID ) {
                continue;
            }

            attachtoid = mapload_GetVarname(ID_TYPE_VEHICLE, attachto_varname);
            if( attachtoid == INVALID_VEHICLE_ID ) {
                continue;
            }

            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] = ID_TYPE_VEHICLE;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID] = attachtoid;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X ] = x;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y ] = y;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z ] = z;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX] = rx;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY] = ry;
            g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ] = rz;
            ApplyObjectAttachData(objectid);
        }

        else if( strfind(func, "SetPlayerAttachedObject") != -1 ) {
            static
                index,
                modelid,
                bone,
                Float:x,
                Float:y,
                Float:z,
                Float:rx,
                Float:ry,
                Float:rz,
                Float:sx,
                Float:sy,
                Float:sz,
                color1,
                color2
            ;

            if(
                sscanf(params, "p<,>{s[50]}iiiF(0)F(0)F(0)F(0)F(0)F(0)F(0)F(0)F(0)H(0x0)H(0x0)", index, modelid, bone, x, y, z, rx, ry, rz, sx, sy, sz, color1, color2) &&
                sscanf(params, "p<,>{s[50]}iiiF(0)F(0)F(0)F(0)F(0)F(0)F(0)F(0)F(0)I(0)I(0)",     index, modelid, bone, x, y, z, rx, ry, rz, sx, sy, sz, color1, color2)
            ){
                continue;
            }

            if( !IsValidPlayerAttachIndex(index) || !IsValidBone(bone) ) {
                continue;
            }

            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] = true;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_MODEL] = modelid;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_BONE] = bone;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_X ] = x;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Y ] = y;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Z ] = z;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RX] = rx;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RY] = ry;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RZ] = rz;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SX] = sx;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SY] = sy;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SZ] = sz;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR1] = color1;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR2] = color2;
            ApplyPlayerAttachData(playerid, index);
            
            attachments_loaded ++;
        }

        else if( strfind(func, "ApplyActorAnimation") != -1 ) {
            static
                varname[MAX_MAPLOAD_VARNAME+1],
                animlib[100],
                animname[100],
                Float:delta,
                loop,
                lockx,
                locky,
                freeze,
                time,
                actorid,
                animindex
            ;

            if( sscanf(params, "p<,>s[31]s[100]s[100]fiiiii", varname, animlib, animname, delta, loop, lockx, locky, freeze, time) ) {
                continue;
            }

            strtrim(varname, " ");
            strtrim(animlib, " \"");
            strtrim(animname, " \"");

            actorid = mapload_GetVarname(ID_TYPE_ACTOR, varname);
            if( actorid == INVALID_ACTOR_ID ) {
                continue;
            }

            animindex = GetAnimationIndex(animlib, animname);
            if( animindex == INVALID_ANIM_INDEX ) {
                continue;
            }

            g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] = animindex;
            g_ActorData[actorid][ACTOR_DATA_ANIM_DELTA] = delta;
            g_ActorData[actorid][ACTOR_DATA_ANIM_LOOP] = loop ? true : false;
            g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKX] = lockx ? true : false;
            g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKY] = locky ? true : false;
            g_ActorData[actorid][ACTOR_DATA_ANIM_FREEZE] = freeze ? true : false;
            g_ActorData[actorid][ACTOR_DATA_ANIM_TIME] = time;

            ApplyActorAnimationData(actorid);
        }
        
        else if( strfind(func, "RemoveBuildingForPlayer") != -1 ) {
            static
                modelid,
                Float:x,
                Float:y,
                Float:z,
                Float:radius,
                building_array[BUILDING_DATA_SIZE],
                buildings_found
            ;

            if( sscanf(params, "p<,>{s[50]}iffff", modelid, x, y, z, radius) ) {
                continue;
            }
            
            buildings_found = GetBuildingsInRange(
                .result = building_array,
                .result_size = BUILDING_DATA_SIZE,
                .search_modelid = modelid,
                .search_x = x,
                .search_y = y,
                .search_z = z,
                .search_radius = radius
            );

            for(new b, buildingid; b < buildings_found; b ++) {
                buildingid = building_array[b];

                if( g_BuildingData[buildingid][BUILDING_DATA_ISREMOVED] ) {
                    continue;
                }

                g_BuildingData[buildingid][BUILDING_DATA_ISREMOVED] = true;

                RemoveBuildingIDForAll(buildingid);

                buildings_loaded ++;
            }
        }
    }

    fclose(file_handle);
    return 1;
}
