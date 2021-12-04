<%@page import="java.util.Date"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Endereco"%>
<%@page import="DAO.EnderecoDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Classes.Cartao"%>
<%@page import="java.util.List"%>
<%@page import="conexao.Conexao"%>
<%@page import="DAO.CartaoDAO"%>
<?xml version="1.0" encoding="UTF-8"?>
<%
    Cliente cliente = (Cliente) session.getAttribute("loguser");
    if (cliente == null) {
        response.sendRedirect("home-page.xhtml");
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
      xmlns:p="http://primefaces.org/ui">


    <h:head>


        <title>Cadastro de cartao</title>
        <link rel="stylesheet" href="styles/clientes-style.css"/>
        <script src="js/validators/cartao.js"></script>
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
                
            </div>

                <div class="boxhead">
    
                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/cupons.jsp" draggable="false">  
                <img src="images/icon/cupom.png" width="40" height="40" draggable="false" ></img> 
                </a>

                          
                <a class="otherPage" href="ControleLogout" draggable="false">  
                <img src="images/icon/logout.png" width="40" height="40" draggable="false" ></img> 
                </a>
    

                
                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/clientes.jsp" draggable="false">  
                <img src="images/icon/setting.png" width="40" height="40" draggable="false" ></img> 
                </a>

                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/carrinho.jsp" draggable="false">  
                <img src="images/icon/cart.png" width="40" height="40" draggable="false" ></img> 
                </a>

                
                <br> <br> <br> <br>
    
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
              <a  id="documento" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-documento.xhtml">Documento</a>
              <a  >   |  </a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_produto.jsp" style="color: darkblue">Meus Pedidos</a>
              
               
            </div>


            <div id="meio">
                <div class="meiomenor">
                    <center>
                        <div class="cadastro">
                            <form class="form" action="ControleCard_compra" method="POST">
                                <table class="tabela">
                                    <tr>
                                        <th colspan="2">
                                            <h2>Cadastro de Cartao</h2>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            Numero do Cartao:
                                        </td>
                                        <td>
                                            Nome no Cartao:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" id="cardnumber" name="NumCard"></input>
                                        </td>
                                        <td>
                                            <input type="text" id="cardname" name="NameCard"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Validade:
                                        </td>
                                        <td>
                                            CVV:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="date" id="validade" name="validade"></input>
                                        </td>
                                        <td>
                                            <input type="password" id="cvv" name="cvv"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            CPF
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" id="cpf" name="cpf"></input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <center>
                                                <input type="submit" id="save" value="Cadastrar" onclick=" return validate()" class="apply"/>
                                            </center>
                                        </td>
                                    </tr>
                                </table>
                                <input type="hidden" value="<%= cliente.getId() %>" name="id">
                            </form>
                        </div>
                    </center>
                </div>
            </div>


            <div id="foot">

                <div id="rodape">
                    <article>

                        <p><font size="5">Ajuda</font></p>

                        <br /> 


                        <div id="fonte">

                            <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;" >
                                Termos e condicoes de Uso
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

                        <i class="pi pi-envelope pi-rounded" style="font-size: 1rem "></i>
                        <font size="3" face="Arial"> Email: Atendimento@Hotline.com </font> <br />

                        <br /> <br />
                        <i class="pi pi-phone pi-rounded" style="font-size: 1rem"></i>
                        <font size="3" face="Arial"> Telefone : (11) 3548-5434 </font> <br />


                        <br /><br />
                        <i class="pi pi-clock pi-rounded" style="font-size: 1rem"></i>
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
