ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function isWhitelisted(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerGroup = xPlayer.getGroup()

    for _, group in pairs(Config.WhitelistedGroups) do
        if playerGroup == group then
            return true
        end
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

    local reason = table.concat(args, " ", 2)
    if reason == "" then
        reason = "Pas de raison spécifiée"
    end

    ExecuteCommand(string.format('waveshield ban %d %s', targetId, reason))

    TriggerClientEvent('esx:showNotification', source, _U('ban_success', targetId, reason))
end, false)
