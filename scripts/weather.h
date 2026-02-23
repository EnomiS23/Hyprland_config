#ifndef WEATHER_H_
#define WEATHER_H_
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <time.h>
#include <cjson/cJSON.h>
struct coord{
    char *ptr;
    size_t len;
};
struct weather
{
  char *oras;
  char *stare;
  char *descriere;
  double temp;
  double feels_like;
  double temp_max;
  double temp_min;
  int presiune;
  int umiditate;
  double viteza_vantului; 
  int sunrise;
  int sunset;
};
void init_coord(struct coord* s);
size_t writefunc(void *ptr, size_t size, size_t nmemb, struct coord *s);
#endif