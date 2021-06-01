package controller;

import dao.DespesaDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Despesa;

@WebServlet(name = "DespesaController", urlPatterns = {"/DespesaController"})
public class DespesaController extends HttpServlet {        
    
    private static final String INSERT_OR_EDIT = "/despesa.jsp";
    private static final String LIST_DESPESAS = "/listDespesa.jsp";
    private final DespesaDao dao;
    
    public DespesaController() {
        super();
        dao = new DespesaDao();        
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward="";        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")) {
            String cpf = request.getParameter("cpf");
            int cd_despesa = Integer.parseInt(request.getParameter("cd_despesa"));
            dao.deleteDespesa(cd_despesa);            
            request.setAttribute("cpf", cpf);
            request.setAttribute("despesas", dao.getAllDespesas());
            forward = LIST_DESPESAS;
        } 
        
        else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            String cpf = request.getParameter("cpf");
            int cd_despesa = Integer.parseInt(request.getParameter("cd_despesa"));
            Despesa despesa = dao.getDespesaById(cd_despesa);
            request.setAttribute("cpf", cpf);        
            request.setAttribute("cd_despesa", cd_despesa);
            request.setAttribute("despesa", despesa);
        }
        
        else if (action.equalsIgnoreCase("listDespesas")) {
            String cpf = request.getParameter("cpf");
            System.out.println("CPF vindo da tela anterior: " + cpf);
            request.setAttribute("cpf", cpf);
            request.setAttribute("despesas", dao.getAllDespesas());
            forward = LIST_DESPESAS;            
        }
        
        else {//insert
            String cpf = request.getParameter("cpf");
            System.out.println("Estamos indo para a tela de preenchimento da nova despesa -> CPF do logado: " + cpf);            
            forward = INSERT_OR_EDIT;
            request.setAttribute("cpf", cpf);            
        }
        
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Despesa despesa = new Despesa();
        String cpf = request.getParameter("cpf");                        
        String cd_despesa = request.getParameter("cd_despesa");                               
         
        Float vl_despesa = Float.parseFloat(request.getParameter("vl_despesa"));       
        
        despesa.setVl_despesa(vl_despesa);        
        int cd_tipo = Integer.parseInt(request.getParameter("cd_tipo"));        
        despesa.setCd_tipo(cd_tipo);        
        System.out.println("VALOR DA DESPESA: " + vl_despesa);        
        System.out.println("CODIGO DO TIPO DA DESPESA: " + cd_tipo);
        
        
        if(dao.despesaExist(request.getParameter("cd_despesa"))){ 
            System.out.println("Entrei no update");
            dao.updateDespesa(despesa, cd_despesa);            
        }else{
            System.out.println("Entrei no add");
            dao.addDespesa(despesa, cd_tipo);            
        }
        request.setAttribute("cpf", cpf);  
        System.out.println("CPF do ADM Logado: " + cpf);
        request.setAttribute("despesas", dao.getAllDespesas());
        RequestDispatcher view = request.getRequestDispatcher(LIST_DESPESAS);
        view.forward(request, response);
    }

    
    

}
