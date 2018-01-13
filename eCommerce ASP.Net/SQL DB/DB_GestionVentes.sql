CREATE DATABASE GestionVentes

USE GestionVentes

CREATE TABLE Client(
	NumClient	INT IDENTITY(1,1),
	Nom			NVARCHAR(40),
	Prenom		NVARCHAR(40),
	Adresse		NVARCHAR(70),
	Ville		NVARCHAR(30), 
	Tel			INT, 
	Login		NVARCHAR(20) UNIQUE, 
	Pass		NVARCHAR(30),
	CONSTRAINT PK_Client PRIMARY KEY(NumClient)); 
	
CREATE TABLE Article(
	NumArticle	INT IDENTITY(1,1), 
	Designation NVARCHAR(MAX), 
	URLImage	NVARCHAR(MAX),
	Pu			FLOAT,
	CONSTRAINT PK_Article PRIMARY KEY(NumArticle));
	
CREATE TABLE Commande(
	NumCmd		INT IDENTITY(1,1), 
	dateCmd		DATETIME DEFAULT GETDATE(), 
	NumClient	INT, 
	NumArticle	INT, 
	QteArticle	INT,
	CONSTRAINT PK_Commande PRIMARY KEY(NumCmd),
	CONSTRAINT FK_Commande_Client FOREIGN KEY (NumClient) REFERENCES Client(NumClient) ON DELETE CASCADE,
	CONSTRAINT FK_Commande_Article FOREIGN KEY (NumArticle) REFERENCES Article(NumArticle) ON DELETE CASCADE); 

CREATE TABLE ListeVille(
	NomVille	NVARCHAR(60),
	CONSTRAINT PK_Ville PRIMARY KEY(NomVille));
	

-----------------------------------------------------------------------------------------------

	INSERT INTO ListeVille VALUES('Marrakech'),('Casablanca'),('Rabat'),('Agadir'),('Fès'),('Tanger'),('El Jadida'),
	('Salé'),('Meknès'),('Témara'),('Oujda'),('Tétouan'),('Kénitra'),('Beni Mellal'),('Mohammédia'),('Laâyoune'),('Khémisset');


	INSERT INTO Article VALUES('Samsung Galaxy S8','ImagesData/_05062017_200212.jpg',8799);
