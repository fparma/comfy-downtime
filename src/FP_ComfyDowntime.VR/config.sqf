// Only allow people with map tools to draw on briefing
ACE_maptools_EveryoneCanDrawOnBriefing = false;

// Players that are given the option to start the mission, comma separated strings representing object name
// Empty array ([])  = disabled. Weapons are hot from the go, and no players will locked to a 20m circle until mission has started.
FP_lockStarters = ["gm", "actual"];

// Object names that will not be locked in a 20m circle when mission is under "lock", as in, it has not started.
// Ignored if FP_lockStarters is an empty array. If empty, squad leaders can move by default
FP_lockCanMove = ["gm", "actual", "amed", "a0","b0", "c0", "d0","p1", "p2", "crew1", "crew2", "crew3"];
