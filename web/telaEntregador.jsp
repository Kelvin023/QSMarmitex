<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitax - Entregador</title>
        <link rel="shortcut icon" href="img/icone.png">
        <link rel="stylesheet" href="css/estilo.css">
        
        <style>
            @media (max-width: 1400px){
                .tamanho{
                    width: 48vw;
                    height: fit-content;
                    margin-bottom: 7%;  
                }  
            }
            
            @media (min-width: 1400px){
                .tamanho{
                    width: 48vw;
                    height: fit-content;
                    margin-bottom: 11.3%;  
                }  
            }
            
        
            .listaEntregas{
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
            
            .entregador{
                text-align: left;
                font-size: 1.3em;
                padding: 3%;
            }
          
        </style>
              
         
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <div id="container" class="tamanho">
        
        
            <h2> Bem vindo à tela de entregador!  </h2> 
            <div class="entregador">
            <c:choose>
                <c:when test="${not empty users.email}">                
                    Usuário logado: ${users.email}
                </c:when>  
            
                <c:otherwise>                
                    Usuário logado: <%=request.getAttribute("email") %>
                </c:otherwise>
            </c:choose>
            </div>
            
            <p class="entregador"> CPF do entregador logado: <%=request.getAttribute("cpf") %> </p>
        
                       
        <a class="listaEntregas"href="PedidoController?action=listallPedidosEntrega&cpf=<%=(String)request.getAttribute("cpf")%>">Lista de entregas</a>
        <br>
        <c:choose>           
            <c:when test="${not empty users.email}"><!--Veio da tela do UPDATE--> 
                <a class="editar" href="UserController?action=edit&cpf=<c:out value="${users.cpf}"/>&cd_perfilUsuario=4">Editar</a>
            </c:when>                          
            <c:otherwise> <!--Veio direto do login-->                               
                <a class="editar" href="UserController?action=edit&cpf=<%=(String)request.getAttribute("cpf")%>&cd_perfilUsuario=4">Editar</a>
            </c:otherwise>
        </c:choose>
        <br>
        <a class="sair" href="login.jsp">Sair</a>
        
        </div>
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
