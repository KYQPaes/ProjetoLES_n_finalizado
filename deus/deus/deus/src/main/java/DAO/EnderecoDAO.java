package DAO;

import Classes.Endereco;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnderecoDAO {
    
    
    
    Connection con ;

    public EnderecoDAO(Connection con) {
        this.con = con;
    }
    
    
    public boolean InsertEndereco(Endereco endereco){
        boolean set = false;
        try{
            //Insert register data to database
           String query = "insert into enderecos(telefone, cep, pais, endereco, numero, bairro, cidade, estado, apelido, complementos, cliente_id) values(?,?,?,?,?,?,?,?,?,?,?)";
           
           PreparedStatement pt = con.prepareStatement(query);
            pt.setString(1, endereco.getTelefone());
            pt.setString(2, endereco.getCep());
            pt.setString(3, endereco.getPais());
            pt.setString(4, endereco.getEndereco());
            pt.setString(5, endereco.getNumero());
            pt.setString(6, endereco.getBairro());
            pt.setString(7, endereco.getCidade());
            pt.setString(8, endereco.getEstado());
            pt.setString(9, endereco.getApelido());
            pt.setString(10, endereco.getComplemento());
            pt.setInt(11, endereco.getClienteid());

           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
 
    public List<Endereco> selectEndereco(int idCliente){
        List<Endereco> endereco = new ArrayList<>();
        
        try{
            String query = "select * from enderecos where cliente_id=?";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setInt(1, idCliente);
            ResultSet rs = pt.executeQuery();
            
            while(rs.next()){
                int id = rs.getInt("id");
                String telefone = rs.getString("telefone");
                String cep = rs.getString("cep");
                String pais = rs.getString("pais");
                String end = rs.getString("endereco");
                String numero = rs.getString("numero");
                String bairro = rs.getString("bairro");
                String cidade = rs.getString("cidade");
                String estado = rs.getString("estado");
                String apelido = rs.getString("apelido");
                String complemento = rs.getString("complementos");
                
                
                
                Endereco row = new Endereco(id, telefone,cep, pais, end, numero, bairro, cidade, estado, apelido, complemento);
                endereco.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return endereco;
        
    }
    
     public Endereco SelectSingleEndereco(int id){
        Endereco endereco = new Endereco();
        try{
           String query = "select * from enderecos where id=?";
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setInt(1, id);
           ResultSet rs = pt.executeQuery();
           
           while(rs.next()){
            endereco.setId(rs.getInt("id"));
            endereco.setTelefone(rs.getString("telefone"));
            endereco.setCep(rs.getString("cep"));
            endereco.setPais(rs.getString("pais"));
            endereco.setEndereco(rs.getString("endereco"));
            endereco.setNumero(rs.getString("numero"));
            endereco.setBairro(rs.getString("bairro"));
            endereco.setCidade(rs.getString("cidade"));
            endereco.setEstado(rs.getString("estado"));
            endereco.setApelido(rs.getString("apelido"));
            endereco.setComplemento(rs.getString("complementos"));
           }
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return endereco;
    }
    public boolean EditEndereco(Endereco endereco){
        boolean test = false;
        try{
           String query = "update enderecos set telefone=?, cep=?, pais=?, endereco=?, numero=?, bairro=?, cidade=?, estado=?, apelido=? , complementos=? where id=?";
           PreparedStatement pt = con.prepareStatement(query);
          
           
            pt.setString(1, endereco.getTelefone());
            pt.setString(2, endereco.getCep());
            pt.setString(3, endereco.getPais());
            pt.setString(4, endereco.getEndereco());
            pt.setString(5, endereco.getNumero());
            pt.setString(6, endereco.getBairro());
            pt.setString(7, endereco.getCidade());
            pt.setString(8, endereco.getEstado());
            pt.setString(9, endereco.getApelido());
            pt.setString(10, endereco.getComplemento());
            pt.setInt(11, endereco.getId());
           
           
           
           pt.executeUpdate();
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
    public void deleteEndereco(int id){
        try{
           String query = "delete from enderecos where id=?";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setInt(1, id);
           pt.execute();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    
    }

    



    
