<?xml version="1.0" encoding="UTF-8"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="conexao.Conexao"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="Classes.Produto"%>
<%@page import="java.util.List"%>

<%
    
    String tipo = request.getParameter("tipo");
    ProdutoDAO produtodata = new ProdutoDAO(Conexao.getConnection());
    List<Produto> produto = produtodata.selectProduto(tipo);
    request.setAttribute("PRODUTO_LIST", produto);
%>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>


    <title>Carteiras Hotline Wallet</title>
    <link rel="stylesheet" href="styles/compra-style.css"/>

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
                <img src="images/icon/cart.png" width="40" height="40" draggable="false" ></img> 
                </a>


                <br/> <br/> <br/> <br/>
               
    
         
            </div>
        </div>
    </header>



    <div id="all">


        <div class="topnav">
                <input type="text" id="search" size="30" placeholder="Pesquise Aqui..."/>
              <a  id="masculino" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Masculino</a>
              <a  id="feminino" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=feminino">Feminino</a>
              <a  id="personalizada" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Personalizadas</a>
              <a id="carbono"  href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-carbono.xhtml">Carbono</a>
              <a  id="documento" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-documento.xhtml">Documento</a>
              <a  >   |  </a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_produto.jsp" style="color: darkblue">Meus Pedidos</a>
              
               
        </div>
        
        
        <div id="meio" style="background-image: url('images/backgrounds/muro.jpg');">
            <div id="produtos">
             
                <h1></h1>
                <article>
                    <c:forEach var="tempProduto" items="${PRODUTO_LIST}">
                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/modelo.jsp?id=${tempProduto.id}" draggable="false">  
                            <img src="${tempProduto.imagem}" width="200" height="200" draggable="false"/>
                        </a>
                        <br/>
                    </c:forEach>
                </article>
                <table class="tabela">
                    <c:forEach var="tempProduto" items="${PRODUTO_LIST}">
                        <tr>
                            <th colspan="2">
                                <h2>${tempProduto.nome}</h2>
                                <font size="5"  line-height="2.2" face="Arial" style="color: green"> R$${tempProduto.preco} </font> <br />
                                <form class="form" action="">
                                    <div class="card">
                                        <div class="card-group">
                                            <a id="veja_mais" href="http://localhost:8080/deus-1.0-SNAPSHOT/modelo.jsp?id=${tempProduto.id}" draggable="false">
                                                Veja Mais
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
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
    </div>


 
</h:body>

</html>