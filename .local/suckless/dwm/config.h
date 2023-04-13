/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>
/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int gappx     = 16;        /* gaps between windows */
static const unsigned int snap      = 35;       /* snap pixel */
static const int swallowfloating    = 1;        /* 1 means swallow floating windows by default */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 16;       /* vertical padding of bar */
static const int sidepad            = 16;       /* horizontal padding of bar */
static const char *fonts[]          = { "JetBrainsMono Nerd Font, monospace:size=10"};
static const char dmenufont[]       = { "JetBrainsMono Nerd Font, monospace:size=10"};
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const unsigned int roundcorners = 5;
static const unsigned int barroundcorners = 5;
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#4a393b";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#e617b6";
static char selbordercolor[]        = "#f542aa";
static char selbgcolor[]            = "#4f4746";

static const char *upvol[]      = { "pactl", "set-sink-volume", "0", "+5%",     NULL };
static const char *downvol[]    = { "pactl", "set-sink-volume", "0", "-5%",     NULL };
static const char *mutevol[]    = { "pactl", "set-sink-mute",   "0", "toggle",  NULL };
static const char *light_up[]   = {"brillo", "-A", "3", NULL};
static const char *light_down[] = {"brillo", "-U", "3", NULL};

static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};


/* tagging */
static const char *tags[] = { " terminal", " browser", " music", " burp", " useless" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class		instance	 title		        tags        mask  isfloating  noswallow  monitor              scratch key */
	{ "firefox",   	NULL,		NULL,             1         << 1,			0,			0,         -1,      -1,   0 },
	{ NULL,         NULL, 	"Event Tester",   0,				   0,     0,			1,		      0       -1, 0 }, /* xev */
	{ NULL,		  "scratchpad",	NULL,		        0,		   1,			0,		      0,       -1, 's' },
};

/*First arg only serves to match against key in rules*/
static const char *scratchpadcmd[] = {"s", "st", "-n", "scratchpad", "-g", "80x20", NULL};

/* layout(s) */
static const float mfact     = 0.52; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
    { " ",     tile },    /* first entry is default */
	  { " ",     NULL },    /* no layout function means floating behavior */
    { " ",     monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
static const char *powermenu[] = { "/bin/bash", "-c", "swpb", "p" };
static const char *searchmenu[] = { "/bin/bash", "-c", "/usr/local/bin/swpb", "s" };
/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont};
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ 0,			                      XF86XK_AudioLowerVolume,	spawn,			{.v = downvol } },
	{ 0,			                      XF86XK_AudioMute,			    spawn,			{.v = mutevol } },
	{ 0,			                      XF86XK_AudioRaiseVolume,	spawn,			{.v = upvol   } },
  { 0,			                      XF86XK_MonBrightnessUp  ,	spawn ,			{.v = light_up}} ,
	{ 0,			                      XF86XK_MonBrightnessDown,	spawn ,			{.v = light_down}},

  { MODKEY|ShiftMask,             XK_x,                     spawn,          {.v = powermenu } },
  { MODKEY|ShiftMask,             XK_u,                     spawn,          {.v = searchmenu } },
	{ MODKEY,                       XK_grave,  togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY,                       XK_l,      setmfact,		    {.f = +0.05} },
	{ MODKEY,                       XK_k,      focusstack,		  {.i = -1 } },
	{ MODKEY,                       XK_j,      focusstack,		  {.i = +1 } },
	{ MODKEY,                       XK_h,      setmfact,		    {.f = -0.05} },
	{ MODKEY,                       XK_g,      togglebar,		    {0} },
	{ MODKEY,                       XK_f,	     zoom,			      {0} },
	{ MODKEY,                       XK_d,      incnmaster,		  {.i = -1 } },
	{ MODKEY,                       XK_s,      incnmaster,		  {.i = +1 } },
	{ MODKEY,						            XK_c,      killclient,		  {0} },
	{ MODKEY,                       XK_z,      setlayout,		    {.v = &layouts[0]} },
	{ MODKEY,                       XK_e,      setlayout,       {.v = &layouts[1]} },
	{ MODKEY,                       XK_x,      setlayout,       {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_w,  	   togglefloating,  {0} },
	{ MODKEY,                       XK_t,  	   setlayout,       {0} },
	{ MODKEY,                       XK_space,  spawn,           {.v = dmenucmd } },
	{ MODKEY,						            XK_Return, spawn,           {.v = termcmd } },
	{ MODKEY,                       XK_Tab,    view,            {0} },
	{ MODKEY,                       XK_0,      view,            {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,             {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,        {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,          {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,          {.i = +1 } },

	{ MODKEY,						            XK_minus,  setgaps,			    {.i = -1 } },
	{ MODKEY,						            XK_equal,  setgaps,			    {.i = +1 } },
	{ MODKEY|ShiftMask,				      XK_equal,  setgaps,			    {.i =  0 } },
	{ MODKEY,                       XK_F5,     xrdb,            {.v = NULL } },
	{ MODKEY,                       XK_r,      resizemouse,		  {0} },
	{ MODKEY|ShiftMask,				      XK_q,      quit,            {0} },
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,            {1} }, 
        TAGKEYS(                        XK_1,						0)
	TAGKEYS(                        XK_2,						1)
	TAGKEYS(                        XK_3,						2)
	TAGKEYS(                        XK_4,						3)
	TAGKEYS(                        XK_5,						4)


};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

