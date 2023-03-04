# kng-ragdoll
**Project Description:**
>Slaughterhouse / butcher script for FiveM
You have the option to use both or either.
Comes with Beef and Chicken pre-configured. Additional ones can be added.

**Dependencies:**
- qb-core
- qb-target
- qb-inventory or any other qbcore inventory script

**Install**
1. Unzip the release into your FiveM resource folder
2. Drag and drop the images from the images folder into your inventory images folder.
3. Add the items into your qb-core/shared/items.lua file
4. Edit your server.cfg to ensure kng-butcher on startup
5. You're done

Edit the following into qb-core/shared/items.lua

```
	["alive_chicken"]  	= {["name"] = "alive_chicken", 		["label"] = "Alive Chicken", 		["weight"] = 100, 		["type"] = "item", 			["image"] = "alive_chicken.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["dead_chicken"]  	= {["name"] = "dead_chicken", 		["label"] = "Dead Chicken", 		["weight"] = 100, 		["type"] = "item", 			["image"] = "dead_chicken.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["plucked_chicken"] = {["name"] = "plucked_chicken", 	["label"] = "Plucked Chicken", 		["weight"] = 100, 		["type"] = "item", 			["image"] = "plucked_chicken.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["chicken_filet"]  	= {["name"] = "chicken_filet", 		["label"] = "Chicken Filet", 		["weight"] = 100, 		["type"] = "item", 			["image"] = "chicken_filet.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["beef_carcass"]  	= {["name"] = "beef_carcass", 		["label"] = "Cow Carcass", 		    ["weight"] = 100, 		["type"] = "item", 			["image"] = "beef_carcass.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["skinned_carcass"] = {["name"] = "skinned_carcass", 	["label"] = "Skinned Cow Carcass", 	["weight"] = 100, 		["type"] = "item", 			["image"] = "skinned_carcass.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["cut_beef"]  	    = {["name"] = "cut_beef", 	        ["label"] = "Beef Meat", 		    ["weight"] = 100, 		["type"] = "item", 			["image"] = "cut_beef.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["packaged_beef"]  	= {["name"] = "packaged_beef", 	    ["label"] = "Packaged Beef", 		["weight"] = 100, 		["type"] = "item", 			["image"] = "packaged_beef.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

**Chicken Factory**

![ChickenSelling](https://media.discordapp.net/attachments/769689966817050674/1081469658953162752/Screenshot_10.png)
![ChickenCollecting](https://media.discordapp.net/attachments/769689966817050674/1081469659540361246/Screenshot_11.png)
![ChickenKilling](https://media.discordapp.net/attachments/769689966817050674/1081469660026908772/Screenshot_12.png)
![ChickenPlucking](https://media.discordapp.net/attachments/769689966817050674/1081469660546998303/Screenshot_13.png)
![ChickenCutting](https://media.discordapp.net/attachments/769689966817050674/1081469661088059472/Screenshot_15.png)


**Slaughterhouse**

![BeefSelling](https://media.discordapp.net/attachments/769689966817050674/1081469709226094703/Screenshot_17.png)
![BeefCollecting](https://media.discordapp.net/attachments/769689966817050674/1081469709943312504/Screenshot_18.png)
![BeefSkinning](https://media.discordapp.net/attachments/769689966817050674/1081469710484393984/Screenshot_19.png)
![BeefCutting](https://media.discordapp.net/attachments/769689966817050674/1081469710958333972/Screenshot_20.png)
![BeefPackaging](https://media.discordapp.net/attachments/769689966817050674/1081469711738482718/Screenshot_21.png)


**Items**

![Items](https://media.discordapp.net/attachments/769689966817050674/1081469708785684500/Screenshot_16.png)
