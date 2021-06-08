<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Administador</title>
        <link rel="shortcut icon" href="img/icone.png">
        
        <link rel="stylesheet" href="css/estilo.css">
        
        <style>
            @media (max-width: 1400px){
                .tamanho{
                    width: 28vw;
                    height: fit-content;
                    margin-bottom: 7%; 
                }
            }
            @media (min-width: 1400px){
                .tamanho{
                    width: 20vw;
                    height: fit-content;
                    margin-bottom: 8.4%; 
                }
            }
            ul, a{
                    color: #FFF;
                    text-decoration: none;
                    background-color: none;
            }
        </style>
    </head>
    <body>
        <div>
            <c:import url="includes/cabecalho.jsp"/>
        </div>
        
        <div id="container" class="tamanho">
            <h3>
                Bem vindo à tela de Administrador <br> <br>           
                <c:choose>
                    <c:when test="${not empty users.email}">                
                        Usuário logado: ${users.email}<br><br>
                    </c:when>              
                    <c:otherwise>                
                        Usuário logado: <%=request.getAttribute("email") %><br><br>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${not empty users.cpf}">                
                        CPF do ADMIN logado ${users.cpf}<br><br>
                    </c:when>              
                    <c:otherwise>                
                        CPF do ADMIN logado: <%=request.getAttribute("cpf") %><br><br>
                    </c:otherwise>
                </c:choose>
                <!--CPF do ADMIN logado: <%=request.getAttribute("cpf") %>-->
            </h3>  
            
            <div>
                <ul>
                    <li><a href="UserController?action=listUser&cpf=<%=(String)request.getAttribute("cpf")%>">USUÁRIOS</a></li>
                    <li><a href="PedidoController?action=listallPedidos&cpf=<%=(String)request.getAttribute("cpf")%>">RELATÓRIO DE PEDIDOS</a></li>
                    <li><a href="PedidoController?action=listPedidosMon&cpf=<%=(String)request.getAttribute("cpf")%>">MONITORAMENTO</a></li>       
                    <li><a href="PedidoController?action=listFluxoCaixa&cpf=<%=(String)request.getAttribute("cpf")%>">FLUXO DE CAIXA</a></li>        
                    <li><a href="MarmitaController?action=listMarmitas&cpf=<%=(String)request.getAttribute("cpf")%>">MARMITAS</a></li>
                    <li><a href="AcompController?action=listAcomps&cpf=<%=(String)request.getAttribute("cpf")%>">ACOMPANHAMENTOS</a></li>
                    <li><a href="DespesaController?action=listDespesas&cpf=<%=(String)request.getAttribute("cpf")%>">DESPESAS</a></li>
                </ul>
            </div>
            <a class="voltar" href="login.jsp">Sair</a>
        </div>
        <div>
            <c:import url="includes/rodape.jsp"/>
        </div>   
    </body>    
</html>
