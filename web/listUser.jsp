<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Show All Users</title>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
<body>
    <c:import url="includes/cabecalho.jsp"/>       
    <!--<h1>CPF do Admin logado: <%=(String)request.getAttribute("cpf")%></h1>-->
    <h1>Nome do Admin logado: <c:out value="${usuario.nomeUsuario}" /></h1>
    
    <table border=1>
        <thead>
            <tr>
                <th>PERFIL</th>
                <th>CPF</th>
                <th>NOME</th>                
                <th>TELEFONE</th>
                <th>ENDERECO</th>
                <th>EMAIL</th>
                <th>DATA NASCIMENTO</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>                    
                    <c:choose>
                        <c:when test="${user.cd_perfilUsuario == 1}">
                            <!--<td>ADM - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>ADM</td>
                        </c:when>    
                        <c:when test="${user.cd_perfilUsuario == 2}">
                            <!--<td>ADM - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>ATENDENTE</td>
                        </c:when>     
                        <c:when test="${user.cd_perfilUsuario == 4}">
                            <!--<td>ADM - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>ENTREGADOR</td>
                        </c:when>  
                        <c:when test="${user.cd_perfilUsuario == 5}">
                            <!--<td>ADM - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>COZINHEIRO</td>
                        </c:when>     
                        <c:otherwise>
                            <!--<td>CLIENTE - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>CLIENTE</td>
                        </c:otherwise>
                    </c:choose>                    
                    <td><c:out value="${user.cpf}" /></td>
                    <td><c:out value="${user.nomeUsuario}" /></td>                    
                    <td><c:out value="${user.telefoneUsuario}" /></td>
                    <td><c:out value="${user.endereco}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${user.dt_nascimento}" /></td>                    
                    <!--<td><a href="UserController?action=edit&cpf=<c:out value="${user.cpf}"/>">Update</a></td>-->
                    <td><a href="UserController?action=edit&cpfLogado=<%=(String)request.getAttribute("cpf")%>&cpf=<c:out value="${user.cpf}"/>&cd_perfilUsuario=<c:out value="${user.cd_perfilUsuario}"/>">Update</a></td>
                    
                    <td><a href="UserController?action=delete&cpfLogado=<%=(String)request.getAttribute("cpf")%>&cpf=<c:out value="${user.cpf}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="UserController?action=insert&cd_perfilUsuario=1&cpfLogado=<%=(String)request.getAttribute("cpf")%>">Add Novo ADM</a></p>
    <p><a href="UserController?action=insert&cd_perfilUsuario=4&cpfLogado=<%=(String)request.getAttribute("cpf")%>">Add Novo Entregador</a></p>    
    <p><a href="UserController?action=insert&cd_perfilUsuario=5&cpfLogado=<%=(String)request.getAttribute("cpf")%>">Add Novo Cozinheiro</a></p>    
    <a href="UserController?action=voltar&cd_perfilUsuario=1&cpf=<%=(String)request.getAttribute("cpf")%>">Voltar</a><br>
    <a class="voltar" href="login.jsp">Sair</a>
    <br><br><br><br><br><br>    
    <c:import url="includes/rodape.jsp"/>
</body>
</html>