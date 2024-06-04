<%-- 
    Document   : salvarIngresso
    Created on : 21 de mai. de 2024, 09:41:37
    Author     : bruno.hgsilva3
--%>

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
        <title>ingresso</title>
    </head>
    <body>
        <%
            String nome, cpf, email, tipo;
            int qtdIngresso;
            double valorTotal;

            int id;
            id = Integer.parseInt(request.getParameter("idEvento"));

            nome = request.getParameter("nome");
            qtdIngresso = Integer.parseInt(request.getParameter("qtdIngresso"));
            cpf = request.getParameter("cpf");
            email = request.getParameter("email");
            tipo = request.getParameter("tipo");
            valorTotal = Double.parseDouble(request.getParameter("valorTotal"));

            String emailIndex = "index.jsp?email=" + email;

            // conecta com banco de dados
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                
                
                // dependendo do tipo de ingresso ele diminui no banco de dados a quantidade de ingresso do evento
                if (tipo.equalsIgnoreCase("vip")) {
                    PreparedStatement stt = conectado.prepareStatement("UPDATE evento SET qtd_ingresso_vip = qtd_ingresso_vip - ? WHERE id_evento = ?");
                    stt.setInt(1, qtdIngresso);
                    stt.setInt(2, id);
                    stt.executeUpdate();
                } else if (tipo.equalsIgnoreCase("meia")) {
                    PreparedStatement stt = conectado.prepareStatement("UPDATE evento SET qtd_ingresso_meia = qtd_ingresso_meia - ? WHERE id_evento = ?");
                    stt.setInt(1, qtdIngresso);
                    stt.setInt(2, id);
                    stt.executeUpdate();
                } else {
                    PreparedStatement stt = conectado.prepareStatement("UPDATE evento SET qtd_ingresso_inteira = qtd_ingresso_inteira - ? WHERE id_evento = ?");
                    stt.setInt(1, qtdIngresso);
                    stt.setInt(2, id);
                    stt.executeUpdate();
                }

                // insere o ingresso comprado no banco de dados
                PreparedStatement st = conectado.prepareStatement("INSERT INTO ingresso (nome,cpf,email,tipo_ingresso,valor_ingresso,qtdIngresso,fk_evento) values(?,?,?,?,?,?,?)");
                st.setString(1, nome);
                st.setString(2, cpf);
                st.setString(3, email);
                st.setString(4, tipo);
                st.setDouble(5, valorTotal);
                st.setInt(6, qtdIngresso);
                st.setInt(7, id);
                st.executeUpdate();//salvar no banco de dados
        %>

        <script>
            alert("Compra bem sucedida");
            window.location.href = "<%=emailIndex%>";
        </script>

        <%
            } catch (ClassNotFoundException ex) {
                out.println(ex);
            } catch (SQLException ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
