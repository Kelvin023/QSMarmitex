<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Lista Acompanhamentos</title>
        <link rel="shortcut icon" href="img/icone.png">
        <link rel="stylesheet" href="css/estilo.css">
        <style>
            
            @media (max-width: 1400px){
                .tamanho {
                    width: 52vw;
                    height: fit-content;
                    margin-bottom: 11.1%;
                }
                
                
            } 
             @media (min-width: 1400px){
                .tamanho {
                    width: 38vw;
                    height: fit-content;
                    margin-bottom: 22.5%;
                }
            }  
            
            table, th, td{
                border: solid 2px black;
            }
            
            .retornar{
                 text-decoration: none; 
                color: #B22222;
                width: 20%;
                display: inline-block;
                border-radius: 10px;
                cursor: pointer;
            }
            
            
        </style>
    </head>
    <body>
        <c:import url="includes/cabecalho.jsp"/>
        <div id="container" class="tamanho">
            <h1 style="padding-bottom: 20px">Lista de Acompanhamentos</h1>                
                            
            <div style="padding-bottom: 20px">
                CPF LOGADO: <c:out value="<%=(String)request.getAttribute("cpf")%>" />
               
            </div>
            
                <table>
                    <thead>
                        <tr>
                            <th>CÓDIGO ACOMPANHAMENTO</th>
                            <th>NOME ACOMPANHAMENTO</th>                            
                            <th>PREÇO UNITÁRIO</th>                           
                            <th colspan=2>ACTION</th>         
                        </tr>
                    </thead>    
                    <tbody>
                        <c:forEach items="${acomps}" var="acomp">
                        <tr>                                                            
                            <td style="text-transform: uppercase;"><c:out value="${acomp.cd_acompanhamento}" /></td>                                                
                            <td><c:out value="${acomp.nomeAcompanhamento}" /></td>                           
                            <td>R$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${acomp.precoAcompanhamento}"/></td>                    
                            <td><a href="AcompController?action=edit&cd_acompanhamento=<c:out value="${acomp.cd_acompanhamento}"/>&cpf=<%=(String)request.getAttribute("cpf")%>">Update</a></td>
                            <td><a href="AcompController?action=delete&cd_acompanhamento=<c:out value="${acomp.cd_acompanhamento}"/>&cpf=<%=(String)request.getAttribute("cpf")%>">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>            
                </table>            
        <p style="padding-top: 20px"><a href="AcompController?action=insert&cpf=<%=(String)request.getAttribute("cpf")%>">Add Novo Acompanhamento</a></p>
                
        <a href="UserController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>" class="retornar">Retornar</a>
        </div> 
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
