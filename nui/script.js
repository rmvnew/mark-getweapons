
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

$(document).keyup((event)=>{
    if(event.key === 'Escape'){

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


function registerWeapon(){

    const weapon_name = document.getElementById('weapon_name').value



    let config = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({weapon_name})
    }
    fetch(`https://${GetParentResourceName()}/testecallback`, config)

}


