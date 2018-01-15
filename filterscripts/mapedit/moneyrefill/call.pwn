public OnPlayerUpdate(playerid) {
    #if defined MONEYREFILL_TOGGLED
    if( GetPlayerMoney(playerid) != MONEYREFILL_AMOUNT ) {
        ResetPlayerMoney(playerid);
        GivePlayerMoney(playerid, MONEYREFILL_AMOUNT);
    }
    #endif

    #if defined money_OnPlayerUpdate
        return money_OnPlayerUpdate(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerUpdate
    #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate money_OnPlayerUpdate
#if defined money_OnPlayerUpdate
    forward money_OnPlayerUpdate(playerid);
#endif
