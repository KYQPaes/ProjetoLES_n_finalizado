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
public class Produto {
    private int id;
    private String nome;
    private String descricao;
    private Double preco;
    private String imagem;
    private String imagem2;
    private String imagem3;
    private String tipo;
    private int quantidade;
    private String situacao;

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Produto(int id, String nome, String descricao, Double preco, String tipo, String imagem, String imagem2, String imagem3,int quantidade) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.tipo = tipo;
        this.imagem = imagem;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
        this.quantidade = quantidade;
    }
    
    
     public Produto(int id, String nome, String descricao, Double preco, String tipo, String imagem, String imagem2, String imagem3,int quantidade, String situacao) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.tipo = tipo;
        this.imagem = imagem;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
        this.quantidade = quantidade;
        this.situacao = situacao;
    }

    public Produto() {
    }
    
    public Produto(int id, String nome, String descricao, Double preco, String imagem, String tipo) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.imagem = imagem;
        this.tipo = tipo;
    }

    public Produto(int id, String nome, String descricao, Double preco, String tipo, String imagem, String imagem2, String imagem3) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.imagem = imagem;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
        this.tipo = tipo;
    }
    
    public Produto( String nome, String descricao, Double preco, String imagem, String tipo,  String imagem2, String imagem3) {
        
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.imagem = imagem;
        this.tipo = tipo;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
        
        
    }
    
    public Produto( String nome, String descricao, Double preco, String imagem, String tipo,  String imagem2, String imagem3, int quantidade) {
        
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.imagem = imagem;
        this.tipo = tipo;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
        this.quantidade = quantidade;
        
        
    }
    
    
    
    
      
    

    public String getImagem2() {
        return imagem2;
    }

    public void setImagem2(String imagem2) {
        this.imagem2 = imagem2;
    }

    public String getImagem3() {
        return imagem3;
    }

    public void setImagem3(String imagem3) {
        this.imagem3 = imagem3;
    }
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
    
}
