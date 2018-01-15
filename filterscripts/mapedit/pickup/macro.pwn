#define IsValidPickup(%0) \
    ( %0 >= 0 && %0 < MAX_PICKUPS && g_PickupData[%0][PICKUP_DATA_ISVALID] )
