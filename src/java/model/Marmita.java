package model;

public class Marmita extends Produto{
    
    private int numeroMarmita;
    private String grupoMarmita;

    public Marmita() {
    }

    public int getNumeroMarmita() {
        return numeroMarmita;
    }

    public void setNumeroMarmita(int numeroMarmita) {
        this.numeroMarmita = numeroMarmita;
    }

    public String getGrupoMarmita() {
        return grupoMarmita;
    }

    public void setGrupoMarmita(String grupoMarmita) {
        this.grupoMarmita = grupoMarmita;
    }
}
