package controller;


import dao.UserDao;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;


@WebServlet(name = "Usuarios", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String INSERT_OR_EDIT = "/user.jsp";
    private static final String LIST_USER = "/listUser.jsp";
    private final UserDao dao;

    public UserController() {
        super();
        dao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";        
        String action = request.getParameter("action");
        int cdPerfilUsuario = Integer.parseInt(request.getParameter("cd_perfilUsuario"));
        

        if (action.equalsIgnoreCase("delete")){
            String cpf = request.getParameter("cpf");            
            dao.deleteUser(cpf);
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());    
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            String cpf = request.getParameter("cpf");
            User user = dao.getUserById(cpf);
            request.setAttribute("user", user);
        } else if (action.equalsIgnoreCase("listUser")){
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());
        } else {
            forward = INSERT_OR_EDIT;
            request.setAttribute("cdPerfilUsuario", cdPerfilUsuario);        
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        int cdPerfilUsuario = Integer.parseInt(request.getParameter("cd_perfilUsuario"));
        
        user.setCd_perfilUsuario(cdPerfilUsuario);
        user.setCpf(request.getParameter("cpf"));
        user.setNomeUsuario(request.getParameter("nomeUsuario"));
        user.setTelefoneUsuario(request.getParameter("telefoneUsuario"));
        user.setEndereco(request.getParameter("endereco"));
        user.setEmail(request.getParameter("email"));
        /*user.setSenha(request.getParameter("senha"));*/
        try {
            Date dt_nascimento=null;            
            if(request.getParameter("dt_nascimento")!=null){
                dt_nascimento = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("dt_nascimento"));
            }
            else{
                dt_nascimento = null;
            }
                
            user.setDt_nascimento(dt_nascimento);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        if(dao.userExist(request.getParameter("cpf"))){
            //FALTA FAZER O CAMPO CPF FICAR DISABLED PRA ESSA FUNCAO UPDATE-> Boto fé que é la no jsp mesmo com os <%if...%>
            dao.updateUser(user);
        }else{
            dao.addUser(user);
        } 
        
        //Se ele for cliente, manda os dados dele pra página de cliente
        if (cdPerfilUsuario == 3) {
            System.out.println("Cliente cadastrado com sucesso!");
            request.setAttribute("users", dao.getUserById(request.getParameter("cpf")));
            request.getRequestDispatcher("/telaCliente.jsp").forward(request, response);
        }
        //Se ele for AMD, manda os dados dele pra página de ADM
        if (cdPerfilUsuario==1) {
            System.out.println("Novo ADM cadastrado com sucesso!");
            request.setAttribute("users", dao.getAllUsers());
            request.getRequestDispatcher("/telaAdmin.jsp").forward(request, response);
        }
        
        /*  
        request.setAttribute("users", dao.getAllUsers());
        request.getRequestDispatcher(LIST_USER).forward(request, response);*/
    }
}