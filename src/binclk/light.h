#ifndef LIGHT_H
#define LIGHT_H

#define LIGHT_TABLE_COUNT       16 + 1
#define LIGHT_TABLE_MAX         1024
#define LIGHT_TABLE_STEP        (LIGHT_TABLE_MAX / (LIGHT_TABLE_COUNT - 1))

#define LIGHT_OFF_MULTIPLIER    1000
#define LIGHT_OFF_DIVISOR       190566

const uint32_t light_table[LIGHT_TABLE_COUNT] = {
      10000
    , 8443
    , 7129
    , 6019
    , 5082
    , 4291
    , 3623
    , 3059
    , 2583
    , 2181
    , 1164
    , 539
    , 250
    , 116
    , 54
    , 25
    , 12
};

#endif
