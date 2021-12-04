<%@page import="javax.lang.model.element.Element"%>
<%@page import="Classes.Cupom"%>
<%@page import="DAO.CupomDAO"%>
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
       
    CupomDAO cupomdata = new CupomDAO(Conexao.getConnection());
    List<Cupom> cupom = cupomdata.selectCupom();
    request.setAttribute("Cupom_LIST", cupom);
    

%>


<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>


    <title>Cupom Administrador</title>
    <link rel="stylesheet" href="styles/finalcompra-style.css"/>
    <script src="js/generate_cupom.js"></script>
    <script src="js/validators/cupom.js"></script>

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
              <a  id="consulta" href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_clientes.jsp">Consulta Clientes</a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/cuponsadm.jsp">Cupom</a>
              <a  id="graficos" href="http://localhost:8080/deus-1.0-SNAPSHOT/grafico_adm.jsp?data1=2021-10-01&data2=2021-10-31">Graficos</a>
              <a  id="estoque" href="http://localhost:8080/deus-1.0-SNAPSHOT/estoque.jsp">Estoque</a>

              
               
            </div>
        
        
        <div id="meio">
            <div class="meiomenor">
                <div>
                    <table>

                        <tr>
                            <td>
                                <p><font size="5">Cupons Gerados</font></p>
                                    <table id="tabela">
                                        <tr>
                                          <th>Cupom</th>
                                          <th>Descricao</th>
                                          <th>Validade</th>
                                          <th>Codigo</th>
                                          <th>Status</th>
                                        </tr>
                                        <c:forEach var="tempCupom" items="${Cupom_LIST}">
                                        
                                   
                                        
                                            <tr>
                                                <td></td>
                                                <td>${tempCupom.descricao}</td>
                                                <td>${tempCupom.validade}</td>
                                                <td>${tempCupom.codigo}</td>
                                                <td>${tempCupom.status}</td>
                                                <td>
                                                    <a href="ControleDeleteCupom?id=${tempCupom.id}" draggable="false">  
                                                        <img src="images/icon/trash.png" width="20" height="20" draggable="false" ></img>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                
                                </table>
                                </td>

                        </tr>

                    

                                        




                    
                    </table>
                    </div>
            </div>
            
            
            
            
            <div>
                <table>

                    <tr>
                        <td>
                            <p><font size="5">Gerador de códigos</font></p>
                                <table id="tabela">
                                    <tr>
                                      <th>Cupom</th>
                                      <th>Descricao</th>
                                      <th>Gerar Codigo</th>
                                      
                                    </tr>
                                    <tr>
                                      <td><img src="images/icon/cupomfrete.png" width="30" height="30" draggable="false"  ></img></td>
                                      <td>Frete Gratis</td>
                                      
                                      
                                      <td><img src="images/icon/select.png" width="20" height="20" draggable="false" id="cupomfrete" onclick="generateFrete()"></img></td>
                                    </tr>
                                    
                                    <tr>
                                      <td><img src="images/icon/cupom5.png" width="30" height="30" draggable="false"></img></td>
                                      <td>Cupom de Troca</td>
                                      
                                      
                                      <td><img src="images/icon/select.png" width="20" height="20" draggable="false" id="cupom5" onclick="generatetroca()" ></img></td>
                                    </tr>
                                    
                                    <tr>
                                      <td><img src="images/icon/cupom10.png" width="30" height="30" draggable="false" ></img></td>
                                      <td>Desconto de 10%</td>
                                      
                                      
                                      <td><img src="images/icon/select.png" width="20" height="20" draggable="false" id="cupom10" onclick="generate10()" ></img></td>
                                    </tr>
                                    
                                                                      
                                  
                                </table>
                        </td>
                    </tr>
                    
                    <form class="form" action="ControleCupom" method="POST">
                        
                    <h4>Codigo do cupom</h4>
                    <input type="text" id="code" name="code" size="30" />
                    
                    <h4>validade do cupom</h4>
                    <input type="date" id="validadeCupom" name="validade"></input>
                    
                    <h4>Descrição</h4>
                    <input type="text" name="desc" id="desc" size="30" />
                    
                    <br><br>
                        
                    <input type="submit" id="save" value="Cadastrar cupom" onclick=" return validatecupom()" class="apply"/>
                    
                    </form>
                    
                </table>
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