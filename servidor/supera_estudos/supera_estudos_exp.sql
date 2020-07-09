-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 30-Abr-2020 às 05:20
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `atividade`
--

INSERT INTO `atividade` (`id`, `nome`, `id_materia`, `id_usuario`, `id_metodo`, `data_inicio`, `data_fim`, `status`, `cronometro`) VALUES
(1, 'arthur', 1, 2, 1, '0000-00-00', '0000-00-00', 'incompleta', '20');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `materia`
--

INSERT INTO `materia` (`id`, `status`, `nome`, `id_usuario`) VALUES
(1, 'revisar', 'física', 2),
(3, 'estudando', 'quim', 2),
(4, 'estudando', 'filosfia', 2),
(5, 'estudando', 'filosfia2', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `metodo`
--

DROP TABLE IF EXISTS `metodo`;
CREATE TABLE IF NOT EXISTS `metodo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `metodo`
--

INSERT INTO `metodo` (`id`, `nome`) VALUES
(1, 'pomodoro');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `plano`
--

INSERT INTO `plano` (`id`, `nome`, `prazo`, `valor`) VALUES
(1, 'basico', 60, '30');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `telefone`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`, `cpf`) VALUES
(2, 'arthur ant', 'arthur@antonio.br', '123', '83993361604', 'prefeito francisco carneiro', 12, 'perto do campo', 'centro', 'Caiçara', 'Paraíba', '58253-000', '097.528.394-44');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
