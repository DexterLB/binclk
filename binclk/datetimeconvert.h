#ifndef DATETIMECONVERT_H
#define DATETIMECONVERT_H

#include <stdint.h>
#include "compat.h"

// All the horrors of date/time conversion compressed into
// two convenience functions!

struct ymdhms_t
{
    uint8_t year,month,day,weekday,hour,minute,second;
        // year is 0-99 which represents 2000-2099
        // weekday is unused.
};

bool is_year_leap(uint16_t year);
time_t time_t_from_ymdhms(struct ymdhms_t* t);
struct ymdhms_t* ymdhms_from_time_t(struct ymdhms_t* t, time_t sec);

#endif
