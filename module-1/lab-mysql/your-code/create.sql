USE lab_my_sql;

CREATE TABLE clients (
proprietaire    VARCHAR(20),
DateModif       DATE,
IDclient        INT,
MainAdressCity  VARCHAR(50)
);

CREATE TABLE produits (
IDproduit   INT,
LibProduit  VARCHAR (50),
Prix        DECIMAL(3,2),
IDSousCat   INT);

CREATE TABLE categories (
IDSousCat   INT,
LibSousCat  VARCHAR (50),
IDCat       INT,
LibCat      VARCHAR (50)
);

create table achat (
IDachat   CHAR (10),
IDclient  INT,
IDproduit INT,
Qteprod   INT
);