TRUNCATE TABLE recenzii cascade;
TRUNCATE TABLE produsecomandate cascade;
TRUNCATE TABLE Comenzi cascade;
TRUNCATE TABLE Adrese cascade;
TRUNCATE TABLE CodPostal cascade;
TRUNCATE TABLE Tari cascade;
TRUNCATE TABLE Orase cascade;
TRUNCATE TABLE Judete cascade;
TRUNCATE TABLE StatusComenzi cascade;
TRUNCATE TABLE ProduseinCos cascade;
TRUNCATE TABLE Cos cascade;
TRUNCATE TABLE Clienti cascade;
TRUNCATE TABLE Categorie cascade;
TRUNCATE TABLE Reduceri cascade;
TRUNCATE TABLE ImagineProdus cascade;
TRUNCATE TABLE RataTaxa cascade;
TRUNCATE TABLE Produs cascade;
TRUNCATE TABLE TipTaxe cascade;
TRUNCATE TABLE Producator cascade;
TRUNCATE TABLE StatusCos cascade;
TRUNCATE TABLE ModificareStatusCos cascade;




INSERT INTO TipTaxe (ID_taxa, NUME_taxa, DESCRIERE_taxa) VALUES
(1, 'Taxa pe valoarea adăugată', 'Taxa percepută pe valoarea adăugată a unui produs sau serviciu.'),
(2, 'Impozit pe venit', 'Impozit aplicat pe veniturile obținute de persoane fizice și juridice.'),
(3, 'Taxa pe proprietate', 'Taxa anuală aplicată pe proprietățile imobiliare deținute.'),
(4, 'Taxa de mediu', 'Taxa aplicată pentru protecția mediului și reducerea poluării.'),
(5, 'Taxa de drum', 'Taxa percepută pentru utilizarea drumurilor publice.'),
(6, 'Impozit pe profit', 'Impozit aplicat pe profitul obținut de companii.'),
(7, 'Taxa pe tranzacții financiare', 'Taxa aplicată pe tranzacțiile financiare, cum ar fi cumpărarea și vânzarea de acțiuni.'),
(8, 'Taxa de timbru', 'Taxa percepută pentru eliberarea unor documente oficiale.'),
(9, 'Taxa de concesiune', 'Taxa pentru utilizarea resurselor naturale concesionate.'),
(10, 'Taxa pe poluare', 'Taxa aplicată companiilor care emit poluanți în mediu.'),
(11, 'Taxa pe lux', 'Taxa aplicată pe produse și servicii considerate de lux.'),
(12, 'Taxa de parcare', 'Taxa percepută pentru utilizarea locurilor de parcare publice.'),
(13, 'Taxa de salubritate', 'Taxa aplicată pentru serviciile de salubritate și gestionarea deșeurilor.'),
(14, 'Taxa de publicitate', 'Taxa aplicată pentru publicitatea realizată în spații publice.'),
(15, 'Taxa de licență', 'Taxa percepută pentru obținerea unei licențe de funcționare în diverse domenii.');


INSERT INTO Producator (ID_producator, NUME_producator, CUI_producator) VALUES
(1, 'LOreal', 12345678),
(2, 'Maybelline', 23678901),
(3, 'Revlon', 34569012),
(4, 'Estee Lauder', 67890123),
(5, 'Clinique', 56901234),
(6, 'MAC Cosmetics', 89012345),
(7, 'Lancome', 78903456),
(8, 'Dior', 89012567),
(9, 'Chanel', 92345678),
(10, 'Sephora', 13456789),
(11, 'Urban Decay', 34567890),
(12, 'Too Faced', 35678901),
(13, 'Smashbox', 56789012),
(14, 'NARS', 55890123),
(15, 'Benefit Cosmetics', 66701234),
(16, 'Tarte', 77890145),
(17, 'Bobbi Brown', 90123456),
(18, 'NYX Professional Makeup', 99234567),
(19, 'Hourglass', 10123478),
(20, 'Huda Beauty', 11345679);
 
INSERT INTO Categorie (ID_categorie, NUME_categorie, IMAGINE_categorie, ID_categorie_parinte, ORDINE_categorie) VALUES
(1, 'Machiaj', 'http://example.com/imagini/categorie1.jpg', 14,1),
(2, 'Ingrijire personala', 'http://example.com/imagini/categorie2.jpg',14, 2),
(3, 'Ingrijirea parului', 'http://example.com/imagini/categorie3.jpg',14, 3),
(4, 'Parfumuri', 'http://example.com/imagini/categorie4.jpg', 15, 4),
(5, 'Ingrijirea pielii', 'http://example.com/imagini/categorie5.jpg', 15, 5),
(6, 'Produse de baie', 'http://example.com/imagini/categorie6.jpg',15, 6),
(7, 'Protectie solara', 'http://example.com/imagini/categorie7.jpg', 14, 7),
(8, 'Accesorii', 'http://example.com/imagini/categorie8.jpg', 14, 8),
(9, 'Cadouri', 'http://example.com/imagini/categorie9.jpg', 15, 9),
(10, 'Produse organice', 'http://example.com/imagini/categorie10.jpg', 15, 10),
(11, 'Produse de barbierit', 'http://example.com/imagini/categorie11.jpg', 13, 11),
(12, 'Aparate si instrumente', 'http://example.com/imagini/categorie12.jpg',13, 12),
(13, 'Barbati', 'http://example.com/imagini/categorie1.jpg', NULL, 1),
(14, 'Femei', 'http://example.com/imagini/categorie2.jpg', NULL, 2),
(15, 'Unisex', 'http://example.com/imagini/categorie3.jpg', NULL, 3);

 
 INSERT INTO Produs (ID_produs, NUME_produs, DESCRIERE_produs, PRET_produs, URL_produs, DATA_intrare, DATA_schimbare, ID_taxa, ID_producator,ID_categorie) VALUES
