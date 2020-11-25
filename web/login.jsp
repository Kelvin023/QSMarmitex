<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login QS Marmitex</title>                
        <style>
            #erro{
                background-color: lightsalmon;
                color: darkred;
                border:solid thick darkred; 
                border-radius: 1em; 
                border-width:3px; 
                padding-left:9px; 
                padding-top:6px; 
                padding-bottom:6px; 
                margin:2px; 
                width:300px;
            }            
        </style>
        <link rel="shortcut icon" href="img/icone.png">
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
        
        <div style="margin-left: 40%;">
            <img src="img/welcome.jpg">            
            <h1 style="font-family: monospace; text-shadow: 1px 1px 3px black;">LOGIN</h1>
            <form method="POST" action='logincontrol'>
                E-mail:
                <input type="text" name="email" required="true" autocomplete="on">
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
