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
        <title>QS Marmitex - Cadastro Acompanhamento</title>
        <link rel="shortcut icon" href="img/icone.png">
        <link rel="stylesheet" href="css/estilo.css">
        
        <style>
            
            @media (max-width: 1400px){
                .tamanho {
                    width: 52vw;
                    height: fit-content;
                    margin-bottom: 5%;
                }
                
                 li{
                    font-size: 13.7px;
                }
            } 
             @media (min-width: 1400px){
                .tamanho {
                    width: 42vw;
                    height: fit-content;
                    margin-bottom: 13.8%;
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
        
    
    <h1>Cadastro de acompanhamento</h1>
    <form method="POST" action='AcompController' name="frmAddAcomp">                                                      
        <label for="nomeAcompanhamento">Nome:</label> 
        <input
            type="text" name="nomeAcompanhamento" placeholder="Digite o nome do acompanhamento"
            value="<c:out value="${acomp.nomeAcompanhamento}" />" /> <br/>                                              
        
        <label for="precoAcompanhamento">Preço:</label>  
        <input
            type="text" name="precoAcompanhamento" placeholder="Digite o preço do acompanhamento"
            value="<c:out value="${acomp.precoAcompanhamento}" />"/><br/>

        <input type="text" name="cpf" readonly hidden
        value="<c:out value="<%=request.getAttribute("cpf")%>" />"/> <br/> 
        
        <input type="text" name="cd_acompanhamento" readonly hidden
        value="<c:out value="<%=request.getAttribute("cd_acompanhamento")%>" />"/> <br/> 
        
        <input type="submit" value="Cadastrar Acompanhamento" />        
    </form>
    <a class="voltar" href="${pageContext.request.contextPath}/jsp/listmarmita.jsp">VOLTAR</a>    
    </div>
    <div>
        <c:import url="includes/rodape.jsp"/>  
    </div>
</body>
</html>