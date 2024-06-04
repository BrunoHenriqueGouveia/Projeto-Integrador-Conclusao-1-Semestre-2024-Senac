<%-- 
    Document   : meusIngressos
    Created on : 21 de mai. de 2024, 10:15:31
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
        <link rel="stylesheet" href="styleMeusIngressos.css">
        <title>Meus Ingressos</title>
        <style>

            main{
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content:center;
                align-items: center;
                gap:30px;
                padding: 50px;
                margin: 20px;

            }

            .ticket {
                background-color: #f3f3f3;
                border: 2px dashed #d9d9d9;
                padding: 20px;
                max-width: 300px;
                margin: auto;
                text-align: center;
                font-family: Arial, sans-serif;


            }

            .ticket h2 {
                margin-top: 0;
            }

            .ticket p {
                margin: 5px 0;
            }

            .ticket .barcode {
                height: 60px;
                margin: 20px 0;
                background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%"><rect width="10%" height="100%"/><rect x="20%" width="10%" height="100%"/><rect x="40%" width="10%" height="100%"/><rect x="60%" width="10%" height="100%"/><rect x="80%" width="10%" height="100%"/></svg>');
                background-size: cover;
            }

        </style>
    </head>
    <body>
        <%  
            String u = null;
            u = request.getParameter("email");
            String emailIndex = "index.jsp?email=" + u;

        %>

        <!-- ==========================================cabeçalho========================================== -->
        <header>
            <!--logo-->
            <a href="<%= emailIndex%>" class="logo"> Diver<br />Ticket<br /></a>
            <!--botoes header-->
        </header>
        <!-- ========================================================================================================================= -->

        <!-- =====================================================main=========================================================== -->
        <main>
            <%    //  conectar com banco de dados
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                    // busca os inggresso do usuario com a condição do email dele
                    PreparedStatement st = conectado.prepareStatement("SELECT ingresso.qtdIngresso, ingresso.tipo_ingresso, evento.nomeDoevento, evento.endereco, evento.data_inicio, evento.hora_inicio  FROM ingresso INNER JOIN evento ON ingresso.fk_evento = evento.id_evento where ingresso.email = ?");
                    st.setString(1, u);
                    ResultSet resultado = st.executeQuery();//executa o select(busca)

                    // se ele tiver ingresso mostrara tds seus ingressos
                    while (resultado.next()) {
                        String codigo = "562532545124845";
                        int ctd = resultado.getInt("qtdIngresso");

                        for (int i = 0; i < ctd; i++) {
            %>

            <!--card ingresso-->
            <div class="ticket">
                <h2><%=resultado.getString("nomeDoevento")%></h2>
                <p>Data: <%=resultado.getString("data_inicio")%> Hora: <%=resultado.getString("hora_inicio")%></p>
                <p>Local: <%=resultado.getString("endereco")%></p>
                <p><%=u%></p>
                <p>Tipo Ingresso:<%=resultado.getString("tipo_ingresso")%></p>
                <div class="barcode"></div>
                <p>Código do Ingresso: <%= codigo%></p>
            </div>
            
            <%                    }
                    }
                } catch (ClassNotFoundException ex) {
                    out.print(ex);

                } catch (SQLException ex) {
                    out.print(ex);

                }
            %>
        </main>
        <!-- =============================================================================================================== -->
        <!--footer-->
        <footer>
            <!--links-->
            <a class="link">termo de uso</a>
            <a class="link">Política de privacidade</a>
            <a class="link">Política de reembolso</a>
            <!--logo em rodape-->
            <a href="<%= emailIndex%>" class="logo-rodape"> Diver<br />Ticket<br /></a>
            <a class="link">Perguntas Frequente</a>
            <a class="link">Informação de contatos</a>
            <a class="link">Sobre Nos</a>
        </footer>
        <!-- =============================================================================================================== -->

    </body>
</html>
