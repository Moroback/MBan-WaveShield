ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function isWhitelisted(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerGroup = xPlayer.getGroup()

    if Config.WhitelistedGroups[playerGroup] then
        return true
    end
    return false
end

function _U(key, ...)
    local locale = Config.Locale
    if Config.Messages[locale] and Config.Messages[locale][key] then
        return string.format(Config.Messages[locale][key], ...)
    end
    return "Message non trouvé"
end

function canBan(source, targetId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    local sourceGroup = xPlayer.getGroup()
    local targetGroup = targetPlayer.getGroup()

    if Config.WhitelistedGroups[sourceGroup] and Config.WhitelistedGroups[targetGroup] then
        return Config.WhitelistedGroups[sourceGroup] < Config.WhitelistedGroups[targetGroup]
    end
    return false
end

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/ban', _U('bvan_description'), 
        { 
            { name = "ID", help = _U('bvan_id_help') }, 
            { name = "raison", help = _U('bvan_reason_help') } 
        })
end)

RegisterCommand('ban', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not isWhitelisted(source) then
        TriggerClientEvent('esx:showNotification', source, _U('no_permission'))
        return
    end

    local targetId = tonumber(args[1])
    if targetId == nil then
        TriggerClientEvent('esx:showNotification', source, _U('invalid_id'))
        return
    end

    if not canBan(source, targetId) then
        TriggerClientEvent('esx:showNotification', source, _U('cannot_ban_higher'))
        return
    end

    local reason = table.concat(args, " ", 2)
    if reason == "" then
        reason = "Pas de raison spécifiée"
    end

    ExecuteCommand(string.format('waveshield ban %d %s', targetId, reason))

    TriggerClientEvent('esx:showNotification', source, _U('ban_success', targetId, reason))
end, false)