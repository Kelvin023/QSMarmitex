<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Pedido Atendente</title>
        <link rel="shortcut icon" href="img/icone.png">
        <link rel="stylesheet" href="css/estilo.css">
         <style>
            
            @media (max-width: 1400px){
                .tamanho {
                    width: 52vw;
                    height: fit-content;
                    margin-bottom: 4.5%;
                }
                
                
            } 
             @media (min-width: 1400px){
                .tamanho {
                    width: 42vw;
                    height: fit-content;
                    margin-bottom: 17.8%;
                }
            } 
            
             .retornar{
                 text-decoration: none; 
                color: #B22222;
                width: 20%;
                display: inline-block;
                border-radius: 10px;
                cursor: pointer;
            }
            
            .btnEditar{
                cursor: pointer;
                
                color: #4CAF50;
                
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 1rem;   
                border-radius: 30px;
                margin-bottom: 7px;
            }  
            
            .cleanDec{
                text-decoration: none;
            }
            
            .btnFun{
                text-align: center;
                text-transform: uppercase;
                font-weight: bold;
                border: none;
                height: 40px;
                border-radius: 20px;
                margin-top: 20px;
               
                color: #FFF;
                background-color: #B22222;
                cursor: pointer;
                text-decoration: none;
                width: 40%;
                margin-left: 30%;
            }
        </style>
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <div id="container" class="tamanho">
      
        <h3>
            Bem vindo à tela de Atendente! <br> <br>           
            <c:choose>
                <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->                
                    Usuário logado: ${users.email}<br><br>   
                </c:when>              
                <c:otherwise>  <!--Veio direto do login-->              
                    Usuário logado: <%=request.getAttribute("email") %><br> 
                </c:otherwise>
            </c:choose>
            
            
            CPF do Atendente logado: <%=request.getAttribute("cpf") %>
        </h3>              
        <a class="btnFun" href="PedidoController?action=listallPedidos&cpf=<%=(String)request.getAttribute("cpf")%>">Lista Geral de Pedidos</a>
        <br>  
        <a href="#" class="btnFun">Realizar Pedido</a>
        <br>
        <c:choose>           
            <c:when test="${not empty users.email}"><!--Veio da tela do UPDATE--> 
                <a class="btnCadastro" href="UserController?action=edit&cpf=<c:out value="${users.cpf}"/>&cd_perfilUsuario=2">Editar Dados</a>
            </c:when>                          
            <c:otherwise> <!--Veio direto do login-->                               
                <a  class="btnEditar" href="UserController?action=edit&cpf=<%=(String)request.getAttribute("cpf")%>&cd_perfilUsuario=2" >Editar Dados</a>
            </c:otherwise>
        </c:choose>
        <br>    
        <a href="login.jsp" class="retornar">Sair</a>
        </div>   
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
