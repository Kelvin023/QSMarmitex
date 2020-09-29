package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.util.List;
import javax.swing.JOptionPane;
import model.User;
import util.DbUtil;

public class UserDao {

    private final Connection connection;

    public UserDao() {
        connection = DbUtil.getConnection();
    }

    public void addUser(User user) {
        System.out.println("Entrei na addUser!!");
        try {
            String SQL = "INSERT INTO tb_usuario(cpf,nomeUsuario,telefoneUsuario,endereco,email,dt_nascimento) VALUES"
                    + "(?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setString(1, user.getCpf());
                ps.setString(2, user.getNomeUsuario());
                ps.setString(3, user.getTelefoneUsuario());
                ps.setString(4, user.getEndereco());
                ps.setString(5, user.getEmail());
                ps.setDate(6, new java.sql.Date(user.getDt_nascimento().getTime()));
                ps.executeUpdate();
                ps.close();
                System.out.println("Usuario: " + user.getNomeUsuario() + " inserido com sucesso!");                
            }
            //connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(String cpf) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from tb_usuario where cpf=?");
            // Parameters start with 1            
            preparedStatement.setString(1, cpf);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        System.out.println("Entrei na updateUser!!");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update tb_usuario set nomeUsuario=?, telefoneUsuario=?, endereco=?, email=?, dt_nascimento=?" +
                            "where cpf=?");
            // Parameters start with 1
            preparedStatement.setString(1, user.getNomeUsuario());
            preparedStatement.setString(2, user.getTelefoneUsuario());
            preparedStatement.setString(3, user.getEndereco());
            preparedStatement.setString(4, user.getEmail());
            /*preparedStatement.setString(5, user.getSenha());*/
            preparedStatement.setDate(5, new java.sql.Date(user.getDt_nascimento().getTime()));            
            preparedStatement.setString(6, user.getCpf());
            System.out.println("CPF = " + user.getCpf());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Usuario atualizado com sucesso!");            

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar usuário!");
        }
    }

    public List<User> getAllUsers() {
        List<User> listaDeUsuario = new ArrayList<User>();
        try {
            String SQL = "select * from tb_usuario";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                User user = new User();
                user.setCpf(rs.getString("cpf"));
                user.setCd_perfilUsuario(rs.getInt("cd_perfilUsuario"));
                user.setNomeUsuario(rs.getString("nomeUsuario"));
                user.setTelefoneUsuario(rs.getString("telefoneUsuario"));
                user.setEndereco(rs.getString("endereco"));
                user.setEmail(rs.getString("email"));
                user.setSenha(rs.getString("senha"));
                user.setDt_nascimento(rs.getDate("dt_nascimento"));                                
                listaDeUsuario.add(user);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pessoas em UserDAO.", e);
        }   
        return listaDeUsuario;
    }

    public User getUserById(String cpf) {
        User usr = new User();
        try {                        
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_usuario where cpf=?");
            preparedStatement.setString(1, cpf);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                usr.setCpf(rs.getString("cpf"));
                usr.setCd_perfilUsuario(rs.getInt("cd_perfilUsuario"));
                usr.setNomeUsuario(rs.getString("nomeUsuario"));
                usr.setTelefoneUsuario(rs.getString("telefoneUsuario"));
                usr.setEndereco(rs.getString("endereco"));
                usr.setEmail(rs.getString("email"));
                usr.setSenha(rs.getString("senha"));
                usr.setDt_nascimento(rs.getDate("dt_nascimento"));                                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw  new RuntimeException("Erro ao buscar registro de usuário.");
        }        
        return usr;
    }
    
    public User checkLogin(String email, String senha){
        User user = new User();
        try {
            String SQL = "SELECT email, senha FROM tb_usuario WHERE email = ? AND senha = ?";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setString(1, email);
            ps.setString(2, senha);            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                user.setEmail(rs.getString("email"));
                user.setSenha(rs.getString("senha")); 
                System.out.println("USUARIO EXISTE!!!");
            }else{
                System.out.println("USUARIO NAO EXISTE! FAZER CADASTRO!");
            }            
            
        } catch (SQLException e) {
            throw new RuntimeException("Erro de SQL", e);            
        }                   
        return user;        
    }
    
    public boolean userExist(String cpf) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_usuario where cpf=?");
            preparedStatement.setString(1, cpf);
            ResultSet rs = preparedStatement.executeQuery();
                        
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}