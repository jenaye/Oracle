# TP3 Requêtes

A ) Verifier la creation des index.

1 ) Nom et prenom de tous les employes par ordre alphabetique du nom 

```
SELECT Nom,Prenom FROM Employe ORDER BY Nom ASC;
```

2 ) Nom et prenom des employes dont le nom commence par un C.

```
SELECT Nom,Prenom FROM Employe WHERE Nom LIKE 'C%';
```

3 ) Nom et prenom des employes dont le nom est termine par un T

```
SELECT Nom,Prenom FROM Employe WHERE Nom LIKE '%T';
```

4 ) Nombre total d'employes

```
SELECT COUNT(*) FROM Employe;
```

5 ) Nombre total de services

```
SELECT COUNT(*) FROM Service;
```

6 ) Nom et prenom des employes travaillant dans l'atelier montage

```
SELECT Nom,Prenom FROM Employe E JOIN Service S ON S.NumService=E.NumService WHERE S.LibelleS='Atelier Montage';
```

7 ) Service nom et prenom des employes travaillant dans le service numero 1100 ou dans un des services dependant de 1100

```
SELECT Nom,Prenom,LibelleS AS Services FROM Employe E JOIN Service S ON S.NumService=e.NumService WHERE E.NumService=1100 OR S.Hierarchie=1100 ;
```

8 ) Numero de services dans lesquels travaillent strictement plus d'une personne

```
SELECT COUNT(NumService) AS nbr_Employe,Numservice FROM Employe GROUP BY NumService HAVING COUNT(NumService) > 1;
```

9 ) Libelle des services ou aucun employe n'a ete affecte

```
//
```

10 ) Libelle des services ou au moins un employe travaille

```
//
```

11 ) Nombre total de jours de congé déjà pris par employé

```
SELECT NumEmploye,SUM(DateFinConge-DateDebConge) NbJoursPris FROM CongePris GROUP BY NumEmploye ORDER BY NumEmploye;
```

12 ) Nombre total de jours de conge auxquels chaque employe a droit

```
SELECT NumEmploye,SUM(Nbjours) SommeConge FROM DroitConge GROUP BY NumEmploye;
```

13 ) Nom et prenom des employes ayant un nombre de jours de conge un nombre de saisi au clavier

```
SELECT Nom,Prenom,SUM(Nbjours) SommeConge FROM Employe E,DroitConge DC WHERE E.Numemploye=DC.NumEmploye HAVING SUM(NbJours) < 10 GROUP BY Nom,Prenom;
```

14 ) Nombre d'employes par service

```
SELECT numservice,count(numemploye) FROM employe GROUP BY numservice;
```

15 ) Nom et prenom des employes qui prennent au moins un jour de congé entre le 18/12/17 et le 26/12/17

```
SELECT NumEmploye FROM CongePris WHERE DateDebConge BETWEEN TO_DATE('18/12/2017', 'DD/MM/YYYY') AND TO_DATE('26/12/2017', 'DD/MM/YYYY') 
OR  DateFinConge between TO_DATE('18/12/2017', 'DD/MM/YYYY') and TO_DATE('26/12/2017', 'DD/MM/YYYY');
```

16 ) Nom et prenom des employes qui prennent au moins un jour de congé entre 2 dates saisies au clavier

```
//
```

17 ) Detecterle nom et prenom des employes non references dans la table DroitConge

```
SELECT NumEmploye FROM employe WHERE numemploye NOT IN (SELECT numemploye FROM droitconge);
```

18 ) Employes ayant droit a des conges pour motif de recuperation

```
SELECT DC.NumEmploye FROM DroitConge DC, NatureConge NC WHERE DC.NumNatureConge=NC.NumNatureConge AND NC.LibelleNat='Récupération';
```

19 ) Nom et prenom des employes ayant pose des conges ( eliminer les doublons )

```
SELECT Nom,Prenom FROM Employe WHERE NumEmploye IN (SELECT NumEmploye FROM CongePris) GROUP BY Nom, Prenom;
```

20 ) Structure hierarchique avec les niveaux des services

```
SELECT LibelleS FROM Service CONNECT BY Hierarchie=PRIOR NumService START WITH Hierarchie IS NULL;
```

21 ) Structure hierarchique avec les niveaux des employes

```
SELECT S.LibelleS,E.Nom,E.Prenom FROM Service S INNER JOIN Employe E on E.NumService=S.NumService CONNECT BY Hierarchie=PRIOR S.NumService START WITH Hierarchie IS NULL;
```

22 ) Nombre d'employés pour chaque niveau de service

```
SELECT level,count(E.NumService) nbpersonnel FROM Service S INNER JOIN Employe E on E.NumService=S.NumService CONNECT BY Hierarchie=PRIOR S.NumService START WITH Hierarchie IS NULL GROUP BY level;
```

23 ) Créer vue VEmploye

```
CREATE VIEW VEmploye AS	SELECT NumEmploye,Nom,Prenom FROM Employe ;
```

24 ) Modification du nom de l'employé 11

```
UPDATE VEmploye SET Nom= ‘jenaye’ WHERE NumEmploye=’11’ ;
```

25 ) Création Vaffection

```
CREATE VIEW VAffectation AS SELECT NumEmploye,Nom,Prenom,LibelleS FROM Employe E INNER JOIN Service S ON S.NumService=E.NumService;
```

26 ) 

27 ) 