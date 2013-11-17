/*
 * generates a DST table (the time_t values at which the DST state changes)
 * takes 3 arguments: start, end and delta:
 *      start is the start of the period
 *      end is.. forget it
 *      delta is the step, in which it is guaranteed that no more than 1
 *          dst changes will occur.
 */

#include <stdio.h>
#include <time.h>
#include <stdbool.h>
#include <stdlib.h>

bool is_dst(time_t t)
{
    struct tm *time;
    time = localtime(&t);
    return (time->tm_isdst > 0);
}

time_t search(time_t start, time_t end)
// find a single DST change within a period, or return 0 if there are no
// changes within the period
{
    time_t half;
    if (is_dst(start) == is_dst(end) || end - start <= 1)
        return 0;   // nothing to look for in this interval

    // binary search
    while (end - start > 1) {
        half = start + ((end - start) / 2);

        if (is_dst(start) == is_dst(half))
            start = half;
        else if (is_dst(end) == is_dst(half))
            end = half;
    }
    return end;
}

void print_time(time_t from, time_t to)
{
    printf("%llu %llu\n", (unsigned long long)from, (unsigned long long)to);
}

void multisearch(time_t start, time_t end, time_t delta)
// perform multiple searches in successive periods, defined by delta,
// until end is reached
{
    time_t threshold;
    time_t last_on = 0;
    while (start < end) {
        threshold = search(start, start + delta);
        if (threshold) {
            start = threshold;
            if (is_dst(threshold)) {
                last_on = threshold;
            } else {
                // last_on contains the last change from nodst to dst.
                // so now we print the period in which there is dst
                print_time(last_on, threshold);
            }
        } else {
            start = start + delta;
        }
    }
}

int main(int argc, char *argv[])
{
    if (argc < 4) return 1;
    time_t start, end, delta;
    start = (time_t)strtoull(argv[1], NULL, 10);
    end =   (time_t)strtoull(argv[2], NULL, 10);
    delta = (time_t)strtoull(argv[3], NULL, 10);

    multisearch(start, end, delta);

    return 0;
}
