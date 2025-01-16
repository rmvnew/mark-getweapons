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
    local permission = "perm.administrador"
    
    if vRP.hasPermission(user_id, permission) then
        print("Permissão concedida")
        TriggerClientEvent("weapons:openNUI", source)
    else
        print("Permissão negada")
        TriggerClientEvent("weapons:closeNUI", source)
        TriggerClientEvent("Notify", source, "negado", "Você não tem permissão para acessar este recurso", 10)
    end
end)
