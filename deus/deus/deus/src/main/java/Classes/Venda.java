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
public class Venda {
 
    public int quant;
    public String data;

    public Venda(int quant, String data) {
        this.quant = quant;
        this.data = data;
    }

    public Venda() {
    }

    public Venda(String data) {
        this.data = data;
    }

    public Venda(int quant) {
        this.quant = quant;
    }
    
    
    
    public Venda(Venda vendas) {
        this.quant = vendas.getQuant();
        this.data = vendas.getData();
    }
    
    public int getQuant() {
        return quant;
    }

    public void setQuant(int quant) {
        this.quant = quant;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    
    
}