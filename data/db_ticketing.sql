-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 08, 2023 at 06:24 PM
-- Server version: 5.7.11
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ticketing`
--
CREATE DATABASE IF NOT EXISTS `db_ticketing` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_ticketing`;

-- --------------------------------------------------------

--
-- Table structure for table `t_attachement`
--

CREATE TABLE `t_attachement` (
  `idAttachement` int(11) NOT NULL,
  `attPath` varchar(200) NOT NULL,
  `fkTicket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_priority`
--

CREATE TABLE `t_priority` (
  `idPriority` int(11) NOT NULL,
  `priTitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_priority`
--

INSERT INTO `t_priority` (`idPriority`, `priTitle`) VALUES
(1, 'Basse'),
(2, 'Moyenne'),
(3, 'Urgente');

-- --------------------------------------------------------

--
-- Table structure for table `t_reply`
--

CREATE TABLE `t_reply` (
  `idReply` int(11) NOT NULL,
  `repContent` varchar(2000) NOT NULL,
  `repCreationDate` datetime NOT NULL,
  `fkTicket` int(11) NOT NULL,
  `fkUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_reply`
--

INSERT INTO `t_reply` (`idReply`, `repContent`, `repCreationDate`, `fkTicket`, `fkUser`) VALUES
(3, 'bonjour', '2023-01-07 17:15:20', 1, 2),
(4, 'bonjour', '2023-01-07 17:16:43', 1, 1),
(12, 'e the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. I', '2023-01-08 17:31:10', 1, 1),
(13, 'tews', '2023-01-08 17:33:38', 1, 1),
(14, 'hello\r\n', '2023-01-08 18:24:59', 1, 1),
(15, 'test next day msg', '2023-01-09 00:00:00', 1, 1),
(16, 'Jai oyuidfgus asuhdgvfusd sduoifsoudf', '2023-01-08 19:06:13', 3, 2),
(18, 'okok c bon', '2023-01-08 19:07:57', 3, 2),
(19, 'hudbsfsdfsdf', '2023-01-08 19:08:11', 3, 1),
(20, 'sdfsdfsdf', '2023-01-09 19:08:12', 3, 1),
(21, 'sdfhsdghdfg', '2023-01-08 19:16:16', 4, 1),
(22, 'dfghdfgh', '2023-01-08 19:16:18', 4, 1),
(23, 'asdasdasd', '2023-01-08 19:16:27', 4, 2),
(24, 'asdasd', '2023-01-08 19:16:29', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_status`
--

CREATE TABLE `t_status` (
  `idStatus` int(11) NOT NULL,
  `staTitle` varchar(50) NOT NULL,
  `staColorHex` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_status`
--

INSERT INTO `t_status` (`idStatus`, `staTitle`, `staColorHex`) VALUES
(1, 'Nouveau', NULL),
(2, 'Assigné', NULL),
(3, 'En cours', NULL),
(4, 'Résolu', NULL),
(5, 'Clôluré', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_ticket`
--

CREATE TABLE `t_ticket` (
  `idTicket` int(11) NOT NULL,
  `ticTitle` varchar(50) NOT NULL,
  `ticDescription` varchar(20000) NOT NULL,
  `fkPriority` int(11) DEFAULT NULL,
  `fkStatus` int(11) NOT NULL DEFAULT '1',
  `ticCreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticResolutionDate` datetime DEFAULT NULL,
  `fkType` int(11) DEFAULT NULL,
  `fkUser` int(11) DEFAULT NULL,
  `fkResolver` int(11) DEFAULT NULL,
  `fkSolution` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_ticket`
--

INSERT INTO `t_ticket` (`idTicket`, `ticTitle`, `ticDescription`, `fkPriority`, `fkStatus`, `ticCreationDate`, `ticResolutionDate`, `fkType`, `fkUser`, `fkResolver`, `fkSolution`) VALUES
(1, 'Replies test', 'this ticket is to test out replies and message between admins and users to help solve the problem', NULL, 5, '2023-01-08 14:55:47', '2023-01-08 18:58:12', 1, 2, 1, NULL),
(2, 'Test withtout replies', 'just to see if it says that there are no current messages', NULL, 1, '2023-01-08 16:40:13', NULL, 2, 2, NULL, NULL),
(3, 'Hello', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem ', 2, 5, '2023-01-08 19:06:01', '2023-01-08 19:08:51', 2, 2, 1, NULL),
(4, 'Test tata', 'the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which lo', 2, 5, '2023-01-08 19:15:02', '2023-01-08 19:17:04', 1, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_type`
--

CREATE TABLE `t_type` (
  `idType` int(11) NOT NULL,
  `tyTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_type`
--

INSERT INTO `t_type` (`idType`, `tyTitle`) VALUES
(1, 'Bug'),
(2, 'Demande de changement');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `idUser` int(11) NOT NULL,
  `useSurname` varchar(20) NOT NULL,
  `useName` varchar(20) NOT NULL,
  `useEmail` varchar(100) NOT NULL,
  `useUsername` varchar(20) NOT NULL,
  `usePassword` varchar(100) NOT NULL,
  `useAdmin` tinyint(4) NOT NULL,
  `useLevel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`idUser`, `useSurname`, `useName`, `useEmail`, `useUsername`, `usePassword`, `useAdmin`, `useLevel`) VALUES
(1, 'Admin', 'Carlier', 'admin.dupont@eduvaud.ch', 'admin', '$2y$10$7HKzpJkFzp56lgbuYZnyVu8rYNqopK4y1gA8FJlQZeD1j1a4XfXMm', 1, 1),
(2, 'Serghei', 'Diulgherov', 'eleve.dupont@gmail.com', 'user', '$2y$10$7HKzpJkFzp56lgbuYZnyVu8rYNqopK4y1gA8FJlQZeD1j1a4XfXMm', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_attachement`
--
ALTER TABLE `t_attachement`
  ADD PRIMARY KEY (`idAttachement`),
  ADD KEY `fkTicket` (`fkTicket`);

--
-- Indexes for table `t_priority`
--
ALTER TABLE `t_priority`
  ADD PRIMARY KEY (`idPriority`);

--
-- Indexes for table `t_reply`
--
ALTER TABLE `t_reply`
  ADD PRIMARY KEY (`idReply`),
  ADD KEY `fk_ReplyAuthor` (`fkUser`),
  ADD KEY `fk_Ticket` (`fkTicket`);

--
-- Indexes for table `t_status`
--
ALTER TABLE `t_status`
  ADD PRIMARY KEY (`idStatus`);

--
-- Indexes for table `t_ticket`
--
ALTER TABLE `t_ticket`
  ADD PRIMARY KEY (`idTicket`),
  ADD KEY `fk_Solution` (`fkSolution`),
  ADD KEY `fk_Priority` (`fkPriority`),
  ADD KEY `fk_Status` (`fkStatus`),
  ADD KEY `fk_Resolver` (`fkResolver`),
  ADD KEY `fk_User` (`fkUser`),
  ADD KEY `fkType` (`fkType`);

--
-- Indexes for table `t_type`
--
ALTER TABLE `t_type`
  ADD PRIMARY KEY (`idType`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_attachement`
--
ALTER TABLE `t_attachement`
  MODIFY `idAttachement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_priority`
--
ALTER TABLE `t_priority`
  MODIFY `idPriority` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_reply`
--
ALTER TABLE `t_reply`
  MODIFY `idReply` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `t_status`
--
ALTER TABLE `t_status`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_ticket`
--
ALTER TABLE `t_ticket`
  MODIFY `idTicket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_type`
--
ALTER TABLE `t_type`
  MODIFY `idType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_attachement`
--
ALTER TABLE `t_attachement`
  ADD CONSTRAINT `t_attachement_ibfk_1` FOREIGN KEY (`fkTicket`) REFERENCES `t_ticket` (`idTicket`);

--
-- Constraints for table `t_reply`
--
ALTER TABLE `t_reply`
  ADD CONSTRAINT `fk_ReplyAuthor` FOREIGN KEY (`fkUser`) REFERENCES `t_user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Ticket` FOREIGN KEY (`fkTicket`) REFERENCES `t_ticket` (`idTicket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_ticket`
--
ALTER TABLE `t_ticket`
  ADD CONSTRAINT `fk_Priority` FOREIGN KEY (`fkPriority`) REFERENCES `t_priority` (`idPriority`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Resolver` FOREIGN KEY (`fkResolver`) REFERENCES `t_user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Solution` FOREIGN KEY (`fkSolution`) REFERENCES `t_reply` (`idReply`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Status` FOREIGN KEY (`fkStatus`) REFERENCES `t_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_User` FOREIGN KEY (`fkUser`) REFERENCES `t_user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_ticket_ibfk_1` FOREIGN KEY (`fkType`) REFERENCES `t_type` (`idType`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
