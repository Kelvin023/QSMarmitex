<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Login</title>                
        <link rel="shortcut icon" href="img/icone.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
          
       
        <c:choose>
            <c:when test="${not empty loginError}">
                <div id="erro">
                    <h2><%=request.getAttribute("loginError")%></h2>
                </div>                 
            </c:when>              
            <c:otherwise>
                <h2 hidden="true" style="color: red"><%=request.getAttribute("loginError")%></h2>
            </c:otherwise>
        </c:choose>                 
        <!--<img src="img/welcome.jpg">--> 
        <div id="login-container">
                     
            <h1>Login</h1>
            <form method="POST" action='logincontrol'>
               
                <label for="email">E-mail</label>
                <input type="text" name="email" required="true" autocomplete="on" placeholder="Digite seu e-mail" id="email">

                <label for="senha">Senha</label>
                <input type="password" name="senha" required="true" placeholder="Digite a sua senha" id="senha"> 
                
                <a href="" id="forgot-pass">Esqueceu a senha?</a>
                <input type="submit" value="Login">
                
                <div id="registrar-container"> 
                    <p>Ainda não tem uma conta?</p>
                    <!--<input type="button" value="Cadastrar" onclick="window.location.href='UserController?action=insert&cd_perfilUsuario=3'">-->
                    <a href="user.jsp">Registrar</a>
                </div>
            </form>
            
            
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        
        
         <c:import url="includes/rodape.jsp"/> 
        
    </body>
</html>
