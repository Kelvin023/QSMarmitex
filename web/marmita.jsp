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
<title>QS Marmitex - Cadastro Marmita</title>
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
                    margin-bottom: 9.9%;
                }
            } 
            
             label, input{
                    width: 100%;  
            }
            
             ul, a{
                    color: #FFF;
                    text-decoration: none;
            }
            
            .retornar{
                 text-decoration: none; 
                color: #B22222;
                width: 20%;
                display: inline-block;
                border-radius: 10px;
                cursor: pointer;
            }
        </style>
</head>
<body>
    <c:import url="includes/cabecalho.jsp"/>
     <div id="container" class="tamanho">
    <script>
        $(function() {
            $('input[name=dtValCartao]').datepicker();
        });
    </script>        
   
    <h1>Cadastro de Marmita</h1>
    <form method="POST" action='MarmitaController' name="frmAddMarmita">                                                      
       <label for="nomeMarmita">Nome:</label> 
        <input
            type="text" name="nomeMarmita" placeholder="Digite o nome da Marmita"
            value="<c:out value="${marmita.nomeMarmita}" />" />  
        
        <label for="ds_ingredientes">Ingredientes:</label>  
        <input
            type="text" name="ds_ingredientes" placeholder="Digite o nome dos ingredientes usados"
            value="<c:out value="${marmita.ds_ingredientes}" />" /> <br/>                                
        
        <label for="preco">Preço:</label>
        <input
            type="text" name="preco" placeholder="Digite o preço da Marmita"
            value="<c:out value="${marmita.preco}" />"/><br/>

        <input type="text" name="cpf" readonly hidden
        value="<c:out value="<%=request.getAttribute("cpf")%>" />"/> <br/> 
        
        <input type="text" name="cd_nr_marmita" readonly hidden
        value="<c:out value="<%=request.getAttribute("cd_nr_marmita")%>" />"/> <br/> 
        
        <input type="submit" value="CADASTRAR MARMITA" />        
    </form>
    <a class="retornar" href="${pageContext.request.contextPath}/jsp/listmarmita.jsp">Voltar</a>
    </div>
    <c:import url="includes/rodape.jsp"/>  
          
</body>
</html>