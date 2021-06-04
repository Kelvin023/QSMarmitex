<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sele��o de Despesas</title>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>       
                            
            CPF LOGADO: <c:out value="<%=(String)request.getAttribute("cpf")%>" />
            <br>
                <label for="acomp">Selecione a despesa a ser registrada</label>

            <form method="get" action="DespesaController">
                <select name="select">
                    <option value="1" selected>CARNES</option>
                    <option value="2">VERDURAS</option>
                    <option value="3">MASSAS</option>
                    <option value="4">EMBALAGENS</option>
                    <option value="5">TEMPEROS</option>
                </select>   
                <br>
                <input type="text" name="cpf" readonly hidden
                value="<c:out value="<%=request.getAttribute("cpf")%>" />"/>
                <br>
                
                <input type="text" name="action" readonly hidden
                value="insert"/>
                <br>
                <input type="submit" value="REGISTRAR DESPESA">
            </form>        
                
        <a href="DespesaController?action=listDespesas&cpf=<%=(String)request.getAttribute("cpf")%>">Retornar</a>
        <br><br><br><br><br><br>    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>

