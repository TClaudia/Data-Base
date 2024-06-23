DROP TABLE IF EXISTS ModificareStatusCos CASCADE;
DROP TABLE IF EXISTS Recenzii CASCADE;
DROP TABLE IF EXISTS ProduseComandate CASCADE;
DROP TABLE IF EXISTS Comenzi CASCADE;
DROP TABLE IF EXISTS ModificareStatus CASCADE;
DROP TABLE IF EXISTS Adrese CASCADE;
DROP TABLE IF EXISTS CodPostal CASCADE;
DROP TABLE IF EXISTS Tari CASCADE;
DROP TABLE IF EXISTS Judete CASCADE;
DROP TABLE IF EXISTS Orase CASCADE;
DROP TABLE IF EXISTS StatusComenzi CASCADE;
DROP TABLE IF EXISTS ProduseInCos CASCADE;
DROP TABLE IF EXISTS Cos CASCADE;
DROP TABLE IF EXISTS StatusCos CASCADE;
DROP TABLE IF EXISTS Clienti CASCADE;
DROP TABLE IF EXISTS Categorie CASCADE;
DROP TABLE IF EXISTS Reduceri CASCADE;
DROP TABLE IF EXISTS ImagineProdus CASCADE;
DROP TABLE IF EXISTS RataTaxa CASCADE;
DROP TABLE IF EXISTS Produs CASCADE;
DROP TABLE IF EXISTS TipTaxe CASCADE;
DROP TABLE IF EXISTS Producator CASCADE;



CREATE TABLE TipTaxe (
    ID_taxa NUMERIC,
    NUME_taxa VARCHAR(100),
    DESCRIERE_taxa VARCHAR(1000));
ALTER TABLE TipTaxe ADD PRIMARY KEY (ID_taxa);

CREATE TABLE Producator (
    ID_producator NUMERIC,
    NUME_producator VARCHAR(100),
    CUI_producator NUMERIC(8));
ALTER TABLE Producator ADD PRIMARY KEY (ID_producator);

CREATE TABLE Categorie (
    ID_categorie NUMERIC PRIMARY KEY,
    NUME_categorie VARCHAR(100),
    ID_categorie_parinte NUMERIC,
	IMAGINE_categorie VARCHAR(255),
	ORDINE_categorie NUMERIC,
    FOREIGN KEY (ID_categorie_parinte) REFERENCES Categorie(ID_categorie)
);   

CREATE TABLE Produs (
    ID_produs NUMERIC,
    NUME_produs VARCHAR(300),
    DESCRIERE_produs VARCHAR(300),
    PRET_produs DECIMAL(10, 2),
    URL_produs VARCHAR(255),
    DATA_intrare DATE,
    DATA_schimbare DATE,
    ID_taxa NUMERIC,
    ID_producator NUMERIC,
	ID_Categorie NUMERIC);
	ALTER TABLE Produs ADD PRIMARY KEY (ID_produs);
    ALTER TABLE Produs ADD CONSTRAINT fk_produs_tiptaxe FOREIGN KEY (ID_taxa) REFERENCES TipTaxe(ID_taxa);
    ALTER TABLE Produs ADD CONSTRAINT fk_produs_producator FOREIGN KEY (ID_producator) REFERENCES Producator(ID_producator);
	ALTER TABLE Produs ADD CONSTRAINT fk_produs_Categorie FOREIGN KEY (ID_categorie) REFERENCES Categorie(ID_categorie);


CREATE TABLE RataTaxa(
    ID_rata NUMERIC,
    ID_taxa NUMERIC,
    ORDINE_taxa NUMERIC,
    VALOARE_taxa DECIMAL(10, 2));
	ALTER TABLE RataTaxa ADD PRIMARY KEY (ID_rata);
    ALTER TABLE RataTaxa ADD CONSTRAINT fk_ratataxa_TipTaxa FOREIGN KEY (ID_taxa) REFERENCES TipTaxe(ID_taxa);

CREATE TABLE ImagineProdus (
    ID_imagine NUMERIC,
    ID_produs NUMERIC,
    Imagine VARCHAR(255),
    COD_html TEXT);
	ALTER TABLE ImagineProdus ADD PRIMARY KEY (ID_imagine);
   ALTER TABLE ImagineProdus ADD CONSTRAINT fk_ImagineProdus_Produs  FOREIGN KEY (ID_produs) REFERENCES Produs(ID_produs);


