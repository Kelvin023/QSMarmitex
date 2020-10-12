<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS MARMITEX</title>
    </head>
    <body>
        <h1>QS MARMITEX</h1>
        Bem vindo à tela de CLIENTE <span style="color: red"><c:out value="${users.nomeUsuario}" /></span>! <br>                        
        <c:choose>
            <c:when test="${not empty users.email}">
                <p style="color: blue; font-family: monospace; font-size: 20px;">E-mail logado: ${users.email}</p>
            </c:when>              
            <c:otherwise>
                <p style="color: green; font-family: monospace; font-size: 20px;">E-mail logado: <%=request.getAttribute("email")%></p>
            </c:otherwise>
        </c:choose>                                                           
        
        <br><br><br>
        <h3>Aqui deverá ser mostrado o cardápio</h3>
        <h4>Com as opções de marmita</h4>
        <h5>Opção de deslogar, editar dados do cliente e tal</h5>                
        <input type="button" value="Sair" onclick="window.location='login.jsp'"><%session.invalidate();%>
    </body>
</html>
