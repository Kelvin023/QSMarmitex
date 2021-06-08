<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Despesas registradas no Sistema</title>
        <link rel="shortcut icon" href="img/icone.png">
        
        <style>
            #btnZerar{
                width: 160px;
                height: 40px;
                line-height: 40px;
                padding: 10px 5px;
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
        <h1>Lista de DESPESAS</h1>                
                            
            CPF LOGADO: <c:out value="<%=(String)request.getAttribute("cpf")%>" />
            
            <br><br>
            <!--FILTROS DE PERÍODO-->        
            <span style="font-size: 20px; font-weight: bold">PERÍODO: </span>
            <form method="POST" action="RelatorioDespesaController">
                <label>Data início</label>
                <input type="date" name="dtinicio">
                <label>Data fim</label>
                <input type="date" name="dtfim">
                <input type="text" name="cpf" hidden value="<%=request.getAttribute("cpf")%>"/>           

            <!--FILTROS DE TIPO DESPESA-->        
            <span style="font-size: 20px; font-weight: bold">TIPO DESPESA </span>        
               <select name="tipoDespesa">
                    <option value="6" selected>--</option>
                    <option value="1">CARNES</option>
                    <option value="2">VERDURAS</option>
                    <option value="3">MASSAS</option>
                    <option value="4">EMBALAGENS</option>
                    <option value="5">TEMPEROS</option>
              </select>
                <input type="text" name="cpf" hidden value="<%=request.getAttribute("cpf")%>"/>
                <button type="submit">APLICAR FILTRO</button>            
            </form>        
            <br>
        
        <a id="btnZerar" href="DespesaController?action=listDespesas&cpf=<%=(String)request.getAttribute("cpf")%>">
            Zerar filtro
        </a>
        <br><br>
         <c:if test="${not empty dtinicio}">                
            <h2>#Filtro Utilizado# Data início: <%=request.getAttribute("dtinicio")%>  ***  Data fim: <%=request.getAttribute("dtfim")%></h2>
        </c:if>  
            
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
