# Map-Editor-V3
### Version 3
### Download Links + How-To @ the end of readme

![Header](http://i.imgur.com/GXbn2ba.png)

## Features:
* **Objects + Colors** - w/ Texture and Text Support.
* **Vehicles** - w/ Fast & Easy Tuning.
* **Pickups**
* **Actors** - w/ Animations.
* **Player Attachments**
* **Categories** - for Models, Vehicles, Skins and Textures.
* **Toolbar** - Instant access to a wide array of useful options.
* **Offset Editor** - Edit the offset of attached objects easily with keys.
* **Map File Management** - Wipe, Load & Save your maps.
* **Ingame Help Menu** - Contains credits, keystrokes and information about the script.
* **Category Manager** - Edit categories and their content.
* **Edit Marker** - A yellow arrow indicating which item is being edited.
* **RemoveBuilding Support** - You can now remove & re-create buildings.

## What's New?
* **Edit Marker** 
* **Simplified Texturing** 
* **Categories + Category Manager**
* **New Browser Design**
* **Toolbar with More Options**
* **Huge amounts of minor tweaks**

## Screenshot(s):
![Screenshot](https://i.imgur.com/yz8aR7C.jpeg)

### More pictures can be seen in this [album](https://imgur.com/a/dcFWm).
The map shown in the album is included in the map editor package.

## Credits:
* **Slice** - strlib
* **Y_Less** - sscanf
* **Zamaroht** - Textdraw Editor
* **SuperViper** - All Object Models
* **Pottus** - All Object Textures
* **Pottus** - All GTA SA Objects
* **Crayder** - All Model Sizes & Skin Names
* **Stylock** - GetAttachedObjectPos
* **h02** - Noclip Flymode

## Dependencies: ***REQUIRED!***
### Downloads can be found at the bottom of the page
* strlib **(Required)** by Slice
* sscanf 2.8.2 **(Required)** by Y_Less

## How To:
* Download everything required, download links can be found further down this post.

### How to Compile:
* Extract ```mapedit.pwn``` to your ```filterscripts``` folder.
* Extract the folder ```mapedit``` and its' content to your ```filterscripts``` folder.
* Extract ```strlib.inc``` to your ```pawno/includes``` folder.
* Extract ```sscanf2.inc``` to your ```pawno/includes``` folder.
* Compile the code using pawno.
* If the compilation was successful you should have the file ```mapedit.amx``` in your filterscripts folder now.
### OR
* Extract ```mapedit.amx``` to your ```filterscripts``` folder.

### Before Loading:
* Extract ```sscanf.dll``` (windows) / ```sscanf.so``` (linux) to your plugins folder.
* Add ```sscanf``` (windows) / ```sscanf.so``` (linux) to your plugins line in your ```server.cfg``` file.
* Create a folder in your ```scriptfiles``` folder and name the new folder ```maps```.
* Extract ```mapedit.db``` from the map editor package to your ```scriptfiles``` folder.
* Extract ```mapedit_maps.db``` from the map editor package to your ```scriptfiles``` folder.

### How to Load:
* Add ```mapedit``` to your ```server.cfg``` filterscripts line, then start your server.
### OR
* Type ```loadfs mapedit``` in the server console window once opened, then press enter.
### Done!

## Problem?
### If something doesn't work as it should, try using a blank gamemode combined with the map editor filterscript! Example provided below.
(Thanks to Kwarde for the tip)

pawn Code:
```
#include <a_samp>

main() { }

public OnGameModeInit() {
    AddPlayerClass(0, 0, 0, 0, 0, 0, 0, 0 ,0 , 0 ,0);
}
```

## Download
* strlib **(Required)** by Slice
  * [GitHub Download](https://github.com/oscar-broman/strlib/archive/master.zip)
  * [GitHub Page](https://github.com/oscar-broman/strlib)
* sscanf 2.8.2 **(Required)** by Y_Less
  * [GitHub Windows Download](https://github.com/maddinat0r/sscanf/releases/download/v2.8.2/sscanf-2.8.2-win32.zip)
  * [GitHub Linux Download](https://github.com/maddinat0r/sscanf/releases/download/v2.8.2/sscanf-2.8.2-linux.tar.gz)
  * [GitHub Page](https://github.com/maddinat0r/sscanf/releases/tag/v2.8.2)
* Map Editor
  * [GitHub Download](https://github.com/fusez/Map-Editor-V3/archive/master.zip)
  * [GitHub Page](https://github.com/fusez/Map-Editor-V3)
* Map Editor V3 Building Migrator Database Tool **(Optional)**
    * [GitHub Download](https://github.com/fusez/Map-Editor-V3-BuildMigrator/archive/refs/heads/master.zip)
    * [GitHub Page](https://github.com/fusez/Map-Editor-V3-BuildMigrator)
