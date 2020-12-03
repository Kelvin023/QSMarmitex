<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de marmita</title>
        <style>
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }
            li {
                float: left;
            }

            li a {
                display: block;
                padding: 18px;
                background-color: #dddddd;
            }
            .header {
                border: 1px solid red;
                padding: 36px;
            }

        </style>
    </head>
    <body>
    <c:import url="includes/cabecalho.jsp"/>
    <h1>Cadastro de marmita</h1>
    <div class="header">
        <ul>
            <li><a href="jsp/cardapio.jsp">Menu</a></li>
            <li><a href="jsp/listmarmita.jsp">Marmitas</a></li>
            <li><a href="contact.asp">Acompanhamentos</a></li>
            <li><a href="jsp/listUser">Usuários</a></li>
            <li><a href="jsp/relatorioPedido">Relatórios</a></li>
            <li><a href="jsp/listPedido">Carrinho</a></li>
        </ul>
    </div>
    
    <br/>
    ${mensagemSucesso}
    <fieldset>
        <legend>Inclusão de marmita</legend>
        <form action="${pageContext.request.contextPath}/marmita" method="post">
            Foto: <input type="file" name="foto" placeholder="Insira a foto aqui"/><br/><br/>
            Nome: <input type="text" size="150" name="nomeMarmita" placeholder="O nome da marmita"/><br/><br/>
            Grupo: <input type="text" name="grupoMarmita" placeholder="O grupo da marmita"/><br/><br/>
            Ingredientes: <input type="text" size="100" name="ingredientes" placeholder="Os principais ingredientes da marmita"/><br/><br/>
            Preço: <input type="text" name="preco"/><br/><br/>
            <input type="submit" value="Cadastrar" name="cadastrar"/>
        </form>
    </fieldset>
    <br/>
    <a href="${pageContext.request.contextPath}/jsp/listmarmita.jsp">Voltar</a>
    <c:import url="includes/rodape.jsp"/>
</body>
</html>
