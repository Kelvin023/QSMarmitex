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

public class PedidoDao {

 private final Connection connection;

    public PedidoDao() {
        connection = DbUtil.getConnection();
    }
    
    //CRIAR FUNCOES DE CONSULTA, INSERCAO ....
    
}
