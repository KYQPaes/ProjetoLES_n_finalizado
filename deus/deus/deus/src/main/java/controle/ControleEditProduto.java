/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import conexao.Conexao;
import Classes.Produto;
import DAO.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leona
 */
@WebServlet(name = "ControleEditProduto", urlPatterns = {"/ControleEditProduto"})
public class ControleEditProduto extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControleEditProduto</title>");            
            out.println("</head>");
            out.println("<body>");
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            String nome = request.getParameter("nome");
            String desc = request.getParameter("desc");
            double preco = Double.parseDouble(request.getParameter("preco"));
            String img1 = request.getParameter("img1");
            String tipo = request.getParameter("tipo");
            String img2 = request.getParameter("img2");
            String img3 = request.getParameter("img3");
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            
            Produto produto = new Produto();
            produto.setNome(nome);
            produto.setDescricao(desc);
            produto.setPreco(preco);
            produto.setImagem(img1);
            produto.setTipo(tipo);
            produto.setImagem2(img2);
            produto.setImagem3(img3);
            produto.setQuantidade(quantidade);
            produto.setId(id);
            
            
            ProdutoDAO produtodao = new ProdutoDAO(Conexao.getConnection());
            boolean success = produtodao.EditProduto(produto);
            if(success==true){
                response.sendRedirect("estoque.jsp");
            }else{
                out.print("Algo errado");
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