(1, 'Fond de ten', 'Fond de ten lichid pentru toate tipurile de piele', 59.99, 'http://example.com/produs1', '2024-01-01', '2024-01-01', 1, 1,1),
(2, 'Ruj', 'Ruj hidratant cu rezistenta indelungata', 39.99, 'http://example.com/produs2', '2024-01-02', '2024-01-02', 1, 2,2),
(3, 'Mascara', 'Mascara pentru volum si alungire', 49.99, 'http://example.com/produs3', '2024-01-03', '2024-01-03', 1, 4,1),
(4, 'Creion de ochi', 'Creion de ochi rezistent la apa', 29.99, 'http://example.com/produs4', '2024-01-04', '2024-01-04', 1, 5,4),
(5, 'Fard de pleoape', 'Fard de pleoape in diverse nuante', 19.99, 'http://example.com/produs5', '2024-01-05', '2024-01-05', 1, 6,1),
(6, 'Blush', 'Blush pentru un aspect radiant', 24.99, 'http://example.com/produs6', '2024-01-06', '2024-01-06', 1, 7,1),
(7, 'Primer', 'Primer pentru ten luminos', 34.99, 'http://example.com/produs7', '2024-01-07', '2024-01-07', 1, 8,6),
(8, 'Corector', 'Corector pentru acoperirea imperfectiunilor', 29.99, 'http://example.com/produs8', '2024-01-08', '2024-01-08', 1, 9,7),
(9, 'Pudra', 'Pudra pentru matifiere', 39.99, 'http://example.com/produs9', '2024-01-09', '2024-01-09', 1, 10,8),
(10, 'Gel de sprancene', 'Gel pentru fixarea sprancenelor', 24.99, 'http://example.com/produs10', '2024-01-10', '2024-01-10', 1, 11,8),
(11, 'Balsam de buze', 'Balsam hidratant pentru buze', 14.99, 'http://example.com/produs11', '2024-01-11', '2024-01-11', 1, 12,9),
(12, 'Spray fixativ', 'Spray fixativ pentru machiaj', 19.99, 'http://example.com/produs12', '2024-01-12', '2024-01-12', 1, 13,6),
(13, 'Ser pentru fata', 'Ser pentru hidratare si iluminare', 49.99, 'http://example.com/produs13', '2024-01-13', '2024-01-13', 1, 14,7),
(14, 'Crema de noapte', 'Crema regeneranta pentru noapte', 59.99, 'http://example.com/produs14', '2024-01-14', '2024-01-14', 1, 15,8),
(15, 'Crema anti-rid', 'Crema pentru reducerea ridurilor', 79.99, 'http://example.com/produs15', '2024-01-15', '2024-01-15', 1, 16,8),
(16, 'Demachiant', 'Demachiant pentru ten sensibil', 29.99, 'http://example.com/produs16', '2024-01-16', '2024-01-16', 1, 17,9),
(17, 'Apa micelara', 'Apa micelara pentru curatarea tenului', 19.99, 'http://example.com/produs17', '2024-01-17', '2024-01-17', 1, 18,7),
(18, 'Tonifiator', 'Tonifiator pentru revigorarea tenului', 34.99, 'http://example.com/produs18', '2024-01-18', '2024-01-18', 1, 19,11),
(19, 'Masca de fata', 'Masca hidratanta pentru fata', 24.99, 'http://example.com/produs19', '2024-01-19', '2024-01-19', 1, 1,12),
(20, 'Scrub facial', 'Scrub exfoliant pentru fata', 29.99, 'http://example.com/produs20', '2024-01-20', '2024-01-20', 1, 2,10),
(21, 'Crema de zi', 'Crema de zi cu protectie solara', 39.99, 'http://example.com/produs21', '2024-01-21', '2024-01-21', 1, 3,10),
(22, 'Ulei de fata', 'Ulei pentru hidratarea tenului', 49.99, 'http://example.com/produs22', '2024-01-22', '2024-01-22', 1, 4,9),
(23, 'Spray de fixare', 'Spray de fixare pentru machiaj', 19.99, 'http://example.com/produs23', '2024-01-23', '2024-01-23', 1, 5,1),
(24, 'BB cream', 'BB cream pentru hidratare si uniformizare', 39.99, 'http://example.com/produs24', '2024-01-24', '2024-01-24', 1, 6,1),
(25, 'CC cream', 'CC cream pentru corectarea tenului', 39.99, 'http://example.com/produs25', '2024-01-25', '2024-01-25', 1, 7,2),
(26, 'Lotiune de corp', 'Lotiune hidratanta pentru corp', 29.99, 'http://example.com/produs26', '2024-01-26', '2024-01-26', 1, 8,3),
(27, 'Crema de maini', 'Crema hidratanta pentru maini', 14.99, 'http://example.com/produs27', '2024-01-27', '2024-01-27', 1, 9,4),
(28, 'Gel de dus', 'Gel de dus revitalizant', 19.99, 'http://example.com/produs28', '2024-01-28', '2024-01-28', 1, 10,5),
(29, 'Sampon', 'Sampon pentru toate tipurile de par', 24.99, 'http://example.com/produs29', '2024-01-29', '2024-01-29', 1, 11,4),
(30, 'Balsam de par', 'Balsam hidratant pentru par', 24.99, 'http://example.com/produs30', '2024-01-30', '2024-01-30', 1, 12,6),
(31, 'Masca de par', 'Masca regeneranta pentru par', 34.99, 'http://example.com/produs31', '2024-01-31', '2024-01-31', 1, 13,7),
(32, 'Ulei de par', 'Ulei pentru stralucire si hidratare', 39.99, 'http://example.com/produs32', '2024-02-01', '2024-02-01', 1, 14,8),
(33, 'Ser pentru par', 'Ser pentru varfuri despicate', 29.99, 'http://example.com/produs33', '2024-02-02', '2024-02-02', 1, 15,8),
(34, 'Parfum', 'Parfum floral', 59.99, 'http://example.com/produs34', '2024-02-03', '2024-02-03', 1, 16,4),
(35, 'Deodorant', 'Deodorant anti-perspirant', 14.99, 'http://example.com/produs35', '2024-02-04', '2024-02-04', 1, 17,12),
(36, 'Apa de toaleta', 'Apa de toaleta cu note fresh', 49.99, 'http://example.com/produs36', '2024-02-05', '2024-02-05', 1, 18,12),
(37, 'Crema autobronzanta', 'Crema autobronzanta pentru corp', 29.99, 'http://example.com/produs37', '2024-02-06', '2024-02-06', 1, 19,10),
(38, 'Set cadou', 'Set cadou cu produse cosmetice', 99.99, 'http://example.com/produs38', '2024-02-07', '2024-02-07', 1, 1,10),
(39, 'Exfoliant de corp', 'Exfoliant hidratant pentru corp', 24.99, 'http://example.com/produs392','2024-02-07', '2024-02-07', 1, 1,10);

