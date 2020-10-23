<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login QS Marmitex</title>
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        
        <div style="margin-left: 40%;">
            <img src="img/welcome.jpg">
            <h1 style="font-family: monospace; text-shadow: 1px 1px 3px black;">LOGIN</h1>
            <form method="POST" action='logincontrol'>
                E-mail:
                <input type="text" name="email" required="true" autofocus="true">
                <br><br>
                Senha: 
                <input type="password" name="senha" required="true">
                <br><br>
                <!--<input type="submit" value="Cadastrar">-->
                <input type="button" value="Cadastrar" onclick="window.location.href='UserController?action=insert&cd_perfilUsuario=3'">
                <input type="submit" value="Logar">
            </form>
        </div>
        
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
