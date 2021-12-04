/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import conexao.Conexao;
import Classes.Cliente;
import DAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author junio
 */
@WebServlet(name = "ControleEditCliente", urlPatterns = {"/ControleEditCliente"})
public class ControleEditCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String sobrenome = request.getParameter("sobrenome");
    String dataEmTexto = request.getParameter("data");


        try ( PrintWriter out = response.getWriter()){
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date convertedCurrentDate = sdf.parse(dataEmTexto);
            String date=sdf.format(convertedCurrentDate);
            
            Cliente cliente = new Cliente();
            cliente.setNome(nome);
            cliente.setId(id);
            cliente.setSobrenome(sobrenome);
            cliente.setData_nasc(date);
            
            ClienteDAO clientedao = new ClienteDAO(Conexao.getConnection());
            boolean success = clientedao.EditCliente(cliente);
            if(success==true){
                HttpSession session = request.getSession();
                session.setAttribute("loguser", cliente);
                response.sendRedirect("clientes.jsp");
            }else{
                out.print("Algo errado "+date);
            }
        }catch (ParseException e) {
            System.out.println("Erro de conversão da data");
            return; //para a execução do método
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
