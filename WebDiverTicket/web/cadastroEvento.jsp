<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styleCriaEvento.css">

        <title>Cadastro de Eventos</title>
    </head>

    <body>
        <%  // recebe dados do usuario de outra pagina
            String u = request.getParameter("email");
            String emailIndex = "index.jsp?email=" + u;
        %>
        <header>
            <!--logo-->
            <a href="<%=emailIndex%>" class="logo"> Diver<br />Ticket<br /> </a>
            <!--botoes header-->
        </header>
        <main>
            <form id="eventoForm" action="salvarEvento.jsp" method="post" onsubmit="return cadastrarEvento()">

                <div class="conteudo">



                    <label for="nomeDoevento"><b>Nome Do Evento</b></label>
                    <input type="text" placeholder="Insira o nome do evento" name="nomeDoevento" id="nomeDoevento" required><br><br>

                    <label for="local"><b>Local</b></label>
                    <input type="text" placeholder="Insira o local" name="local" id="local" required><br><br>

                    <label for="endereco">Endereço</label>
                    <input type="text" placeholder="Insira o Endereço" name="endereco" id="endereco" required><br><br>

                    <label for="cep">CEP</label>
                    <input type="text" placeholder="Insira o CEP" name="cep" id="cep" required><br><br>

                    <label for="imagem">Imagem do Evento:</label>
                    <input type="file" id="fileInput" name="fileInput"><br><br>

                    <label for="descricao">Descrição do Evento:</label>
                    <textarea id="descricao" placeholder="Escreva aqui" name="descricao" rows="4"></textarea><br><br>

                    <label for="dataInicio">Data de Início:</label>
                    <input type="date" id="dataInicio" name="dataInicio" required><br><br>

                    <label for="dataFim">Data de Fim:</label>
                    <input type="date" id="dataFim" name="dataFim" required><br><br>

                    <label for="horaInicio">Hora de Início:</label>
                    <input type="time" id="horaInicio" name="horaInicio" required><br><br>

                    <label for="horaFim">Hora de Fim:</label>
                    <input type="time" id="horaFim" name="horaFim" required><br><br>

                    <label for="categoria">Categoria de Evento:</label>
                    <select id="categoria" name="categoria">
                        <option value="">Selecione...</option>
                        <option value="festa e show">Festa e Show</option>
                        <option value="teatro">Teatro</option>
                        <option value="palestra">Palestra</option>
                        <option value="stand up comedy">Stand up comedy</option>
                        <option value="esporte">Esporte</option>
                        <option value="gastronomia">Gastronomia</option>
                        <option value="passeios">Passeios</option>
                        <option value="infantil">Infantil</option>
                    </select><br><br>

                    <!-- =========================================================== -->

                    <div class="tipoIngresso">
                        <label >Tipo de Ingresso:</label>
                        <input class="checkbox" type="checkbox" id="vip" name="vip" value="1">
                        <label class="labelTipoIngresso" for="vip"> Vip</label>
                        <input class="checkbox" type="checkbox" id="meia" name="meia" value="2">
                        <label class="labelTipoIngresso" for="meia"> Meia</label>
                        <input class="checkbox" type="checkbox" id="inteira" name="inteira" value="3">
                        <label class="labelTipoIngresso" for="inteira">Inteira </label>
                        <button type="button" class="inputTipoIngresso" onclick="criarIngresso()">Criar ingresso</button>
                    </div>



                    <div class="inserirIngressos" id="inserirIngressos">
                        <!--=================== vip===================== -->
                        <div id="divVip">
                            <p id="tituloVip">Ingresso Vip</p>

                            <label for="qtdingressoVip">Quantidade de <br>Ingresso:</label>
                            <input type="number" id="qtdingressoVip" name="qtdingressoVip" style="width: 130px;" value="0">


                            <label for="precoVip">Preço:</label>
                            <input type="number" name="precoVip" id="precoVip" style="width: 130px;" value="0"><br>

                        </div>

                        <div id="divMeia">
                            <!--=================== meia ===================== -->
                            <p id="tituloMeia">Ingresso Meia</p>

                            <label for="qtdingressoMeia">Quantidade de <br>Ingresso:</label>
                            <input type="number" id="qtdingressoMeia" name="qtdingressoMeia" style="width: 130px;" value="0">


                            <label for="precoMeia">Preço:</label>
                            <input type="number" name="precoMeia" id="precoMeia" style="width: 130px;" value="0"><br>

                        </div>
                        <div id="divInteiro">
                            <!--=================== inteira ===================== -->
                            <p id="tituloInteiro">Ingresso Inteira</p>

                            <label for="qtdingressoInteira">Quantidade de <br>Ingresso:</label>
                            <input type="number" id="qtdingressoInteira" name="qtdingressoInteira" style="width: 130px;" value="0">


                            <label for="precoInteiro">Preço:</label>
                            <input type="number" name="precoInteiro" id="precoInteiro" style="width: 130px;" value="0"><br>

                        </div>


                    </div>

                    <div style="display: none;">
                        <input type="text" name="email" id="email" value="<%= u%>">
                        <input type="text" id="fileNameInput" name="fileNameInput" />
                    </div>

                    <!-- ======================================================================================== -->
                    <button type="submit">Publicar Evento</button>
                </div>


            </form>
        </main>
        <script>

            /*  pegar o nome do arquivo da imagem   */
            const fileInput = document.getElementById('fileInput');
            const fileNameInput = document.getElementById('fileNameInput');

            fileInput.addEventListener('change', () => {
                const fileName = fileInput.files[0].name;
                fileNameInput.value = fileName;
            });




            /*============================criar ingresso===================================*/

            const inputVip = document.getElementById("vip");
            const inputMeia = document.getElementById("meia");
            const inputInteira = document.getElementById("inteira");
            const divVip = document.getElementById("divVip");
            const qtdingressoVip = document.getElementById("qtdingressoVip");
            const precoVip = document.getElementById("precoVip");
            const divMeia = document.getElementById("divMeia");
            const qtdingressoMeia = document.getElementById("qtdingressoMeia");
            const precoMeia = document.getElementById("precoMeia");
            const divInteiro = document.getElementById("divInteiro");
            const qtdingressoInteira = document.getElementById("qtdingressoInteiro");
            const precoInteiro = document.getElementById("precoInteiro");


            //função para mostrar apenas o ingresso que ele escolher a partir do input radio
            function criarIngresso() {

                let vip = inputVip.checked;
                let meia = inputMeia.checked;
                let inteiro = inputInteira.checked;
                divVip.style.display = "none";
                divMeia.style.display = "none";
                divInteiro.style.display = "none";
                if (vip === false && meia === false && inteiro === false) {
                    alert("ingresso Não Cadastrado");
                }
                if (vip === true) {
                    divVip.style.display = "block";
                }
                if (meia === true) {
                    divMeia.style.display = "block";
                }
                if (inteiro === true) {
                    divInteiro.style.display = "block";
                }

            }
            /*======================================================================*/

            /*=============================publicar evento==================================*/


            const nomeDoEvento = window.document.getElementById('nomeDoevento');
            const local = document.getElementById('local');
            const endereco = document.getElementById('endereco');
            const cep = document.getElementById('cep');
            var regNomeDoEvento = new RegExp("[A-z]{6,30}");
            var regLocal = new RegExp("[a-zA-Z0-9\s.,-]+$");
            var regCep = new RegExp("^[0-9]{8}$");


            //função para validar dados do evento
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
        <footer>
            <!--links-->
            <a class="link">termo de uso</a>
            <a class="link">Política de privacidade</a>
            <a class="link">Política de reembolso</a>
            <!--logo em rodape-->
            <a href="<%=emailIndex%>" class="logo-rodape"> Diver<br />Ticket<br /></a>
            <a class="link">Perguntas Frequente</a>
            <a class="link">Informação de contatos</a>
            <a class="link">Sobre Nos</a>
        </footer>

    </body>
</html>