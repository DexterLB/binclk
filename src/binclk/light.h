#ifndef LIGHT_H
#define LIGHT_H

#define LIGHT_TABLE_COUNT       16 + 1
#define LIGHT_TABLE_MAX         1024
#define LIGHT_TABLE_STEP        (LIGHT_TABLE_MAX / (LIGHT_TABLE_COUNT - 1))

#define LIGHT_OFF_MULTIPLIER    1000
#define LIGHT_OFF_DIVISOR       190566

#define LIGHT_MIN               18

#define LIGHT_STEP              3

const uint32_t light_table[LIGHT_TABLE_COUNT] = {
     2536987
    ,1176156
    ,545270
    ,252789
    ,117194
    ,54331
    ,25188
    ,11677
    ,5414
    ,2510
    ,1164
    ,539
    ,250
    ,116
    ,54
    ,25
    ,12
};

#endif
