local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","weapons")
src = {}
Tunnel.bindInterface("weapons",src)
vSERVER = Tunnel.getInterface("weapons")

RegisterCommand('getarmas', function()
    print("Comando /getarmas acionado!")
    print("Enviando TriggerServerEvent 'weapons:checkPermission'...") -- Log antes
    TriggerServerEvent("weapons:checkPermission")
    print("TriggerServerEvent 'weapons:checkPermission' enviado.") -- Log depois
end)

RegisterNetEvent("weapons:openNUI")
AddEventHandler("weapons:openNUI", function()
    SendNUIMessage({hasPermission = 'open'})
end)

RegisterNetEvent("weapons:closeNUI")
AddEventHandler("weapons:closeNUI", function()
    SendNUIMessage({hasPermission = 'closed'})
end)