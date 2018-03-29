# TD2 : les procedures et les fonctions

Soient les tables `Employe, CongePris, NatureConge` 
On souhaite déterminer le pourcentage d'employés ayant pris des congés annuels.

1 ) Ecrire une procedure *insererUnEmploye* à 3 paramètres pNumEmploye, pNom, pPrenom et pNumService qui permet d'inserer un employé avec ses informations dans la table Employe.
Gérer par une exception le cas d'un employé déjà existant dans la table 

```
 CREATE OR REPLACE PROCEDURE insertEmploye(pNumEmploye Employe.NumEmploye%TYPE,
                                        pNomEmploye Employe.NomEmploye%TYPE,
                                        pPrenomEmploye Employe.PrenomEmploye,
                                        pNumService Employe.NumService%TYPE) IS

Service_Inexistant EXCEPTION;
lNb Number;
lLibelleS Service.libelleS%TYPE;

BEGIN
    -- DUP_VAL_ON_INDEX
    SELECT COUNT (*) INTO lNb FROM Service WHERE NumService = pNumService;

    IF lNb = 0 THEN
        RAISE Service_Inexistant;
    ENDIF;

    INSERT INTO Employe (NumEmploye, NomEmploye, PrenomEmploye, Service) VALUES (pNumEmploye, pNomEmploye, pPrenomEmploye, pNumService);


EXCEPTION
    WHEN Service_Inexistant THEN
        dbms_output.put_line("Service inexistant : || pNumService ||");
END;
/
```


2 ) Ecrire une procédure AfficherUnEmploye à un paramètre pNumEmploye permettant d'afficher les informations ( Nom, Prénom, Nom du service dans lequel il travail ) concernant un employé de n ° pNumEmploye.
Gérer le cas ou le numéro d'employé n'existe pas avec une exception

```
create or replace procedure afficherUnEmploye(pNumEmploye Employe.NumEmploye%type)is
    lNom Employe.Nom%type;
    lPrenom Employe.Prenom%type;
    lNomService Service.NomService%type;
    begin
        select E.Nom, E.Prenom, S.NomService into lNom,lPrenom,lNomService from Employe E,Service S where E.NumService=S.NumService and NumEmploye=pNumEmploye;
    Exception
        when no_data_found then dbns_output.put_line("pas trouvé")
    end;
    /

```


3 ) Ecrire une procedure AfficheEmployeService sans paramètre affichant pour chaque service, les employés étant le suivant :

```
No Service : .....   Nom Service : ....
	Nom Prenom
	Nom Prenom


No Service : .....   Nom Service : ....
	Nom Prenom
	Nom Prenom
```

```
create or replace procedure afficherEmployeService is
    cursor afficherEmployeDecroissant IS SELECT Nom, Prenom,NumService  FROM Employe ORDER BY Nom DESC;
    cursor afficherService IS SELECT NumService,NomService  FROM Service ORDER BY NomService;
    begin
        for serv in afficherService loop
            dbms_output.put_line (serv.NumServicem || serv.NomService);
            for enrg in afficherEmployeDecroissant loop
                if serv.NumService = enrg.NumService
                    dbms_output.put_line (enrg.Nom || enrg.Prenom);
                end if:
            end loop;
    end;
    /

```

Il existe une autre façon de faire : 

```
create or replace procedure afficherEmployeService is
    cursor afficherEmployeDecroissant(pNumService Service.NumService%type) IS SELECT Nom, Prenom,NumService  FROM Employe where NumService=pNumservice ORDER BY Nom DESC;
    cursor afficherService IS SELECT NumService,NomService  FROM Service ORDER BY NomService;
    begin
        for serv in afficherService loop
            dbms_output.put_line (serv.NumServicem || serv.NomService);
            for enrg in afficherEmployeDecroissant(serv.NumServicem) loop
                    dbms_output.put_line (enrg.Nom || enrg.Prenom);
                end if:
            end loop;
    end;
    /

```
