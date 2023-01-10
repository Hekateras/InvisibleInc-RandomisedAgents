local util = include( "modules/util" )
local simdefs = include("sim/simdefs")
local array = include( "modules/array" )

local function init( modApi )
	log:write("inside the Randomised Agents mod")
	local dataPath = modApi:getDataPath()
    local scriptPath = modApi:getScriptPath()
	
	modApi:addGenerationOption("randomised_agents", "Random" , "Random desc", {noUpdate = true} )
	-- modApi:addGenerationOption("suppressPopups", "SUPPRESS POPUPS" , "Suppesses certain popups and FX, such as daemon install, teleport, and alarm level change.", {noUpdate = true})
	-- modApi:addGenerationOption("suppressAnimations", "SUPPRESS AGENT ANIMATIONS" , "Auto-skips most agent animations on player turn, such as walking, peeking, and toggling doors. May result in odd visuals.", {noUpdate = true})
	
	KLEIResourceMgr.MountPackage( dataPath .. "/anims.kwad", "data" )
	
end

local function load( modApi, options, params )
	local dataPath = modApi:getDataPath()
    local scriptPath = modApi:getScriptPath()
	
	if params then
		if options["randomised_agents"].enabled then
			params.randomised_agents = true
		end
	end
	
	local agentdefs = include( scriptPath .. "/agentdefs" )
	for name, agentDef in pairs(agentdefs) do
		modApi:addAgentDef( name, agentDef )
	end
	
	local animdefs = include( scriptPath .. "/animdefs" )
	for name, animDef in pairs(animdefs) do
		modApi:addAnimDef( name, animDef )
	end
	
	modApi:addAbilityDef( "customKanimAbility", scriptPath .."/customKanimAbility" )
	
	local serverdefs = include( "modules/serverdefs" )
	if array.find( serverdefs.SELECTABLE_AGENTS, "randomAgent1" ) == nil then
		table.insert( serverdefs.SELECTABLE_AGENTS, "randomAgent1" )
	end
	serverdefs.LOADOUTS[ "randomAgent1" ] = { "randomAgent1","randomAgent1" 	}

end
 
local function unload()
	isEnabled = false
end
   
return {
    init = init,
    load = load,
	unload = unload,
}