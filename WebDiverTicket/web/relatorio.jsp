<%-- 
    Document   : relatorio
    Created on : 24 de mai. de 2024, 13:31:00
    Author     : bruno
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
        <link rel="stylesheet" href="styleRelatorio.css">
        <title>relatorio</title>
    </head>
    <body>
        <h2>Relatorio</h2>

        <%
            String u = request.getParameter("email");
            String emailIndex = "index.jsp?email=" + u;

            // conecta com banco de dados
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                // busca todos os ingressos vendidos e informações dos usuarios que comprou
                PreparedStatement st = conectado.prepareStatement("SELECT ingresso.nome, ingresso.qtdIngresso, ingresso.valor_ingresso, ingresso.tipo_ingresso, evento.nomeDoevento FROM ingresso INNER JOIN evento ON ingresso.fk_evento = evento.id_evento  where evento.email = ? ");
                st.setString(1, u);
                ResultSet resultado = st.executeQuery();

        %>

        <table id="tabelaIngressos">

            <tr>
                <th>Nome do Evento</th>
                <th>Nome do Cliente</th>
                <th>Quantidade de Ingressos</th>
                <th>Valor Total da Compra</th>
                <th>Tipo de Ingresso</th>
            </tr>


            <%   int totalIngresso = 0;
                double valorTotal = 0;
                int qtdUsuario = 0, qtdEvento = 0;
                int qtdVip = 0, qtdMeia = 0, qtdInteira = 0;

                // exibi tds informaçoes do usuario
                while (resultado.next()) {

                    String nomeDoevento = resultado.getString("nomeDoevento");
                    String nomeUsuario = resultado.getString("nome");
                    int qtdIngresso = resultado.getInt("qtdIngresso");
                    double valorIngresso = resultado.getDouble("valor_ingresso");
                    String tipoIngresso = resultado.getString("tipo_ingresso");

                    totalIngresso += qtdIngresso;
                    valorTotal += valorIngresso;
                    qtdUsuario++;

                    if (tipoIngresso.equalsIgnoreCase("vip")) {
                        qtdVip += 1 * qtdIngresso;

                    }

                    if (tipoIngresso.equalsIgnoreCase("meia")) {
                        qtdMeia += 1 * qtdIngresso;
                    }

                    if (tipoIngresso.equalsIgnoreCase("inteira")) {
                        qtdInteira += 1 * qtdIngresso;
                    }

            %>

            <tr>
                <td><%=nomeDoevento%></td>
                <td><%=nomeUsuario%></td>
                <td><%=qtdIngresso%></td>
                <td><%=valorIngresso%></td>
                <td><%=tipoIngresso%></td>
            </tr>

            <%
                }// mostra os total 
            %>
            <tr>
                <td></td>
                <td>total cliente: <%= qtdUsuario%></td>
                <td>total ingresso: <%= totalIngresso%> </td>
                <td>valor total: <%= valorTotal%> </td>
                <td>total vip: <%= qtdVip%>   total inteiro: <%= qtdInteira%>  total meia: <%= qtdMeia%></td>
            </tr>
        </table>

        <%      } catch (ClassNotFoundException ex) {
                out.println(ex);
            } catch (SQLException ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
