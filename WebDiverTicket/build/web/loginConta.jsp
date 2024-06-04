

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
        <title>Login</title>
    </head>
    <body>
        <%
            // 1 pegar os dados e colocar na variavel
            String u = null, s;
            u = request.getParameter("email");
            s = request.getParameter("senha");
            // 2 conectar com banco de dados
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                // busca os dados do usuario no banco de dados 
                PreparedStatement st = conectado.prepareStatement("select * from usuario where email = ? and senha= ?");
                st.setString(1, u);
                st.setString(2, s);
                ResultSet resultado = st.executeQuery();//executa o select(busca)
                //vetifica se tem os dados do usuario
                
                // se o usuario digitou tudo certo abrira a pagina principal
                if (resultado.next()) {
                    // abrir o menu

                    String emailIndex = "index.jsp?email=" + u;


        %>

        <script>
            alert("Login bem-sucedido!");
            window.location.href = "<%=emailIndex%>";
        </script>

        <%

        } //se não encontrou o usuario aparecera msg de usuario ou senha invalidos e retornara para logar novamente
        else {
        %>

        <script>
            alert("Usuario e/ ou senha invalidos");
            window.location.href = "loginUsuario.html";
        </script>

        <%
            }
        } catch (ClassNotFoundException ex) {
        %>

        <script>
            alert("Entre contado com administrador e informe o erro:" + ex.getMessage());
            window.location.href = "loginUsuario.html";
        </script>

        <%
        } catch (SQLException ex) {
        %>

        <script>
            alert("Entre contado com administrador e informe o erro:" + ex.getMessage());
            window.location.href = "loginUsuario.html";
        </script>

        <%
            }

        %>
    </body>
</html>
