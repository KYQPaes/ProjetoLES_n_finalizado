/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

/**
 *
 * @author junio
 */
public class Compra {
    private int id;
    private String data;
    private String status;
    private int cliente_id;
    private String metodo;
    private String endereco;
    private float frete;
    private int cupom_id;
    private float valor;
    private float valortot;
    private String metodo2;
    

 

    public Compra(int id, String data, String status, int cliente_id, String metodo, String endereco, float frete, int cupom_id) {
        this.id = id;
        this.data = data;
        this.status = status;
        this.cliente_id = cliente_id;
        this.metodo = metodo;
        this.endereco = endereco;
        this.frete = frete;
        this.cupom_id = cupom_id;
        
        
    }

    public Compra(String data, String status, int cliente_id, String metodo, String endereco, float frete, int cupom_id) {
        this.data = data;
        this.status = status;
        this.cliente_id = cliente_id;
        this.metodo = metodo;
        this.endereco = endereco;
        this.frete = frete;
        this.cupom_id = cupom_id;
       
    }

    public Compra(int id, String data, String status, String metodo, String endereco) {
        this.id = id;
        this.data = data;
        this.status = status;
        this.metodo = metodo;
        this.endereco = endereco;
        
    }
    
    
    
    public Compra(String data, String status, int cliente_id, String metodo, String endereco, float frete, int cupom_id, float valor, String metodo2) {
        this.data = data;
        this.status = status;
        this.cliente_id = cliente_id;
        this.metodo = metodo;
        this.endereco = endereco;
        this.frete = frete;
        this.cupom_id = cupom_id;
        this.valor = valor;
        this.valortot = this.Total(valor, frete);
        this.metodo2 = metodo2;
       
    }

   
    public Compra(int id, String data, String status, String metodo, String endereco, float frete, float valor) {
        this.id = id;
        this.data = data;
        this.status = status;
        this.frete = frete;
        this.metodo = metodo;
        this.endereco = endereco;
        this.frete = frete;
        this.valor = valor;
        this.valortot = this.Total(valor, frete);
    }
    
    public Compra(){
    }

    public float getValortot() {
        return valortot;
    }

    public void setValortot(float valortot) {
        this.valortot = valortot;
    }
    
    private float Total(float valor, Float frete){
        return valor+frete;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCliente_id() {
        return cliente_id;
    }

    public void setCliente_id(int cliente_id) {
        this.cliente_id = cliente_id;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public float getFrete() {
        return frete;
    }

    public void setFrete(float frete) {
        this.frete = frete;
    }

    public int getCupom_id() {
        return cupom_id;
    }

    public void setCupom_id(int cupom_id) {
        this.cupom_id = cupom_id;
    }
    
     public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public String getMetodo2() {
        return metodo2;
    }

    public void setMetodo2(String metodo2) {
        this.metodo2 = metodo2;
    }
    
    
    
    
   
    
    
}
