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
             
             #btnSair{
                 background-color: red;
                 color: white;
             }
        </style>
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
        
                
        <!--CARDÁPIO-->
        <hr>
        <form method="POST" action='PedidoController'>
            <h2>Escondidinho Fitness<span style="font-size: 15px"> - Mostrar os ingredientes e preço</span></h2>            
            <label>Quantidade</label>
            <input id="qtd" type="number" name="quantidade" min="1" max="5">
            <br>
            <label>Tamanho</label>
             <select name="tamanho">
                <option value="pequeno">Pequeno</option>
                <option value="medio">Médio</option>
                <option value="grande">Grande</option>                
              </select>
            <br><br>
            <input type="submit" value="Efetuar pedido">
        </form>
        <hr>
        
        <br><br>
              
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
        <br><br><br><br>
        <input id="btnSair" type="button" value="Sair" onclick="window.location='login.jsp'"><%session.invalidate();%>
        <br><br><br><br><br>
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
