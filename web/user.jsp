<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css"
        href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!--<script type="text/javascript">

            $(function () {
                
                $("#botao").click (function () {
                
                var exp = /\.|\-/g;
                
                var cpf = $('#cpf').val().replace(exp,'').toString();
                
                if(cpf.length == 11 ){
                
                var v = [];

                //Calcula o primeiro d?gito de verifica??o.
                v[0] = 1 * cpf[0] + 2 * cpf[1] + 3 * cpf[2];
                v[0] += 4 * cpf[3] + 5 * cpf[4] + 6 * cpf[5];
                v[0] += 7 * cpf[6] + 8 * cpf[7] + 9 * cpf[8];
                v[0] = v[0] % 11;
                v[0] = v[0] % 10;

                //Calcula o segundo d?gito de verifica??o.
                v[1] = 1 * cpf[1] + 2 * cpf[2] + 3 * cpf[3];
                v[1] += 4 * cpf[4] + 5 * cpf[5] + 6 * cpf[6];
                v[1] += 7 * cpf[7] + 8 * cpf[8] + 9 * v[0];
                v[1] = v[1] % 11;
                v[1] = v[1] % 10;

                //Retorna Verdadeiro se os d?gitos de verifica??o s?o os esperados.
                        
                if ((v[0] != cpf[9]) || (v[1] != cpf[10])) {alert('CPF inv?lido ==> ' + cpf);$('#cpf').val('');$('#cpf').focus();}
                
                else if (cpf[0] == cpf[1] && cpf[1] == cpf[2] && cpf[2] == cpf[3] && cpf[3] == cpf[4] && cpf[4] == cpf[5] && cpf[5] == cpf[6] && cpf[6] == cpf[7] && cpf[7] == cpf[8] && cpf[8] == cpf[9] && cpf[9] == cpf[10])
                {alert('CPF inv?lido ==> ' + cpf);$('#cpf').val('');$('#cpf').focus();}        
                    
                else{alert('CPF OK ==> ' + cpf);$('#cpf').val('');$('#cpf').focus();}       
                    
                
                }else {alert('CPF inv?lido ==> ' + cpf);$('#cpf').val('');$('#cpf').focus();} // 11
                
                        
                    });
                    
                    //***********************
                    
                    })
                    

            </script> -->
    <title>QS Marmitex - Cadastro</title>
    <link rel="shortcut icon" href="img/icone.png">
    <link rel="stylesheet" href="css/estilo.css">
    <meta charset ="UTF-8">
    
    <style>
        @media (min-width: 1400px){
                .tamanho{
                    width: 22vw;
                    height: fit-content;
                    margin-bottom: 6%;   
                }    
        }
        
        @media (max-width: 1400px){
                .tamanho{
                    width: 28vw;
                    height: fit-content;
                    margin-bottom: 5%;   
                }    
        }
        
        label, input{
                width: 100%;       
        }
    </style>
</head>
<body>
    <c:import url="includes/cabecalho.jsp"/>
    <script>
        $(function() {
            $('input[name=dt_nascimento]').datepicker();
        });
    </script>
    <div id="container" class="tamanho">
        <h1>Cadastro</h1>
        <form method="POST" action='UserController' name="frmAddUser">                
            <c:choose>
                <c:when test="${not empty user.cpf}">
                    <label for="cpf">CPF</label>
                    <input type="text" name="cpf" placeholder="Digite seu CPF" id="cpf" class="form-control" onkeypress="$(this).mask('000.000.000-00');" readonly 
                           value="<c:out value="${user.cpf}"  />" /> 
                </c:when>              
                <c:otherwise>                                
                    <label  for="cpf">CPF</label>
                    <input type="text" name="cpf" placeholder="Digite seu CPF" id="cpf" class="form-control" onkeypress="$(this).mask('000.000.000-00');"
                           value="<c:out value="${user.cpf}" />" /> 
                </c:otherwise>
            </c:choose>
                <label for="senha">Senha </label>
                <input type="password" name="senha" autocomplete="off" placeholder="Digite sua Senha"
                       value="<c:out value="${user.senha}" />"/>
                
                <label for="email"> E-mail</label>
                <input type="text" name="email" placeholder="Digite seu E-mail  "
                       value="<c:out value="${user.email}" />" /> 
                
                <label for="nomeUsuario"> Nome</label> 
                <input type="text" name="nomeUsuario" placeholder="Digite seu Nome Completo "
                       value="<c:out value="${user.nomeUsuario}" />" /> 
                  
                <label for="telefoneUsuario"> Telefone</label>
                <input type="text" name="telefoneUsuario" placeholder="Digite seu Número de Telefone" class="form-control" onkeypress="$(this).mask('(00) 00000-0000');"
                       value="<c:out value="${user.telefoneUsuario}" />" /> 

                <label for="endereco"> Endereço</label> 
                <input type="text" name="endereco" placeholder="Digite seu Endereço"
                       value="<c:out value="${user.endereco}" />" /> 

                <label for="dt_nascimento"> Data Nascimento</label>
                <input type="text" placeholder="Digite sua Data de Nascimento" name="dt_nascimento" 
                       data-date-format="dd/MM/yyyy" class="form-control" onkeypress="$(this).mask('00/00/0000');"
                       value="<fmt:formatDate pattern="dd/MM/yyyy" 
                       value="${user.dt_nascimento}" />" /> <br />   

                <input type="text" name="cd_perfilUsuario" hidden="true"
                   value="<%=request.getAttribute("cdPerfilUsuario")%>"/>
                
                <input type="text" name="cpfLogado" hidden="true"
                   value="<%=request.getAttribute("cpfLogado")%>"/>
                
                <input type="submit" value="Cadastrar" id="botao" />                                    
                
        </form>              

        <!--<a href="UserController?action=voltar&cpf=<c:out value="${user.cpf}" />&cd_perfilUsuario=3">Retornar ao Cardapio</a>        -->            
    </div>
    
    
    <c:import url="includes/rodape.jsp"/>  
</body>
</html>