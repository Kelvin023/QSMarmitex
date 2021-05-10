package model;
import java.util.Date;

public class Pedido {
    private int cd_numeroPedido;
    private String cpf;
    private int qtd_marmita;
    private Float valorPedido;
    private Date dt_pedido;
    private int st_pedido;   
    private int cd_marmita;
    private String nomeUsuario;
    private String endereco;
    private Float vlr_total_pedido;
    private int ano_particao;
    private int mes_particao;

    public int getCd_numeroPedido() {
        return cd_numeroPedido;
    }

    public void setCd_numeroPedido(int cd_numeroPedido) {
        this.cd_numeroPedido = cd_numeroPedido;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getQtd_marmita() {
        return qtd_marmita;
    }

    public void setQtd_marmita(int qtd_marmita) {
        this.qtd_marmita = qtd_marmita;
    }

    public Float getValorPedido() {
        return valorPedido;
    }

    public void setValorPedido(Float valorPedido) {
        this.valorPedido = valorPedido;
    }                  

    public int getSt_pedido() {
        return st_pedido;
    }

    public void setSt_pedido(int st_pedido) {
        this.st_pedido = st_pedido;
    }

    public Date getDt_pedido() {
        return dt_pedido;
    }

    public void setDt_pedido(Date dt_pedido) {
        this.dt_pedido = dt_pedido;
    }       

    public int getCd_marmita() {
        return cd_marmita;
    }

    public void setCd_marmita(int cd_marmita) {
        this.cd_marmita = cd_marmita;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getAno_particao() {
        return ano_particao;
    }

    public void setAno_particao(int ano_particao) {
        this.ano_particao = ano_particao;
    }

    public int getMes_particao() {
        return mes_particao;
    }

    public void setMes_particao(int mes_particao) {
        this.mes_particao = mes_particao;
    }

    public Float getVlr_total_pedido() {
        return vlr_total_pedido;
    }

    public void setVlr_total_pedido(Float vlr_total_pedido) {
        this.vlr_total_pedido = vlr_total_pedido;
    }
    
    
    
    
}