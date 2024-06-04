
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.Connection"%>
<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.SQLException"%>
<%@page import= "java.util.regex.Pattern" %>
<%@page import= "java.util.regex.Matcher" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvar Usuario</title>
    </head>
    <body>
        
        <%
            String nome, cpf, email, senha;
            int idade;
            nome = request.getParameter("nome");
            idade = Integer.parseInt(request.getParameter("idade"));
            cpf = request.getParameter("cpf");
            email = request.getParameter("email");
            senha = request.getParameter("senha");

            // conecta com banco de dados
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                //insere dados no banco de dados
                PreparedStatement st = conectado.prepareStatement("INSERT INTO usuario (nome,idade,cpf,email,senha) values(?,?,?,?,?)");
                st.setString(1, nome);
                st.setInt(2, idade);
                st.setString(3, cpf);
                st.setString(4, email);
                st.setString(5, senha);
                st.executeUpdate();//salvar no banco de dados
        %>

        <script>
               alert("Usuario Cadastrado");
               window.location.href = "index.jsp";
        </script>

        <%
            
        } catch (ClassNotFoundException ex) {
        %>

        <script>
            alert("Erro ao tentar localizar Driver JDBC");
            window.location.href = "cadastroUsuario.html";
        </script>

        <%
        } catch (SQLException ex) {
            if (ex.getMessage().contains("Duplicate entry")) {
        %>

        <script>
            alert("Usuário ja cadastrado");
            window.location.href = "index.jsp";
        </script>

        <%
        } else {
        %>

        <script>
            alert("Erro na conexão com o banco de dados" + ex.getMessage());
            window.location.href = "cadastroUsuario.html";
        </script>

        <%
                }
            }
        %>

    </body>
</html>
