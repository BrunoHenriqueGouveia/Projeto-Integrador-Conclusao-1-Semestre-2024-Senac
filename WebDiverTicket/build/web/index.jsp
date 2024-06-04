<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
              content="A Diver ticket é a plataforma online de eventos. Shows, festas, teatros, stand up, cursos e muito mais. Encontre e organize eventos com a Diver Ticket!">
        <link rel="stylesheet" href="style.css" type="text/css" media="screen">
        <link rel="stylesheet" href="styleSlide.css" type="text/css" media="screen">
        <link rel="stylesheet" href="styleCards.css">
        <link rel="stylesheet" href="styleBtnLogin.css">
        <title>Diver tickt</title>

    </head>

    <!-- ==========================================cabeçalho========================================== -->
    <header>
        <!--logo-->
        <a class="logo"> Diver<br />Ticket<br /></a>
        <!--botoes header-->
        <nav>
            <%
                String u = null;
                u = request.getParameter("email");
                String emailCriarEvento = "cadastroEvento.jsp?email=" + u;
                String emailEvento = "eventos.jsp?email=" + u;
                String emailPerfil = "meuPerfil.jsp?email=" + u;
                String emailIngressos = "meusIngressos.jsp?email=" + u;
                String emailMeusEventos = "meuEvento.jsp?email=" + u;

                // se o usuario estiver logado abrira opções de usuario logado
                if (u != null) {
                    int a = u.indexOf("@");
                    String nome = u.substring(0, a);
            %>
            <div class="dropdown">
                <button onclick="myFunction()" class="dropbtn"> <%= nome%> </button>
                <div id="myDropdown" class="dropdown-content">
                    <a href= "<%=emailPerfil%>">Perfil</a>
                    <a href="<%=emailIngressos%>">Meus Ingresso</a>
                    <a href="<%=emailMeusEventos%>">Meus eventos</a>
                    <a href="index.jsp">Sair</a>
                </div>
            </div>

            <a href="<%=emailCriarEvento%>"><button class="button button2">Criar Eventos</button></a>

            <% // se não aparecera as opções de não logado
            } else {
            %>

            <a href="loginUsuario.html"><button class="button button1">Login</button></a>
            <%
                }
            %>
        </nav>
    </header>
    <!-- ==================================script dropdoow=================================================== -->
    <script>
        /* Quando o usuário clicar no botão, alterne entre ocultar e mostrar o conteúdo do menu suspenso */
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        // Feche o menu suspenso se o usuário clicar fora dele
        window.onclick = function (event) {
            if (!event.target.matches('.dropbtn')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>

    <!-- ==========================================menu============================================= -->
    <section class="menu">
        <div>
            <input type="text" placeholder="Pesquisar eventos,show,teatro..." title="Type in a name">
        </div>

        <nav class="sub-menu">
            <a href="<%= emailEvento%>" class="link">Eventos</a>
            <a href="cadastroUsuario.html" class="link">Cadastre-se</a>
            <a class="link">Contato</a>
            <a class="link">Ajuda</a>
        </nav>
    </section>
    <!-- ========================================================================================================================= -->
    <main class="main">

        <!-- ====================================================slide==================================================================== -->
        <div class="slide">


            <div class="todoSlides desaparecem">

                <img class="img-slide" src="imgs/Black And White Illustrated Music Festival Facebook Cover.png">

            </div>

            <div class="todoSlides desaparecem">

                <img class="img-slide" src="imgs/daniel.png">

            </div>

            <div class="todoSlides desaparecem">

                <img class="img-slide" src="imgs/thiaguinho.jpg">

            </div>


        </div>


        <!-- Os pontos/círculos -->
        <div>
            <span class="pontos" onclick="currentSlide(1)"></span>
            <span class="pontos" onclick="currentSlide(2)"></span>
            <span class="pontos" onclick="currentSlide(3)"></span>
        </div>

        <script>// função para ficar trocando os slides na pagina principal
            let slideIndex = 0;
            showSlides();

            function showSlides() {
                let i;
                let slides = document.getElementsByClassName("todoSlides");
                let pontos = document.getElementsByClassName("pontos");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1;
                }
                for (i = 0; i < pontos.length; i++) {
                    pontos[i].className = pontos[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                pontos[slideIndex - 1].className += " active";
                setTimeout(showSlides, 5000);
            }
        </script>

        <!-- ========================================================================================================================= -->

        <div class="conteudo">
            <!-- =====================================================categoria=========================================================== -->
            <section class="categoria">
                <div class="opcao-categoria">
                    <a><img class="img" src="imgs/show.png"></a>
                    <a class="link">Festa e show</a>
                </div>

                <div class="opcao-categoria">
                    <a><img class="img" src="imgs/teatro.png"></a>
                    <a class="link">Teatro</a>
                </div>

                <div class="opcao-categoria">
                    <a><img class="img" src="imgs/palestra.png"></a>

                    <a class="link">Palestra</a>
                </div>

                <div class="opcao-categoria">
                    <a><img class="img" src="imgs/stand.png"></a>

                    <a class="link">Stand up comedy</a>
                </div>

                <div class="opcao-categoria">
                    <a><img class="img" src="imgs/esporte.png"></a>

                    <a class="link">Esporte</a>
                </div>

                <div class="opcao-categoria">
                    <a><img class="img" src="imgs/gastrono.png"></a>

                    <a class="link">Gastronomia</a>
                </div>

                <div class="opcao-categoria">
                    <a><img class="img" src="imgs/passeio.png"></a>

                    <a class="link">Passeios</a>
                </div>

                <div class="opcao-categoria">
                    <a><img class="img" src="imgs/infantil.png"></a>

                    <a class="link">Infantil</a>
                </div>
            </section>

            <section>
                <!-- =============================================================================================================== -->
                <!-- =====================================================eventos=================================================== -->
                <!-- eventos principal-->
                <h2>Principais eventos</h2>

                <nav class="eventos">
                    <!-- card eventos principal 1-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank" href="https://www.sympla.com.br/evento/bh-stock-festival/2411037">
                                <img src="imgs/Stock Festival.png" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>15 a 18 de Agosto de 2024</h3>
                                <h5>Stock Festival</h5>
                            </div>
                        </div>
                    </div>


                    <!-- card eventos principal 2-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank"
                               href="https://www.sympla.com.br/evento/gravacao-dvd-lauana-prado-transcende/2409869">
                                <img src="imgs/Luana Prado.png" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>28 junho de 2024</h3>
                                <h5>Luana Prado</h5>
                            </div>
                        </div>
                    </div>
                    <!-- card eventos principal 3-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank"
                               href="https://bileto.sympla.com.br/event/92547/d/247880?_gl=1*eg83m2*_ga*MzU4NDI5NjYzLjE3MTI4NTE4MTA.*_ga_KXH10SQTZF*MTcxMjg1MTgxMC4xLjEuMTcxMjg1NDkzMS42MC4wLjE4NDM5MDkyOTY.">
                                <img src="imgs/matheusCeara.jpeg" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3> 29 e 30 de julho de 2024</h3>
                                <h5>Matheus Ceará</h5>
                            </div>
                        </div>
                    </div>

                    <!-- card eventos principal 4-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank" href="img_5terre.jpg">
                                <img src="imgs/Lolla.png" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>28, 29 e 30 de março de 2025</h3>
                                <h5>Lollapalooza Brasil 2025</h5>
                            </div>
                        </div>
                    </div>


                    <!-- card eventos principal 5-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank"
                               href="https://bileto.sympla.com.br/event/88243/d/223728?_gl=1*1nsn4xh*_ga*MzU4NDI5NjYzLjE3MTI4NTE4MTA.*_ga_KXH10SQTZF*MTcxMjg1MTgxMC4xLjEuMTcxMjg1NTAzMi4xOS4wLjE4NDM5MDkyOTY.">
                                <img src="imgs/o maior show ilusionismo.webp" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3> 30 de maio de 2024</h3>
                                <h5>Maior show ilusionismo</h5>
                            </div>
                        </div>
                    </div>

                </nav>
                <!-- =============================================================================================================== -->
                <!--evento da semana-->
                <h2>Eventos da semana</h2>

                <nav class="eventos">

                    <!-- card eventos da semana 1-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank" href="img_5terre.jpg">
                                <img src="imgs/Monica.jpg" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>28, 29 e 30 de agosto de 2024</h3>
                                <h5>Talk com MONI</h5>
                            </div>
                        </div>
                    </div>


                    <!-- card eventos da semana 2-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank"
                               href="https://bileto.sympla.com.br/event/92614/d/248167?_gl=1*12idwc4*_ga*MzU4NDI5NjYzLjE3MTI4NTE4MTA.*_ga_KXH10SQTZF*MTcxMjg1MTgxMC4xLjEuMTcxMjg1NTE5OS41Ny4wLjE4NDM5MDkyOTY.">
                                <img src="imgs/o que so sabemos juntos.jpeg" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>8, 9 e 10 de junho de 2024</h3>
                                <h5>Oque só sabemos juntos</h5>
                            </div>
                        </div>
                    </div>

                    <!-- card eventos da semana 3-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank"
                               href="https://bileto.sympla.com.br/event/90561?_gl=1*of8j6t*_ga*MzU4NDI5NjYzLjE3MTI4NTE4MTA.*_ga_KXH10SQTZF*MTcxMjg1MTgxMC4xLjEuMTcxMjg1NTM2Ny42MC4wLjE4NDM5MDkyOTY.">
                                <img src="imgs/reclamacaododia.jpeg" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>24, 25 e 36 de maio de 2024</h3>
                                <h5>Reclamação do dia</h5>
                            </div>
                        </div>
                    </div>


                    <!-- card eventos da semana 4-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank" href="https://www.sympla.com.br/evento/os-tres-porquinhos-twp/2410228">
                                <img src="imgs/tres porquinho.jpg" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>28, 29 e 30 de agosto de 2025</h3>
                                <h5>Tres Porquinhos</h5>
                            </div>
                        </div>
                    </div>


                    <!-- card eventos da semana 5-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank"
                               href="https://bileto.sympla.com.br/event/90122/d/234053?_gl=1*73p5q2*_ga*MzU4NDI5NjYzLjE3MTI4NTE4MTA.*_ga_KXH10SQTZF*MTcxMjg1MTgxMC4xLjEuMTcxMjg1NTUxOS41My4wLjE4NDM5MDkyOTY.">
                                <img src="imgs/teatro222show.jpg" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>21, 22 e 23 de março de 2024</h3>
                                <h5>Barbara</h5>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- =============================================================================================================== -->
                <!-- eventos em 24hrs-->
                <h2>Eventos em 24Hrs</h2>

                <nav class="eventos">

                    <!-- card eventos em 24hrs 1-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank" href="https://www.sympla.com.br/evento/14-trilhao-de-curvelo/2388822">
                                <img src="imgs/trilha.png" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>28, 29 e 30 de setembro de 2025</h3>
                                <h5>Festival da montanha</h5>
                            </div>
                        </div>
                    </div>

                    <!-- card eventos em 24hrs 2-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank"
                               href="https://bileto.sympla.com.br/event/66707/d/249259/s/1700278?_gl=1*zgxkkw*_ga*MzU4NDI5NjYzLjE3MTI4NTE4MTA.*_ga_KXH10SQTZF*MTcxMjg1MTgxMC4xLjEuMTcxMjg1NTkyNy40Ny4wLjE4NDM5MDkyOTY.">
                                <img src="imgs/uma aventura na neve.jpeg" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>22, 23 e 24 de julho de 2024</h3>
                                <h5>Uma Aventura na Neve</h5>
                            </div>
                        </div>
                    </div>


                    <!-- card eventos em 24hrs 3-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank"
                               href="https://bileto.sympla.com.br/event/90376/d/235942?_gl=1*16ahi07*_ga*MzU4NDI5NjYzLjE3MTI4NTE4MTA.*_ga_KXH10SQTZF*MTcxMjg1MTgxMC4xLjEuMTcxMjg1NTk1NS4xOS4wLjE4NDM5MDkyOTY.">
                                <img src="imgs/patati.webp" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>28, 29 e 30 de agosto de 2025</h3>
                                <h5>Circo Patati Patatá</h5>
                            </div>
                        </div>
                    </div>


                    <!-- card eventos em 24hrs 4-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank" href="https://www.sympla.com.br/evento/a-domingueira-abril/2373745">
                                <img src="imgs/domingueira.jpg" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>Todos os domingos</h3>
                                <h5>Domingueira</h5>
                            </div>
                        </div>
                    </div>

                    <!-- card eventos em 24hrs 5-->
                    <div class="centralizar">
                        <div class="img-cards">
                            <a target="_blank" href="img_5terre.jpg">
                                <img src="imgs/festivaldamusica.png" alt="Cinque Terre">
                            </a>
                            <div class="desc">
                                <h3>28, 29 e 30 de março de 2025</h3>
                                <h5>Festival Da Musica</h5>
                            </div>
                        </div>
                    </div>

                </nav>
                <!-- =============================================================================================================== -->
            </section>

        </div>
    </main>
    <!-- =============================================================================================================== -->
    <!--footer-->
    <footer>
        <!--links-->
        <a class="link">termo de uso</a>
        <a class="link">Política de privacidade</a>
        <a class="link">Política de reembolso</a>
        <!--logo em rodape-->
        <a class="logo-rodape"> Diver<br />Ticket<br /></a>
        <a class="link">Perguntas Frequente</a>
        <a class="link">Informação de contatos</a>
        <a class="link">Sobre Nos</a>
    </footer>
    <!-- =============================================================================================================== -->
</html>
