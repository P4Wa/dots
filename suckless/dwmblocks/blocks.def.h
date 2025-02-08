//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
        {"", "bar-btc",                                         360,            0},
        {"", "bar-xmr",                                         360,            0},
	{"", "bar-calendar",                                 	30,		0},
	{"", "bar-clock",					5,		0},

};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " ";
static unsigned int delimLen = 5;
