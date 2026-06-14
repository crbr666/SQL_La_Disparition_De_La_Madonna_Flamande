-- ============================================================
-- Mystere SQL : La Disparition de la Madone Flamande
-- Schema de la base de donnees
-- ============================================================

CREATE DATABASE MystereMusee;
GO

USE MystereMusee;
GO

CREATE TABLE lieu (
    id      INT PRIMARY KEY,
    nom     NVARCHAR(100) NOT NULL,
    adresse NVARCHAR(200),
    type    NVARCHAR(50)
);

CREATE TABLE personne (
    id          INT PRIMARY KEY,
    nom         NVARCHAR(50)  NOT NULL,
    prenom      NVARCHAR(50)  NOT NULL,
    age         INT,
    profession  NVARCHAR(100),
    telephone   NVARCHAR(20),
    est_victime BIT NOT NULL DEFAULT 0,
    est_suspect BIT NOT NULL DEFAULT 0
);

CREATE TABLE rapport_crime (
    id          INT PRIMARY KEY,
    lieu_id     INT NOT NULL REFERENCES lieu(id),
    date_heure  DATETIME NOT NULL,
    description NVARCHAR(500),
    type        NVARCHAR(50)
);

CREATE TABLE temoignage (
    id                INT PRIMARY KEY,
    temoin_id         INT NOT NULL REFERENCES personne(id),
    rapport_id        INT NOT NULL REFERENCES rapport_crime(id),
    declaration       NVARCHAR(500),
    heure_declaration DATETIME
);

CREATE TABLE acces_badge (
    id          INT PRIMARY KEY,
    personne_id INT NOT NULL REFERENCES personne(id),
    lieu_id     INT NOT NULL REFERENCES lieu(id),
    date_heure  DATETIME NOT NULL,
    type_acces  NVARCHAR(10) CHECK (type_acces IN ('ENTREE', 'SORTIE'))
);

CREATE TABLE appel (
    id             INT PRIMARY KEY,
    appelant_id    INT NOT NULL REFERENCES personne(id),
    receveur_id    INT NOT NULL REFERENCES personne(id),
    date_heure     DATETIME NOT NULL,
    duree_secondes INT
);

CREATE TABLE vehicule (
    id              INT PRIMARY KEY,
    proprietaire_id INT NOT NULL REFERENCES personne(id),
    immatriculation NVARCHAR(20),
    marque          NVARCHAR(50),
    couleur         NVARCHAR(30)
);

CREATE TABLE parking (
    id                INT PRIMARY KEY,
    vehicule_id       INT NOT NULL REFERENCES vehicule(id),
    lieu_id           INT NOT NULL REFERENCES lieu(id),
    date_heure_entree DATETIME NOT NULL,
    date_heure_sortie DATETIME
);