CREATE TABLE Reduceri (
    ID_reducere NUMERIC,
    ID_produs NUMERIC,
    PROCENT_pret DECIMAL(10, 2),
    DATA_inceput DATE,
    DATA_sfarsit DATE);
	ALTER TABLE Reduceri ADD PRIMARY KEY (ID_reducere);
    ALTER TABLE Reduceri ADD CONSTRAINT fk_reduceri_produs FOREIGN KEY (ID_produs) REFERENCES Produs(ID_produs);


CREATE TABLE Clienti (
    ID_client NUMERIC,
    NUME_client VARCHAR(100),
    PRENUME_client VARCHAR(100),
    EMAIL_client VARCHAR(255),
    NR_TEL_client VARCHAR(20),
    DATA_NASC_client DATE,
    PAROLA_cont VARCHAR(255));
	ALTER TABLE Clienti ADD PRIMARY KEY (ID_client);

CREATE TABLE StatusCos (
    ID_STATUS_cos NUMERIC,
    DESCRIERE_status VARCHAR(100));
	ALTER TABLE StatusCos ADD PRIMARY KEY (ID_STATUS_cos);


CREATE TABLE Cos (
    ID_cos NUMERIC,
    ID_client NUMERIC,
    DATA_adaugare DATE,
    ID_STATUS_cos NUMERIC);
	ALTER TABLE Cos ADD PRIMARY KEY (ID_cos);
    ALTER TABLE Cos ADD CONSTRAINT fk_Cos_Clienti FOREIGN KEY (ID_client) REFERENCES Clienti(ID_client);

CREATE TABLE ModificareStatusCos (
    ID_STATUS_cos NUMERIC,
	ID_cos NUMERIC,
    DATA_modificare_status_cos DATE,
    DESCRIERE_status_cos VARCHAR(255));
   ALTER TABLE ModificareStatusCos ADD PRIMARY KEY (ID_cos, ID_STATUS_cos);
    ALTER TABLE ModificareStatusCos ADD CONSTRAINT fk_Modificare_Status_Cos_Cos FOREIGN KEY (ID_cos) REFERENCES Cos(ID_cos);
    ALTER TABLE ModificareStatusCos ADD CONSTRAINT fk_Modificare_Status_Cos_Status_Cos FOREIGN KEY (ID_STATUS_cos) REFERENCES StatusCos(ID_STATUS_cos);


CREATE TABLE ProduseInCos (
    ID_cos NUMERIC,
    ID_produs NUMERIC,
    CANTITATE NUMERIC);
    ALTER TABLE ProduseInCos ADD PRIMARY KEY (ID_cos, ID_produs);
    ALTER TABLE ProduseInCos ADD CONSTRAINT fk_ProduseInCos_Cos FOREIGN KEY (ID_cos) REFERENCES Cos(ID_cos);
    ALTER TABLE ProduseInCos ADD CONSTRAINT fk_ProduseInCos_Produs FOREIGN KEY (ID_produs) REFERENCES Produs(ID_produs);


CREATE TABLE StatusComenzi (
    ID_STATUS_comanda NUMERIC,
    DESCRIERE_status_comanda VARCHAR(100));
	ALTER TABLE StatusComenzi ADD PRIMARY KEY (ID_STATUS_comanda);


CREATE TABLE Orase (
    ID_oras NUMERIC,
    NUME_oras VARCHAR(100));
	ALTER TABLE Orase ADD PRIMARY KEY (ID_oras);

CREATE TABLE Judete (
    ID_judet NUMERIC,
    NUME_judet VARCHAR(100));
	ALTER TABLE Judete ADD PRIMARY KEY (ID_judet);


CREATE TABLE Tari (
    ID_tara NUMERIC,
    NUME_tara VARCHAR(100));
	ALTER TABLE Tari ADD PRIMARY KEY (ID_tara);

