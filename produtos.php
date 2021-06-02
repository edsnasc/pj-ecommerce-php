<!-- Novo código criado para cadastro de novo produto-->
<?php
include_once('controller/conexao.php');
?>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <title>Cadastrar Produto</title>
    <link rel="stylesheet" href="css/style.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
    <header>
    <div class="center">
      <h1>Cadastro de Produto</h1>
      <a href="index.php" target="_self">Voltar</a>
    </div>
  </header>
    <section id="produtos">
      <form class="" action="insere-produto.php" method="post">
        Nome: <input type="text" name="nome" required></input></br>
        Descrição: <input type="text" name="descricao" required></input></br>
        Estoque: <input type="number" name="estoque" required></input></br>
        Preço: <input type="number" name="preco" min="0.00" max="10000.00" step="0.01" required></input></br>
        Categoria:
          <select name="seleciona_categoria">
            <option>Selecione</option>
              <?php
                $resultado_categoria = "SELECT * FROM categoria";
                $resultcategoria = mysqli_query($mysqli, $resultado_categoria);
                while($row_categorias = mysqli_fetch_assoc($resultcategoria)){ ?>
                  <option value="<?php echo $row_categorias['IDCATEGORIA']?>">
                    <?php echo $row_categorias['DESCRICAO']; ?>
                  </option> <?php
                }
              ?>
          </select></br>
          Marca:
            <select name="seleciona_marca">
              <option>Selecione</option>
                <?php
                  $resultado_marca = "SELECT * FROM marca";
                  $resultmarca = mysqli_query($mysqli, $resultado_marca);
                  while($row_marcas = mysqli_fetch_assoc($resultmarca)){ ?>
                    <option value="<?php echo $row_marcas['IDMARCA']?>">
                      <?php echo $row_marcas['DESCRICAO']; ?>
                    </option> <?php
                  }
                ?>
            </select></br>
        <input type="submit" value="Cadastrar"></input>
      </form>
    </section>
  </body>
</html>
