<%@page import="Classes.Produto"%>
<%@page import="DAO.ProdutoDAO"%>
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
    int id = Integer.parseInt(request.getParameter("id"));
    ProdutoDAO produtodata = new ProdutoDAO(Conexao.getConnection());
    
    Produto Altproduto = produtodata.SelectSingleProduto(id);
    request.setAttribute("editProduto", Altproduto);
    
%>


<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>


    <title>Cadastro de Produtos</title>
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
                    <div class="cadastro">
                        <form class="form" action="ControleEditProduto" method="POST">
                        <table class="tabela">
                            <tr>
                                <th colspan="2">
                                    <h2>Dados de Cadastro de Produto</h2>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    Nome do produto:
                                </td>
                                <td>
                                    Tipo do Produto:
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" size="20" name="nome" value="${editProduto.nome}"/>
                                </td>
                                <td>
                                    <label for="status">Defina um Tipo de Produto:</label>

                                            <select name="tipo" value="${tempProduto.tipo}" id="status">
                                              <option value="masculino">masculino</option>
                                              <option value="feminino">feminino</option>
                                              <option value="personalizada">personalizada</option>
                                              <option value="carbono">carbono</option>
                                              <option value="documento">documento</option>
                                            </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Descrição do Produto:
                                </td>
                            </tr>
                            <tr>
                                <td>
                                 
                                     
                                        <input type="text" step=".01" name="desc" value="${editProduto.descricao}"/>
                                 
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    Preco:
                                </td>
                                <td>
                                    Quantidade em Estoque:
                                </td>
                            </tr>
                            <tr>
                                <td>
                                 
                                       <input type="number" step=".01" name="preco" value="${editProduto.preco}"/>
                                 
                                </td>
                                <td>
                                    <input type="number" step=".01" name="quantidade" value="${editProduto.quantidade}"/>
                                </td>       
                            </tr>
                            
                            <tr>
                                <td>
                                    Imagem 1:
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="img1" value="${editProduto.imagem}"/>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td>
                                    Imagem 2:
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <input type="text" name="img2" value="${editProduto.imagem2}"/>
                                </td>
                            </tr>
                            
                            
                            
                            <tr>
                                <td>
                                    Imagem 3:
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="img3" value="${editProduto.imagem3}"/>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td class="trenviar">
                                <input type="submit" value="Editar produto existente" class="apply"/>
                                </td>
                                <td>
                                   
                                </td>
                            </tr>
                        </table>
                               
                                <input type="hidden" value="${editProduto.id}" name="id">
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