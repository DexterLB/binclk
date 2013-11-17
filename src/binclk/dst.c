#include "dst.h"
const uint32_t dst_table[] = {
      1364698800, 1382842800
    , 1396148400, 1414292400
    , 1427598000, 1445742000
    , 1459047600, 1477796400
    , 1490497200, 1509246000
    , 1521946800, 1540695600
    , 1554001200, 1572145200
    , 1585450800, 1603594800
    , 1616900400, 1635649200
    , 1648350000, 1667098800
    , 1679799600, 1698548400
    , 1711854000, 1729998000
    , 1743303600, 1761447600
    , 1774753200, 1792897200
    , 1806202800, 1824951600
    , 1837652400, 1856401200
    , 1869102000, 1887850800
    , 1901156400, 1919300400
    , 1932606000, 1950750000
    , 1964055600, 1982804400
    , 1995505200, 2014254000
    , 2026954800, 2045703600
    , 2058404400, 2077153200
    , 2090458800, 2108602800
};

#define dst_table_n (sizeof dst_table / sizeof dst_table[0])

#define dst_table_offset 0

#define dst_offset 3600


time_t dst(time_t time)
// performs a DST correction on time
// aka returns time when we're not on dst, and time + dst_offset otherwise
{
    uint8_t index;
    uint32_t t = (uint32_t)(time + dst_table_offset);

    for (index = 0; t > dst_table[index] && index < dst_table_n; ++index);

    if (index % 2) {
        time += (dst_offset);
    }
    return time;
}
