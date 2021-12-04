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
public class Cliente{
    private int id;
    private String nome = null;
    private String sobrenome = null;
    private String senha = null;
    private String data_nasc = null;
    private String sexo = null;
    private String email = null;
    //private List<Endereco> endereco;
    //private List<Cartao> cartao;

    public Cliente() {
    }

    public Cliente(String nome, String sobrenome, String senha, String data_nasc, String sexo, String email) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.senha = senha;
        this.data_nasc = data_nasc;
        this.sexo = sexo;
        this.email = email;
    }
    
    public Cliente(int id, String nome, String sobrenome, String senha, String data_nasc, String sexo, String email) {
        this.id = id;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.senha = senha;
        this.data_nasc = data_nasc;
        this.sexo = sexo;
        this.email = email;
    }
    
    public Cliente(String nome, String sobrenome, String senha, String email) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.senha = senha;
        this.email = email;
    }
  
    
        public Cliente(String nome, String sobrenome, String email) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.email = email;
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

    public String getSobrenome() {
        return sobrenome;
    }

    public String getSenha() {
        return senha;
    }

    public String getData_nasc() {
        return data_nasc;
    }

    public String getSexo() {
        return sexo;
    }

    public String getEmail() {
        return email;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setData_nasc(String data_nasc) {
        this.data_nasc = data_nasc;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
    
}
