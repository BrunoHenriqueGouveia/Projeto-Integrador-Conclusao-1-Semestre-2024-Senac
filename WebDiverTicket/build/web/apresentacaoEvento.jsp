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
                margin-bottom: 30px;
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
        <title>Meus Eventos</title>
    </head>
    <body>
        <%
            // recebe dados como email da outra pagina
            String u = request.getParameter("email");

            try {
                // conecta com banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                //busca o evento no banco de dados com a condição do email do dono do evento
                PreparedStatement st = conectado.prepareStatement("select * from evento where email = ?");
                st.setString(1, u);
                ResultSet resultado = st.executeQuery();

                // exibi informações do evento
                while (resultado.next()) {

        %> 

        <form>

            <div class="conteudo">

                <div style="display: none;">
                    <input type="text" name="email" value="<%= u%>">
                </div>

                <label for="nomeDoevento"><b>Nome Do Evento</b></label><br>
                <input type="text" name="nomeDoevento" id="nomeDoevento" value="<%=resultado.getString("nomeDoevento")%>"  readonly><br><br>

                <label for="local"><b>Local</b></label><br>
                <input type="text" name="local" id="local" value="<%=resultado.getString("local")%>"  readonly><br><br>

                <label for="endereco">Endereço</label><br>
                <input type="text" name="endereco" id="endereco" value="<%=resultado.getString("endereco")%>"  readonly><br><br>

                <label for="cep">CEP</label><br>
                <input type="text" name="cep" id="cep" value="<%=resultado.getString("cep")%>"  readonly><br><br>

                <label for="imagem">Imagem do Evento:</label><br>
                <input type="file" id="imagem" name="imagem"><br><br>

                <label for="descricao">Descrição do Evento:</label><br>
                <textarea id="descricao" name="descricao" rows="4"  readonly><%=resultado.getString("descricao")%></textarea><br><br>

                <label for="dataInicio">Data de Início:</label><br>
                <input type="text" id="dataInicio" name="dataInicio" value="<%=resultado.getString("data_inicio")%>"  readonly><br><br>

                <label for="dataFim">Data de Fim:</label><br>
                <input type="text" id="dataFim" name="dataFim" value="<%=resultado.getString("data_fim")%>"  readonly><br><br>

                <label for="horaInicio">Hora de Início:</label><br>
                <input type="text" id="horaInicio" name="horaInicio" value="<%=resultado.getString("hora_inicio")%>"  readonly><br><br>

                <label for="horaFim">Hora de Fim:</label><br>
                <input type="text" id="horaFim" name="horaFim" value="<%=resultado.getString("hora_fim")%>"  readonly><br><br>

                <label for="categoria">Categoria de Evento:</label><br>
                <input type="text" name="categoria" value="<%=resultado.getString("categoria_evento")%>"  readonly><br><br>

                <!-- =========================================================== -->


                <div class="inserirIngressos" id="inserirIngressos">
                    <!--=================== vip===================== -->
                    <div id="divVip">
                        <p id="tituloVip">Ingresso Vip</p>

                        <label for="qtdingressoVip">Quantidade de <br>Ingresso:</label>
                        <input type="number" id="qtdingressoVip" name="qtdingressoVip" style="width: 130px;" value="<%=resultado.getInt("qtd_ingresso_vip")%>"  readonly>


                        <label for="precoVip">Preço:</label>
                        <input type="number" name="precoVip" id="precoVip" style="width: 130px;" value="<%=resultado.getDouble("preco_vip")%>" readonly><br>

                    </div>

                    <div id="divMeia">
                        <!--=================== meia ===================== -->
                        <p id="tituloMeia">Ingresso Meia</p>

                        <label for="qtdingressoMeia">Quantidade de <br>Ingresso:</label>
                        <input type="number" id="qtdingressoMeia" name="qtdingressoMeia" style="width: 130px;" value="<%=resultado.getInt("qtd_ingresso_meia")%>"  readonly>


                        <label for="precoMeia">Preço:</label>
                        <input type="number" name="precoMeia" id="precoMeia" style="width: 130px;" value="<%=resultado.getDouble("preco_meia")%>" readonly><br>

                    </div>
                    <div id="divInteiro">
                        <!--=================== inteira ===================== -->
                        <p id="tituloInteiro">Ingresso Inteira</p>

                        <label for="qtdingressoInteira">Quantidade de <br>Ingresso:</label>
                        <input type="number" id="qtdingressoInteira" name="qtdingressoInteira" style="width: 130px;" value="<%=resultado.getInt("qtd_ingresso_inteira")%>"  readonly>


                        <label for="precoInteiro">Preço:</label>
                        <input type="number" name="precoInteiro" id="precoInteiro" style="width: 130px;" value="<%=resultado.getDouble("preco_inteiro")%>"  readonly><br>

                    </div>

                </div>

                <!-- ======================================================================================== -->

            </div>
        </form>

        <!-- =============================================================================================================== -->      


        <%                    }
            } catch (ClassNotFoundException ex) {// caso de erro
                out.println(ex);
            } catch (SQLException ex) {
                out.println(ex);
            }
        %>
    </body>
</html>