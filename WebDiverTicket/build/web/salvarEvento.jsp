<%-- 
    Document   : salvarEvento
    Created on : 7 de mai. de 2024, 10:16:36
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvar Evento</title>
    </head>
    <body>
        <%

            String u = request.getParameter("email");
            String emailIndex = "index.jsp?email=" + u;
            String nomeDoevento, local, endereco, cep, descricao, dataInicio, dataFim, horaInicio, horaFim, categoria,imagem;
           
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
            imagem = request.getParameter("fileNameInput");

            String[] vetorInicio = dataInicio.split("-");
            String[] vetorFim = dataFim.split("-");
            dataInicio = vetorInicio[2] + "/" + vetorInicio[1] + "/" + vetorInicio[0];
            dataFim = vetorFim[2] + "/" + vetorFim[1] + "/" + vetorFim[0];
            
            //ingresso
            int qtdingressoMeia, qtdingressoVip, qtdingressoInteira;
            double precoMeia, precoVip, precoInteiro;

            qtdingressoMeia = Integer.parseInt(request.getParameter("qtdingressoMeia"));
            qtdingressoVip = Integer.parseInt(request.getParameter("qtdingressoVip"));
            qtdingressoInteira = Integer.parseInt(request.getParameter("qtdingressoInteira"));

            precoMeia = Double.parseDouble(request.getParameter("precoMeia"));
            precoVip = Double.parseDouble(request.getParameter("precoVip"));
            precoInteiro = Double.parseDouble(request.getParameter("precoInteiro"));

            try {//conecta com banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
               
                // condição que o usuario so pode criar evento se estiver logado
                if (u != null) {                
                    PreparedStatement st = conectado.prepareStatement("INSERT INTO evento (nomeDoevento,local,endereco,cep,descricao, data_inicio,data_fim,hora_inicio,hora_fim,categoria_evento,qtd_ingresso_vip,preco_vip,qtd_ingresso_meia,preco_meia,qtd_ingresso_inteira,preco_inteiro,email,imagem) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
                    st.setString(18, imagem);
                    st.executeUpdate();//salvar no banco de dados

        %>

        <script>

            alert("Evento Publicado");
            window.location.href = "<%= emailIndex%>";

        </script>

        <%    } else {// se não apareçera uma msg´para ele logar

        %>

        <script>

            alert("Voçe precisa esta Logado na sua conta para criar Evento");
            window.location.href = "<%= emailIndex%>";

        </script>

        <%            }

        } catch (ClassNotFoundException ex) {

        %>

        <script>
            alert("Erro ao tentar localizar Driver JDBC");
            window.location.href = "<%=emailIndex%>";
        </script>

        <%
        } catch (SQLException ex) {
            
            // se o evento ja existe aparecera uma msg evento ja cadastrado
            if (ex.getMessage().contains("Duplicate entry")) {
        %>

        <script>
            alert("Evento ja cadastrado");
            window.location.href = "<%=emailIndex%>";
        </script>

        <%
        } else {
        %>

        <script>
            alert("Erro na conexão com o banco de dados" + ex.getMessage());
            window.location.href = "<%=emailIndex%>";
        </script>

        <%
                }
            }
        %>

    </body>
</html>
