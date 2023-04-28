SELECT * FROM MARATONA_HOMENS

DELETE FROM MARATONA_HOMENS
WHERE Year = ''
-- Em 1918 a maratona foi realizada em revezamentos de equipes, por causa da Primeira Guerra Mudial.
-- Em 2020 a maratona n�o foi realizada por conta da COVID-19.

UPDATE MARATONA_HOMENS
SET Winner = REPLACE(Winner, 'Édouard Fabre', '�douard Fabre');

UPDATE MARATONA_HOMENS
SET Winner = REPLACE(Winner, 'Gérard Côté', 'G�rard C�t�');

UPDATE MARATONA_HOMENS
SET Winner = REPLACE(Winner, 'Gösta Leandersson', 'Karl Leandersson');

UPDATE MARATONA_HOMENS
SET Winner = REPLACE(Winner, 'Aurèle Vandendriessche', 'Aur�le Vandendriessche');

UPDATE MARATONA_HOMENS
SET Winner = REPLACE(Winner, 'Álvaro Mejía', '�lvaro Mej�a');

SELECT * FROM MARATONA_MULHERES

DELETE FROM MARATONA_MULHERES
WHERE Year = ''

ALTER TABLE MARATONA_HOMENS
	ALTER COLUMN [Year]
		VARCHAR(5) NOT NULL;

ALTER TABLE MARATONA_HOMENS
	ADD CONSTRAINT PK_MARATONA_HOMENS
		PRIMARY KEY CLUSTERED ([Year]);

ALTER TABLE MARATONA_HOMENS
ADD FOREIGN KEY (Year) REFERENCES MARATONA_HOMENS(Year)

ALTER TABLE MARATONA_HOMENS
	ALTER COLUMN [Winner]
		VARCHAR(50) NOT NULL;

ALTER TABLE MARATONA_HOMENS
	ALTER COLUMN [Country]
		VARCHAR(50) NOT NULL;

ALTER TABLE MARATONA_HOMENS
	ALTER COLUMN [Time]
		TIME NOT NULL;

ALTER TABLE MARATONA_HOMENS
	ALTER COLUMN [Distance (Miles)]
		VARCHAR(50) NOT NULL;

ALTER TABLE MARATONA_HOMENS
	ALTER COLUMN [Distance (KM)]
		VARCHAR(50) NOT NULL;


ALTER TABLE MARATONA_MULHERES
	ALTER COLUMN [Year]
		VARCHAR(5) NOT NULL;

ALTER TABLE MARATONA_MULHERES
	ADD CONSTRAINT PK_MARATONA_MULHERES
		PRIMARY KEY CLUSTERED ([Year]);

ALTER TABLE MARATONA_MULHERES
ADD FOREIGN KEY (Year) REFERENCES MARATONA_MULHERES(Year)

ALTER TABLE MARATONA_MULHERES
	ALTER COLUMN [Winner]
		VARCHAR(50) NULL;

ALTER TABLE MARATONA_MULHERES
	ALTER COLUMN [Country]
		VARCHAR(50) NULL;

ALTER TABLE MARATONA_MULHERES
	ALTER COLUMN [Time]
		TIME NULL;

ALTER TABLE MARATONA_MULHERES
	ALTER COLUMN [Distance (Miles)]
		VARCHAR(50) NULL;

ALTER TABLE MARATONA_MULHERES
	ALTER COLUMN [Distance (KM)]
		VARCHAR(50) NULL;

SELECT * FROM MARATONA_HOMENS

SELECT * FROM MARATONA_MULHERES

INSERT INTO MARATONA_MULHERES
([Year], [Winner], [Country], [Time], [Distance (Miles)], [Distance (KM)])
VALUES
('1965', NULL, NULL,NULL, NULL, NULL)

INSERT INTO MARATONA_MULHERES
([Year], [Winner], [Country], [Time], [Distance (Miles)], [Distance (KM)])
VALUES
('1964', NULL, NULL, NULL, NULL, NULL)

SELECT*FROM MARATONA_MULHERES

-- ACIMA, ADD MANUALMENTE OS ANOS EM QUE N�O HOUVE CORRIDA DE MULHERES, ABAIXO USANDO LOOP PARA ADICIONAR

USE BOSTON_MARATONA
GO

DECLARE @MyCounter as INT
SET @MyCounter = 1897  

WHILE @MyCounter < 1966 
 BEGIN
    INSERT INTO [BOSTON_MARATONA].[dbo].[MARATONA_MULHERES]
        ([Year])
    VALUES
        (@MyCounter)  
        set @MyCounter = @MyCounter + 1;  
END

DELETE FROM MARATONA_MULHERES
WHERE Year = '1918'

SELECT*FROM MARATONA_MULHERES
SELECT*FROM MARATONA_HOMENS