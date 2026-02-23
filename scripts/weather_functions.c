#include "weather.h"
void init_coord(struct coord *s)
{
    s->len=0;
    s->ptr=malloc(1);
    if(s->ptr==NULL)
    {
        fprintf(stderr,"Alocare esuata!");
        exit(EXIT_FAILURE);

    }
     s->ptr[0] = '\0';
}
size_t writefunc(void *ptr, size_t size, size_t nmemb, struct coord *s) {
    size_t new_len = s->len + size * nmemb;
    s->ptr = realloc(s->ptr, new_len + 1);
    if (s->ptr == NULL) {
        fprintf(stderr, "realloc() failed\n");
        exit(EXIT_FAILURE);
    }
    memcpy(s->ptr + s->len, ptr, size * nmemb);
    s->len = new_len;
    s->ptr[s->len] = '\0';
    return size * nmemb;
}
