local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("weapons", src)
Proxy.addInterface("weapons", src)
vCLIENT = Tunnel.getInterface("weapons")

-- Registra o evento para poder recebê-lo via TriggerServerEvent
RegisterNetEvent("weapons:checkPermission")
AddEventHandler("weapons:checkPermission", function()
    print("Evento 'weapons:checkPermission' recebido no servidor!")

    local source = source
    local user_id = vRP.getUserId(source)
    local permission = "admin.permissao"
    
    -- se tem permissao
    if vRP.hasPermission(user_id, permission) then
        print("Permissão concedida")
        TriggerClientEvent("weapons:openNUI", source)
    else
        print("Permissão negada")
        TriggerClientEvent("weapons:closeNUI", source)
        TriggerClientEvent("Notify", source, "negado", "Você não tem permissão para acessar este recurso", 10)
    end
end)

-- pegar uma arma especifica
RegisterNetEvent("weapons:getCurrentWeapon")
AddEventHandler("weapons:getCurrentWeapon",function(weaponName)

    local source = source
    local user_id = vRP.getUserId(source)
    local permission = "admin.permissao"
    local name = json.decode(weaponName)

    if vRP.hasPermission(user_id, permission) then 
    
        vRPclient.giveWeapons(source,{[name.weapon_name]={ammo = 250}},true)
        TriggerClientEvent("Notify",source,"sucesso","Arma equipada com sucesso!") 
    else
        TriggerClientEvent("Notify",source,"negado","Arma não pode ser equipada!") 
    end

end)

RegisterNetEvent("weapons:getAllWeapons")
AddEventHandler("weapons:getAllWeapons",function()

    local source = source
    getAllWeapons(source)

end)

RegisterNetEvent("weapons:remAllWeapons")
AddEventHandler("weapons:remAllWeapons",function()

    local source = source
    remAllWeapons(source)

end)



-- comando para adm pegar todas as armas na mão
RegisterCommand("getallarmas",function(source)
 
    getAllWeapons(source)
    
end)

-- remove todas armas da mão do adm
RegisterCommand("noarmas",function(source)

   remAllWeapons(source)

end)



