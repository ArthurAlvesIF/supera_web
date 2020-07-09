-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 09-Jul-2020 às 22:05
-- Versão do servidor: 8.0.18
-- versão do PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `supera_estudos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

DROP TABLE IF EXISTS `atividade`;
CREATE TABLE IF NOT EXISTS `atividade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) NOT NULL,
  `id_materia` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_metodo` bigint(20) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `cronometro` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario` (`id_usuario`),
  KEY `fk_materia` (`id_materia`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `atividade`
--

INSERT INTO `atividade` (`id`, `nome`, `id_materia`, `id_usuario`, `id_metodo`, `data_inicio`, `data_fim`, `status`, `cronometro`) VALUES
(1, 'arthur', 1, 2, 1, '0000-00-00', '0000-00-00', 'incompleta', '20'),
(2, 'Atividade 1', 8, 2, 1, '1111-11-11', '1111-11-11', 'status', '12'),
(3, 'Atividade 1', 8, 2, 0, '1111-11-11', '1111-11-11', 'status', '12'),
(4, 'Atividade 2', 8, 2, 1, '2222-02-22', '2222-02-22', 'status....', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `conteudo`
--

DROP TABLE IF EXISTS `conteudo`;
CREATE TABLE IF NOT EXISTS `conteudo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) NOT NULL,
  `id_materia` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario` (`id_usuario`),
  KEY `fk_materia` (`id_materia`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `conteudo`
--

INSERT INTO `conteudo` (`id`, `nome`, `id_materia`, `id_usuario`) VALUES
(2, 'introdução', 8, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `materia`
--

DROP TABLE IF EXISTS `materia`;
CREATE TABLE IF NOT EXISTS `materia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `nome` varchar(55) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `materia`
--

INSERT INTO `materia` (`id`, `status`, `nome`, `id_usuario`) VALUES
(5, 'estudando', 'filosfia2', 2),
(6, 'revisão...', 'Redação', 0),
(7, 'revisão...', 'Redação', 5),
(8, 'revisão...', 'Redação', 10),
(9, 'sdf', 'matemática', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `metodo`
--

DROP TABLE IF EXISTS `metodo`;
CREATE TABLE IF NOT EXISTS `metodo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `metodo`
--

INSERT INTO `metodo` (`id`, `nome`) VALUES
(1, 'pomodoro'),
(4, 'Revisão 3'),
(6, 'Método 3'),
(8, 'teste 4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `forma_de_pagamento` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  `subtotal` varchar(6) NOT NULL,
  `desconto` varchar(6) NOT NULL,
  `total` varchar(6) NOT NULL,
  `complemento` varchar(55) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id`, `data`, `forma_de_pagamento`, `status`, `subtotal`, `desconto`, `total`, `complemento`, `id_usuario`) VALUES
(1, '0000-00-00', '4x', 'pago', '20', '', '20', 'comp', 2),
(2, '0000-00-00', '4x', 'pago', '20', '0', '20', 'comp', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

DROP TABLE IF EXISTS `plano`;
CREATE TABLE IF NOT EXISTS `plano` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(25) NOT NULL,
  `prazo` int(11) NOT NULL,
  `valor` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `plano`
--

INSERT INTO `plano` (`id`, `nome`, `prazo`, `valor`) VALUES
(1, 'Plano 23', 365, '300'),
(2, 'Plano 1', 120, '300'),
(3, 'Plano 3', 123, '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `revisao`
--

DROP TABLE IF EXISTS `revisao`;
CREATE TABLE IF NOT EXISTS `revisao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `revisao`
--

INSERT INTO `revisao` (`id`, `nome`) VALUES
(1, 'fisica');

-- --------------------------------------------------------

--
-- Estrutura da tabela `revisao_array`
--

DROP TABLE IF EXISTS `revisao_array`;
CREATE TABLE IF NOT EXISTS `revisao_array` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL,
  `id_atividade` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_atividade` (`id_atividade`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `revisao_array`
--

INSERT INTO `revisao_array` (`id`, `quantidade`, `id_atividade`) VALUES
(1, 7, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `senha` varchar(55) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `rua` varchar(55) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(55) NOT NULL,
  `bairro` varchar(25) NOT NULL,
  `cidade` varchar(25) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `telefone`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`, `cpf`) VALUES
(8, 'Arthur Antônio Freire Alves', 'arthur250701@outlook.coma', '202cb962ac59075b964b07152d234b70', '83993361604', '1', 1, '1', '1', 'CAIÇARA', '1', '58253-000', '1'),
(2, 'arthur ant', 'arthur@antonio.br', '123', '83993361604', 'prefeito francisco carneiro', 12, 'perto do campo', 'centro', 'Caiçara', 'Paraíba', '58253-000', '097.528.394-44'),
(7, 'Samara', '123', '202cb962ac59075b964b07152d234b70', '123', '123', 123, '123', '2131', '123', '1231', '123', '123'),
(4, 'Arthur A', 'arthur@alves.bra', '202cb962ac59075b964b07152d234b70', '(83) 99336-1604', 'Prefeito Francisco Carneiro', 0, 'prox ao campo', 'centro', 'caiçara', 'Paraiba', '58253-000', '097.528.394-44'),
(5, 'Arthur Antônio Freire Alves', 'arthur250701@outlook.com', 'c4ca4238a0b923820dcc509a6f75849b', '83993361604', '2', 1, '', '1', '', 'Paraíba', '58253-000', 'CAIÇARA'),
(6, 'Arthur Antônio Freire Alves', 'arthur250701@outlook.comm', 'c4ca4238a0b923820dcc509a6f75849b', '83993361604', '1', 1, '1', '1', 'CAIÇARA', 'Paraíba', '58253-000', '123321'),
(9, 'Arthur Antônio Freire Alves', 'arthur250701@outlook.comaa', '202cb962ac59075b964b07152d234b70', '83993361604', '1', 1, '1', '1', 'CAIÇARA', '1', '58253-000', '1'),
(10, 'Arthur Antônio Freire Alves', 'arthur250701@outlook.comaaaa', '202cb962ac59075b964b07152d234b70', '83993361604', '1', 1, '1', '1', 'CAIÇARA', '1', '58253-000', '123'),
(11, 'Arthur Antônio Freire Alves', 'arthur250701@out1look.com', 'c4ca4238a0b923820dcc509a6f75849b', '83993361604', '1', 1, '1', '1', 'CAIÇARA', 'Paraíba', '58253-000', '1');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
