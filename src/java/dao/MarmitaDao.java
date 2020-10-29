package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
import model.Marmita;
import util.DbUtil;

public class MarmitaDao {

    private final Connection connection;
    private Object preparedStatement;

    public MarmitaDao() {
        connection = DbUtil.getConnection();
    }

    public void addMarmita(Marmita marmita) {
        System.out.println("Entrei na addMarmita!");
        try {
            String SQL = "INSERT INTO tb_marmita(cd_nr_marmita, cd_grupoMarmita, ds_ingredientes, cd_tamanho, preco, nomeMarmita,foto, st_cardapio) VALUES"
                    + "(?,?,?,?,?,?,?,?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setInt(1, marmita.getNumeroMarmita());
                ps.setInt(2, marmita.getGrupoMarmita());
                ps.setString(3, marmita.getIngredientes());
                ps.setInt(4, marmita.getTamanho());
                ps.setShort(5, marmita.getPreco());
                ps.setString(6, marmita.getNomeProduto());
                ps.setBlob(7, marmita.getFoto());
                ps.setBoolean(8, marmita.isStatusCardapio());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteMarmita(int numeroMarmita) {
        try {
            PreparedStatement ps = connection
                    .prepareStatement("delete from tb_marmita where cd_nr_marmita= ?");
            ps.setInt(1, numeroMarmita);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateMarmita(Marmita marmita) {
        System.out.println("Entrei na updateMarmita!");
        try {
            PreparedStatement ps = connection
                    .prepareStatement("update tb_marmita set cd_grupoMarmita=?, ds_ingredientes=?, cd_tamanho=?, preco=?, nomeMarmita=?,foto=?, st_cardapio=?"
                            + "where cd_nr_marmita");
            ps.setInt(1, marmita.getGrupoMarmita());
            ps.setString(2, marmita.getIngredientes());
            ps.setInt(3, marmita.getTamanho());
            ps.setShort(4, marmita.getPreco());
            ps.setString(5, marmita.getNomeProduto());
            ps.setBlob(6, marmita.getFoto());
            ps.setBoolean(7, marmita.isStatusCardapio());
            System.out.println("Número da marmita = " + marmita.getNumeroMarmita());
            ps.executeUpdate();
            ps.close();
            System.out.println("Marmita atualizada com sucesso!");

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar marmita!");
        }
    }

    public List<Marmita> getAllMarmitas() {
        List<Marmita> listaDeMarmita = new ArrayList<Marmita>();
        try {
            String SQL = "select*from tb_marmita";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Marmita marmita = new Marmita();
                marmita.setFoto(rs.getBlob("foto")); 
                marmita.setGrupoMarmita(rs.getInt("cd_grupoMarmita"));
                marmita.setIngredientes(rs.getString("ds_ingredientes"));
                marmita.setNomeProduto(rs.getString("nomeMarmita"));
                marmita.setNumeroMarmita(rs.getInt("cd_nr_numero"));
                marmita.setPreco(rs.getShort("preco"));
                marmita.setStatusCardapio(rs.getBoolean("st_cardapio"));
                marmita.setTamanho(rs.getInt("cd_tamanho"));
                listaDeMarmita.add(marmita);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar marmitas em MarmitaDao.", e);
        }
        return listaDeMarmita;
    }
        //Rever o procedimento getMarmitaById por causa - fazer sobrescrita com @param nos atributos com nome <> do BD
    
    public Marmita getMarmitaById(int numeroMarmita) {
        Marmita marmita = new Marmita();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_marmita where cd_nr_marmita=?");
            preparedStatement.setInt(1, numeroMarmita);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                marmita.setFoto(rs.getBlob("foto"));
                marmita.setGrupoMarmita(rs.getInt("cd_grupoMarmita"));
                marmita.setIngredientes(rs.getString("ds_ingredientes"));
                marmita.setNomeProduto(rs.getString("nomeMarmita"));
                marmita.setNumeroMarmita(rs.getInt("cd_nr_marmita"));
                marmita.setPreco(rs.getShort("preco"));
                marmita.setTamanho(rs.getInt("cd_tamanho"));
                marmita.setStatusCardapio(rs.getBoolean("st_cardapio"));            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao buscar registro de usuário.");
        }
        return marmita;
    }
    public boolean marmitaExist(int cd_nr_marmita ) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from tb_usuario where cpf=?");
            preparedStatement.setInt(1, cd_nr_marmita);
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
