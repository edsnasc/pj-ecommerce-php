<?php
include('controller/conexao.php');

/*$descricao  = $_POST["descricao"];
################################
1º Modo para inserção de valores

echo "<h3>Descrição:  $descricao</h3></br></br>";


$cad_categoria = "INSERT INTO categoria (DESCRICAO) VALUES ('$descricao')";

if (mysqli_query($mysqli, $cad_categoria)) {
      echo "<h1>Nova Categoria cadastrada com Sucesso </h1></br>";
} else {
      echo "Erro: " . $cad_categoria . "</br>" . mysqli_error($mysqli);
}
mysqli_close($mysqli);
*/

//2º Modo para inserção de valores

$descricao  = $_POST["descricao"];
$cad_categoria = "SELECT * FROM categoria WHERE descricao = '{$descricao}'";
$resultado = mysqli_query($mysqli, $cad_categoria);
$row = mysqli_num_rows($resultado);
  if ($row == 0) {
    $cad_categoria = "INSERT INTO categoria (DESCRICAO) VALUES ('$descricao')";
    echo "<h2>Cadastro realizado com sucesso</h2>";
  } else {
    //echo "Erro: " . $cad_categoria . "</br>" . mysqli_error($mysqli);
    echo "<h2>Descrição já cadastrada</h2>";
  }?>
