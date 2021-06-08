<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Cadastro Marmita</title>
        <link rel="stylesheet" href="css/estilo.css">
        
        <style>
            @media (max-width: 1400px){
                .tamanho {
                    width: 52vw;
                    height: fit-content;
                    margin-bottom: 5%;

                }
                li{
                    font-size: 13.7px;
                }
            }
            @media (min-width: 1400px){
                .tamanho {
                    width: 42vw;
                    height: fit-content;
                    margin-bottom: 5%;
                }
            } 
            label, input{
                    width: 100%;  
            }
            ul, a{
                    color: #FFF;
                    text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div>
            <c:import url="includes/cabecalho.jsp"/> 
        </div>
         
        
        
        <div id="container" class="tamanho">
            
            <div>
                <ul>
                    <li><a href="cardapio.jsp">Menu </a> </li> 
                    <li><a href="listmarmita.jsp">Marmitas</a> </li> 
                    <li><a href="contact.asp">Acompanhamentos</a> </li> 
                    <li><a href="listUser">Usuários</a> </li> 
                    <li><a href="relatorioPedido">Relatórios</a> </li> 
                    <li><a href="listPedido">Carrinho</a></li>
                </ul>
            </div>
            <h1>Cadastro de marmita</h1>
            
            ${mensagemSucesso}
            <fieldset>
                
                <form action="${pageContext.request.contextPath}/marmita" method="post">
                    <label for="foto">Foto</label> 
                    <input class="foto" type="file" name="foto" placeholder="Insira a foto aqui"/><br/><br/>
                    
                    <label for="nomeMarmita">Nome</label>
                    <input type="text" size="150" name="nomeMarmita" placeholder="Digite o nome da marmita"/><br/><br/>
                    
                    <label for="grupoMarmita">Grupo</label>
                    <input type="text" name="grupoMarmita" placeholder="Digite o grupo da marmita"/><br/><br/>
                    
                    <label for="ingredientes">Ingredientes</label>
                    <input type="text" size="100" name="ingredientes" placeholder="Digite os principais ingredientes da marmita"/><br/><br/>
                    
                    <label for="preco">Preço</label>
                    <input type="text" name="preco" placeholder="Digite o preço da marmita"/>
                    
                    <input type="submit" value="Cadastrar Marmita" name="cadastrar"/>
                </form>
            </fieldset>
            
            <a class="voltar" href="${pageContext.request.contextPath}/jsp/listmarmita.jsp">VOLTAR</a>
        </div>
        <div>
            <c:import url="includes/rodape.jsp"/> 
        </div>
    </body>
</html>
