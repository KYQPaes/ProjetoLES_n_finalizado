
package DAO;

import Classes.Cupom;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CupomDAO {
    
    
    Connection con ;
    
    public CupomDAO(Connection con) {
        this.con = con;
    }
    
    
    public boolean InsertCupom(Cupom cupom){
        boolean set = false;
        try{
            //Insert register data to database
           String query = "insert into cupom(descricao,validade, codigo, status) values(?,?,?,'DISPONIVEL')";
           
           PreparedStatement pt = con.prepareStatement(query);
           pt.setString(1, cupom.getDescricao());
           pt.setString(2, cupom.getValidade());
           pt.setString(3, cupom.getCodigo());
           ;
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    
    public List<Cupom> selectCupom(){
        List<Cupom> cupom = new ArrayList<>();
        
        try{
            String query = "select * from cupom";
            PreparedStatement pt = con.prepareStatement(query);

            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                
                int id = rs.getInt("id");
                String codigo = rs.getString("codigo");
                String desc = rs.getString("descricao");
                String validade = rs.getString("validade");
                String status = rs.getString("status");
                int clienteid = rs.getInt("cliente_id");
             
                
                
                Cupom row = new Cupom(codigo, validade, desc, clienteid);
                row.setId(id);
                row.setStatus(status);
                cupom.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return cupom;
    }
    
    
    
    public List<Cupom> selectSpecificCupom(int idCliente){
        List<Cupom> cupom = new ArrayList<>();
        
        try{
            String query = "select * from cupom where cliente_id=? AND status='DISPONIVEL'";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setInt(1, idCliente);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String codigo = rs.getString("codigo");
                String desc = rs.getString("descricao");
                String validade = rs.getString("validade");
                
                Cupom row = new Cupom(codigo, validade, desc);
                row.setId(id);
                cupom.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return cupom;
    }
    
    public void deleteCupom(int id){
        try{
           String query = "delete from cupom where id=?";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setInt(1, id);
           pt.execute();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    
 
    
    
    public boolean EditCupom(Cupom cupom, int id){
        boolean test = false;
        try{
           String query = "update cupom set cliente_id=? where id=?";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setInt(1,id);
           pt.setInt(2, cupom.getId());
           pt.executeUpdate();
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
    
    
    public int selectIdCupom(String codigo){
       
        try{
            String query = "select * from cupom where codigo=?";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setString(1, codigo);
            ResultSet rs = pt.executeQuery();
 
           while(rs.next()){
                
                return rs.getInt("id");
        }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return -1;
    }
    
    public boolean UpdateStatusCupom(Cupom cupom){
        boolean set = false;
        try{
           String query = "UPDATE cupom SET status = 'USADO' WHERE id = ?";
           
           PreparedStatement pt = con.prepareStatement(query);
           pt.setInt(1, cupom.getId());
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
}
