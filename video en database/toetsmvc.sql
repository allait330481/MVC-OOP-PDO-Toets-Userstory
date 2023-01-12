-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 12 jan 2023 om 17:32
-- Serverversie: 5.7.31
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toetsmvc`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Auto`
--

DROP TABLE IF EXISTS `Auto`;
CREATE TABLE IF NOT EXISTS `Auto` (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `instructeurId` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_auto` (`instructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Auto`
--

INSERT INTO `Auto` (`Id`, `Kenteken`, `Type`, `instructeurId`) VALUES
(1, 'AU-67-IO', 'Golf', 3),
(2, 'TH-78-KL', 'Ferrari', 2),
(3, '90-KL-TR', 'Fiat 500', 4),
(4, 'YY-OP-79', 'Mercedes', 5),
(5, 'ST-FZ-28', 'Citroen', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Instructeur`
--

DROP TABLE IF EXISTS `Instructeur`;
CREATE TABLE IF NOT EXISTS `Instructeur` (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Instructeur`
--

INSERT INTO `Instructeur` (`Id`, `Naam`, `Email`) VALUES
(1, 'Groen', 'groen@gmail.com'),
(2, 'Manhoi', 'Manhoi@gmail.com'),
(3, 'Zoyi', 'Zoyi@gmail.com'),
(4, 'BertHold', 'BertHold@gmail.com'),
(5, 'Denkekamp', 'Denkekamp@gmail.com');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Mankement`
--

DROP TABLE IF EXISTS `Mankement`;
CREATE TABLE IF NOT EXISTS `Mankement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AutoId` int(11) UNSIGNED NOT NULL,
  `Datum` date NOT NULL,
  `Mankement` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_auto_Man` (`AutoId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Mankement`
--

INSERT INTO `Mankement` (`Id`, `AutoId`, `Datum`, `Mankement`) VALUES
(1, 4, '2023-01-04', 'Profile rechtband minder 2mm'),
(2, 2, '2023-01-04', 'Rechter achterlicht kapot'),
(3, 1, '2023-01-04', 'Spiegel links afgebroken'),
(4, 2, '2023-01-04', 'Bumber rechtachter ingedeukt'),
(5, 2, '2023-01-04', 'Radio kapot');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `Auto`
--
ALTER TABLE `Auto`
  ADD CONSTRAINT `FK_auto` FOREIGN KEY (`instructeurId`) REFERENCES `Instructeur` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `Mankement`
--
ALTER TABLE `Mankement`
  ADD CONSTRAINT `FK_auto_Man` FOREIGN KEY (`AutoId`) REFERENCES `Auto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
