<%-- 
    Document   : alterarDados
    Created on : 16 de mai. de 2024, 12:40:04
    Author     : bruno.hgsilva3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.Connection"%>
<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Joti+One&family=Modak&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Londrina+Solid:wght@100;300;400;900&display=swap');

            body{
                margin-bottom: 10px;
                margin-top: 10px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            form {
                border: 3px solid #f1f1f1;
                font-family: "Londrina Solid";
                font-size: 22px;
                font-style: normal;
                font-weight: 400;
                line-height: 24px;
                color: #074568;
            }
            input[type=text],
            input[type=password],
            input[type=number] {
                width: 500px;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }
            .conteudo {
                padding: 16px;
            }
            button {
                background-color: #04AA6D;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                font-family: "Londrina Solid";
                font-size: 20px;
                font-style: normal;
                font-weight: 400;
                line-height: 24px;
            }

            button:hover {
                opacity: 0.8;
            }

        </style>
        <title>Alterar</title>
    </head>
    <body>
        <%  // recebe dados do usuario de outra pagina
            String u = request.getParameter("email");

            try {
                // conecta com banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                // busca dados do usuario para fazer alteração
                PreparedStatement st = conectado.prepareStatement("select * from usuario where email = ?");
                st.setString(1, u);
                ResultSet resultado = st.executeQuery();

                // exibi as informações do usuario e deixa ele alterar os dados
                if (resultado.next()) {

        %>

        <form action="alterarDados.jsp" method="post" onsubmit="return cadastrarUsuario()">

            <div class="conteudo">
                <p>
                    <label for="nome"><b>Nome</b></label><br>
                    <input type="text" placeholder="Insira seu nome completo" name="nome" id="nome" value="<%=resultado.getString("nome")%>" required>

                </p>
                <p>
                    <label for="idade"><b>idade</b></label><br>
                    <input type="number" placeholder="Insira sua idade (Maior de 18 anos)" name="idade" id="idade" value="<%=resultado.getString("idade")%>"
                           required>

                </p>

                <p>

                    <label for="cpf"><b>Cpf</b></label><br>
                    <input type="number" placeholder="Insira seu cpf" name="cpf" id="cpf" value="<%=resultado.getString("cpf")%>" required>

                </p>

                <p>

                    <label for="email"><b>Email</b></label><br>
                    <input type="text" placeholder="Insira seu email" name="email" id="email" value="<%=resultado.getString("email")%>" readonly>

                </p>
                <p>
                    <label for="senha"><b>Senha</b></label><br>
                    <input type="text" placeholder="Insira senha (min 6 caracteres)" name="senha" id="senha" value="<%=resultado.getString("senha")%>" required>

                </p>

                <button type="submit">Salvar Alteração</button>
            </div>

        </form>

        <!-- =============================================================================================================== -->
        <script>
            const nomeUsuario = window.document.getElementById('nome');
            const idade = document.getElementById('idade');
            const cpf = document.getElementById('cpf');
            const email = document.getElementById('email');
            const senha = window.document.getElementById('senha');
            const form = window.document.getElementsByTagName('form');

            var regNome = new RegExp("[A-z]{3,100}");
            var regEmail = new RegExp("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
            var regCpf = new RegExp("[0-9]{11}");
            var regSenha = new RegExp("^.{6,}$");

            // valida dados para salvar no banco de dados
            function cadastrarUsuario() {
                if (validarUsuario()) {
                    return true;
                } else {
                    alert("Campo com erro");
                    return false;
                }
            }
            /* função para validar cliente*/
            function validarUsuario() {
                if (regNome.test(nomeUsuario.value) && idade.value > 17 && regCpf.test(cpf.value) && regEmail.test(email.value) && regSenha.test(senha.value)) {
                    return true;
                } else {
                    return false;
                }
            }

        </script>


        <%                    }
            } catch (ClassNotFoundException ex) {// caso de erro
                out.println(ex);
            } catch (SQLException ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
