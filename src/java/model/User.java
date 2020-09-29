package model;

import java.util.Date;

public class User {
    private String cpf;
    private int cd_perfilUsuario;
    private String nomeUsuario;
    private String telefoneUsuario;
    private String endereco;
    private String email;
    private String senha;
    private Date dt_nascimento;
    
    
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getCd_perfilUsuario() {
        return cd_perfilUsuario;
    }

    public void setCd_perfilUsuario(int cd_perfilUsuario) {
        this.cd_perfilUsuario = cd_perfilUsuario;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getTelefoneUsuario() {
        return telefoneUsuario;
    }

    public void setTelefoneUsuario(String telefoneUsuario) {
        this.telefoneUsuario = telefoneUsuario;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Date getDt_nascimento() {
        return dt_nascimento;
    }

    public void setDt_nascimento(Date dt_nascimento) {
        this.dt_nascimento = dt_nascimento;
    }
    
    @Override
    public String toString() {
        return "User [cpf=" + cpf + ", cd_perfilUsuario=" + cd_perfilUsuario
                + ", nomeUsuario=" + nomeUsuario + ", telefoneUsuario=" + telefoneUsuario + ", endereco="
                + endereco + ", email=" + email + ", senha=" + senha + ", dt_nascimento=" + dt_nascimento + "]";
    }    
}