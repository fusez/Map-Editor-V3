DefaultTextureViewData(playerid) {
    g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID] = INVALID_OBJECT_ID;
}

GetTextureViewNextPos(playerid, &Float:x, &Float:y, &Float:z) {
    new
        Float: vec_x,
        Float: vec_y,
        Float: vec_z
    ;

    GetPlayerCameraPos(playerid, x, y, z);
    GetPlayerCameraFrontVector(playerid, vec_x, vec_y, vec_z);

    x += (TEXTUREVIEW_DISTANCE * vec_x);
    y += (TEXTUREVIEW_DISTANCE * vec_y);
    z += (TEXTUREVIEW_DISTANCE * vec_z);
}

CreateTextureView(playerid) {
    if( !IsValidPlayerObject(playerid, g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID]) ) {
        new Float:x, Float:y, Float:z;

        GetTextureViewNextPos(playerid, x, y, z);

        g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID] = CreatePlayerObject(playerid, TEXTUREVIEW_MODELID, x, y, z, 0.0, 0.0, 0.0);
    }
    return g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID];
}

DestroyTextureView(playerid) {
    if( IsValidPlayerObject(playerid, g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID]) ) {
        DestroyPlayerObject(playerid, g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID]);

        g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID] = INVALID_OBJECT_ID;
    }
}

RefreshTextureView(playerid, textureid) {
    if( !IsValidPlayerObject(playerid, g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID]) ) {
        CreateTextureView(playerid);
    }

    if( !IsValidPlayerObject(playerid, g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID]) ) {
        return 0;
    }

    if( g_ObjectData[ g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID] - 1 ][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
        DestroyTextureView(playerid);
        CreateTextureView(playerid);
    }

    new
        modelid,
        Float:x,
        Float:y,
        Float:z
    ;

    GetTextureData(textureid, modelid, g_TextureTXDString, sizeof g_TextureTXDString, g_TextureNameString, sizeof g_TextureNameString);

    GetTextureViewNextPos(playerid, x, y, z);

    SetPlayerObjectMaterial(playerid, g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID], TEXTUREVIEW_MATINDEX, modelid, g_TextureTXDString, g_TextureNameString, 0);

    SetPlayerObjectPos(playerid, g_TextureViewData[playerid][TEXTUREVIEW_DATA_POID], x, y, z);

    return 1;
}
