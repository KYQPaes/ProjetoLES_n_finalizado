package DAO;

import Classes.Cliente;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO{
    
    
    
    Connection con ;

    public ClienteDAO(Connection con) {
        this.con = con;
    }
    
    
    public boolean InsertCliente(Cliente cliente){
        boolean set = false;
        try{
            //Insert register data to database
           String query = "insert into clientes(nome,sobrenome, senha, email) values(?,?,?,?)";
           
           PreparedStatement pt = con.prepareStatement(query);
           pt.setString(1, cliente.getNome());
           pt.setString(2, cliente.getSobrenome());
           pt.setString(3, cliente.getSenha());
           pt.setString(4, cliente.getEmail());
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    public Cliente logCliente(String email, String senha){
        Cliente cliente = null;
        try{
            String query = "select * from clientes where email = ? and senha = ?";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setString(1, email);
            pt.setString(2, senha);
            
            ResultSet rs = pt.executeQuery();
            
            if(rs.next()){
                cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setEmail(rs.getString("email"));
                cliente.setSenha(rs.getString("senha"));
                cliente.setNome(rs.getString("nome"));
                cliente.setSobrenome(rs.getString("sobrenome"));
                cliente.setData_nasc(rs.getString("data_nasc"));
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return cliente;
    }
    
    public boolean EditCliente(Cliente cliente){
        boolean test = false;
        try{
           String query = "update clientes set nome=?, sobrenome=?, data_nasc=? where id=?";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setString(1, cliente.getNome());
           pt.setString(2, cliente.getSobrenome());
           pt.setString(3, cliente.getData_nasc());
           pt.setInt(4, cliente.getId());
           pt.executeUpdate();
           
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
    public boolean EditSenha(Cliente cliente){
        boolean test = false;
        try{
           String query = "update clientes set senha=? where id=?";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setString(1, cliente.getSenha());
           pt.setInt(2, cliente.getId());
           pt.executeUpdate();
           
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return test;
    }
    
    
        public List<Cliente> selectCliente(){
        List<Cliente> cliente = new ArrayList<>();
        
        try{
            String query = "select * from clientes";
            PreparedStatement pt = con.prepareStatement(query);

            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                
                String nome = rs.getString("nome");
                String sobrenome = rs.getString("sobrenome");
                String email = rs.getString("email");
                int id = rs.getInt("id");
                
                
                Cliente row = new Cliente( nome, sobrenome, email);
                row.setId(id);
                cliente.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return cliente;
    }
    
    
}