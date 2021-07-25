static const char norm_fg[] = "{foreground}";
static const char norm_bg[] = "{background}";
static const char norm_border[] = "{color8}";

static const char sel_fg[] = "{foreground}";
static const char sel_bg[] = "{color6}";
static const char sel_border[] = "{foreground}";

static const char urg_fg[] = "{foreground}";
static const char urg_bg[] = "{color1}";
static const char urg_border[] = "{color1}";

static const char *colors[][3]      = {{
    /*               fg           bg         border                         */
    [SchemeNorm] = {{ norm_fg,     norm_bg,   norm_border }}, // unfocused wins
    [SchemeSel]  = {{ sel_fg,      sel_bg,    sel_border }},  // the focused win
    // [SchemeUrg] =  {{ urg_fg,      urg_bg,    urg_border }},
}};
