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
public class Troca {
    private int compraid;
    private int produtoid;
    private int quantidade;

    public Troca(int compraid, int produtoid, int quantidade) {
        this.compraid = compraid;
        this.produtoid = produtoid;
        this.quantidade = quantidade;
    }

    public Troca() {
    }

    public int getCompraid() {
        return compraid;
    }

    public void setCompraid(int compraid) {
        this.compraid = compraid;
    }

    public int getProdutoid() {
        return produtoid;
    }

    public void setProdutoid(int produtoid) {
        this.produtoid = produtoid;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    
}
