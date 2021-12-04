<%@page import="java.util.Date"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Endereco"%>
<%@page import="DAO.EnderecoDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Classes.Cartao"%>
<%@page import="java.util.List"%>
<%@page import="conexao.Conexao"%>
<%@page import="DAO.CartaoDAO"%>
<%@page import="Classes.Cupom"%>
<%@page import="DAO.CupomDAO"%>
<?xml version="1.0" encoding="UTF-8"?>
<%
    Cliente cliente = (Cliente) session.getAttribute("loguser");
    if (cliente == null) {
        response.sendRedirect("home-page.xhtml");
    }

    CartaoDAO cartaodata = new CartaoDAO(Conexao.getConnection());
    List<Cartao> cartao = cartaodata.selectCartao(cliente.getId());
    request.setAttribute("CARTAO_LIST", cartao);

    EnderecoDAO enderecodata = new EnderecoDAO(Conexao.getConnection());
    List<Endereco> endereco = enderecodata.selectEndereco(cliente.getId());
    request.setAttribute("ENDERECO_LIST", endereco);

    CupomDAO cupomdata = new CupomDAO(Conexao.getConnection());
    List<Cupom> cupom = cupomdata.selectSpecificCupom(cliente.getId());
    request.setAttribute("Cupom_LIST", cupom);
