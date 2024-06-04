<%-- 
   Document   : alterarDados
   Created on : 16 de mai. de 2024, 13:14:29
   Author     : bruno.hgsilva3
--%>
<%@page import= "java.sql.Connection"%>
<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.SQLException"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar</title>
    </head>
    <body>
        <%
            // pegar dados do usuario
            String nome, cpf, email, senha;
            int idade;
            nome = request.getParameter("nome");
            idade = Integer.parseInt(request.getParameter("idade"));
            cpf = request.getParameter("cpf");
            email = request.getParameter("email");
            senha = request.getParameter("senha");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                // alterar dados do usuario no banco de dados
                PreparedStatement st = conectado.prepareStatement("UPDATE usuario set nome=?, idade=?, cpf=?, senha=?  WHERE email=?");
                st.setString(1, nome);
                st.setInt(2, idade);
                st.setString(3, cpf);
                st.setString(4, senha);
                st.setString(5, email);
                st.executeUpdate();//salvar no banco de dados
                String emailApresentacao = "apresentacaoUsuario.jsp?email=" + email;

        %>

        <script>
            alert("Dados Alterado");
            window.location.href = "<%= emailApresentacao%>";
        </script>

        <%
            } catch (ClassNotFoundException ex) {// caso de erro
                out.println(ex);
            } catch (SQLException ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
