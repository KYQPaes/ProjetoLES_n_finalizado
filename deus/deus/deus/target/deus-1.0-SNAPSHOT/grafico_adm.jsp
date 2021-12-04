<%@page import="Classes.Compra"%>
<%@page import="DAO.CompraDAO"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="Classes.Venda"%>
<%@page import="java.util.Date"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Endereco"%>
<%@page import="DAO.EnderecoDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Classes.Cartao"%>
<%@page import="java.util.List"%>
<%@page import="conexao.Conexao"%>
<%@page import="DAO.CartaoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<?xml version="1.0" encoding="UTF-8"?>

<%
       
    ClienteDAO clientedata = new ClienteDAO(Conexao.getConnection());
    List<Cliente> cliente = clientedata.selectCliente();
    request.setAttribute("CLIENTE_LIST", cliente);
    
    String data1 = request.getParameter("data1");
    String data2 = request.getParameter("data2");
    
    CompraDAO compradata = new CompraDAO(Conexao.getConnection());
    List<Venda> vendasData = compradata.selectDatas(data1, data2);
    List<Venda> vendas = compradata.selectVendas(1, data1 , data2);
    request.setAttribute("VENDA_LIST", vendas);
    
    
    
    
%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>


    <title>Consulta de Clientes</title>
    <link rel="stylesheet" href="styles/clientes-style.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"></script>
    
    
   
    
    
    
</h:head>
<body>
    <header>
        <script>
            let vetQuant = [];
            let vetData = [];
            let vetFQuant = [];
            let vetFData = [];
            function teste(q, d){
                    vetQuant.push(q);
                    vetData.push(d.toString());
                    console.log(d);
                }
            function final(){
                vetData.forEach(function(item, index, array){
                    var ano = item.substring(0, 4);
                    var mes = item.substring(4, 6);
                    var dia = item.substring(6, 8);
                    vetData[index] = dia + '/' + mes + '/' + ano; 
                });
                vetFQuant = vetQuant.slice();
                vetFData = vetData.slice();
                chart();
            }
            
        </script>
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
              <a  id="graficos" href="http://localhost:8080/deus-1.0-SNAPSHOT/grafico_adm.jsp">Graficos</a>
              <a  id="estoque" href="http://localhost:8080/deus-1.0-SNAPSHOT/estoque.jsp">Estoque</a>
        
              
               
            </div>
        
        
        <div id="meio">
            <div class="meiomenor">
                <form class="form" action="ControleGrafico" method="POST">
                    <input type="date" id="date1" name="data1" value="<%=data1%>"/>
                    <input type="date" id="date2" name="data2" value="<%=data2%>"/>
                    <input type="submit" id="enter" value="Mudar data">
                </form>
                <canvas id="myChart"></canvas>
                <script>
                    function chart(){
                        let myChart =  document.getElementById('myChart');

                        let line = new Chart(myChart, {
                            type:'line',

                            data:{
                                labels:vetFData,
                                datasets:[{
                                        label: 'Forever Young',
                                        data:vetFQuant,
                                        borderColor: "#bae755",
                                        backgroundColor: "#bae755",
                                },
                                {
                                        label: 'Rick And Morty',
                                        data:[2,2,3,4,],
                                        borderColor: "#0000FF",
                                        backgroundColor: "#0000FF",
                                },
                                {
                                        label: 'Pokemon',
                                        data:[1,2,4,4,],
                                        borderColor: "#ff0000",
                                        backgroundColor: "#ff0000",
                                },
                                {
                                        label: 'Pride',
                                        data:[1,2,8,0,],
                                        borderColor: "#00ff00",
                                        backgroundColor: "#00ff00",
                                },
                                {
                                        label: 'Snoopy',
                                        data:[5,2,3,2,],
                                        borderColor: "#FFA500",
                                        backgroundColor: "#FFA500",
                                }
                            ]

                            },

                            options: {
                                responsive: true,
                                plugins: {
                                  legend: {
                                    position: 'top',
                                  },
                                  title: {
                                    display: true,
                                    text: 'Quantidade Vendas/Dia'
                                  }
                                }
                              },
                        });

                    }

                </script>
                <p><font size="5">Vendas</font></p>
                <table id="tabela">
                    <tr>
                      <th>Quant da compra</th>
                      <th>Data de Compra</th>
                    </tr>
                    <c:forEach var="tempVendas" items="${VENDA_LIST}">
                        <tr>
                          <td>
                              ${tempVendas.quant}
                          </td>
                        </tr>
                    </c:forEach>
                </table>
                <div id="divCheckbox" style="display: none;">
                    <%
                    
                    
                    %>
                    <iframe onload="final()"></iframe>
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


 
</body>

</html>