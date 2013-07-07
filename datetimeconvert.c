#include "datetimeconvert.h"


static const uint32_t daysSinceJan1st[2][13]=
{
    {0,31,59,90,120,151,181,212,243,273,304,334,365},   // 365 days, non-leap
    {0,31,60,91,121,152,182,213,244,274,305,335,366}    // 366 days, leap
};

bool is_year_leap(uint16_t year)
{
    return !(year % 4) && (year % 100 || !(year % 400));
}


time_t time_t_from_ymdhms(struct ymdhms_t* t)
{
    uint16_t year = t->year + 2000;

    uint8_t tm_sec = t->second;
    uint8_t tm_min = t->minute;
    uint8_t tm_hour = t->hour;
    uint8_t tm_year = year - 1900;

    uint16_t tm_yday = daysSinceJan1st[is_year_leap(year)][t->month - 1]
        + t->day - 1;


    return (
            (time_t)tm_sec + (time_t)tm_min*60 + (time_t)tm_hour*3600
            + (time_t)tm_yday*86400
            + ((time_t)tm_year-70)*31536000 
                + (((time_t)tm_year-69)/4)*86400
            - (((time_t)tm_year-1)/100)*86400 
                + (((time_t)tm_year+299)/400)*86400
           );

    // Taken from POSIX manual
}

struct ymdhms_t* ymdhms_from_time_t(struct ymdhms_t* t, time_t sec)
{
    uint16_t quadricentennials, centennials, quadrennials, annuals/*1-ennial?*/;
    uint16_t year;
    uint16_t yday;
    bool     leap;
    uint8_t  hour, min;
    uint8_t  month, mday, wday;

    sec += 11644473600; // move bias to 1601

    wday = (uint8_t)((sec / 86400 + 1) % 7); // day of week

    // Remove multiples of 400 years (incl. 97 leap days)
    quadricentennials = (uint16_t)(sec / 12622780800ULL); // 400*365.2425*24*3600
    sec %= 12622780800ULL;

    // Remove multiples of 100 years (incl. 24 leap days), can't be more than 3
    // (because multiples of 4*100=400 years (incl. leap days) have been removed)
    centennials = (uint16_t)(sec / 3155673600ULL); // 100*(365+24/100)*24*3600
    if (centennials > 3)
    {
        centennials = 3;
    }
    sec -= centennials * 3155673600ULL;

    // Remove multiples of 4 years (incl. 1 leap day), can't be more than 24
    // (because multiples of 25*4=100 years (incl. leap days) have been removed)
    quadrennials = (uint16_t)(sec / 126230400); // 4*(365+1/4)*24*3600
    if (quadrennials > 24)
    {
        quadrennials = 24;
    }
    sec -= quadrennials * 126230400ULL;

    // Remove multiples of years (incl. 0 leap days), can't be more than 3
    // (because multiples of 4 years (incl. leap days) have been removed)
    annuals = (uint16_t)(sec / 31536000); // 365*24*3600
    if (annuals > 3)
    {
        annuals = 3;
    }
    sec -= annuals * 31536000ULL;

    // Calculate the year and find out if it's leap
    year = 1601 + quadricentennials * 400 + centennials * 100 + quadrennials * 4 + annuals;
    leap = is_year_leap(year);

    // Calculate the day of the year and the time
    yday = sec / 86400;
    sec %= 86400;
    hour = sec / 3600;
    sec %= 3600;
    min = sec / 60;
    sec %= 60;

    // Calculate the month
    for (mday = month = 1; month < 13; month++)
    {
        if (yday < daysSinceJan1st[leap][month])
        {
            mday += yday - daysSinceJan1st[leap][month - 1];
            break;
        }
    }

    // Contributed by Alexey Frunze
    // http://stackoverflow.com/a/11197532/968261

    t->second  = sec;
    t->minute  = min;
    t->hour    = hour;
    t->day     = mday;
    t->month   = month;
    t->year    = year - 2000;       // since 2000
    t->weekday = wday ? wday : 7;   // fix sunday to be the last day
    return t;
}

