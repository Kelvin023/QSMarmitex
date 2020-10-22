<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela ADMIN</title>
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Tela ADMIN</h1>
        <h3>
            Bem vindo à tela de ADM! <br>
            Usuário logado: <%=request.getAttribute("email") %> 
        </h3>
        <!--ANTES DE USAR A listUser, TEM INICIALIZAR O PARAMETRO LISTA DELA PRIMEIRO!!!-->
        <a href="UserController?action=listUser">Usuários</a>
        <br>
        <a href="login.jsp">Sair</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
