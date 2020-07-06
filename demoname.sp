#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = {
	name = "Demo Name",
	description = "Sets the demo name on MapChange.",
	author = "Clarkey",
	version = "1.0",
	url = "http://finalrespawn.com"
};

public void OnMapStart()
{
	char DemoName[64], MapName[64];
	FormatTime(DemoName, sizeof(DemoName), "%y_%m_%d_%H_%M_%S");
	GetCurrentMap(MapName, sizeof(MapName));
	Format(DemoName, sizeof(DemoName), "%s_%s", MapName, DemoName);
	ServerCommand("tv_record %s", DemoName);
}

public void OnMapEnd()
{
	ServerCommand("tv_stoprecord");
}