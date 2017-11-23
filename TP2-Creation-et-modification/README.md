# TP2 Création et modification


> 1 ) vous connecter en tant que system pour créer : Un tablespace  tbs_data pour stocker des données de la base de données, un tablespace tbs_index1 pour stocker les différents index en particullier ceux des clées primaires

```
mkdir TP2
CREATE tablespace tbs_data datafile '/root/TP2/data.dat' SIZE 10M autoextend ON next 10M maxsize 100M;
```

```
CREATE tablespace tbs_index1 datafile '/root/TP2/index.dat' SIZE 10M autoextend ON next 10M maxsize 100M;
```

PS : Pour mon souci de création de fichier, la cause était les droits de l'utilisateur Oracle dans le container docker, j'ai du lui changer avec la commande 

```
chown -R oracle FOLDER/PATH
```

La 2em solution était de ne pas préciser de chemin pour l'enregistrement, et du coup faire un 
```
find / -iname "data.dat"
```
pour retrouver le fichier en question

> 2 ) Assigner ces 2 Tableaux à l'utilisateur toto avec un quota unlimited

```
ALTER user TOTO default tablespace TBS_DATA quota unlimited ON TBS_DATA quota unlimited ON TBS_INDEX1;
```

> 3 ) Soit le schéma relationnel ..  

 1 )  MCD
 
```
Voir l'image "MCD.png"
```

 2 )  Diagramme de classe
 
 3 ) Créer la structure des 5 tables
 
```
 voir le fichier creatBdConge.sql
```
 
 4 ) Quelle vue faut-il utiliser pour connaitre 
 
```
    les tables créers // user_tables
    les contraintes // user_constraints
    les index // user_indexes
```

 5 ) Afficher :  
 
 - les tables créées ainsi que les tablesspaces dans lesquels se trouvent les tables
 
```
 SELECT table_name, tablespace_name FROM user_tables;
 SELECT table_name, tablespace_name FROM all_tables;
```
 
 - les contraintes avec leur type, condition et les tables dans lesquelles se trouvent ces contraintes
 
```
SELECT constraint_name, constraint_type, search_condition, table_name FROM user_constraints;
SELECT constraint_name, constraint_type, search_condition, table_name FROM all_constraints;

```

- les index : leurs noms, leurs types, les tables, et les tablespaces dans lesquelles se trouvent les index.

```
SELECT index_name, index_type, table_name, tablespace_name FROM user_indexes;
SELECT index_name, index_type, table_name, tablespace_name FROM all_indexes;
```

6 ) Supprimer l'attribut Téléphone de la table Employe

```
ALTER TABLE Employe DROP COLUMN Telephone;
```

7 ) Créer un script nommée insertConge.sql pour remplir les 5 tables

```
Voir insertConge.sql
```

> 4 ) Mise ajour de la base de données 

 1 ) Modifier le nombre de jours de congés annuels pour l'employé LHERMITTE : il a le droit de 10 jours de congés annuels
 
```
UPDATE  DroitConge SET NbJours = 10 WHERE DroitConge.NumEmploye= (SELECT NumEmploye FROM Employe WHERE Employe.Nom = ‘LHERMITTE’) ;
```

 2 )  Modifier le nombre de jours de congés du type 3 : pour les employés qui en avaient moins de 4, il faut leur en rajouter 10
 
```
UPDATE DroitConge SET NbJours = NbJours+10 WHERE NumNatureConge = 3 AND NbJours< 4; 
``` 

 3 ) Supprimer le congé pris par l'employé 8 qui finissait le 13/02/2017
 
```
DELETE FROM CongePris WHERE NumEmploye = 8 AND DateFinConge = TO_DATE('13/02/2017', 'DD/MM/YYYY');
```

 4 ) Supprimer le congé pris par l'employé CLAVIER qui commençait le 15/02/2017
 
```
DELETE FROM CongePris WHERE  DateDebConge = TO_DATE('15/02/2017', 'DD/MM/YYYY') AND NumEmploye = (SELECT NumEmploye FROM Employe WHERE Nom = ‘CLAVIER’) ;
```