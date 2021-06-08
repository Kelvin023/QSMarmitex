<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela Atendente</title>
        <link rel="shortcut icon" href="img/icone.png">
        
        <link rel="stylesheet" href="css/estilo.css">
        
        
        <style>
            @media (max-width: 1400px){
                .tamanho{
                    width: 40vw;
                    height: fit-content;
                    margin-bottom: 11.3%; 
                }
            }
            
             @media (min-width: 1400px){
                .tamanho{
                    width: 28vw;
                    height: fit-content;
                    margin-bottom: 22.8%; 
                }
            }
            
            .listaAtendente{
                text-decoration: none;
                text-align: center;
                font-size: 0.8em;
                font-weight: bold;
                border: none;
                padding-left: 42px;
                height: 40px;
                border-radius: 10px;
                color: #FFF;
                background-color: #B22222;
                cursor: pointer;
                float: center;
                display: inline-block;
            }
            
            .tamLista{
                 width: 100%;
            }
            .atendente{
                text-align: left;
                font-size: 0.8em;
                padding: 3%;
            }
        </style>
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <div id="container" class="tamanho">
        <h1>Tela Atendente</h1>
        
            <div class="atendente">           
            <c:choose>
                <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->                
                    Usuário logado: ${users.email}<br>
                </c:when>              
                <c:otherwise>  <!--Veio direto do login-->              
                    Usuário logado: <%=request.getAttribute("email") %><br>
                </c:otherwise>
            </c:choose>
            </div>
            
            <p class="atendente"> CPF do Atendente logado: <%=request.getAttribute("cpf") %> </p>
            <div class="tamLista">
            <ul >         
            <li><a class="listaAtendente" href="PedidoController?action=listallPedidos&cpf=<%=(String)request.getAttribute("cpf")%>">Lista Pedidos</a></li>
        
            <li><a class="listaAtendente" href="PedidoController?action=atendenteRealizaPedido&cpf=<%=(String)request.getAttribute("cpf")%>">Realizar Pedido</a></li>
        
        <c:choose>           
            <c:when test="${not empty users.email}"><!--Veio da tela do UPDATE--> 
                <li> <a class="listaAtendente"href="UserController?action=edit&cpf=<c:out value="${users.cpf}"/>&cd_perfilUsuario=2">Editar</a> </li>
            </c:when>                          
            <c:otherwise> <!--Veio direto do login-->                               
            <li> <a  class="listaAtendente" href="UserController?action=edit&cpf=<%=(String)request.getAttribute("cpf")%>&cd_perfilUsuario=2">Editar Dados</a> </li>
            </c:otherwise>
        </c:choose>
            </ul>  
            </div>
            <div>  
                <a class="sair" href="login.jsp">Sair</a>
            </div>  
        </div>  
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
