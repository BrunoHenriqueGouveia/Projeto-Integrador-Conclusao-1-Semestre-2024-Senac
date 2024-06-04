<%-- 
    Document   : pagamento
    Created on : 19 de mai. de 2024, 15:27:40
    Author     : bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="stylePagar.css">
        <title>Pagar</title>
    </head>

    <body>
        <header>
            <!--logo-->
            <a href="index.jsp" class="logo"> Diver<br />Ticket<br /> </a>
            <!--botoes header-->
        </header>

        <%
            String u = null;
            u = request.getParameter("idEvento");

            String[] palavras = u.split(";");

            int idEvento = Integer.parseInt(palavras[0]);
            String tipo = palavras[1];
            int totalIngresso = Integer.parseInt(palavras[2]);
            double valorTotal = Double.parseDouble(palavras[3]);

            String salvar = "salvarIngresso.jsp?idEvento=" + idEvento;


        %>

        <main>

            <form action="<%= salvar%>" method="post"  onsubmit="return salvarIngresso()">

                <h2>Informaçoes para recebimento de ingresso</h2>

                <label for="nome">nome</label>
                <input type="text" placeholder="Insira o sue nome" name="nome" id="nome">

                <label for="email">E-mail</label>
                <input type="text" placeholder="Insira o email" name="email" id="email" required>

                <label for="cpf">CPF</label>
                <input type="text" placeholder="000.000.000-00" name="cpf" id="cpf" minlength="14" maxlength="14" required><br><br>


                <h2>Informação de pagamento</h2>
                <!--NOME DO CARTÃO-->
                <label for="nomeCartao">Nome impresso no cartão</label>
                <input type="text" placeholder="Insira o nome do cartão" name="nomeCartao" maxlength="50" id="nomeCartao"
                       required>

                <!--NUMERO DO CARTÃO-->
                <label for="numeroCartao">Número do Cartão</label>
                <input type="text" placeholder="0000 0000 0000 0000" name="numeroCartao" maxlength="19" id="numeroCartao"
                       required>

                <!--VALIDADE DO CARTÃO-->
                <label for="dataValidade">Data de validade</label>
                <input type="text" placeholder="MM/AA" name="dataValidade" maxlength="5" id="dataValidade" required>

                <!--CODIGO DE SEGURANÇA DO CARTÃO-->
                <label for="codigoSegurancaCartao">Codigo de Seguranca do Cartao</label>
                <input type="text" placeholder="000" name="codigoSegurancaCartao" maxlength="3" id="codigoSegurancaCartao"
                       required><br><br>


                <h2>resumo da compra</h2>

                <label for="nome">quantidade de ingresso</label>
                <input type="number" value="<%= totalIngresso%>" name="qtdIngresso" readonly>

                <label for="nome"> Valor total </label>
                <input type="text" value="<%= valorTotal%>" name="valorTotal" readonly>

                <label for="nome">Tipo</label>
                <input type="text" value="<%= tipo%>" name="tipo" readonly>

                <!--BOTÃO CONTINUA-->
                <button type="submit" >Comprar</button>

            </form>

            <script>
                // valida se todos os requisitos de pagemnto estão correto para salvar no banco de dados
                function salvarIngresso() {

                    // Evento do botão Pagar
                    document.getElementById('pagar').addEventListener('click', function () {
                        // Aqui você pode pegar os dados do cartão
                        var numeroCartao = document.getElementById('numeroCartao').value;
                        var dataValidade = document.getElementById('dataValidade').value;
                        var cpf = document.getElementById('cpf').value;
                        var email = document.getElementById('email').value;
                        var nomeCartao = document.getElementById('nomeCartao').value;
                        var nome = document.getElementById('nome').value;
                        // Verificando se todos os campos foram preenchidos corretamente
                        if (numeroCartao.length === 19 && dataValidade.length === 5 && cpf.length === 14 && email.length > 6 && nomeCartao.length > 2 && nome.length > 3) {
                            // Adicionando a mensagem de sucesso
                            return true;
                        } else {
                            // Adicionando a mensagem de erro
                            alert('Por favor, preencha todos os campos corretamente.');
                            return false;
                        }
                    });
                }
            </script>

            <!--JAVASCRIPT PARA VALIDAR O E-MAIL -->
            <script>
                document.getElementById('email').addEventListener('input', function (event) {
                    var email = event.target.value;
                    var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (regex.test(email)) {
                        // O e-mail é válido
                        event.target.setCustomValidity('');
                    } else {
                        // O e-mail é inválido
                        event.target.setCustomValidity('Por favor, insira um endereço de e-mail válido.');
                    }
                });
            </script>

            <!--JAVASCRIPT DO CPF--> 
            <script>
                // Função para adicionar os pontos e hífen no CPF
                function formatarCPF(cpf) {
                    // Remove caracteres que não são dígitos
                    cpf = cpf.replace(/\D/g, '');
                    // Adiciona ponto após o terceiro e sexto dígitos do CPF
                    cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                    cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                    // Adiciona hífen após o nono dígito do CPF
                    cpf = cpf.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
                    return cpf;
                }

                // Evento de input para formatar o CPF durante a digitação
                function adicionarEventoInput() {
                    const inputCPF = document.getElementById('cpf');
                    inputCPF.addEventListener('input', function (e) {
                        e.target.value = formatarCPF(e.target.value);
                    });
                }

                // Inicializa o evento de input após o carregamento da página
                window.addEventListener('DOMContentLoaded', adicionarEventoInput);
            </script>

            <!--JAVASCRIPT DO NUMERO DO CARTÃO-->

            <script>
                // Função para adicionar espaços a cada quatro dígitos
                function formatarNumeroCartao(numero) {
                    // Remove caracteres que não são dígitos
                    numero = numero.replace(/\D/g, '');
                    // Adiciona espaço após cada quatro dígitos
                    numero = numero.replace(/(\d{4})(?=\d)/g, '$1 ');
                    return numero;
                }

                // Evento de input para formatar o número do cartão durante a digitação
                function adicionarEventoInput() {
                    const inputNumeroCartao = document.getElementById('numeroCartao');
                    inputNumeroCartao.addEventListener('input', function (e) {
                        e.target.value = formatarNumeroCartao(e.target.value);
                    });
                }

                // Inicializa o evento de input após o carregamento da página
                window.addEventListener('DOMContentLoaded', adicionarEventoInput);
            </script>


            <!--JAVASCRIPT PARA DATA-->
            <script>
                // Função para adicionar a barra entre mês e ano
                function formatarData(data) {
                    // Remove caracteres que não são dígitos
                    data = data.replace(/\D/g, '');
                    // Adiciona barra após o segundo dígito (mês)
                    data = data.replace(/(\d{2})(\d)/, '$1/$2');
                    return data;
                }

                // Evento de input para formatar a data durante a digitação
                function adicionarEventoInput() {
                    const inputData = document.getElementById('dataValidade');
                    inputData.addEventListener('input', function (e) {
                        e.target.value = formatarData(e.target.value);
                    });
                }

                // Inicializa o evento de input após o carregamento da página
                window.addEventListener('DOMContentLoaded', adicionarEventoInput);
            </script>
        </main>
        <footer>

            <!--links-->
            <a class="link">termo de uso</a>
            <a class="link">Política de privacidade</a>
            <a class="link">Política de reembolso</a>
            <!--logo em rodape-->
            <a href="index.html" class="logo-rodape"> Diver<br />Ticket<br /></a>
            <a class="link">Perguntas Frequente</a>
            <a class="link">Informação de contatos</a>
            <a class="link">Sobre Nos</a>

        </footer>
    </body>

</html>
