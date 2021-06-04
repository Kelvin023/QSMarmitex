package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Acompanhamento;
import model.Despesa;
import util.DbUtil;

public class DespesaDao {
     private final Connection connection;

    public DespesaDao() {
        connection = DbUtil.getConnection();
    }
    
    public void addDespesa(Despesa despesa, int cd_tipo) {
        System.out.println("Entrei na addDespesa!!");
        try {
            String SQL = "INSERT INTO tb_despesa(vl_despesa, ds_despesa, cd_tipo) VALUES"
                    + "(?, ? , ?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setFloat(1, despesa.getVl_despesa());                
                ps.setString(2, despesa.getDs_despesa());                
                ps.setInt(3, cd_tipo);
             
                ps.executeUpdate();
                ps.close();
                System.out.println("Despesa " + despesa.getCd_tipo()+ " inserida com sucesso!");                
            }
            //connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Falha ao adicionar a despesa");
        }
    }
    
     public void deleteDespesa(int cd_despesa) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from tb_despesa where cd_despesa=?");            
            preparedStatement.setInt(1, cd_despesa);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
     public void updateDespesa(Despesa despesa, String cd_despesa) {
        System.out.println("Entrei na updateDespesa!");
        try {
            PreparedStatement ps = connection
                    .prepareStatement("update tb_despesa set vl_despesa=?, ds_despesa =?"
                            + "where cd_despesa=?");            
            ps.setFloat(1,despesa.getVl_despesa());            
            ps.setString(2,despesa.getDs_despesa());            
            ps.setString(3,cd_despesa);
            
            ps.executeUpdate();
            
            System.out.println("Número da Despesa a ser atualizado= " + cd_despesa);
            System.out.println("Despesa atualizada com sucesso!");
            
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar despesa!");
        }
    }
      public List<Despesa> getAllDespesas() {
        List<Despesa> listaDeDespesas = new ArrayList<Despesa>();
        try {
            String SQL = "select * from tb_despesa";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Despesa despesa = new Despesa();
                despesa.setCd_despesa(rs.getInt("cd_despesa"));
                despesa.setCd_tipo(rs.getInt("cd_tipo"));
                despesa.setVl_despesa(rs.getFloat("vl_despesa"));
                despesa.setDs_despesa(rs.getString("ds_despesa"));
                despesa.setDt_inclusion(rs.getDate("dt_inclusion"));
                listaDeDespesas.add(despesa);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar despesas em DespesaDAO.", e);
        }   
        return listaDeDespesas;
    }
      
    public Despesa getDespesaById(int cd_despesa) {
        Despesa despesa = new Despesa();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_despesa where cd_despesa=?");
            preparedStatement.setInt(1, cd_despesa);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {                
                despesa.setCd_despesa(rs.getInt("cd_despesa"));
                despesa.setCd_tipo(rs.getInt("cd_tipo"));                
                despesa.setVl_despesa(rs.getFloat("vl_despesa"));  
                despesa.setDs_despesa(rs.getString("ds_despesa"));
                despesa.setDt_inclusion(rs.getDate("dt_inclusion"));  
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao buscar registro da despesa solicitada.");
        }
        return despesa;
    }
    
    public boolean despesaExist(String cd_despesa) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_despesa where cd_despesa=?");
            preparedStatement.setString(1, cd_despesa);
            ResultSet rs = preparedStatement.executeQuery();
                        
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro de SQL.", e);
        }
        return false;
    }
}