package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.Marmita;
import util.DbUtil;

public class MarmitaDao {

    private final Connection connection;
    

    public MarmitaDao() {
        connection = DbUtil.getConnection();
    }

    public void addMarmita(Marmita marmita) {
        System.out.println("Entrei na addMarmita!!");
        try {
            String SQL = "INSERT INTO tb_marmita(nomeMarmita, ds_ingredientes ,preco) VALUES"
                    + "(?, ?, ?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setString(1, marmita.getNomeMarmita());
                ps.setString(2, marmita.getDs_ingredientes());
                ps.setFloat(3, marmita.getPreco());                
                ps.executeUpdate();
                ps.close();
                System.out.println("MARMITA " + marmita.getNomeMarmita() + " inserida com sucesso!");                
            }
            //connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Deu ruim o insert da marmita");
        }
    }

    public void deleteMarmita(int cd_nr_marmita) {
        try {
            PreparedStatement ps = connection
                    .prepareStatement("delete from tb_marmita where cd_nr_marmita=?");
            ps.setInt(1, cd_nr_marmita);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateMarmita(Marmita marmita, int cd_nr_marmita) {
        System.out.println("Entrei na updateMarmita!");
        try {
            PreparedStatement ps = connection
                    .prepareStatement("update tb_marmita set nomeMarmita=?, ds_ingredientes=?, preco=?"
                            + "where cd_nr_marmita=?");            
            ps.setString(1,marmita.getNomeMarmita());
            ps.setString(2,marmita.getDs_ingredientes());
            ps.setFloat(3,marmita.getPreco());
            ps.setInt(4,cd_nr_marmita);            
            
            ps.executeUpdate();
            
            System.out.println("Número da marmita a ser atualizada= " + cd_nr_marmita);
            System.out.println("Marmita atualizada com sucesso!");
            
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar marmita!");
        }
    }

    public List<Marmita> getAllMarmitas() {
        List<Marmita> listaDeMarmita = new ArrayList<Marmita>();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from tb_marmita");
            
            while (rs.next()){
                Marmita marmita = new Marmita();
                marmita.setCd_nr_marmita(rs.getInt("cd_nr_marmita"));
                marmita.setNomeMarmita(rs.getString("nomeMarmita"));
                marmita.setDs_ingredientes(rs.getString("ds_ingredientes"));
                marmita.setPreco(rs.getFloat("preco"));                
                
                listaDeMarmita.add(marmita);
            }            
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar marmitas em MarmitaDao.", e);
        }
        return listaDeMarmita;
    }        
    
    public Marmita getMarmitaById(int cd_nr_marmita) {
        Marmita marmita = new Marmita();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_marmita where cd_nr_marmita=?");
            preparedStatement.setInt(1, cd_nr_marmita);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {                
                marmita.setCd_nr_marmita(rs.getInt("cd_nr_marmita"));
                marmita.setNomeMarmita(rs.getString("nomeMarmita"));
                marmita.setDs_ingredientes(rs.getString("ds_ingredientes"));                
                marmita.setPreco(rs.getFloat("preco"));                                                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao buscar registro de marmita solicitada.");
        }
        return marmita;
    }
    
    public boolean marmitaExist(String cd_nr_marmita) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_marmita where cd_nr_marmita=?");
            preparedStatement.setString(1, cd_nr_marmita);
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