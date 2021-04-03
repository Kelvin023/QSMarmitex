<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista dos Deliverys</title>
        <link rel="shortcut icon" href="img/icone.png">
        <style>
            #btnZerar{
                width: 160px;
                height: 40px;
                line-height: 40px;
                padding: 10px 5px;
                background-color: #000;
                color: #FFF;
                border-radius: 5px;
                text-decoration: none;
                text-align: center;
                font-weight: bold;
                font-family: Arial;
            }            
        </style>
    </head>
    
    
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Lista de pedidos a serem entregues</h1>                                              
        <h3>CPF do Entregador logado: <%=request.getAttribute("cpf")%></h3>
        <br>                                              
    <table border=1>
        <thead>
            <tr>
                <th>CODIGO DO PEDIDO</th>
                <th>CPF SOLICITANTE</th>
                <th>QTD DE MARMITA</th>                
                <th>VALOR DO PEDIDO</th>
                <th>DATA DE REALIZAÇÃO DO PEDIDO</th>  
                <th>STATUS DO PEDIDO</th>
                <th>ACTION</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pedidos}" var="pedidos">
                <tr>                                                            
                    <td><c:out value="${pedidos.cd_numeroPedido}" /></td>
                    <td><c:out value="${pedidos.cpf}" /></td>                    
                    <td><c:out value="${pedidos.qtd_marmita}" /></td>
                    <td><c:out value="${pedidos.valorPedido}" /></td> 
                    <!--<td><fmt:formatDate pattern="dd/MM/yyyy" value="${pedidos.dt_pedido}"/></td>-->
                    <td><c:out default="dd/MM/yyyy" value="${pedidos.dt_pedido}" /></td>                                                                
                    <td>EM TRANSPORTE</td>      
                    <td><a href="PedidoController?action=atualizaPedidosEntrega&cpf=<%=request.getAttribute("cpf")%>&cd_numeroPedido=<c:out value="${pedidos.cd_numeroPedido}"/>">OK</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>                       
                                    
        <br><br>
        <a href="UserController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>">Voltar</a>        
        <br>
        <a href="login.jsp">Sair</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
