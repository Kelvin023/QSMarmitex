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
<title>Nova Marmita</title>
<link rel="shortcut icon" href="img/icone.png">
</head>
<body>
    <c:import url="includes/cabecalho.jsp"/>      
    <script>
        $(function() {
            $('input[name=dtValCartao]').datepicker();
        });
    </script>        
    
    <form method="POST" action='MarmitaController' name="frmAddMarmita">                                                      
        NOME MARMITA(informe o nome junto): 
        <input
            type="text" name="nomeMarmita"
            value="<c:out value="${marmita.nomeMarmita}" />" /> <br/>   
        
        INGREDIENTES: 
        <input
            type="text" name="ds_ingredientes"
            value="<c:out value="${marmita.ds_ingredientes}" />" /> <br/>                                
        
        PREÇO: 
        <input
            type="text" name="preco"
            value="<c:out value="${marmita.preco}" />"/><br/>

        <input type="hidden" name="cpf" readonly 
        value="<c:out value="<%=request.getAttribute("cpf")%>" />"/> <br/> 
        
        <input type="hidden" name="cd_nr_marmita" readonly 
        value="<c:out value="<%=request.getAttribute("cd_nr_marmita")%>" />"/> <br/> 
        
        <input type="submit" value="Submit" />        
    </form>
        <br><br>
    <c:import url="includes/rodape.jsp"/>  
          
</body>
</html>