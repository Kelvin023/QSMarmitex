<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QS Marmitex - Lista de Usuários </title>
        <link rel="shortcut icon" href="img/icone.png">
        <link rel="stylesheet" href="css/estilo.css">
        <style>
        @media (max-width: 1400px){
                .tamanho {
                    width: 90vw;
                    height: fit-content;
                    margin-bottom: 19.6%;
                }   
            } 
            
             @media (min-width: 1400px){
                .tamanho {
                    width: 60vw;
                    height: fit-content;
                    margin-bottom: 28.5%;
                }
            }  
            
            table, th, td{
                border: solid 2px black;
                font-size: 12px;
            }
            th, td {
                padding-left: 30px;
                padding-right: 30px;
            }
            
            .retornar{
                 text-decoration: none; 
                color: #B22222;
                width: 20%;
                display: inline-block;
                border-radius: 10px;
                cursor: pointer;
            }
            .add{
                text-decoration: none; 
                
                width: 40%;
                display: inline-block;
                
                cursor: pointer;
            }
        </style>
    </head>
<body>
    <c:import url="includes/cabecalho.jsp"/>       
    <!--<h1>CPF do Admin logado: <%=(String)request.getAttribute("cpf")%></h1>-->
    <div id="container" class="tamanho">
    <h1>Administrador logado: <c:out value="${usuario.nomeUsuario}" /></h1>
    <br><br>
    <table border=1>
        <thead>
            <tr>
                <th>PERFIL</th>                
                <th>NOME</th>                
                <th>TELEFONE</th>
                <th>ENDERECO</th>
                <th>EMAIL</th>
                <th>DATA NASCIMENTO</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>                    
                    <c:choose>
                        <c:when test="${user.cd_perfilUsuario == 1}">
                            <!--<td>ADM - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>ADM</td>
                        </c:when>    
                        <c:when test="${user.cd_perfilUsuario == 2}">
                            <!--<td>ADM - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>ATENDENTE</td>
                        </c:when>     
                        <c:when test="${user.cd_perfilUsuario == 4}">
                            <!--<td>ADM - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>ENTREGADOR</td>
                        </c:when>  
                        <c:when test="${user.cd_perfilUsuario == 5}">
                            <!--<td>ADM - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>COZINHEIRO</td>
                        </c:when>     
                        <c:otherwise>
                            <!--<td>CLIENTE - <c:out value="${user.cd_perfilUsuario}"/></td>-->
                            <td>CLIENTE</td>
                        </c:otherwise>
                    </c:choose>                                        
                    <td><c:out value="${user.nomeUsuario}" /></td>                    
                    <td><c:out value="${user.telefoneUsuario}" /></td>
                    <td><c:out value="${user.endereco}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${user.dt_nascimento}" /></td>                    
                    <!--<td><a href="UserController?action=edit&cpf=<c:out value="${user.cpf}"/>">Update</a></td>-->
                    <td><a href="UserController?action=edit&cpfLogado=<%=(String)request.getAttribute("cpf")%>&cpf=<c:out value="${user.cpf}"/>&cd_perfilUsuario=<c:out value="${user.cd_perfilUsuario}"/>">Update</a></td>
                    
                    <td><a href="UserController?action=delete&cpfLogado=<%=(String)request.getAttribute("cpf")%>&cpf=<c:out value="${user.cpf}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="UserController?action=insert&cd_perfilUsuario=1&cpfLogado=<%=(String)request.getAttribute("cpf")%>" class="add">Add Administrador</a></p>
    <p><a href="UserController?action=insert&cd_perfilUsuario=4&cpfLogado=<%=(String)request.getAttribute("cpf")%>" class="add">Add Entregador</a></p>    
    <p><a href="UserController?action=insert&cd_perfilUsuario=5&cpfLogado=<%=(String)request.getAttribute("cpf")%>" class="add">Add Cozinheiro</a></p>    
    <a href="UserController?action=voltar&cd_perfilUsuario=1&cpf=<%=(String)request.getAttribute("cpf")%>" class="retornar">Voltar</a><br>
    <a class="retornar" href="login.jsp">Sair</a>
    </div> 
    <c:import url="includes/rodape.jsp"/>
</body>
</html>