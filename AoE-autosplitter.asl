state("empires", "aoe10")
{
	int igt : 0x161E30, 0x138;
	int victory : 0x19DC30;
}
state("empires", "aoe10b")
{
	int igt : 0x1694D0, 0x138;
	int victory : 0x1681D8, 0x1B0;
}
state("empires", "aoe10c")
{
	int igt : 0x17CBA0, 0x138;
	int victory : 0x17AF88;
}
state("empiresx", "ror10")
{
	int igt : 0x187F2C, 0x138;
	int victory : 0x185E88, 0x1B0;
}

state("empiresx", "ror10a")
{
	int igt : 0x00182EDC, 0x138;
	int victory : 0x180E38, 0x1B0;
}

init
{
	if (modules.First().ModuleMemorySize == 3293184) version = "aoe10";
	if (modules.First().ModuleMemorySize == 4210688) version = "aoe10b";
	if (modules.First().ModuleMemorySize == 4042752) version = "aoe10c";
	if (modules.First().ModuleMemorySize == 4100096) version = "ror10";
	if (modules.First().ModuleMemorySize == 4071424) version = "ror10a";
}

start
{
	if (old.igt == 0 && current.igt == 1) return true;
}

split
{
	if (old.victory == 4 && current.victory == 5 && current.igt == 1) return true;
}

reset
{
	if (old.igt == 1 && current.igt == 0) return true;
}
