package controller;

import dao.MarmitaDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Marmita;

@WebServlet(name = "MarmitaController", urlPatterns = {"/MarmitaController"})
public class MarmitaController extends HttpServlet {

    private static final String INSERT_OR_EDIT = "/marmita.jsp";
    private static final String LIST_MARMITA = "/listMarmita.jsp";
    private final MarmitaDao dao;

    MarmitaDao marmita = new MarmitaDao(); 
    
    public MarmitaController() {
        super();
        dao = new MarmitaDao();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            String cpf = request.getParameter("cpf");
            int cd_nr_marmita = Integer.parseInt(request.getParameter("cd_nr_marmita"));
            dao.deleteMarmita(cd_nr_marmita);            
            request.setAttribute("cpf", cpf);
            request.setAttribute("marmitas", dao.getAllMarmitas());
            forward = LIST_MARMITA;
        } 
        
        else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            String cpf = request.getParameter("cpf");
            int cd_nr_marmita = Integer.parseInt(request.getParameter("cd_nr_marmita"));
            Marmita marmita = dao.getMarmitaById(cd_nr_marmita);
            request.setAttribute("cpf", cpf);        
            request.setAttribute("cd_nr_marmita", cd_nr_marmita);
            request.setAttribute("marmita", marmita);
        }
        
        else if (action.equalsIgnoreCase("listMarmitas")) {
            String cpf = request.getParameter("cpf");
            System.out.println("CPF vindo da tela anterior: " + cpf);
            request.setAttribute("cpf", cpf);
            request.setAttribute("marmitas", dao.getAllMarmitas());
            forward = LIST_MARMITA;            
        }
        
        else {//insert
            String cpf = request.getParameter("cpf");
            System.out.println("Estamos indo para a tela de preenchimento da nova marmita -> CPF do logado: " + cpf);            
            forward = INSERT_OR_EDIT;
            request.setAttribute("cpf", cpf);            
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                      
        Marmita marmita = new Marmita();
        String cpf = request.getParameter("cpf");                
        int cd_nr_marmita = Integer.parseInt(request.getParameter("cd_nr_marmita"));                              
         
        Float preco = Float.parseFloat(request.getParameter("preco"));
        String nomeMarmita = request.getParameter("nomeMarmita");
        String ds_ingredientes = request.getParameter("ds_ingredientes");
        
        marmita.setNomeMarmita(nomeMarmita);
        marmita.setDs_ingredientes(ds_ingredientes);
        marmita.setPreco(preco);
        
        System.out.println("NOME DA MARMITA: " + nomeMarmita);
        System.out.println("INGREDIENTES: " + ds_ingredientes);
        System.out.println("PRECO: " + preco);
        
        
        if(dao.marmitaExist(request.getParameter("cd_nr_marmita"))){            
            dao.updateMarmita(marmita, cd_nr_marmita);            
        }else{
            dao.addMarmita(marmita);            
        }
        request.setAttribute("cpf", cpf);  
        System.out.println("CPF do ADM Logado: " + cpf);
        request.setAttribute("marmitas", dao.getAllMarmitas());
        RequestDispatcher view = request.getRequestDispatcher(LIST_MARMITA);
        view.forward(request, response);
        
        
        /*
        dao.addMarmita(marmita);
        request.setAttribute("cpf", cpf);  
        System.out.println("CPF do ADM Logado: " + cpf);
        request.setAttribute("marmitas", dao.getAllMarmitas());
        RequestDispatcher view = request.getRequestDispatcher(LIST_MARMITA);
        view.forward(request, response);        */
    } 
}
