<?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>


    <title>Login Administrador</title>
    <link rel="stylesheet" href="styles/login-style.css"/>
    <script src="js/validators/Login.js"></script>

</h:head>

<h:body style="background-color: black">

    

    <header>
        <div id="header-box">
           
        </div>
    </header>



    <div id="all">


        


        <div id="meio">

            
                <div class="card">
                    <div class="card-top">
                        <img src="images/logo/hotline.png" width="250" height="250" draggable="false" ></img>
                        <h2 class="title">Administrador</h2>
                      
                    </div>
    
                    <div class="card-group">
                        <label>Login:</label>
                        <input type="text" name="email" placeholder="Digite seu email" id="login"></input>
                    </div>
    
                    <div class="card-group">
                        <label>Acesso:</label>
                        <input type="password" name="senha" placeholder="Digite sua senha" id="senha"></input>
                    </div>
    
                    <div class="card-group">
                        
                        
                    
                    </div>
                    
                    
                            
                    <input type="submit" class="log" value="Acesso" id="log" onclick="validateADM()"/>
                    
                    
                    
                    
       
                </div>    
    
    
       
            
            
            

           
        </div>
        <div id="foot">

            
        </div>
    </div>


 
</h:body>

</html>