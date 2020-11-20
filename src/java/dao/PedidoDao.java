package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.util.List;
import javax.swing.JOptionPane;
import model.Pedido;
import util.DbUtil;

public class PedidoDao {

 private final Connection connection;

    public PedidoDao() {
        connection = DbUtil.getConnection();
    }
    
    public void addPedido(Pedido pedido) {        
        System.out.println("Entrei na addPedido!!");
        System.out.println("CPF utilizado como FK para identificar quem está realizando o pedido: "+pedido.getCpf());
        try {
            String SQL = "INSERT INTO tb_pedido(cpf,qtd_marmita,valorPedido) VALUES"
                    + "(?, ?, ?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setString(1, pedido.getCpf());                
                ps.setInt(2, pedido.getQtd_marmita());
                ps.setFloat(3, pedido.getValorPedido());
                //ps.setDate(4, new java.sql.Date(pedido.getDt_pedido().getTime()));                
                ps.executeUpdate();
                ps.close();                
                System.out.println("Pedido adicionado com sucesso!");
            }            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Deu ruim o insert do pedido");
        }
    }
    
    //FAZER FUNCAO DE LISTAR PEDIDOS PRA O CLIENTE PODER VER QUAIS OS PEDIDOS DELE
    public List<Pedido> getPedidoByCpf(String cpf) {
        System.out.println("Entrei na getPedidoByCpf com o CPF: " + cpf);
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "select * from tb_pedido where cpf = ?";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setCd_numeroPedido(rs.getInt("cd_numeroPedido"));                
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));
                pedido.setValorPedido(rs.getFloat("valorPedido"));
                pedido.setDt_pedido(rs.getDate("dt_pedido"));                                                
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
}
