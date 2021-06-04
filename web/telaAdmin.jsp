<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela ADMIN</title>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Tela ADMIN</h1>
        <h3>
            Bem vindo à tela de ADM! <br>            
            <c:choose>
                <c:when test="${not empty users.email}">                
                    Usuário logado: ${users.email}<br>
                </c:when>              
                <c:otherwise>                
                    Usuário logado: <%=request.getAttribute("email") %><br>
                </c:otherwise>
            </c:choose>
            
            <c:choose>
                <c:when test="${not empty users.cpf}">                
                    CPF do ADMIN logado ${users.cpf}<br>
                </c:when>              
                <c:otherwise>                
                    CPF do ADMIN logado: <%=request.getAttribute("cpf") %><br>
                </c:otherwise>
            </c:choose>
            <!--CPF do ADMIN logado: <%=request.getAttribute("cpf") %>-->
        </h3>        
        <a href="UserController?action=listUser&cpf=<%=(String)request.getAttribute("cpf")%>">Usuários</a>
        <br>
        <a href="PedidoController?action=listallPedidos&cpf=<%=(String)request.getAttribute("cpf")%>">RELATÓRIO DE PEDIDOS</a>
        <br>
        <a href="PedidoController?action=listPedidosMon&cpf=<%=(String)request.getAttribute("cpf")%>">MONITORAMENTO</a>        
        <br>
        <a href="MarmitaController?action=listMarmitas&cpf=<%=(String)request.getAttribute("cpf")%>">MARMITAS</a>
        <br>
        <a href="AcompController?action=listAcomps&cpf=<%=(String)request.getAttribute("cpf")%>">ACOMPANHAMENTOS</a>
        <br>
        <a href="DespesaController?action=listDespesas&cpf=<%=(String)request.getAttribute("cpf")%>">DESPESAS</a>
        <br>
        <a href="login.jsp">Sair</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
