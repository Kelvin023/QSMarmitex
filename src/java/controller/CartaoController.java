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
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import model.User;
import dao.UserDao;


@WebServlet(name = "CartaoController", urlPatterns = {"/CartaoController"})
public class CartaoController extends HttpServlet {   

        
    private static final String INSERT_OR_EDIT = "/cartao.jsp";
    private static final String LIST_CARTAO = "/listCartao.jsp";
    private final CartaoDao dao;
    private final UserDao udao;

    public CartaoController() {
        super();
        dao = new CartaoDao();
        udao = new UserDao();
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
            request.setAttribute("cartoes", dao.getCartaoByCpf(cpf)); 
            request.setAttribute("cpf", cpf);
            request.getRequestDispatcher("/listCartao.jsp").forward(request, response);
        } 
        
        else if (action.equalsIgnoreCase("edit")){ 
            System.out.println("Entrei no edit do CartaoController");                     
            String cpf = request.getParameter("cpf");
            System.out.println("Cpf inicializado: " + cpf);
            int cd_cartao = Integer.parseInt(request.getParameter("cd_cartao"));
            System.out.println("cd_cartao inicializado: " + cd_cartao);
            Cartao cartao = dao.getUserById(cd_cartao);
            request.setAttribute("cd_cartao", cd_cartao);  
            request.setAttribute("cpf", cpf); 
            request.setAttribute("cartoes", cartao);
            System.out.println("A um passo do getRequestDispatcher");
            request.setAttribute("fraseCartao", "ATUALIZAÇÃO DE CADASTRO DE CARTÃO");
            request.getRequestDispatcher("/cartao.jsp").forward(request, response);
        } 
        
        else if (action.equalsIgnoreCase("listCartao")){            
            String cpf = request.getParameter("cpf");
            request.setAttribute("cartoes", dao.getCartaoByCpf(cpf));
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/listCartao.jsp").forward(request, response);
        } 
        
        else if (action.equalsIgnoreCase("insert")){   
            String cpf = request.getParameter("cpf");            
            request.setAttribute("cpf", cpf);       
            request.setAttribute("fraseCartao", "CADASTRO NOVO CARTÃO");
            request.getRequestDispatcher("/cartao.jsp").forward(request, response);
        }
        
        else{/*CASO DE RETORNO À TELA ANTERIOR SEM PERDER OS DADOS*/           
            request.setAttribute("users", udao.getUserById(request.getParameter("cpf")));
            request.getRequestDispatcher("/telaCliente.jsp").forward(request, response);
        }

        /*RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);*/
    }
    
    
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cartao cartao = new Cartao();                                
        
        cartao.setNomeTitular(request.getParameter("nomeTitular"));
        cartao.setCpf(request.getParameter("cpf"));
        cartao.setNumeroCartao(request.getParameter("numeroCartao"));
        cartao.setCvvCartao(request.getParameter("cvvCartao"));        
        try {
            Date dtValCartao=null;            
            if(request.getParameter("dtValCartao")!=null){
                dtValCartao = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("dtValCartao"));
            }
            else{
                dtValCartao = null;
            }
                
            cartao.setDtValCartao(dtValCartao);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        String cd_cartao = request.getParameter("cd_cartao");
        if(cd_cartao == null || cd_cartao.isEmpty())
        {
            System.out.println("Entrei na addCartao!!");
            dao.addCartao(cartao);
        }
        else
        {
            cartao.setCd_cartao(Integer.parseInt(cd_cartao));
            dao.updateCartao(cartao);
        }                
        
        System.out.println("Cartão cadastrado com sucesso!");
        request.setAttribute("cpf", request.getParameter("cpf"));
        request.setAttribute("cartoes", dao.getCartaoByCpf(request.getParameter("cpf")));
        request.getRequestDispatcher("/listCartao.jsp").forward(request, response);                        
    }
    
}
