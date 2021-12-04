<%@page import="DAO.ClienteDAO"%>
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
       
    ClienteDAO clientedata = new ClienteDAO(Conexao.getConnection());
    List<Cliente> cliente = clientedata.selectCliente();
    request.setAttribute("CLIENTE_LIST", cliente);
    

%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>


    <title>Consulta Clientes</title>
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
    
                 

                          
                <a class="otherPage" href="ControleLogout" draggable="false">  
                <img src="images/icon/logout.png" width="40" height="40" draggable="false" ></img> 
                </a>
    

                
                 <br> <br> <br> <br>
    

         
            </div>

        </div>
    </header>



    <div id="all">


              <div class="topnav">
                <input type="text" id="search" size="30" placeholder="Pesquise Aqui...">
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_clientes.jsp">Consulta Clientes</a>
              <a  id="cupom" href="http://localhost:8080/deus-1.0-SNAPSHOT/cuponsadm.jsp">Cupom</a>
              <a  id="graficos" href="http://localhost:8080/deus-1.0-SNAPSHOT/grafico_adm.jsp?data1=2021-10-01&data2=2021-10-31">Graficos</a>
              <a  id="estoque" href="http://localhost:8080/deus-1.0-SNAPSHOT/estoque.jsp">Estoque</a>
        
              
               
            </div>
        
        
        <div id="meio">
            
            <div class="meiomenor">
                
                
                
                <center>
                    
                    <h2>Pesquisa</h2>
                    <input type="text" id="myInput3" onkeyup="myFunction()" placeholder="Search for ID..." title="Type in a name">
                    
                    <div class="cadastro">
                        
                    <form class="form" action="ControleCliente" method="POST">
                        
                        <table class="tabela">
                            <tr>
                                <th colspan="2">
                                    <h2>Consulta de Clientes</h2>
                                    
                                    
                                </th>
                            </tr>
                            
                            
                                <table id="tabela">
                                    <tr>
                                      <th>ID</th>
                                      <th>Email</th>
                                      <th>Nome</th>
                                      <th>Sobrenome</th>
                                      <th>Pedidos</th>
                                 
                                      
                                    </tr>
                                    
                                    <c:forEach var="tempCliente" items="${CLIENTE_LIST}">
                                        <tr>
                                            <td>${tempCliente.id}</td>
                                            <td>${tempCliente.email}</td>
                                            <td>${tempCliente.nome}</td>
                                            <td>${tempCliente.sobrenome}</td>
                                            <td>
                                                <a href="http://localhost:8080/deus-1.0-SNAPSHOT/adm.jsp?id=${tempCliente.id}" draggable="false">  
                                                    <img src="images/icon/view.png" id="view" width="20" height="20" draggable="false" ></img></a>
                                            </td>
                                          </tr>
                                    </c:forEach>
                                    
                                   
                                    
                                </table>
                            
                            
  
                            
                            
                            <tr>
                                <td class="trenviar">
                                    
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                        </form>
                    </div>
                </center>
            </div>
            
        </div>
        
        <script>
                            function myFunction() {
                              // Declare variables
                              var input, filter, table, tr, td, i, txtValue;
                              input = document.getElementById("myInput3");
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