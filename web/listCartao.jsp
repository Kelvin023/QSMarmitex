<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Cartoes</title>
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Lista de Cartoes</h1>                
        
        <c:choose>
            <c:when test="${empty cartoes}">
                <div id="erro">
                    <h2 style="color: red">Usuario nao contem cartao cadastrado no sistema!</h2>
                </div>                 
            </c:when>
            <c:otherwise>
                <table border="1">
                    <thead>
                        <tr>
                            <th>NOME TITULAR</th>
                            <th>CPF</th>
                            <th>NUMERO DO CARTAO</th>
                            <th>DATA DE VENCIMENTO</th>
                            <th>CVV</th>
                        </tr>
                    </thead>    
                    <tbody>
                        <c:forEach items="${cartoes}" var="cartao">
                        <tr>                                                            
                            <td style="text-transform: uppercase;"><c:out value="${cartao.nomeTitular}" /></td>                    
                            <td><c:out value="<%=(String)request.getAttribute("cpf")%>" /></td>                   
                            <td><c:out value="${cartao.numeroCartao}" /></td>
                            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${cartao.dtValCartao}" /></td>                                        
                            <td><c:out value="${cartao.cvvCartao}" /></td>                    
                            <td><a href="CartaoController?action=edit&cd_cartao=<c:out value="${cartao.cd_cartao}"/>&cpf=<%=(String)request.getAttribute("cpf")%>">Update</a></td>
                            <td><a href="CartaoController?action=delete&cd_cartao=<c:out value="${cartao.cd_cartao}"/>&cpf=<%=(String)request.getAttribute("cpf")%>">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>            
                </table>
            </c:otherwise>
            </c:choose> 
        <p><a href="CartaoController?action=insert&cpf=<%=(String)request.getAttribute("cpf")%>">Add Novo Cartao</a></p>
                
        <a href="CartaoController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>">Retornar ao Cardapio</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
