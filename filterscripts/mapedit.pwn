#include <a_samp>
#include <sscanf2>
#include <strlib> // Slice's strlib (NOT WESTIE'S!)

native IsValidVehicle(vehicleid);

#pragma dynamic 19100 // To avoid warnings at compiling

//------------------------------------------------------------------------------
// Defined Values & Enumerators

#define MAX_SEARCH_LEN          20
#define MAX_COMMENT_LEN         20
#define INVALID_TIMER_ID        0
#define INVALID_MODEL_ID        -1
#define INVALID_COLOR_ID        -1
#define INVALID_ROW             -1
#define INVALID_MAP_ID          0
#define INVALID_ARRAY_INDEX     -1
#define SELECT_TD_COLOR         0xFF0000FF
#define RGBA_WHITE              0xFFFFFFFF
#define RGBA_GREEN              0x00FF00FF
#define RGBA_RED                0xFF0000FF
#define RGBA_YELLOW             0xFFFF00FF
#define RGBA_ORANGE             0xFFA500FF
//#define MONEYREFILL_TOGGLED // Automatic money refill; useful for money in modshops (comment / remove this line to disable it)

#include "mapedit/pattach/value.pwn"
#include "mapedit/cammode/value.pwn"
#include "mapedit/idtype/value.pwn"
#include "mapedit/matindextype/value.pwn"
#include "mapedit/mapnew/value.pwn"
#include "mapedit/mapsave/value.pwn"
#include "mapedit/object/value.pwn"
#include "mapedit/offsetedit/value.pwn"
#include "mapedit/pickup/value.pwn"
#include "mapedit/vehicle/value.pwn"
#include "mapedit/dialog/value.pwn"
#include "mapedit/matalign/value.pwn"
#include "mapedit/anim/value.pwn"
#include "mapedit/modshop/value.pwn"
#include "mapedit/bone/value.pwn"
#include "mapedit/texture/value.pwn"
#include "mapedit/font/value.pwn"
#include "mapedit/model/value.pwn"
#include "mapedit/skin/value.pwn"
#include "mapedit/matsize/value.pwn"
#include "mapedit/vehmodel/value.pwn"
#include "mapedit/vehcolor/value.pwn"
#include "mapedit/editmarker/value.pwn"
#include "mapedit/modelcolor/value.pwn"
#include "mapedit/tdmode/value.pwn"
#include "mapedit/createlist/value.pwn"
#include "mapedit/catselect/value.pwn"
#include "mapedit/category/value.pwn"
#include "mapedit/selectlist/value.pwn"
#include "mapedit/colorlist/value.pwn"
#include "mapedit/texturelist/value.pwn"
#include "mapedit/fontlist/value.pwn"
#include "mapedit/help/value.pwn"
#include "mapedit/animlist/value.pwn"
#include "mapedit/modelview/value.pwn"
#include "mapedit/catmanager/value.pwn"
#include "mapedit/textureview/value.pwn"
#include "mapedit/maplist/value.pwn"
#include "mapedit/moneyrefill/value.pwn"
#include "mapedit/building/value.pwn"
#include "mapedit/buildlist/value.pwn"

//------------------------------------------------------------------------------
// Variables

new
    DB:       g_ResourceDB,
    DB:       g_MapDB,
    DBResult: g_DBResult
;

#include "mapedit/actor/var.pwn"
#include "mapedit/object/var.pwn"
#include "mapedit/pickup/var.pwn"
#include "mapedit/player/var.pwn"
#include "mapedit/vehicle/var.pwn"
#include "mapedit/matsize/var.pwn"
#include "mapedit/strvar/var.pwn"
#include "mapedit/toolbar/var.pwn"
#include "mapedit/model/var.pwn"
#include "mapedit/texture/var.pwn"
#include "mapedit/vehmodel/var.pwn"
#include "mapedit/font/var.pwn"
#include "mapedit/skin/var.pwn"
#include "mapedit/vehcolor/var.pwn"
#include "mapedit/modelcolor/var.pwn"
#include "mapedit/createlist/var.pwn"
#include "mapedit/catselect/var.pwn"
#include "mapedit/selectlist/var.pwn"
#include "mapedit/colorlist/var.pwn"
#include "mapedit/texturelist/var.pwn"
#include "mapedit/fontlist/var.pwn"
#include "mapedit/help/var.pwn"
#include "mapedit/animlist/var.pwn"
#include "mapedit/modelview/var.pwn"
#include "mapedit/catmanager/var.pwn"
#include "mapedit/textureview/var.pwn"
#include "mapedit/cammode/var.pwn"
#include "mapedit/offsetedit/var.pwn"
#include "mapedit/editmarker/var.pwn"
#include "mapedit/pattach/var.pwn"
#include "mapedit/maplist/var.pwn"
#include "mapedit/maploaded/var.pwn"
#include "mapedit/building/var.pwn"
#include "mapedit/buildlist/var.pwn"

