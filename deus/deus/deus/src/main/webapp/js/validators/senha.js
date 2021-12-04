function validate(){
    var old_pass = document.getElementById("old_pass").value;
    var new_pass = document.getElementById("new_pass").value;
    var new_pass_confirm = document.getElementById("new_pass_confirm").value
    
    if ( old_pass == "" || new_pass == "" || new_pass_confirm == ""){
        alert ("Campos Vazios");
        return false;
    }else if(new_pass!=new_pass_confirm){
        alert ("Nova senha e sua confirmacao estao diferentes");
        return false;
    }
    alert ("senha alterada com sucesso");
   
    return true;
}
