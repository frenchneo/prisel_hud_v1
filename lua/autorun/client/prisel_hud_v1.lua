--==========================================================================================================//

--									  Prisel HUD V1					                                        //

--==========================================================================================================//

--===================================================================//

--				Disable Default HUD & Enable HungerMod	     		 //

--===================================================================//

local defaultDissableHud = {

    ["CHudHealth"] = true,

    ["CHudBattery"] = true,

    ["DarkRP_Hungermod"] = true,

    ["DarkRP_HUD"] = true,

    ["DarkRP_LocalPlayerHUD"] = true,

    ["CHudSecondaryAmmo"] = true,

    ["CHudAmmo"] = true

}

hook.Add("HUDShouldDraw", "DefautHUD", function(name)

    if defaultDissableHud[name] then return false end

end)



--===================================================================//

--							Prisel Front 					     	 //

--===================================================================//

surface.CreateFont("PriselFront", {

    font = "Roboto",

    extended = false,

    size = 16,

    weight = 500,

    blursize = 0,

    scanlines = 0,

    antialias = true

})



surface.CreateFont("PriselFront2", {

    font = "Roboto",

    extended = false,

    size = 24,

    weight = 500,

    blursize = 0,

    scanlines = 0,

    antialias = true

})



surface.CreateFont("PriselFront3", {

    font = "Roboto",

    extended = false,

    size = 44,

    weight = 500,

    blursize = 0,

    scanlines = 0,

    antialias = true

})



surface.CreateFont("PriselFront4", {

    font = "Roboto",

    extended = false,

    size = 18,

    weight = 500,

    blursize = 0,

    scanlines = 0,

    antialias = true

})



surface.CreateFont("PriselFront7", {

    font = "Roboto",

    extended = false,

    size = 24,

    weight = 500,

    blursize = 0,

    scanlines = 0,

    antialias = true

})



surface.CreateFont("PriselFront8", {

    font = "Roboto",

    extended = false,

    size = 14,

    weight = 500,

    blursize = 0,

    scanlines = 0,

    antialias = true

})



--===================================================================//

--							Blur Config 							 //

--===================================================================//

local blur = Material("pp/blurscreen")



local function drawBlur(x, y, w, h, layers, density, alpha)

    surface.SetDrawColor(255, 255, 255, alpha)

    surface.SetMaterial(blur)



    for i = 1, layers do

        blur:SetFloat("$blur", (i / layers) * density)

        blur:Recompute()

        render.UpdateScreenEffectTexture()

        render.SetScissorRect(x, y, x + w, y + h, true)

        surface.DrawTexturedRect(0, 0, ScrW(), ScrH())

        render.SetScissorRect(0, 0, 0, 0, false)

    end

end



--===================================================================//

--							Format Number    						 //

--===================================================================//

function formatNumberPrisel(n)

    if not n then return "" end

    if n >= 1e14 then return tostring(n) end

    n = tostring(n)

    local sep = sep or "."

    local dp = string.find(n, "%.") or #n + 1



    for i = dp - 4, 1, -3 do

        n = n:sub(1, i) .. sep .. n:sub(i + 1)

    end



    return n

end



--===================================================================//

--				          RectOutline Config 						 //

--===================================================================//

local function drawRectOutline(x, y, w, h, color)

    surface.SetDrawColor(color)

    surface.DrawOutlinedRect(x, y, w, h)

end



--===================================================================//

--							Materials Config						 //

--===================================================================//

local RedCross = Material("materials/prisel/hud/redcross.png")



