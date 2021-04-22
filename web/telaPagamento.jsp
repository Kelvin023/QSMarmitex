<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagamento</title>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Tela Pagamento - Cartão</h1>
        <h3>                   
            <c:choose>
                <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->                
                    Usuário logado: ${users.email}<br>
                </c:when>              
                <c:otherwise>  <!--Veio direto do login-->              
                    Usuário logado: <%=request.getAttribute("email") %><br>
                </c:otherwise>
            </c:choose>
            
            
            CPF do Cliente logado: <%=request.getAttribute("cpf") %>
        </h3>              
         <label for="cars">Escolha o cartão cadastrado a ser utilizado no pagamento</label>

        <select name='role'>
            <option value="${selected}" selected>${selected}</option>
            <c:forEach items="${cartaouser}" var="cartao">
                <c:if test="${cartao.numeroCartao != selected}">
                    <option value="${cartao.numeroCartao}">${cartao.numeroCartao}</option>
                </c:if>
            </c:forEach>
        </select>
 
            
        <!--INFORMAÇÕES DO PEDIDO-->    
        <c:forEach items="${pedidos}" var="pedido">
            <h2 style="font-weight: bold">DETALHES DO PEDIDO</h2>

            *********************************************************************************<br>            
            NUMERO DO PEDIDO: <c:out value="${pedido.cd_numeroPedido}" /><br>
                        
            <c:choose>
                <c:when test="${pedido.cd_marmita == 1}">                
                    MARMITA SOLICITADA: SALADA AMERICANA PEQUEN<br> 
                </c:when>              
                <c:when test="${pedido.cd_marmita == 2}">                
                    MARMITA SOLICITADA: SALADA AMERICANA MÉDIA<br> 
                </c:when>
                <c:when test="${pedido.cd_marmita == 3}">                
                    MARMITA SOLICITADA: ESCONDIDINHO FITNESS PEQUENO<br>
                </c:when>
                <c:when test="${pedido.cd_marmita == 4}">                
                    MARMITA SOLICITADA: ESCONDIDINHO FITNESS MÉDIO<br>
                </c:when>
                <c:otherwise>                
                    MARMITA SOLICITADA: ESCONDIDINHO FITNESS GRANDE<br>
                </c:otherwise>
            </c:choose>

            
            QUANTIDADE: <c:out value="${pedido.qtd_marmita}" /><br>
            
            DATA SOLICITAÇÃO PEDIDO : <fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.dt_pedido}" /><br>
            <h4>VALOR TOTAL DO PEDIDO: R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${pedido.valorPedido * pedido.qtd_marmita}"/></h4>  
            *********************************************************************************<br>
        </c:forEach>
        
        <br>
        <a href="PedidoController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>">Cancelar Pedido</a>
        <br>
        <a href="login.jsp">Sair</a>
        <br><br><br><br><br><br>    
        <br><br><br><br> 
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
