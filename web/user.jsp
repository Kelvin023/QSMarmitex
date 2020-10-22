<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css"
    href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
<script type="text/javascript" src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
<title>Add new user</title>
</head>
<body>
    <script>
        $(function() {
            $('input[name=dt_nascimento]').datepicker();
        });
    </script>

    <form method="POST" action='UserController' name="frmAddUser">
        CPF : <input type="text" name="cpf"
            value="<c:out value="${user.cpf}" />" /> <br /> 
        NOME : <input
            type="text" name="nomeUsuario"
            value="<c:out value="${user.nomeUsuario}" />" /> <br /> 
        TELEFONE : <input
            type="text" name="telefoneUsuario"
            value="<c:out value="${user.telefoneUsuario}" />" /> <br /> 
        ENDERECO : <input
            type="text" name="endereco"
            value="<c:out value="${user.endereco}" />" /> <br />
        EMAIL : <input
            type="text" name="email"
            value="<c:out value="${user.email}" />" /> <br />
        DATA DE NASCIMENTO : <input
            type="text" placeholder="dd/MM/yyyy" name="dt_nascimento" data-date-format="dd/MM/yyyy"
            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${user.dt_nascimento}" />" /> <br />                 
        SENHA : <input
            type="text" name="senha" autocomplete="off"
            value="<c:out value="${user.senha}" />"/><br/> 
        <input type="text" name="cd_perfilUsuario" hidden="true"
               value="<%=request.getAttribute("cdPerfilUsuario")%>"/><br><br>
        <input type="submit" value="Submit" />
    </form>                
</body>
</html>