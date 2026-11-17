#include <raylib.h>
#include <stddef.h>
#include <assert.h>
#include <stdlib.h>

typedef struct
{
    Color background;
}PLUG_ST;

static PLUG_ST *p = NULL;

void plug_init(void)
{
    p = malloc(sizeof(*p));
    assert(p != NULL);
    p->background = GREEN;
    TraceLog(LOG_INFO, "------------------");
    TraceLog(LOG_INFO, "Initialized       ");
    TraceLog(LOG_INFO, "------------------");
}

void *plug_pre_reload(void)
{
    return p;
}

void plug_post_reload(void *state)
{
    p = state;
}

void plug_update(void)
{
    BeginDrawing();
    ClearBackground(RED);
    EndDrawing();
}