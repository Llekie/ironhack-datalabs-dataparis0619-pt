USE lab_my_sql;
DROP TABLE 'tables prix et calendrier - copie';
TRUNCATE TABLE categories;
INSERT INTO categories (IDCat, LibCat, IDSousCat, LibSousCat) VALUES (1,"FEMME",11,"SHAMPOINGS FEMMES"),
(1,"FEMME",12,"PARFUMS FEMMES"),
(1,"FEMME",13,"CREME SOLAIRE FEMMES"),
(2,"HOMME",21,"SHAMPOINGS HOMMES"),
(2,"HOMME",22,"PARFUMS HOMMES"),
(2,"HOMME",23,"CREME SOLAIRE HOMMES"),
(3,"ENFANT",31,"SHAMPOINGS ENFANTS"),
(3,"ENFANT",32,"PARFUMS ENFANTS"),
(3,"ENFANT",33,"CREME SOLAIRE ENFANTS");

CREATE TABLE `lab_my_sql`.`prix_litteraire` (
	`EAN` bigint,
    `Titre` text,
    `Auteur` text,
    `Collection` text,
    `Nom prix` text,
    `Annee prix` int,
    `date prix` text,
    `Semaine GfK prix` int,
    `Double prix` text
    )
LOAD DATA LOCAL INFILE 'C:\Users\lleki\Documents\Exercices-Ironhack\ironhack-datalabs-dataparis0619-pt\module-1\lab-mysql\your-code\Source.csv'
  INTO TABLE clients
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\r\n';