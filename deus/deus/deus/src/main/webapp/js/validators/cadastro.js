function validate(){
    var mail = document.getElementById("mail").value;
    var mailconfirm = document.getElementById("mail_confirmation").value;
    var pass = document.getElementById("pass").value;
    var passconfirm = document.getElementById("pass_confirmation").value;
    var name = document.getElementById("name").value;
    var surname = document.getElementById("surname").value;
    

    
    if ( mail == "" || mailconfirm == "" || pass == "" || passconfirm == "" || name == "" || surname == ""){
        alert ("Campos Vazios");
        return false;
    }else if(mailconfirm != mail){
        alert ("Emails diferentes");
        return false;
    }else if(pass != passconfirm){
        alert ("Senha diferentes");
        return false;
    }else if(document.querySelector('#box:checked') == null){
        alert ("Precisa aceitar os termos de uso");
        return false;
    }
    alert("Cadastro Realizado com Sucesso");
    return true;
}