

##Interogari cu grupare și filtrare
##1.Care este media evaluării pentru fiecare produs, bazată pe recenziile primite?

rezultat <- recenzii %>%
  inner_join(produs, by = c("id_produs" = "id_produs")) %>%
  group_by(nume_produs) %>%
  summarise(Medie_Rating = mean(rating_recenzie, na.rm = TRUE)) %>%
  filter(!is.na(Medie_Rating))


##2. Care este valoare totală a clientilor care au plasat comenzi?
  
rezultat<-comenzi %>%
  inner_join(clienti, by = "id_client") %>%
  group_by(nume_client, prenume_client) %>%
  summarise(Valoare_Totala_Comenzi = sum(suma_totala, na.rm = TRUE)) %>%
  filter(Valoare_Totala_Comenzi > 0)


##Interogari cu subconsultări în clauza HAVING și/sau FROM
##3. Care este clientul cu cea mai mare valoare totală a comenzilor?


rezultat <- clienti %>%
  inner_join(comenzi, by = "id_client") %>%
  inner_join(produsecomandate, by = "id_comanda") %>%
  inner_join(produs, by = "id_produs") %>%
  group_by(id_client, nume_client, prenume_client) %>%
  summarise(Valoare_Totala_Comenzi = sum(pret_produs.x * cantitate)) %>%
  ungroup()%>%
  filter(Valoare_Totala_Comenzi == max(Valoare_Totala_Comenzi, na.rm = TRUE))


##4. Care sunt categoriile de produse și câte produse unice din fiecare categorie au fost comandate?

rezultat <- produsecomandate %>%
  distinct(id_produs) %>%
  inner_join(produs, by = "id_produs") %>%
  inner_join(categorie, by = "id_categorie") %>%
  group_by(nume_categorie) %>%
  summarise(PRODUS_COMANDAT= n_distinct(id_produs)) %>%
  filter(PRODUS_COMANDAT > 0) %>%
  arrange(desc(PRODUS_COMANDAT))



##Interogari cu expresii-tabelă și "tabele-pivot" (cu sau fără joncțiuni externe)
##5.Care este media evaluărilor produselor pe fiecare categorie?

RatingProduse <- produs %>%
  left_join(recenzii, by = "id_produs") %>%
  group_by(id_produs, nume_produs, id_categorie) %>%
  summarise(Medie_Rating = round(mean(rating_recenzie, na.rm = TRUE), 2))

rezultat <- categorie %>%
  left_join(RatingProduse, by = "id_categorie") %>%
  group_by(nume_categorie) %>%
  summarise(Medie_Rating_Categorie = round(mean(coalesce(Medie_Rating, 0)), 2)) %>%
  arrange(desc(Medie_Rating_Categorie))



##6. Câte comenzi are fiecare client și care este stadiul de procesare a comenzilor?

rezultat <- clienti %>%
  left_join(comenzi, by = "id_client") %>%
  left_join(modificarestatus, by = "id_comanda") %>%
  left_join(statuscomenzi, by = "id_status_comanda") %>%
  group_by(id_client, nume_client, prenume_client) %>%
  summarise(Noua = sum(if_else(descriere_status_comanda == "Noua", 1, 0, missing = 0)),
            In_procesare = sum(if_else(descriere_status_comanda == "In procesare", 1, 0, missing = 0)),
            Expediata = sum(if_else(descriere_status_comanda == "Expediata", 1, 0, missing = 0)),
            Finalizata = sum(if_else(descriere_status_comanda == "Finalizata", 1, 0, missing = 0)),
            Anulata = sum(if_else(descriere_status_comanda == "Anulata", 1, 0, missing = 0))) %>%
  arrange(id_client)


##Interogări  recursive
##Conform cursului, tidyverse nu are optiunea de a converti recursivitatea.