%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
      xmlns:p="http://primefaces.org/ui">
    <h:head>
        <title>Finalizacao de compra</title>
        <link rel="stylesheet" href="styles/finalcompra-style.css"/>
        <script src="js/validators/cart.js"></script>
        <script src="js/validators/details.js"></script>
        <script src="js/validators/cep.js"></script>
        <style>
        body {font-family: Arial, Helvetica, sans-serif;}

        /* The Modal (background) */
        .modal {
          display: none; /* Hidden by default */
          position: fixed; /* Stay in place */
          z-index: 1; /* Sit on top */
          padding-top: 100px; /* Location of the box */
          left: 0;
          top: 0;
          width: 100%; /* Full width */
          height: 100%; /* Full height */
          overflow: auto; /* Enable scroll if needed */
          background-color: rgb(0,0,0); /* Fallback color */
          background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
          background-color: #fefefe;
          margin: auto;
          padding: 20px;
          border: 1px solid #888;
          width: 35%;
        }

        /* The Close Button */
        .close {
          color: #aaaaaa;
          float: right;
          font-size: 28px;
          font-weight: bold;
        }

        .close:hover,
        .close:focus {
          color: #000;
          text-decoration: none;
          cursor: pointer;
        }
        
        
        .close2 {
          color: #aaaaaa;
          float: right;
          font-size: 28px;
          font-weight: bold;
        }

        .close2:hover,
        .close2:focus {
          color: #000;
          text-decoration: none;
          cursor: pointer;
        }
        
        
          .close3 {
          color: #aaaaaa;
          float: right;
          font-size: 28px;
          font-weight: bold;
        }

        .close3:hover,
        .close3:focus {
          color: #000;
          text-decoration: none;
          cursor: pointer;
        }
        
        
        .view {
            box-shadow:inset 0px 1px 3px 0px #91b8b3;
            background:linear-gradient(to bottom, #2eb390 5%, #6c7c7c 100%);
            background-color:#2eb390;
            border-radius:5px;
            border:1px solid #566963;
            display:inline-block;
            cursor:pointer;
            color:#ffffff;
            font-family:Arial;
            font-size:15px;
            font-weight:bold;
            padding:2px 15px;
            text-decoration:none;
            text-shadow:0px -1px 0px #2b665e;
        }
        .view:hover {
            background:linear-gradient(to bottom, #6c7c7c 5%, #2eb390 100%);
            background-color:#6c7c7c;
        }
        .view:active {
            position:relative;
            top:1px;
        }
        .meiomenor {
            width        : 40%;
            height       : 105%;
            margin-top   : 70px;
            margin-left  : 150px;
            border       : 10px solid #f8f9fa;
            border-radius: 20px;
        }
        #meio {
            margin         : 2px;
            display        : flex;
            align-items    : center;
            justify-content: center;

            text-align     : center;
        }
        #foot {
            border: 1px solid black;
            background-image: linear-gradient(to right top, #373737, #4b4b4b, #606060, #767676, #8c8c8c);
            margin: 1px;
            margin-top:60px;
        }
        </style>
    </h:head>
    <body onload="final_compra()">
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
                    <form class="form" action="ControleCompra" method="POST">
                        <div>
                        <table>
                                
                            <h2>Pagamento</h2>    
                            <tr>
                                
                                    <td id="prod">
                                        <p><font size="5">Pagamento n°1</font></p>
                                        <!-- Trigger/Open The Modal -->
                                        <a class="view" id="myBtn">Formas de pagamento</a>
                                        <!-- The Modal -->
                                        <div id="myModal" class="modal">
                                            <!-- Modal content -->
                                            <div class="modal-content">
                                                <span class="close">&times;</span>
                                             
                                     
                                <div>
                                <table>
                                <tr>
                                    <td>
                                <h2>Forma de Pagamento</h2>
                                <tr>
                                    <td>
                                        <p><font size="5">Cartoes</font></p>
                                        <table id="tabela">
                                            <tr>
                                                <th>Numero do cartao</th>
                                                <th>Validade</th>
                                                <th>Preferencial</th>

                                            </tr>
                                            <c:forEach var="tempCartao" items="${CARTAO_LIST}">
                                                <tr>

                                                    <td>${tempCartao.numero}</td>
                                                    <td>${tempCartao.validade}</td>
                                                    <td><input type="radio" name="fav" value="${tempCartao.numero}" checked="checked"/></td>

                                                </tr>
                                            </c:forEach>


                                        </table>

                                        <a href="cartao_compra.jsp" draggable="false">  
                                            <img src="images/icon/add.png" id="addcard" width="40" height="40" draggable="false" ></img> 
                                        </a>
                                        <p />
                                        <div class="card-group">

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><font size="5">Gerar Boleto</font></p>
                                        <table id="tabela">
                                            <tr>
                                                <input type="radio" name="fav" value="boleto" />
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                
                                    </td>
                                </tr>
                            </table>
                                    </div>
                                </div>
                            </div>
                                        
                                        
                                        
                                    <td id="prod">
                                        <p><font size="5">Pagamento n°2</font></p>
                                        <!-- Trigger/Open The Modal -->
                                        <a class="view" id="myBtn2">Formas de pagamento</a>
                                        <!-- The Modal -->
                                        <div id="myModal2" class="modal">
                                            <!-- Modal content -->
                                            <div class="modal-content">
                                                <span class="close2">&times;</span>
                                             
                                     
                                <div>
                                <table>
                                <tr>
                                    <td>
                                <h2>Forma de Pagamento</h2>
                                <tr>
                                    <td>
                                        <p><font size="5">Cartoes</font></p>
                                        <table id="tabela">
                                            <tr>
                                                <th>Numero do cartao</th>
                                                <th>Validade</th>
                                                <th>Preferencial</th>

                                            </tr>
                                            <c:forEach var="tempCartao" items="${CARTAO_LIST}">
                                                <tr>

                                                    <td>${tempCartao.numero}</td>
                                                    <td>${tempCartao.validade}</td>
                                                    <td><input type="radio" name="card2" value="${tempCartao.numero}" checked="checked"/></td>

                                                </tr>
                                            </c:forEach>


                                        </table>

                                        <a href="cartao_compra.jsp" draggable="false">  
                                            <img src="images/icon/add.png" id="addcard" width="40" height="40" draggable="false" ></img> 
                                        </a>
                                        <p />
                                        <div class="card-group">

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><font size="5">Gerar Boleto</font></p>
                                        <table id="tabela">
                                            <tr>
                                                <input type="radio" name="card" value="boleto" />
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                
                                    </td>
                                </tr>
                            </table>
                                    </div>
                                </div>
                            </div>
                                        <script>
                                            // Get the modal
                                            var modal = document.getElementById("myModal");

                                            // Get the button that opens the modal
                                            var btn = document.getElementById("myBtn");

                                            // Get the <span> element that closes the modal
                                            var span = document.getElementsByClassName("close")[0];

                                            // When the user clicks the button, open the modal 
                                            btn.onclick = function() {
                                              modal.style.display = "block";
                                            }

                                            // When the user clicks on <span> (x), close the modal
                                            span.onclick = function() {
                                              modal.style.display = "none";
                                            }

                                            // When the user clicks anywhere outside of the modal, close it
                                            window.onclick = function(event) {
                                              if (event.target == modal) {
                                                modal.style.display = "none";
                                              }
                                            }
                                        </script>
                                        
                                        <script>
                                            // Get the modal
                                            var modal2 = document.getElementById("myModal2");

                                            // Get the button that opens the modal
                                            var btn2 = document.getElementById("myBtn2");

                                            // Get the <span> element that closes the modal
                                            var span2 = document.getElementsByClassName("close2")[0];

                                            // When the user clicks the button, open the modal 
                                            btn2.onclick = function() {
                                              modal2.style.display = "block";
                                            }

                                            // When the user clicks on <span> (x), close the modal
                                            span2.onclick = function() {
                                              modal2.style.display = "none";
                                            }

                                            // When the user clicks anywhere outside of the modal, close it
                                            window.onclick = function(event) {
                                              if (event.target == modal2) {
                                                modal2.style.display = "none";
                                              }
                                            }
                                        </script>
                                       
                                      
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
                                            </tr>
                                            <c:forEach var="tempEndereco" items="${ENDERECO_LIST}">
                                                <tr>
                                                    <td>${tempEndereco.apelido}</td>
                                                    <td>${tempEndereco.endereco}</td>
                                                    <td><input type="radio" name="cont" value="${tempEndereco.numero}" checked="checked"/></td>

                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <a href="endereco_compra.jsp" draggable="false">  
                                            <img src="images/icon/add.png" id="addend" width="40" height="40" draggable="false" ></img> 
                                        </a>
                                        <p />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><font size="5">Frete</font></p>
                                        <table id="tabela">
                                            <tr>
                                                
                                                <th>Preço</th>
                                            </tr>
                                            
                                                <tr>
                                                 
                                                    <td>
                                                    <font size="5" id="total_frete" line-height="2.2" face="Arial" style="color: green"> </font> <br />
                                                    </td>
                                               
                                                </tr>
                                      
                                        </table>
                                   
                                        
                                    </td>
                                </tr>
                            
                            
                            
                                <tr>
                                    <td>
                                        
                                    </td>
                                </tr> 
                            
                            
                           
                            
                            
                            <td id="prod">
                                        <!-- Trigger/Open The Modal -->
                                        <a class="view" id="myBtn3">Meus Cupons</a>
                                        <!-- The Modal -->
                                        <div id="myModal3" class="modal">
                                            <!-- Modal content -->
                                            <div class="modal-content">
                                                <span class="close3">&times;</span>
                                                <div>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <p><font size="5">Cupons Disponiveis</font></p>
                                                                <table id="tabela">
                                                                    <tr>
                                                                        <th>Cupom</th>
                                                                        <th>Descricao</th>
                                                                        <th>Validade</th>
                                                                        <th>Codigo</th>
                                                                        <th>Escolha</th>
                                                                    </tr>
                                                                        <td colspan="4">
                                                                            <center>Não Usar</center>
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="cupomid" value="-1" checked="checked"/>
                                                                        </td>
                                                                    <tr>
                                                                    </tr>
                                                                    <c:forEach var="tempCupom" items="${Cupom_LIST}">
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>${tempCupom.descricao}</td>
                                                                            <td>${tempCupom.validade}</td>
                                                                            <td id="code">${tempCupom.codigo}</td>
                                                                            <td><input type="radio" name="cupomid" value="${tempCupom.id}"/></td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            // Get the modal
                                            var modal3 = document.getElementById("myModal3");

                                            // Get the button that opens the modal
                                            var btn3 = document.getElementById("myBtn3");

                                            // Get the <span> element that closes the modal
                                            var span3 = document.getElementsByClassName("close3")[0];

                                            // When the user clicks the button, open the modal 
                                            btn3.onclick = function() {
                                              modal3.style.display = "block";
                                            }

                                            // When the user clicks on <span> (x), close the modal
                                            span3.onclick = function() {
                                              modal3.style.display = "none";
                                            }

                                            // When the user clicks anywhere outside of the modal, close it
                                            window.onclick = function(event) {
                                              if (event.target == modal3) {
                                                modal3.style.display = "none";
                                              }
                                            }
                                        </script>
                                    </td>
                               
                            
                            

                        </table>
                        </div>
                        <input type="hidden" name="cliente_id" value="<%=cliente.getId()%>">
                            <button type="submit" id="finalcompra" onclick="" class="final">Finalizar Compra</button>
                    </form>
                </div>

                <div>
                    <table>

                        <tr>
                            <td>
                                <p><font size="5">Pedidos</font></p>
                                <table id="tabela">
                                    <tr id="cont">
                                        <th>Produto</th>
                                        <th>Descricao</th>
                                        <th>Valor</th>
                                        <th>Quantidade</th>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h3>Total do Pedido:</h3>
                               
                                Desconto :
                                <font size="5"  line-height="2.2" face="Arial" style="color: green"> R$ 0,00 </font> <br />
                                <b>TOTAL :</b>
                                <font size="5" id="total_preco" line-height="2.2" face="Arial" style="color: green"> </font> <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
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
    </body>

</html>