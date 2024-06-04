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

        </style>
        <title>Perfil</title>
    </head>
    <body>
        <%
            // recebe dados de outra pagina 
            String u = request.getParameter("email");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                //busca dados do usuario com a condição do email do usuario
                PreparedStatement st = conectado.prepareStatement("select * from usuario where email = ?");
                st.setString(1, u);
                ResultSet resultado = st.executeQuery();

                // exibi as informações do usuario
                if (resultado.next()) {

        %> 

        <form>

            <div class="conteudo">
                <p>
                    <label for="nome"><b>Nome</b></label><br>
                    <input type="text" placeholder="Insira seu nome completo" name="nome" id="nome" value="<%=resultado.getString("nome")%>" readonly>

                </p>
                <p>
                    <label for="idade"><b>idade</b></label><br>
                    <input type="number" placeholder="Insira sua idade (Maior de 18 anos)" name="idade" id="idade" value="<%=resultado.getString("idade")%>"
                           readonly>

                </p>

                <p>

                    <label for="cpf"><b>Cpf</b></label><br>
                    <input type="number" placeholder="Insira seu cpf" name="cpf" id="cpf" value="<%=resultado.getString("cpf")%>" readonly>

                </p>

                <p>

                    <label for="email"><b>Email</b></label><br>
                    <input type="text" placeholder="Insira seu email" name="email" id="email" value="<%=resultado.getString("email")%>" readonly>

                </p>
                <p>
                    <label for="senha"><b>Senha</b></label><br>
                    <input type="text" placeholder="Insira senha (min 6 caracteres)" name="senha" id="senha" value="<%=resultado.getString("senha")%>" readonly>

                </p>


            </div>

        </form>

        <!-- =============================================================================================================== -->      


        <%                    }
            } catch (ClassNotFoundException ex) {//caso de erro
                out.println(ex);
            } catch (SQLException ex) {
                out.println(ex);
            }
        %>
    </body>
</html>