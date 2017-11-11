// Author: comfy
// Description:
// Small script to copy the list of maps from all the addons that are currently mounted.
// Jump into the editor and execute this block of code in the debug console and it will copy the list of map endings into your clipboard.

///////// COPY FROM BELOW HERE

private _worldlist = [];
private _config_index = 0;

for [{_config_index = 0}, {_config_index < (count (configfile >> "CfgWorldList"))}, {_config_index = _config_index+1}] do {
  private _config = (configfile >> "CfgWorldList") select _config_index;
  _worldlist pushBack (configName _config);
};

hint str _worldlist;
copyToClipboard str _worldlist;