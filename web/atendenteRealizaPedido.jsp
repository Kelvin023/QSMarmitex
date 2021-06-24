<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Pedido"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Pedido Atendente</title>
        <link rel="stylesheet" href="css/estilo.css">
        <style>
            @media (max-width: 1400px){
                .tamanho{
                    width: 48vw;
                    height: fit-content;
                    margin-bottom: 11.3%; 
                    
                    
                }
                
            }
            
            @media (min-width: 1400px){
                .tamanho{
                    width: 40vw;
                    height: fit-content;
                    margin-bottom: 11.3%; 
                    
                }
                .lista{
                        font-size: 18px;
                }
            }
            
            #topo{
                text-align: left;
                margin-bottom: 3%;
                
            }   

            #cardapio {
               padding-top: 1%;    
            }
 
            .item {
               border: solid 0.2px red;
               padding: 1%;
               margin-bottom: 1%;  
               width: 43%;
               float: left; 
               border-radius: 10px;
            }
            
            .clear{
                clear: both;
            }
            
           input[type="button"]{
                text-align: center;
                text-transform: uppercase;              
                border: none;            
                color: #B22222;           
                cursor: pointer;
                margin-top: 3%;
                background-color: #FFF;

            }

            input[type="button"]:hover {
                color: #8B0000;
                transition: 0.5s;
                border: none;
            }
            
            .bvC{
                font-size: 2rem;
                font-weight: bold;
                text-align: center;
                margin-bottom: 2%; 
            }
            
            .lista{
                text-decoration: none;
                color: #B22222;
                text-align: center;
                border: solid 0.2px #B22222;
                width: 22%;
                margin: 4%;  
                padding-left:  5%;
                float: left;
                
            }
            
            .nomeMmta{
                text-align: center;
                padding-bottom: 2%;
                font-weight: bold;
            }
           
            .pedido{
               text-align: left;
               margin-bottom: 2%;
            }
            
            
        </style>
        <link rel="shortcut icon" href="img/icone.png">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>    
        <div id="container" class="tamanho">
            <div id="topo">             
       <h1 style="text-align: center">Tela Atendente</h1> 
       <br><br><br>
       <span style="color: red"><c:out value="${users.nomeUsuario}" /></span>                      
        <c:choose>
            <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->               
                <p style="color: blue; font-family: monospace; font-size: 20px;">E-mail logado: ${users.email}</p>
            </c:when>              
            <c:otherwise> <!--Veio direto do login-->               
                <p style="color: green; font-family: monospace; font-size: 20px;">E-mail logado: <%=request.getAttribute("email")%></p>
            </c:otherwise>
        </c:choose>                                                                               
        
        <c:choose>
            <c:when test="${not empty users.cpf}">  <!--Veio da tela do UPDATE-->              
                <p style="color: blue; font-family: monospace; font-size: 20px;">CPF logado: ${users.cpf}</p>
            </c:when>              
            <c:otherwise> <!--Veio direto do login-->               
                <p style="color: green; font-family: monospace; font-size: 20px;">CPF logado: <%=request.getAttribute("cpf")%></p>
            </c:otherwise>
        </c:choose>                                                                                        
               
        
        <!--CARDÁPIO-->                            
        <!--ESCONDIDINHO PEQUENIO-->                
        <br><br><br>    
            <label> Nome Cliente: </label>
            <input type="text" name="nm_cliente_temp" placeholder="Digite o nome do cliente  "/>
            <br>
            <label> Endereço Cliente: </label>
            <input type="text" name="ds_endereco_cliente_temp" placeholder="Digite o endereço do cliente  "/>
            <br><br>
            
            <!--
            <c:forEach items="${marmitas}" var="marmita">
                <table border="1">
                    <thead>
                    <th colspan="3" style="text-transform: uppercase"><c:out value="${marmita.nomeMarmita}" /></th>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="itemCardapio">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5"></td>
                            <td class="itemCardapio">Preço por unidade: <input type="text" name="preco" value="${marmita.preco}" hidden>R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${marmita.preco}"/></td>
                            <input type="text" hidden name="cd_nr_marmita" value="${marmita.cd_nr_marmita}">
                        </tr>
                    </tbody>
                </table>
                <br>
            </c:forEach>
            -->
            
            <!--
            <input type="checkbox" name="saladap" value="Salada Americana Pequena">
            <label for="saladap">Salada Americana Pequena</label>
            >>>Preço Unitário <input type="text" name="precosalp" value="19.90" hidden>R$ 19,90
            >>> Quantidade<input  type="number" name="qtdsalp" min="1" max="5"><br>
            
            <input type="checkbox" name="saladam" value="Salada Americana Media">
            <label for="saladam">Salada Americana Media</label>
            >>>Preço Unitário <input type="text" name="precosalm" value="23.90" hidden>R$ 23,90
            >>> Quantidade<input  type="number" name="qtdsalm" min="1" max="5"><br>
            
            <input type="checkbox" name="escondp" value="Escondidinho Fitness Pequeno">
            <label for="escondp">Escondidinho Fitness Pequeno</label>
            >>>Preço Unitário <input type="text" name="precoescondp" value="12.90" hidden>R$ 12,90
            >>> Quantidade<input  type="number" name="qtdescondp" min="1" max="5"><br>
            
            <input type="checkbox" name="escondm" value="Escondidinho Fitness Medio">
            <label for="escondm">Escondidinho Fitness Medio</label>
            >>>Preço Unitário <input type="text" name="precoescondm" value="18.90" hidden>R$ 18,90
            >>> Quantidade<input  type="number" name="qtdescondm" min="1" max="5"><br>
            
            <input type="checkbox" name="escondg" value="Escondidinho Fitness Grande">
            <label for="escondg">Escondidinho Fitness Grande</label>
            >>>Preço Unitário <input type="text" name="precoescondg" value="24.90" hidden>R$ 24,90
            >>> Quantidade<input  type="number" name="qtdescondg" min="1" max="5"><br>
            -->                        
           </div>  
           <div id="cardapio">
           <h1 style="margin-bottom: 4%">CARDÁPIO</h1>
            
             <div class="item" style="margin-right:14%"  >                 
                <!--ESCONDIDINHO PEQUENIO-->

                <form method="POST" action='PedidoController'>
                    
                        
                    <p class="nomeMmta">ESCONDIDINHO FITNESS PEQUENO<p>
                    <p class="pedido">Quantidade: <input  type="number" name="quantidade" min="1" max="5" required></p>
                  
                    <p class="pedido">Preço por unidade: <input type="text" name="preco" value="12.90" hidden>R$ 12,90</p> 
                   
                    <p style="margin-top:5%">Metodo de pagamento:</p>
                    <br>
                    <div>
                   <!-- <label for="male">Dinheiro</label>-->
                    <input type="radio"  name="frmpgmt" value="dinheiro">Dinheiro
                    </div>
                    <div>
                    <input type="radio"  name="frmpgmt" value="cartao">Cartão
                    <!--<label for="female">Cartão</label>-->
                    </div>
                    <!--<input type="text" name="ds_observacao" placeholder="Entre com a observação a respeito do pedido">-->
                    <input type="submit" value="Efetuar pedido">
                    <input type="text" name="tamanho" value="pequeno" hidden>           
                    <input type="text" name="cd_marmita" value="3" hidden>           
                    <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>           
                    <c:choose>
                        <c:when test="${not empty users.email}">                
                            <input type="text" name="email" value="${users.email}" hidden>           
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty users.cpf}">                
                            <input type="text" name="cpf" value="${users.cpf}" hidden>
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden>
                        </c:otherwise>
                    </c:choose>            
                </form>
                    
            </div>        
             <div class="item" >
                
                <!--ESCONDIDINHO MÉDIO-->
                
                <form method="POST" action='PedidoController'>
                    
                    <p class="nomeMmta">ESCONDIDINHO FITNESS MÉDIO<p>
                    <p class="pedido">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5" required></p>
                    <p class="pedido">Preço por unidade: <input type="text" name="preco" value="18.90" hidden>R$ 18,90</p> 
                    
                    <p style="margin-top:5%">Metodo de pagamento:</p>   
                    <br>
                    <div>
                        <input type="radio"  name="frmpgmt" value="dinheiro">Dinheiro
                        <!--<label for="male">Dinheiro</label>-->
                    </div>
                    <div>
                        <input type="radio"  name="frmpgmt" value="cartao">Cartão
                        <!--<label for="female">Cartão</label>-->
                    </div>
                    <input type="submit" value="Efetuar pedido">
                    <input type="text" name="tamanho" value="medio" hidden> 
                    <input type="text" name="cd_marmita" value="4" hidden>            
                    <input id="qtd" type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>           
                    <c:choose>
                        <c:when test="${not empty users.email}">                
                            <input type="text" name="email" value="${users.email}" hidden>            
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty users.cpf}">                
                            <input type="text" name="cpf" value="${users.cpf}" hidden>
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden>
                        </c:otherwise>
                    </c:choose>            
                </form>
            </div>
                    
             
                    
            <div class="item" style="margin-right:14%">  
                
                <!--ESCONDIDINHO GRANDE-->
                
                <form method="POST" action='PedidoController'>
                    
                    <p class="nomeMmta">ESCONDIDINHO FITNESS GRANDE</p>
                    <p class="pedido">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5" required></p>
                    <p class="pedido">Preço por unidade: <input type="text" name="preco" value="24.90" hidden>R$ 24,90</p>
                       
                    <p style="margin-top:5%">Metodo de pagamento:</p>  
                    <br>
                    <div>
                        <input type="radio"  name="frmpgmt" value="dinheiro">Dinheiro
                        <!--<label for="male">Dinheiro</label>-->
                    </div>
                    <div>
                        <input type="radio"  name="frmpgmt" value="cartao">Cartão
                        <!--<label for="female">Cartão</label>-->
                    </div>
                    <input type="submit" value="Efetuar pedido">
                    <input type="text" name="tamanho" value="grande" hidden>  
                    <input type="text" name="cd_marmita" value="5" hidden>       
                    <input id="qtd" type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>          
                    <c:choose>
                        <c:when test="${not empty users.email}">                
                            <input type="text" name="email" value="${users.email}" hidden>           
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty users.cpf}">                
                            <input type="text" name="cpf" value="${users.cpf}" hidden>
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden>
                        </c:otherwise>
                    </c:choose>            
                </form>
            </div> 
                    
            <div class="item" >
                <!--SALADA PEQUENA-->
                
                <form method="POST" action='PedidoController'>
                   
                    <p class="nomeMmta">SALADA AMERICANA PEQUENA</p>
                    <p class="pedido">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5" required></p>
                    <p class="pedido">Preço por unidade: <input type="text" name="preco" value="19.90" hidden>R$ 19,90</p>
                                              
                     <p style="margin-top:5%">Metodo de pagamento:</p>  
                    <br>
                    <div>
                        <input type="radio"  name="frmpgmt" value="dinheiro">Dinheiro
                        <!--<label for="male">Dinheiro</label>-->
                    </div>
                    <div>
                        <input type="radio"  name="frmpgmt" value="cartao">Cartão   
                        <!--<label for="female">Cartão</label>-->
                    </div>
                    <input type="submit" value="Efetuar pedido">
                    <input type="text" name="tamanho" value="pequeno" hidden> 
                    <input type="text" name="cd_marmita" value="1" hidden>           
                    <input id="qtd" type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>            
                    <c:choose>
                        <c:when test="${not empty users.email}">                
                            <input type="text" name="email" value="${users.email}" hidden>            
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty users.cpf}">                
                            <input type="text" name="cpf" value="${users.cpf}" hidden>
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden>
                        </c:otherwise>
                    </c:choose>            
                </form>
            </div>

            <div class="item">
                
                <!--SALADA MÉDIA-->
                
                <form method="POST" action='PedidoController'>
                    
                    <p class="nomeMmta">SALADA AMERICANA MÉDIA</p>
                    <p class="pedido">Quantidade: <input id="qtd" type="number" name="quantidade" min="1" max="5" required></p>
                    <p class="pedido">Preço por unidade: <input type="text" name="preco" value="23.90" hidden>R$ 23,90</p>
                    
                    <p style="margin-top:5%">Metodo de pagamento:</p>  
                    <br>
                    <div>
                        <input type="radio"  name="frmpgmt" value="dinheiro">Dinheiro
                        <!--<label for="male">Dinheiro</label>-->
                    </div>
                    <div>
                        <input type="radio"  name="frmpgmt" value="cartao">Cartão
                        <!--<label for="female">Cartão</label>-->
                    </div>
                    <input type="submit" value="Efetuar pedido">
                    <input type="text" name="tamanho" value="medio" hidden>   
                    <input type="text" name="cd_marmita" value="2" hidden>            
                    <input id="qtd" type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>            
                    <c:choose>
                        <c:when test="${not empty users.email}">                
                            <input type="text" name="email" value="${users.email}" hidden>           
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="email" value="<%=request.getAttribute("email")%>" hidden>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty users.cpf}">                
                            <input type="text" name="cpf" value="${users.cpf}" hidden>
                        </c:when>              
                        <c:otherwise>                
                            <input type="text" name="cpf" value="<%=request.getAttribute("cpf")%>" hidden>
                        </c:otherwise>
                    </c:choose>            
                </form>
            </div>                              
            
            <hr class="clear"> 
           </div>
            <input  type="button" value="Sair" onclick="window.location='login.jsp'"><%session.invalidate();%>    
        </div> 
        <c:import url="includes/rodape.jsp"/>
    </body>
    
</html>
