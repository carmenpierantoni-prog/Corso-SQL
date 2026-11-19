/*
	Lezione 1 – Il comando SELECT
	
	1. Cos'è SELECT?
	SELECT è il comando SQL utilizzato per interrogare una 
	o più tabelle e recuperare i dati che ci interessano.
	
	2. A cosa serve?
	Permette di:
		- visualizzare tutte le colonne di una tabella;
		- selezionare soltanto alcune colonne;
		- creare colonne calcolate;
		- assegnare nomi personalizzati alle colonne del risultato;
		- individuare valori distinti.
	
	3. Perché è importante per un Data Analyst?
	Un Data Analyst raramente ha bisogno di visualizzare un'intera tabella.
	Generalmente deve estrarre soltanto le informazioni utili per rispondere
	a una domanda aziendale.

	Per esempio:
		- Quanti studenti sono iscritti?
		- Quali corsi sono disponibili?
		- Quali studenti hanno un indirizzo email?
		- Quali sono i voti degli studenti?
		- Quanto costa ciascun corso?

	SELECT è quindi uno dei comandi fondamentali per costruire report e analisi.

	4. Sintassi di base
	SELECT Colonna1, Colonna2, Colonna3
	FROM NomeTabella;


	- SELECT: indica quali colonne vogliamo visualizzare.
	- FROM: indica da quale tabella recuperare i dati.
	- ;   : termina l'istruzione SQL.



	Obiettivi del modulo
		- Estrarre dati da una o più tabelle.
		- Selezionare soltanto le colonne necessarie.
		- Filtrare i dati in base a condizioni.
		- Ordinare e limitare i risultati.
		- Individuare valori mancanti e duplicati.
		- Preparare dataset per report e dashboard.
*/
USE ScuolaDb;


-- Esempio 1: Estrarre dati da una o più tabelle.
SELECT * FROM AnniScolastici;


-- Esempio 2: Selezionare soltanto le colonne necessarie della tabella Studenti.
-- Nome, Cognome, Email, CodiceFiscale (Alt > frsu frgiu per spostare le voci in su o giù)
SELECT 
	Nome,
	Cognome,
	Email,
	CodiceFiscale,
	Sesso
FROM Studenti;


-- Esempio 3: Filtrare i dati in base alle condizioni usando la (WHERE).
-- WHERE: filtra i dati a seconda delle condizioni

SELECT * 
FROM Aule;

SELECT * 
FROM Aule
WHERE AulaId = 6;

-- Esempio 3.1 con la tabella studenti Restituire il nome completo dello studente con il codice fiscale 
-- concatenazione: permette di unire più stringhe usando il "+"

SELECT
	*
FROM Studenti;


SELECT
	Nome,
	Cognome,
	CodiceFiscale
	
FROM Studenti;
	
-- Aliass (AS): permette di definire un nome ad una colonna:  Nome + ' ' + Cognome AS NomeCompleto,

SELECT
	Nome + ' ' + Cognome,
	CodiceFiscale	
FROM Studenti;

SELECT
	Nome + '  -  ' + Cognome AS NomeCompleto,
	CodiceFiscale	
FROM Studenti;

--esempio 2 con intestazione colonna cn spazio

SELECT
	Nome + '  -  ' + Cognome AS 'Nome Completo',
	CodiceFiscale	
FROM Studenti;

-- Esempio 3 formattazione e uso parentesi quadre invece degli apostrofi

SELECT
	Nome + '  -  ' + Cognome AS [Nome Completo],
	CodiceFiscale AS [Codice Fiscale]
FROM Studenti;


--Modifica della colonna Capacita
ALTER TABLE Aule
	ALTER COLUMN Capacita INT NULL
--Modifica della colonna Capacita
ALTER TABLE Aule
	ALTER COLUMN TipoAula NVARCHAR(50) NULL

-- IS NULL e IS NOT NULL  -- SELECT * FROM Docenti, DocentiCorsi; --
-- Inserimento dei dati con valori null

INSERT INTO Aule
	(NomeAula, TipoAula, Capacita, Piano, Attiva)
VALUES
	('Aula 31', 'Cyber Security', 100, null, 0)
	
SELECT * FROM Aule;

-- Inserimento dei dati con valori null
INSERT INTO Aule
	(NomeAula, TipoAula, Capacita, Piano, Attiva)
VALUES
	('Aula 32', NULL, NULL, null, 0)


-- IS NULL e IS NOT NULL 
SELECT * 
FROM Aule 
WHERE Piano IS NULL;

SELECT * FROM Aule;
-- iNSERIMENTO DELLA CLASSE CON VALORI NULL
SELECT * FROM Classi;

INSERT INTO Classi
	(NomeClasse, AnnoScolasticoId, TutorDocenteID)
VALUES
	('2I - Sezione 35', '12', '30' )

SELECT * FROM Classi
	WHERE NomeClasse ='2I - Sezione 35';

-- operatore TOP
-- Limitare il risultato della SELECG alle prime 5 righe 

SELECT top 5 *
FROM Studenti;

SELECT TOP 5 *
FROM Studenti
WHERE Sesso = 'F';

SELECT TOP 3 *
FROM Studenti
WHERE Sesso = 'M';

---- operatori
SELECT
    10 + 20 Adizione,
    10 - 20 Sottrazione,
    10 * 20 Moltiplicazione,
    10 / 20 Divisione,
    10 % 20 Modulo;


SELECT 
    *
FROM Voti 
WHERE vOTO >=6;
