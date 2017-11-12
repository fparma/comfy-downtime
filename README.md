# Comfy Downtime

## What is Comfy Downtime
Comfy Downtime is essentially a more Customized and purpose-built version of ZGM, intended for both COOP, PVP and Misc Mission types that involve various Factions and sides.

It's concept is heavily inspired from the vanilla ZGM Missions, howvever a few big changes stand out:

* Arsenal at all initial Spawns for all Units (Can be disabled in Mission Settings)
* Optional LHD Spawnpoint (Can be enabled in Mission Settings)
* ACE Compatible
* Works on every map
* Custom Slingloading and Viewdistance scripts

## How to compile/build
### Dependencies
As of right now, the build process currently requires the following Dependencies:
* [Mikeros PBO Tools](https://armaservices.maverick-applications.com/Products/MikerosDosTools/FileBrowserFree)
* [Latest Rust (Stable or Nightly)](https://www.rust-lang.org/downloads.html)

Make sure the following path is in your %PATH% Environment Variable:
```
C:\Program Files (x86)\Mikero\DePboTools\bin\
```

What the build script essentially does is create a folder for each map Type that currently resides within the Facepunch Modpack, and creates a mission PBO File.

This way each Map has it's own ComfyDowntime Mission.

If you don't want to install these depndencies and just want to test the mission on a single map, you can simply PBO up the mission folder.

### Building the comfy_make program
Go into the comfy_make directory and execute the following command:
```
cargo build --release
```

After that, the exe file should be present under the following path:
```
comfy_make\target\release\comfy_make.exe
```
Copy that exe file into the "**src**" Folder, and execute it.
After that, the src folder should be populated with the mission PBO Files.
