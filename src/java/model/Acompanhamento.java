package model;

public class Acompanhamento {
     private String nomeAcompanhamento;
    private String tamanho;
    private double precoAcompanhemento;
    private Blob foto;

    public String getNomeAcompanhamento() {
        return nomeAcompanhamento;
    }

    public void setNomeAcompanhamento(String nomeAcompanhamento) {
        this.nomeAcompanhamento = nomeAcompanhamento;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public double getPrecoAcompanhemento() {
        return precoAcompanhemento;
    }

    public void setPrecoAcompanhemento(double precoAcompanhemento) {
        this.precoAcompanhemento = precoAcompanhemento;
    }
    
    public Blob getFoto() {
        return foto;
    }

    public void setFoto(Blob foto) {
        this.foto = foto;
    }
}
