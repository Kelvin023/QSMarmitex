package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    private Object preparedStatement;

    public MarmitaDao() {
        connection = DbUtil.getConnection();
    }

    public void addMarmita(Marmita marmita) {
        System.out.println("Entrei na addMarmita!");
        
        try{
            PreparedStatement ps = connection.prepareStatement("insert into tb_marmita(foto, nomeMarmita, cd_grupoMarmita, cd_produto, preco) values (?,?,?,?,?)");
            
            ps.setBlob(1,marmita.getFoto());
            ps.setString(2,marmita.getNomeProduto());
            ps.setInt(3,marmita.getGrupoMarmita());
            ps.setString(4,marmita.getIngredientes());
            ps.setFloat(5,marmita.getPreco());
            
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(MarmitaDao.class.getName()).log(Level.SEVERE, null, ex);
        } 

    }

    public void deleteMarmita(int numeroMarmita) {
        try {
            PreparedStatement ps = connection
                    .prepareStatement("delete from tb_marmita where cd_nr_marmita=?");
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
                    .prepareStatement("update tb_marmita set foto=?, nomeMarmita=?, cd_grupoMarmita=?, cd_produto=?, preco=?"
                            + "where cd_nr_marmita=?");
            ps.setBlob(1,marmita.getFoto());
            ps.setString(2,marmita.getNomeProduto());
            ps.setInt(3,marmita.getGrupoMarmita());
            ps.setString(4,marmita.getIngredientes());
            ps.setFloat(5,marmita.getPreco());
            ps.setInt(6,marmita.getNumeroMarmita());
            
            ps.executeUpdate();
            
            System.out.println("Número da marmita = " + marmita.getNumeroMarmita());
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
            String SQL = "select * from tb_marmita";
            PreparedStatement ps = connection.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Marmita marmita = new Marmita();
                //marmita.setFoto(rs.getBlob("foto")); 
                marmita.setGrupoMarmita(rs.getInt("cd_grupoMarmita"));
                marmita.setIngredientes(rs.getString("ds_ingredientes"));
                marmita.setTamanho(rs.getInt("cd_tamanho"));
                marmita.setNomeProduto(rs.getString("nomeMarmita"));
                marmita.setNumeroMarmita(rs.getInt("cd_nr_numero"));
                //marmita.setPreco(rs.getShort("preco"));                
                //marmita.setStatusCardapio(rs.getBoolean("st_cardapio"));                
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
                marmita.setStatusCardapio(rs.getBoolean("st_cardapio"));            
            }
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
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("qsmarmitexPU");
    
    public void incluirMarmita (/*Blob foto,*/ String nomeMarmita, String gupoMarmita, String ingredientes, String preco){
        System.out.println("Implementar cadastro de marmita: "+nomeMarmita+", "+gupoMarmita+", "+ingredientes+", "+preco);
    }
    
}