INSERT INTO RataTaxa (ID_rata, ID_taxa, ORDINE_taxa, VALOARE_taxa) VALUES
(1, 1, 1, 19.00),
(2, 2, 2, 2.00),
(3, 3, 1, 10.00),
(4, 4, 2, 5.00),
(5, 5, 1, 3.00),
(6, 6, 2, 7.00),
(7, 7, 1, 8.00),
(8, 8, 2, 4.00),
(9, 9, 1, 6.00),
(10, 10, 2, 11.00),
(11, 11, 1, 9.00),
(12, 12, 2, 13.00),
(13, 13, 2, 1.50),
(14, 14, 1, 2.50),
(15, 15, 2, 7.50);



INSERT INTO ImagineProdus (ID_imagine, ID_produs, Imagine, COD_html) VALUES
(1, 1, 'http://example.com/imagini/produs1.jpg', '<img src="http://example.com/imagini/produs1.jpg">'),
(2, 2, 'http://example.com/imagini/produs2.jpg', '<img src="http://example.com/imagini/produs2.jpg">'),
(3, 3, 'http://example.com/imagini/produs3.jpg', '<img src="http://example.com/imagini/produs3.jpg">'),
(4, 4, 'http://example.com/imagini/produs4.jpg', '<img src="http://example.com/imagini/produs4.jpg">'),
(5, 5, 'http://example.com/imagini/produs5.jpg', '<img src="http://example.com/imagini/produs5.jpg">'),
(6, 6, 'http://example.com/imagini/produs6.jpg', '<img src="http://example.com/imagini/produs6.jpg">'),
(7, 7, 'http://example.com/imagini/produs7.jpg', '<img src="http://example.com/imagini/produs7.jpg">'),
(8, 8, 'http://example.com/imagini/produs8.jpg', '<img src="http://example.com/imagini/produs8.jpg">'),
(9, 9, 'http://example.com/imagini/produs9.jpg', '<img src="http://example.com/imagini/produs9.jpg">'),
(10, 10, 'http://example.com/imagini/produs10.jpg', '<img src="http://example.com/imagini/produs10.jpg">'),
(11, 11, 'http://example.com/imagini/produs11.jpg', '<img src="http://example.com/imagini/produs11.jpg">'),
(12, 12, 'http://example.com/imagini/produs12.jpg', '<img src="http://example.com/imagini/produs12.jpg">'),
(13, 13, 'http://example.com/imagini/produs13.jpg', '<img src="http://example.com/imagini/produs13.jpg">'),
(14, 14, 'http://example.com/imagini/produs14.jpg', '<img src="http://example.com/imagini/produs14.jpg">'),
(15, 15, 'http://example.com/imagini/produs15.jpg', '<img src="http://example.com/imagini/produs15.jpg">'),
(16, 16, 'http://example.com/imagini/produs16.jpg', '<img src="http://example.com/imagini/produs16.jpg">'),
(17, 17, 'http://example.com/imagini/produs17.jpg', '<img src="http://example.com/imagini/produs17.jpg">'),
(18, 18, 'http://example.com/imagini/produs18.jpg', '<img src="http://example.com/imagini/produs18.jpg">'),
(19, 19, 'http://example.com/imagini/produs19.jpg', '<img src="http://example.com/imagini/produs19.jpg">'),
(20, 20, 'http://example.com/imagini/produs20.jpg', '<img src="http://example.com/imagini/produs20.jpg">'),
(21, 21, 'http://example.com/imagini/produs21.jpg', '<img src="http://example.com/imagini/produs21.jpg">'),
(22, 22, 'http://example.com/imagini/produs22.jpg', '<img src="http://example.com/imagini/produs22.jpg">'),
(23, 23, 'http://example.com/imagini/produs23.jpg', '<img src="http://example.com/imagini/produs23.jpg">'),
(24, 24, 'http://example.com/imagini/produs24.jpg', '<img src="http://example.com/imagini/produs24.jpg">'),
(25, 25, 'http://example.com/imagini/produs25.jpg', '<img src="http://example.com/imagini/produs25.jpg">'),
(26, 26, 'http://example.com/imagini/produs26.jpg', '<img src="http://example.com/imagini/produs26.jpg">'),
(27, 27, 'http://example.com/imagini/produs27.jpg', '<img src="http://example.com/imagini/produs27.jpg">'),
(28, 28, 'http://example.com/imagini/produs28.jpg', '<img src="http://example.com/imagini/produs28.jpg">'),
(29, 29, 'http://example.com/imagini/produs29.jpg', '<img src="http://example.com/imagini/produs29.jpg">'),
(30, 30, 'http://example.com/imagini/produs30.jpg', '<img src="http://example.com/imagini/produs30.jpg">'),
(31, 31, 'http://example.com/imagini/produs31.jpg', '<img src="http://example.com/imagini/produs31.jpg">'),
(32, 32, 'http://example.com/imagini/produs32.jpg', '<img src="http://example.com/imagini/produs32.jpg">'),
(33, 33, 'http://example.com/imagini/produs33.jpg', '<img src="http://example.com/imagini/produs33.jpg">'),
(34, 34, 'http://example.com/imagini/produs34.jpg', '<img src="http://example.com/imagini/produs34.jpg">'),
(35, 35, 'http://example.com/imagini/produs35.jpg', '<img src="http://example.com/imagini/produs35.jpg">'),
(36, 36, 'http://example.com/imagini/produs36.jpg', '<img src="http://example.com/imagini/produs36.jpg">'),
(37, 37, 'http://example.com/imagini/produs37.jpg', '<img src="http://example.com/imagini/produs37.jpg">'),
(38, 38, 'http://example.com/imagini/produs38.jpg', '<img src="http://example.com/imagini/produs38.jpg">'),
(39, 39, 'http://example.com/imagini/produs39.jpg', '<img src="http://example.com/imagini/produs39.jpg">'),
(40, 4, 'http://example.com/imagini/produs40.jpg', '<img src="http://example.com/imagini/produs40.jpg">'),
(41, 1, 'http://example.com/imagini/produs41.jpg', '<img src="http://example.com/imagini/produs41.jpg">'),
(42, 2, 'http://example.com/imagini/produs42.jpg', '<img src="http://example.com/imagini/produs42.jpg">'),
(43, 3, 'http://example.com/imagini/produs43.jpg', '<img src="http://example.com/imagini/produs43.jpg">'),
(44, 4, 'http://example.com/imagini/produs44.jpg', '<img src="http://example.com/imagini/produs44.jpg">'),
(45, 5, 'http://example.com/imagini/produs45.jpg', '<img src="http://example.com/imagini/produs45.jpg">');





