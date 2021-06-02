<?php
  //Conferir os dados abaixo que serão utilizados para a string de conexão com banco de dados
  //Atenação às informações contidas nessas variáveis, pois, caso alguma esteja errada, haverá problema na conexão
  $user = ''; //Informar o nome de usuário do banco Mysql
  $pass = ''; // Adicionar senha do usuário do Mysql
  $server = '';
  $db = 'compra'; //Nome do banco que deve ser criado antes do código SQL da base

  $mysqli = mysqli_connect($server, $user, $pass, $db);
  $mysqli->set_charset('utf8');

  if ($mysqli->connect_error){
    die ('Connect Error');
  }
?>
