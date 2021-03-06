CREATE DATABASE IF NOT EXISTS `CATEGORIES` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `CATEGORIES`;

CREATE TABLE `ADRESSE` (
  `id` VARCHAR(42),
  `numero` VARCHAR(42),
  `voie` VARCHAR(42),
  `cp` VARCHAR(42),
  `ville` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CATEGORIE` (
  `id` VARCHAR(42),
  `nom` VARCHAR(42),
  `description` VARCHAR(42),
  `id_1` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `COMMANDE` (
  `id` VARCHAR(42),
  `datecommande` VARCHAR(42),
  `total` VARCHAR(42),
  `id_1` VARCHAR(42),
  `id_2` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PRODUIT` (
  `id` VARCHAR(42),
  `nom` VARCHAR(42),
  `photo` VARCHAR(42),
  `description` VARCHAR(42),
  `prix` VARCHAR(42),
  `id_1` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `USER` (
  `id` VARCHAR(42),
  `prenom` VARCHAR(42),
  `email` VARCHAR(42),
  `mdp` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `LIGNECOMMANDE` (
  `id` VARCHAR(42),
  `qte` VARCHAR(42),
  `prixunitaire` VARCHAR(42),
  `id_1` VARCHAR(42),
  `id_2` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `CATEGORIE` ADD FOREIGN KEY (`id_1`) REFERENCES `CATEGORIE` (`id`);
ALTER TABLE `COMMANDE` ADD FOREIGN KEY (`id_2`) REFERENCES `USER` (`id`);
ALTER TABLE `COMMANDE` ADD FOREIGN KEY (`id_1`) REFERENCES `ADRESSE` (`id`);
ALTER TABLE `PRODUIT` ADD FOREIGN KEY (`id_1`) REFERENCES `CATEGORIE` (`id`);
ALTER TABLE `LIGNECOMMANDE` ADD FOREIGN KEY (`id_2`) REFERENCES `PRODUIT` (`id`);
ALTER TABLE `LIGNECOMMANDE` ADD FOREIGN KEY (`id_1`) REFERENCES `COMMANDE` (`id`);