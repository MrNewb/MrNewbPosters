--
--		___  ___       _   _                  _      _____              _         _        		
--		|  \/  |      | \ | |                | |    /  ___|            (_)       | |       		
--		| .  . | _ __ |  \| |  ___ __      __| |__  \ `--.   ___  _ __  _  _ __  | |_  ___ 		
--		| |\/| || '__|| . ` | / _ \\ \ /\ / /| '_ \  `--. \ / __|| '__|| || '_ \ | __|/ __|		
--		| |  | || |   | |\  ||  __/ \ V  V / | |_) |/\__/ /| (__ | |   | || |_) || |_ \__ \		
--		\_|  |_/|_|   \_| \_/ \___|  \_/\_/  |_.__/ \____/  \___||_|   |_|| .__/  \__||___/		
--                                                                  | |              			
--                                                                  |_|              			
--		  Need support? Join our Discord server for help: https://discord.gg/d3Kh2vz3a7			

Config = {
	Debug = false,												-- set this to turn on prints
	--PosterItem = "poster",										-- The item that would be used for this to work
	framework = "qb",											-- set this to the name of the method, pass as string. options are "qb", "esx", if using qbx just set to qb
	Logs = false,												-- set this to the name of the method, pass as string. options are "qb","ox", set to false to disable like Logs = false,		
	Notify = "ox",												-- set this to the name of the method, pass as string. options are "ox","qb","ok","sd"
	Progress = "ox",											-- set this to the name of the method, pass as string. options are "ox","qb"
	Interact = "ox",											-- set this to the name of the method, pass as string. options are "ox","3dtext"
	StartPosition = vector3(-1059.40, -240.01, 44.01),			-- The position where the job would start
	PosterCoords = {
		{x = -1063.016, y = -2543.65, z = 20.62, h = 60.0},
		{x = 154.12, y = -1038.75, z = 29.82, h = 156.53},
		{x = 84.75, y = -764.99, z = 32.10, h = 337.62},
		{x = 72.33, y = -805.12, z = 31.90, h = 159.72},
		{x = -1205.33, y = -889.20, z = 13.52, h = 213.11},
		{x = 816.79, y = -1041.36, z = 27.19, h = 179.74},
		{x = 451.80, y = 82.23, z = 99.08, h = 160.20},
		{x = 929.08, y = 53.27, z = 81.56, h = 239.14},
		{x = 195.79, y = -1175.49, z = 29.85, h = 97.57},
		{x = 217.59, y = -1785.27, z = 29.35, h = 318.81},
		{x = -223.46, y = -932.15, z = 29.74, h = 70.50},
	},
	PosterModels = {
		"ba_prop_battle_poster_skin_01",
		"ba_prop_battle_poster_skin_02",
		"ba_prop_battle_poster_skin_03",
		"ba_prop_battle_poster_skin_04",
	},
	BlipSettings = {
		Sprite = 184,
		Display = 4,
		Scale = 0.8,
		Colour = 57,
	},
	LanguageText = {
		StartJobLang = "Press [E] to Start Poster Job.",
		PlacePoster = "Press [E] to place the poster",
		BlipName = "Poster Company",
	},
}