INSERT INTO Reduceri (ID_reducere, PROCENT_pret, DATA_inceput, DATA_sfarsit, ID_produs) VALUES
(1, 10.00, '2023-01-01', '2023-01-31', 1),
(2, 15.00, '2023-02-01', '2023-02-28', 2),
(3, 20.00,'2023-03-01', '2023-03-31', 3),
(4, 25.00, '2023-04-01', '2023-04-30', 4),
(5, 30.00, '2023-05-01', '2023-05-31', 5),
(6, 35.00, '2023-06-01', '2023-06-30', 6),
(7, 40.00, '2023-07-01', '2023-07-31', 7),
(8, 45.00, '2023-08-01', '2023-08-31', 8),
(9, 50.00, '2023-09-01', '2023-09-30', 9),
(10, 55.00, '2023-10-01', '2023-10-31', 10),
(11, 60.00, '2023-11-01', '2023-11-30', 11),
(12, 65.00, '2023-12-01', '2023-12-31', 12),
(13, 70.00, '2024-01-01', '2024-01-31', 13),
(14, 75.00, '2024-02-01', '2024-02-29', 14),
(15, 80.00, '2024-03-01', '2024-03-31', 15);


INSERT INTO Clienti (ID_client, NUME_client, PRENUME_client, EMAIL_client, NR_TEL_client, DATA_NASC_client, PAROLA_cont) VALUES
(1, 'Popescu', 'Ion', 'ion.popescu@gmail.com', '0712345678', '1980-01-01', 'parola123'),
(2, 'Ionescu', 'Maria', 'maria.ionescu@gmail.com', '0712345679', '1990-02-02', 'parola456'),
(3, 'Georgescu', 'Vasile', 'vasile.georgescu@gmail.com', '0712345680', '1985-03-03', 'parola789'),
(4, 'Mihailescu', 'Elena', 'elena.mihailescu@gmail.com', '0712345681', '1995-04-04', 'parola321'),
(5, 'Dumitrescu', 'Ioana', 'ioana.dumitrescu@gmail.com', '0712345682', '1975-05-05', 'parola654'),
(6, 'Marinescu', 'Gheorghe', 'gheorghe.marinescu@gmail.com', '0712345683', '1965-06-06', 'parola987'),
(7, 'Petrescu', 'Ana', 'ana.petrescu@gmail.com', '0712345684', '1982-07-07', 'parola111'),
(8, 'Stoian', 'Mihai', 'mihai.stoian@gmail.com', '0712345685', '1992-08-08', 'parola222'),
(9, 'Nistor', 'Cristina', 'cristina.nistor@gmail.com', '0712345686', '1988-09-09', 'parola333'),
(10, 'Grigorescu', 'Andrei', 'andrei.grigorescu@gmail.com', '0712345687', '1998-10-10', 'parola444'),
(11, 'Radu', 'Gabriela', 'gabriela.radu@gmail.com', '0712345688', '1978-11-11', 'parola555'),
(12, 'Barbu', 'Alexandru', 'alexandru.barbu@gmail.com', '0712345689', '1983-12-12', 'parola666'),
(13, 'Diaconu', 'Diana', 'diana.diaconu@gmail.com', '0712345690', '1993-01-13', 'parola777'),
(14, 'Enache', 'Florin', 'florin.enache@gmail.com', '0712345691', '1981-02-14', 'parola888'),
(15, 'Popa', 'Valentina', 'valentina.popa@gmail.com', '0712345692', '1979-03-15', 'parola999'),
(16, 'Constantinescu', 'Andreea', 'andreea.constantinescu@gmail.com', '0712345693', '1987-04-16', 'parola1234'),
(17, 'Iacob', 'Marius', 'marius.iacob@gmail.com', '0712345694', '1976-05-17', 'parola4567'),
(18, 'Stanciu', 'Catalin', 'catalin.stanciu@gmail.com', '0712345695', '1997-06-18', 'parola7890'),
(19, 'Dumitru', 'Ana', 'ana.dumitru@gmail.com', '0712345696', '1984-07-19', 'parola3210'),
(20, 'Florescu', 'Mirela', 'mirela.florescu@gmail.com', '0712345697', '1996-08-20', 'parola6543'),
(21, 'Gheorghe', 'Dumitru', 'dumitru.gheorghe@gmail.com', '0712345698', '1983-09-21', 'parola9876'),
(22, 'Iordache', 'Laura', 'laura.iordache@gmail.com', '0712345699', '1979-10-22', 'parola1111'),
(23, 'Lucian', 'Cristian', 'cristian.lucian@gmail.com', '0712345700', '1991-11-23', 'parola2222'),
(24, 'Munteanu', 'Adrian', 'adrian.munteanu@gmail.com', '0712345701', '1980-12-24', 'parola3333'),
(25, 'Nicolae', 'Simona', 'simona.nicolae@gmail.com', '0712345702', '1990-01-25', 'parola4444');


