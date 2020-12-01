package controller;

import dao.PedidoDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RelatorioPedidoController", urlPatterns = {"/RelatorioPedidoController"})
public class RelatorioPedidoController extends HttpServlet {
    private final PedidoDao dao;
    
    public RelatorioPedidoController() {
        super();
        dao = new PedidoDao();        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        
        String dtinicio = request.getParameter("dtinicio");
        String dtfim = request.getParameter("dtfim");
        String cpf = request.getParameter("cpf");
        System.out.println("Entrei na RelatorioPedidoController com os valores de periodo abaixo: ");
        System.out.println("Data inicio: " + dtinicio);
        System.out.println("Data fim: " + dtfim);
        System.out.println("CPF: " + cpf);
        
               
        //request.setAttribute("pedidos", dao.getAllPedidosByPeriodo(dtinicio, dtfim));
        request.setAttribute("pedidos", dao.getAllPedidosByPeriodo(dtinicio, dtfim));
        request.setAttribute("cpf", cpf);  
        request.setAttribute("dtinicio", dtinicio);  
        request.setAttribute("dtfim", dtfim);          
        request.getRequestDispatcher("/relatorioPedido.jsp").forward(request, response);
    }
}
