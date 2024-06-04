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
            button {
                background-color: #04AA6D;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                font-family: "Londrina Solid";
                font-size: 20px;
                font-style: normal;
                font-weight: 400;
                line-height: 24px;
            }

            button:hover {
                opacity: 0.8;
            }

        </style>
        <title>Meus Eventos</title>
    </head>
    <body>
        <%

            // recebe dados do usuario de outra pagina
            String u = request.getParameter("email");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                // busca dados do evento no bando de dados com a condição do email do dono do evento
                PreparedStatement st = conectado.prepareStatement("select * from evento where email = ?");
                st.setString(1, u);
                ResultSet resultado = st.executeQuery();

                // mostra os eventos que ele tem e pode alterar os dados do evento para salvar alterações no banco de dados
                while (resultado.next()) {

        %> 

        <form id="eventoForm" action="AlterarDadosEventos.jsp" method="post" onsubmit="return cadastrarEvento()">

            <div class="conteudo">

                <div style="display: none;">
                    <input type="text" name="email" value="<%= u%>">
                </div>

                <label for="nomeDoevento"><b>Nome Do Evento</b></label><br>
                <input type="text" name="nomeDoevento" id="nomeDoevento" value="<%=resultado.getString("nomeDoevento")%>"  ><br><br>

                <label for="local"><b>Local</b></label><br>
                <input type="text" name="local" id="local" value="<%=resultado.getString("local")%>"  ><br><br>

                <label for="endereco">Endereço</label><br>
                <input type="text" name="endereco" id="endereco" value="<%=resultado.getString("endereco")%>" ><br><br>

                <label for="cep">CEP</label><br>
                <input type="text" name="cep" id="cep" value="<%=resultado.getString("cep")%>"  ><br><br>

                <label for="imagem">Imagem do Evento:</label><br>
                <input type="file" id="imagem" name="imagem"><br><br>

                <label for="descricao">Descrição do Evento:</label><br>
                <textarea id="descricao" name="descricao" rows="4"><%=resultado.getString("descricao")%></textarea><br><br>

                <label for="dataInicio">Data de Início:</label><br>
                <input type="text" id="dataInicio" name="dataInicio" value="<%=resultado.getString("data_inicio")%>"  ><br><br>

                <label for="dataFim">Data de Fim:</label><br>
                <input type="text" id="dataFim" name="dataFim" value="<%=resultado.getString("data_fim")%>"  ><br><br>

                <label for="horaInicio">Hora de Início:</label><br>
                <input type="text" id="horaInicio" name="horaInicio" value="<%=resultado.getString("hora_inicio")%>"  ><br><br>

                <label for="horaFim">Hora de Fim:</label><br>
                <input type="text" id="horaFim" name="horaFim" value="<%=resultado.getString("hora_fim")%>"  ><br><br>

                <label for="categoria">Categoria de Evento:</label><br>
                <input type="text" name="categoria" value="<%=resultado.getString("categoria_evento")%>"  ><br><br>

                <!-- =========================================================== -->


                <div class="inserirIngressos" id="inserirIngressos">
                    <!--=================== vip===================== -->
                    <div id="divVip">
                        <p id="tituloVip">Ingresso Vip</p>

                        <label for="qtdingressoVip">Quantidade de <br>Ingresso:</label>
                        <input type="number" id="qtdingressoVip" name="qtdingressoVip" style="width: 130px;" value="<%=resultado.getInt("qtd_ingresso_vip")%>"  >


                        <label for="precoVip">Preço:</label>
                        <input type="number" name="precoVip" id="precoVip" style="width: 130px;" value="<%=resultado.getDouble("preco_vip")%>" ><br>

                    </div>

                    <div id="divMeia">
                        <!--=================== meia ===================== -->
                        <p id="tituloMeia">Ingresso Meia</p>

                        <label for="qtdingressoMeia">Quantidade de <br>Ingresso:</label>
                        <input type="number" id="qtdingressoMeia" name="qtdingressoMeia" style="width: 130px;" value="<%=resultado.getInt("qtd_ingresso_meia")%>" >


                        <label for="precoMeia">Preço:</label>
                        <input type="number" name="precoMeia" id="precoMeia" style="width: 130px;" value="<%=resultado.getDouble("preco_meia")%>" ><br>

                    </div>
                    <div id="divInteiro">
                        <!--=================== inteira ===================== -->
                        <p id="tituloInteiro">Ingresso Inteira</p>

                        <label for="qtdingressoInteira">Quantidade de <br>Ingresso:</label>
                        <input type="number" id="qtdingressoInteira" name="qtdingressoInteira" style="width: 130px;" value="<%=resultado.getInt("qtd_ingresso_inteira")%>" >


                        <label for="precoInteiro">Preço:</label>
                        <input type="number" name="precoInteiro" id="precoInteiro" style="width: 130px;" value="<%=resultado.getDouble("preco_inteiro")%>" ><br>

                    </div>

                </div>

                <!-- ======================================================================================== -->
                <button type="submit">Salvar Alteração</button>
            </div>
        </form>

        <!-- =============================================================================================================== --> 
        <script>
            /*=============================publicar evento==================================*/


            const nomeDoEvento = window.document.getElementById('nomeDoevento');
            const local = document.getElementById('local');
            const endereco = document.getElementById('endereco');
            const cep = document.getElementById('cep');
            var regNomeDoEvento = new RegExp("[A-z]{6,30}");
            var regLocal = new RegExp("[a-zA-Z0-9\s.,-]+$");
            var regCep = new RegExp("^[0-9]{8}$");


            /* função para validar cliente*/
            function cadastrarEvento() {
                if (validarEvento()) {
                    return true;
                } else {
                    alert("Campo com erro");
                    return false;
                }
            }
            /* função para validar cliente*/
            function validarEvento() {
                if (regNomeDoEvento.test(nomeDoEvento.value) && regLocal.test(local.value) && regLocal.test(endereco.value) && regCep.test(cep.value)) {
                    return true;
                } else {
                    return false;
                }
            }

        </script>


        <%                    }
            } catch (ClassNotFoundException ex) {
                out.println(ex);
            } catch (SQLException ex) {
                out.println(ex);
            }
        %>
    </body>
</html>