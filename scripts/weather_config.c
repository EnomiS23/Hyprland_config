#include"weather.h"

int main()
{
    
  CURL *curl;
    CURLcode res;

    struct coord s;
    init_coord(&s);

    curl = curl_easy_init();
    if (curl) {
    
        curl_easy_setopt(curl, CURLOPT_URL, "https://ipinfo.io/loc");
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writefunc);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &s);

        res = curl_easy_perform(curl);
       

        if (res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
            return 1;
        }
        s.ptr[strcspn(s.ptr, "\n")] = 0;
        
        char *comma = strchr(s.ptr, ',');
        if (!comma) {
            fprintf(stderr, "Invalid location format: %s\n", s.ptr);
            return 1;
        }
        *comma = '\0';
        char *lat = s.ptr;
        char *lon = comma + 1;
    
        struct coord weather;
        init_coord(&weather);

        
        char *API_KEY = "0689f03603e6ff5b4522cbe4d1411efc";
        char weather_url[512];
        snprintf(weather_url, sizeof(weather_url),
                 "https://api.openweathermap.org/data/2.5/weather?lat=%s&lon=%s&appid=%s&units=metric",
                 lat, lon, API_KEY);

        curl_easy_setopt(curl, CURLOPT_URL, weather_url);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writefunc);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &weather);

    
        res = curl_easy_perform(curl);
        if (res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
            return 1;
        }

cJSON *root = cJSON_Parse(weather.ptr);
        if (!root) {
            fprintf(stderr, "Error parsing JSON\n");
            return 1;
        }

        struct weather w;
        cJSON *name = cJSON_GetObjectItem(root, "name");
        cJSON *weather_arr = cJSON_GetObjectItem(root, "weather");
        cJSON *weather0 = cJSON_GetArrayItem(weather_arr, 0);
        cJSON *main = cJSON_GetObjectItem(root, "main");
        cJSON *wind = cJSON_GetObjectItem(root, "wind");
        cJSON *sys = cJSON_GetObjectItem(root, "sys");

        w.oras = strdup(name->valuestring);
        w.stare = strdup(cJSON_GetObjectItem(weather0, "main")->valuestring);
        w.descriere = strdup(cJSON_GetObjectItem(weather0, "description")->valuestring);
        w.temp = cJSON_GetObjectItem(main, "temp")->valuedouble;
        w.feels_like = cJSON_GetObjectItem(main, "feels_like")->valuedouble;
        w.temp_max = cJSON_GetObjectItem(main, "temp_max")->valuedouble;
        w.temp_min = cJSON_GetObjectItem(main, "temp_min")->valuedouble;
        w.presiune = cJSON_GetObjectItem(main, "pressure")->valueint;
        w.umiditate = cJSON_GetObjectItem(main, "humidity")->valueint;
        w.viteza_vantului = cJSON_GetObjectItem(wind, "speed")->valuedouble;
        w.sunrise = cJSON_GetObjectItem(sys, "sunrise")->valueint;
        w.sunset = cJSON_GetObjectItem(sys, "sunset")->valueint;


        time_t sunrise_time = w.sunrise;
        time_t sunset_time = w.sunset;
        struct tm *sr_tm = localtime(&sunrise_time);
        

        printf("Oras: %s\n", w.oras);
        printf("Stare: %s (%s)\n", w.stare, w.descriere);
        printf("Temperatura: %.1f°C (se simte: %.1f°C)\n", w.temp, w.feels_like);
        printf("Max: %.1f°C, Min: %.1f°C\n", w.temp_max, w.temp_min);
        printf("Presiune: %d hPa, Umiditate: %d%%\n", w.presiune, w.umiditate);
        printf("Viteza vantului: %.1f m/s\n", w.viteza_vantului);
        printf("Rasarit: %02d:%02d:%02d\n", sr_tm->tm_hour, sr_tm->tm_min, sr_tm->tm_sec);
        struct tm *ss_tm = localtime(&sunset_time);
        printf("Apus:    %02d:%02d:%02d\n", ss_tm->tm_hour, ss_tm->tm_min, ss_tm->tm_sec);
FILE *fjson = fopen("/home/simone/.config/eww/scripts/weather1.txt", "w");
if (fjson) {
    fprintf(fjson, "descriere=\"%s\"\n", w.descriere);
    fprintf(fjson, "sunset=%d\n", w.sunset);
    fprintf(fjson, "sunrise=%d\n", w.sunrise);
    fclose(fjson);
} else {
    fprintf(stderr, "Nu pot deschide weather1.txt pentru scriere!\n");
}


        // Clean-up
        cJSON_Delete(root);
        free(w.oras);
        free(w.stare);
        free(w.descriere);
        free(weather.ptr);
        free(s.ptr);
        curl_easy_cleanup(curl);
    }

    return 0;
}