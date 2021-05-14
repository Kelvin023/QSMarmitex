<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Cozinheiro</title>
        <link rel="shortcut icon" href="img/icone.png">
        
        <link rel="stylesheet" href="css/estilo.css">
        
        <style>
            .tamanho{
               width: 40vw; 
               height: fit-content;
               margin-bottom: 13%;
            }
            
            .listaPedidos{
                text-decoration: none;
                text-align: center;
                
                font-weight: bold;
                border: none;
                height: 40px;
                border-radius: 10px;
                margin-top: 30px;
                margin-bottom: 10px;
                color: #FFF;
                background-color: #B22222;
                cursor: pointer;
                width: 40%;
                display: inline-block;
            }
            
            .cozinheiro{
                text-align: left;
                font-size: 1.3em;
                padding: 3%;
            }
        </style>
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <div id="container" class="tamanho">
       
            <h2>Bem vindo à tela de Cozinheiro! </h2>  
            <div class="cozinheiro">
            <c:choose>
                <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->                
                    Usuário logado: ${users.email}<br>
                </c:when>              
                <c:otherwise>  <!--Veio direto do login-->              
                    Usuário logado: <%=request.getAttribute("email") %>
                </c:otherwise>
            </c:choose>
            </div>
            
            <p class="cozinheiro"> CPF do Cozinheiro logado: <%=request.getAttribute("cpf") %></p>  
                     
        <a class="listaPedidos" href="PedidoController?action=listallPedidosProducao&cpf=<%=(String)request.getAttribute("cpf")%>">PEDIDOS</a>
        <br>   
        <c:choose>           
            <c:when test="${not empty users.email}"><!--Veio da tela do UPDATE--> 
                <a class="editar" href="UserController?action=edit&cpf=<c:out value="${users.cpf}"/>&cd_perfilUsuario=5">Editar</a>
            </c:when>                          
            <c:otherwise> <!--Veio direto do login-->                               
                <a  class="editar" href="UserController?action=edit&cpf=<%=(String)request.getAttribute("cpf")%>&cd_perfilUsuario=5">Editar</a>
            </c:otherwise>
        </c:choose>
                <br>
        <a class="sair" href="login.jsp">Sair</a>
         
        </div>
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
