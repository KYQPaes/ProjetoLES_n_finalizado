/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import conexao.Conexao;
import Classes.Cupom;
import Classes.Compra;
import DAO.CompraDAO;
import DAO.CupomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;

/**
 *
 * @author junio
 */
@WebServlet(name = "ControleCompra", urlPatterns = {"/ControleCompra"})
public class ControleCompra extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<script src='js/validators/cart.js'></script>");
            out.println("<title>Servlet ControleCompra</title>");            
            out.println("</head>");
            out.println("<body>");
            String fav_card = request.getParameter("fav");
            int cupomid  = Integer.parseInt(request.getParameter("cupomid"));
            String fav_end = request.getParameter("cont");
            Float frete = Float.parseFloat(request.getParameter("frete"));
            Float valor = Float.parseFloat(request.getParameter("valor"));
            String idprod = request.getParameter("idprod");
            String quantprod = request.getParameter("quantprod");
            String card2 = request.getParameter("card2");
            
            
            int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
            
            
            String[] parts = idprod.split("/");
            String[] qparts = quantprod.split("/");

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
            LocalDateTime now = LocalDateTime.now();  
             
            
            LocalDate dataAtual = java.time.LocalDate.now();
            String atual = dataAtual.toString();
            
            Compra compra = new Compra(atual, "EM PROCESSAMENTO", cliente_id, fav_card, fav_end, frete, cupomid, valor,card2);
            CompraDAO compradata = new CompraDAO(Conexao.getConnection());
            
            if(cupomid != -1){
                Cupom cupom = new Cupom();
                cupom.setId(cupomid);
                CupomDAO cupomdata = new CupomDAO(Conexao.getConnection());
                cupomdata.UpdateStatusCupom(cupom);
            }
            
           
            if (compradata.InsertCompra(compra)) {
                int id = compradata.SelectMaxId();
                int arrayLength = parts.length;
                int i = 1;
                
                while(i<=arrayLength){
                    try{
                    compradata.CompraProdutos(id, Integer.parseInt(parts[i]), Integer.parseInt(qparts[i]));
                    }catch(Exception e){
                        out.println(e);
                    }
                    i++;
                    if(i==arrayLength){
                        response.sendRedirect("clearCart.jsp");
                    }
                }
            }else{
                response.sendRedirect("index.xhtml");
            }
           
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
