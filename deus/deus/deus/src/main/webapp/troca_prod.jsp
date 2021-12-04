<%@page import="Classes.Produto"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="Classes.Compra"%>
<%@page import="Classes.Compra"%>
<%@page import="DAO.CompraDAO"%>
<%@page import="DAO.CompraDAO"%>
<%@page import="conexao.Conexao"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.ComprasProdutos"%>
<%@page import="DAO.CompraProdutosDAO"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<?xml version="1.0" encoding="UTF-8"?>

<%
    Cliente cliente = (Cliente) session.getAttribute("loguser");
    if(cliente==null){
        response.sendRedirect("home-page.xhtml");
    }
       
    int idProd = Integer.parseInt(request.getParameter("idProd"));
    int idCompra = Integer.parseInt(request.getParameter("idCompra"));

    CompraDAO compradata = new CompraDAO(Conexao.getConnection());
    Compra Altcompra = compradata.SelectSingleCompra(idCompra);
    
    ProdutoDAO pddao = new ProdutoDAO(Conexao.getConnection());
    Produto pd = pddao.SelectSingleProduto(idProd);
    
    CompraProdutosDAO cppddao = new CompraProdutosDAO(Conexao.getConnection());
    ComprasProdutos cppd = cppddao.selectQuant(idProd, idCompra);

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
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Masculino</a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=feminino">Feminino</a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Personalizadas</a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-carbono.xhtml">Carbono</a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-documento.xhtml">Documento</a>
              <a  >   |  </a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_produto.jsp" style="color: darkblue">Meus Pedidos</a>
              
               
            </div>
        
        
        <div id="meio">
            <div class="meiomenor">
                <div>
                    <table id="tabela">
                    <tr>
                        <th>Produto</th>
                        <th>Nome</th>
                    </tr>
                    <tr>
                        <th><img src="<%= pd.getImagem()%>" width="200" height="200" draggable="false"/></th>
                        <th>Carteira <%= pd.getNome()%></th>
                    </tr>
                </table>
                <br/>
                <center>
                     <form class="form" action="ControleTroca" method="POST">
                        <h2>Quantidade que deseja trocar</h2><br/>
                        <input type="number" id="quant" name="quant" value="<%=cppd.getQuantidade()%>"/>
                        <input type="hidden" name="idCompra" value="<%=idCompra%>"/>
                        <input type="hidden" name="idProd" value="<%=idProd%>"/>
                        <input type="hidden" id="quantOrig" name="quantOrig" value="<%=cppd.getQuantidade()%>"/>
                        <input type="submit"/>
                        
                    </form>
                </center>
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