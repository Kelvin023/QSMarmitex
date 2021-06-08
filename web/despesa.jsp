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
    <title>QS Marmitex - Registro de Despesas</title>
    <link rel="shortcut icon" href="img/icone.png">
    <link rel="stylesheet" href="css/estilo.css">
    
    <style>
        @media (min-width: 1400px){
            .tamanho {
                width: 32vw;
                height: fit-content;
                margin-bottom: 15.7%;
            }
        } 
        
        @media (max-width: 1400px){
            .tamanho {
                width: 42vw;
                height: fit-content;
                margin-bottom: 4.5%;
            }
        }
        
        label, input{
              width: 100%;  
        }
            
        ul, a{
            color: #FFF;
            text-decoration: none;
       }
        
        
    </style>
</head>
<body>
    <div>
        <c:import url="includes/cabecalho.jsp"/>    
    </div>
    
    <div id="container" class="tamanho">
        <script>
            $(function() {
                $('input[name=dtValCartao]').datepicker();
            });
        </script>        
        <h1>Registrar Despesa</h1>
        <form method="POST" action='DespesaController' name="frmAddDespesa">                                                      
            <label for="vl_despesa">Valor:</label> 
            <input
                type="text" name="vl_despesa" placeholder="Digite o valor da despesa"
                value="<c:out value="${despesa.vl_despesa}" />" /> <br/>                                              

            <label for="ds_despesa">Descrição:</label> 
            <input
                type="text" name="ds_despesa" placeholder="Digite a descrição da despesa"
                value="<c:out value="${despesa.ds_despesa}" />"/>

            <input type="text" name="cpf" readonly hidden
            value="<c:out value="<%=request.getAttribute("cpf")%>" />"/> 

            <input type="text" name="cd_tipo" readonly hidden
            value="<c:out value="<%=request.getAttribute("cd_tipo")%>" />"/>  

            <input type="text" name="cd_despesa" readonly hidden
            value="<c:out value="<%=request.getAttribute("cd_despesa")%>" />"/> 

            <input type="submit" value="Submit" />        
        </form>
        <a class="voltar" href="${pageContext.request.contextPath}/jsp/listmarmita.jsp">VOLTAR</a>
    </div>
    <div>
        <c:import url="includes/rodape.jsp"/>  
    </div>        
</body>
</html>