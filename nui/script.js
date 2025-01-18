

// abre a NUI depois de verificar permissao no server
$(document).ready(()=>{
    
    window.addEventListener('message',(event)=>{
        
    let current_weapon_painel_container = document.getElementById('container')
    const data = event.data
    
    if(data.hasPermission === 'open'){
        current_weapon_painel_container.style.display = 'block'
    }else{
        current_weapon_painel_container.style.display = 'none'
    }
    
    
})

})

// fechar com ESC
$(document).keyup((event)=>{
    if(event.key === 'Escape'){

        clear()
        fetch(`https://weapons/closeCurrentNUI`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify('ok')
        }).then(() => {
            console.log("Mensagem enviada ao client.lua");
        }).catch((error) => {
            console.error("Erro ao enviar para o cliente:", error);
        });

    }
})

// pegar uma arma
function getWeapon(){

    const weapon_name = document.getElementById("selected_weapon").value

    let config = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({weapon_name})
    }
    fetch(`https://${GetParentResourceName()}/getWeapon`, config)

}

// pegar todas armas
function getAllWeapons(){

    let config = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify('')
    }
    fetch(`https://${GetParentResourceName()}/getAllWeapons`, config)

}


// remover todas armas
function remAllWeapons(){

    let config = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify('')
    }
    fetch(`https://${GetParentResourceName()}/remAllWeapons`, config)

}

function clear(){

    const input = document.getElementById("selected_weapon")
    input.value = ''


}


// mostra armas na tabela

$(document).ready(()=>{

    const weaponsWithNames = {
        "WEAPON_SNSPISTOL_MK2": "Pistola SNS MK2",
        "WEAPON_PISTOL_MK2": "Pistola MK2",
        "WEAPON_FIREWORK": "Lançador de Fogos",
        "WEAPON_GUSENBERG": "Submetralhadora Thompson",
        "WEAPON_PISTOL50": "Desert Eagle",
        "WEAPON_COMBATPISTOL": "Glock",
        "WEAPON_COMBATPDW": "PDW de Combate",
        "WEAPON_MACHINEPISTOL": "Tec-9",
        "WEAPON_SMG_MK2": "SMG MK2",
        "WEAPON_SMG": "SMG",
        "WEAPON_ASSAULTSMG": "MTAR",
        "WEAPON_SAWNOFFSHOTGUN": "Shotgun de Cano Serrado",
        "WEAPON_PUMPSHOTGUN_MK2": "Pump Shotgun MK2",
        "WEAPON_ASSAULTRIFLE": "AK-47",
        "WEAPON_ASSAULTRIFLE_MK2": "AK-47 MK2",
        "WEAPON_HEAVYSNIPER": "Sniper Pesado",
        "WEAPON_SPECIALCARBINE_MK2": "Carabina Especial MK2",
        "WEAPON_DOUBLEACTION": "Revolver Double Action",
        "WEAPON_CARBINERIFLE": "Carabina M4",
        "WEAPON_CARBINERIFLE_MK2": "Carabina M4 MK2",
        "WEAPON_SPECIALCARBINE": "Carabina Especial",
        "WEAPON_STUNGUN": "Taser",
        "WEAPON_APPISTOL": "Pistola Automática",
        "WEAPON_ADVANCEDRIFLE": "Fuzil Avançado",
        "WEAPON_RAYCARBINE": "Carabina Alienígena",
        "WEAPON_BULLPUPSHOTGUN": "Bullpup Shotgun",
        "WEAPON_DBSHOTGUN": "Shotgun de Cano Duplo",
        "WEAPON_COMBATSHOTGUN": "Shotgun de Combate",
        "WEAPON_RAYMINIGUN": "Minigun Alienígena",
        "WEAPON_RPG": "Lança-Foguetes",
        "WEAPON_HOMINGLAUNCHER": "Lança-Mísseis Teleguiados",
        "WEAPON_COMPACTLAUNCHER": "Lançador Compacto",
        "WEAPON_RAILGUN": "Railgun"
    };
    
        const tableBody = document.querySelector('#weapons-table tbody')
    
        let id = 1
    
        for(const [key,value] of Object.entries(weaponsWithNames)){
            const row = document.createElement('tr')
    
            const idCell = document.createElement('td')
            idCell.textContent = id
    
            const keyCell = document.createElement('td')
            keyCell.textContent = key
    
            const valueCell = document.createElement('td')
            valueCell.textContent = value
    
            row.appendChild(idCell)
            row.appendChild(keyCell)
            row.appendChild(valueCell)
    
            tableBody.appendChild(row)
            id++
        }
    

})

document.addEventListener("DOMContentLoaded",()=>{
    const table = document.getElementById("weapons-table")
    const input = document.getElementById("selected_weapon")

    table.addEventListener("click",(event)=>{
        const row = event.target.closest("tr")
        if(row && row.querySelector("td")){
            const weaponName = row.children[1].textContent
            input.value = weaponName

            document.querySelectorAll('table tbody tr').forEach(tr => tr.classList.remove('selected'))

            row.classList.add('selected')
        }
    })
})