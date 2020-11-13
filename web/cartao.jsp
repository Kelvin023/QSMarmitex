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
<title>Novo Cartao</title>
<link rel="shortcut icon" href="img/icone.png">
</head>
<body>
    <c:import url="includes/cabecalho.jsp"/>
    <script>
        $(function() {
            $('input[name=dtValCartao]').datepicker();
        });
    </script>
    
    <h1>
    <%=request.getAttribute("fraseCartao")%>
    </h1>
    
    <form method="POST" action='CartaoController' name="frmAddCartao">                        
            
        CPF : <input type="text" name="cpf" readonly
        value="<c:out value="<%=request.getAttribute("cpf")%>" />"/> <br/>    
        
        NOME TITULAR(como esta descrito no cartao): <input
            type="text" name="nomeTitular" style="text-transform: uppercase"
            value="<c:out value="${cartoes.nomeTitular}" />" /> <br/>   
        
        NUMERO DO CARTAO: <input
            type="text" name="numeroCartao"
            value="<c:out value="${cartoes.numeroCartao}" />" /> <br/>
        
        DATA DE VENCIMENTO DO CARTAO : <input
            type="text" placeholder="dd/MM/yyyy" name="dtValCartao" data-date-format="dd/MM/yyyy"
            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${cartoes.dtValCartao}" />" /> <br/>                 
        
        CVV CARTAO : <input
            type="text" name="cvvCartao" autocomplete="off"
            value="<c:out value="${cartoes.cvvCartao}" />"/><br/>
        
        <input type="text" name="cd_cartao" hidden="true" readonly="readonly"
               value="<c:out value="${cartoes.cd_cartao}" />"/><br>
        <input type="submit" value="Submit" />
    </form>
    <br><br><br><br><br><br>    
    <c:import url="includes/rodape.jsp"/>        
</body>
</html>