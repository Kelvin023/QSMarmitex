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
    private static final String SELECT_DESPESA = "/selectDespesa.jsp";
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
            int cd_tipo = Integer.parseInt(request.getParameter("cd_tipo"));
            System.out.println("cd_depesa enviado para ser editado -> " + cd_despesa);
            Despesa despesa = dao.getDespesaById(cd_despesa);
            request.setAttribute("cpf", cpf);        
            request.setAttribute("cd_despesa", cd_despesa);
            request.setAttribute("cd_tipo", cd_tipo);
            request.setAttribute("despesa", despesa);
        }
        
        else if (action.equalsIgnoreCase("listDespesas")) {
            String cpf = request.getParameter("cpf");
            System.out.println("CPF vindo da tela anterior: " + cpf);
            request.setAttribute("cpf", cpf);
            request.setAttribute("despesas", dao.getAllDespesas());
            forward = LIST_DESPESAS;            
        }
        else if (action.equalsIgnoreCase("selectDespesas")) {
            String cpf = request.getParameter("cpf");
            System.out.println("CPF vindo da tela anterior: " + cpf);
            request.setAttribute("cpf", cpf);            
            forward = SELECT_DESPESA;            
        }
        
        else {//insert
            /*
            Aqui temos: CPF, cd_tipo e A AÇÃO 'insert', pra poder entra aqui
            */
            System.out.println("Cheguei no insert da depesa");
            String cpf = request.getParameter("cpf");
            String cd_tipo = request.getParameter("select");
            System.out.println("Tipo da depesa selecionada -> " + cd_tipo);
            System.out.println("Estamos indo para a tela de preenchimento da nova despesa -> CPF do logado: " + cpf);            
            forward = INSERT_OR_EDIT;            
            request.setAttribute("cpf", cpf);
            request.setAttribute("cd_tipo", cd_tipo);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Entrei no doPost da Despesa");
        Despesa despesa = new Despesa();
        String cpf = request.getParameter("cpf");                        
        String cd_despesa = request.getParameter("cd_despesa");                               
        String ds_despesa = request.getParameter("ds_despesa");                               
        int cd_tipo = Integer.parseInt(request.getParameter("cd_tipo"));        
        Float vl_despesa = Float.parseFloat(request.getParameter("vl_despesa"));       
        
        despesa.setVl_despesa(vl_despesa);               
        despesa.setCd_tipo(cd_tipo);  
        despesa.setDs_despesa(ds_despesa);
        System.out.println("VALOR DA DESPESA JA NO POST: " + vl_despesa);        
        System.out.println("CODIGO DO TIPO DA DESPESA JA NO POST: " + cd_tipo);
        
        
        if(dao.despesaExist(request.getParameter("cd_despesa"))){ 
            System.out.println("cd_despesa a entrar no updateDespesa -> " + cd_despesa);            
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
