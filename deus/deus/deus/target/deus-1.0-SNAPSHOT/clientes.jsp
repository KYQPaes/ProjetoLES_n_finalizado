<%@page import="Classes.Compra"%>
<%@page import="DAO.CompraDAO"%>
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
    if(cliente==null){
        response.sendRedirect("home-page.xhtml");
    }
    
    CartaoDAO cartaodata = new CartaoDAO(Conexao.getConnection());
    List<Cartao> cartao = cartaodata.selectCartao(cliente.getId());
    request.setAttribute("CARTAO_LIST", cartao);
    
    EnderecoDAO enderecodata = new EnderecoDAO(Conexao.getConnection());
    List<Endereco> endereco = enderecodata.selectEndereco(cliente.getId());
    request.setAttribute("ENDERECO_LIST", endereco);
    

    CompraDAO compradata = new CompraDAO(Conexao.getConnection());
    List<Compra> compra = compradata.selectcompra(cliente.getId());
    request.setAttribute("COMPRA_LIST", compra);

%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>


    <title>Clientes</title>
    <link rel="stylesheet" href="styles/clientes-style.css"/>
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
                    <form class="form" action="ControleEditCliente" method="POST">
                        <table class="tabela">
                            <tr>
                                <th colspan="2">
                                    <h2>Dados de Cadastro de <%= cliente.getNome()%></h2>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    Nome:
                                </td>
                                <td>
                                    Sobrenome:
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="nome" value="<%= cliente.getNome()%>"/>
                                </td>
                                <td>
                                    <input type="text" name="sobrenome" value="<%= cliente.getSobrenome()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Data Nascimento:
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <% 
                                    Date nasc = new Date();
                                    if(cliente.getData_nasc()!=null){
                                    %>
                                    <input type="date" name="data" value="<%=cliente.getData_nasc()%>"/>
                                    <%
                                        }else{
                                    %>
                                    <input type="date" name="data" value="2020-12-31"/>
                                    <%
                                        }
                                    %>
                                </td>
                            </tr>
                            <tr>
                                <td class="trenviar">
                    <input type="submit" value="Aplicar" class="apply"/>
                                </td>
                                <td>
                                   
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" value="<%=cliente.getId()%>" name="id"/>
                        </form>
                    </div>
                </center>
            </div>
            <div>
                <table>

                    <tr>
                        <td>
                            <p><font size="5">Pedidos</font></p>
                                <table id="tabela">
                                    <tr>
                                      <th>ID da compra</th>
                                      <th>Data de Compra</th>
                                      <th>Status</th>
                                      <th>Forma de Pagamento</th>
                                      <th>Endere�o</th>
                                      <th>Valor</th>
                                      
                                    </tr>
                                    <c:forEach var="tempCompra" items="${COMPRA_LIST}">
                                    <tr>
                                      <td>${tempCompra.id}</td>
                                      <td>${tempCompra.data}</td>
                                      <td>${tempCompra.status}</td>
                                      <td>${tempCompra.metodo}</td>
                                      <td>${tempCompra.endereco}</td>
                                      <td>${tempCompra.valor}</td>
                                      <td>
                                          <a href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_produto.jsp?id=${tempCompra.id}" draggable="false">  
                                            <img src="images/icon/view.png" id="view" width="20" height="20" draggable="false" ></img>
                                      </td>

                                    </tr>
                                 </c:forEach>
                                </table>
                        </td>
                    </tr>

                    
                    <tr>
                        <td>
                            <p><font size="5">Cartoes</font></p>
                                <table id="tabela">
                                    <tr>
                                        <th>Numero do cartao</th>
                                        <th>Validade</th>
                                        <th>Preferencial</th>
                                        <th>Editar</th>
                                        <th>Excluir</th>
                                        
                                      </tr>
                                    <c:forEach var="tempCartao" items="${CARTAO_LIST}">
                                        <tr>
                                        
                                            <td>${tempCartao.numero}</td>
                                            <td>${tempCartao.validade}</td>
                                            <td><input type="radio" name="fav" value="1" checked="checked"/></td>
                                            <td>
                                                <a href="cartao_editar.jsp?id=${tempCartao.id}" draggable="false">  
                                                    <img src="images/icon/pencil.png" id="editcard" width="20" height="20" draggable="false" ></img> 
                                                </a>
                                               </td>
                                            <td>
                                                <a href="ControleDeleteCartao?id=${tempCartao.id}" draggable="false">  
                                                    <img src="images/icon/trash.png" width="20" height="20" draggable="false" ></img>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    
                                    
                                </table>
                            
                                <a href="cartao.jsp" draggable="false">  
                                <img src="images/icon/add.png" id="addcard" width="40" height="40" draggable="false" ></img> 
                                </a>

                                
                                <p />
                                <div class="card-group">

                                </div>
                        </td>
                    </tr>
                    

                    <tr>
                        <td>
                                <p><font size="5">Enderecos</font></p>
                                <table id="tabela">
                                    <tr>
                                      <th>Apelido</th>
                                      <th>Endereco</th>
                                      <th>Preferencial</th>
                                      <th>Editar</th>
                                      <th>Excluir</th>
                                    </tr>
                                    
                                    <c:forEach var="tempEndereco" items="${ENDERECO_LIST}">
                                        <tr>
                                            <td>${tempEndereco.apelido}</td>
                                            <td>${tempEndereco.endereco}</td>
                                            <td><input type="radio" name="cont" value="1" checked="checked"/></td>
                                            <td>
                                                <a href="endereco_editar.jsp?id=${tempEndereco.id}" draggable="false"> 
                                                <img src="images/icon/pencil.png" id="editend" width="20" height="20" draggable="false" ></img> 
                                                </a>
                                            </td>
                                            <td>
                                                <a href="ControleDeleteEndereco?id=${tempEndereco.id}" draggable="false"/>  
                                                <img src="images/icon/trash.png" width="20" height="20" draggable="false" ></img>
                                            </td>
                                          </tr>
                                    </c:forEach>
                                    
                                   
                                    
                                </table>
                            
                                <a href="endereco.jsp" draggable="false">  
                                <img src="images/icon/add.png" id="addend" width="40" height="40" draggable="false" ></img> 
                                </a>
                            
                                                        
                                <p />

                        </td>
                    </tr>

                    <tr>
                        <td>
                    <input type="submit" value="Alterar Senha" id="altpass" class="pass" onclick="location.href='senha-editar.jsp';"/>
                                
                            
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        
        
        <div id="foot">

            <div id="rodape">
                <article>

                    <p><font size="5">Ajuda</font></p>

                    <br /> 


                    <div id="fonte">

                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;" >
                            Termos e condicoes de uso
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