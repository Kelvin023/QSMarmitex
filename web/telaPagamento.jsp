<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagamento</title>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Tela Pagamento - Cartão</h1>
        <h3>                   
            <c:choose>
                <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->                
                    Usuário logado: ${users.email}<br>
                </c:when>              
                <c:otherwise>  <!--Veio direto do login-->              
                    Usuário logado: <%=request.getAttribute("email") %><br>
                </c:otherwise>
            </c:choose>
            
            
            CPF do Cliente logado: <%=request.getAttribute("cpf") %>
        </h3>              
         <label for="cars">Escolha o cartão cadastrado a ser utilizado no pagamento</label>

        <select name='role'>
            <option value="${selected}" selected>${selected}</option>
            <c:forEach items="${cartaouser}" var="cartao">
                <c:if test="${cartao.numeroCartao != selected}">
                    <option value="${cartao.numeroCartao}">${cartao.numeroCartao}</option>
                </c:if>
            </c:forEach>
        </select>
 
        
        
        <br>
        <a href="login.jsp">Sair</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
