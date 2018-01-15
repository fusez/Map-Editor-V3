enum MODEL_CACHE_DATA {
           MODEL_CACHE_ID,
           MODEL_CACHE_NAME[MAX_MODELNAME_LEN+1 char],
    Float: MODEL_CACHE_SPHERE_RADIUS,
    Float: MODEL_CACHE_SPHERE_OFF_X,
    Float: MODEL_CACHE_SPHERE_OFF_Y,
    Float: MODEL_CACHE_SPHERE_OFF_Z,
    Float: MODEL_CACHE_MIN_X,
    Float: MODEL_CACHE_MIN_Y,
    Float: MODEL_CACHE_MIN_Z,
    Float: MODEL_CACHE_MAX_X,
    Float: MODEL_CACHE_MAX_Y,
    Float: MODEL_CACHE_MAX_Z
}

new
    g_ModelCache[MAX_MODELS][MODEL_CACHE_DATA],
    g_ModelCacheIndex[(MAX_MODEL_ID - MIN_MODEL_ID)+1],
    g_ModelCacheLimit
;