hook.Add("HUDPaint", "PriselHUD", function()

    --===================================================================//

    --					     	Base HUD         						 //

    --===================================================================//

    if not IsValid(LocalPlayer()) then return end

    draw.RoundedBox(0, 40, ScrH() - 145, 80, 76, Color(30, 30, 30, 240))

    draw.RoundedBox(0, 40, ScrH() - 50, 200, 30, Color(30, 30, 30, 240))

    draw.RoundedBox(0, 40, ScrH() - 50, math.Clamp(LocalPlayer():Health() * 2, 0, 100 * 2), 20, Color(120, 22, 22, 240))

    draw.RoundedBox(0, 40, ScrH() - 30, LocalPlayer():getDarkRPVar(("Energy") or 0) * 2, 5, Color(200, 170, 0, 240))

    draw.RoundedBox(0, 40, ScrH() - 25, math.Clamp(LocalPlayer():Armor() * 2, 0, 200), 5, Color(20, 55, 120, 240))

    draw.WordBox(2, 122, ScrH() - 133, "   " .. LocalPlayer():GetName() .. "  ", "PriselFront", Color(30, 30, 30, 240), Color(255, 255, 255, 255))

    draw.WordBox(2, 122, ScrH() - 111, "   " .. formatNumberPrisel(LocalPlayer():getDarkRPVar("money")) .. " €  ", "PriselFront", Color(30, 30, 30, 240), Color(255, 255, 255, 255))

    draw.WordBox(2, 122, ScrH() - 89, "   " .. LocalPlayer():getDarkRPVar("job") .. " |  " .. LocalPlayer():getDarkRPVar("salary") .. " €" .. "  ", "PriselFront", Color(30, 30, 30, 240), Color(255, 255, 255, 255))

    draw.SimpleText(LocalPlayer():Health(), "PriselFront", 60, ScrH() - 49, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)

    surface.SetDrawColor(255, 255, 255, 200)

    surface.SetMaterial(RedCross)

    surface.DrawTexturedRect(42, ScrH() - 47, 14, 14)

    --===================================================================//

    --							Clock and Date		    				 //

    --===================================================================//

    draw.WordBox(4, ScrW() - 165, 20, os.date("%H:%M:%S - %d/%m/%Y"), "PriselFront", Color(30, 30, 30, 240), Color(255, 255, 255, 255))



    --===================================================================//

    --							    Agenda  		    				 //

    --===================================================================//

    if LocalPlayer():getAgendaTable() then

        agenda = LocalPlayer():getAgendaTable()

        agendaText = DarkRP.textWrap((LocalPlayer():getDarkRPVar("agenda") or ""):gsub("//", "\n"):gsub("\\n", "\n"), "DarkRPHUD1", 295)

        local countLine = 1



        for _ in string.gmatch(agendaText, "\n") do

            countLine = countLine + 1

        end



        draw.RoundedBox(0, 40, 20, 300, 30 + 17 * countLine, Color(30, 30, 30, 200))

        draw.RoundedBox(0, 40, 20, 300, 25, Color(40, 40, 40, 220))

        draw.SimpleText(agenda["Title"], "PriselFront", 190, 22, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)

        draw.DrawNonParsedText(agendaText, "PriselFront", 194 - (285 / 2), 48, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)

    end



    --===================================================================//

    --							    Munition   		    				 //

    --===================================================================//

    local wep, total, clip, ArmedName

    ply = LocalPlayer()

    if not IsValid(ply:GetActiveWeapon()) then return end

    wep = ply:GetActiveWeapon()

    total = ply:GetAmmoCount(wep:GetPrimaryAmmoType()) or ply:GetAmmoCount(wep:GetSecondaryAmmoType()) or ply:GetAmmoCount(wep:Ammo1())

    clip = wep:Clip1()

    ArmedName = wep:GetPrintName()

    if clip < 0 or wep:GetClass() == "weapon_physcannon" then return end

    draw.RoundedBox(0, ScrW() - 190, ScrH() - 70, 150, 50, Color(30, 30, 30, 240))

    draw.SimpleText(ArmedName, "PriselFront4", ScrW() - 40, ScrH() - 90, Color(255, 255, 255), TEXT_ALIGN_RIGHT)

    draw.SimpleText(clip, "PriselFront3", ScrW() - 110, ScrH() - 68, Color(255, 255, 255), TEXT_ALIGN_RIGHT)

    draw.SimpleText("/" .. total, "PriselFront2", ScrW() - 105, ScrH() - 60, Color(255, 255, 255), TEXT_ALIGN_LEFT)

end)



--===================================================================//

--							Player Model		    				 //

--===================================================================//

hook.Add("InitPostEntity", "PriselPlayerModel", function()

    local PriselPM = vgui.Create("DModelPanel")

    PriselPM:SetPos(42, ScrH() - 145)

    PriselPM:SetSize(80, 75)

    PriselPM:SetModel(LocalPlayer():GetModel())

    PriselPM.LayoutEntity = function() return false end

    PriselPM:SetFOV(50)

    PriselPM:SetCamPos(Vector(25, -10, 64))

    PriselPM:SetLookAt(Vector(0, 0, 62))

    PriselPM.Entity:SetEyeTarget(Vector(200, 200, 100))



    timer.Create("updateHUDModel", 1, 0, function()

        PriselPM:SetPos(42, ScrH() - 145)

        PriselPM:SetSize(80, 75)

        PriselPM:SetModel(LocalPlayer():GetModel())

        PriselPM.Entity:SetColor(LocalPlayer():GetColor())

    end)

end)



hook.Add("PreGamemodeLoaded", "disable_playervoicechat_base", function()

    hook.Remove("InitPostEntity", "CreateVoiceVGUI")

end)



local PlayerVoiceList = {}



hook.Add("PlayerStartVoice", "StartVoice", function(ply)

    PlayerVoiceList[ply] = true

end)



hook.Add("PlayerEndVoice", "EndVoice", function(ply)

    PlayerVoiceList[ply] = nil

end)



--===================================================================//

--							Config HUD Head 						 //

--===================================================================//

local plyMeta = FindMetaTable("Player")



plyMeta.drawPlayerInfo = function(self)

    local pos = self:EyePos()

    pos.z = pos.z + 10

    pos = pos:ToScreen()



    if not self:getDarkRPVar("wanted") then

        pos.y = pos.y - 50

    end



    --===================================================================//

    --							Name HUD Head							 //

    --===================================================================//

    if GAMEMODE.Config.showname then

        local nick = self:Nick()

        local job = self:getDarkRPVar("job")

        draw.DrawNonParsedText(nick , "PriselFront2", pos.x + 10, pos.y + 30, Color(0, 0, 0, 150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.DrawNonParsedText(nick  , "PriselFront2", pos.x + 10, pos.y + 30, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    end

end
