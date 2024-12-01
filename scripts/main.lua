--[[
No Teleport Mod for Farming Simulator 25

Author: André Buchman & VertexDezign
Website: https://vertexdezign.net/
Issues: https://github.com/VertexDezign/NoTeleport/issues

Feel free to open a pull reuests for enhancements or bugfixes.

FS25_NoTeleport © 2024 by André Buchmann & VertexDezign is licensed under CC BY-NC-ND 4.0. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/
]]
NoTeleport = {}
NoTeleport.name = "NoTeleport"

-- Return false to disable overwritten function
function NoTeleport:disableFunction()
    return false
end

function NoTeleport:loadMapFinished()
    g_currentMission.isToggleVehicleAllowed = false
end

function initNoTeleport()
    PlaceableHotspot.getBeVisited = Utils.overwrittenFunction(PlaceableHotspot.getBeVisited, NoTeleport.disableFunction)
    NPCHotspot.getBeVisited = Utils.overwrittenFunction(NPCHotspot.getBeVisited, NoTeleport.disableFunction)
    FerryHotspot.getBeVisited = Utils.overwrittenFunction(FerryHotspot.getBeVisited, NoTeleport.disableFunction)
    Enterable.getIsEnterableFromMenu = Utils.overwrittenFunction(Enterable.getIsEnterableFromMenu, NoTeleport.disableFunction)
    FSBaseMission.loadMapFinished = Utils.appendedFunction(FSBaseMission.loadMapFinished, NoTeleport.loadMapFinished)

    -- Disable teleport to fields the "Holzhammer" way
    Player.teleportTo = Utils.overwrittenFunction(Player.teleportTo, NoTeleport.disableFunction)
    Player.teleportToNPC = Utils.overwrittenFunction(Player.teleportToNPC, NoTeleport.disableFunction)
end

-- Load as early as possible to override the "Enterable" methods
initNoTeleport()
