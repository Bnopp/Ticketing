-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 11 jan. 2023 à 08:53
-- Version du serveur : 5.7.11
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_ticketing`
--
CREATE DATABASE IF NOT EXISTS `db_ticketing` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_ticketing`;

-- --------------------------------------------------------

--
-- Structure de la table `t_attachement`
--

CREATE TABLE `t_attachement` (
  `idAttachement` int(11) NOT NULL,
  `attPath` varchar(200) NOT NULL,
  `fkTicket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_priority`
--

CREATE TABLE `t_priority` (
  `idPriority` int(11) NOT NULL,
  `priTitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_priority`
--

INSERT INTO `t_priority` (`idPriority`, `priTitle`) VALUES
(1, 'Basse'),
(2, 'Moyenne'),
(3, 'Urgente');

-- --------------------------------------------------------

--
-- Structure de la table `t_reply`
--

CREATE TABLE `t_reply` (
  `idReply` int(11) NOT NULL,
  `repContent` varchar(2000) NOT NULL,
  `repCreationDate` datetime NOT NULL,
  `fkTicket` int(11) NOT NULL,
  `fkUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_status`
--

CREATE TABLE `t_status` (
  `idStatus` int(11) NOT NULL,
  `staTitle` varchar(50) NOT NULL,
  `staColorHex` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_status`
--

INSERT INTO `t_status` (`idStatus`, `staTitle`, `staColorHex`) VALUES
(1, 'Nouveau', NULL),
(2, 'Assigné', NULL),
(3, 'En cours', NULL),
(4, 'Résolu', NULL),
(5, 'Clôluré', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_ticket`
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

-- --------------------------------------------------------

--
-- Structure de la table `t_type`
--

CREATE TABLE `t_type` (
  `idType` int(11) NOT NULL,
  `tyTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_type`
--

INSERT INTO `t_type` (`idType`, `tyTitle`) VALUES
(1, 'Bug'),
(2, 'Demande de changement');

-- --------------------------------------------------------

--
-- Structure de la table `t_user`
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
-- Déchargement des données de la table `t_user`
--

INSERT INTO `t_user` (`idUser`, `useSurname`, `useName`, `useEmail`, `useUsername`, `usePassword`, `useAdmin`, `useLevel`) VALUES
(1, 'Admin', 'Carlier', 'admin.dupont@eduvaud.ch', 'admin', '$2y$10$7HKzpJkFzp56lgbuYZnyVu8rYNqopK4y1gA8FJlQZeD1j1a4XfXMm', 1, 1),
(2, 'Serghei', 'Diulgherov', 'eleve.dupont@gmail.com', 'user', '$2y$10$7HKzpJkFzp56lgbuYZnyVu8rYNqopK4y1gA8FJlQZeD1j1a4XfXMm', 0, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `t_attachement`
--
ALTER TABLE `t_attachement`
  ADD PRIMARY KEY (`idAttachement`),
  ADD KEY `fkTicket` (`fkTicket`);

--
-- Index pour la table `t_priority`
--
ALTER TABLE `t_priority`
  ADD PRIMARY KEY (`idPriority`);

--
-- Index pour la table `t_reply`
--
ALTER TABLE `t_reply`
  ADD PRIMARY KEY (`idReply`),
  ADD KEY `fk_ReplyAuthor` (`fkUser`),
  ADD KEY `fk_Ticket` (`fkTicket`);

--
-- Index pour la table `t_status`
--
ALTER TABLE `t_status`
  ADD PRIMARY KEY (`idStatus`);

--
-- Index pour la table `t_ticket`
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
-- Index pour la table `t_type`
--
ALTER TABLE `t_type`
  ADD PRIMARY KEY (`idType`);

--
-- Index pour la table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `t_attachement`
--
ALTER TABLE `t_attachement`
  MODIFY `idAttachement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `t_priority`
--
ALTER TABLE `t_priority`
  MODIFY `idPriority` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `t_reply`
--
ALTER TABLE `t_reply`
  MODIFY `idReply` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `t_status`
--
ALTER TABLE `t_status`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `t_ticket`
--
ALTER TABLE `t_ticket`
  MODIFY `idTicket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `t_type`
--
ALTER TABLE `t_type`
  MODIFY `idType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_attachement`
--
ALTER TABLE `t_attachement`
  ADD CONSTRAINT `t_attachement_ibfk_1` FOREIGN KEY (`fkTicket`) REFERENCES `t_ticket` (`idTicket`);

--
-- Contraintes pour la table `t_reply`
--
ALTER TABLE `t_reply`
  ADD CONSTRAINT `fk_ReplyAuthor` FOREIGN KEY (`fkUser`) REFERENCES `t_user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Ticket` FOREIGN KEY (`fkTicket`) REFERENCES `t_ticket` (`idTicket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `t_ticket`
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
