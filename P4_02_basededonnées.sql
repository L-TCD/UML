-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 03 juil. 2021 à 15:20
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `appexpressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(45) COLLATE utf8_bin NOT NULL,
  `nom` varchar(45) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `mot_de_passe` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `prenom`, `nom`, `telephone`, `email`, `mot_de_passe`) VALUES
(1, 'Lorraine', 'Keech', '0701020304', 'admin@expressfood.com', 'mdpAdminEF1!');

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `code_postal` varchar(45) COLLATE utf8_bin NOT NULL,
  `ville` varchar(45) COLLATE utf8_bin NOT NULL,
  `numero_rue` varchar(45) COLLATE utf8_bin NOT NULL,
  `nom_rue` varchar(45) COLLATE utf8_bin NOT NULL,
  `latitude` varchar(45) COLLATE utf8_bin NOT NULL,
  `longitude` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `code_postal`, `ville`, `numero_rue`, `nom_rue`, `latitude`, `longitude`) VALUES
(1, '75008', 'Paris', '55', 'Rue du Faubourg Saint-Honoré', '48.869745', '2.307946'),
(2, '75008', 'Paris', '35', 'boulevard de Courcelles', '48.879471', '2.310864');

-- --------------------------------------------------------

--
-- Structure de la table `adresses_favorites`
--

DROP TABLE IF EXISTS `adresses_favorites`;
CREATE TABLE IF NOT EXISTS `adresses_favorites` (
  `id_adresse` int NOT NULL,
  `id_client` int NOT NULL,
  PRIMARY KEY (`id_adresse`,`id_client`),
  KEY `fk_adresse_has_client_client1_idx` (`id_client`),
  KEY `fk_adresse_has_client_adresse1_idx` (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `adresses_favorites`
--

INSERT INTO `adresses_favorites` (`id_adresse`, `id_client`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

DROP TABLE IF EXISTS `carte`;
CREATE TABLE IF NOT EXISTS `carte` (
  `id_carte` int NOT NULL AUTO_INCREMENT,
  `non_modifiable` tinyint(1) DEFAULT NULL,
  `id_produit_1` int NOT NULL,
  `id_produit_2` int NOT NULL,
  `id_produit_3` int NOT NULL,
  `id_produit_4` int NOT NULL,
  `jour` date NOT NULL,
  PRIMARY KEY (`id_carte`),
  KEY `fk_carte_produit1_idx` (`id_produit_1`),
  KEY `fk_carte_produit4_idx` (`id_produit_4`),
  KEY `fk_carte_produit3_idx` (`id_produit_3`),
  KEY `fk_carte_produit2_idx` (`id_produit_2`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `carte`
--

INSERT INTO `carte` (`id_carte`, `non_modifiable`, `id_produit_1`, `id_produit_2`, `id_produit_3`, `id_produit_4`, `jour`) VALUES
(1, 1, 1, 2, 3, 4, '2021-06-30');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`) VALUES
(1, 'plat'),
(2, 'dessert');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(45) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `mot_de_passe` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `prenom_client` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `telephone`, `email`, `mot_de_passe`, `prenom_client`) VALUES
(1, 'Doe', '0744556677', 'client1@gmail.com', NULL, 'John'),
(2, 'Doe', '0123456478', 'client2@gmail.com', 'mdpClient2*', 'Jane');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int NOT NULL AUTO_INCREMENT,
  `refPaiement` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `heure_commande` datetime DEFAULT NULL,
  `quantite_produit_1` int DEFAULT NULL,
  `quantite_produit_2` int DEFAULT NULL,
  `quantite_produit_3` int DEFAULT NULL,
  `quantite_produit_4` int DEFAULT NULL,
  `prix_HT` decimal(10,2) NOT NULL,
  `carte_id_carte` int NOT NULL,
  `livreur_id_livreur` int NOT NULL,
  `client_id_client` int NOT NULL,
  `adresse_id_adresse` int NOT NULL,
  `heure_livraison` datetime DEFAULT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `fk_commande_carte1_idx` (`carte_id_carte`),
  KEY `fk_commande_livreur1_idx` (`livreur_id_livreur`),
  KEY `fk_commande_client1_idx` (`client_id_client`),
  KEY `fk_commande_adresse1_idx` (`adresse_id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `refPaiement`, `heure_commande`, `quantite_produit_1`, `quantite_produit_2`, `quantite_produit_3`, `quantite_produit_4`, `prix_HT`, `carte_id_carte`, `livreur_id_livreur`, `client_id_client`, `adresse_id_adresse`, `heure_livraison`) VALUES
(1, 'pay_5iHMDxy4ABR4YBVW4UscIn', '2021-06-30 19:29:22', 2, 2, 2, 2, '54.00', 1, 1, 1, 1, '2021-06-30 19:44:01');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id_livreur` int NOT NULL AUTO_INCREMENT,
  `latitude` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `longitude` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `stock_produit_1` int DEFAULT NULL,
  `stock_produit_2` int DEFAULT NULL,
  `stock_produit_3` int DEFAULT NULL,
  `stock_produit_4` int DEFAULT NULL,
  `id_carte_stock` int NOT NULL,
  `prenom` varchar(45) COLLATE utf8_bin NOT NULL,
  `nom` varchar(45) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `mot_de_passe` varchar(128) COLLATE utf8_bin NOT NULL,
  `statut_id_statut` int NOT NULL,
  PRIMARY KEY (`id_livreur`),
  KEY `fk_livreur_carte1_idx` (`id_carte_stock`),
  KEY `fk_livreur_statut1_idx` (`statut_id_statut`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id_livreur`, `latitude`, `longitude`, `stock_produit_1`, `stock_produit_2`, `stock_produit_3`, `stock_produit_4`, `id_carte_stock`, `prenom`, `nom`, `telephone`, `email`, `mot_de_passe`, `statut_id_statut`) VALUES
(1, '48.864824', '2.334595', 10, 10, 10, 10, 1, 'Arnaud', 'Démare', '0799887766', 'livreur1@expressfood.com', 'mdpLivreur1?', 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8_bin NOT NULL,
  `image` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin NOT NULL,
  `prix_HT` decimal(10,2) NOT NULL,
  `non_modifiable` tinyint(1) DEFAULT NULL,
  `non_affichable` tinyint(1) DEFAULT NULL,
  `id_categorie` int NOT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `fk_produit_categorie1_idx` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `nom`, `image`, `description`, `prix_HT`, `non_modifiable`, `non_affichable`, `id_categorie`) VALUES
(1, 'plateau maki', 'url-image-1', 'Le makizushi, parfois appelé makimono, souvent simplement appelé maki en Europe, est une spécialité culinaire japonaise se présentant sous la forme d\'un rouleau d\'algue nori séchée entourant du riz blanc mélangé à du vinaigre de riz sucré, et farci par divers aliments, en particulier du poisson cru ou des plantes.', '11.00', 1, NULL, 1),
(2, 'plateau sushi', 'url-image-2', 'Le sushi est un plat traditionnel japonais, composé d\'un riz vinaigré appelé shari combiné avec un autre ingrédient appelé neta qui est habituellement du poisson cru ou des fruits de mer.', '11.00', 1, NULL, 1),
(3, 'daifuku', 'url-image-3', 'Daifuku (qui veut dire \"chance\" en japonais) sont des petits gâteaux ronds de différentes couleurs composés d\'une pâte de haricots rouges sucrée enrobée d\'une couche de riz gluant.', '2.50', 1, NULL, 2),
(4, 'yokan', 'url-image-4', 'Ce dessert de gelée épaisse est fait de pâte de haricots rouges, d\'agar-agar et de sucre. Il est généralement vendu sous forme de bloc avant d\'être coupé en tranches.', '2.50', 1, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `id_statut` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_statut`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id_statut`, `nom`) VALUES
(1, 'libre'),
(2, 'en cours de livraison'),
(3, 'indisponible');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses_favorites`
--
ALTER TABLE `adresses_favorites`
  ADD CONSTRAINT `fk_adresse_has_client_adresse1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`),
  ADD CONSTRAINT `fk_adresse_has_client_client1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `carte`
--
ALTER TABLE `carte`
  ADD CONSTRAINT `fk_carte_produit1` FOREIGN KEY (`id_produit_1`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `fk_carte_produit2` FOREIGN KEY (`id_produit_2`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `fk_carte_produit3` FOREIGN KEY (`id_produit_3`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `fk_carte_produit4` FOREIGN KEY (`id_produit_4`) REFERENCES `produit` (`id_produit`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_adresse1` FOREIGN KEY (`adresse_id_adresse`) REFERENCES `adresse` (`id_adresse`),
  ADD CONSTRAINT `fk_commande_carte1` FOREIGN KEY (`carte_id_carte`) REFERENCES `carte` (`id_carte`),
  ADD CONSTRAINT `fk_commande_client1` FOREIGN KEY (`client_id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `fk_commande_livreur1` FOREIGN KEY (`livreur_id_livreur`) REFERENCES `livreur` (`id_livreur`);

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_carte1` FOREIGN KEY (`id_carte_stock`) REFERENCES `carte` (`id_carte`),
  ADD CONSTRAINT `fk_livreur_statut1` FOREIGN KEY (`statut_id_statut`) REFERENCES `statut` (`id_statut`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_categorie1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
