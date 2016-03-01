/*
  Information:
  This File Contains the Settings that need to be integrated into the mission.sqm File.
*/

OnLoadName = "ComfyDowntime 7.0";
onLoadMission="Skipped to lucky seven, because that shit better work";
overviewText="Skipped to lucky seven, because that shit better work";
overViewPicture="fp_misc\img\fp_logo.paa";
loadScreen = "fp_misc\img\fp_logo.paa";
author="Kaukassus | 2016";

corpseManagerMode = 1;
corpseLimit = 20;
corpseRemovalMinTime = 120;
corpseRemovalMaxTime = 300;

wreckManagerMode = 1;
wreckLimit = 10;
wreckRemovalMinTime = 300;
wreckRemovalMaxTime = 800;

respawndelay = 5;
respawnDialog = 0;
respawn = 3;
respawnOnStart = 1;
respawnTemplates[] = {"MenuPosition", "MenuInventory"};

showGPS = 1;
showMap = 1;
showWatch = 1;
showCompass = 1;
joinUnassigned = 1;
disabledAI = 1;
allowFunctionsLog = 0;
enableDebugConsole = 1;
onLoadIntroTime = false;
enableItemsDropping = 0;
onLoadMissionTime = false;
class Header {
  gameType = Coop;
  minPlayers = 1;
  maxPlayers = 128;
};
