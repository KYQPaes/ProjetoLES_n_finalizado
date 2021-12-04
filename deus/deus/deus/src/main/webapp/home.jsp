<%@page import="Classes.Cliente"%>

<?xml version="1.0" encoding="UTF-8"?>



<%
    Cliente cliente = (Cliente) session.getAttribute("loguser");
    if(cliente==null){
        response.sendRedirect("home-page.xhtml");
    }
    
%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>
    <title>Hotline Wallet</title>
    <link rel="stylesheet" href="styles/home-style.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .mySlides {display:none;}
    </style>
</h:head>

<h:body>

    <header>
        <div id="header-box">
            <div id='search-box'>
                
            </div>
            <div class="logo">
                
                
                <a href="http://localhost:8080/deus-1.0-SNAPSHOT/home-page.xhtml" draggable="false">  
                <img src="images/logo/hotline.png" width="250" height="250" draggable="false" ></img> 
                </a>
                
                
            </div>

        </div>
        <div id="icones">

            <div>
                <h2>Seja bem-vindo <%= cliente.getNome() %></h2>
            </div>

            <div class="boxhead">
    
                 
                 <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/cupons.jsp" draggable="false">  
                <img src="images/icon/cupom.png" id="cupom" width="40" height="40" draggable="false" ></img> 
                </a>
                          
                <a class="otherPage" href="ControleLogout" draggable="false">  
                <img src="images/icon/logout.png" width="40" height="40" draggable="false" ></img> 
                </a>
    

                
                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/clientes.jsp" draggable="false">  
                <img src="images/icon/setting.png" id="account" width="40" height="40" draggable="false" ></img> 
                </a>

                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/carrinho.jsp" draggable="false">  
                <img src="images/icon/cart.png" width="40" height="40" draggable="false" ></img> 
                </a>


                <br> <br> <br> <br>
    
                            
                <p/>
       
            </div>
        </div>
    </header>



    <div id="all">


        
           
               

            <div class="topnav">
                <input type="text" id="search" size="30" placeholder="Pesquise Aqui...">
              <a  id="masculino" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Masculino</a>
              <a  id="feminino" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=feminino">Feminino</a>
              <a  id="personalizada" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Personalizadas</a>
              <a id="carbono"  href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-carbono.xhtml">Carbono</a>
              <a id="documento" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-documento.xhtml">Documento</a>
              <a  >   |  </a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_produto.jsp" style="color: darkblue">Meus Pedidos</a>
            </div>



        
        <div id="meio" style="background-image: url('images/backgrounds/muro.jpg');">
                    
            <div class="galeria">
                <h1>Carteiras Personalizadas</h1>
                <p:galleria effect="slide" effectDuration="1000">
                    <p:graphicImage value="images/carteiras/personalizadas/modelo1-1.jpg" title="Carteira Rick and Morty" alt="image1 desc" />
                    <p:graphicImage value="images/carteiras/personalizadas/modelo1-2.jpg" title="Carteira Rick and Morty" alt=" image2 desc" />
                    <p:graphicImage value="images/carteiras/personalizadas/modelo2-1.jpg" title="Carteira Pokemon" alt=" image3 desc" />
                    <p:graphicImage value="images/carteiras/personalizadas/modelo2-2.jpg" title="Carteira Pokemon" alt=" image4 desc" />
                    <p:graphicImage value="images/carteiras/personalizadas/modelo3-1.jpg" title="Carteira Orgulho" alt="image1 desc" />
                    <p:graphicImage value="images/carteiras/personalizadas/modelo3-2.jpg" title="Carteira Orgulho" alt=" image2 desc" />
                    <p:graphicImage value="images/carteiras/personalizadas/modelo4-1.jpg" title="Carteira Snoopy" alt=" image3 desc" />
                    <p:graphicImage value="images/carteiras/personalizadas/modelo4-2.jpg" title="Carteira Snoopy" alt=" image4 desc" />
                    
                </p:galleria>

                <br /><br />
                <form class="form" action="http://localhost:8080/deus-1.0-SNAPSHOT/compra-personalizada.xhtml">
                    <div class="card">
                        <div class="w3-content w3-display-container">
                            <img src="images/carteiras/personalizadas/modelo1-1.jpg" class="mySlides" width="440" height="440" draggable="false"/> 
                            <img src="images/carteiras/personalizadas/modelo2-1.jpg" class="mySlides" width="440" height="440" draggable="false"/> 
                            <img src="images/carteiras/personalizadas/modelo3-1.jpg" class="mySlides" width="440" height="440" draggable="false"/> 
                            <img src="images/carteiras/personalizadas/modelo4-1.jpg" class="mySlides" width="440" height="440" draggable="false"/> 

                            <script>
                                var slideIndex = 0;
                                carousel();

                                function carousel() {
                                    var i;
                                    var x = document.getElementsByClassName("mySlides");
                                    for (i = 0; i < x.length; i++) {
                                        x[i].style.display = "none";
                                    }
                                    slideIndex++;
                                    if (slideIndex > x.length) {slideIndex = 1}
                                    x[slideIndex-1].style.display = "block";
                                    setTimeout(carousel, 2000); // Change image every 2 seconds
                                }
                            </script>
                        </div>
                      
                    </div>
                   
                </form>
                <a href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-personalizada.xhtml" class="Veja">Veja Mais</a>

            </div>
            <div class="card">
                
            </div>
        </div>
        <div id="foot">

            <div id="rodape">
                <article>
                    
                    
                    <p><font size="5">Ajuda</font></p>
                    <br /> 

                    <div id="fonte">

                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color:black">
                            <u>Termos e condicoes de Uso</u>
                        </a> 
                        
                        <br /> <br />
                        
                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;">
                            <u>Politicas de troca</u>
                        </a> 
    
    
                        <br /><br />
                        
                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;">
                            <u>Politicas de privacidade</u>
                        </a> 
                    </div>


                </article>
                
                <article>

                    <p><font size="5">Contato</font></p>
                    <br /> 

                   
                    <font size="3" face="Arial"> Email: Atendimento@Hotline.com </font> <br />

                    <br /> <br />
              
                    <font size="3" face="Arial"> Telefone : (11) 3548-5434 </font> <br />


                    <br /><br />
        
                    <font size="3" face="Arial"> Disponivel segunda a sexta-feira, das 09:00 as 18:00 horas </font> <br />


                </article>

                <article id="social">

                    

                    <p><font size="5">Social</font></p>
                    
                    <font size="3" face="Arial"> Nos encontre em: </font> <br />

                    <br /> <br />
                    <div id="logos">
                        
                    <br /><br />
                    <a href="https://www.instagram.com" draggable="false">  
                    <img src="images/icon/instagram.png" width="50" height="50" draggable="false" ></img> 
                    </a>
                    

                    <br /><br />
                    <a href="https://twitter.com" draggable="false">  
                    <img src="images/icon/twitter.png" width="50" height="50" draggable="false" ></img> 
                    </a>
                 

                    
                    <br /><br />
                    <a href="https://facebook.com" draggable="false">  
                    <img src="images/icon/facebook.png" width="50" height="50" draggable="false" ></img> 
                    </a>

                    <a href="https://youtube.com" draggable="false">  
                    <img src="images/icon/youtube.png" width="55" height="50" draggable="false" ></img> 
                    </a>
                    </div>


                </article>
            </div>
        </div>
    </div>


 
</h:body>

</html>