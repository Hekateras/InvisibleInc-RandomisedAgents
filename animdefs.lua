----------------------------------------------------------------
-- Copyright (c) 2012 Klei Entertainment Inc.
-- All Rights Reserved.
-- SPY SOCIETY.
----------------------------------------------------------------

local cdefs = include( "client_defs" )
local util = include( "client_util" )
local commondefs = include( "sim/unitdefs/commondefs" )
local commonanims = include("common_anims")


local AGENT_ANIMS = commondefs.AGENT_ANIMS
local Layer = commondefs.Layer
local BoundType = commondefs.BoundType

-------------------------------------------------------------------
-- Data for anim definitions.

local animdefs =
{
	randomKanim1 =
	{
		wireframe =
		{
			"data/anims/characters/agents/overlay_agent_shalem.abld",
		},
		build = 
		{ 
			"data/anims/characters/agents/agent_shalem.abld",
			"data/anims/characters/anims_male/shared_hits_01.abld",	
			"data/anims/characters/anims_male/shared_attacks_a_01.abld",	 	 
		},
		grp_build = 
		{
			"data/anims/characters/agents/grp_agent_shalem.abld",
		},
		grp_anims = commonanims.male.grp_anims,

		anims = commonanims.male.default_anims_unarmed,
		anims_1h = commonanims.male.default_anims_1h,
		anims_2h = commonanims.male.default_anims_2h,
		animMap = AGENT_ANIMS,

		symbol = "character",
		anim = "idle",
		shouldFlip = true,
		scale = 0.25,
		layer = Layer.Unit,
		boundType = BoundType.Character,
		boundTypeOverrides = {			
			{anim="idle_ko" ,boundType= BoundType.CharacterFloor},
			{anim="dead" ,boundType= BoundType.CharacterFloor},
		},		
		peekBranchSet = 1,	
	},
}

return animdefs