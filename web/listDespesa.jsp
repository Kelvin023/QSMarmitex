<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Despesas registradas no Sistema</title>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <h1>Lista de DESPESAS</h1>                
                            
            CPF LOGADO: <c:out value="<%=(String)request.getAttribute("cpf")%>" />
                <table border="1">
                    <thead>
                        <tr>
                            <th>CÓDIGO DESPESA</th>  
                            <th>TIPO DESPESA</th>  
                            <th>VALOR</th>
                            <th>DESCRIÇÃO DA DESPESA</th>
                            <th>DATA REGISTRADA DA DESPESA</th>                           
                            <th colspan=2>ACTION</th>         
                        </tr>
                    </thead>  
                    
                    <tbody>
                        <c:forEach items="${despesas}" var="despesa">
                        <tr>                                                            
                            <td style="text-transform: uppercase;"><c:out value="${despesa.cd_despesa}" /></td>                                                
                            <c:choose>
                                <c:when test="${despesa.cd_tipo == 1}">                
                                    <td>CARNES</td> 
                                </c:when>              
                                <c:when test="${despesa.cd_tipo == 2}">                
                                    <td>VERDURAS</td> 
                                </c:when>
                                <c:when test="${despesa.cd_tipo == 3}">                
                                    <td>MASSAS</td>
                                </c:when>
                                <c:when test="${despesa.cd_tipo == 4}">                
                                    <td>EMBALAGENS</td>
                                </c:when>
                                <c:otherwise>                
                                    <td>TEMPEROS</td>
                                </c:otherwise>
                            </c:choose>
                            <td>R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${despesa.vl_despesa}"/></td>                    
                            <td><c:out value="${despesa.ds_despesa}" /></td>   
                            <td><c:out default="dd/MM/yyyy" value="${despesa.dt_inclusion}" /></td>
                            <td><a href="DespesaController?action=edit&cd_despesa=<c:out value="${despesa.cd_despesa}"/>&cd_tipo=<c:out value="${despesa.cd_tipo}"/>&cpf=<%=(String)request.getAttribute("cpf")%>">Update</a></td>
                            <td><a href="DespesaController?action=delete&cd_despesa=<c:out value="${despesa.cd_despesa}"/>&cpf=<%=(String)request.getAttribute("cpf")%>">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>            
                    
                </table>            
        <p><a href="DespesaController?action=selectDespesas&cpf=<%=(String)request.getAttribute("cpf")%>">REGISTRAR NOVA DESPESA</a></p>
                
        <a href="UserController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>">Retornar</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
