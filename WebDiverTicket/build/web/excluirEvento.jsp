<%-- 
    Document   : excluirUsuario
    Created on : 16 de mai. de 2024, 13:52:01
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
        <title>Excluir</title>
    </head>
    <body>
        <%
            // 1 pegar os dados e colocar na variavel
            String u, nomeEvento;
            u = request.getParameter("email");
            nomeEvento = request.getParameter("nomeDoevento");
            // 2 conectar com banco de dados
            String emailIndex = "index.jsp?email=" + u;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                // deleta evento se os dados estiver correto na condiçao
                PreparedStatement st = conectado.prepareStatement("DELETE From evento where email=? and nomeDoevento=?");
                st.setString(1, u);
                st.setString(2, nomeEvento);
                int resultado = st.executeUpdate();
                //verifica se tem os dados do usuario

                // se o resultado for 0 é porque não foi encontrado 
                if (resultado == 0) {
        %>

        <script>
            alert("Evento Não Existe");
            window.location.href = "exluirUsuario.html";
        </script>

        <%// se o resultado for 1 é porque o evnto existe e foi excluido
        } else {

        %>

        <script>
            alert("Evento Excluido");
            window.top.location.href = "<%=emailIndex%>";
        </script>

        <%                }
            } catch (Exception erro) {
                out.println(erro);

            }
        %>
    </body>
</html>
