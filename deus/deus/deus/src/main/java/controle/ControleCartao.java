/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import conexao.Conexao;
import Classes.Cartao;
import DAO.CartaoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControleCard", urlPatterns = {"/ControleCard"})
public class ControleCartao extends HttpServlet {
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        
        String dataEmTexto = request.getParameter("validade");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
        
            String numero = request.getParameter("NumCard");
            String nome = request.getParameter("NameCard");
            String cvv = request.getParameter("cvv");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date convertedCurrentDate = sdf.parse(dataEmTexto);
            String val=sdf.format(convertedCurrentDate);
            String cpf = request.getParameter("cpf");
            int Userid = Integer.parseInt(request.getParameter("id"));

            Cartao cartao = new Cartao(nome, numero, cvv, val, cpf);
            cartao.setClienteid(Userid);

            CartaoDAO cartaodao = new CartaoDAO(Conexao.getConnection());
                if (cartaodao.InsertCartao(cartao)) {
                   response.sendRedirect("http://localhost:8080/deus-1.0-SNAPSHOT/clientes.jsp");
                } else {
                    String errorMessage = "User Available";
                    HttpSession regSession = request.getSession();
                    regSession.setAttribute("RegError", errorMessage);
                    out.println(val+"</body>");
                    }

            
            out.println("</html>");
            
        }catch (ParseException e) {
            System.out.println("Erro de conversão da data");
            return; //para a execução do método
        }
    }
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
    }
}