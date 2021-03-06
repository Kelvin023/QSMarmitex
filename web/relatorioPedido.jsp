<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Qs Marmitex - Relatorio Pedido</title>
        <link rel="shortcut icon" href="img/icone.png">
        <link rel="stylesheet" href="css/estilo.css">
              
        <style>
            
            @media (max-width: 1400px){
                .tamanho {
                    width: 73vw;
                    height: fit-content;
                    margin-bottom: 11.1%;
                }   
            } 
            
             @media (min-width: 1400px){
                .tamanho {
                    width: 48vw;
                    height: fit-content;
                    margin-bottom: 12.5%;
                }
            }  
            
            table, th, td{
                border: solid 2px black;
            }
            
            .retornar{
                 text-decoration: none; 
                color: #B22222;
                width: 20%;
                display: inline-block;
                border-radius: 10px;
                cursor: pointer;
            }
            
            #btnZerar{
                width: 160px;
                height: 40px;
                line-height: 40px;
                
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
        <div id="container" class="tamanho">
        <h1>Relatório de pedidos</h1>
        
        <!--FILTROS DE PERÍODO-->        
        <span style="font-size: 20px; font-weight: bold">PERÍODO: </span>
        <form method="POST" action="RelatorioPedidoController">
            Data início
            <input type="date" name="dtinicio">
           Data fim
            <input type="date" name="dtfim">
            <input type="text" name="cpf" hidden value="<%=request.getAttribute("cpf")%>"/>           
        
        <!--FILTROS DE STATUS-->        
        <span style="font-size: 20px; font-weight: bold">STATUS </span>        
           <select name="status">
                <option value="5" selected>--</option>
                <option value="0">EM PRODUÇÃO</option>
                <option value="1">EM TRANSPORTE</option>
                <option value="2">ENTREGUE - (FINALIZADO)</option>
          </select>
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
                <th>NOME CLIENTE</th>
                <th>QTD DE MARMITA</th>                
                <th>MARMITA SOLICITADA</th>                
                <th>VALOR DO PEDIDO</th>
                <th>DATA DE REALIZAÇÃO DO PEDIDO</th>  
                <th>STATUS DO PEDIDO</th>                            
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pedidos}" var="pedidos">
                <tr>                                                            
                    <td><c:out value="${pedidos.cd_numeroPedido}" /></td>                   
                    
                    <c:choose>
                        <c:when test="${not empty pedidos.cpf}">             
                            <td><c:out value="${pedidos.nomeUsuario}" /></td>
                        </c:when>              
                        <c:otherwise>              
                            <td>USUÁRIO REMOVIDO</td>
                        </c:otherwise>
                    </c:choose>
                    
                    <td><c:out value="${pedidos.qtd_marmita}" /></td>
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
                    <td>R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${pedidos.valorPedido * pedidos.qtd_marmita}"/></td>                            
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
        <br><br>
        <a href="UserController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>" class="retornar">Voltar</a>        
        <br>
        <a href="login.jsp" class="retornar">Sair</a>
        </div> 
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
