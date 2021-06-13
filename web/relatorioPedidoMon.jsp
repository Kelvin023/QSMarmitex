<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela Monitoramento</title>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Tela ADMIN</h1>
        <h3>
            Tela de Monitoramento - Auxílio Tomada de Decisão <br>            
            <c:choose>
                <c:when test="${not empty users.email}">                
                    Usuário logado: ${users.email}<br>
                </c:when>              
                <c:otherwise>                
                    Usuário logado: <%=request.getAttribute("email") %><br>
                </c:otherwise>
            </c:choose>
            
            
            CPF do ADMIN logado: <%=request.getAttribute("cpf") %>
        </h3>                                                    
        <br>
        <table border=1>
            <thead>
                <tr>
                    <th>MARMITA MAIS VENDIDA</th>                    
                    <th>QUANTIDADE VENDIDA</th>                                                       
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pedidos}" var="pedidos">
                    <tr>                                                                                                                                    
                        <c:choose>
                            <c:when test="${pedidos.cd_marmita == 1}">                
                                <td>SALADA AMERICANA PEQUENA</td> 
                            </c:when>              
                            <c:when test="${pedidos.cd_marmita == 2}">                
                                <td>SALADA AMERICANA MÉDIA</td> 
                            </c:when>
                            <c:when test="${pedidos.cd_marmita == 3}">                
                                <td>ESCONDIDINHO FITNESS PEQUENO</td>
                            </c:when>
                            <c:when test="${pedidos.cd_marmita == 4}">                
                                <td>ESCONDIDINHO FITNESS MÉDIO</td>
                            </c:when>
                            <c:otherwise>                
                                <td>ESCONDIDINHO FITNESS GRANDE</td>
                            </c:otherwise>
                        </c:choose>  
                        <td><c:out value="${pedidos.qtd_marmita}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>  
        <br>
        <table border=1>
            <thead>
                <tr>
                    <th>MARMITA MENOS VENDIDA</th>                    
                    <th>QUANTIDADE VENDIDA</th>                                                       
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pedidosmenos}" var="pedidos">
                    <tr>                                                                                                                                    
                        <c:choose>
                            <c:when test="${pedidos.cd_marmita == 1}">                
                                <td>SALADA AMERICANA PEQUENA</td> 
                            </c:when>              
                            <c:when test="${pedidos.cd_marmita == 2}">                
                                <td>SALADA AMERICANA MÉDIA</td> 
                            </c:when>
                            <c:when test="${pedidos.cd_marmita == 3}">                
                                <td>ESCONDIDINHO FITNESS PEQUENO</td>
                            </c:when>
                            <c:when test="${pedidos.cd_marmita == 4}">                
                                <td>ESCONDIDINHO FITNESS MÉDIO</td>
                            </c:when>
                            <c:otherwise>                
                                <td>ESCONDIDINHO FITNESS GRANDE</td>
                            </c:otherwise>
                        </c:choose>  
                        <td><c:out value="${pedidos.qtd_marmita}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>     
        <table border=1>
            <thead>
                <tr>
                    <td colspan="2" align="center" style="font-weight: bold">QTD USUÁRIOS CADASTRADOS NO SISTEMA</td>
                </tr>
                <tr>
                    <th>TIPO USUÁRIO</th>                    
                    <th>NÚMERO USUÁRIOS CADASTRADOS</th>                                                       
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${qtdusers}" var="qtdusers">
                    <tr>                                                                                                                                    
                        <c:choose>
                            <c:when test="${qtdusers.cd_perfilUsuario == 1}">                
                                <td>ADMINISTRADOR</td> 
                            </c:when>              
                            <c:when test="${qtdusers.cd_perfilUsuario == 2}">                
                                <td>ATENDENTE</td> 
                            </c:when>
                            <c:when test="${qtdusers.cd_perfilUsuario == 3}">                
                                <td>CLIENTE</td>
                            </c:when>
                            <c:when test="${qtdusers.cd_perfilUsuario == 4}">                
                                <td>ENTREGADOR</td>
                            </c:when>
                            <c:otherwise>                
                                <td>COZINHEIRO</td>
                            </c:otherwise>
                        </c:choose>  
                        <td><c:out value="${qtdusers.qtd_usuario}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <table border=1>
            <thead>
                <tr>
                    <td colspan="3" align="center" style="font-weight: bold">STATUS FIDELIDADE</td>
                </tr>
                <tr>
                    <th>NOME USUÁRIO</th>                    
                    <th>QTD TOTAL PEDIDOS</th>
                    <th>QTD PEDIDOS FIDELIDADE</th>
                    <th>PROXIMO PEDIDO</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${qtdpedidos}" var="pedidos">                    
                    <tr>                                       
                        <td><c:out value="${pedidos.nomeUsuario}" /></td>
                        <td><c:out value="${pedidos.qtd_pedidos}" /></td>
                        <td><c:out value="${pedidos.qt_fidelidade}" /></td>
                        <c:choose>
                            <c:when test="${pedidos.qt_fidelidade == 10}">                
                                <td>GRATUITO</td> 
                            </c:when>                                          
                            <c:otherwise>                
                                <td>NAO GRATUITO</td>
                            </c:otherwise>
                        </c:choose>                          
                    </tr>
                </c:forEach>
            </tbody>
        </table>                                             
        <br>
        <a href="PedidoController?action=voltarTelaAdm&cpf=<%=(String)request.getAttribute("cpf")%>">Retornar</a>
        <br>
        <a href="login.jsp">Sair</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
