/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.util.Date;

/**
 *
 * @author junio
 */
public class Cartao {
    private int id;
    private String nome;
    private String numero;
    private String cvv;
    private String validade;
    private String cpf;
    private int clienteid;
    
    public Cartao() {
    }

    public Cartao(String nome, String numero, String cvv, String validade, String cpf) {
        this.nome = nome;
        this.numero = numero;
        this.cvv = cvv;
        this.validade = validade;
        this.cpf = cpf;
    }
    
    public Cartao(int id,String nome, String numero, String cvv, String validade, String cpf) {
        this.id = id;
        this.nome = nome;
        this.numero = numero;
        this.cvv = cvv;
        this.validade = validade;
        this.cpf = cpf;
    }
    
    public Cartao(int id,String nome, String numero, String cvv, String validade, String cpf, int clienteid) {
        this.id = id;
        this.nome = nome;
        this.numero = numero;
        this.cvv = cvv;
        this.validade = validade;
        this.cpf = cpf;
        this.clienteid = clienteid;
    }

    public int getClienteid() {
        return clienteid;
    }

    public void setClienteid(int clienteid) {
        this.clienteid = clienteid;
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

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public String getValidade() {
        return validade;
    }

    public void setValidade(String validade) {
        this.validade = validade;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    

    
}