INSERT INTO StatusCos (ID_STATUS_cos, DESCRIERE_status) VALUES
(1, 'In asteptare'),
(2, 'Finalizat'),
(3, 'Anulat');

INSERT INTO Cos (ID_cos, ID_client, DATA_adaugare, ID_STATUS_cos) VALUES
(1, 1, '2024-05-01', 1),
(2, 2, '2024-05-02', 2),
(3, 3, '2024-05-03', 3),
(4, 4, '2024-05-04', 2),
(5, 5, '2024-05-05', 1),
(6, 6, '2024-05-06',3),
(7, 7, '2024-05-07', 1),
(8, 8, '2024-05-08', 2),
(9, 9, '2024-05-09', 1),
(10, 10, '2024-05-10', 3),
(11, 11, '2024-05-11', 1),
(12, 12, '2024-05-12', 2),
(13, 13, '2024-05-13', 1),
(14, 14, '2024-05-14', 2),
(15, 15, '2024-05-15', 3),
(16, 1, '2024-05-16', 2),
(17, 7, '2024-05-17', 3),
(18, 8, '2024-05-18', 2),
(19, 9, '2024-05-19', 1),
(20, 2, '2024-05-20', 3),
(21, 1, '2024-05-21', 1),
(22, 2, '2024-05-22', 3);

