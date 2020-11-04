package controller;

import dao.CartaoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cartao;


@WebServlet(name = "CartaoController", urlPatterns = {"/CartaoController"})
public class CartaoController extends HttpServlet {   

    
    /*FAZER AS DUAS JSPs ABAIXO*/
    private static final String INSERT_OR_EDIT = "/cartao.jsp";
    private static final String LIST_CARTAO = "/listCartao.jsp";
    private final CartaoDao dao;

    public CartaoController() {
        super();
        dao = new CartaoDao();
    }
            
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward="";        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String cpf = request.getParameter("cpf");
            int cdCartao = Integer.parseInt(request.getParameter("cd_cartao"));                      
            dao.deleteCartao(cdCartao);
            forward = LIST_CARTAO;
            request.setAttribute("cartoes", dao.getCartaoByCpf(cpf)); 
            request.setAttribute("cpf", cpf);
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            String cpf = request.getParameter("cpf");
            //int cdPerfilUsuario = Integer.parseInt(request.getParameter("cd_perfilUsuario"));
            //Cartao cartao = dao.getCartaoById(cpf);
            //request.setAttribute("cdPerfilUsuario", cdPerfilUsuario);        
            //request.setAttribute("cartao", cartao);
        } else if (action.equalsIgnoreCase("listCartao")){
            forward = LIST_CARTAO;
            String cpf = request.getParameter("cpf");
            request.setAttribute("cartoes", dao.getCartaoByCpf(cpf));
            request.setAttribute("cpf", cpf);
            
        } else {
            //int cdPerfilUsuario = Integer.parseInt(request.getParameter("cd_perfilUsuario"));
            forward = INSERT_OR_EDIT;
            //request.setAttribute("cdPerfilUsuario", cdPerfilUsuario);        
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    
}
