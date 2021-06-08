package controller;

import dao.DespesaDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RelatorioDespesaController", urlPatterns = {"/RelatorioDespesaController"})
public class RelatorioDespesaController extends HttpServlet {
    
    private final DespesaDao dao;
    
    public RelatorioDespesaController() {
        super();
        dao = new DespesaDao();        
    }
       
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dtinicio = request.getParameter("dtinicio");
        String dtfim = request.getParameter("dtfim");
        String cpf = request.getParameter("cpf");
        String tipoDespesa = request.getParameter("tipoDespesa");
        System.out.println("Entrei na RelatorioDespesaController com os valores de periodo abaixo: ");
        System.out.println("Data inicio: " + dtinicio);
        System.out.println("Data fim: " + dtfim);        
        System.out.println("Valor do tipo de despesa, la do DropDown: " + tipoDespesa);
        System.out.println("CPF: " + cpf);
        
               
        /*
        SE dtinicio e dtfim <> null, então chamar a funcao getAllDespesasByPeriodo
        SE FOREM null, chamar a nova funcao de getallDespesasByTipo
        */
        if (!dtinicio.equals("") && !dtfim.equals("") && tipoDespesa.equals("6")) {
            request.setAttribute("despesas", dao.getAllDespesasByPeriodo(dtinicio, dtfim));
            request.setAttribute("cpf", cpf);  
            request.setAttribute("dtinicio", dtinicio);  
            request.setAttribute("dtfim", dtfim);          
            request.getRequestDispatcher("/listDespesa.jsp").forward(request, response);
        }                                
        
        else if (!tipoDespesa.equals("6") && (dtinicio.equals("") && dtfim.equals(""))) {
            System.out.println("Caso byTipoDespesa");
            request.setAttribute("despesas", dao.getallDespesasByTipo(tipoDespesa));
            request.setAttribute("cpf", cpf);  
            request.setAttribute("dtinicio", dtinicio);  
            request.setAttribute("dtfim", dtfim);          
            request.getRequestDispatcher("/listDespesa.jsp").forward(request, response);
        } 
        
        else if (!tipoDespesa.equals("6") && !dtinicio.equals("") && !dtfim.equals("")) {
            System.out.println("Caso onde o tipo de despesa e as datas serao usados para o filtro!");
            System.out.println("Valor do status -> " + tipoDespesa);
            System.out.println("Valor do dtinicio -> " + dtinicio);
            System.out.println("Valor do dtfim -> " + dtfim);
            request.setAttribute("despesas", dao.getallDespesasByTipoandPeriodo(tipoDespesa, dtinicio, dtfim));
            request.setAttribute("cpf", cpf);  
            request.setAttribute("dtinicio", dtinicio);  
            request.setAttribute("dtfim", dtfim);          
            request.getRequestDispatcher("/listDespesa.jsp").forward(request, response);
        }
                   
        else{      
            System.out.println("Caso o ADM nao setou nada no filtro, so apertou o btn do submit");
            request.setAttribute("despesas", dao.getAllDespesas());
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/listDespesa.jsp").forward(request, response);                                    
        }
        
    }  
}
