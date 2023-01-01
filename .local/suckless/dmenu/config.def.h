/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"JetBrainsMono Nerd Font:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const int vertpad       = 16;        /* vertical padding */
static const int sidepad       = 16;        /* horizontal padding */
#include "/home/pwn/.cache/wal/colors-wal-dmenu.h"
/*
/static char normfgcolor[]      = "#bbbbbb";
static char normbgcolor[]      = "#222222";
static char selfgcolor[]       = "#e617b6";
static char selbgcolor[]       = "#4f4746";
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
//	[SchemeNorm] = { normfgcolor, normbgcolor },
//	[SchemeSel] = { selfgcolor,  selbgcolor },
//	[SchemeOut] = { "#000000", selfgcolor },
//};
*/
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
