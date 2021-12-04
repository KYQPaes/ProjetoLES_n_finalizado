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
 
    int id = Integer.parseInt(request.getParameter("id"));
    CompraDAO compradata = new CompraDAO(Conexao.getConnection());
    List<Compra> compra = compradata.selectcompra(id);
    request.setAttribute("COMPRA_LIST", compra);
    
    
   
   Compra Altcompra = compradata.SelectSingleCompra(id);
   request.setAttribute("editCompra", Altcompra);
    


%>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>


    <title>Detalhes Pedido</title>
    <link rel="stylesheet" href="styles/adm.css"/>
        <script src="js/validators/details.js"></script>
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
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_clientes.jsp">Consulta Clientes</a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/cuponsadm.jsp">Cupom</a>
              <a  id="estoque" href="http://localhost:8080/deus-1.0-SNAPSHOT/estoque.jsp">Estoque</a>
              
               
            </div>
        
        
                <div id="meio">
            <div class="meiomenor">
                
                <h2>Pesquisa</h2>

                        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for ID..." title="Type in a name">
            
            <div>
               
                <table>
                   

                    <tr>
                        <h2>Detalhes do Pedido</h2>
                        <td>
                            
                            
                                <table id="tabela">
                                    <tr>
                                      <th>Codigo da Compra</th>
                                      <th>Previsao de Entrega</th>
                                      <th>Status</th>
                                      <th>Forma de Pagamento</th>
                                      <th>Endereço</th>
                                      <th>Valor</th>
                                      
                                    </tr>
                                    <c:forEach var="tempCompra" items="${COMPRA_LIST}">
                                    <tr>
                                      <td>${tempCompra.id}</td>
                                      <td>${tempCompra.data}</td>
                                      <td>${tempCompra.status}</td>
                                      <td>${tempCompra.metodo}</td>
                                      <td>${tempCompra.endereco}</td>
                                      <td></td>
                                      <td>
                                      
                                    
                                    <form class="form" action="ControleEditCompra" method="POST">            
                                                
                                        <c:choose>
                                        <c:when test="${tempCompra.status == 'EM PROCESSAMENTO' || tempCompra.status == 'PAGAMENTO REALIZADO' || tempCompra.status == 'EM TRANSPORTE' || tempCompra.status == 'ENTREGA REALIZADA'}">
                                                    
                                          
                                                    
                                                <label for="status">Defina um Status:</label>

                                            <select name="status" value="${tempCompra.status}" id="status">
                                              <option value="EM PROCESSAMENTO">EM PROCESSAMENTO</option>
                                              <option value="PAGAMENTO REALIZADO">PAGAMENTO REALIZADO</option>
                                              <option value="EM TRANSPORTE">EM TRANSPORTE</option>
                                              <option value="ENTREGA REALIZADA">ENTREGA REALIZADA</option>                                              
                                            </select>
                                           
                                              <br><br>
                                            <button type="submit" id="save" class="final">Salvar</button>
                                            
                                            <input type="hidden" value="${tempCompra.id}" name="id">

                                                  
                                          
                                            <br />
                                            
                                        </c:when>
                                            
                                            
                                        <c:when test="${tempCompra.status == 'TROCA AUTORIZADA' || tempCompra.status == 'TROCA SOLICITADA' || tempCompra.status == 'TROCA REJEITADA' || tempCompra.status == 'TROCA ACEITA' || tempCompra.status == 'TROCA EFETUADA'}">
                                                 
                                           
                                                    
                                                <label for="status">Defina um Status:</label>

                                            <select name="status" value="${tempCompra.status}" id="status">
                                              <option value="TROCA SOLICITADA">TROCA SOLICITADA</option>
                                              <option value="TROCA AUTORIZADA">TROCA AUTORIZADA</option>
                                              <option value="TROCA REJEITADA">TROCA REJEITADA</option>
                                              <option value="TROCA ACEITA">TROCA ACEITA</option>
                                              <option value="TROCA EFETUADA">TROCA EFETUADA</option>
                                            </select>
                                           
                                              <br><br>
                                            <button type="submit" id="save" class="final">Salvar</button>
                                            
                                            <input type="hidden" value="${tempCompra.id}" name="id">

                                                  
                                      
                                            <br />
                                            
                                            
                                        </c:when>
                                            
                                        
                                           
                                        <c:when test="${tempCompra.status == 'CANCELAMENTO SOLICITADO' || tempCompra.status == 'CANCELAMENTO REJEITADO' || tempCompra.status == 'CANCELAMENTO ACEITO' || tempCompra.status == 'CANCELAMENTO EFETUADO'}">
                                                    
                                                    
                                        
                                            <label for="status">Defina um Status:</label>

                                            <select name="status" value="${tempCompra.status}" id="status">
                                              
                                              <option value="CANCELAMENTO SOLICITADO">CANCELAMENTO SOLICITADO</option>
                                              <option value="CANCELAMENTO REJEITADO">CANCELAMENTO REJEITADO</option>
                                              <option value="CANCELAMENTO ACEITO">CANCELAMENTO ACEITO</option>
                                              <option value="CANCELAMENTO EFETUADO">CANCELAMENTO EFETUADO</option>
                                            </select>
                                           
                                              <br><br>
                                            <button type="submit" id="save" class="final">Salvar</button>
                                            
                                            <input type="hidden" value="${tempCompra.id}" name="id">

                                                 
                                            <br />
                                        </c:when>
                                                    
                                        </c:choose>
                                            
                                        </form>                                               
                                          </div>

                                        </div>

                                    
                                          
                                      </td>

                                    </tr>
                                      
                                                                        
                                 </c:forEach>
                            
                                </table>
                            <br>
                            
                                                                       
                            
                            </td>
                      
                        </tr>
                    
                    </table>
                
                
                <script>
                            function myFunction() {
                              // Declare variables
                              var input, filter, table, tr, td, i, txtValue;
                              input = document.getElementById("myInput");
                              filter = input.value.toUpperCase();
                              table = document.getElementById("tabela");
                              tr = table.getElementsByTagName("tr");

                              // Loop through all table rows, and hide those who don't match the search query
                              for (i = 0; i < tr.length; i++) {
                                td = tr[i].getElementsByTagName("td")[0];
                                if (td) {
                                  txtValue = td.textContent || td.innerText;
                                  if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                    tr[i].style.display = "";
                                  } else {
                                    tr[i].style.display = "none";
                                  }
                                }
                              }
                            }
                            
             
                            </script>
                </div>

          
              
               
                
            </div>
               
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