import subprocess
import os
import shutil

# _cfgVehicles_categories = [];
# _nb_config = count (configFile >> "CfgWorldList");
# for [{_idx_config = 0}, {_idx_config < _nb_config}, {_idx_config = _idx_config+1}] do {
#   _config = (configFile >> "CfgWorldList") select _idx_config;
#   if (isClass _config) then {
#     _cfgVehicles_categories pushBack (configName _config);
#   };
# };
# copyToClipboard str _cfgVehicles_categories;

worlds = ["VR","utes","Sara","SaraLite","Sara_dbe1","Chernarus","Chernarus_Summer","Porto","Intro","IsolaDiCapraia","Mountains_ACR","Takistan","Zargabad","Woodland_ACR","Bootcamp_ACR","Desert_E","ProvingGrounds_PMC","Shapur_BAF","fata","Stratis","anim_helvantis_v2","Altis","pja310"]

missionname = "FP_ComfyDowntime"
ending = ".VR"
folder = os.getcwd() + "/"

subprocess.call("PBOConsole -pack " + folder + missionname + ending + " " + folder + missionname + ending + ".pbo", shell=True)

pbofile = folder + missionname + ending + ".pbo"

for w in worlds:
    if (ending != "." + w):
        newpbo = folder + missionname + "2_6." + w + ".pbo"
        shutil.copy(pbofile, newpbo)


# The Following SQF Code copies the world Array into your clipboard
#
#_configs = "diag_log configName _x; true" configClasses (configfile >> "CfgWorldList");
#copyToClipboard str _configs;
#