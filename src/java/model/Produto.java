package model;

import java.sql.Blob;
import javax.persistence.Column;

public abstract class Produto {
    
    private String nomeProduto;
    @Column(name="cd_tamanho")
    private int tamanho;
    private short preco;
    @Column(name="ds_ingredientes")
    private String ingredientes;
    private Blob foto;
    @Column(name="st_cardapio")
    private boolean statusCardapio;

    public Produto() {
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public int getTamanho() {
        return tamanho;
    }

    public void setTamanho(int tamanho) {
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
