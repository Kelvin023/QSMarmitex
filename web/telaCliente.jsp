<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS MARMITEX</title>
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
        Bem vindo à tela de CLIENTE <span style="color: red"><c:out value="${users.nomeUsuario}" /></span>!                       
        <c:choose>
            <c:when test="${not empty users.email}">                
                <p style="color: blue; font-family: monospace; font-size: 20px;">E-mail logado: ${users.email}</p>
            </c:when>              
            <c:otherwise>                
                <p style="color: green; font-family: monospace; font-size: 20px;">E-mail logado: <%=request.getAttribute("email")%></p>
            </c:otherwise>
        </c:choose>                                                                               
        
        <c:choose>
            <c:when test="${not empty users.cpf}">                
                <p style="color: blue; font-family: monospace; font-size: 20px;">CPF logado: ${users.cpf}</p>
            </c:when>              
            <c:otherwise>                
                <p style="color: green; font-family: monospace; font-size: 20px;">CPF logado: <%=request.getAttribute("cpf")%></p>
            </c:otherwise>
        </c:choose>                 
                
                
        <c:if test="${not empty naoTemCartao}">
            <h2 style="color: darkorchid">
                <%=request.getAttribute("naoTemCartao")%>
            </h2>
        </c:if>
                
        <c:if test="${not empty mensagem}">
            <h2 style="color: darkorchid">
                <%=request.getAttribute("mensagem")%>
            </h2>
        </c:if>

        <c:choose>           
            <c:when test="${not empty users.email}">
                <a style="color: red" href="UserController?action=edit&cpf=<c:out value="${users.cpf}"/>&cd_perfilUsuario=3">Editar</a>
            </c:when>                          
            <c:otherwise>                                
                <a style="color: green" href="UserController?action=edit&cpf=<%=(String)request.getAttribute("cpf")%>&cd_perfilUsuario=3">Editar</a>
            </c:otherwise>
        </c:choose>
        <br>        
       
        <c:choose>            
            <c:when test="${not empty users.email}">    
                <a style="color: red" href="CartaoController?action=listCartao&cpf=<c:out value="${users.cpf}"/>">Cartões</a>                
            </c:when>                          
            <c:otherwise>  
                <a style="color: green" href="CartaoController?action=listCartao&cpf=<%=(String)request.getAttribute("cpf")%>">Cartões</a>                
            </c:otherwise>
        </c:choose>                       
        <br>
        <c:choose>            
            <c:when test="${not empty users.email}">    
                <a style="color: red" href="PedidoController?action=listPedido&cpf=<c:out value="${users.cpf}"/>">Pedidos</a>                
            </c:when>                          
            <c:otherwise>  
                <a style="color: green" href="PedidoController?action=listPedido&cpf=<%=(String)request.getAttribute("cpf")%>">Pedidos</a>                
            </c:otherwise>
        </c:choose>
        <br>
        <input id="btnSair" type="button" value="Sair" onclick="window.location='login.jsp'"><%session.invalidate();%>
                
        
        <!--CARDÁPIO-->
        <h1>CARDÁPIO</h1>
        <!--ESCONDIDINHO PEQUENIO-->
        <form method="POST" action='PedidoController'>
            <table border="1">
                <thead>
                    <th colspan="2">ESCONDIDINHO FITNESS PEQUENO</th>
                </thead>
                <tbody>
                    <tr>
                        <td class="itemCardapio">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5" required></td>
                        <td class="itemCardapio">Preço por unidade: <input type="text" name="preco" value="12.90" hidden>R$ 12,90</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Efetuar pedido">
            <input type="text" name="tamanho" value="pequeno" hidden><br>            
            <input id="qtd" type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>            
            <c:choose>
                <c:when test="${not empty users.email}">                
                    <input type="text" name="email" value="${users.email}" hidden><br>            
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${not empty users.cpf}">                
                    <input type="text" name="cpf" value="${users.cpf}" hidden><br>
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden><br>
                </c:otherwise>
            </c:choose>            
        </form>
        
        <!--ESCONDIDINHO MÉDIO-->
        <form method="POST" action='PedidoController'>
            <table border="1">
                <thead>
                    <th colspan="2">ESCONDIDINHO FITNESS MÉDIO</th>
                </thead>
                <tbody>
                    <tr>
                        <td class="itemCardapio">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5" required></td>
                        <td class="itemCardapio">Preço por unidade: <input type="text" name="preco" value="18.90" hidden>R$ 18,90</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Efetuar pedido">
            <input type="text" name="tamanho" value="medio" hidden><br>            
            <input id="qtd" type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>            
            <c:choose>
                <c:when test="${not empty users.email}">                
                    <input type="text" name="email" value="${users.email}" hidden><br>            
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${not empty users.cpf}">                
                    <input type="text" name="cpf" value="${users.cpf}" hidden><br>
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden><br>
                </c:otherwise>
            </c:choose>            
        </form>
            
        <!--ESCONDIDINHO GRANDE-->
        <form method="POST" action='PedidoController'>
            <table border="1">
                <thead>
                    <th colspan="2">ESCONDIDINHO FITNESS MÉDIO</th>
                </thead>
                <tbody>
                    <tr>
                        <td class="itemCardapio">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5" required></td>
                        <td class="itemCardapio">Preço por unidade: <input type="text" name="preco" value="24.90" hidden>R$ 24,90</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Efetuar pedido">
            <input type="text" name="tamanho" value="grande" hidden><br>            
            <input id="qtd" type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>            
            <c:choose>
                <c:when test="${not empty users.email}">                
                    <input type="text" name="email" value="${users.email}" hidden><br>            
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${not empty users.cpf}">                
                    <input type="text" name="cpf" value="${users.cpf}" hidden><br>
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden><br>
                </c:otherwise>
            </c:choose>            
        </form>
            
            
        <!--SALADA PEQUENA-->
        <form method="POST" action='PedidoController'>
            <table border="1">
                <thead>
                    <th colspan="2">SALADA AMERICANA PEQUENA</th>
                </thead>
                <tbody>
                    <tr>
                        <td class="itemCardapio">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5" required></td>
                        <td class="itemCardapio">Preço por unidade: <input type="text" name="preco" value="19.90" hidden>R$ 19,90</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Efetuar pedido">
            <input type="text" name="tamanho" value="pequeno" hidden><br>            
            <input id="qtd" type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>            
            <c:choose>
                <c:when test="${not empty users.email}">                
                    <input type="text" name="email" value="${users.email}" hidden><br>            
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${not empty users.cpf}">                
                    <input type="text" name="cpf" value="${users.cpf}" hidden><br>
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden><br>
                </c:otherwise>
            </c:choose>            
        </form>
            
            
            
        <!--SALADA MÉDIA-->
        <form method="POST" action='PedidoController'>
            <table border="1">
                <thead>
                    <th colspan="2">SALADA AMERICANA PEQUENA</th>
                </thead>
                <tbody>
                    <tr>
                        <td class="itemCardapio">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5" required></td>
                        <td class="itemCardapio">Preço por unidade: <input type="text" name="preco" value="23.90" hidden>R$ 23,90</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Efetuar pedido">
            <input type="text" name="tamanho" value="medio" hidden><br>            
            <input id="qtd" type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>            
            <c:choose>
                <c:when test="${not empty users.email}">                
                    <input type="text" name="email" value="${users.email}" hidden><br>            
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden><br>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${not empty users.cpf}">                
                    <input type="text" name="cpf" value="${users.cpf}" hidden><br>
                </c:when>              
                <c:otherwise>                
                    <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden><br>
                </c:otherwise>
            </c:choose>            
        </form>
            
        
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
