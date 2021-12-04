package Classes;

import java.util.Date;


public class Cupom {
    
    private int id;
    private String codigo;
    private String validade;
    private String descricao;
    private String status;
    private int clienteid;

    public Cupom(){
    }

    public Cupom(int id, String codigo, String validade, String descricao, int clienteid) {
        this.id = id;
        this.codigo = codigo;
        this.validade = validade;
        this.descricao = descricao;
        this.clienteid = clienteid;
    }
    
    public Cupom(int id, String codigo, String validade, String descricao) {
        this.id = id;
        this.codigo = codigo;
        this.validade = validade;
        this.descricao = descricao;
        
    }
    
    public Cupom( String codigo, String validade, String descricao, int clienteid) {
        this.codigo = codigo;
        this.validade = validade;
        this.descricao = descricao;
        this.clienteid = clienteid;
    }
    
    public Cupom( String codigo, String validade, String descricao) {
        
        this.codigo = codigo;
        this.validade = validade;
        this.descricao = descricao;
        
    }
    
    public Cupom( String codigo) {
        
        this.codigo = codigo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getValidade() {
        return validade;
    }

    public void setValidade(String validade) {
        this.validade = validade;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getClienteid() {
        return clienteid;
    }

    public void setClienteid(int clienteid) {
        this.clienteid = clienteid;
    }
    
}