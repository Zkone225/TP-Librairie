-- TP d'équipe (Mirna)

-- creation base de données
CREATE DATABASE if not EXISTS librairie 

-- creation tables
-- tables sans foreign key

-- creation table auteur
CREATE TABLE auteur(
	id_auteur AUTO_INCREMENT	int(5)   PRIMARY KEY,
	nom_auteur			varchar(30) not null,
	prenom_auteur       varchar(30) not null,
    pays_auteur         varchar(20) not null,
    ville_auteur		varchar(30) not null
)ENGINE = INNODB DEFAULT CHARSET = latin;

-- creation des commandes INSERT auteur
insert into auteur (nom_auteur, prenom_auteur, pays_auteur, ville_auteur) values 
('Steinbeck','John','Etats-Unis','New York'),
('Moravia','Alberto','Italie','Rome'),
('Dumas','Alexandre','France','Paris'),
('Dadié','Bernard',"Cote d'Ivoire",'Abidjan');

-- creation table editeur
CREATE TABLE editeur(
	id_editeur AUTO_INCREMENT	int(5)  , PRIMARY KEY,
	nom_editeur			varchar(30) not null,
    pays_editeur         varchar(30) not null,
    
)ENGINE = INNODB DEFAULT CHARSET = latin;

-- creation des commandes INSERT editeur
insert into editeur (nom_editeur, pays_editeur) values 
('Albin Michel','France'),
('Feltrinelli','Italie'),
('Folio','France'),
('NEI-CEDA',"Cote d'Ivoire");


-- creation table theme
CREATE TABLE theme(
	id_theme  AUTO_INCREMENT	int(5)  , PRIMARY KEY,
	libelle_theme			varchar(30) not null,
    )ENGINE = INNODB DEFAULT CHARSET = latin;

    -- creation des commandes INSERT theme
 insert into theme(libelle_theme) values 
('la revolution francaise'),
('la première guerre mondiale'),
('la traite negrière'),
('amour'),
('le mont everest'),
('Football');

-- creation table rayon
CREATE TABLE rayon(
	id_ra  AUTO_INCREMENT	int(5)  , PRIMARY KEY,
	libelle_ra			varchar(30) not null,
    )ENGINE = INNODB DEFAULT CHARSET = latin;

insert into rayon(libelle_rayon) values 
('Histoire'),
('Geographie'),
('Science'),
('Aventure'),
('Romantique'),
('Science Fiction'),
('Santé'),
('Sport');

-- creation table utilisateur
CREATE TABLE utilisateur(
	id_Ut  AUTO_INCREMENT	int(5)  , PRIMARY KEY,
    Nom_utilisateur VARCHAR(30) not null,
    Prenom_Ut  VARCHAR(30) not null,
    email_Ut   VARCHAR(45) not null,
    adresse_Ut       varchar(60)
    Cp_Ut INT(5),
    Ville_Ut   VARCHAR ()
    mdp_Ut		varchar(30) ,
    Type_Ut  varchar(10) not null
)ENGINE = INNODB DEFAULT CHARSET = latin;

-- tables avec foreign key

-- creation table editeur
CREATE TABLE editer(
	contrat_edition 	varchar(15) NOT NULL ,
	FOREIGN KEY id_editeur (id_editeur) REFERENCES editeur(id_editeur);
    FOREIGN KEY id_auteur (id_auteur) REFERENCES auteur(id_auteur);
)ENGINE = INNODB DEFAULT CHARSET = latin;

-- creation table livre
CREATE TABLE livre(
    id_li AUTO_INCREMENT int(5) PRIMARY KEY,
    Titre_li VARCHAR(30) NOT NULL,
    Ss_titre_li VARCHAR(30) ,
    Date_pub_li int(10) NOT NULL,
    Resume_li text(200) NOT NULL,
    Num_isbn INT(5) NOT NULL,
    Prix_li INT(5), NOT NULL,
	FOREIGN KEY id_ra (id_ra) REFERENCES rayon(id_ra);
)ENGINE = INNODB DEFAULT CHARSET = latin;

CREATE TABLE commentaire(
	id_com 	AUTO_INCREMENT  int (5) NOT NULL primary key,
    libelle_com text (150) ,
    note_com int (2),
	FOREIGN KEY id_livre (id_livre) REFERENCES livre(id_livre);
    FOREIGN KEY id_ut (id_ut) REFERENCES utilisateur(id_ut);
)ENGINE = INNODB DEFAULT CHARSET = latin;

create table editeur (
    id_editeur int (5) auto_increament not NULL primary key
    nom_editeur VARCHAR (30),
    pays_editeur VARCHAR (30),
)ENGINE = INNODB DEFAULT CHARSET = latin;

create table ecrire (
    FOREIGN KEY id_auteur(id_auteur) REFERENCES auteur(id_auteur),
    FOREIGN KEY id_livrer(id_livre) REFERENCES livre(id_livre)

)ENGINE = INNODB DEFAULT CHARSET = latin;

create table publier (
    FOREIGN KEY id_editeur(id_editeur) REFERENCES editeur(id_editeur)
    FOREIGN KEY id_livrer(id_livre) REFERENCES livre(id_livre)
)ENGINE = INNODB DEFAULT CHARSET = latin;

create table vente (
    id_vente int(5) not NULL primary KEY,
    num_vente int(10) not NULL,
    date_vente int(10) NOT null,
    qte_vente int(2) not null,
    montant_vente int(10) not null,
    mode_de_paiement VARCHAR (20)

)ENGINE = INNODB DEFAULT CHARSET = latin;

create table ranger (
   FOREIGN KEY id_theme(id_theme) REFERENCES theme(id_theme);
    FOREIGN KEY id_ra (id_ra) REFERENCES rayon(id_ra);
)ENGINE = INNODB DEFAULT CHARSET = latin;


-- creation des commandes INSERT