INSERT INTO ModificareStatusCos (ID_status_cos, ID_cos, DATA_modificare_status_cos, DESCRIERE_status_cos) VALUES
(1, 1, '2024-05-02', 'In asteptare'),
(2, 1, '2024-05-03', 'Finalizat'),
(3, 2, '2024-05-04', 'Anulat'),
(1, 3, '2024-05-05', 'In asteptare'),
(2, 4, '2024-05-06', 'Finalizat'),
(3, 5, '2024-05-07', 'Anulat'),
(1, 6, '2024-05-08', 'In asteptare'),
(2, 7, '2024-05-09', 'Finalizat'),
(3, 8, '2024-05-10', 'Anulat'),
(1, 9, '2024-05-11', 'In asteptare'),
(2, 10, '2024-05-12', 'Finalizat'),
(3, 11, '2024-05-13', 'Anulat'),
(1, 12, '2024-05-14', 'In asteptare'),
(2, 13, '2024-05-15', 'Finalizat'),
(3, 14, '2024-05-16', 'Anulat');


INSERT INTO ProduseInCos (ID_cos, ID_produs, CANTITATE) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1),
(6, 6, 3),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 1),
(11, 11, 2),
(12, 12, 1),
(13, 13, 2),
(14, 14, 1),
(15, 15, 3),
(16, 16, 1),
(17, 17, 2),
(18, 18, 1),
(19, 19, 1),
(20, 20, 2),
(21, 21, 1),
(22, 22, 3);

INSERT INTO StatusComenzi (ID_STATUS_comanda, DESCRIERE_status_comanda) VALUES
(1, 'Noua'),
(2, 'In procesare'),
(3, 'Expediata'),
(4, 'Finalizata'),
(5, 'Anulata');

INSERT INTO Orase (ID_oras, NUME_oras) VALUES
(1, 'Bucuresti'),
(2, 'Cluj-Napoca'),
(3, 'Timisoara'),
(4, 'Iasi'),
(5, 'Constanta'),
(6, 'Brasov'),
(7, 'Galati'),
(8, 'Craiova'),
(9, 'Ploiesti'),
(10, 'Oradea'),
(11, 'Bacau');

INSERT INTO Judete (ID_judet, NUME_judet) VALUES
(1, 'Bucuresti'),
(2, 'Cluj'),
(3, 'Timis'),
(4, 'Iasi'),
(5, 'Constanta'),
(6, 'Brasov'),
(7, 'Galati'),
(8, 'Prahova'),
(9, 'Arad'),
(10, 'Bacau'),
(11, 'Sibiu'),
(12, 'Bihor'),
(13, 'Dolj'),
(14, 'Braila'),
(15, 'Mures'),
(16, 'Arges'),
(17, 'Suceava'),
(18, 'Buzau'),
(19, 'Alba'),
(20, 'Neamt'),
(21, 'Satu Mare'),
(22, 'Gorj');

INSERT INTO Tari (ID_tara, NUME_tara) VALUES
(1, 'Romania'),
(2, 'Bulgaria'),
(3, 'Ungaria'),
(4, 'Germania'),
(5, 'Franta'),
(6, 'Italia');



INSERT INTO CodPostal (ID_cod_postal, NUMAR_cod, ID_oras, ID_judet, ID_tara) VALUES
(1, 100101, 1, 1, 1),
(2, 200202, 2, 2, 2),
(3, 300303, 3, 3, 3),
(4, 400404, 4, 4, 4),
(5, 500505, 5, 5, 5),
(6, 600606, 6, 6, 6),
(7, 700707, 7, 7, 1),
(8, 800808, 8, 8, 2),
(9, 900909, 9, 9, 3),
(10, 101010, 10, 10, 4),
(11, 111111, 11, 11, 5),
(12, 121212, 1, 12, 6),
(13, 131313, 3, 13, 1),
(14, 141414, 4, 14, 2),
(15, 151515, 5, 15, 3),
(16, 161616, 6, 16, 4),
(17, 171717, 7, 17, 5),
(18, 181818, 8, 18, 6),
(19, 191919, 9, 19, 1),
(20, 202020, 2, 20, 2);

INSERT INTO Adrese (ID_adresa, STRADA_adresa, NR_adresa, ID_cod_postal, ID_client) VALUES
(1, 'Strada Victoriei', '10A', 1, 1),
(2, 'Strada Republicii', '25', 2, 2),
(3, 'Bulevardul Unirii', '8', 3, 3),
(4, 'Calea Dorobanților', '15', 4, 4),
(5, 'Aleea Parcului', '7B', 5, 5),
(6, 'Bulevardul Eroilor', '12', 6, 6),
(7, 'Strada Mihai Viteazu', '3', 7, 7),
(8, 'Bulevardul Decebal', '18', 8, 8),
(9, 'Strada Aviatorilor', '21A', 9, 9),
(10, 'Calea Victoriei', '30', 10, 10),
(11, 'Bulevardul Libertății', '5', 11, 11),
(12, 'Strada Traian', '14', 12, 12),
(13, 'Bulevardul Revoluției', '20', 13, 13),
(14, 'Strada Aurel Vlaicu', '9', 14, 14),
(15, 'Bulevardul Timișoara', '16', 15, 15),
(16, 'Strada Ferdinand', '22', 16, 1),
(17, 'Bulevardul Iuliu Maniu', '11', 17, 2),
(18, 'Strada Gării', '6', 18, 3),
(19, 'Bulevardul Carol I', '17', 19, 4),
(20, 'Strada Căii Ferate', '4', 20, 5);

