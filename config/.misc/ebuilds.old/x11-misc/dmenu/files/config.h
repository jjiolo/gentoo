/*************/
static int topbar = 1;
static const char *fonts[] = { "liberation mono:size=15" };
static const char *prompt  = NULL;
static const char *colors[SchemeLast][2] = {
	[SchemeNorm] = { "#b30000", "#000000" },
	[SchemeSel]  = { "#b30000", "#000000" },
	[SchemeOut]  = { "#b30000", "#000000" },
};
static unsigned int lines          = 0;
static const char worddelimiters[] = " ";
/*************/
