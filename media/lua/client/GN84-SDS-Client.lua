-- #########################################################################################################
-- #########################################################################################################
-- ##                                                                                                     ##
-- ##                                                                                                     ##
-- ##       _____   _                              _   _                       _                  _       ##
-- ##      / ____| (_)                            | \ | |                     (_)                | |      ##
-- ##      | |  __   _   ____  _ __ ___     ___   |  \| |   ___    _ __ ___    _    ___    __ _  | |      ##
-- ##      | | |_ | | | |_  / | '_ ` _ \   / _ \  | . ` |  / _ \  | '_ ` _ \  | |  / __|  / _` | | |      ##
-- ##      | |__| | | |  / /  | | | | | | | (_) | | |\  | | (_) | | | | | | | | | | (__  | (_| | | |      ##
-- ##      \_____ | |_| /___| |_| |_| |_|  \___/  |_| \_|  \___/  |_| |_| |_| |_|  \___|  \__,_| |_|      ##
-- ##                                                                                                     ##
-- ##                               Copyright © GizmoNomical - 2025                                       ##
-- ##                                             GN84-SDS                                                ##
-- ##                                        Synced Death Sounds                                          ##
-- #########################################################################################################
-- #########################################################################################################

if not isClient() then return end


local player = nil ---@type IsoPlayer

----------------------------------------------------
-- Play Sound at Zombie Location
----------------------------------------------------


local function playSoundAtObject(_obj)

    if _obj == nil then return end

    _obj:playSound("HeadStab")
    _obj:playSound("HeadSmash")        

end


----------------------------------------------------
-- Sync Zombie Death Sounds
----------------------------------------------------

local function SyncZombieDeathSound(zombie)

    if zombie == nil then return end

    if player == nil then        
        player = getPlayer()
	end
    
    local lastAttacker = zombie:getAttackedBy()

    if lastAttacker == nil then return end
        
    if player == lastAttacker then                
        playSoundAtObject(zombie) 
    end

end

Events.OnZombieDead.Add(SyncZombieDeathSound)