//------------------------------------------------------------------------------
// Macros

#define HOLDING(%0)  ( newkeys & %0 )
#define PRESSED(%0)  ( (newkeys & %0) && !(oldkeys & %0) )
#define RELEASED(%0) ( !(newkeys & %0) && (oldkeys & %0) )

#include "mapedit/pattach/macro.pwn"
#include "mapedit/dialog/macro.pwn"
#include "mapedit/object/macro.pwn"
#include "mapedit/pickup/macro.pwn"
#include "mapedit/bone/macro.pwn"
#include "mapedit/texture/macro.pwn"
#include "mapedit/vehmodel/macro.pwn"
#include "mapedit/font/macro.pwn"
#include "mapedit/skin/macro.pwn"
#include "mapedit/vehcolor/macro.pwn"
#include "mapedit/modelcolor/macro.pwn"
#include "mapedit/matalign/macro.pwn"
#include "mapedit/building/macro.pwn"

//------------------------------------------------------------------------------
// Hooked Functions

#include "mapedit/object/hook.pwn"
#include "mapedit/vehicle/hook.pwn"
#include "mapedit/actor/hook.pwn"
#include "mapedit/pickup/hook.pwn"
#include "mapedit/selecttd/hook.pwn"

//------------------------------------------------------------------------------
// Additional Functions

GetMapFilePath(mapname[], path[], path_size) {
    format(path, path_size, "maps/%s.map", mapname);
}

#include "mapedit/floatfunc/func.pwn"
#include "mapedit/colorfunc/func.pwn"
#include "mapedit/matalign/func.pwn"
#include "mapedit/anim/func.pwn"
#include "mapedit/modshop/func.pwn"
#include "mapedit/bone/func.pwn"
#include "mapedit/texture/func.pwn"
#include "mapedit/font/func.pwn"
#include "mapedit/model/func.pwn"
#include "mapedit/skin/func.pwn"
#include "mapedit/matsize/func.pwn"
#include "mapedit/vehmodel/func.pwn"
#include "mapedit/vehcolor/func.pwn"
#include "mapedit/actor/func.pwn"
#include "mapedit/pattach/func.pwn"
#include "mapedit/cammode/func.pwn"
#include "mapedit/mapnew/func.pwn"
#include "mapedit/mapload/func.pwn"
#include "mapedit/object/func.pwn"
#include "mapedit/offsetedit/func.pwn"
#include "mapedit/pickup/func.pwn"
#include "mapedit/player/func.pwn"
#include "mapedit/mapsave/func.pwn"
#include "mapedit/vehicle/func.pwn"
#include "mapedit/toolbar/func.pwn"
#include "mapedit/editmarker/func.pwn"
#include "mapedit/modelcolor/func.pwn"
#include "mapedit/tdmode/func.pwn"
#include "mapedit/clickdragobj/func.pwn"
#include "mapedit/createlist/func.pwn"
#include "mapedit/catselect/func.pwn"
#include "mapedit/category/func.pwn"
#include "mapedit/selectlist/func.pwn"
#include "mapedit/colorlist/func.pwn"
#include "mapedit/texturelist/func.pwn"
#include "mapedit/fontlist/func.pwn"
#include "mapedit/help/func.pwn"
#include "mapedit/animlist/func.pwn"
#include "mapedit/modelview/func.pwn"
#include "mapedit/catmanager/func.pwn"
#include "mapedit/textureview/func.pwn"
#include "mapedit/maplist/func.pwn"
#include "mapedit/maploaded/func.pwn"
#include "mapedit/mapdb/func.pwn"
#include "mapedit/building/func.pwn"
#include "mapedit/buildlist/func.pwn"

