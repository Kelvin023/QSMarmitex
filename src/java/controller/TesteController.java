package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pedido;

@WebServlet(name = "TesteController", urlPatterns = {"/TesteController"})
public class TesteController extends HttpServlet {       
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Pedido> listaDePedidos = new ArrayList<Pedido>();
        
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));                      
        String cd_nr_marmita = request.getParameter("cd_nr_marmita");
        Float preco = Float.parseFloat(request.getParameter("preco"));        
        
        System.out.println("Quantidade -> " + quantidade);
        System.out.println("cd_nr_marmita -> " + cd_nr_marmita);
        System.out.println("preco -> " + preco);
        
        System.out.println("\n\nQuantidade 2?-> " + quantidade);
        System.out.println("cd_nr_marmita 2?-> " + cd_nr_marmita);
        System.out.println("preco 2?-> " + preco);
        
        /*
        while (??.next()) {
                Pedido pedido = new Pedido();
                pedido.setCd_numeroPedido(??.getInt("cd_numeroPedido"));                
                pedido.setQtd_marmita(??.getInt("qtd_marmita"));
                pedido.setValorPedido(??.getFloat("valorPedido"));
                pedido.setDt_pedido(??.getDate("dt_pedido"));
                pedido.setSt_pedido(??.getInt("st_pedido")); 
                pedido.setCd_marmita(??.getInt("cd_marmita")); 
                listaDePedidos.add(pedido);
            }
        */

        //PRECISAMOS PREENCHER A LISTA DE OBJETOS ANTES
        
        //LEITURA DA LISTA
        for (Pedido obj : listaDePedidos) {
            //System.out.println (obj.x1 + "," + obj.x2);
            System.out.println("Codigo da marmita = " + obj.getCd_marmita());
            System.out.println("Quantidade de marmita = " + obj.getQtd_marmita());
        }
    }    

}
