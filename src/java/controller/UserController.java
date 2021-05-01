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
        //int cdPerfilUsuario = Integer.parseInt(request.getParameter("cd_perfilUsuario"));
        

        if (action.equalsIgnoreCase("delete")){
            String cpf = request.getParameter("cpf");            
            dao.deleteUser(cpf);
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());    
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            String cpf = request.getParameter("cpf");
            int cdPerfilUsuario = Integer.parseInt(request.getParameter("cd_perfilUsuario"));
            User user = dao.getUserById(cpf);
            request.setAttribute("cpfLogado", cpf);        
            request.setAttribute("cdPerfilUsuario", cdPerfilUsuario);        
            request.setAttribute("user", user);
        } else if (action.equalsIgnoreCase("listUser")){
            forward = LIST_USER;
            String cpf = request.getParameter("cpf");
            System.out.println("CPF vindo da tela anterior: " + cpf);
            request.setAttribute("cpf", cpf);
            request.setAttribute("users", dao.getAllUsers());
        } else if (action.equalsIgnoreCase("insert")){
            String cpfLogado = request.getParameter("cpfLogado");
            int cdPerfilUsuario = Integer.parseInt(request.getParameter("cd_perfilUsuario"));
            forward = INSERT_OR_EDIT;
            System.out.println("Estamos indo para a tela de preenchimento dos campos -> CPF do logado: " + cpfLogado);
            request.setAttribute("cpfLogado", cpfLogado);
            request.setAttribute("cdPerfilUsuario", cdPerfilUsuario);               
        }
        else{/*CASO DE RETORNO À TELA ANTERIOR SEM PERDER OS DADOS*/ 
            System.out.println("Estou na voltar do UserController");                                
                //System.out.println("Quero voltar com o perfil de ADM, logo devo voltar pra coisas do ADM");
                String cpf = request.getParameter("cpf");
                System.out.println("CPF vindo da tela anterior: " + cpf);
                request.setAttribute("cpf", cpf);
                int cdPerfilUsuarioLogado = dao.pegaCdPerfilUsuarioCpfLogado(cpf);
                if (cdPerfilUsuarioLogado == 1) {
                    request.setAttribute("users", dao.getUserById(cpf));
                    request.getRequestDispatcher("/telaAdmin.jsp").forward(request, response);                    
                }    
                if (cdPerfilUsuarioLogado == 2) {
                    request.setAttribute("users", dao.getUserById(cpf));
                    request.getRequestDispatcher("/telaAtendente.jsp").forward(request, response);                    
                }
                if (cdPerfilUsuarioLogado == 4) {
                    request.setAttribute("users", dao.getUserById(cpf));
                    request.getRequestDispatcher("/telaEntregador.jsp").forward(request, response);                    
                } 
                if (cdPerfilUsuarioLogado == 5) {
                    request.setAttribute("users", dao.getUserById(cpf));
                    request.getRequestDispatcher("/telaCozinheiro.jsp").forward(request, response);                    
                }                
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        int cdPerfilUsuario = Integer.parseInt(request.getParameter("cd_perfilUsuario"));
        String cpfLogado = request.getParameter("cpfLogado");
        
        System.out.println("cdPerfilUsuario a ser cadastrado -> " + cdPerfilUsuario);
        System.out.println("cpfLogado -> " + cpfLogado);
        System.out.println("cpf digitado a ser cadastrado -> " + request.getParameter("cpf"));
        System.out.println("nome digitado a ser cadastrado -> " + request.getParameter("nomeUsuario"));
        System.out.println("telefone digitado a ser cadastrado -> " + request.getParameter("telefoneUsuario"));
        System.out.println("endereco digitado a ser cadastrado -> " + request.getParameter("endereco"));
        System.out.println("email digitado a ser cadastrado -> " + request.getParameter("email"));
        System.out.println("senha digitada a ser cadastrada -> " + request.getParameter("senha"));
        System.out.println("dt nascimento digitada a ser cadastrada -> " + request.getParameter("dt_nascimento"));
        
        user.setCd_perfilUsuario(cdPerfilUsuario);
        user.setCpf(request.getParameter("cpf"));
        user.setNomeUsuario(request.getParameter("nomeUsuario"));
        user.setTelefoneUsuario(request.getParameter("telefoneUsuario"));
        user.setEndereco(request.getParameter("endereco"));
        user.setEmail(request.getParameter("email"));
        user.setSenha(request.getParameter("senha"));
        try {
            Date dt_nascimento=null;            
            if(request.getParameter("dt_nascimento")!=null){
                dt_nascimento = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("dt_nascimento"));
            }
            else{
                dt_nascimento = null    ;
            }
                
            user.setDt_nascimento(dt_nascimento);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        if(dao.userExist(request.getParameter("cpf"))){            
            dao.updateUser(user);
        }else{
            dao.addUser(user);
        } 
        
        //--->capturar qual o cdperfilusuario com base no cpf, pra saber em qual tela deverá continuar: Cliente ou ADM        
        if(cpfLogado.equals("null") || cpfLogado.isEmpty()){                
            System.out.println("Valor do CPF inicializado na tela de cadastro: " + request.getParameter("cpf")); 
            cpfLogado = request.getParameter("cpf");
            System.out.println("Novo valor do CPF que era null -> " + cpfLogado);
        }
        else{
            System.out.println("O SISTEMA NAO RECONHECE cpfLogado como null");
            System.out.println("Valor do cpfLogado eh "+cpfLogado+", mas mesmo assim nao consigo fazer ele cair no if do null");
        }                    
        
        System.out.println("cdPerfilUsuario vindo do POST = " + cdPerfilUsuario);
        System.out.println("CPF do usuario logado = " + cpfLogado);
        int cdPerfilUsuarioLogado = dao.pegaCdPerfilUsuarioCpfLogado(cpfLogado);
        switch(cdPerfilUsuarioLogado){
                //Se ele for ADM, manda os dados dele pra página de ADM        
                case 1:
                    System.out.println("CdPerfilLogado = " + cdPerfilUsuarioLogado);
                    System.out.println("Novo cadastro efetuado com sucesso!");
                    request.setAttribute("users", dao.getAllUsers());
                    request.getRequestDispatcher("/telaAdmin.jsp").forward(request, response);
                    break;   
                    
                //Se ele for cliente, manda os dados dele pra página de cliente
                case 3:
                    System.out.println("CdPerfil = " + cdPerfilUsuarioLogado);
                    System.out.println("Cliente cadastrado com sucesso!");
                    request.setAttribute("users", dao.getUserById(request.getParameter("cpf")));
                    request.getRequestDispatcher("/telaCliente.jsp").forward(request, response);
                    break;                
            }                           
    }
}