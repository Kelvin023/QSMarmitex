<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS MARMITEX</title>
    </head>
    <body>
        <h1>QS MARMITEX</h1>
        Bem vindo à tela de CLIENTE! <br>
        >>>Usuário logado: <%=request.getAttribute("email") %> 
        
        <br><br><br>
        <h3>Aqui deverá ser mostrado o cardápio</h3>
        <h4>Com as opções de marmita</h4>
        <h5>Opção de deslogar, editar dados do cliente e tal</h5>        
        <a href="login.jsp">Sair</a>
    </body>
</html>
