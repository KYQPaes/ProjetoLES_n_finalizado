/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Classes.Compra;
import Classes.Venda;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author junio
 */
public class CompraDAO {
    
    Connection con ;

    public CompraDAO(Connection con) {
        this.con = con;
    }
    
    public boolean InsertCompra(Compra compra){
        boolean set = false;
        try{
            //Insert register data to database
           String query = "insert into compras(data_comp, status, cliente_id, metodo, endereco, frete, cupom_id, valor, metodo2) values (?, ?, ?, ?, ?, ?, ?, ?,?)";
           
           PreparedStatement pt = con.prepareStatement(query);
            pt.setString(1, compra.getData());
            pt.setString(2, compra.getStatus());
            pt.setInt(3, compra.getCliente_id());
            pt.setString(4, compra.getMetodo());
            pt.setString(5, compra.getEndereco());
            pt.setFloat(6, compra.getFrete());
            pt.setInt(7, compra.getCupom_id());
            pt.setFloat(8, compra.getValor());
            pt.setString(9, compra.getMetodo2());
        
            
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    public int SelectMaxId(){
        int id=0;
        try{
            //Insert register data to database
           String query = "SELECT MAX(id) FROM compras;";
           PreparedStatement pt = con.prepareStatement(query);
           ResultSet rs = pt.executeQuery();
           
            while(rs.next()){
                 id = rs.getInt("MAX(id)");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return id;
    }
    public boolean CompraProdutos(int id, int id_prod1, int quant){
        boolean set = false;
        try{
           String query = "insert into compras_produtos(compraid, produtoid, quantidade) values (?, ?, ?)";
           
           PreparedStatement pt = con.prepareStatement(query);
            pt.setInt(1, id);
            pt.setInt(2, id_prod1);
            pt.setInt(3, quant);
            
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    public List<Compra> selectcompra(int idCliente){
        List<Compra> compra = new ArrayList<>();
        
        try{
            String query = "select * from compras where cliente_id=?";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setInt(1, idCliente);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String data_comp = rs.getString("data_comp");
                String status = rs.getString("status");
                String metodo = rs.getString("metodo");
                String endereco = rs.getString("endereco");
                Float valor = rs.getFloat("valor");
                Float frete = rs.getFloat("frete");
                
                Compra row = new Compra(id, data_comp, status, metodo, endereco, frete, valor);
                compra.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return compra;
    }
    
   
    public Compra SelectSingleCompra(int id){
        Compra compra = new Compra();
        try{
           String query = "select * from compras where id=?";
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setInt(1, id);
           ResultSet rs = pt.executeQuery();
           
           while(rs.next()){
            compra.setId(rs.getInt("id"));
            compra.setStatus(rs.getString("status"));
            compra.setData(rs.getString("data_comp"));
            compra.setMetodo(rs.getString("metodo"));
            compra.setEndereco(rs.getString("endereco"));
            compra.setValor(rs.getFloat("valor"));
            compra.setFrete(rs.getFloat("frete"));
          
           }
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return compra;
    }

    public List<Venda> selectVendas(int idprod, String data1, String data2){
        if(data1 == null){
            data1 = "2021-10-01";
        }
        if(data2 == null){
            data2 = "2021-10-31";
        }
        
        List<Venda> vendas = new ArrayList<>();
        
        try{
            String query = "Select data_comp as datas, (select sum(quantidade) from compras_produtos, compras where datas = data_comp and produtoid=? and compras_produtos.compraid = compras.id ) as quant  from compras where data_comp>=? and data_comp<=? group by data_comp;";
            PreparedStatement pt = con.prepareStatement(query);

            pt.setInt(1, idprod);
            pt.setString(2, data2);
            pt.setString(3, data2);
   
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                
                int quant = rs.getInt("quant");
                
                Venda row = new Venda(quant);
                vendas.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return vendas;
    }
    
    public List<Venda> selectDatas(String data1, String data2){
        if(data1 == null){
            data1 = "2021-10-01";
        }
        if(data2 == null){
            data2 = "2021-10-31";
        }
        
        List<Venda> vendas = new ArrayList<>();
        
        try{
            String query = "select data_comp from compras where data_comp>=? and data_comp<=?";
            PreparedStatement pt = con.prepareStatement(query);

            pt.setString(1, data1);
            pt.setString(2, data2);
            
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                String data_comp = rs.getString("data_comp");
                
                Venda row = new Venda(data_comp);
                vendas.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return vendas;
    }
    
    
    public boolean EditCompra(Compra compra){
        boolean test = false;
        try{
           String query = "update compras set status=? where id=?";
           PreparedStatement pt = con.prepareStatement(query);
          
           
            pt.setString(1, compra.getStatus());
            pt.setInt(2, compra.getId());
           
           
           
           pt.executeUpdate();
           test = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
}