CREATE TABLE CodPostal (
    ID_cod_postal NUMERIC,
    NUMAR_cod NUMERIC(6),
    ID_oras NUMERIC,
    ID_judet NUMERIC,
    ID_tara NUMERIC);
	ALTER TABLE CodPostal ADD PRIMARY KEY (ID_cod_postal);
    ALTER TABLE CodPostal ADD CONSTRAINT fk_CodPostal_Orase FOREIGN KEY (ID_oras) REFERENCES Orase(ID_oras);
    ALTER TABLE CodPostal ADD CONSTRAINT fk_CodPostal_Judete FOREIGN KEY (ID_judet) REFERENCES Judete(ID_judet);
    ALTER TABLE CodPostal ADD CONSTRAINT fk_CodPostal_Tara FOREIGN KEY (ID_tara) REFERENCES Tari(ID_tara);


CREATE TABLE Adrese (
    ID_adresa NUMERIC,
    STRADA_adresa VARCHAR(255),
    NR_adresa VARCHAR(20),
    ID_cod_postal NUMERIC,
    ID_client NUMERIC);
	ALTER TABLE Adrese ADD PRIMARY KEY (ID_adresa);
    ALTER TABLE Adrese ADD CONSTRAINT fk_Adrese_CosPostal FOREIGN KEY (ID_cod_postal) REFERENCES CodPostal(ID_cod_postal);
   ALTER TABLE Adrese ADD CONSTRAINT fk_Adrese_Client  FOREIGN KEY (ID_client) REFERENCES Clienti(ID_client);

CREATE TABLE Comenzi (
    ID_comanda NUMERIC,
    ID_client NUMERIC,
    ID_adresa NUMERIC,
    DATA_comanda DATE,
    SUMA_totala DECIMAL(10, 2),
    METODA_plata VARCHAR(50));
	ALTER TABLE Comenzi ADD PRIMARY KEY (ID_comanda);
    ALTER TABLE Comenzi ADD CONSTRAINT fk_Comenzi_Client  FOREIGN KEY (ID_client) REFERENCES Clienti(ID_client);
    ALTER TABLE Comenzi ADD CONSTRAINT fk_Comenzi_Adrese FOREIGN KEY (ID_adresa) REFERENCES Adrese(ID_adresa);

CREATE TABLE ModificareStatus (
    ID_comanda NUMERIC,
    ID_status_comanda NUMERIC,
    DATA_modificare_status DATE,
    DESCRIERE_status VARCHAR(255));
   ALTER TABLE ModificareStatus ADD PRIMARY KEY (ID_comanda, ID_status_comanda);
    ALTER TABLE ModificareStatus ADD CONSTRAINT fk_Modificare_STATUS_Comenzi FOREIGN KEY (ID_comanda) REFERENCES Comenzi(ID_comanda);
    ALTER TABLE ModificareStatus ADD CONSTRAINT fk_Modificare_STATUS_StatusComenzi FOREIGN KEY (ID_status_comanda) REFERENCES StatusComenzi(ID_STATUS_comanda);


CREATE TABLE ProduseComandate (
    ID_comanda NUMERIC,
    ID_produs NUMERIC,
    PRET_produs DECIMAL(10, 2),
    CANTITATE NUMERIC);
    ALTER TABLE ProduseComandate ADD PRIMARY KEY (ID_comanda, ID_produs);
    ALTER TABLE ProduseComandate ADD CONSTRAINT fk_ProduseComandatr_Produs FOREIGN KEY (ID_produs) REFERENCES Produs(ID_produs);
        ALTER TABLE ProduseComandate ADD CONSTRAINT fk_ProduseComandatr_Comenzi FOREIGN KEY (ID_comanda) REFERENCES Comenzi(ID_comanda);


CREATE TABLE Recenzii (
    ID_recenzie NUMERIC, 
    ID_client NUMERIC,
    ID_produs NUMERIC,
    RATING_recenzie INT,
    CONTINUT_recenzie TEXT,
    DATA_recenzie DATE);
	ALTER TABLE Recenzii ADD PRIMARY KEY (ID_recenzie);
    ALTER TABLE Recenzii ADD CONSTRAINT fk_Recenzii_Clienti FOREIGN KEY (ID_client) REFERENCES Clienti(ID_client);
    ALTER TABLE Recenzii ADD CONSTRAINT fk_Recenzii_Produse FOREIGN KEY (ID_produs) REFERENCES Produs(ID_produs);
