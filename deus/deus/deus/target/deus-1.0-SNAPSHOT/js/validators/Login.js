function validate(){
    var username = document.getElementById("mail").value;
    var password = document.getElementById("password").value;
    
    if ( username === "admin" && password === "admin"){
        
       window.location.href ="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_clientes.jsp" ; // Redirecting to other page.
       return true
    }

    if (!username || !password || username == "" || password == ""){
        alert("Todos campos precisam ser preenchidos");
        
        return true;
    }
  
        
    return false;



}


function validateADM(){
    var login = document.getElementById("login").value;
    var senha = document.getElementById("senha").value;
    
    if ( login !== "admin" && senha !== "admin"){
        alert("Dados Invalidos");
       
       return false
    }

    if (login === "" || senha === ""){
        alert("Todos campos precisam ser preenchidos");
        
        return false;
    }
    
    if (login == "admin" || senha == "admin"){
        
        window.location.href ="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_clientes.jsp";
        
        return false;
    }
  
        
    



}
