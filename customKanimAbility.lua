local array = include( "modules/array" )
local util = include( "modules/util" )
local cdefs = include( "client_defs" )
local simdefs = include("sim/simdefs")
local simquery = include("sim/simquery")
local abilityutil = include( "sim/abilities/abilityutil" )
local animdefs = include( "animdefs" )

local animPath = "data/anims/RANDOM/male/"
local Heads = {"Head1", "Head2", "Head3"}
local Arms = {"Arms1", "Arms2", "Arms3"}
local Legs = {"Legs1", "Legs2", "Legs3"}
local Torso = {"Torso1", "Torso2", "Torso3"}

local HeadsPath = "Head/"
local ArmsPath = "Arms/"
local LegsPath = "Legs/"
local TorsoPath = "Torso/"

local abld = ".abld"

local function lookupAnimDef( name )
	return animdefs.defs[ name ]
end

local function chooseRandomKanim( sim, unit )
	local kanim = lookupAnimDef("randomKanim1")
	local build = kanim.build
	
	local randHead = Heads[sim:nextRand(1,3)]
	local randArms = Arms[sim:nextRand(1,3)]
	local randLegs = Legs[sim:nextRand(1,3)]
	local randTorso = Torso[sim:nextRand(1,3)]
	
	table.insert(build, (animPath..HeadsPath..randHead..abld ) )
	table.insert(build, (animPath..ArmsPath..randArms..abld ) )
	table.insert(build, (animPath..LegsPath..randLegs..abld ) )
	table.insert(build, (animPath..TorsoPath..randTorso..abld ) )

	unit:getTraits().kanimBuild = build
	
	unit:changeKanim("randomKanim1")
	sim:dispatchEvent( simdefs.EV_UNIT_REFRESH, { unit = unit } )

end

local customKanimAbility = 
	{
		name = STRINGS.ABILITIES.SPRINT,
        canUseWhileDragging = true,

		hotkey = "abilitySprint",

		onTooltip = function( self, hud, sim, abilityOwner, abilityUser )
			local sprintBonus = SPRINT_BONUS
			if abilityUser:hasTrait("sprintBonus") then
				sprintBonus = sprintBonus + abilityUser:getTraits().sprintBonus
			end

			local SPRINT_TOOLTIP = util.sformat( STRINGS.ABILITIES.SPRINT_DESC, sprintBonus )
            return sprint_tooltip( hud, abilityUser, self, sim, abilityOwner, SPRINT_TOOLTIP )
		end,

		usesMP = true,

		alwaysShow = true,
		HUDpriority = 4,

		profile_icon = "gui/icons/action_icons/Action_icon_Small/actionicon__sprint_off.png",

		getProfileIcon =  function( self, sim, unit )
			if unit:getTraits().sneaking then
				return "gui/icons/action_icons/Action_icon_Small/actionicon__sprint_off.png"
			else
				return "gui/icons/action_icons/Action_icon_Small/actionicon__sprint_on.png"
			end
		end,


		getName = function( self, sim, unit )
			return STRINGS.ABILITIES.SPRINT_TOGGLE
		end,

		canUseAbility = function( self, sim, abilityOwner, abilityUser )
			return abilityutil.checkRequirements( abilityOwner, abilityUser )
		end,
		
		onSpawnAbility = function( self, sim, unit )
			log:write("LOG unit")
			log:write(util.stringize(unit:getUnitData().name,2))
			chooseRandomKanim( sim, unit )
		end,
			
		onDespawnAbility = function( self, sim, unit )
		end,
	}

return customKanimAbility