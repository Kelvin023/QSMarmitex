package controller;

import dao.UserDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

@WebServlet(name = "logincontrol", urlPatterns = {"/logincontrol"})
public class logincontrol extends HttpServlet {
    private final UserDao dao;

    public logincontrol() {
        super();
        dao = new UserDao();
    }          


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        System.out.println("Email digitado: " + email);
        System.out.println("Senha digitada: " + senha);
        
        User checkLogin = dao.checkLogin(email, senha);        
        System.out.println("Email inicializado no atributo do objeto cheklogin: " + checkLogin.getEmail());
        System.out.println("Senha inicializada no atributo do objeto cheklogin: " + checkLogin.getSenha());
        
        if (checkLogin.getEmail() == null && checkLogin.getSenha() == null) {
            System.out.println("Usuário ou senha inválidos!\nTente novamente.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }else if(checkLogin.getEmail() != null && checkLogin.getSenha() != null){
            int cdPerfilUsuario = dao.pegaCodPerfilUsuario(email, senha);
            switch(cdPerfilUsuario){
                case 1:
                    System.out.println("Administrador");
                    break;
                case 2:
                    System.out.println("Atendente");
                    break;
                case 3:
                    System.out.println("Cliente");
                    break;
                case 4:
                    System.out.println("Entregador");
                    break;
            }
            request.setAttribute("email", email);        
            request.getRequestDispatcher("/telaAdmin.jsp").forward(request, response);
        }                
    }
}
