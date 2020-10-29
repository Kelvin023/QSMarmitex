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
        System.out.println("Entrei na addUser!!");
        try {
            String SQL = "INSERT INTO tb_acompanhamento(nomeAcompanhamento,precoAcompanhamento,cd_tamanho,foto) VALUES"
                    + "(?, ?, ?, ?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setString(1, acompanhamento.getNomeAcompanhamento());
                ps.setDouble(2, acompanhamento.getPrecoAcompanhemento());
                ps.setString(3, acompanhamento.getTamanho());
                ps.setBlob(4, acompanhamento.getFoto());
             
                ps.executeUpdate();
                ps.close();
                System.out.println("Acompanhamento " + acompanhamento.getNomeAcompanhamento() + " inserido com sucesso!");                
            }
            //connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     public void deleteAcompanhamento(String nomeAcompanhamento) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from tb_acompanhamento where nomeAcompanhamento=?");            
            preparedStatement.setString(1, nomeAcompanhamento);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
     public void updateAcompanhamento(Acompanhamento acompanhamento) {
        System.out.println("Entrei na updateAcompanhamento!!");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update tb_acompanhamento set nomeAcompnhamento=?, cd_tamanho=?, precoAcompanhamento=?, foto=?" +
                            "where nomeAcompanhamento=?");            
            preparedStatement.setString(1, acompanhamento.getNomeAcompanhamento());
            preparedStatement.setString(2, acompanhamento.getTamanho());
            preparedStatement.setDouble(3, acompanhamento.getPrecoAcompanhemento());
            preparedStatement.setBlob(4, acompanhamento.getFoto());                   
            System.out.println("Nome do Acompanhamento = " + acompanhamento.getNomeAcompanhamento());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Acompanhamento atualizada com sucesso!");            

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar acompanhamento!");
        }
    }
      public List<Acompanhamento> getAllUsers() {
        List<Acompanhamento> listaDeAcompanhamentos = new ArrayList<Acompanhamento>();
        try {
            String SQL = "select * from tb_acompanhamento";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Acompanhamento acompanhamento = new Acompanhamento();
                acompanhamento.setNomeAcompanhamento(rs.getString("nomeAcompanhamento"));
                acompanhamento.setTamanho(rs.getString("cd_tamanho"));
                acompanhamento.setPrecoAcompanhemento(rs.getDouble("precoAcompanhamento"));
                acompanhamento.setFoto(rs.getBlob("foto"));
                listaDeAcompanhamentos.add(acompanhamento);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar acompanhamentos em AcompanhamentoDAO.", e);
        }   
        return listaDeAcompanhamentos;
    }
}
    
}