INSERT INTO Comenzi (ID_comanda, ID_client, ID_adresa, DATA_comanda, SUMA_totala, METODA_plata) VALUES
(1, 1, 1, '2024-05-01', 150.00, 'Card'),
(2, 2, 2, '2024-05-02', 200.00, 'Cash'),
(3, 3, 3, '2024-05-03', 100.00, 'Card'),
(4, 4, 4, '2024-05-04', 75.00, 'Card'),
(5, 5, 5, '2024-05-05', 180.00, 'Cash'),
(6, 6, 6, '2024-05-06', 220.00, 'Card'),
(7, 7, 7, '2024-05-07', 90.00, 'Card'),
(8, 8, 8, '2024-05-08', 120.00, 'Cash'),
(9, 9, 9, '2024-05-09', 135.00, 'Card'),
(10, 10, 10, '2024-05-10', 250.00, 'Cash'),
(11, 11, 11, '2024-05-11', 80.00, 'Card'),
(12, 12, 12, '2024-05-12', 300.00, 'Cash'),
(13, 13, 13, '2024-05-13', 110.00, 'Card'),
(14, 14, 14, '2024-05-14', 190.00, 'Cash'),
(15, 15, 15, '2024-05-15', 170.00, 'Card'),
(16, 1, 16, '2024-05-16', 140.00, 'Cash'),
(17, 2, 17, '2024-05-17', 160.00, 'Card'),
(18, 3, 18, '2024-05-18', 95.00, 'Cash'),
(19, 4, 19, '2024-05-19', 210.00, 'Card'),
(20, 5, 20, '2024-05-20', 230.00, 'Cash'),
(21, 6, 1, '2024-05-21', 125.00, 'Card'),
(22, 7, 2, '2024-05-22', 145.00, 'Cash'),
(23, 8, 3, '2024-05-23', 260.00, 'Card'),
(24, 9, 4, '2024-05-24', 100.00, 'Cash'),
(25, 10, 5, '2024-05-25', 180.00, 'Card'),
(26, 11, 6, '2024-05-26', 150.00, 'Cash'),
(27, 12, 7, '2024-05-27', 200.00, 'Card'),
(28, 13, 8, '2024-05-28', 170.00, 'Cash'),
(29, 14, 9, '2024-05-29', 220.00, 'Card'),
(30, 15, 10, '2024-05-30', 190.00, 'Cash');


INSERT INTO ModificareStatus (ID_comanda, ID_status_comanda, DATA_modificare_status, DESCRIERE_status) 
VALUES 
    (1, 1, '2024-05-01', 'Comanda inregistrata'),
    (2, 2, '2024-05-02', 'Comanda pregatita pentru livrare'),
    (3, 3, '2024-05-03', 'Comanda in curs de livrare'),
    (4, 1, '2024-05-04', 'Comanda inregistrata'),
    (5, 2, '2024-05-05', 'Comanda pregatita pentru livrare'),
    (6, 3, '2024-05-06', 'Comanda in curs de livrare'),
    (7, 1, '2024-05-07', 'Comanda inregistrata'),
    (8, 2, '2024-05-08', 'Comanda pregatita pentru livrare'),
    (9, 3, '2024-05-09', 'Comanda in curs de livrare'),
    (10, 1, '2024-05-10', 'Comanda inregistrata'),
	(11, 2, '2024-05-11', 'Comanda pregatita pentru livrare'),
    (12, 3, '2024-05-12', 'Comanda in curs de livrare'),
    (13, 1, '2024-05-13', 'Comanda inregistrata'),
    (14, 2, '2024-05-14', 'Comanda pregatita pentru livrare'),
    (15, 3, '2024-05-15', 'Comanda in curs de livrare'),
    (16, 1, '2024-05-16', 'Comanda inregistrata'),
    (17, 2, '2024-05-17', 'Comanda pregatita pentru livrare'),
    (18, 3, '2024-05-18', 'Comanda in curs de livrare'),
    (19, 1, '2024-05-19', 'Comanda inregistrata'),
    (20, 2, '2024-05-20', 'Comanda pregatita pentru livrare');
	


INSERT INTO ProduseComandate (ID_comanda, ID_produs, PRET_produs, CANTITATE) VALUES
    (1, 1, 50.00, 2),
    (1, 2, 30.00, 1),
    (1, 3, 20.00, 3),
    (2, 25, 30.00, 1),
    (2, 4, 40.00, 2),
    (3, 5, 20.00, 2),
    (4, 1, 50.00, 1),
    (4, 3, 20.00, 2),
    (5, 8, 30.00, 3),
    (5, 4, 40.00, 1),
    (6, 1, 50.00, 2),
    (6, 4, 40.00, 2),
    (7, 3, 20.00, 1),
    (8, 13, 30.00, 1),
    (8, 26, 20.00, 3),
    (8, 4, 40.00, 1),
    (9, 1, 50.00, 2),
    (10, 7, 30.00, 2),
    (10, 4, 40.00, 1),
    (11, 1, 50.00, 3),
    (11, 17, 20.00, 2),
    (12, 7, 30.00, 1),
    (12, 3, 20.00, 1),
    (12, 9, 40.00, 3),
    (13, 1, 50.00, 2),
    (13, 31, 40.00, 1),
    (14, 10, 30.00, 2),
    (14, 3, 20.00, 2),
    (14, 4, 40.00, 1),
    (15, 7, 50.00, 3),
    (24, 2, 30.00, 1),
    (16, 14, 20.00, 2),
    (16, 4, 40.00, 2),
    (17, 15, 50.00, 1),
    (30, 32, 30.00, 2);

	