//------------------------------------------------------------------------------
// Callbacks

public OnFilterScriptInit() {
    g_ResourceDB = db_open("mapedit.db");
    if( !g_ResourceDB ) {
        print("ERROR: mapedit.db failed to open!");
    }

    g_MapDB = db_open("mapedit_maps.db");
    if( !g_MapDB ) {
        print("ERROR: mapedit_maps.db failed to open!");
    }

    if( !fexist("maps/") ) {
        printf("ERROR: The file path .../scriptfiles/maps does not exist!");
    }

    LoadModelCache();
    LoadVehicleModelCache();
    LoadTextureCache();
    LoadFontCache();
    LoadSkinCache();
    LoadVehicleColorCache();
    LoadModelColorCache();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultPlayerData(playerid);

            EnablePlayerCameraTarget(playerid, true); // to enable look-selecting vehicles, objects, actors
        }
    }

    #if defined core_OnFilterScriptInit
        core_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit core_OnFilterScriptInit
#if defined core_OnFilterScriptInit
    forward core_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    if( g_ResourceDB ) {
        db_close(g_ResourceDB);
    }

    #if defined core_OnFilterScriptExit
        core_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit core_OnFilterScriptExit
#if defined core_OnFilterScriptExit
    forward core_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
	DefaultPlayerData(playerid);
    EnablePlayerCameraTarget(playerid, true); // to enable look-selecting vehicles, objects, actors

    #if defined core_OnPlayerConnect
        return core_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect core_OnPlayerConnect
#if defined core_OnPlayerConnect
    forward core_OnPlayerConnect(playerid);
#endif


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    if( PRESSED(KEY_YES) || (PRESSED(KEY_CROUCH) && GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) ) {
        SelectTextDraw(playerid, SELECT_TD_COLOR); // toggle mouse mode
    }

    #if defined core_OnPlayerKeyStateChange
        core_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
    #endif
}
#if defined _ALS_OnPlayerKeyStateChange
    #undef OnPlayerKeyStateChange
#else
    #define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange core_OnPlayerKeyStateChange
#if defined core_OnPlayerKeyStateChange
    forward core_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif


public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ) {
    if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
        StopPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]);
        SetPlayerObjectPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], fX, fY, fZ);
    } else {
        SetPlayerPosFindZ(playerid, fX, fY, fZ);
    }

    #if defined core_OnPlayerClickMap
        core_OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickMap
    #undef OnPlayerClickMap
#else
    #define _ALS_OnPlayerClickMap
#endif
#define OnPlayerClickMap core_OnPlayerClickMap
#if defined core_OnPlayerClickMap
    forward core_OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ);
#endif


#include "mapedit/vehicle/call.pwn"
#include "mapedit/object/call.pwn"
#include "mapedit/pickup/call.pwn"
#include "mapedit/actor/call.pwn"
#include "mapedit/pattach/call.pwn"
#include "mapedit/selectlist/call.pwn"
#include "mapedit/createlist/call.pwn"
#include "mapedit/toolbar/call.pwn"
#include "mapedit/editmarker/call.pwn"
#include "mapedit/offsetedit/call.pwn"
#include "mapedit/cammode/call.pwn"
#include "mapedit/clickdragobj/call.pwn"
#include "mapedit/tdmode/call.pwn"
#include "mapedit/catselect/call.pwn"
#include "mapedit/colorlist/call.pwn"
#include "mapedit/texturelist/call.pwn"
#include "mapedit/fontlist/call.pwn"
#include "mapedit/help/call.pwn"
#include "mapedit/animlist/call.pwn"
#include "mapedit/modelview/call.pwn"
#include "mapedit/catmanager/call.pwn"
#include "mapedit/selecttd/call.pwn"
#include "mapedit/mapnew/call.pwn"
#include "mapedit/mapload/call.pwn"
#include "mapedit/mapsave/call.pwn"
#include "mapedit/textureview/call.pwn"
#include "mapedit/maplist/call.pwn"
#include "mapedit/maploaded/call.pwn"
#include "mapedit/moneyrefill/call.pwn"
#include "mapedit/building/call.pwn"
#include "mapedit/buildlist/call.pwn"
#include "mapedit/printsuccess/call.pwn" // has to be at the end of callback list, prints a message if called

main() {

}
