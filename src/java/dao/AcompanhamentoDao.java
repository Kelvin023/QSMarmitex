package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Acompanhamento;
import util.DbUtil;

public class AcompanhamentoDao {
     private final Connection connection;

    public AcompanhamentoDao() {
        connection = DbUtil.getConnection();
    }
    
    public void addAcompanhamento(Acompanhamento acompanhamento) {
        System.out.println("Entrei na addAcompanhamento!!");
        try {
            String SQL = "INSERT INTO tb_acompanhamento(nomeAcompanhamento,precoAcompanhamento) VALUES"
                    + "(?, ?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setString(1, acompanhamento.getNomeAcompanhamento());
                ps.setFloat(2, acompanhamento.getPrecoAcompanhamento());                
             
                ps.executeUpdate();
                ps.close();
                System.out.println("Acompanhamento " + acompanhamento.getNomeAcompanhamento() + " inserido com sucesso!");                
            }
            //connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     public void deleteAcompanhamento(int cd_acompanhamento) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from tb_acompanhamento where cd_acompanhamento=?");            
            preparedStatement.setInt(1, cd_acompanhamento);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
     public void updateAcompanhamento(Acompanhamento acompanhamento, String cd_acompanhamento) {
        System.out.println("Entrei na updateAcompanhamento!");
        try {
            PreparedStatement ps = connection
                    .prepareStatement("update tb_acompanhamento set nomeAcompanhamento=?, precoAcompanhamento=?"
                            + "where cd_acompanhamento=?");            
            ps.setString(1,acompanhamento.getNomeAcompanhamento());            
            ps.setFloat(2,acompanhamento.getPrecoAcompanhamento());
            ps.setString(3,cd_acompanhamento);            
            
            ps.executeUpdate();
            
            System.out.println("Número do acompanhamento a ser atualizado= " + cd_acompanhamento);
            System.out.println("Acompanhamento atualizada com sucesso!");
            
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar acompanhamento!");
        }
    }
      public List<Acompanhamento> getAllAcomps() {
        List<Acompanhamento> listaDeAcompanhamentos = new ArrayList<Acompanhamento>();
        try {
            String SQL = "select * from tb_acompanhamento";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Acompanhamento acompanhamento = new Acompanhamento();
                acompanhamento.setCd_acompanhamento(rs.getInt("cd_acompanhamento"));
                acompanhamento.setNomeAcompanhamento(rs.getString("nomeAcompanhamento"));
                acompanhamento.setPrecoAcompanhamento(rs.getFloat("precoAcompanhamento"));
                listaDeAcompanhamentos.add(acompanhamento);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar acompanhamentos em AcompanhamentoDAO.", e);
        }   
        return listaDeAcompanhamentos;
    }
      
    public Acompanhamento getAcompById(int cd_acompanhamento) {
        Acompanhamento acompanhamento = new Acompanhamento();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_acompanhamento where cd_acompanhamento=?");
            preparedStatement.setInt(1, cd_acompanhamento);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {                
                acompanhamento.setCd_acompanhamento(rs.getInt("cd_acompanhamento"));
                acompanhamento.setNomeAcompanhamento(rs.getString("nomeAcompanhamento"));                
                acompanhamento.setPrecoAcompanhamento(rs.getFloat("precoAcompanhamento"));                                                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao buscar registro de acompanhamento solicitado.");
        }
        return acompanhamento;
    }
    
    public boolean acompExist(String cd_acompanhamento) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_acompanhamento where cd_acompanhamento=?");
            preparedStatement.setString(1, cd_acompanhamento);
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