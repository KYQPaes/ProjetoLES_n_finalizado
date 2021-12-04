/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Classes.Produto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author junio
 */
public class ProdutoDAO {
    Connection con ;

    public ProdutoDAO(Connection con) {
        this.con = con;
    }
    
    public List<Produto> selectProduto(String tipo){
        List<Produto> produto = new ArrayList<>();
        
        try{
            String query = "select * from produtos where tipo=? and situacao='ativo' and quantidade>0";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setString(1, tipo);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String descricao = rs.getString("descricao");
                Double preco = rs.getDouble("preco");
                String imagem = rs.getString("imagem");
                
                Produto row = new Produto(id, nome, descricao, preco, imagem, tipo);
                produto.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return produto;
    }
    
    
    public Produto SelectSingleProduto(int id){
        Produto produto = new Produto();
        try{
           String query = "select * from produtos where id=?";
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setInt(1, id);
           ResultSet rs = pt.executeQuery();
           
           while(rs.next()){
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setImagem(rs.getString("imagem"));
                produto.setImagem2(rs.getString("imagem2"));
                produto.setImagem3(rs.getString("imagem3"));
                produto.setTipo(rs.getString("tipo"));
                produto.setQuantidade(rs.getInt("quantidade"));
            }
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return produto;
    }
    
    
    public List<Produto> selectProduto(){
        List<Produto> produto = new ArrayList<>();
        
        try{
            String query = "select * from produtos";
            PreparedStatement pt = con.prepareStatement(query);

            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String descricao = rs.getString("descricao");
                Double preco = rs.getDouble("preco");
                String tipo = rs.getString("tipo");
                String imagem = rs.getString("imagem");
                String imagem2 = rs.getString("imagem2");
                String imagem3 = rs.getString("imagem3");
                Integer quantidade = rs.getInt("quantidade");
                String situacao = rs.getString("situacao");
                
                
             
                
                
                Produto row = new Produto(id, nome, descricao, preco, tipo, imagem, imagem2, imagem3, quantidade, situacao);
                produto.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return produto;
    }
    
    public boolean InsertProduto(Produto produto){
        boolean set = false;
        try{
            //Insert register data to database
           String query = "insert into produtos(nome, descricao, preco, imagem, tipo, imagem2, imagem3, quantidade) values(?,?,?,?,?,?,?,?)";
           
           PreparedStatement pt = con.prepareStatement(query);
           pt.setString(1, produto.getNome());
           pt.setString(2, produto.getDescricao());
           pt.setDouble(3, produto.getPreco());
           pt.setString(4, produto.getImagem());
           pt.setString(5, produto.getTipo());
           pt.setString(6, produto.getImagem2());
           pt.setString(7, produto.getImagem3());
           pt.setInt(8, produto.getQuantidade());
              
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    
    public boolean EditProduto(Produto produto){
        boolean test = false;
        try{
           String query = "update produtos set nome=?, descricao=?, preco=?, imagem=?, tipo=?, imagem2=?, imagem3=?, quantidade=? where id=?";
           PreparedStatement pt = con.prepareStatement(query);
           
           pt.setString(1, produto.getNome());
           pt.setString(2, produto.getDescricao());
           pt.setDouble(3, produto.getPreco());
           pt.setString(4, produto.getImagem());
           pt.setString(5, produto.getTipo());
           pt.setString(6, produto.getImagem2());
           pt.setString(7, produto.getImagem3());
           pt.setInt(8, produto.getQuantidade());
           pt.setInt(9, produto.getId());
           pt.executeUpdate();
           
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
    
    
    public boolean EditProdutoSituacao(Produto produto){
        boolean test = false;
        try{
           String query = "update produtos set situacao='inativo' where id=?";
           PreparedStatement pt = con.prepareStatement(query);
          
           
            
            pt.setInt(1, produto.getId());
           
           
           
           pt.executeUpdate();
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
    
    public boolean EditProdutoAtivacao(Produto produto){
        boolean test = false;
        try{
           String query = "update produtos set situacao='ativo' where id=?";
           PreparedStatement pt = con.prepareStatement(query);
          
           
            
            pt.setInt(1, produto.getId());
           
           
           
           pt.executeUpdate();
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
}
