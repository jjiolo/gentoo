/*************/
static const char *fonts[]          = { "liberation mono:size=15" };
static const char dmenufont[]       =   "liberation mono:size=15";
/*************/
static const unsigned int borderpx  = 1;
static const unsigned int snap      = 32;
static const int showbar            = 1;
static const int topbar             = 1;
/*************/
static const char normbordercolor[] = "#b30000";
static const char normbgcolor[]     = "#000000";
static const char normfgcolor[]     = "#b30000";
static const char selbordercolor[]  = "#ff0000";
static const char selbgcolor[]      = "#000000";
static const char selfgcolor[]      = "#ff0000";
/*************/
static const char *colors[][3] = {
[SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
[SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};
/*************/
static const char *tags[] = { "[H]", "[1]", "[2]", "[3]" };
/*************/
static const Rule rules[] = { { NULL, NULL, NULL, 0, 0, -1 }, };
/*************/
static const float mfact     = 0.55;
static const int nmaster     = 1;
static const int resizehints = 1;
static const int lockfullscreen = 1;
/*************/
static const Layout layouts[] = {
 { "[T]", tile },
 { "[F]", NULL },
 { "[M]", monocle },
};
/*************/
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) { MODKEY, KEY, view, {.ui = 1 << TAG} }, { MODKEY|ShiftMask, KEY, tag, {.ui = 1 << TAG} },
/*************/
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *nobody[]   = { "links", "-g", "-no-connect", NULL };
static const char *proxy[]    = { "links", "-g", "-no-connect", "-socks-proxy", "127.0.0.1:9050", "-only-proxies", "1", NULL };
static const char *browser[]  = { "browser", NULL };
/*************/
static const Key keys[] = {
 { MODKEY|ShiftMask, XK_Return,    spawn,          {.v = termcmd } },
 { MODKEY|ShiftMask, XK_BackSpace, spawn,          {.v = nobody } },
 { MODKEY|ShiftMask, XK_equal,     spawn,          {.v = proxy } },
 { MODKEY|ShiftMask, XK_minus,     spawn,          {.v = browser } },
 { MODKEY,           XK_b,         togglebar,      {0} },
 { MODKEY,           XK_j,         focusstack,     {.i = +1 } },
 { MODKEY,           XK_k,         focusstack,     {.i = -1 } },
 { MODKEY,           XK_i,         incnmaster,     {.i = +1 } },
 { MODKEY,           XK_d,         incnmaster,     {.i = -1 } },
 { MODKEY,           XK_h,         setmfact,       {.f = -0.05} },
 { MODKEY,           XK_l,         setmfact,       {.f = +0.05} },
 { MODKEY,           XK_Return,    zoom,           {0} },
 { MODKEY|ShiftMask, XK_c,         killclient,     {0} },
 { MODKEY,           XK_t,         setlayout,      {.v = &layouts[0]} },
 { MODKEY,           XK_f,         setlayout,      {.v = &layouts[1]} },
 { MODKEY,           XK_m,         setlayout,      {.v = &layouts[2]} },
 { MODKEY,           XK_space,     setlayout,      {0} },
 { MODKEY|ShiftMask, XK_space,     togglefloating, {0} },
 { MODKEY,           XK_comma,     focusmon,       {.i = -1 } },
 { MODKEY,           XK_period,    focusmon,       {.i = +1 } },
 { MODKEY|ShiftMask, XK_comma,     tagmon,         {.i = -1 } },
 { MODKEY|ShiftMask, XK_period,    tagmon,         {.i = +1 } },
 TAGKEYS(            XK_grave,                     0)
 TAGKEYS(            XK_1,                         1)
 TAGKEYS(            XK_2,                         2)
 TAGKEYS(            XK_3,                         3)
 { MODKEY|ShiftMask, XK_q,         quit,           {0} },
};
/*************/
static const Button buttons[] = {
 { ClkClientWin,  MODKEY, Button1, movemouse,      {0} },
 { ClkClientWin,  MODKEY, Button3, resizemouse,    {0} },
 { ClkTagBar,     0,      Button1, view,           {0} },
};
/*************/
