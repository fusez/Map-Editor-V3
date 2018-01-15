GetModShopName(modshopid, name[], name_size) {
    switch(modshopid) {
        case MODSHOP_TRANSFENDER: {
            strunpack(name, !"Transfender", name_size);
        }
        case MODSHOP_LOCOLOW: {
            strunpack(name, !"Loco Low Co", name_size);
        }
        case MODSHOP_WHEELARCH: {
            strunpack(name, !"Wheel Arch Angels", name_size);
        }
        default: {
            format(name, name_size, "Unknown Tuning Shop (%i)", modshopid);
            return 0;
        }
    }
    return 1;
}

GetModShopPosition(modshopid, &Float:x, &Float:y, &Float:z, &Float:a) {
    switch(modshopid) {
        case MODSHOP_TRANSFENDER: {
            x = 2386.7168, y = 1049.6642, z = 10.6430, a = 0.0;
        }
        case MODSHOP_LOCOLOW: {
            x = 2644.8989, y = -2044.8210, z = 13.3657, a = 180.0;
        }
        case MODSHOP_WHEELARCH: {
            x = -2723.5051, y = 217.1725, z = 4.2119, a = 90.0;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetVehicleModelModShop(modelid) {
    switch(modelid) {
        case 400, 401, 402, 404, 405, 409, 410, 411, 415, 418, 419, 420, 421, 422,
        424, 426, 429, 436, 438, 439, 442, 445, 451, 458, 466, 467, 474, 475, 477,
        478, 479, 480, 489, 491, 492, 496, 500, 506, 507, 516, 517, 518, 526, 527,
        529, 533, 540, 541, 542, 545, 546, 547, 549, 550, 551, 555, 579, 580, 585,
        587, 589, 600, 602, 603: {
            return MODSHOP_TRANSFENDER;
        }
        case 412, 534, 535, 536, 566, 567, 575, 576: {
            return MODSHOP_LOCOLOW;
        }
        case 558, 559, 560, 561, 562, 565: {
            return MODSHOP_WHEELARCH;
        }
    }
    return INVALID_MODSHOP_ID;
}
