package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "tb_marmita")
public class Marmita extends Produto{
    
    @Id
    @GeneratedValue
    @Column(name="cd_nr_marmita")
    private int numeroMarmita;
    @Column(name="cd_grupoMarmita")
    private int grupoMarmita;

    public Marmita() {
    }

    public int getNumeroMarmita() {
        return numeroMarmita;
    }

    public void setNumeroMarmita(int numeroMarmita) {
        this.numeroMarmita = numeroMarmita;
    }

    public int getGrupoMarmita() {
        return grupoMarmita;
    }

    public void setGrupoMarmita(int grupoMarmita) {
        this.grupoMarmita = grupoMarmita;
    }

    public void setFoto(String foto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void setNumeroMarmita(String ce_nr_marmita) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void setPreco(String preco) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void setStatusCardapio(String st_cardapio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        
    }

    @Override
    public int hashCode() {
        int hash = 5;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Marmita other = (Marmita) obj;
        if (this.numeroMarmita != other.numeroMarmita) {
            return false;
        }
        return true;
    }

    

       
}
