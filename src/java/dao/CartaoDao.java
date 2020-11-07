package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.util.List;
import javax.swing.JOptionPane;
import model.Cartao;
import util.DbUtil;

public class CartaoDao {
     private final Connection connection;
     
     public CartaoDao() {
        connection = DbUtil.getConnection();
    }
    
     
     public void addCartao(Cartao cartao) {
        System.out.println("Entrei na addCartao!!");
        try {
            String SQL = "INSERT INTO tb_cartao(cpf,nomeTitular,numeroCartao,dtValCartao,cvvCartao) VALUES"
                    + "(?, ?, ?, ?, ?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setString(1, cartao.getCpf());                
                ps.setString(2, cartao.getNomeTitular());
                ps.setString(3, cartao.getNumeroCartao());
                ps.setDate(4, new java.sql.Date(cartao.getDtValCartao().getTime()));
                ps.setString(5, cartao.getCvvCartao());                
                ps.executeUpdate();
                ps.close();                
            }
            //connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
    public void deleteCartao(int cd_cartao) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from tb_cartao where cd_cartao=?");            
            preparedStatement.setInt(1, cd_cartao);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateCartao(Cartao cartao) {
        System.out.println("Entrei na updateCartao!!");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update tb_cartao set nomeTitular=?, numeroCartao=?, dtValCartao=?, cvvCartao=?" +
                            "where cd_cartao=?");            
            preparedStatement.setString(1, cartao.getNomeTitular());
            preparedStatement.setString(2, cartao.getNumeroCartao());
            preparedStatement.setDate(3, new java.sql.Date(cartao.getDtValCartao().getTime()));            
            preparedStatement.setString(4, cartao.getCvvCartao());                        
            preparedStatement.setInt(5, cartao.getCd_cartao());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Cartao atualizado com sucesso!");            

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar o cartão!");
        }
    }
    
    public List<Cartao> getAllCartoes() {
        List<Cartao> listaDeCartoes = new ArrayList<Cartao>();
        try {
            String SQL = "select * from tb_cartao";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Cartao cartao = new Cartao();
                cartao.setCd_cartao(rs.getInt("cd_cartao"));
                cartao.setCpf(rs.getString("cpf"));
                cartao.setNomeTitular(rs.getString("nomeTitular"));
                cartao.setNumeroCartao(rs.getString("numeroCartao"));
                cartao.setDtValCartao(rs.getDate("dtValCartao"));                                
                cartao.setCvvCartao(rs.getString("cvvCartao"));                
                listaDeCartoes.add(cartao);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pessoas em UserDAO.", e);
        }   
        return listaDeCartoes;
    }
    
    public List<Cartao> getCartaoByCpf(String cpf) {
        List<Cartao> listaDeCartoes = new ArrayList<Cartao>();
        try {
            String SQL = "select * from tb_cartao where cpf = ?";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                Cartao cartao = new Cartao();
                cartao.setCd_cartao(rs.getInt("cd_cartao"));                
                cartao.setNomeTitular(rs.getString("nomeTitular"));
                cartao.setNumeroCartao(rs.getString("numeroCartao"));
                cartao.setDtValCartao(rs.getDate("dtValCartao"));                                
                cartao.setCvvCartao(rs.getString("cvvCartao"));                
                listaDeCartoes.add(cartao);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pessoas em UserDAO.", e);
        }   
        return listaDeCartoes;
    }
    
    /**/
    public boolean cartaoExist(Integer  cd_cartao) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_cartao where cd_cartao=?");
            preparedStatement.setInt(1, cd_cartao);
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
