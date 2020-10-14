<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Show All Users</title>
    </head>
<body>
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
                             
                <c:if test="${user.cd_perfilUsuario == 1}">                
                    <td><a href="UserController?action=edit&cpf=<c:out value="${user.cpf}"/>&cd_perfilUsuario=1">Update</a></td>
                </c:if>              
                <c:if test="${user.cd_perfilUsuario == 3}">                    
                    <td><a style="pointer-events: none; color: gray" href="UserController?action=edit&cpf=<c:out value="${user.cpf}"/>&cd_perfilUsuario=3">Update</a></td>
                </c:if>               
                    
                    <td><a href="UserController?action=delete&cpf=<c:out value="${user.cpf}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="UserController?action=insert&cd_perfilUsuario=1">Add Novo ADM</a></p>
    <br>
    <a href="telaAdmin.jsp">Voltar</a>
</body>
</html>