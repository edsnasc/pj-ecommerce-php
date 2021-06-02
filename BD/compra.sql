-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10-Out-2015 às 20:59
-- Versão do servidor: 5.6.26
-- PHP Version: 5.6.12
-- Material disponibilizado pelo professor Anderson Macedo.
-- Projeto alterado, melhorado e adaptado pelo professor Leonardo Rocha

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `compra`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `IDCATEGORIA` int(11) NOT NULL,
  `DESCRICAO` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`IDCATEGORIA`, `DESCRICAO`) VALUES
(1, 'Achocolatado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `IDCLI` int(10) NOT NULL,
  `NOME` varchar(255) NOT NULL,
  `LOGIN` varchar(255) NOT NULL,
  `SENHA` varchar(255) NOT NULL,
  `DTNASC` date NOT NULL,
  `ENDERECO` varchar(255) NOT NULL,
  `SEXO` int(1) NOT NULL,
  `CPF` varchar(20) NOT NULL,
  `RG` varchar(20) NOT NULL,
  `TELEFONE` varchar(20) NOT NULL,
  `CELULAR` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`IDCLI`, `NOME`, `LOGIN`, `SENHA`, `DTNASC`, `ENDERECO`, `SEXO`, `CPF`, `RG`, `TELEFONE`, `CELULAR`) VALUES
(1, 'Leonardo Rocha', 'leonardo', '123456', '1983-07-02', 'Rua Lorem ipsum dolor sit amet', 1, '000.000.000-00', '00000000', '(43)3333-3333', '(43)3344-3344');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `IDFOR` int(10) NOT NULL,
  `NOME` varchar(255) NOT NULL,
  `TELEFONE` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`IDFOR`, `NOME`, `TELEFONE`) VALUES
(1, 'Unopar', '(43)3333-3333');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itempedido`
--

CREATE TABLE IF NOT EXISTS `itempedido` (
  `IDITEM` int(11) NOT NULL,
  `IDPED` int(11) NOT NULL,
  `IDPROD` int(11) NOT NULL,
  `SEQ` int(11) NOT NULL,
  `QTDE` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `itempedido`
--

INSERT INTO `itempedido` (`IDITEM`, `IDPED`, `IDPROD`, `SEQ`, `QTDE`) VALUES
(37, 50, 1, 1, 2),
(38, 50, 2, 2, 1),
(39, 51, 1, 1, 3),
(40, 51, 2, 2, 3),
(41, 52, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
  `IDMARCA` int(11) NOT NULL,
  `DESCRICAO` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`IDMARCA`, `DESCRICAO`) VALUES
(1, 'Native'),
(2, 'Nestle');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `IDPED` int(11) NOT NULL,
  `IDCLI` int(11) NOT NULL,
  `IDFOR` int(11) NOT NULL,
  `DATA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` char(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`IDPED`, `IDCLI`, `IDFOR`, `DATA`, `STATUS`) VALUES
(50, 1, 1, '2021-09-29 08:34:20', 'E'),
(51, 1, 1, '2021-09-30 12:05:28', 'E'),
(52, 1, 1, '2021-09-30 12:06:47', 'E');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
  `IDPROD` int(10) NOT NULL,
  `IDCATEGORIA` int(10) NOT NULL,
  `IDMARCA` int(10) NOT NULL,
  `NOME` varchar(255) NOT NULL,
  `DESCRICAO` varchar(255) NOT NULL,
  `ESTOQUE` int(10) NOT NULL,
  `PRECO` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`IDPROD`, `IDCATEGORIA`, `IDMARCA`, `NOME`, `DESCRICAO`, `ESTOQUE`, `PRECO`) VALUES
(1, 1, 2, 'Nescau', 'Achocolatado em pó', 2, 20.3),
(2, 1, 1, 'Cereal', 'Cereal nutritivo', 17, 10.35),
(3, 1, 1, 'Biscoito', 'Biscoito Bono', 50, 2.00);
--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`IDCATEGORIA`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IDCLI`);

--
-- Indexes for table `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`IDFOR`);

--
-- Indexes for table `itempedido`
--
ALTER TABLE `itempedido`
  ADD PRIMARY KEY (`IDITEM`,`IDPED`),
  ADD KEY `IDPED` (`IDPED`),
  ADD KEY `IDPROD` (`IDPROD`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`IDMARCA`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IDPED`),
  ADD KEY `IDCLI` (`IDCLI`),
  ADD KEY `IDFOR` (`IDFOR`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`IDPROD`,`IDCATEGORIA`,`IDMARCA`),
  ADD KEY `IDCATEGORIA` (`IDCATEGORIA`),
  ADD KEY `IDMARCA` (`IDMARCA`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `IDCATEGORIA` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `IDCLI` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `IDFOR` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `itempedido`
--
ALTER TABLE `itempedido`
  MODIFY `IDITEM` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `IDMARCA` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `IDPED` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `IDPROD` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `itempedido`
--
ALTER TABLE `itempedido`
  ADD CONSTRAINT `itempedido_ibfk_1` FOREIGN KEY (`IDPED`) REFERENCES `pedido` (`IDPED`),
  ADD CONSTRAINT `itempedido_ibfk_2` FOREIGN KEY (`IDPROD`) REFERENCES `produtos` (`IDPROD`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`IDCLI`) REFERENCES `cliente` (`IDCLI`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`IDFOR`) REFERENCES `fornecedor` (`IDFOR`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`IDCATEGORIA`) REFERENCES `categoria` (`IDCATEGORIA`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`IDMARCA`) REFERENCES `marca` (`IDMARCA`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
