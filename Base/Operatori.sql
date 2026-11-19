-- Gli Operatori di Aritmetici
-- +, -, *, /, %
SELECT
    10 + 20 Adizione,
    10 - 20 Sottrazione,
    10 * 20 Moltiplicazione,
    10 / 20 Divisione,
    10 % 20 Modulo;


-- Gli Operatori di Confronto
-- = uguale, <> oppure != doverso da, > maggiore di, < minore di, >= maggiore uguale, <= minore o uguale
-- (Diverso != oppure <>) > maggiore di, < minore di

SELECT
    *
FROM Voti
WHERE Voto >= 6;

-- ORDER BY: Permette di ordinare le colonne
SELECT
    *
FROM Voti
WHERE Voto >= 6
ORDER BY Voto ASC;

-- Gli Operatori Logici
-- AND, OR, NOT
SELECT *
FROM Pagamenti
WHERE Importo >= 200 and Importo <= 300


SELECT *
FROM Pagamenti
WHERE Importo >= 200 OR Importo <= 300


SELECT *
FROM Classi
WHERE Descrizione IS NOT NULL
   AND NOT Descrizione = 'Classe formativa numero 22'

-- GLi operatori di assegnazione
-- =, +=, -=, *=, /=, %=
SELECT *
FROM Studenti



-- Gli operatori Speciali in SQl
-- IS NULL, IS NOT NULL, BETWEEN, IN(), LIKE, EXISTS

SELECT 
    *
FROM Voti 
WHERE Voto >=6
ORDER BY Voto DESC;

SELECT 
    *
FROM Voti 
WHERE Voto >=6
ORDER BY Voto ASC;


-- Gli Operatori Logici
-- AND (tutte VERE), OR (almeno 1 VERO), NOT (tutte)

SELECT 
    *
FROM Pagamenti 
WHERE Importo >= 200 AND Importo <=300;

SELECT 
    *
FROM Pagamenti 
WHERE Importo >= 200 OR Importo <=300;

SELECT 
    *
FROM Classi 
WHERE Descrizione IS NOT NULL 
    OR NOT Descrizione ='Classe formativa numero 22'; /*fa vedere tutto esclusa questa*/

SELECT 
    *
FROM Classi 
WHERE Descrizione IS NOT NULL 
    OR NOT Descrizione ='Classe formativa numero 22';


-- GLi operatori di assegonazione
-- = uguale a, +=, -=, *=, /=, %=  

--SOMMA DELL'IMPORTO1 E IMPORTO2
DECLARE @Importo1 DECIMAL(10,2);
DECLARE @Importo2 DECIMAL(10,2);

DECLARE @SOMMA DECIMAL(10,2);

-- somma dell'importo 1 e importo 2
SET @Importo1 = 100.00;
SET @Importo2 = 200.00;

SET @SOMMA = @Importo1 + @Importo2;

PRINT 'La somma dei due importi è: ' + CAST(@SOMMA AS NVARCHAR(10));



-- Gli operatori Speciali in SQl
-- IS NULL, IS NOT NULL, BETWEEN, IN(), LIKE, EXISTS

SELECT 
    *
FROM Pagamenti 
WHERE Importo  BETWEEN 200 AND 300

SELECT 
    *
FROM Classi
WHERE Descrizione IS NOT NULL
    AND Descrizione <> 'Classe formativa numero 16'
    AND dESCRIZIONE != 'Classe formativa numero 10';

-- cercare i pagamenti effettuati in un periodo (2026 e 2026-12-31)

SELECT 
    *
FROM Pagamenti
WHERE DataPagamento BETWEEN '2026-01-01' AND '2026-12-31'
    AND MetodoPagamento = 'Carta'
    AND Stato = 'In attesa'

SELECT 
    *
FROM Pagamenti
WHERE DataPagamento BETWEEN '2026-01-01' AND '2026-12-31'
    AND MetodoPagamento = 'Carta'
    AND Stato = 'In attesa';

/*
IN () 
        permette di verificare 
        se un valore appartiene ad un elenco di valori specificati
    Serve ad evitare molte condizioni OR
*/
--  Esempio IN()

SELECT *
    FROM Docenti
    WHERE DocenteId = 1 OR DocenteId = 5 OR DocenteId = 15 OR DocenteId = 17;

SELECT *
    FROM Docenti
    WHERE DocenteId IN (1, 5, 15, 17);

-- restituisce la lista dei voti escludendo i voti con gli ID 14,5,16
SELECT *
    FROM Voti
    WHERE VotoId NOT IN ( 14,5,16);

-- restituisce i 5 classi (in base a Id)
SELECT *
    FROM Classi
    WHERE ClasseId IN ( 1,5,10,6,3);

/*
    LIKE
    permette di cercare un determinato testo all'interno di una colonna (es suggerimenti ricerca in base alla lettera digitata - es. Amazon)
    E' utile quando non si conosce il valore completo che si cerca
    'a%'    : restituisce tutti i valori che cominciano con la lettera a
    '%i'    : restituisce tutti i valori che finiscono con la lettera i
    '%i%'   : che contiene all'interno la lettera i
*/
-- Esempio 1
SELECT *
    FROM Studenti 
    WHERE Nome LIKE 'M%';

-- Esempio 2
SELECT *
    FROM Studenti 
    WHERE Nome LIKE 'M%' AND Cognome LIKE '%i';

-- Esempio 2
SELECT *
    FROM Studenti 
    WHERE Nome LIKE '%M%' ;

/*
    EXISTS
    Verifica se esiste di un record - utile se esiste una relazione tra due tabelle

*/
-- esempio 1 studenti che hanno almeno 1 iscrizione
SELECT *
    FROM Studenti 
    WHERE Exists (
    select 1 from Iscrizioni
    where Studenti.SudenteId = Iscrizioni.StudenteId
    )