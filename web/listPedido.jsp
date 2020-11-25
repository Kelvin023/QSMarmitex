<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Pedidos</title>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Lista de Pedidos</h1>                
        
        <c:choose>
            <c:when test="${empty pedidos}">
                <div id="erro">
                    <h2 style="color: red">Usuario nao contem pedidos cadastrado no sistema!</h2>
                </div>                 
            </c:when>
            <c:otherwise>
                <table border="1">
                    <thead>
                        <tr>
                            <th>NUMERO DO PEDIDO</th>
                            <th>CPF</th>
                            <th>QUANTIDADE</th>
                            <th>VALOR TOTAL DO PEDIDO</th>
                            <th>DATA QUE O PEDIDO FOI EFETUADO</th>                            
                        </tr>
                    </thead>    
                    <tbody>
                        <c:forEach items="${pedidos}" var="pedido">
                        <tr>                                                            
                            <td style="text-transform: uppercase;"><c:out value="${pedido.cd_numeroPedido}" /></td>                    
                            <td><c:out value="<%=(String)request.getAttribute("cpf")%>" /></td>                   
                            <td><c:out value="${pedido.qtd_marmita}" /></td>
                            <td><c:out value="${pedido.valorPedido}" /></td>                                                                            
                            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.dt_pedido}" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>            
                </table>
            </c:otherwise>
            </c:choose>         
                
        <a href="PedidoController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>">Retornar ao Cardapio</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
