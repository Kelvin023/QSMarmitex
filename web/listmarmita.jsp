
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marmitas</title>
        <link rel="stylesheet" href="css/estiloMarmita.css">

    </head>
    <body>
    <c:import url="includes/cabecalho.jsp"/>
    <h1>Quality Marmitex</h1>

    <div class="header">
        <ul>
            <li><a href="jsp/cardapio.jsp">Menu</a></li>
            <li><a href="jsp/listmarmita.jsp">Marmitas</a></li>
            <li><a href="contact.asp">Acompanhamentos</a></li>
            <li><a href="about.asp">Usuários</a></li>
            <li><a href="about.asp">Relatórios</a></li>
            <li><a href="about.asp">Carrinho</a></li>
        </ul>
    </div>
    <h1>Busca por marmitas</h1>
    <div class="search-box">
        <input class="search-txt" type="text" name=""placeholder="Tipo de Busca">
        <a class="search-btn" href="#">
            <i class="fas-fa-search">

            </i>
        </a>
    </div>
    <br/>
    <a href="jsp/addmarmita.jsp">Criar nova marmita</a>
    <c:import url="includes/rodape.jsp"/>
</body>
</html>
