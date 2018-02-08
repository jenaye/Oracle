# TD1 : les blocs anonymes et les curseurs

Soit la base de données ci-dessous de gestion d'une chaines d'hypermarchés

```
Hypermarcher(NumHyper, Nom,AdrRue,Ville,CodePostal,NumDirecteur)
Rayon(NumRayon, Nom,Descriptif,ChiffreAffaire,NumHyper,NumResponsable)
Produit(NumProd,Libelle,NumRayon,PrixUnitaire,Unite,QuantiteStockHyper)
Employe(NumEmp,Nom,Prenom,NumHyper)
```

1) Ecrire un bloc PL/SQL qui lit au clavier les champs d'un Employé puis insière cet employé dans la table Employés et affiche le message "Employé inséré"

```
DECLARE 
	-- L_EMP (record)
	L_Emp Employe%ROWTYPE;
	NumEmp Employe%TYPE;
	Nom Employe%TYPE;
	Prenom Employe%TYPE;
	NumHyper Employe%TYPE;

	BEGIN 
		L_Emp.NumEmp := '&Emp.NumEmp';
		L_Emp.Nom := '&Emp.Nom';
		L_Emp.Prenom := '&Emp.Prenom';
		L_Emp.NumHyper := &Emp.NumHyper;
		INSERT INTO Employe VALUES(L_Emp.NumEmp, L_Emp.Nom, L_Emp.Prenom, L_Emp.NumHyper);
	END;
	/
```
