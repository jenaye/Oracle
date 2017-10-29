# TP1 Administration Oracle


# 1) Lancement de sqlplus

```
docker run -d -p 49160:22 -p 49161:1521 -p 8080:8080 -e ORACLE_ENABLE_XDB=true wnameless/oracle-xe-11g
```

* connexion a docker via ssh ( password : admin )
```
ssh root@localhost -p 49160
```
# 2) Connectez-vous en tant que system
 
```
set pause on
set pagesize 40
set linesize 100
```
```
> sqlplus
login : system
pass : oracle
```


# 3 ) Le dictionnaire de données (DD)

> a ) Quels sont les attributs de la table dict ? Quels sont les types de données de
      chaque attribut ainsi que leurs tailles ?

```
DESC dict;
```
les 2 attributs de la table sont : 
- TABLE_NAME varchar2(30)
- COMMENTS varchar2(4000)


> b ) Afficher les tuples de la table dict
```
SELECT * FROM dict ;
```

> c ) Combien y a-t-il de tables répertoriées dans la table dict ?
```
SELECT COUNT(*) FROM dict; // 2551 tupples
```

> d ) combien y a-t-il de vues commençant par "DBA/ALL/USER" ? 

```
SELECT COUNT(*) FROM dict WHERE TABLE_NAME LIKE 'DBA%'; // 703
SELECT COUNT(*) FROM dict WHERE TABLE_NAME LIKE 'ALL%'; // 339
SELECT COUNT(*) FROM dict WHERE TABLE_NAME LIKE 'USER%'; // 361
```

# 4 ) listingTables.sql
```
set serveroutput on
accept MyView prompt "Entrer le nom de la vue : "
spool /root/TP1/liste_des_tables
SELECT * FROM dict where TABLE_NAME LIKE '$MyView%';
spool off
```

pour executer le script, @/root/TP1/listingTables.sql ||  start /root/TP1/listingTables.sql

# 5 ) La vue dict 

> a ) Afficher dans un fichier script nommé liste_vues.sql , toutes les vues
      (leurs noms) dont le nom contient ‘VIEWS’. Combien y a-t-il de vues ?
      
```
SELECT TABLE_NAME FROM dict WHERE TABLE_NAME LIKE '%VIEWS%'; // 33
```

> b ) Afficher dans un fichier script nommé liste_colonnes, toutes les vues
      (leurs noms) qui contiennent la colonne (ou attribut) ‘TABLE_NAME’.
      Combien y-a-t-il de vues ?
      
```
SELECT * FROM dict_columns WHERE COLUMN_NAME LIKE '%TABLE_NAME%’; // 338
SELECT * FROM dict_columns WHERE COLUMN_NAME = 'TABLE_NAME’; // 281
```

# 6) Les objets utilisateur

> a ) Quels sont les attributs de la vue dba_catalog ?
```
desc dba_catalog 
```
3 attributs : 
 - OWNER VARCHAR2 (30)
 - TABLE_NAME VARCHAR (30)
 - TABLE_TYPE  VARCHAR(11)


> b ) Combien y-a-t-il de vues ?
```
SELECT COUNT(*) FROM dba_catalog; // 10013
```

 > c ) 
```
DESC dba_objects;  OWNER à EDITION_NAME
```

# 7) Les tables

>a  ) Combien d’attributs contient la vue dba_tables ?

```
SELECT  COUNT(*) FROM dba_tables; // 1687
```

> b ) Quel est le type et la taille de l’attribut num_rows ?

```
DESC dba_;
```

>c ) 

```
SELECT column_name AS "Name", nullable AS "Null?", concat(concat(concat(data_type,'('),data_length),')') 
as "Type" FROM dba_tab_columns WHERE TABLE_NAME = 'DBA_TABLES';
```



# 8 ) Les tablespaces 

> a ) Créer le tablespace tbs_tot

```
CREATE tablespace tbs_toto datafile '/root/TP1/tp1.dat' size 10M autoextend on
next 10M maxsize 100M;
```


# 9 ) Les utilisateurs


> a ) Créer un utilisateur

```
CREATE USER toto identified by toto default tablespace tbs_toto quota 5M ON
tbs_toto ;
```

> b ) Vérifier la création de l’utilisateur

```
exit // deconnexion system
sqlplus
> user-name : toto
> password : 
```
> c ) 

> d ) 

> e ) 


# 10 ) 

> f ) Donner à l’user toto le droit de se connecter et d’ouvrir une session

```
GRANT CREATE session, CREATE TABLE, CREATE SEQUENCE, create view to toto ;
```


> g ) Vérifier que ce privilège a bien été donné. Pour cela, on pourra consulter la vue
      dba_sys_privs ou la vue session_privs

```
SELECT * FROM dba_sys_privs;
SELECT * FROM session_privs;
```

> h ) Combien de privilèges de niveau système à l’utilisateur SYSTEM ?

```
SELECT COUNT(*) FROM dba_sys_privs WHERE grantee = ‘SYSTEM’ ; // 5
```

> i ) L’utilisateur peut connaître ces privilèges par la vue user_sys_privs ou par la
      vue session_privs. Vérifier le privilège

```
select * from user_sys_privs ;
```

> j ) Donner le privilège à toto pour créer des tables.

```
GRANT CREATE TABLE TO toto ;
```

> k ) Vérifier le privilège en étant SYSTEM puis en étant l’user totoselect * frome user_sys_privs ; (user toto)

```
SELECT * FROM user_sys_privs ; // toto
```

# 11 ) les rôles

> a ) Afficher la liste des rôles créés

```
SELECT * FROM dba_roles ;
```

> b ) Quelles sont les rôles assignés à l’utilisateur SYSTEM ?

```
SELECT * FROM user_roles_privs;
```

> c ) Créer le rôle nommé role_cnam qui permet de créer des procédures, des
      triggers et des sequences (create procedure, ...)

```
CREATE ROLE role _cnam ;
GRANT CREATE PROCEDURE, CREATE TRIGGER, CREATE SEQUENCE TO role_cnam ;
```

> d ) Afficher la liste des privilèges du rôle role_cnam

```
select * from dba_role_privs where granted_role = upper(‘role_cnam’) ;
```

> e ) Assigner le rôle role_cnam à l’utilisateur toto

```
GRANT role_cnam TO toto ;
```

> f ) Afficher la liste des rôles pour l’utilisateur toto.

```
SELECT * FROM dba_role_privs WHERE grantee = ‘toto’ ;
```

# 12 ) Les profils

> a ) Quel est le nombre de sessions autorisées du profil par défaut ?

```
SELECT * FROM dba_profiles ; // Infinie
```

> b ) Combien d’essais de connexion sont-ils autorisés du profil par défaut ?

```
par défault seulement 10
```

> c ) Créer un profil nommé profil_cnam avec les paramètres suivants :
      - Nombre de sessions actives simultanément 3
      - Temps de connexion 10 minutes
      - Durée d’inactivité avant fermeture de session 5 minutes
      - Nombre d’essais de connexion 2
      
```
CREATE PROFILE profil_cnam LIMIT sessions_per_user 3 connect_time 10 idle_time 5 failed_login_attemps 2;
```


> d ) Assigner le profil profil_cnam à l'utilisateur toto

```
ALTER USER toto PROFILE profil_cnam;
```