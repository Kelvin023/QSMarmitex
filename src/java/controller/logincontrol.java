package controller;

import dao.UserDao;
import java.io.IOException;
/*import java.io.PrintWriter;*/
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
    

    /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet logincontrol</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet logincontrol at " + request.getContextPath() + "</h1>");
            out.println("<h4>Login digitado: " + request.getParameter("login") + "</h4>");
            out.println("<h4>Senha digitado: " + request.getParameter("senha") + "</h4>");                
            out.println("</body>");
            out.println("</html>");
        }
    }*/


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*processRequest(request, response);*/
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
            request.setAttribute("email", email);        
            request.getRequestDispatcher("/telaAdmin.jsp").forward(request, response);
        }
        
        /*
        if(checkLogin != null){
            request.setAttribute("email", email);        
            request.getRequestDispatcher("/telaAdmin.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }*/
        
        
    }
}
