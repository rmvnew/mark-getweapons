local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","weapons")
src = {}
Tunnel.bindInterface("weapons",src)
vSERVER = Tunnel.getInterface("weapons")

-- chama a função para ver se tem permissao no servidor
RegisterCommand('getarmas', function()
    print("Comando /getarmas acionado!")
    print("Enviando TriggerServerEvent 'weapons:checkPermission'...") -- Log antes
    TriggerServerEvent("weapons:checkPermission")
    print("TriggerServerEvent 'weapons:checkPermission' enviado.") -- Log depois
end)

-- abre a NUI se tem permissao
RegisterNetEvent("weapons:openNUI")
AddEventHandler("weapons:openNUI", function()
    SendNUIMessage({hasPermission = 'open'})
    SetNuiFocus(true, true)
end)

-- fecha se não tem permissao
RegisterNetEvent("weapons:closeNUI")
AddEventHandler("weapons:closeNUI", function()
    SetNuiFocus(false,false)
    SendNUIMessage({hasPermission = 'closed'})
end)

-- fecha com ESC
RegisterNUICallback("closeCurrentNUI",function(data,cb)
    SetNuiFocus(false,false)
    SendNUIMessage({hasPermission = 'closed'})
    if cb then cb('ok') end
end)

-- Emite o sinal de sucesso
RegisterNetEvent("weapons:alertSuccess")
AddEventHandler("weapons:alertSuccess",function(source)

    PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

end)


RegisterNUICallback("getWeapon",function(data,cb)

    local weaponName = json.encode(data)
   
    TriggerServerEvent("weapons:getCurrentWeapon",weaponName)

end)

-- pegando todas armas
RegisterNUICallback("getAllWeapons",function()

    TriggerServerEvent("weapons:getAllWeapons")

end)

-- removendo todas armas
RegisterNUICallback("remAllWeapons",function()

    TriggerServerEvent("weapons:remAllWeapons")

end)

-- iniciando envio de armas para player
RegisterNUICallback("sendWeapon",function(data)

    local current_data = json.encode(data)
    
    TriggerServerEvent("weapons:sendWeapon",current_data)
    
end)

-- enviando arma para player
RegisterNetEvent("weapons:sendWeaponResponse",function(current_data)

    local data = json.decode(current_data)
    local weaponHash = GetHashKey(data.current_weapon)

    if weaponHash then 
    
        GiveWeaponToPed(data.player_id, weaponHash, 250, true, true)
        TriggerEvent("Notify", "sucesso", "Você recebeu a arma: " .. data.current_weapon)
    else    
        TriggerEvent("Notify", "negado", "Arma inválida!")
    end
    

end)

RegisterNUICallback("failNotify",function(message)

    

    TriggerEvent("Notify","negado",message)

end)