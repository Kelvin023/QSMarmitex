<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatorio Pedido</title>
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
        <h1>Relatório de pedidos</h1>
        
        <!--FILTROS DE PERÍODO-->        
        <span style="font-size: 20px; font-weight: bold">PERÍODO: </span>
        <form method="POST" action="RelatorioPedidoController">
            <label>Data início</label>
            <input type="date" name="dtinicio" required>
            <label>Data fim</label>
            <input type="date" name="dtfim" required>
            <input type="text" name="cpf" hidden value="<%=request.getAttribute("cpf")%>"/>
            <button type="submit">APLICAR FILTRO</button>            
        </form>        
        <br>
        
        <a id="btnZerar" href="PedidoController?action=listallPedidos&cpf=<%=(String)request.getAttribute("cpf")%>">
            Zerar filtro
        </a>
        <br><br>        
        <c:if test="${not empty dtinicio}">                
            <h2>#Filtro Utilizado# Data início: <%=request.getAttribute("dtinicio")%>  ***  Data fim: <%=request.getAttribute("dtfim")%></h2>
        </c:if>                                 
                
    <table border=1>
        <thead>
            <tr>
                <th>CODIGO DO PEDIDO</th>
                <th>CPF</th>
                <th>QTD DE MARMITA</th>                
                <th>VALOR DO PEDIDO</th>
                <th>DATA DE REALIZAÇÃO DO PEDIDO</th>  
                <th>STATUS DO PEDIDO</th>                            
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
                    <c:choose>
                        <c:when test="${pedidos.st_pedido == 0}">                                    
                            <td>EM PRODUÇÃO</td>
                        </c:when> 
                        <c:when test="${pedidos.st_pedido == 1}">                                    
                            <td>EM TRANSPORTE</td>
                        </c:when>    
                        <c:otherwise>                                    
                            <td>ENTREGUE - (FINALIZADO)</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </tbody>
    </table>                       
        <br>             
        
        EXIBIR MARMITA MAIS VENDIDA
        <br><br><br>
        <a href="UserController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>">Voltar</a>        
        <br>
        <a href="login.jsp">Sair</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
