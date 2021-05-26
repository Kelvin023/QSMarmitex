package model;

import java.util.Date;

public class Marmita {
    private int cd_nr_marmita;    
    private String ds_ingredientes;
    private Float preco;
    private String nomeMarmita;
    private int st_cardapio;       

    public int getCd_nr_marmita() {
        return cd_nr_marmita;
    }

    public void setCd_nr_marmita(int cd_nr_marmita) {
        this.cd_nr_marmita = cd_nr_marmita;
    }

    public String getDs_ingredientes() {
        return ds_ingredientes;
    }

    public void setDs_ingredientes(String ds_ingredientes) {
        this.ds_ingredientes = ds_ingredientes;
    }

    public Float getPreco() {
        return preco;
    }

    public void setPreco(Float preco) {
        this.preco = preco;
    }

    public String getNomeMarmita() {
        return nomeMarmita;
    }

    public void setNomeMarmita(String nomeMarmita) {
        this.nomeMarmita = nomeMarmita;
    }

    public int getSt_cardapio() {
        return st_cardapio;
    }

    public void setSt_cardapio(int st_cardapio) {
        this.st_cardapio = st_cardapio;
    }
}