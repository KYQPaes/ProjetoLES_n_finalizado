package DAO;

import Classes.Cartao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartaoDAO{
    
    
    
    Connection con ;

    public CartaoDAO(Connection con) {
        this.con = con;
    }
    
    
    public boolean InsertCartao(Cartao cartao){
        boolean set = false;
        try{
            //Insert register data to database
           String query = "insert into cartoes(nome,numero, cvv, validade, cpf, cliente_id) values(?,?,?,?,?,?)";
           
           PreparedStatement pt = con.prepareStatement(query);
           pt.setString(1, cartao.getNome());
           pt.setString(2, cartao.getNumero());
           pt.setString(3, cartao.getCvv());
           pt.setString(4, cartao.getValidade());
           pt.setString(5, cartao.getCpf());
           pt.setInt(6, cartao.getClienteid());
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    public List<Cartao> selectCartao(int idCliente){
        List<Cartao> cartao = new ArrayList<>();
        
        try{
            String query = "select * from cartoes where cliente_id=?";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setInt(1, idCliente);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String numero = rs.getString("numero");
                String cvv = rs.getString("cvv");
                String cpf = rs.getString("cpf");
                String validade = rs.getString("validade");
                
                Cartao row = new Cartao(id, nome, numero, cvv, validade, cpf);
                cartao.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return cartao;
    }
    public Cartao SelectSingleCartao(int id){
        Cartao cartao = new Cartao();
        try{
           String query = "select * from cartoes where id=?";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setInt(1, id);
           ResultSet rs = pt.executeQuery();
           
           while(rs.next()){
                cartao.setId(rs.getInt("id"));
                cartao.setNome(rs.getString("nome"));
                cartao.setNumero(rs.getString("numero"));
                cartao.setCvv(rs.getString("cvv"));
                cartao.setCpf(rs.getString("cpf"));
                cartao.setValidade(rs.getString("validade"));
            }
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return cartao;
    }
    public boolean EditCartao(Cartao cartao){
        boolean test = false;
        try{
           String query = "update cartoes set nome=?, numero=?, cvv=?, cpf=?, validade=? where id=?";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setString(1, cartao.getNome());
           pt.setString(2, cartao.getNumero());
           pt.setString(3, cartao.getCvv());
           pt.setString(4, cartao.getCpf());
           pt.setString(5, cartao.getValidade());
           pt.setInt(6, cartao.getId());
           pt.executeUpdate();
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
    public void deleteCartao(int id){
        try{
           String query = "delete from cartoes where id=?";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setInt(1, id);
           pt.execute();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
}