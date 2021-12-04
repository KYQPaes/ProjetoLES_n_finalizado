<?xml version="1.0" encoding="UTF-8"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="conexao.Conexao"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="Classes.Produto"%>
<%@page import="java.util.List"%>

<%  
    int id = Integer.parseInt(request.getParameter("id"));
    ProdutoDAO produtodata = new ProdutoDAO(Conexao.getConnection());
    Produto produto = produtodata.SelectSingleProduto(id);
    request.setAttribute("PRODUTO", produto);
%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">
<h:head>


    <title>Modelo Carteira</title>
    <link rel="stylesheet" href="styles/modelo1-style.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <script src="js/indicator_slide.js"></script>
    <script src="js/validators/cart.js"></script>
    <script src="js/validators/cep.js"></script>
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

            <div class="ui-input-icon-left p-mr-2">
                   
                    
            </div>

            <div class="boxhead">
                
                
                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/cupons.jsp" draggable="false">  
                <img src="images/icon/cupom.png" width="40" height="40" draggable="false" ></img> 
                </a>
                 

                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/login.xhtml" draggable="false">  
                <img src="images/icon/login.png" width="40" height="40" draggable="false" ></img> 
                </a>

                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/carrinho.jsp" draggable="false">  
                <img src="images/icon/cart.png" id="cart" width="40" height="40" draggable="false" ></img> 
                </a>


                <br/> <br/> <br/> <br/>
               
    
         
            </div>
        </div>
    </header>



    <div id="all">


        <div class="topnav">
                        <input type="text" id="search" size="30" placeholder="Pesquise Aqui..."/>
                      <a  id="masculino"href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Masculino</a>
                      <a  id="feminino"href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=feminino">Feminino</a>
                      <a  id="personalizada" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Personalizadas</a>
                      <a  id="carbono"href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-carbono.xhtml">Carbono</a>
                      <a  id="documento" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-documento.xhtml">Documento</a>
              <a  >   |  </a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_produto.jsp" style="color: darkblue">Meus Pedidos</a>


                </div>
        
        
        <div id="meio">

            <div id="foto">

                
                
                <div class="w3-content" style="max-width:320px; max-height: 320px;">
                    <img class="mySlides" src="${PRODUTO.imagem}" style="width:320px;height: 320px;"/>
                    <img class="mySlides" src="${PRODUTO.imagem2}" style="width:320px;height: 320px;display:none"/>
                    <img class="mySlides" src="${PRODUTO.imagem3}" style="width:320px;height: 320px;display:none"/>

                    <div class="w3-row-padding w3-section">
                        <div class="w3-col s4">
                            <img class="demo w3-opacity w3-hover-opacity-off" src="${PRODUTO.imagem}" style="width:80px;cursor:pointer" onclick="currentDiv(1)"/>
                        </div>
                        <div class="w3-col s4">
                            <img class="demo w3-opacity w3-hover-opacity-off" src="${PRODUTO.imagem2}" style="width:80px;cursor:pointer" onclick="currentDiv(2)"/>
                        </div>
                        <div class="w3-col s4">
                            <img class="demo w3-opacity w3-hover-opacity-off" src="${PRODUTO.imagem3}" style="width:80px;cursor:pointer" onclick="currentDiv(3)"/>
                        </div>
                    </div>
                </div>
            </div>


            <div id="desc">
                
                <table class="tabela">
                    <tr>
                        <th colspan="2">
                            <h2>Carteiras ${PRODUTO.tipo}</h2>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <font size="5"  line-height="2.2" face="Arial"> Carteira ${PRODUTO.nome} ${PRODUTO.tipo}</font> <br />
                            
                        </td>
                        <td>
                          
                        </td>
                        
                    </tr>
                    
                    

                    <tr>
                         <td>
                            <font size="8"  line-height="2.2" face="Arial" style="color: green"> R$${PRODUTO.preco}</font> <br />
                        </td>
                    </tr>



                    <tr>
                        
                        <td>

                            <div id="compra">
                                <a href="http://localhost:8080/deus-1.0-SNAPSHOT/carrinho.jsp" onclick="return addCartItems('${PRODUTO.id}','${PRODUTO.imagem}', '${PRODUTO.nome}', '${PRODUTO.preco}', 1)" id="buy" class="comprar">Comprar</a>
                                <a onclick="return addCartItems('${PRODUTO.id}','${PRODUTO.imagem}', '${PRODUTO.nome}', '${PRODUTO.preco}', 1)" id="addcart" class="comprar">Adicionar ao Carrinho</a>
                        
                                
                            </div>

                        </td>

                        
                        
                    </tr>

                    <tr>
                        
                        <td>

                            ${PRODUTO.descricao}

                        </td>

                        
                    </tr>



                    <tr>

                        <td>
                            <h4>Compre Utilizando:</h4>
    
                            <img src="images/icon/card.png" width="25" height="25" draggable="false" ></img> 
                            Cartao de credito
                            <br />

                            <img src="images/icon/money.png" width="25" height="25" draggable="false" ></img> 
                            Boleto
                            <br />

                                
                        </td>

                    </tr>


              




                </table>

               

            </div>
            

        </div>
    </div>

          
               
        
                
                
         
    
        
        
        <div id="foot">

            <div id="rodape">
                <article id="texto">

                    <p><font size="5">Ajuda</font></p>

                    <br /> 

                    <div id="fonte">

                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;" >
                            Termos e condições de Uso
                        </a> 
                        
                        <br /> <br />
                        
                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;">
                            Politicas de troca
                        </a> 
    
    
                        <br /><br />
                        
                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;">
                            Politicas de privacidade
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

                    <font size="3" face="Arial"> Disponivel segunda à sexta-feira, das 09:00 às 18:00 horas </font> <br />


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
    


 
</h:body>

</html>