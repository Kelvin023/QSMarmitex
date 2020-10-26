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
    
    public MarmitaDao(){
        connection = DbUtil.getConnection();
    }
    
    public void addMarmita (Marmita marmita){
        System.out.println("Entrei na addMarmita!");
        try {
            String SQL = "INSERT INTO tb_marmita(cd_nr_marmita, cd_grupoMarmita, ds_ingredientes, cd_tamanho, preco, nomeMarmita,foto, st_cardapio) VALUES"
                    +"(?,?,?,?,?,?,?,?)";
            try (PreparedStatement ps = connection.prepareStatement(SQL)){
                ps.setInt(1, marmita.getNumeroMarmita());
                ps.setString(2, marmita.getGrupoMarmita());
                ps.setString(3, marmita.getIngredientes());
                ps.setString(4, marmita.getTamanho());
                ps.setShort(5,marmita.getPreco());
                ps.setString(6, marmita.getNomeProduto());
                ps.setBlob(7, marmita.getFoto());
                ps.setBoolean(8, marmita.isStatusCardapio());
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    public void deleteMarmita (int numeroMarmita){
        try {
            PreparedStatement ps = connection
                    .prepareStatement("delete from tb_marmita where cd_nr_marmita= ?");
            ps.setInt(1, numeroMarmita);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateMarmita(Marmita marmita){
        System.out.println("Entrei na updateMarmita!");
        try {
            PreparedStatement ps = connection
                    .prepareStatement("update tb_marmita set cd_grupoMarmita=?, ds_ingredientes=?, cd_tamanho=?, preco=?, nomeMarmita=?,foto=?, st_cardapio=?"+
                            "where cd_nr_marmita");
                ps.setString(1, marmita.getGrupoMarmita());
                ps.setString(2, marmita.getIngredientes());
                ps.setString(3, marmita.getTamanho());
                ps.setShort(4,marmita.getPreco());
                ps.setString(5, marmita.getNomeProduto());
                ps.setBlob(6, marmita.getFoto());
                ps.setBoolean(7, marmita.isStatusCardapio());
                System.out.println("Número da marmita = "+marmita.getNumeroMarmita());
                ps.executeUpdate();
                ps.close();
                System.out.println("Marmita atualizada com sucesso!");
                
        }   catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar marmita!");
            }
    }
   public List<Marmita> getAllMarmitas(){
       List<Marmita> listaDeMarmita = new ArrayList<Marmita>();
       try {
           String SQL = "select*from tb_marmita";
           PreparedStatement ps = connection.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();
            /*while (rs.next()){
                Marmita marmita = new Marmita();
                marmita.setFoto("foto"); // Está dando erro e sugere criar o setFoto na classe Marmita.java, porém, era para ele reconhecer o extends para pegar o setFoto na classe Produto.java
                marmita.setGrupoMarmita("cd_grupoMarmita");
                marmita.getIngredientes("ds_ingredientes");
                marmita.getNomeProduto("nomeMarmita");
            }*/
       } catch (SQLException e) {
            throw new RuntimeException("Falha ao listar marmitas em MarmitaDao.", e);
        }   
        return listaDeMarmita;
   }
}
    


