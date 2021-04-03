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

@WebServlet(name = "MarmitaController", urlPatterns = {"/marmita"})
public class MarmitaController extends HttpServlet {

    private static final String INSERT_OR_EDIT = "/marmita.jsp";
    private static final String LIST_MARMITA = "/listmarmita.jsp";
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
            String numeroMarmita = request.getParameter("numeroMarmita");
            dao.deleteMarmita(Integer.parseInt("numeroMarmita"));
            forward = LIST_MARMITA;
            request.setAttribute("marmita", dao.getAllMarmitas());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            String numeroMarmita = request.getParameter("numeroMarmita");
            int cd_nr_marmita = Integer.parseInt(request.getParameter("cd_nr_marmita"));
            Marmita marmita = dao.getMarmitaById(cd_nr_marmita);
            request.setAttribute("cd_nr_marmita", cd_nr_marmita);
            request.setAttribute("marmita", marmita);
        } else if (action.equalsIgnoreCase("listMarmita")) {
            forward = LIST_MARMITA;
            request.setAttribute("marmitas", dao.getAllMarmitas());
        } else {
            int cd_nr_marmita = Integer.parseInt(request.getParameter("cd_nr_marmita"));
            forward = INSERT_OR_EDIT;
            request.setAttribute("cd_nr_marmita", cd_nr_marmita);
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //criar mensgem de sucesso
        String mensagemSucesso ="";
        
        
        //mostrar mensagem de sucesso

       
        /*marmita.incluirMarmita(request.getParameter("foto"),
                               request.getParameter("nomeMarmita"),
                               request.getParameter("grpoMarmita"), 
                               request.getParameter("ingredientes"), 
                               request.getParameter("preco"));
        //int cd_nr_marmita = Integer.parseInt(request.getParameter("cd_nr_marmita"));

        /*mensagemSucesso = "Marmita "+request.getParameter("nomeMarmita")+" cadastrada com sucesso!";*/
        request.setAttribute("mensagemSucesso", mensagemSucesso);
       // request.getDispatcherType("jsp/addmarmita.jsp").FORWARD(request,response);
        
        /*marmita.setFoto("foto");
        marmita.setNomeProduto("nomeMarmita");
        marmita.setGrupoMarmita(request.getIntHeader("grupoMarmita"));
        marmita.setIngredientes("ingredientes");    
        marmita.setPreco("preco");
        */

        /* if(dao.marmitaExist  (request.getParameter(Integer.parseInt("cd_nr_marmita")))){
            dao.updateMarmita(marmita);
        }else{ 
            dao.addMarmita(marmita);
        }
        
        if (cd_nr_marmita == 3) {
            System.out.println("Cliente cadastrado com sucesso!");
            request.setAttribute("marmitas", dao.getMarmitaById(request.getParameter("cd_nr_marmita")));
            request.getRequestDispatcher("/telaCliente.jsp").forward(request, response);
        }
        if (cd_nr_marmita==1) {
            System.out.println("Novo ADM cadastrado com sucesso!");
            request.setAttribute("marmitas", dao.getAllMarmitas());
            request.getRequestDispatcher("/telaAdmin.jsp").forward(request, response);
        } */
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
