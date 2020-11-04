package model;

import java.util.Date;

public class Pedido {
    private int cd_numeroPedido;
    private String cpf;
    private int qtd_marmita;
    private int valorPedido;
    private Date dt_pedido;

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

    public int getValorPedido() {
        return valorPedido;
    }

    public void setValorPedido(int valorPedido) {
        this.valorPedido = valorPedido;
    }

    public Date getDt_pedido() {
        return dt_pedido;
    }

    public void setDt_pedido(Date dt_pedido) {
        this.dt_pedido = dt_pedido;
    }       
}