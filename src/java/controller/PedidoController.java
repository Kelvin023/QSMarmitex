package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.PedidoDao;
import dao.UserDao;
import model.Pedido;

@WebServlet(name = "PedidoController", urlPatterns = {"/PedidoController"})
public class PedidoController extends HttpServlet {
    private final PedidoDao dao;
    private final UserDao udao;
    
    public PedidoController() {
        super();
        dao = new PedidoDao();
        udao = new UserDao();
    } 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pedido pedido = new Pedido();
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));                      
        String tamanho = request.getParameter("tamanho");
        String email = request.getParameter("email");
        Float preco = Float.parseFloat(request.getParameter("preco"));        
        String cpf = request.getParameter("cpf");
        
        pedido.setCpf(cpf);
        pedido.setQtd_marmita(quantidade);
        pedido.setValorPedido(preco);
        
        System.out.println("Quantidade: " + quantidade);
        System.out.println("Tamanho: " + tamanho);
        System.out.println("Email: " + email);
        System.out.println("Preço: " + preco);
        System.out.println("CPF: " + cpf);
        
        response.getWriter().println("Quantidade selecionada: " + quantidade);
        response.getWriter().println("Tamanho selecionado: " + tamanho);
        response.getWriter().println("E-mail do cliente solicitante: " + email);
        response.getWriter().println("Preço da única marmita disponível até o momento: " + preco);
        response.getWriter().println("CPF  do cliente: " + cpf);
        
        dao.addPedido(pedido);
        request.setAttribute("cpf", cpf);        
        request.setAttribute("users", udao.getUserById(cpf));
        request.setAttribute("mensagem", "Seu Pedido foi registrado! Consultar na base de dados!");
        request.getRequestDispatcher("/telaCliente.jsp").forward(request, response);     
        
    }
}
