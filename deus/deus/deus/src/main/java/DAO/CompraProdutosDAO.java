
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Classes.ComprasProdutos;
import Classes.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author junio
 */
public class CompraProdutosDAO {

    Connection con ;

    public CompraProdutosDAO(Connection con) {
        this.con = con;
    }

    public List<ComprasProdutos> selectProdutosCompra(int idCliente){
        List<ComprasProdutos> comprasProdutos = new ArrayList<>();

        try{
            String query = "select * from compras_produtos where compraid=?;";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setInt(1, idCliente);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                int id = rs.getInt("compraid");
                int produtoid = rs.getInt("produtoid");
                int quantidade = rs.getInt("quantidade");

                ProdutoDAO produtoDAO = new ProdutoDAO(this.con);
                Produto produto = new Produto();
                produto = produtoDAO.SelectSingleProduto(produtoid);
                ComprasProdutos row = new ComprasProdutos(id, produtoid, quantidade, produto.getImagem(), produto.getNome());
                comprasProdutos.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return comprasProdutos;
    }
    
    public ComprasProdutos selectQuant(int idProd, int  idCompra){
        ComprasProdutos compprod = new ComprasProdutos();
        try{
           String query = "select * from compras_produtos where compraid = ? and produtoid = ?";
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setInt(1, idCompra);
           pt.setInt(2, idProd);
           ResultSet rs = pt.executeQuery();
           
           while(rs.next()){
                compprod.setQuantidade(rs.getInt("quantidade"));
            }
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return compprod;
    }
    
    public boolean EditCompProd(ComprasProdutos cppd){
        boolean test = false;
        try{
           String query = "update compras_produtos set quantidade=? where compraid=? and produtoid=?;";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setInt(1, cppd.getQuantidade());
           pt.setInt(2, cppd.getCompraid());
           pt.setInt(3, cppd.getProdutoid());
           pt.executeUpdate();
           
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
}