INSERT INTO Recenzii (ID_recenzie, ID_client, ID_produs, RATING_recenzie, CONTINUT_recenzie, DATA_recenzie) VALUES
    (1, 1, 1, 5, 'Produs excelent, foarte mulțumit de achiziție.', '2024-05-01'),
    (2, 2, 2, 4, 'Produsul este în regulă, dar livrarea a durat mai mult decât mă așteptam.', '2024-05-02'),
    (3, 3, 3, 3, 'Nu sunt foarte impresionat de calitatea produsului.', '2024-05-03'),
    (4, 4, 4, 5, 'Produsul este exact ceea ce căutam, foarte mulțumită.', '2024-05-04'),
    (5, 5, 1, 1, 'Bun raport calitate-preț, recomand cu încredere.', '2024-05-05'),
    (6, 6, 2, 2, 'Produsul a ajuns deteriorat, dezamăgită de experiență.', '2024-05-06'),
    (7, 7, 3, 3, 'Produsul este ok, nimic deosebit.', '2024-05-07'),
    (8, 8, 4, 3, 'Recomand cu căldură acest produs, a fost o alegere inspirată.', '2024-05-08'),
    (9, 9, 1, 1, 'Produsul este excepțional, foarte mulțumită de achiziție.', '2024-05-09'),
    (10, 10, 2, 3, 'Calitatea produsului nu este pe măsura prețului.', '2024-05-10'),
    (11, 11, 3, 3, 'Produsul a fost livrat în timp util și este de calitate.', '2024-05-11'),
    (12, 12, 4, 5, 'Sunt extrem de mulțumit de acest produs, îl recomand cu încredere.', '2024-05-12'),
    (13, 13, 1, 1, 'Produsul nu a fost ceea ce mă așteptam, dar este ok pentru prețul său.', '2024-05-13'),
    (14, 14, 2, 3, 'Foarte mulțumit de acest produs, a fost o achiziție bună.', '2024-05-14'),
    (15, 15, 3, 2, 'Produsul a ajuns deteriorat și nu corespunde descrierii.', '2024-05-15'),
    (16, 1, 4, 4, 'Excelent produs, recomand tuturor.', '2024-05-16'),
    (17, 2, 1, 1, 'Produsul este exact așa cum mă așteptam, foarte mulțumit.', '2024-05-17'),
    (18, 3, 2, 3, 'Așteptările mele au fost mai mari, dar produsul este ok.', '2024-05-18'),
    (19, 4, 3, 4, 'Produsul este bun, dar livrarea a fost întârziată.', '2024-05-19'),
    (20, 5, 4, 3, 'Un produs excepțional, calitate ireproșabilă.', '2024-05-20'),
    (21, 6, 5, 4, 'Fardul de pleoape are o textură foarte fină și culori frumoase.', '2024-05-21'),
    (22, 7, 6, 5, 'Blush-ul oferă un aspect radiant și natural.', '2024-05-22'),
    (23, 8, 7, 3, 'Primer-ul este bun, dar nu excepțional.', '2024-05-23'),
    (24, 9, 8, 2, 'Corectorul nu acoperă bine imperfecțiunile.', '2024-05-24'),
    (25, 10, 9, 4, 'Pudra matifiantă este foarte eficientă.', '2024-05-25'),
    (26, 11, 10, 5, 'Gelul de sprâncene fixează foarte bine.', '2024-05-26'),
    (27, 12, 11, 4, 'Balsamul de buze este foarte hidratant.', '2024-05-27'),
    (28, 13, 12, 3, 'Spray-ul fixativ este ok, dar nu extraordinar.', '2024-05-28'),
    (29, 14, 13, 5, 'Serul pentru față este foarte hidratant și iluminator.', '2024-05-29'),
    (30, 15, 14, 4, 'Crema de noapte este foarte regenerantă.', '2024-05-30'),
    (31, 1, 15, 3, 'Crema anti-rid nu are efecte vizibile.', '2024-05-31'),
    (32, 2, 16, 5, 'Demachiantul este foarte blând și eficient.', '2024-06-01'),
    (33, 3, 17, 4, 'Apa micelară curăță bine tenul.', '2024-06-02'),
    (34, 4, 18, 3, 'Tonifiatorul nu este foarte revigorant.', '2024-06-03'),
    (35, 5, 19, 4, 'Masca de față hidratează foarte bine.', '2024-06-04'),
    (36, 6, 20, 3, 'Scrub-ul facial este ok, dar nu excepțional.', '2024-06-05'),
    (37, 7, 21, 4, 'Crema de zi are o textură plăcută și protejează bine.', '2024-06-06'),
    (38, 8, 22, 5, 'Uleiul de față este foarte hidratant.', '2024-06-07'),
    (39, 9, 23, 4, 'Spray-ul de fixare este foarte eficient.', '2024-06-08'),
    (40, 10, 24, 3, 'BB cream-ul este bun, dar nu excepțional.', '2024-06-09');







 
 

