<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela ENTREGADOR</title>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Tela ENTREGADOR</h1>
        <h3>
            Bem vindo à tela de ENTREGADOR! <br>            
            <c:choose>
                <c:when test="${not empty users.email}">                
                    Usuário logado: ${users.email}<br>
                </c:when>              
                <c:otherwise>                
                    Usuário logado: <%=request.getAttribute("email") %><br>
                </c:otherwise>
            </c:choose>
            
            
            CPF do ENTREGADOR logado: <%=request.getAttribute("cpf") %>
        </h3>
                       
        <a href="PedidoController?action=listallPedidosEntrega&cpf=<%=(String)request.getAttribute("cpf")%>">LISTA DE ENTREGAS A SEREM CUMPRIDAS</a>
        <br>
        <c:choose>           
            <c:when test="${not empty users.email}"><!--Veio da tela do UPDATE--> 
                <a style="color: red" href="UserController?action=edit&cpf=<c:out value="${users.cpf}"/>&cd_perfilUsuario=4">Editar</a>
            </c:when>                          
            <c:otherwise> <!--Veio direto do login-->                               
                <a style="color: green" href="UserController?action=edit&cpf=<%=(String)request.getAttribute("cpf")%>&cd_perfilUsuario=4">Editar</a>
            </c:otherwise>
        </c:choose>
        <br>
        <a href="login.jsp">Sair</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
