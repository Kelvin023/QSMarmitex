package model;

import java.util.Date;

public class Despesa {
    private int cd_despesa;
    private int cd_tipo;
    private Float vl_despesa;
    private String ds_despesa;
    private Date dt_inclusion;
    private Float vlr_total_despesa;
    private int ano_despesa_particao;
    private int mes_despesa_particao;

    public int getCd_despesa() {
        return cd_despesa;
    }

    public void setCd_despesa(int cd_despesa) {
        this.cd_despesa = cd_despesa;
    }

    public int getCd_tipo() {
        return cd_tipo;
    }

    public void setCd_tipo(int cd_tipo) {
        this.cd_tipo = cd_tipo;
    }

    public Float getVl_despesa() {
        return vl_despesa;
    }

    public void setVl_despesa(Float vl_despesa) {
        this.vl_despesa = vl_despesa;
    }

    public Date getDt_inclusion() {
        return dt_inclusion;
    }

    public void setDt_inclusion(Date dt_inclusion) {
        this.dt_inclusion = dt_inclusion;
    }        

    public String getDs_despesa() {
        return ds_despesa;
    }

    public void setDs_despesa(String ds_despesa) {
        this.ds_despesa = ds_despesa;
    }

    public int getAno_despesa_particao() {
        return ano_despesa_particao;
    }

    public void setAno_despesa_particao(int ano_despesa_particao) {
        this.ano_despesa_particao = ano_despesa_particao;
    }

    public int getMes_despesa_particao() {
        return mes_despesa_particao;
    }

    public void setMes_despesa_particao(int mes_despesa_particao) {
        this.mes_despesa_particao = mes_despesa_particao;
    }

    public Float getVlr_total_despesa() {
        return vlr_total_despesa;
    }

    public void setVlr_total_despesa(Float vlr_total_despesa) {
        this.vlr_total_despesa = vlr_total_despesa;
    }
    
    
}