function getAllWeapons(source)

    local user_id = vRP.getUserId(source)
    local permission = "admin.permissao"
    if vRP.hasPermission(user_id,permission) then 
    
        vRPclient.giveWeapons(source, {
            ["WEAPON_MINIGUN"] = {ammo = 250},
            ["WEAPON_COMBATPDW"] = {ammo = 250},
            ["WEAPON_SPECIALCARBINE"] = {ammo = 250},
            ["WEAPON_PISTOL_MK2"] = {ammo = 250},
            ["WEAPON_STUNGUN"] = {ammo = 1},
            ["WEAPON_FLASHLIGHT"] = {ammo = 1},
            ["WEAPON_NIGHTSTICK"] = {ammo = 1},
            ["WEAPON_KNIFE"] = {ammo = 1},
            ["WEAPON_KNUCKLE"] = {ammo = 1},
            ["WEAPON_HAMMER"] = {ammo = 1},
            ["WEAPON_BAT"] = {ammo = 1},
            ["WEAPON_GOLFCLUB"] = {ammo = 1},
            ["WEAPON_CROWBAR"] = {ammo = 1},
            ["WEAPON_BOTTLE"] = {ammo = 1},
            ["WEAPON_DAGGER"] = {ammo = 1},
            ["WEAPON_HATCHET"] = {ammo = 1},
            ["WEAPON_MACHETE"] = {ammo = 1},
            ["WEAPON_SWITCHBLADE"] = {ammo = 1},
            ["WEAPON_POOLCUE"] = {ammo = 1},
            ["WEAPON_PIPEWRENCH"] = {ammo = 1},
            ["WEAPON_BATTLEAXE"] = {ammo = 1},
            ["WEAPON_STONE_HATCHET"] = {ammo = 1},
            ["WEAPON_PISTOL"] = {ammo = 250},
            ["WEAPON_COMBATPISTOL"] = {ammo = 250},
            ["WEAPON_APPISTOL"] = {ammo = 250},
            ["WEAPON_PISTOL50"] = {ammo = 250},
            ["WEAPON_SNSPISTOL"] = {ammo = 250},
            ["WEAPON_SNSPISTOL_MK2"] = {ammo = 250},
            ["WEAPON_HEAVYPISTOL"] = {ammo = 250},
            ["WEAPON_VINTAGEPISTOL"] = {ammo = 250},
            ["WEAPON_MARKSMANPISTOL"] = {ammo = 250},
            ["WEAPON_REVOLVER"] = {ammo = 250},
            ["WEAPON_REVOLVER_MK2"] = {ammo = 250},
            ["WEAPON_DOUBLEACTION"] = {ammo = 250},
            ["WEAPON_CERAMICPISTOL"] = {ammo = 250},
            ["WEAPON_NAVYREVOLVER"] = {ammo = 250},
            ["WEAPON_MICROSMG"] = {ammo = 250},
            ["WEAPON_MINISMG"] = {ammo = 250},
            ["WEAPON_SMG"] = {ammo = 250},
            ["WEAPON_SMG_MK2"] = {ammo = 250},
            ["WEAPON_ASSAULTSMG"] = {ammo = 250},
            ["WEAPON_GUSENBERG"] = {ammo = 250},
            ["WEAPON_MACHINEPISTOL"] = {ammo = 250},
            ["WEAPON_MG"] = {ammo = 250},
            ["WEAPON_COMBATMG"] = {ammo = 250},
            ["WEAPON_COMBATMG_MK2"] = {ammo = 250},
            ["WEAPON_RAYCARBINE"] = {ammo = 250},
            ["WEAPON_ASSAULTRIFLE"] = {ammo = 250},
            ["WEAPON_ASSAULTRIFLE_MK2"] = {ammo = 250},
            ["WEAPON_CARBINERIFLE"] = {ammo = 250},
            ["WEAPON_CARBINERIFLE_MK2"] = {ammo = 250},
            ["WEAPON_ADVANCEDRIFLE"] = {ammo = 250},
            ["WEAPON_SPECIALCARBINE_MK2"] = {ammo = 250},
            ["WEAPON_BULLPUPRIFLE"] = {ammo = 250},
            ["WEAPON_BULLPUPRIFLE_MK2"] = {ammo = 250},
            ["WEAPON_COMPACTRIFLE"] = {ammo = 250},
            ["WEAPON_MILITARYRIFLE"] = {ammo = 250},
            ["WEAPON_HEAVYSNIPER"] = {ammo = 30},
            ["WEAPON_HEAVYSNIPER_MK2"] = {ammo = 30},
            ["WEAPON_MARKSMANRIFLE"] = {ammo = 60},
            ["WEAPON_MARKSMANRIFLE_MK2"] = {ammo = 60},
            ["WEAPON_PUMPSHOTGUN"] = {ammo = 40},
            ["WEAPON_PUMPSHOTGUN_MK2"] = {ammo = 40},
            ["WEAPON_SAWNOFFSHOTGUN"] = {ammo = 40},
            ["WEAPON_BULLPUPSHOTGUN"] = {ammo = 40},
            ["WEAPON_ASSAULTSHOTGUN"] = {ammo = 40},
            ["WEAPON_MUSKET"] = {ammo = 40},
            ["WEAPON_HEAVYSHOTGUN"] = {ammo = 40},
            ["WEAPON_DBSHOTGUN"] = {ammo = 40},
            ["WEAPON_AUTOSHOTGUN"] = {ammo = 40},
            ["WEAPON_COMBATSHOTGUN"] = {ammo = 40},
            ["WEAPON_GRENADE"] = {ammo = 10},
            ["WEAPON_STICKYBOMB"] = {ammo = 10},
            ["WEAPON_PROXMINE"] = {ammo = 10},
            ["WEAPON_PIPEBOMB"] = {ammo = 10},
            ["WEAPON_BZGAS"] = {ammo = 10},
            ["WEAPON_SMOKEGRENADE"] = {ammo = 10},
            ["WEAPON_MOLOTOV"] = {ammo = 10},
            ["WEAPON_FIREEXTINGUISHER"] = {ammo = 10},
            ["WEAPON_PETROLCAN"] = {ammo = 4500},
            ["WEAPON_HAZARDCAN"] = {ammo = 4500},
            ["WEAPON_FLARE"] = {ammo = 10},
            ["WEAPON_RPG"] = {ammo = 5},
            ["WEAPON_GRENADELAUNCHER"] = {ammo = 10},
            ["WEAPON_GRENADELAUNCHER_SMOKE"] = {ammo = 10},
            ["WEAPON_MINIGUN"] = {ammo = 250},
            ["WEAPON_FIREWORK"] = {ammo = 20},
            ["WEAPON_RAILGUN"] = {ammo = 20},
            ["WEAPON_HOMINGLAUNCHER"] = {ammo = 10},
            ["WEAPON_COMPACTLAUNCHER"] = {ammo = 10},
            ["WEAPON_RAYMINIGUN"] = {ammo = 250},
            ["GADGET_PARACHUTE"] = {ammo = 1}
        }, true)


        TriggerClientEvent("Notify",source,"sucesso","Armas carregadas com sucesso!",7)
        TriggerClientEvent("weapons:alertSuccess",source)
        
    else
        TriggerClientEvent("Notify", source, "negado", "Você não tem permissão para acessar este recurso", 10)
    end



end


function remAllWeapons(source)

    local user_id = vRP.getUserId(source)
    local permission = "admin.permissao"    

    if vRP.hasPermission(user_id,permission) then 
        
        vRPclient.giveWeapons(source, {}, true)
        TriggerClientEvent("Notify",source,"sucesso","Armas removidas com sucesso!",7)
        TriggerClientEvent("weapons:alertSuccess",source)
    else
        TriggerClientEvent("Notify", source, "negado", "Você não tem permissão para acessar este recurso", 10)
    end

end