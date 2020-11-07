package model;

import java.util.Date;

public class Cartao {
    private Integer cd_cartao;
    private String cpf;
    private String nomeTitular;
    private String numeroCartao;
    private Date dtValCartao;
    private String cvvCartao;

    public int getCd_cartao() {
        return cd_cartao;
    }

    public void setCd_cartao(int cd_cartao) {
        this.cd_cartao = cd_cartao;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNomeTitular() {
        return nomeTitular;
    }

    public void setNomeTitular(String nomeTitular) {
        this.nomeTitular = nomeTitular;
    }

    public String getNumeroCartao() {
        return numeroCartao;
    }

    public void setNumeroCartao(String numeroCartao) {
        this.numeroCartao = numeroCartao;
    }

    public Date getDtValCartao() {
        return dtValCartao;
    }

    public void setDtValCartao(Date dtValCartao) {
        this.dtValCartao = dtValCartao;
    }

    public String getCvvCartao() {
        return cvvCartao;
    }

    public void setCvvCartao(String cvvCartao) {
        this.cvvCartao = cvvCartao;
    }            
}
