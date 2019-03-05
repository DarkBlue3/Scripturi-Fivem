----Admin Chat------
---Comunitatea Remix---
---Made by Dark Blue---
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

groups = {
	"superamdin",
	"admin",
	--- aici puneti ce grade aveti voi de admini

}

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

RegisterCommand('a', function(source, args, rawCommand)
	if(args[1] == nil)then
		TriggerClientEvent('chatMessage', source, "^3SYNTAXA: /"..rawCommand.." [Mesaj]") 
	else
		local user_id = vRP.getUserId({source})
		theGroup = ""
		for i, v in pairs(groups) do
			if vRP.hasGroup({user_id,tostring(v)}) then
				theGroup = tostring(v)
			end
		end
		local aMembers = vRP.getUsersByGroup({tostring(theGroup)})
		for i, v in ipairs(aMembers) do
			local player = vRP.getUserSource({tonumber(v)})
			TriggerClientEvent('chatMessage', player, "^5["..firstToUpper(theGroup).."] ^7| " .. GetPlayerName(source) .. ": " ..  rawCommand:sub(3))
		end
	end
end)