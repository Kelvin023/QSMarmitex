package model;

import java.util.Date;

public class Despesa {
    private int cd_despesa;
    private int cd_tipo;
    private Float vl_despesa;
    private Date dt_inclusion;

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
}
