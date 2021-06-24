<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Lista de Marmitas</title>
        <link rel="shortcut icon" href="img/icone.png">
        <link rel="stylesheet" href="css/estilo.css">
        <style>
            
             @media (max-width: 1400px){
                .tamanho {
                    width: 48vw;
                    height: fit-content;
                    margin-bottom: 11.5%;
                }   
            } 
            
             @media (min-width: 1400px){
                .tamanho {
                    width: 29vw;
                    height: fit-content;
                    margin-bottom: 22.9%;
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
        <h1>Lista de Marmitas</h1>                
        <br><br>                  
            CPF LOGADO: <c:out value="<%=(String)request.getAttribute("cpf")%>" />
            <br><br> 
                <table border="1">
                    <thead>
                        <tr>
                            <th>CÓDIGO MARMITA</th>
                            <th>NOME MARMITA</th>
                            <th>INGREDIENTES</th>
                            <th>PREÇO UNITÁRIO</th>                           
                            <th colspan=2>ACTION</th>         
                        </tr>
                    </thead>    
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
                </table>            
        <p><a href="MarmitaController?action=insert&cpf=<%=(String)request.getAttribute("cpf")%>">Add Nova Marmita</a></p>
                
        <a href="UserController?action=voltar&cpf=<%=(String)request.getAttribute("cpf")%>" class="retornar">Retornar</a>
   
        </div>
        <c:import url="includes/rodape.jsp"/>
    </body>
</html>
