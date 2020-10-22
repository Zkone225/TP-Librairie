-- TP d'équipe (Mirna)

-- creation base de données
CREATE DATABASE if not EXISTS librairie 

-- creation tables
-- tables sans foreign key
CREATE TABLE auteur(
	id_auteur AUTO_INCREMENT	int(5)   PRIMARY KEY,
	nom_auteur			varchar(30) not null,
	prenom_auteur       varchar(30) not null,
    pays_auteur         varchar(20) not null,
    ville_auteur		varchar(30) not null
);

CREATE TABLE editeur(
	id_editeur AUTO_INCREMENT	int(5)  , PRIMARY KEY,
	nom_editeur			varchar(30) not null,
    pays_editeur         varchar(30) not null,
    
);

CREATE TABLE theme(
	id_theme  AUTO_INCREMENT	int(5)  , PRIMARY KEY,
	libelle_theme			varchar(30) not null,
    
);

CREATE TABLE rayon(
	id_ra  AUTO_INCREMENT	int(5)  , PRIMARY KEY,
	libelle_ra			varchar(30) not null,
    
);

CREATE TABLE utilisateur(
	id_Ut  AUTO_INCREMENT	int(5)  , PRIMARY KEY,
    Nom_utilisateur VARCHAR(30) not null,
    Prenom_Ut  VARCHAR(30) not null,
    email_Ut   VARCHAR(45) not null,
    adresse_Ut       varchar(60)
    Cp_Ut INT(5),
    Ville_Ut   VARCHAR ()
    mdp_Ut		varchar(30) not null,
    Type_Ut  varchar(10) not null
);

-- tables avec foreign key

CREATE TABLE editer(
	contrat_edition 	varchar(15) NOT NULL ,
	FOREIGN KEY id_editeur (id_editeur) REFERENCES editeur(id_editeur);
    FOREIGN KEY id_auteur (id_auteur) REFERENCES auteur(id_auteur);
);

CREATE TABLE livre(
    id_li AUTO_INCREMENT int(5) PRIMARY KEY,
    Titre_li VARCHAR(30) NOT NULL,
    Ss_titre_li VARCHAR(30) ,
    Date_pub_li int(10) NOT NULL,
    Resume_li text(200) NOT NULL,
    Num_isbn INT(5) NOT NULL,
    Prix_li INT(5), NOT NULL,
	FOREIGN KEY id_ra (id_ra) REFERENCES rayon(id_ra);

);

CREATE TABLE commentaire(
	id_com 	AUTO_INCREMENT (15) NOT NULL ,
	FOREIGN KEY id_editeur (id_editeur) REFERENCES editeur(id_editeur);
    FOREIGN KEY id_auteur (id_auteur) REFERENCES auteur(id_auteur);
);
