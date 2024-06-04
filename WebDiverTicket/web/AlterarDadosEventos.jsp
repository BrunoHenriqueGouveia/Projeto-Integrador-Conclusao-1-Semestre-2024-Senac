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
            // pegar dados do evento
            String u = request.getParameter("email");
            String nomeDoevento, local, endereco, cep, descricao, dataInicio, dataFim, horaInicio, horaFim, categoria;
            nomeDoevento = request.getParameter("nomeDoevento");
            local = request.getParameter("local");
            endereco = request.getParameter("endereco");
            cep = request.getParameter("cep");
            descricao = request.getParameter("descricao");
            dataInicio = request.getParameter("dataInicio");
            dataFim = request.getParameter("dataFim");
            horaInicio = request.getParameter("horaInicio");
            horaFim = request.getParameter("horaFim");
            categoria = request.getParameter("categoria");

            // imagem
            //pegar dados ingresso
            int qtdingressoMeia, qtdingressoVip, qtdingressoInteira;
            double precoMeia, precoVip, precoInteiro;

            qtdingressoMeia = Integer.parseInt(request.getParameter("qtdingressoMeia"));
            qtdingressoVip = Integer.parseInt(request.getParameter("qtdingressoVip"));
            qtdingressoInteira = Integer.parseInt(request.getParameter("qtdingressoInteira"));

            precoMeia = Double.parseDouble(request.getParameter("precoMeia"));
            precoVip = Double.parseDouble(request.getParameter("precoVip"));
            precoInteiro = Double.parseDouble(request.getParameter("precoInteiro"));

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                // alterar dados do evento no banco de dados
                PreparedStatement st = conectado.prepareStatement("UPDATE evento set nomeDoevento=?,local=?,endereco=?,cep=?,descricao=?, data_inicio=?,data_fim=?,hora_inicio=?,hora_fim=?,categoria_evento=?,qtd_ingresso_vip=?,preco_vip=?,qtd_ingresso_meia=?,preco_meia=?,qtd_ingresso_inteira=?,preco_inteiro=?  WHERE email=?");
                st.setString(1, nomeDoevento);
                st.setString(2, local);
                st.setString(3, endereco);
                st.setString(4, cep);
                st.setString(5, descricao);
                st.setString(6, dataInicio);
                st.setString(7, dataFim);
                st.setString(8, horaInicio);
                st.setString(9, horaFim);
                st.setString(10, categoria);
                st.setInt(11, qtdingressoVip);
                st.setDouble(12, precoVip);
                st.setInt(13, qtdingressoMeia);
                st.setDouble(14, precoMeia);
                st.setInt(15, qtdingressoInteira);
                st.setDouble(16, precoInteiro);
                st.setString(17, u);
                st.executeUpdate();//salvar no banco de dados
                String emailApresentacao = "apresentacaoEvento.jsp?email=" + u;

        %>

        <script>
            alert("Dados Alterado");
            window.location.href = "<%= emailApresentacao%>";
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
