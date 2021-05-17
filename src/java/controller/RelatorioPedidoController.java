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
        String status = request.getParameter("status");
        System.out.println("Entrei na RelatorioPedidoController com os valores de periodo abaixo: ");
        System.out.println("Data inicio: " + dtinicio);
        System.out.println("Data fim: " + dtfim);
        System.out.println("Valor do status, la do DropDown: " + status);
        System.out.println("CPF: " + cpf);
        
               
        /*
        SE dtinicio e dtfim <> null, então chamar a funcao getAllPedidosByPeriodo
        SE FOREM null, chamar a nova funcao de getallPedidosByStatus
        */
        if (dtinicio != null && dtfim != null) {
            request.setAttribute("pedidos", dao.getAllPedidosByPeriodo(dtinicio, dtfim));
            request.setAttribute("cpf", cpf);  
            request.setAttribute("dtinicio", dtinicio);  
            request.setAttribute("dtfim", dtfim);          
            request.getRequestDispatcher("/relatorioPedido.jsp").forward(request, response);
        }                
        
        if (status.equals("5") ) {      
            System.out.println("Caso onde o status vale 5!!");
            request.setAttribute("pedidos", dao.getAllPedidos());
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/relatorioPedido.jsp").forward(request, response);                                    
        }
        
        if (status != null || status != "5") {
            System.out.println("Caso onde o status nao eh null e eh difernete de 5!!");
            request.setAttribute("pedidos", dao.getallPedidosByStatus(status));
            request.setAttribute("cpf", cpf);  
            request.setAttribute("dtinicio", dtinicio);  
            request.setAttribute("dtfim", dtfim);          
            request.getRequestDispatcher("/relatorioPedido.jsp").forward(request, response);
        } 
        
        
                       
    }
}
