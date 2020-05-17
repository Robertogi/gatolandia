<?php

/////////////////////////////////////////
// Configurações inicias da aplicação! //
/////////////////////////////////////////
require ('_config.php');

///////////////////////////////////////
// Configurações iniciais da página! //
///////////////////////////////////////

/*
    $titulo --> Define o título "desta" página.
    Se = "", usa o título e o slogan do site.
*/
$titulo = "Artigos";

/*
    $css --> Carrega o CSS adicional "desta" página.
    Se "", não carrega CSS adicional.
    Exemplo: /css/template.css
*/
$css = "/css/artigos.css";

/*
    $js --> Carrega o JavaScript adicional "desta" página.
    Se "", não usa JavaScript adicional.
    Exemplo: /js/template.js
*/
$js = "";

/*
    $menu --> Define o item ativo do menu "nesta" página.
    Se "", nenhum item será marcado.
    Valores possíveis: "", "artigos", "contatos", "sobre", "procurar", "noticias".
    Qualquer outro valor = "".
*/
$menu = "artigos";

/////////////////////////////////////////////////////
// Seus códigos PHP para esta página começam aqui! //
/////////////////////////////////////////////////////



//////////////////////////////////////////////////////
// Seus códigos PHP para esta página terminam aqui! //
// Teoricamente, não precisa alterar nada abaixo!   //
//////////////////////////////////////////////////////

// Template de abertura - cabeçalho
require ('_header.php');

?> 




<?php

// Template de fechamento - rodapé
require ('_footer.php');

?>