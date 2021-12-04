function gennerateCode(input, prefix){
    const r = (Math.random() + 1).toString(36).substring(7);
    input.value = prefix + r.toLocaleUpperCase();
}

function genneratefrete(desc, prefix){
   
    desc.value = prefix;
}


function generateFrete(){
    const input = document.getElementById("code");
    const desc = document.getElementById("desc");
    
    
    
    gennerateCode(input, 'FRETE-');
    
    genneratefrete(desc, 'FRETE GRATIS');
    
    
}

function generatetroca(){
    const input = document.getElementById("code");
    const desc = document.getElementById("desc");
    
   
    
    gennerateCode(input, 'TROCA-');
    
    genneratefrete(desc, 'CUPOM DE TROCA');
}

function generate10(){
    const input = document.getElementById("code");
    const desc = document.getElementById("desc");
    
  
    
    gennerateCode(input, '10MENOS-');
    
    genneratefrete(desc, '10% DE DESCONTO');
}


