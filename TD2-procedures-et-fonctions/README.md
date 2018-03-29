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


```
