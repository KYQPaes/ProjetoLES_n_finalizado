/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.util.Date;

/**
 *
 * @author leona
 */

    
public class Endereco{
    
    private int id;
    private String telefone = null;
    private String cep = null;
    private String pais = null;
    private String endereco = null;
    private String numero = null;
    private String bairro = null;
    private String cidade = null;
    private String estado = null;
    private String apelido = null;
    private String complemento = null;
    private int clienteid;
    
    //private List<Endereco> endereco;
    //private List<Cartao> cartao;

    public Endereco() {
    }

    public Endereco(String telefone, String cep, String pais,String endereco, String numero, String bairro, String cidade, String estado, String apelido, String complemento) {
    this.telefone = telefone;
    this.cep = cep;
    this.pais = pais;
    this.endereco = endereco;
    this.numero = numero;
    this.bairro = bairro;
    this.cidade = cidade;
    this.estado = estado;
    this.apelido = apelido;
    this.complemento = complemento;
    }
    
    public Endereco(String telefone, String cep,String endereco, String numero, String bairro, String cidade, String estado, String apelido, String complemento) {
    this.telefone = telefone;
    this.cep = cep;
    this.endereco = endereco;
    this.numero = numero;
    this.bairro = bairro;
    this.cidade = cidade;
    this.estado = estado;
    this.apelido = apelido;
    this.complemento = complemento;
    }
    
    public Endereco(int id, String telefone, String cep, String pais,String endereco, String numero, String bairro, String cidade, String estado, String apelido, String complemento, int clienteid) {
    this.id = id;
    this.telefone = telefone;
    this.cep = cep;
    this.pais = pais;
    this.endereco = endereco;
    this.numero = numero;
    this.bairro = bairro;
    this.cidade = cidade;
    this.estado = estado;
    this.apelido = apelido;
    this.complemento = complemento;
    this.clienteid = clienteid;
    } 
    
    public Endereco(int id, String telefone, String cep, String pais,String endereco, String numero, String bairro, String cidade, String estado, String apelido, String complemento) {
    this.id = id;
    this.telefone = telefone;
    this.cep = cep;
    this.pais = pais;
    this.endereco = endereco;
    this.numero = numero;
    this.bairro = bairro;
    this.cidade = cidade;
    this.estado = estado;
    this.apelido = apelido;
    this.complemento = complemento;
    
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public int getClienteid() {
        return clienteid;
    }

    public void setClienteid(int clienteid) {
        this.clienteid = clienteid;
    }

    

    

   

    
    
}
