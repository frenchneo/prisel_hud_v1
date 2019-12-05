/////////////////////////

// Configuration file  //

/////////////////////////



LevelSystemConfiguration = {} // Ignore

Printers = {} // Ignore





LevelSystemConfiguration.EnableHUD = true // Is the HUD enabled?

LevelSystemConfiguration.LevelColor = Color(255,255,255,255) // The color of the "Level: 1" HUD element. White looks best. (This setting is nullified if you have the prestige system)

LevelSystemConfiguration.XPTextColor = Color(255,255,255,255) // The color of the XP percentage HUD element.

LevelSystemConfiguration.LevelBarColor = {24,24,24} // The color of the XP bar. (Sorry this one is different. It is still {R,G,B})

LevelSystemConfiguration.LevelTextPos = {1.5, 180.0} // The position of the LevelText. Y starts from bottom. Fiddle with it

LevelSystemConfiguration.DisplayLevel = false // Show player levels when you look at them



LevelSystemConfiguration.GreenJobBars = true // Are the green bars at the bottom of jobs enabled? KEEP THIS TRUE!

LevelSystemConfiguration.GreenAllBars = true // Are the green bars at the bottom of everything but jobs enabled? Recommended(true)



LevelSystemConfiguration.KillModule = false // Give XP + Money for kills! // Next 2 settings control this.

LevelSystemConfiguration.Friendly = false // Only take away money / give XP if the killer is a lower level/same level than the victim. (Recommended:true)

LevelSystemConfiguration.TakeAwayMoneyAmount = 0 // How much money to take away from players when they are killed and add to the killer. You can change this to 0 if none. The XP amount is dynamic.



LevelSystemConfiguration.NPCXP = false // Give XP when an NPC is killed?

LevelSystemConfiguration.NPCXPAmount = 50 // Amount of XP to give when an NPC is killed



LevelSystemConfiguration.TimerModule = true // Give XP to everybody every howeverlong

LevelSystemConfiguration.Timertime = 75 // How much time (in seconds) until everybody gets given XP

LevelSystemConfiguration.TimerXPAmount = 245 // How much XP to give each time it goes off

LevelSystemConfiguration.YourServerName = "sur Prisel" // The notifcation text ish. "You got 100XP for playing on the server."



LevelSystemConfiguration.XPMult = 1 // How hard it is to level up. 2 would require twice as much XP, ect.

LevelSystemConfiguration.MaxLevel = 99 // The max level

LevelSystemConfiguration.ContinueXP = false // If remaining XP continues over to next levels. I recommend this to be false. Seriously. What if a level 1 gets 99999999 XP somehow? He is level 99 so quickly.



//Printer settings

LevelSystemConfiguration.PrinterSound = false // Give the printers sounds?

LevelSystemConfiguration.PrinterMaxP = 4 // How many times a printer can print before stopping. Change this to 0 if you want infine.

LevelSystemConfiguration.PrinterMax = 4 // How many printers of a certain type a player can own at any one time

LevelSystemConfiguration.PrinterOverheat = false // Can printers overheat?

LevelSystemConfiguration.PrinterTime = 200 // How long it takes printers to print

LevelSystemConfiguration.KeepThisToTrue = false // Can players collect from printers that are 5 levels above their level? (Recommended: false)

LevelSystemConfiguration.Epilepsy = false // If printers flash different colors when they have money in them.



DarkRP.registerDarkRPVar("xp", net.WriteDouble, net.ReadDouble)

DarkRP.registerDarkRPVar("level", net.WriteDouble, net.ReadDouble)

DarkRP.registerDarkRPVar("prestige", net.WriteDouble, net.ReadDouble)

