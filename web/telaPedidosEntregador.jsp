<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Delivery</title>
        <link rel="shortcut icon" href="img/icone.png">
        
        <link rel="stylesheet" href="css/estilo.css">
        <style>
           @media (max-width: 1400px){
                .tamanho {
                    width: 80vw;
                    height: fit-content;
                    margin-bottom: 13.7%;
                }   
            } 
            
             @media (min-width: 1400px){
                .tamanho {
                    width: 62vw;
                    height: fit-content;
                    margin-bottom: 24.3%;
                }
            }  
            
            table, th, td{
                border: solid 2px black;
                font-size: 12px;
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
        <h1>Lista de pedidos a serem entregues</h1>   
        <br>
        <h3>CPF do Entregador logado: <%=request.getAttribute("cpf")%></h3>
        <br>                                              
    <table border=1>
        <thead>
            <tr>
                <th>CODIGO DO PEDIDO</th>
                <th>CPF SOLICITANTE</th>
                <th>NOME SOLICITANTE</th>
                <th>ENDEREÇO DE ENTREGA</th>
                <th>MARMITA A SER ENTREGUE</th>  
                <th>QTD DE MARMITA</th>                
                <th>VALOR A SER COBRADO</th>
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
                    <td><c:out value="${pedidos.nomeUsuario}" /></td>                    
                    <td><c:out value="${pedidos.endereco}" /></td>   
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
                    <td>R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${pedidos.valorPedido * pedidos.qtd_marmita}"/></td>                     
                    <td><c:out default="dd/MM/yyyy" value="${pedidos.dt_pedido}" /></td>                                                                                    
                    <td>EM TRANSPORTE</td>      
                    <td><a href="PedidoController?action=atualizaPedidosEntrega&cpf=<%=request.getAttribute("cpf")%>&cd_numeroPedido=<c:out value="${pedidos.cd_numeroPedido}"/>">OK</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>                       
                                    
        <br><br>
        <a class="retornar" href="UserController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>">Voltar</a>        
       
       
        </div>  
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
