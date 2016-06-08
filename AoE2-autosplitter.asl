state("AoK HD", "aoehd")
{
	int startshd : 0x79D644;
	int victory : 0x79D68C;
}
state("age2_x1", "aoc10c")
{	
	int starts : 0x283CC0;
	int starts2 : 0x2B4E24;
	double victory : 0x29572C;
}
state("age2_x1_1.0c_1920x1080", "aoc10c")
{
	int starts : 0x283CC0;
	int starts2 : 0x2B4E24;
	double victory : 0x29572C;
}
state("age2_x1_1.0c_1600x900", "aoc10c")
{
	int starts : 0x283CC0;
	int starts2 : 0x2B4E24;
	double victory : 0x29572C;
}
state("age2_x1_1.0c_1366x768", "aoc10c")
{
	int starts : 0x283CC0;
	int starts2 : 0x2B4E24;
	double victory : 0x29572C;
}

init
{
if (modules.First().ModuleMemorySize < 10000000) version = "aoc10c";
if (modules.First().ModuleMemorySize > 10000000) version = "aoehd";
}

start
{
if (version == "aoc10c" && old.starts2 == 1 && current.starts2 == 0 && current.victory == 0) return true;
if (version == "aoehd" && old.startshd == 0 && current.startshd > 0) return true;
}

split
{
	if (old.victory == 0 && current.victory > 0) return true;
}

reset
{
	if (version == "aoc10c" && old.starts == 1 && current.starts == 0) return true;
	if (version == "aoehd" && old.startshd > 0 && current.startshd == 0) return true;
}
