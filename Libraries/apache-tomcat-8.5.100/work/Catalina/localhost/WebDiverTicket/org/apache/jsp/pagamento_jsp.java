/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.100
 * Generated at: 2024-06-03 23:32:33 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class pagamento_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"stylePagar.css\">\n");
      out.write("        <title>Pagar</title>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            <!--logo-->\n");
      out.write("            <a href=\"index.jsp\" class=\"logo\"> Diver<br />Ticket<br /> </a>\n");
      out.write("            <!--botoes header-->\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("        ");

            String u = null;
            u = request.getParameter("idEvento");

            String[] palavras = u.split(";");

            int idEvento = Integer.parseInt(palavras[0]);
            String tipo = palavras[1];
            int totalIngresso = Integer.parseInt(palavras[2]);
            double valorTotal = Double.parseDouble(palavras[3]);

            String salvar = "salvarIngresso.jsp?idEvento=" + idEvento;


        
      out.write("\n");
      out.write("\n");
      out.write("        <main>\n");
      out.write("\n");
      out.write("            <form action=\"");
      out.print( salvar);
      out.write("\" method=\"post\"  onsubmit=\"return salvarIngresso()\">\n");
      out.write("\n");
      out.write("                <h2>Informaçoes para recebimento de ingresso</h2>\n");
      out.write("\n");
      out.write("                <label for=\"nome\">nome</label>\n");
      out.write("                <input type=\"text\" placeholder=\"Insira o sue nome\" name=\"nome\" id=\"nome\">\n");
      out.write("\n");
      out.write("                <label for=\"email\">E-mail</label>\n");
      out.write("                <input type=\"text\" placeholder=\"Insira o email\" name=\"email\" id=\"email\" required>\n");
      out.write("\n");
      out.write("                <label for=\"cpf\">CPF</label>\n");
      out.write("                <input type=\"text\" placeholder=\"000.000.000-00\" name=\"cpf\" id=\"cpf\" minlength=\"14\" maxlength=\"14\" required><br><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <h2>Informação de pagamento</h2>\n");
      out.write("                <!--NOME DO CARTÃO-->\n");
      out.write("                <label for=\"nomeCartao\">Nome impresso no cartão</label>\n");
      out.write("                <input type=\"text\" placeholder=\"Insira o nome do cartão\" name=\"nomeCartao\" maxlength=\"50\" id=\"nomeCartao\"\n");
      out.write("                       required>\n");
      out.write("\n");
      out.write("                <!--NUMERO DO CARTÃO-->\n");
      out.write("                <label for=\"numeroCartao\">Número do Cartão</label>\n");
      out.write("                <input type=\"text\" placeholder=\"0000 0000 0000 0000\" name=\"numeroCartao\" maxlength=\"19\" id=\"numeroCartao\"\n");
      out.write("                       required>\n");
      out.write("\n");
      out.write("                <!--VALIDADE DO CARTÃO-->\n");
      out.write("                <label for=\"dataValidade\">Data de validade</label>\n");
      out.write("                <input type=\"text\" placeholder=\"MM/AA\" name=\"dataValidade\" maxlength=\"5\" id=\"dataValidade\" required>\n");
      out.write("\n");
      out.write("                <!--CODIGO DE SEGURANÇA DO CARTÃO-->\n");
      out.write("                <label for=\"codigoSegurancaCartao\">Codigo de Seguranca do Cartao</label>\n");
      out.write("                <input type=\"text\" placeholder=\"000\" name=\"codigoSegurancaCartao\" maxlength=\"3\" id=\"codigoSegurancaCartao\"\n");
      out.write("                       required><br><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <h2>resumo da compra</h2>\n");
      out.write("\n");
      out.write("                <label for=\"nome\">quantidade de ingresso</label>\n");
      out.write("                <input type=\"number\" value=\"");
      out.print( totalIngresso);
      out.write("\" name=\"qtdIngresso\" readonly>\n");
      out.write("\n");
      out.write("                <label for=\"nome\"> Valor total </label>\n");
      out.write("                <input type=\"text\" value=\"");
      out.print( valorTotal);
      out.write("\" name=\"valorTotal\" readonly>\n");
      out.write("\n");
      out.write("                <label for=\"nome\">Tipo</label>\n");
      out.write("                <input type=\"text\" value=\"");
      out.print( tipo);
      out.write("\" name=\"tipo\" readonly>\n");
      out.write("\n");
      out.write("                <!--BOTÃO CONTINUA-->\n");
      out.write("                <button type=\"submit\" >Comprar</button>\n");
      out.write("\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("            <script>\n");
      out.write("                // valida se todos os requisitos de pagemnto estão correto para salvar no banco de dados\n");
      out.write("                function salvarIngresso() {\n");
      out.write("\n");
      out.write("                    // Evento do botão Pagar\n");
      out.write("                    document.getElementById('pagar').addEventListener('click', function () {\n");
      out.write("                        // Aqui você pode pegar os dados do cartão\n");
      out.write("                        var numeroCartao = document.getElementById('numeroCartao').value;\n");
      out.write("                        var dataValidade = document.getElementById('dataValidade').value;\n");
      out.write("                        var cpf = document.getElementById('cpf').value;\n");
      out.write("                        var email = document.getElementById('email').value;\n");
      out.write("                        var nomeCartao = document.getElementById('nomeCartao').value;\n");
      out.write("                        var nome = document.getElementById('nome').value;\n");
      out.write("                        // Verificando se todos os campos foram preenchidos corretamente\n");
      out.write("                        if (numeroCartao.length === 19 && dataValidade.length === 5 && cpf.length === 14 && email.length > 6 && nomeCartao.length > 2 && nome.length > 3) {\n");
      out.write("                            // Adicionando a mensagem de sucesso\n");
      out.write("                            return true;\n");
      out.write("                        } else {\n");
      out.write("                            // Adicionando a mensagem de erro\n");
      out.write("                            alert('Por favor, preencha todos os campos corretamente.');\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("            </script>\n");
      out.write("\n");
      out.write("            <!--JAVASCRIPT PARA VALIDAR O E-MAIL -->\n");
      out.write("            <script>\n");
      out.write("                document.getElementById('email').addEventListener('input', function (event) {\n");
      out.write("                    var email = event.target.value;\n");
      out.write("                    var regex = /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/;\n");
      out.write("                    if (regex.test(email)) {\n");
      out.write("                        // O e-mail é válido\n");
      out.write("                        event.target.setCustomValidity('');\n");
      out.write("                    } else {\n");
      out.write("                        // O e-mail é inválido\n");
      out.write("                        event.target.setCustomValidity('Por favor, insira um endereço de e-mail válido.');\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            </script>\n");
      out.write("\n");
      out.write("            <!--JAVASCRIPT DO CPF--> \n");
      out.write("            <script>\n");
      out.write("                // Função para adicionar os pontos e hífen no CPF\n");
      out.write("                function formatarCPF(cpf) {\n");
      out.write("                    // Remove caracteres que não são dígitos\n");
      out.write("                    cpf = cpf.replace(/\\D/g, '');\n");
      out.write("                    // Adiciona ponto após o terceiro e sexto dígitos do CPF\n");
      out.write("                    cpf = cpf.replace(/(\\d{3})(\\d)/, '$1.$2');\n");
      out.write("                    cpf = cpf.replace(/(\\d{3})(\\d)/, '$1.$2');\n");
      out.write("                    // Adiciona hífen após o nono dígito do CPF\n");
      out.write("                    cpf = cpf.replace(/(\\d{3})(\\d{1,2})$/, '$1-$2');\n");
      out.write("                    return cpf;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                // Evento de input para formatar o CPF durante a digitação\n");
      out.write("                function adicionarEventoInput() {\n");
      out.write("                    const inputCPF = document.getElementById('cpf');\n");
      out.write("                    inputCPF.addEventListener('input', function (e) {\n");
      out.write("                        e.target.value = formatarCPF(e.target.value);\n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                // Inicializa o evento de input após o carregamento da página\n");
      out.write("                window.addEventListener('DOMContentLoaded', adicionarEventoInput);\n");
      out.write("            </script>\n");
      out.write("\n");
      out.write("            <!--JAVASCRIPT DO NUMERO DO CARTÃO-->\n");
      out.write("\n");
      out.write("            <script>\n");
      out.write("                // Função para adicionar espaços a cada quatro dígitos\n");
      out.write("                function formatarNumeroCartao(numero) {\n");
      out.write("                    // Remove caracteres que não são dígitos\n");
      out.write("                    numero = numero.replace(/\\D/g, '');\n");
      out.write("                    // Adiciona espaço após cada quatro dígitos\n");
      out.write("                    numero = numero.replace(/(\\d{4})(?=\\d)/g, '$1 ');\n");
      out.write("                    return numero;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                // Evento de input para formatar o número do cartão durante a digitação\n");
      out.write("                function adicionarEventoInput() {\n");
      out.write("                    const inputNumeroCartao = document.getElementById('numeroCartao');\n");
      out.write("                    inputNumeroCartao.addEventListener('input', function (e) {\n");
      out.write("                        e.target.value = formatarNumeroCartao(e.target.value);\n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                // Inicializa o evento de input após o carregamento da página\n");
      out.write("                window.addEventListener('DOMContentLoaded', adicionarEventoInput);\n");
      out.write("            </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <!--JAVASCRIPT PARA DATA-->\n");
      out.write("            <script>\n");
      out.write("                // Função para adicionar a barra entre mês e ano\n");
      out.write("                function formatarData(data) {\n");
      out.write("                    // Remove caracteres que não são dígitos\n");
      out.write("                    data = data.replace(/\\D/g, '');\n");
      out.write("                    // Adiciona barra após o segundo dígito (mês)\n");
      out.write("                    data = data.replace(/(\\d{2})(\\d)/, '$1/$2');\n");
      out.write("                    return data;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                // Evento de input para formatar a data durante a digitação\n");
      out.write("                function adicionarEventoInput() {\n");
      out.write("                    const inputData = document.getElementById('dataValidade');\n");
      out.write("                    inputData.addEventListener('input', function (e) {\n");
      out.write("                        e.target.value = formatarData(e.target.value);\n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                // Inicializa o evento de input após o carregamento da página\n");
      out.write("                window.addEventListener('DOMContentLoaded', adicionarEventoInput);\n");
      out.write("            </script>\n");
      out.write("        </main>\n");
      out.write("        <footer>\n");
      out.write("\n");
      out.write("            <!--links-->\n");
      out.write("            <a class=\"link\">termo de uso</a>\n");
      out.write("            <a class=\"link\">Política de privacidade</a>\n");
      out.write("            <a class=\"link\">Política de reembolso</a>\n");
      out.write("            <!--logo em rodape-->\n");
      out.write("            <a href=\"index.html\" class=\"logo-rodape\"> Diver<br />Ticket<br /></a>\n");
      out.write("            <a class=\"link\">Perguntas Frequente</a>\n");
      out.write("            <a class=\"link\">Informação de contatos</a>\n");
      out.write("            <a class=\"link\">Sobre Nos</a>\n");
      out.write("\n");
      out.write("        </footer>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}