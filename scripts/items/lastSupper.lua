---@class TrinketType
---@field TRINKET_LAST_SUPPER integer
TrinketType.TRINKET_LAST_SUPPER = Isaac.GetTrinketIdByName("Last Supper")

--function Nesco:onUpdate(player)
--    if Game():GetFrameCount() == 1 then
--    end
--end

--Nesco:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, Nesco.onUpdate)

function Nesco:evaluateCache(player, flag)
    if flag == CacheFlag.CACHE_DAMAGE and player:HasTrinket(TrinketType.TRINKET_LAST_SUPPER) then
        local character = player:GetPlayerType()
        if character == PlayerType.PLAYER_JUDAS --Damage up only apllies if the player is playing as Judas
        or character == PlayerType.PLAYER_BLACKJUDAS--or variations of Judas
        or character == PlayerType.PLAYER_JUDAS_B--and the tainted version of Judas
        then
            player.Damage = player.Damage + 0.5
        end
        --TODO: prevent food items from spawning
    end
end

Nesco:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Nesco.evaluateCache)