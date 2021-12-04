

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
public class ComprasProdutos {
    private int compraid;
    private int produtoid;
    private int quantidade;
    private String imagem;
    private String nome;

    public ComprasProdutos(int compraid, int produtoid, int quantidade) {
        this.compraid = compraid;
        this.produtoid = produtoid;
        this.quantidade = quantidade;
    }

    public ComprasProdutos(int compraid, int produtoid, int quantidade, String imagem, String nome) {
        this.compraid = compraid;
        this.produtoid = produtoid;
        this.quantidade = quantidade;
        this.imagem = imagem;
        this.nome = nome;
    }

    public ComprasProdutos() {
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

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }



} 
