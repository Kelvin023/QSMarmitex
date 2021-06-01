<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                            <th>C�DIGO DESPESA</th>
                            <th>DESPESA</th>
                            <th>VALOR</th>
                            <th>DATA REGISTRAEDA DESPESA</th>                           
                            <th colspan=2>ACTION</th>         
                        </tr>
                    </thead>  
                    <!--
                    <tbody>
                        <c:forEach items="${marmitas}" var="marmita">
                        <tr>                                                            
                            <td style="text-transform: uppercase;"><c:out value="${marmita.cd_nr_marmita}" /></td>                                                
                            <td><c:out value="${marmita.nomeMarmita}" /></td>
                            <td><c:out value="${marmita.ds_ingredientes}" /></td>                                        
                            <td>R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${marmita.preco}"/></td>                    
                            <td><a href="MarmitaController?action=edit&cd_nr_marmita=<c:out value="${marmita.cd_nr_marmita}"/>&cpf=<%=(String)request.getAttribute("cpf")%>">Update</a></td>
                            <td><a href="MarmitaController?action=delete&cd_nr_marmita=<c:out value="${marmita.cd_nr_marmita}"/>&cpf=<%=(String)request.getAttribute("cpf")%>">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>            
                    -->
                </table>            
        <p><a href="MarmitaController?action=insert&cpf=<%=(String)request.getAttribute("cpf")%>">Add Nova Despesa</a></p>
                
        <a href="UserController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>">Retornar</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>