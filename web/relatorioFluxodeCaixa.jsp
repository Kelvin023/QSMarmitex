<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Qs Marmitex - Tela Monitoramento</title>
        <link rel="shortcut icon" href="img/icone.png">
        <link rel="stylesheet" href="css/estilo.css">
        <style>
             @media (max-width: 1400px){
                .tamanho {
                    width: 68vw;
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
        </style>
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <div id="container" class="tamanho">
        <h1>Tela Administrador</h1>
        <h3>
            Tela de Fluxo de Caixa - Auxílio Tomada de Decisão <br>            
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
                    <td colspan="3" align="center" style="font-weight: bold">TOTAL FATURADO POR PERÍODO</td>
                </tr>
                <tr>
                    <th>MES</th>                    
                    <th>ANO</th>                                                       
                    <th>TOTAL FATURADO</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${totfaturado}" var="pedidos">
                    <tr>                                                                                                                                                            
                        <td><c:out value="${pedidos.mes_particao}" /></td>
                        <td><c:out value="${pedidos.ano_particao}" /></td>
                        <td>R$ <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${pedidos.vlr_total_pedido}"/></td>                                             
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <br>
        <table border=1>
            <thead>
                <tr>
                    <td colspan="3" align="center" style="font-weight: bold">TOTAL DAS DESPESAS POR PERÍODO</td>
                </tr>
                <tr>
                    <th>MES</th>                    
                    <th>ANO</th>                                                       
                    <th>VALOR TOTAL DE DESPESA</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${totdespesas}" var="totdespesas">
                    <tr>                                                                                                                                                            
                        <td><c:out value="${totdespesas.mes_despesa_particao}" /></td>
                        <td><c:out value="${totdespesas.ano_despesa_particao}" /></td>
                        <td>R$ <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${totdespesas.vlr_total_despesa}"/></td>                                             
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <br>
        <table border=1>
            <thead>
                <tr>
                    <td colspan="3" align="center" style="font-weight: bold">FLUXO DE CAIXA</td>
                </tr>
                <tr>
                    <th>MES</th>                    
                    <th>ANO</th>                                                       
                    <th>FLUXO RESULTANTE</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${fluxodecaixa}" var="fluxodecaixa">
                    <tr>                                                                                                                                                            
                        <td><c:out value="${fluxodecaixa.mes_particao}" /></td>
                        <td><c:out value="${fluxodecaixa.ano_particao}" /></td>
                        <td>R$ <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${fluxodecaixa.fluxo_resultante}"/></td>                                             
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <a href="PedidoController?action=voltarTelaAdm&cpf=<%=(String)request.getAttribute("cpf")%>" class="retornar">Retornar</a>
        <br>
        <a href="login.jsp" class="retornar">Sair</a>
        </div> 
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
