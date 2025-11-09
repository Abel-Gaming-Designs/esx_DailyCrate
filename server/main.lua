--- ESX RELATED ---
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand(Config.CreateCommand, function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getGroup() == 'admin' then
        --- Generate the amount
        local crateAmount = Config.Rewards[math.random(#Config.Rewards)]

        --- Generate the location
        local crateLocation = Config.SpawnPoints[math.random(#Config.SpawnPoints)]

        --- Create the pickup
        ESX.CreatePickup('item_account', Config.RewardAccount, crateAmount, 'Daily Crate ($' .. crateAmount .. ')', source)

        --- Show notifications
        xPlayer.showNotification('The crate for $' .. crateAmount .. ' has been spawned!')
    else
        --- Show error
        xPlayer.showNotification('[ERROR] You are not an admin!')
    end
end, false)