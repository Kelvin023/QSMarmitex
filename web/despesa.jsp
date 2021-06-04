<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css"
    href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
<script type="text/javascript" src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
<title>Novo Registro de Despesa</title>
<link rel="shortcut icon" href="img/icone.png">
</head>
<body>
    <c:import url="includes/cabecalho.jsp"/>      
    <script>
        $(function() {
            $('input[name=dtValCartao]').datepicker();
        });
    </script>        
    
    <form method="POST" action='DespesaController' name="frmAddDespesa">                                                      
        VALOR DA DESPESA: 
        <input
            type="text" name="vl_despesa"
            value="<c:out value="${despesa.vl_despesa}" />" /> <br/>                                              
        
        DESCRIÇÃO DA DESPESA(OPCIONAL):
        <input
            type="text" name="ds_despesa"
            value="<c:out value="${despesa.ds_despesa}" />"/><br/>

        <input type="text" name="cpf" readonly hidden
        value="<c:out value="<%=request.getAttribute("cpf")%>" />"/> <br/> 
        
        <input type="text" name="cd_tipo" readonly hidden
        value="<c:out value="<%=request.getAttribute("cd_tipo")%>" />"/> <br/> 
        
        <input type="text" name="cd_despesa" readonly hidden
        value="<c:out value="<%=request.getAttribute("cd_despesa")%>" />"/> <br/> 
        
        <input type="submit" value="Submit" />        
    </form>
        <br><br>
    <c:import url="includes/rodape.jsp"/>  
          
</body>
</html>