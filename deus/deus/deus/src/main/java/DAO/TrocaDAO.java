/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Classes.Produto;
import Classes.Troca;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author junio
 */
public class TrocaDAO {
    Connection con ;

    public TrocaDAO(Connection con) {
        this.con = con;
    }
    
    public boolean InsertTroca(Troca troca){
        boolean set = false;
        try{
            //Insert register data to database
           String query = "insert into trocas(fk_compraid, fk_produtoid, quantidade) values(?,?,?)";
           
           PreparedStatement pt = con.prepareStatement(query);
           pt.setInt(1, troca.getCompraid());
           pt.setInt(2, troca.getProdutoid());
           pt.setInt(3, troca.getQuantidade());
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    public List<Produto> selectTroca(int idCompra){
        List<Produto> prod = new ArrayList<>();

        try{
            String query = "select * from trocas where fk_compraid = ?;";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setInt(1, idCompra);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                int idCOmpra = rs.getInt("fk_compraid");
                int idProd = rs.getInt("fk_produtoid");
                int quantidade = rs.getInt("quantidade");

                ProdutoDAO produtoDAO = new ProdutoDAO(this.con);
                Produto produto = new Produto();
                produto = produtoDAO.SelectSingleProduto(idProd);
                produto.setQuantidade(quantidade);
                prod.add(produto);
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return prod;
    }
}
