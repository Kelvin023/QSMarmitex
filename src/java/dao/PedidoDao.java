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
                pedido.setSt_pedido(rs.getInt("st_pedido"));                
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
    //LISTAR TODOS OS PEDIDOS PARA QUE O ADM POSSA VISUALIZAR TODOS ESSES PEDIDOS 
    public List<Pedido> getAllPedidos() {
        System.out.println("Entrei na getAllPedidos!!");
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "select * from tb_pedido";
            PreparedStatement ps = connection.prepareStatement(SQL);            
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setCd_numeroPedido(rs.getInt("cd_numeroPedido")); 
                pedido.setCpf(rs.getString("cpf"));
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));
                pedido.setValorPedido(rs.getFloat("valorPedido"));
                pedido.setDt_pedido(rs.getDate("dt_pedido"));
                pedido.setSt_pedido(rs.getInt("st_pedido"));                
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    //FAZER MÉTODO PARA CAPTURAR A MARMITA MAIS VENDIDA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    //ATUALIZA O STATUS DO PEDIDO DA TELA DO COZINHEIRO
    public void updateSttsPedidoProd(String cd_numeroPedido) {
        System.out.println("Entrei na updateSttsPedidoProd!!");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update tb_pedido set st_pedido = 1 where cd_numeroPedido = ?");            
            preparedStatement.setString(1, cd_numeroPedido);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Status do pedido atualizado com sucesso!");            

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar usuário!");
        }
    }
    
    //ATUALIZA O STATUS DO PEDIDO DA TELA DO ENTREGADOR
    public void updateSttsPedidoEntrega(String cd_numeroPedido) {
        System.out.println("Entrei na updateSttsPedidoEntrega!!");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update tb_pedido set st_pedido = 2 where cd_numeroPedido = ?");            
            preparedStatement.setString(1, cd_numeroPedido);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Status do pedido atualizado com sucesso!");            

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar usuário!");
        }
    }
    
    //LISTA TODOS OS PEDIDOS EM PRODUÇÃO, PARA QUE O COZINHEIRO POSSA FAZER ESSAS MARMITAS 
    public List<Pedido> getAllPedidosProd() {
        System.out.println("Entrei na getAllPedidosProd!!");
        List<Pedido> listaPedidosProd = new ArrayList<Pedido>();
        try {
            String SQL = "select * from tb_pedido where st_pedido = 0";
            PreparedStatement ps = connection.prepareStatement(SQL);                        
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setCd_numeroPedido(rs.getInt("cd_numeroPedido")); 
                pedido.setCpf(rs.getString("cpf"));
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));
                pedido.setValorPedido(rs.getFloat("valorPedido"));
                pedido.setDt_pedido(rs.getDate("dt_pedido"));
                pedido.setSt_pedido(rs.getInt("st_pedido"));                
                listaPedidosProd.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaPedidosProd;
    }
    
    //LISTA TODOS OS PEDIDOS EM TRANSPORTE, PARA QUE O ENTREGADOR POSSA FAZER OS DELIVERYS
    public List<Pedido> getAllPedidosEntrega() {
        System.out.println("Entrei na getAllPedidosEntrega!!");
        List<Pedido> listaPedidosEntrega = new ArrayList<Pedido>();
        try {
            String SQL = "select * from tb_pedido where st_pedido = 1";
            PreparedStatement ps = connection.prepareStatement(SQL);                        
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setCd_numeroPedido(rs.getInt("cd_numeroPedido")); 
                pedido.setCpf(rs.getString("cpf"));
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));
                pedido.setValorPedido(rs.getFloat("valorPedido"));
                pedido.setDt_pedido(rs.getDate("dt_pedido"));
                pedido.setSt_pedido(rs.getInt("st_pedido"));                
                listaPedidosEntrega.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaPedidosEntrega;
    }
    
    
    
    //FAZER MÉTODO PARA CAPTURAR OS PEDIDOS POR PERIODO: DT_INICIO E DT_FIM
    public List<Pedido> getAllPedidosByPeriodo(String dtinicio, String dtfim) {
        System.out.println("Entrei na getAllPedidosByPeriodo!!");
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "select * from tb_pedido where DATE(dt_pedido) between ? and ?";
            PreparedStatement ps = connection.prepareStatement(SQL);            
            ps.setString(1, dtinicio);
            ps.setString(2, dtfim);
            System.out.println("Data de inicio do periodo dentro da getAllPedidosByPeriodo: " + dtinicio);
            System.out.println("Data de fim do periodo dentro da getAllPedidosByPeriodo: " + dtfim);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setCd_numeroPedido(rs.getInt("cd_numeroPedido")); 
                pedido.setCpf(rs.getString("cpf"));
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));
                pedido.setValorPedido(rs.getFloat("valorPedido"));
                pedido.setDt_pedido(rs.getDate("dt_pedido"));
                pedido.setSt_pedido(rs.getInt("st_pedido"));                
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
}
