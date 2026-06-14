-- ============================================================
-- Mystere SQL : Chargement des donnees
-- A executer apres schema.sql
-- Les fichiers CSV doivent etre montes dans /mystery/data/
-- ============================================================

USE MystereMusee;
GO

BULK INSERT lieu
FROM '/mystery/data/lieu.csv'
WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n');

BULK INSERT personne
FROM '/mystery/data/personne.csv'
WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n');

BULK INSERT rapport_crime
FROM '/mystery/data/rapport_crime.csv'
WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n');

BULK INSERT temoignage
FROM '/mystery/data/temoignage.csv'
WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n');

BULK INSERT acces_badge
FROM '/mystery/data/acces_badge.csv'
WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n');

BULK INSERT appel
FROM '/mystery/data/appel.csv'
WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n');

BULK INSERT vehicule
FROM '/mystery/data/vehicule.csv'
WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n');

BULK INSERT parking
FROM '/mystery/data/parking.csv'
WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n');
