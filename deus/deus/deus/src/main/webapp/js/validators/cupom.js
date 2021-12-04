function validatecupom(){
    var codigo = document.getElementById("code").value;
    var descricao = document.getElementById("desc").value;
    var validade = document.getElementById("validadeCupom").value;
    
           
    
     if ( codigo == "" || descricao == "" || validade == "" ){
        alert ("Campos Vazios");
        return false;
        
    }
    
       
    alert ("Cupom Cadastrado com sucesso");
    
    return true
}




    