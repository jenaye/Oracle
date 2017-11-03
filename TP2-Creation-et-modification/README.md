# TP2 Création et modification


> 1 ) vous connecter en tant que system pour créer : Un tablespace  tbs_data pour stocker des données de la base de données, un tablespace tbs_index1 pour stocker les différents index en particullier ceux des clées primaires

```
mkdir TP2
CREATE tablespace tbs_data datafile '/root/TP2/data.dat' SIZE 10M autoextend ON next 10M maxsize 100M;
```

```
CREATE tablespace tbs_index1 datafile '/root/TP2/index.dat' SIZE 10M autoextend ON next 10M maxsize 100M;
```

> 2 ) Assigner ces 2 Tableaux à l'utilisateur toto avec un quota unlimited

```
ALTER user TOTO default tablespace TBS_DATA quota unlimited ON TBS_DATA quota unlimited ON TBS_INDEX1;
```
