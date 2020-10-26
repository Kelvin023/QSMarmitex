package model;

import java.sql.Blob;

public abstract class Produto {
    
    private String nomeProduto;
    private String tamanho;
    private short preco;
    private String ingredientes;
    private Blob foto;
    private boolean statusCardapio;

    public Produto() {
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public short getPreco() {
        return preco;
    }

    public void setPreco(short preco) {
        this.preco = preco;
    }

    public String getIngredientes() {
        return ingredientes;
    }
   
    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }
    
    public Blob getFoto() {
        return foto;
    }

    public void setFoto(Blob foto) {
        this.foto = foto;
    }

    public boolean isStatusCardapio() {
        return statusCardapio;
    }

    public void setStatusCardapio(boolean statusCardapio) {
        this.statusCardapio = statusCardapio;
    }
    
    
}
