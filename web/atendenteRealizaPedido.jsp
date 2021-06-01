<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TELA ATENDENTE PEDIDO</title>
        <style>
            #qtd{
                width:40px;                
             }
             .itemCardapio{
                 text-align: center;                
             }
             
             #btnSair{
                 background-color: red;
                 color: white;
             }
        </style>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>                
        TELA DE PEDIDOS - ATENDENTE <span style="color: red"><c:out value="${users.nomeUsuario}" /></span>!                       
        <c:choose>
            <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->               
                <p style="color: blue; font-family: monospace; font-size: 20px;">E-mail logado: ${users.email}</p>
            </c:when>              
            <c:otherwise> <!--Veio direto do login-->               
                <p style="color: green; font-family: monospace; font-size: 20px;">E-mail logado: <%=request.getAttribute("email")%></p>
            </c:otherwise>
        </c:choose>                                                                               
        
        <c:choose>
            <c:when test="${not empty users.cpf}">  <!--Veio da tela do UPDATE-->              
                <p style="color: blue; font-family: monospace; font-size: 20px;">CPF logado: ${users.cpf}</p>
            </c:when>              
            <c:otherwise> <!--Veio direto do login-->               
                <p style="color: green; font-family: monospace; font-size: 20px;">CPF logado: <%=request.getAttribute("cpf")%></p>
            </c:otherwise>
        </c:choose>                                                                                        
               
        <br>
        <input id="btnSair" type="button" value="Sair" onclick="window.location='login.jsp'"><%session.invalidate();%>                        
        
        <!--CARDÁPIO-->                            
        <!--ESCONDIDINHO PEQUENIO-->
        <form method="POST" action='TesteController'>
            <h1>CARDÁPIO</h1>
            <label> Nome Cliente: </label>
            <input type="text" name="nm_cliente_temp" placeholder="Digite o nome do cliente  "/>
            <br>
            <label> Endereço Cliente: </label>
            <input type="text" name="ds_endereco_cliente_temp" placeholder="Digite o endereço do cliente  "/>
            <br><br>
            <c:forEach items="${marmitas}" var="marmita">
                <table border="1">
                    <thead>
                    <th colspan="3" style="text-transform: uppercase"><c:out value="${marmita.nomeMarmita}" /></th>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="itemCardapio">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5"></td>
                            <td class="itemCardapio">Preço por unidade: <input type="text" name="preco" value="${marmita.preco}" hidden>R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${marmita.preco}"/></td>
                            <input type="text" hidden name="cd_nr_marmita" value="${marmita.cd_nr_marmita}">
                        </tr>
                    </tbody>
                </table>
                <br>
            </c:forEach>
            <br>
            <label for="acomp">Acompanhamento</label>

            <select name='role'>
                <option value="${selected}" selected>${selected}</option>
                <c:forEach items="${acomps}" var="acomp">
                    <c:if test="${acomp.cd_acompanhamento != selected}">
                        <option value="${acomp.cd_acompanhamento}">${acomp.nomeAcompanhamento} - Valor R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${acomp.precoAcompanhamento}"/></option>
                    </c:if>
                </c:forEach>
            </select>
                
            
            <br>
            <input type="radio" id="frmpgmt" name="frmpgmt" value="dinheiro">
            <label for="male">Dinheiro</label>
            <input type="radio" id="frmpgmt" name="frmpgmt" value="cartao">
            <label for="female">Cartão</label><br>
            <input type="submit" value="Efetuar pedido">
            <input type="text" name="tamanho" value="medio" hidden><br>   
            <input type="text" name="cd_marmita" value="4" hidden><br> 
        </form>                                                                                                                         
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
