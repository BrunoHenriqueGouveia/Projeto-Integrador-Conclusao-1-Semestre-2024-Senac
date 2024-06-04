<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.Connection"%>
<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.SQLException"%>
<%@page import= "java.util.regex.Pattern" %>
<%@page import= "java.util.regex.Matcher" %>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styleEventoExpecifico.css">

        <title>Evento</title>
    </head>

    <body>


        <%

            // recebe id do evento 
            int id;
            id = Integer.parseInt(request.getParameter("idEvento"));

            //  conectar com banco de dados
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                // busca o evento selecionado atraves do id do evento
                PreparedStatement st = conectado.prepareStatement("select * from evento where id_evento = ?");
                st.setInt(1, id);
                ResultSet resultado = st.executeQuery();//executa o select(busca)

                // exibi as informaçoes do evento e deixa ele seleciona a qtd de ingressos 
                if (resultado.next()) {
                    String email = "index.jsp?email=";

        %>

        <!-- ==========================================cabeçalho==========================================-->
        <header>
            <!--logo-->
            <a href="<%= email%>" class="logo"> Diver<br />Ticket<br /> </a>
            <!--botoes header-->
        </header>

        <!---------------------------------------------------------------------------->
        <main>

            <!--TITULO DA IMAGEM-->
            <div class="tituloImag">
                <img src="imgs/<%=resultado.getString("imagem")%>" alt="BH STOCK FESTIVAL">
                <h2><%=resultado.getString("nomeDoEvento")%></h2>

                <!--TITULO DA DATA-->
                <div class="tituloData">
                    <h3><%=resultado.getString("data_inicio")%> • <%=resultado.getString("hora_inicio")%>  >  <%=resultado.getString("data_fim")%> • <%=resultado.getString("hora_fim")%></h3>
                </div>

                <!--TITULO DA LOCAL-->
                <div class="tituloEnder">
                    <h3><%=resultado.getString("local")%> <br> endereço: <%=resultado.getString("endereco")%>, cep: <%=resultado.getString("cep")%></h3>
                </div>

                <!--DESCRIÇÃO DO EVENTO-->
                <div class="descriEvento">
                    <h2>Descrição do evento</h2>
                    <p><%=resultado.getString("descricao")%></p>
                </div>
            </div>

            <div class="conteudo">
                <%
                    // pegando os ingresso do banco de dados e colocando nas variaveis
                    int qtdVip = resultado.getInt("qtd_ingresso_vip");
                    double precoVip = resultado.getDouble("preco_vip");

                    int qtdMeia = resultado.getInt("qtd_ingresso_meia");
                    double precoMeia = resultado.getDouble("preco_meia");

                    int qtdInteiro = resultado.getInt("qtd_ingresso_inteira");
                    double precoInteiro = resultado.getDouble("preco_inteiro");

                    // variavel para ir a pagina de pagemento
                    String pagar = "pagamento.jsp?idEvento=" + id;


                %>
                <h2>INGRESSOS</h2>

                <div id="inteiro">
                    <!--INFORMAÇÃO DO INGRESSO INTEIRA-->
                    <label for="inteira">INTEIRA</label>
                    <label for="preco">R$ <%=precoInteiro%></label>
                    <!--BOTÃO DE CONTAGEM-->
                    <div class="counter-container">
                        <button class="counter-btn" id="decrease">-</button>
                        <span id="counter-value-inteira">0</span>
                        <button class="counter-btn" id="increase" onclick="ingresso('1')">+</button>
                    </div>

                </div>

                <!-------------------------------------------------------------------------------->
                <div id="meia">
                    <!--INFORMAÇÃO DO INGRESSO MEIA-->
                    <label for="meia">MEIA ENTRADA</label>
                    <label for="preco">R$ <%=precoMeia%></label>
                    <!--BOTÃO DE CONTAGEM-->
                    <div class="counter-container">
                        <button class="counter-btn" id="decrease">-</button>
                        <span id="counter-value-meia">0</span>
                        <button class="counter-btn" id="increase" onclick="ingresso('2')">+</button>
                    </div>
                </div>
                <!-------------------------------------------------------------------------------->

                <div id="vip">
                    <!--INFORMAÇÃO DO INGRESSO VIP-->
                    <label for="vip">VIP</label>
                    <label for="preco">R$ <%=precoVip%></label>
                    <!--BOTÃO DE CONTAGEM-->
                    <div class="counter-container ">
                        <button class="counter-btn" id="decrease">-</button>
                        <span id="counter-value-vip">0</span>
                        <button class="counter-btn" id="increase" onclick="ingresso('3')">+</button>
                    </div>

                </div>

                <!--SOMA TOTAL DE INGRESSO ESCOLIDO-->
                <h3>Preço total dos ingressos: <span id="total-price">R$ 0,00</span></h3>

                <!--TOTAL DE INGRESSO ESCOLIDO-->
                <h3 >Total de ingressos: <span id="total-tickets">0</span></h3>

                <!--------------------------------------------------------------------------------------------->
                <!--BOTÃO PAGAR-->
                <button class="button button2" onclick="ingresso('4')">Pagar</button>
                <!-------------------------------------------------------------------------------->
            </div>

            <!--------------------------------------------------------------------------------------------->
            <!--JS PARA ATULIAZR O TOTAL DE INGRESSO ESCOLIDO  E PREÇO TOTAL-->
            <script>
                const meia = document.getElementById('meia');
                const vip = document.getElementById('vip');
                const inteiro = document.getElementById('inteiro');
                const spanVip = vip.querySelector('span');
                const valueVip = spanVip.textContent;
                const spanMeia = meia.querySelector('span');
                const valueMeia = spanMeia.textContent;
                const spanInteira = vip.querySelector('span');
                const valueInteira = spanInteira.textContent;

                // Elementos para exibir o total de ingressos e o preço total
                const totalTicketsElement = document.getElementById('total-tickets');
                const totalPriceElement = document.getElementById('total-price');
                const ticketOptions = document.querySelectorAll('.counter-container');
                const maxTickets = 3; // Limite de ingressos
                let valorTotal = 0.00;
                let totalIngresso = 0;
                let tipo = "";

                // Preços dos ingressos
                const ticketPrices = {
                    inteira: <%=precoInteiro%>,
                    meia: <%=precoMeia%>,
                    vip: <%=precoVip%>
                };


                //vip mostar as opções de ingresso conforme o usuario criou o evento
                <%
                    if (qtdVip <= 0 || precoVip <= 0) {
                %>
                vip.style.display = "none";
                <%
                    }
                %>

                //meia mostar as opções de ingresso conforme o usuario criou o evento   
                <%
                    if (qtdMeia <= 0 || precoMeia <= 0) {
                %>
                meia.style.display = "none";
                <%
                    }
                %>

                //inteira mostar as opções de ingresso conforme o usuario criou o evento
                <%
                    if (qtdInteiro <= 0 || precoInteiro <= 0) {
                %>
                inteiro.style.display = "none";
                <%
                    }
                %>

                // função para exibir os botoes de ingresso
                ticketOptions.forEach((option, index) => {
                    const increaseButton = option.querySelector('.counter-btn[id="increase"]');
                    const decreaseButton = option.querySelector('.counter-btn[id="decrease"]');
                    let counterValue;
                    // Definindo o contador de acordo com o tipo de ingresso
                    if (index === 0) {

                        counterValue = option.querySelector('#counter-value-inteira');
                    } else if (index === 1) {

                        counterValue = option.querySelector('#counter-value-meia');
                    } else {

                        counterValue = option.querySelector('#counter-value-vip');
                    }

                    increaseButton.addEventListener('click', function () {
                        let currentValue = parseInt(counterValue.textContent);
                        if (currentValue < maxTickets) {
                            counterValue.textContent = currentValue + 1;
                        }
                        // Ocultar as outras opções de ingresso
                        ticketOptions.forEach((otherOption, otherIndex) => {
                            if (otherIndex !== index) {
                                otherOption.style.display = 'none';
                            }
                        });
                        updateTotalTickets();
                        updateTotalPrice();
                    });
                    decreaseButton.addEventListener('click', function () {
                        let currentValue = parseInt(counterValue.textContent);
                        if (currentValue > 0) {
                            counterValue.textContent = currentValue - 1;
                        }
                        // Mostrar as outras opções de ingresso se a contagem for 0
                        if (currentValue - 1 === 0) {
                            ticketOptions.forEach((otherOption) => {
                                otherOption.style.display = 'block';
                            });
                        }
                        updateTotalTickets();
                        updateTotalPrice();
                    });
                });

                //função para saber o total de ingressos selecionados
                function updateTotalTickets() {

                    let totalTickets = 0;
                    // Calcular o total de ingressos
                    ticketOptions.forEach((option, index) => {
                        let counterValue;
                        if (index === 0) {
                            counterValue = option.querySelector('#counter-value-inteira');
                        } else if (index === 1) {
                            counterValue = option.querySelector('#counter-value-meia');
                        } else {
                            counterValue = option.querySelector('#counter-value-vip');
                        }
                        totalTickets += parseInt(counterValue.textContent);
                    });
                    // Atualizar o total de ingressos
                    totalTicketsElement.textContent = totalTickets;
                    totalIngresso = totalTickets;
                }


                // função para saber o valor total dos ingressos
                function updateTotalPrice() {

                    let totalPrice = 0.00;
                    // Calcular o preço total
                    ticketOptions.forEach((option, index) => {
                        let counterValue;
                        if (index === 0) {
                            counterValue = option.querySelector('#counter-value-inteira');
                            totalPrice += parseInt(counterValue.textContent) * ticketPrices.inteira;
                        } else if (index === 1) {
                            counterValue = option.querySelector('#counter-value-meia');
                            totalPrice += parseInt(counterValue.textContent) * ticketPrices.meia;
                        } else {
                            counterValue = option.querySelector('#counter-value-vip');
                            totalPrice += parseInt(counterValue.textContent) * ticketPrices.vip;
                        }
                    });
                    // Atualizar o preço total dos ingressos
                    totalPriceElement.textContent = 'R$ ' + totalPrice.toFixed(2);
                    valorTotal = totalPrice;
                }

                //função para validar se foi selecionado algum ingresso e validar se tem a qtd de ingresso desejada pelo usuario
                // se tiver td certo o ingresso é salvo no banco de dados
                function ingresso(idCiclo) {

                    if (idCiclo === '1') {
                        tipo = 'inteira';
                    } else if (idCiclo === '2') {
                        tipo = 'meia';
                    } else if (idCiclo === '3') {
                        tipo = 'vip';
                    }

                    if (idCiclo === '4') {
                        let qtdVip = <%= qtdVip%>;
                        let qtdMeia = <%= qtdMeia%>;
                        let qtdInteiro = <%= qtdInteiro%>;
                        if (totalIngresso > 0) {

                            if (tipo === 'vip') {
                                if (totalIngresso <= qtdVip) {
                                    window.location.href = "<%=pagar%>" + ";" + tipo + ";" + totalIngresso + ";" + valorTotal;
                                } else {
                                    alert("tem apenas " + qtdVip + " ingresso Vip");
                                }
                            } else if (tipo === 'meia') {
                                if (totalIngresso <= qtdMeia) {
                                    window.location.href = "<%=pagar%>" + ";" + tipo + ";" + totalIngresso + ";" + valorTotal;
                                } else {
                                    alert("tem apenas " + qtdMeia + " ingresso Meia");
                                }
                            } else if (tipo === 'inteira') {
                                if (totalIngresso <= qtdInteiro) {
                                    window.location.href = "<%=pagar%>" + ";" + tipo + ";" + totalIngresso + ";" + valorTotal;
                                } else {
                                    alert("tem apenas " + qtdInteiro + " ingresso Inteiro");
                                }
                            }

                        } else {
                            alert("Não selecionou ingresso");
                        }
                    }
                }



            </script>
            <!--------------------------------------------------------------------------------------------->
            <%                    } else {
                        out.println("evento não encontrado");
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
            <a href="index.jsp" class="logo-rodape"> Diver<br />Ticket<br /></a>
            <a class="link">Perguntas Frequente</a>
            <a class="link">Informação de contatos</a>
            <a class="link">Sobre Nos</a>
        </footer>
        <!-- =============================================================================================================== -->
    </body>

</html>