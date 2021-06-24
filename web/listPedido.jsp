<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Lista de Pedidos</title>
        <link rel="shortcut icon" href="img/icone.png">
           <link rel="stylesheet" href="css/estilo.css">
        <style>
            
             @media (max-width: 1400px){
                .tamanho {
                    width: 48vw;
                    height: fit-content;
                    margin-bottom: 19.6%;
                }   
            } 
            
             @media (min-width: 1400px){
                .tamanho {
                    width: 29vw;
                    height: fit-content;
                    margin-bottom: 28.5%;
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
        </style>
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <div id="container" class="tamanho">
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
                            <th>MARMITA SOLICITADA</th>
                            <th>QUANTIDADE</th>
                            <th>VALOR TOTAL DO PEDIDO</th>
                            <th>DATA QUE O PEDIDO FOI EFETUADO</th>                            
                            <th>STATUS DO PEDIDO</th>                            
                        </tr>
                    </thead>    
                    <tbody>
                        <c:forEach items="${pedidos}" var="pedido">
                        <tr>                                                            
                            <td style="text-transform: uppercase;"><c:out value="${pedido.cd_numeroPedido}" /></td>                    
                            <c:choose>
                                <c:when test="${pedido.cd_marmita == 1}">                
                                    <td>SALADA AMERICANA PEQUENA</td> 
                                </c:when>              
                                <c:when test="${pedido.cd_marmita == 2}">                
                                    <td>SALADA AMERICANA MÉDIA</td> 
                                </c:when>
                                <c:when test="${pedido.cd_marmita == 3}">                
                                    <td>ESCONDIDINHO FITNESS PEQUENO</td>
                                </c:when>
                                <c:when test="${pedido.cd_marmita == 4}">                
                                    <td>ESCONDIDINHO FITNESS MÉDIO</td>
                                </c:when>
                                <c:otherwise>                
                                    <td>ESCONDIDINHO FITNESS GRANDE</td>
                                </c:otherwise>
                            </c:choose>
                            <td><c:out value="${pedido.qtd_marmita}" /></td>
                            <td>R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${pedido.valorPedido * pedido.qtd_marmita}"/></td>
                            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.dt_pedido}" /></td>                            
                            
                            <c:choose>
                                <c:when test="${pedido.st_pedido == 0}">                                    
                                    <td>EM PRODUÇÃO</td>
                                </c:when> 
                                <c:when test="${pedido.st_pedido == 1}">                                    
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
            </c:otherwise>
            </c:choose>         
                
        <a href="PedidoController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>">Retornar ao Cardapio</a>
        </div>  
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
