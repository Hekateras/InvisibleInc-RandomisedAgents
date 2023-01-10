local util = include( "modules/util" )
local commondefs = include( "sim/unitdefs/commondefs" )
local simdefs = include("sim/simdefs")
local speechdefs = include("sim/speechdefs")
local SCRIPTS = include('client/story_scripts')
local DEFAULT_DRONE = commondefs.DEFAULT_DRONE
local SOUNDS = commondefs.SOUNDS

local WILSON_SOUNDS =
{
    bio = "",
    escapeVo = "",
	speech="SpySociety/Agents/dialogue_player",  
	step = simdefs.SOUNDPATH_FOOTSTEP_MALE_HARDWOOD_NORMAL, 
	stealthStep = simdefs.SOUNDPATH_FOOTSTEP_MALE_HARDWOOD_SOFT,  

	wallcover = "SpySociety/Movement/foley_suit/wallcover",
	crouchcover = "SpySociety/Movement/foley_suit/crouchcover",
	fall = "SpySociety/Movement/foley_suit/fall",	
	fall_knee = "SpySociety/Movement/bodyfall_agent_knee_hardwood",
	fall_kneeframe = 9,
	fall_hand = "SpySociety/Movement/bodyfall_agent_hand_hardwood",
	fall_handframe = 20,
	land = "SpySociety/Movement/deathfall_agent_hardwood",
	land_frame = 35,						
	getup = "SpySociety/Movement/foley_suit/getup",	
	grab = "SpySociety/Movement/foley_suit/grab_guard",	
	pin = "SpySociety/Movement/foley_suit/pin_guard",
	pinned = "SpySociety/Movement/foley_suit/pinned",
	peek_fwd = "SpySociety/Movement/foley_suit/peek_forward",	
	peek_bwd = "SpySociety/Movement/foley_suit/peek_back",					
	move = "SpySociety/Movement/foley_suit/move",		
	hit = "SpySociety/HitResponse/hitby_ballistic_flesh",			
}

local agent_templates =
{
	randomAgent1 =
	{
		type = "simunit", 
        agentID = "randomAgent1",
		name = "Random name",
		file = "Filenumber",
		fullname = "Full name",
		loadoutName = STRINGS.UI.ON_FILE,
		yearsOfService = "5",
		age = "25",
		homeTown = "Hometown",
		gender = "male",
		class = "Engineer",
		toolTip =  "Tooltip",
		onWorldTooltip = commondefs.onAgentTooltip,
		profile_icon_36x36= "gui/profile_icons/wilson_36_alt.png",
		profile_icon_64x64= "gui/profile_icons/wilson_64.png",		
		splash_image = "gui/agents/wilson_1024.png",
		team_select_img = {
			"gui/agents/team_select_wilson.png",
		},

		profile_anim = "portraits/sharpshooter_face",
		profile_build = "portraits/sharpshooter_face",
		kanim = "kanim_sharpshooter_male",
		hireText =  STRINGS.AGENT_WILSON.WILSON.RESCUED,
		centralHireSpeech = nil,
		traits = util.extend( commondefs.DEFAULT_AGENT_TRAITS ) { mp=8, mpMax = 8, seesShadowCreatures = true, },
		skills = util.extend( commondefs.DEFAULT_AGENT_SKILLS ) {}, 
		startingSkills = { },
		abilities = util.tconcat( { "sprint", "customKanimAbility" }, commondefs.DEFAULT_AGENT_ABILITIES ),
		children = { }, -- Dont add items here, add them to the upgrades table in createDefaultAgency()
		sounds = WILSON_SOUNDS,
		speech = STRINGS.AGENT_WILSON.WILSON.BANTER,
		blurb =  STRINGS.AGENT_WILSON.WILSON.ALT_1.BIO,
		upgrades = { "item_power_tazer_1", },		
	},	

	
	randomAgent1_a =
	{
		type = "simunit", 
        agentID = "randomAgent1",
		name = "Random name",
		file = "Filenumber",
		fullname = "Full name",
		loadoutName = STRINGS.UI.ON_ARCHIVE,
		yearsOfService = "5",
		age = "25",
		homeTown = "Hometown",
		gender = "male",
		class = "Engineer",
		toolTip =  "Tooltip",
		onWorldTooltip = commondefs.onAgentTooltip,
		profile_icon_36x36= "gui/profile_icons/wilson_36_alt.png",
		profile_icon_64x64= "gui/profile_icons/wilson_64.png",		
		splash_image = "gui/agents/wilson_1024.png",
		team_select_img = {
			"gui/agents/team_select_wilson.png",
		},

		profile_anim = "portraits/sharpshooter_face",
		profile_build = "portraits/sharpshooter_face",
		kanim = "randomKanim1",
		hireText =  STRINGS.AGENT_WILSON.WILSON.RESCUED,
		centralHireSpeech = nil,
		traits = util.extend( commondefs.DEFAULT_AGENT_TRAITS ) { mp=8, mpMax = 8, seesShadowCreatures = true, },
		skills = util.extend( commondefs.DEFAULT_AGENT_SKILLS ) {}, 
		startingSkills = { },
		abilities = util.tconcat( { "sprint", "customKanimAbility" }, commondefs.DEFAULT_AGENT_ABILITIES ),
		children = { }, -- Dont add items here, add them to the upgrades table in createDefaultAgency()
		sounds = WILSON_SOUNDS,
		speech = STRINGS.AGENT_WILSON.WILSON.BANTER,
		blurb =  STRINGS.AGENT_WILSON.WILSON.ALT_1.BIO,
		upgrades = { "item_power_tazer_1", },		
	},		
}

return agent_templates