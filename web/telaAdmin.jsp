<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela ADMIN</title>
    </head>
    <body>
        <h1>Tela ADMIN</h1>
        <h3>
            Bem vindo à tela de ADM! <br>
            Usuário logado: <%=request.getAttribute("email") %> 
        </h3>
        <!--ANTES DE USAR A listUser, TEM INICIALIZAR O PARAMETRO LISTA DELA PRIMEIRO!!!-->
        <a href="UserController?action=listUser">Usuários</a>
        <br>
        <a href="login.jsp">Sair</a>
    </body>
</html>