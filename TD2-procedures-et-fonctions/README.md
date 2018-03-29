# TD2 : les procedures et les fonctions

Soient les tables `Employe, CongePris, NatureConge` 
On souhaite déterminer le pourcentage d'employés ayant pris des congés annuels.

1 ) Ecrire une procedure *insererUnEmploye* à 3 paramètres pNumEmploye, pNom, pPrenom et pNumService qui permet d'inserer un employé avec ses informations dans la table Employe.
Gérer par une exception le cas d'un employé déjà existant dans la table 

```
create or replace procedure insererUnEmploye(pNumEmployer Employe.NumEmployer%type,
                                             pNom Employe.Nom%type,
                                             pPrenom Employe.Prenom%type,
                                             pNumService Employe.NumService%type) is
    Service_Inexistant execption;
    Doublon exception;
    lNB Number;
    
    
begin
        SELECT count(*) into lNB FROM Service where NumService=pNumService;
        if lNB=0 then
            raise Service_Inexistant;  
        end if;
        
        SELECT count(*) into lNB FROM Employe where NumEmployer= pNumEployer;
        if lNB=1 then
            raise Doublon;
        end if;
        insert into Employe values(pNumEployer,pNom,pPrenom,pNumService);
end;
        exeption
            WHEN Service_Inexistant then
            dbns_out_put.put_line('le Service n '||pNumService||' n''existe pas');
            WHEN Doublon then
            dbns_out_put.put_line('l''Employe  '||pNumEployer||' existe déja');
            
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
