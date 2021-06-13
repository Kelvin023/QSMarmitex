<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Cliente</title>
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
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>  
        <div id="container" class="tamanho">
            <div id="topo">
                <p class="bvC" >Bem vindo à tela de Cliente <span ><c:out value="${users.nomeUsuario}" /></span>! </p>    
                
                
            <c:choose>
                <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->               
                    <p >E-mail logado: ${users.email}</p>
                </c:when>              
                <c:otherwise> <!--Veio direto do login-->               
                    <p >E-mail logado: <%=request.getAttribute("email")%></p>
                </c:otherwise>
            </c:choose>                                                                               
                    <br>
            <c:choose>
                <c:when test="${not empty users.cpf}">  <!--Veio da tela do UPDATE-->              
                    <p >CPF logado: ${users.cpf}</p>
                </c:when>              
                <c:otherwise> <!--Veio direto do login-->               
                    <p >CPF logado: <%=request.getAttribute("cpf")%></p>
                </c:otherwise>
            </c:choose>                 


            <c:if test="${not empty naoTemCartao}">
                <h2>
                    <%=request.getAttribute("naoTemCartao")%>
                </h2>
            </c:if>

            <c:if test="${not empty mensagem}">
                <h2 >
                    <%=request.getAttribute("mensagem")%>
                </h2>
            </c:if>
                    
            <c:if test="${not empty msgFidelidade}">
                <h2 >
                    <%=request.getAttribute("msgFidelidade")%>
                </h2>
            </c:if>
                    
            <c:if test="${not empty msgPedidoGratuito}">
                <h2 >
                    <%=request.getAttribute("msgPedidoGratuito")%>
                </h2>
            </c:if>

            <c:choose>           
                <c:when test="${not empty users.email}"><!--Veio da tela do UPDATE--> 
                    <a class="lista" href="UserController?action=edit&cpf=<c:out value="${users.cpf}"/>&cd_perfilUsuario=3">Editar</a>
                </c:when>                          
                <c:otherwise> <!--Veio direto do login-->                               
                    <a class="lista"href="UserController?action=edit&cpf=<%=(String)request.getAttribute("cpf")%>&cd_perfilUsuario=3">Editar</a>
                </c:otherwise>
            </c:choose>
                  

            <%--
            <c:choose>            
                <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->    
                    <a style="color: red" href="CartaoController?action=listCartao&cpf=<c:out value="${users.cpf}"/>">Cartões</a>                
                </c:when>                          
                <c:otherwise>  <!--Veio direto do login--> 
                    <a style="color: green" href="CartaoController?action=listCartao&cpf=<%=(String)request.getAttribute("cpf")%>">Cartões</a>                
                </c:otherwise>
            </c:choose>                       
            <br>
            --%>

            <c:choose>            
                <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->    
                    <a class="lista" href="PedidoController?action=listPedido&cpf=<c:out value="${users.cpf}"/>">Pedidos</a>                
                </c:when>                          
                <c:otherwise>  <!--Veio direto do login--> 
                    <a  class="lista" href="PedidoController?action=listPedido&cpf=<%=(String)request.getAttribute("cpf")%>">Pedidos</a>                
                </c:otherwise>
            </c:choose>
         
            <c:choose>            
                <c:when test="${not empty users.email}"> <!--Veio da tela do UPDATE-->    
                    <a  class="lista" style="width:27%" href="UserController?action=deleteClienteTelaCliente&cpf=<c:out value="${users.cpf}"/>">Deletar Conta</a>                
                </c:when>                          
                <c:otherwise>  <!--Veio direto do login--> 
                    <a class="lista" style="width:27%" href="UserController?action=deleteClienteTelaCliente&cpf=<%=(String)request.getAttribute("cpf")%>">Deletar Conta</a>                
                </c:otherwise>
            </c:choose>
            
                    <hr class="clear">
         </div> 
         
         <!--CARDÁPIO-->
         
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
        </div>
       <hr class="clear">
       <input  type="button" value="Sair" onclick="window.location='login.jsp'"><%session.invalidate();%>
    </div>    
    
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
