--Interogari cu grupare și filtrare
--1.Care este media evaluării pentru fiecare produs, bazată pe recenziile primite?

SELECT p.NUME_produs AS Nume_Produs,
   ROUND(AVG(r.RATING_recenzie),2) AS Medie_Rating
FROM Recenzii r
INNER JOIN Produs P ON R.ID_produs = P.ID_produs
GROUP BY p.NUME_produs
HAVING AVG(r.RATING_recenzie) IS NOT NULL;

--2. Care este valoare totală a comezilor plasate de fiecare client?

SELECT c.NUME_client AS Nume_client,
    c.PRENUME_client AS Prenume_Client,
    SUM(com.SUMA_totala) AS Valoare_Totala_Comenzi
FROM Comenzi com
INNER JOIN Clienti c ON com.ID_client = c.ID_client
GROUP BY c.NUME_client, c.PRENUME_client
HAVING SUM(com.SUMA_totala) > 0;


	
--Interogari cu subconsultări în clauza HAVING și/sau FROM
--3. Care este clientul/clientii cu cea mai mare valoare totală a comenzilor?

	SELECT 
    c.ID_client,
    c.Nume_client,
    c.Prenume_client,
    SUM(p.Pret_produs * pc.Cantitate) AS Valoare_Totala_Comenzi
FROM Clienti c
INNER JOIN Comenzi cm ON c.ID_client = cm.ID_client
NATURAL JOIN ProduseComandate pc
INNER JOIN Produs p ON pc.ID_produs = p.ID_produs
GROUP BY c.ID_client
HAVING SUM(p.Pret_produs * pc.Cantitate) = (
        SELECT MAX(Valoare_Totala)
        FROM 
            (SELECT 
                c.ID_client,
                SUM(p.Pret_produs * pc.Cantitate) AS Valoare_Totala
            FROM Clienti c
            INNER JOIN Comenzi cm ON c.ID_client = cm.ID_client
			NATURAL JOIN ProduseComandate pc
			INNER JOIN Produs p ON pc.ID_produs = p.ID_produs
            GROUP BY c.ID_client) AS Total_Comenzi
    );
	
--4. Care sunt categoriile de produse și câte produse unice din fiecare categorie au fost comandate


SELECT c.NUME_categorie AS NUME_CATEGORIE,
    COUNT(DISTINCT pc.ID_produs) AS PRODUS_COMANDAT
FROM (SELECT DISTINCT ID_produs FROM ProduseComandate) AS x
INNER JOIN ProduseComandate pc ON x.ID_produs = pc.ID_produs
INNER JOIN Produs p ON pc.ID_produs = p.ID_produs
INNER JOIN Categorie c ON p.ID_categorie = c.ID_categorie
GROUP BY c.NUME_categorie
HAVING  COUNT(DISTINCT pc.ID_produs) > 0
ORDER BY PRODUS_COMANDAT DESC;


--Interogari cu expresii-tabelă și "tabele-pivot" (cu sau fără joncțiuni externe)
--5.Care este media evaluărilor produselor în fiecare categorie?
WITH RatingProduse AS (
    SELECT 
        p.ID_produs,
        p.NUME_produs,
        p.ID_categorie,
        ROUND(AVG(r.RATING_recenzie), 2) AS Medie_Rating
    FROM Produs p
    LEFT JOIN Recenzii r ON p.ID_produs = r.ID_produs
    GROUP BY p.ID_produs, p.NUME_produs, p.ID_categorie
)
SELECT 
    c.NUME_categorie,
    ROUND(AVG(COALESCE(rp.Medie_Rating, 0)), 2) AS Medie_Rating_Categorie
FROM Categorie c
LEFT JOIN RatingProduse rp ON c.ID_categorie = rp.ID_categorie
GROUP BY c.NUME_categorie
ORDER BY Medie_Rating_Categorie DESC;


--6. Câte comenzi are fiecare client și care este stadiul de procesare a comenzilor?
SELECT 
    c.ID_client,
    c.NUME_client,
    c.PRENUME_client,
    COALESCE(SUM(CASE WHEN SC.DESCRIERE_status_comanda = 'Noua' THEN 1 ELSE 0 END), 0) AS Noua,
    COALESCE(SUM(CASE WHEN SC.DESCRIERE_status_comanda = 'In procesare' THEN 1 ELSE 0 END), 0) AS In_procesare,
    COALESCE(SUM(CASE WHEN SC.DESCRIERE_status_comanda = 'Expediata' THEN 1 ELSE 0 END), 0) AS Expediata,
    COALESCE(SUM(CASE WHEN SC.DESCRIERE_status_comanda = 'Finalizata' THEN 1 ELSE 0 END), 0) AS Finalizata,
	COALESCE(SUM(CASE WHEN SC.DESCRIERE_status_comanda = 'Anulata' THEN 1 ELSE 0 END), 0) AS Anulata
FROM Clienti c
LEFT JOIN Comenzi co ON c.ID_client = co.ID_client
LEFT JOIN ModificareStatus ms ON co.ID_comanda = ms.ID_comanda
LEFT JOIN StatusComenzi sc ON ms.ID_status_comanda = sc.ID_STATUS_comanda
GROUP BY c.ID_client, c.NUME_client, c.PRENUME_client
ORDER BY c.ID_client;
	
	
--Interogări (pseudo) recursive
--7.Care sunt categoriile de produse care apartin categoriei "Barbati"?
WITH RECURSIVE SubcategoriiBarbati AS (
    SELECT 
        ID_categorie, 
        NUME_categorie, 
        ID_categorie_parinte
    FROM Categorie
    WHERE  NUME_categorie = 'Barbati'
    UNION ALL
    SELECT 
        C.ID_categorie, 
        C.NUME_categorie, 
        C.ID_categorie_parinte
    FROM  Categorie C
    INNER JOIN SubcategoriiBarbati SB ON C.ID_categorie_parinte = SB.ID_categorie
)
SELECT 
    ID_categorie, 
    NUME_categorie
FROM SubcategoriiBarbati;


--8.Afisati produsele care fac parte din categoriile care apartin categoriei "Femei"?

WITH RECURSIVE SubcategoriiBarbati AS (
    SELECT 
        ID_categorie, 
        NUME_categorie, 
        ID_categorie_parinte
    FROM  Categorie
    WHERE NUME_categorie = 'Femei'
    UNION ALL
    SELECT 
        C.ID_categorie, 
        C.NUME_categorie, 
        C.ID_categorie_parinte
    FROM Categorie C
    INNER JOIN SubcategoriiBarbati SB ON C.ID_categorie_parinte = SB.ID_categorie
)
SELECT 
    P.ID_produs, 
    P.NUME_produs, 
    C.NUME_categorie AS Nume_categorie
FROM Produs P

INNER JOIN Categorie C ON p.ID_categorie = C.ID_categorie
WHERE C.ID_categorie IN (SELECT ID_categorie FROM SubcategoriiBarbati);
