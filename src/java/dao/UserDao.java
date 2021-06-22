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
            String SQL = "INSERT INTO tb_usuario(cpf,cd_perfilUsuario,nomeUsuario,telefoneUsuario,endereco,email,senha,dt_nascimento) VALUES"
                    + "(?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setString(1, user.getCpf());
                ps.setInt(2, user.getCd_perfilUsuario());
                ps.setString(3, user.getNomeUsuario());
                ps.setString(4, user.getTelefoneUsuario());
                ps.setString(5, user.getEndereco());
                ps.setString(6, user.getEmail());
                ps.setString(7, user.getSenha());
                ps.setDate(8, new java.sql.Date(user.getDt_nascimento().getTime()));
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
                    .prepareStatement("update tb_usuario set nomeUsuario=?, telefoneUsuario=?, endereco=?, email=?, dt_nascimento=?, senha=?" +
                            "where cpf=?");            
            preparedStatement.setString(1, user.getNomeUsuario());
            preparedStatement.setString(2, user.getTelefoneUsuario());
            preparedStatement.setString(3, user.getEndereco());
            preparedStatement.setString(4, user.getEmail());            
            preparedStatement.setDate(5, new java.sql.Date(user.getDt_nascimento().getTime()));            
            preparedStatement.setString(6, user.getSenha());
            preparedStatement.setString(7, user.getCpf());
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
            String SQL = "select * from tb_usuario order by cd_perfilUsuario";
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
            String SQL = "SELECT email, senha, cpf FROM tb_usuario WHERE email = ? AND senha = ?";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setString(1, email);
            ps.setString(2, senha);            
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                user.setEmail(rs.getString("email"));
                user.setSenha(rs.getString("senha")); 
                user.setCpf(rs.getString("cpf")); 
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
            throw new RuntimeException("Erro de SQL.", e);
        }
        return false;
    }
    
    public int pegaCodPerfilUsuario(String email, String senha){
        int codigo = 0;
        try {
            String SQL = "SELECT cd_perfilUsuario FROM tb_usuario WHERE email = ? AND senha = ?";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setString(1, email);
            ps.setString(2, senha);            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                codigo = rs.getInt("cd_perfilUsuario");                
                System.out.println("USUARIO EXISTE!!!\nSegue o c�digo do Perfil dele: " + codigo);
            }else{
                System.out.println("USUARIO NAO EXISTE! FAZER CADASTRO!");
            }            
            
        } catch (SQLException e) {
            throw new RuntimeException("Erro de SQL", e);            
        }                   
        return codigo;
    }
    
    public int pegaCdPerfilUsuarioCpfLogado(String cpfLogado){
        int codigo = 0;
        try {
            String SQL = "SELECT cd_perfilUsuario FROM tb_usuario WHERE cpf = ?";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setString(1, cpfLogado);            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                codigo = rs.getInt("cd_perfilUsuario");                
                System.out.println("USUARIO EXISTE!!! Segue o codigo do Perfil do usuario logado: " + codigo);
            }else{
                System.out.println("USUARIO NAO EXISTE! FAZER CADASTRO!");
            }            
            
        } catch (SQLException e) {
            throw new RuntimeException("Erro de SQL", e);            
        }                   
        return codigo;
    }
    
    /*QUANTIDADE DE USUÁRIOS CADASTRADOS NO SISTEMA*/
    public List<User> getQtdUsuariosSistema() {
        List<User> listaQtdUsuario = new ArrayList<User>();
        try {
            String SQL = "select \n" +
                    "	cd_perfilUsuario, \n" +
                    "	count(cd_perfilUsuario) as qtd_usuario\n" +
                    "from tb_usuario\n" +
                    "group by cd_perfilUsuario;";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                User user = new User();                
                user.setCd_perfilUsuario(rs.getInt("cd_perfilUsuario"));                                                             
                user.setQtd_usuario(rs.getInt("qtd_usuario"));                                                             
                listaQtdUsuario.add(user);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pessoas em UserDAO.", e);
        }   
        return listaQtdUsuario;
    }
    
    //TABELA DE FIDELIDADE -> NUMERO DE PEDIDOS POR CLIENTE
    public List<User> getQtdPedidosByCliente() {
        System.out.println("Entrei na getQtdPedidosByCliente");
        List<User> listaDePedidos = new ArrayList<User>();
        try {
            String SQL = "select\n" +
                        " u.nomeUsuario,\n" +
                        " count(p.cd_numeroPedido) as qtd_pedidos,\n" +
                        " u.qt_fidelidade\n" +
                        "from tb_pedido as p\n" +
                        "inner join tb_usuario as u\n" +
                        "on p.cpf = u.cpf\n" +
                        "group by u.cpf;";
            PreparedStatement ps = connection.prepareStatement(SQL);            
            ResultSet rs = ps.executeQuery();                        
            while (rs.next()) {
                User user = new User();
                user.setNomeUsuario(rs.getString("nomeUsuario"));
                user.setQtd_pedidos(rs.getInt("qtd_pedidos"));                                
                user.setQt_fidelidade(rs.getInt("qt_fidelidade"));                                
                listaDePedidos.add(user);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar pedidos.", e);
        }   
        return listaDePedidos;
    }
    
    public int getQtFidelidade(String cpf){
        System.out.println("Entrei na getQtFidelidade");
        int qt_fidelidade = 0;
        try {
            String SQL = "select qt_fidelidade from tb_usuario where cpf = ?;";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setString(1, cpf);            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                qt_fidelidade = rs.getInt("qt_fidelidade");                
                System.out.println("Quantidade de pedidos efetuados para checar se o próximo será ou não 0800: " + qt_fidelidade);
            }else{
                System.out.println("Usuario nao possui pedido algum");
            }            
            
        } catch (SQLException e) {
            throw new RuntimeException("Erro de SQL", e);            
        }                   
        return qt_fidelidade;
    }
    
    public void updateQtFidelidade(String cpf, int qt_fidelidade) {
        System.out.println("Entrei na updateQtFidelidade!!");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update tb_usuario set qt_fidelidade = ? + 1 where cpf = ?;");            
            preparedStatement.setInt(1, qt_fidelidade);
            preparedStatement.setString(2, cpf);  
            
            System.out.println("CPF = " + cpf);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Usuario atualizado com sucesso!");            

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar usuário!");
        }
    }
    
    public void zeraQtFidelidade(String cpf, int qt_fidelidade) {
        System.out.println("Entrei na zeraQtFidelidade!!");
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update tb_usuario set qt_fidelidade = 0 where cpf = ?;");                        
            preparedStatement.setString(1, cpf);  
            
            System.out.println("CPF = " + cpf);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Qtd zerada com sucesso!");            

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar usuário!");
        }
    }
}
