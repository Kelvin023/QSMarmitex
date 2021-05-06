<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                      
        
        CRIAR CAMPOS HTML MOSTRANDO OS DADOS DE:
        MARMITA MAIS VENDIDA, MARMITA MENOS VENDIDA, CLIENTE QUE MAIS COMPRA, TOTAL FATURADO POR PERÍODO
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
        <a href="PedidoController?action=voltarTelaAdm&cpf=<%=(String)request.getAttribute("cpf")%>">Retornar</a>
        <br>
        <a href="login.jsp">Sair</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
