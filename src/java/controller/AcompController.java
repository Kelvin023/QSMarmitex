package controller;

import dao.AcompanhamentoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Acompanhamento;

@WebServlet(name = "AcompController", urlPatterns = {"/AcompController"})
public class AcompController extends HttpServlet {
    
    private static final String INSERT_OR_EDIT = "/acompanhamento.jsp";
    private static final String LIST_ACOMPANHAMENTO = "/listAcomp.jsp";
    private final AcompanhamentoDao dao;
    
    public AcompController() {
        super();
        dao = new AcompanhamentoDao();        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward="";        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")) {
            String cpf = request.getParameter("cpf");
            int cd_acompanhamento = Integer.parseInt(request.getParameter("cd_acompanhamento"));
            dao.deleteAcompanhamento(cd_acompanhamento);            
            request.setAttribute("cpf", cpf);
            request.setAttribute("acomps", dao.getAllAcomps());
            forward = LIST_ACOMPANHAMENTO;
        } 
        
        else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            String cpf = request.getParameter("cpf");
            int cd_acompanhamento = Integer.parseInt(request.getParameter("cd_acompanhamento"));
            Acompanhamento acompanhamento = dao.getAcompById(cd_acompanhamento);
            request.setAttribute("cpf", cpf);        
            request.setAttribute("cd_acompanhamento", cd_acompanhamento);
            request.setAttribute("acomp", acompanhamento);
        }
        
        else if (action.equalsIgnoreCase("listAcomps")) {
            String cpf = request.getParameter("cpf");
            System.out.println("CPF vindo da tela anterior: " + cpf);
            request.setAttribute("cpf", cpf);
            request.setAttribute("acomps", dao.getAllAcomps());
            forward = LIST_ACOMPANHAMENTO;            
        }
        
        else {//insert
            String cpf = request.getParameter("cpf");
            System.out.println("Estamos indo para a tela de preenchimento dao novo acompanhamento -> CPF do logado: " + cpf);            
            forward = INSERT_OR_EDIT;
            request.setAttribute("cpf", cpf);            
        }
        
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
        Acompanhamento acompanhamento = new Acompanhamento();
        String cpf = request.getParameter("cpf");                        
        String cd_acompanhamento = request.getParameter("cd_acompanhamento");                               
         
        Float precoAcompanhamento = Float.parseFloat(request.getParameter("precoAcompanhamento"));
        String nomeAcompanhamento = request.getParameter("nomeAcompanhamento");        
        
        acompanhamento.setNomeAcompanhamento(nomeAcompanhamento);        
        acompanhamento.setPrecoAcompanhamento(precoAcompanhamento);        
        System.out.println("NOME DO ACOMPANHAMENTO: " + nomeAcompanhamento);        
        System.out.println("PRECO: " + precoAcompanhamento);
        
        
        if(dao.acompExist(request.getParameter("cd_acompanhamento"))){ 
            System.out.println("Entrei no update");
            dao.updateAcompanhamento(acompanhamento, cd_acompanhamento);            
        }else{
            System.out.println("Entrei no add");
            dao.addAcompanhamento(acompanhamento);            
        }
        request.setAttribute("cpf", cpf);  
        System.out.println("CPF do ADM Logado: " + cpf);
        request.setAttribute("acomps", dao.getAllAcomps());
        RequestDispatcher view = request.getRequestDispatcher(LIST_ACOMPANHAMENTO);
        view.forward(request, response);
    }
}
