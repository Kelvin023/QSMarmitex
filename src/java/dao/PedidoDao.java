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
    
    public void addPedido(Pedido pedido, String cd_marmita) {        
        System.out.println("Entrei na addPedido!!");
        System.out.println("CPF utilizado como FK para identificar quem está realizando o pedido: "+pedido.getCpf());
        System.out.println("Codigo da marmita do pedido -> " + cd_marmita);
        int cod_marmita = Integer.parseInt(cd_marmita);                      
        System.out.println("Dobro do codigo da marmita do pedido, porem do tipo Integer(pra provar que eh integer) -> " + cod_marmita*2);
        try {
            String SQL = "INSERT INTO tb_pedido(cpf,qtd_marmita,valorPedido, st_pedido, cd_marmita) VALUES"
                    + "(?, ?, ?, 0, " + cod_marmita + ")";
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
    
    
    public Pedido checkClienteTemPedido(String cpf) {
        System.out.println("Entrei na checkClienteTemPedido com o CPF: " + cpf);
        Pedido pedido = new Pedido();
        try {                        
            PreparedStatement preparedStatement = connection.prepareStatement("select distinct \n" +
            "	cpf \n" +
            "from tb_pedido \n" +
            "where cpf in (SELECT distinct cpf FROM tb_pedido) and \n" +
            "cpf = ?;");
            preparedStatement.setString(1, cpf);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                pedido.setCpf(rs.getString("cpf"));                                            
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw  new RuntimeException("Erro ao buscar registro do CPF.");
        }        
        return pedido;
    }
    
    
    
    //FUNCAO DE LISTAR PEDIDOS PRA O CLIENTE PODER VER QUAIS OS PEDIDOS DELE
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
                pedido.setCd_marmita(rs.getInt("cd_marmita")); 
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
            String SQL = "SELECT \n" +
                "    p.cd_numeroPedido,\n" +
                "    p.cpf,\n" +
                "    p.qtd_marmita,\n" +                
                "    p.valorPedido,\n" +
                "    p.dt_pedido,\n" +
                "    p.st_pedido,\n" +
                "    p.cd_marmita,\n" +
                "    u.nomeUsuario\n" +                
                "FROM tb_pedido as p\n" +
                "left join tb_usuario as u\n" +
                "on p.cpf = u.cpf;";
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
                pedido.setCd_marmita(rs.getInt("cd_marmita"));
                pedido.setNomeUsuario(rs.getString("nomeUsuario"));
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
    //MÉTODO PARA CAPTURAR A MARMITA MAIS VENDIDA
    public List<Pedido> getMarmitaMaisVendida() {
        System.out.println("Entrei na getMarmitaMaisVendida!!");
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "SELECT \n" +
                        "*\n" +
                        "FROM\n" +
                        "(\n" +
                        "    Select \n" +
                        "        cd_marmita,        \n" +
                        "        SUM(qtd_marmita) AS qtd_marmita \n" +
                        "    FROM tb_pedido \n" +
                        "    GROUP BY cd_marmita    \n" +
                        ")AS X\n" +
                        "ORDER BY qtd_marmita DESC\n" +
                        "limit 1;";
            PreparedStatement ps = connection.prepareStatement(SQL);            
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();                
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));                
                pedido.setCd_marmita(rs.getInt("cd_marmita"));
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
    //MÉTODO PARA CAPTURAR A MARMITA MENOS VENDIDA
    public List<Pedido> getMarmitaMenosVendida() {
        System.out.println("Entrei na getMarmitaMenosVendida!!");
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "SELECT \n" +
                        "*\n" +
                        "FROM\n" +
                        "(\n" +
                        "    Select \n" +
                        "        cd_marmita,        \n" +
                        "        SUM(qtd_marmita) AS qtd_marmita \n" +
                        "    FROM tb_pedido \n" +
                        "    GROUP BY cd_marmita    \n" +
                        ")AS X\n" +
                        "ORDER BY qtd_marmita asc\n" +
                        "limit 1;";
            PreparedStatement ps = connection.prepareStatement(SQL);            
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();                
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));                
                pedido.setCd_marmita(rs.getInt("cd_marmita"));
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
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
            String SQL = "SELECT \n" +
                "    p.cd_numeroPedido,\n" +
                "    p.cpf,\n" +
                "    p.qtd_marmita,\n" +                
                "    p.valorPedido,\n" +
                "    p.dt_pedido,\n" +
                "    p.st_pedido,\n" +
                "    p.cd_marmita,\n" +
                "    u.nomeUsuario\n" +                
                "FROM tb_pedido as p\n" +
                "inner join tb_usuario as u\n" +
                "on p.cpf = u.cpf\n" +
                "where st_pedido = 0;";
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
                pedido.setCd_marmita(rs.getInt("cd_marmita"));
                pedido.setNomeUsuario(rs.getString("nomeUsuario"));
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
            //String SQL = "select * from tb_pedido where st_pedido = 1";
            String SQL = "SELECT \n" +
                "    p.cd_numeroPedido,\n" +
                "    p.cpf,\n" +
                "    p.qtd_marmita,\n" +                
                "    p.valorPedido,\n" +
                "    p.dt_pedido,\n" +
                "    p.st_pedido,\n" +
                "    p.cd_marmita,\n" +
                "    u.nomeUsuario,\n" +
                "    u.endereco\n" +
                "FROM tb_pedido as p\n" +
                "inner join tb_usuario as u\n" +
                "on p.cpf = u.cpf\n" +
                "where st_pedido = 1;";
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
                pedido.setCd_marmita(rs.getInt("cd_marmita"));
                pedido.setNomeUsuario(rs.getString("nomeUsuario"));
                pedido.setEndereco(rs.getString("endereco"));
                listaPedidosEntrega.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaPedidosEntrega;
    }
    
    
    
    // MÉTODO PARA CAPTURAR OS PEDIDOS POR PERIODO: DT_INICIO E DT_FIM
    public List<Pedido> getAllPedidosByPeriodo(String dtinicio, String dtfim) {
        System.out.println("Entrei na getAllPedidosByPeriodo!!");
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "SELECT \n" +
                        "    p.cd_numeroPedido,\n" +
                        "    p.cpf,\n" +
                        "    p.qtd_marmita,\n" +                
                        "    p.valorPedido,\n" +
                        "    p.dt_pedido,\n" +
                        "    p.st_pedido,\n" +
                        "    p.cd_marmita,\n" +
                        "    u.nomeUsuario\n" +                
                        "FROM tb_pedido as p\n" +
                        "left join tb_usuario as u\n" +
                        "on p.cpf = u.cpf\n" +
                        "where DATE(dt_pedido) between ? and ?";
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
                pedido.setNomeUsuario(rs.getString("nomeUsuario"));
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
    // MÉTODO PARA CAPTURAR OS PEDIDOS POR PERIODO: DT_INICIO E DT_FIM
    public List<Pedido> getallPedidosByStatus(String status) {
        System.out.println("Entrei na getallPedidosByStatus!!");
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "SELECT \n" +
                        "    p.cd_numeroPedido,\n" +
                        "    p.cpf,\n" +
                        "    p.qtd_marmita,\n" +                
                        "    p.valorPedido,\n" +
                        "    p.dt_pedido,\n" +
                        "    p.st_pedido,\n" +
                        "    p.cd_marmita,\n" +
                        "    u.nomeUsuario\n" +                
                        "FROM tb_pedido as p\n" +
                        "left join tb_usuario as u\n" +
                        "on p.cpf = u.cpf\n" +
                        "where p.st_pedido = ?";
            PreparedStatement ps = connection.prepareStatement(SQL);            
            ps.setString(1, status);            
            System.out.println("Status dentro da getallPedidosByStatus: " + status);            
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setCd_numeroPedido(rs.getInt("cd_numeroPedido")); 
                pedido.setCpf(rs.getString("cpf"));
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));
                pedido.setValorPedido(rs.getFloat("valorPedido"));
                pedido.setDt_pedido(rs.getDate("dt_pedido"));
                pedido.setSt_pedido(rs.getInt("st_pedido"));  
                pedido.setNomeUsuario(rs.getString("nomeUsuario"));
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
    
    // MÉTODO PARA CAPTURAR OS PEDIDOS POR PERIODO: DT_INICIO E DT_FIM
    public List<Pedido> getallPedidosByStatusandPeriodo(String status, String dtinicio, String dtfim) {
        System.out.println("Entrei na getallPedidosByStatusandPeriodo!!");
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "SELECT \n" +
                    "	 p.cd_numeroPedido,\n" +
                    "    p.cpf,    \n" +
                    "    u.nomeUsuario,\n" +
                    "    p.qtd_marmita, \n" +
                    "    p.cd_marmita,\n" +
                    "    p.valorPedido,\n" +
                    "    p.dt_pedido,\n" +
                    "    p.st_pedido   \n" +
                    "FROM tb_pedido as p\n" +
                    "left join tb_usuario as u\n" +
                    "on p.cpf = u.cpf\n" +
                    "where p.st_pedido = ? and \n" +
                    "DATE(p.dt_pedido) between ? and ?;";
            PreparedStatement ps = connection.prepareStatement(SQL);            
            ps.setString(1, status);            
            ps.setString(2, dtinicio);            
            ps.setString(3, dtfim);            
            
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setCd_numeroPedido(rs.getInt("cd_numeroPedido")); 
                pedido.setCpf(rs.getString("cpf"));
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));
                pedido.setValorPedido(rs.getFloat("valorPedido"));
                pedido.setDt_pedido(rs.getDate("dt_pedido"));
                pedido.setSt_pedido(rs.getInt("st_pedido"));  
                pedido.setNomeUsuario(rs.getString("nomeUsuario"));
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
    /*FUNCAO DE LISTAR O ÚLTIMO PEDIDO REGISTRADO DO CLIENTE, 
    O QUAL ESTÁ PRESTES A REALIZAR O PAGAMENTO(ESSES DADOS SERÃO MOSTRADOS NA TELA DE PGMT)*/
    public List<Pedido> getPedidoPgmtByCpf(String cpf) {
        System.out.println("Entrei na getPedidoPgmtByCpf com o CPF: " + cpf);
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "select\n" +
            "	 cd_numeroPedido,\n" +
            "    cd_marmita,\n" +
            "    qtd_marmita,\n" +
            "    dt_pedido,\n" +
            "    valorPedido\n" +
            "from tb_pedido\n" +
            "where cd_numeroPedido in (select max(cd_numeroPedido) from tb_pedido) and\n" +
            "cpf = ?";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setCd_numeroPedido(rs.getInt("cd_numeroPedido"));                
                pedido.setCd_marmita(rs.getInt("cd_marmita")); 
                pedido.setQtd_marmita(rs.getInt("qtd_marmita"));
                pedido.setDt_pedido(rs.getDate("dt_pedido"));
                pedido.setValorPedido(rs.getFloat("valorPedido"));                                
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }  
    
    //TOTAL FATURADO POR PERIODO
    public List<Pedido> getTotalFaturadoByPeriodo() {
        System.out.println("Entrei na getTotalFaturadoByPeriodo");
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        try {
            String SQL = "SELECT \n" +
                    "	sum((qtd_marmita*valorPedido)) as vlr_total_pedido,    \n" +
                    "    month(dt_pedido) as mes,\n" +
                    "    year(dt_pedido) as ano\n" +
                    "FROM tb_pedido\n" +
                    "group by mes, ano\n" +
                    "order by ano, mes;";
            PreparedStatement ps = connection.prepareStatement(SQL);            
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setVlr_total_pedido(rs.getFloat("vlr_total_pedido"));                
                pedido.setAno_particao(rs.getInt("ano"));                
                pedido.setMes_particao(rs.getInt("mes"));                
                
                listaDePedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
    
    /*DESLIGA A FK PARA DELEÇÃO DO USUARIO COM PEDIDOS FEITOS*/
    public void desligaFK() {        
        System.out.println("Entrei na desligaFK!!");                
        try {
            String SQL = "ALTER TABLE qsmarmitex.tb_pedido\n" +
                         "DROP foreign key FK_TB_USR_TB_PEDIDO;";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {                              
                ps.execute(SQL);
                ps.close();                
                System.out.println("FK desligada com sucesso!");
            }            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Deu ruim o desligamento da FK");
        }
    }
    
    
    //ATUALIZAÇÃO DO VALOR DA ANTIGA FK, CUJO VALOR "PAI" SERÁ DROPADO DA TABELA PAI
    public void updatePedidosClienteExcluido(String cpf) {
        System.out.println("Entrei na updatePedidosClienteExcluido!!");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update qsmarmitex.tb_pedido\n" +
                                      "set cpf = null\n" +
                                      "where cpf = ?;");            
            preparedStatement.setString(1, cpf);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Valor FK setado para NULL com sucesso!");            

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar o valor do CPF!");
        }
    }
    
    /*RELIGANDO CONSTRAINT A FK APÓS A DELEÇÃO DO REGISTRO PAI*/
    public void ligaFK() {        
        System.out.println("Entrei na ligaFK!!");                
        try {
            String SQL = "ALTER TABLE qsmarmitex.tb_pedido\n" +
                     "    ADD CONSTRAINT FK_TB_USR_TB_PEDIDO FOREIGN KEY (cpf)\n" +
                     "    REFERENCES qsmarmitex.tb_usuario(cpf);";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {                              
                ps.execute(SQL);
                ps.close();                
                System.out.println("FK ligada com sucesso!");
            }            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Deu ruim o ligamento da FK");
        }
    }
}
