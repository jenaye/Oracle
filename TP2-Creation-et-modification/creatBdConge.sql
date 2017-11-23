CREATE TABLE Service(
	NumService NUMBER(10),
	LibelleS VARCHAR2(25),
	Hierarchie NUMBER(10),
	CONSTRAINT pk_service PRIMARY KEY (NumService) using index tablespace tbs_index1,
	CONSTRAINT fk_service_employe FOREIGN KEY (Hierarchie) REFERENCES Service(NumService)
);

CREATE TABLE Employe(
	NumEmploye NUMBER(10),
	Nom VARCHAR2(25),
	Prenom VARCHAR2(25),
	Telephone NUMBER(10),
	NumService NUMBER(10),
	CONSTRAINT pk_employe PRIMARY KEY (NumEmploye) using index tablespace tbs_index1,
	CONSTRAINT fk_employe_service FOREIGN KEY (NumService) REFERENCES Service(NumService)
);

CREATE TABLE NatureConge(
	NumNatureConge NUMBER(10),
	LibelleNat VARCHAR2(25),
	CONSTRAINT pk_natureconge PRIMARY KEY (NumNatureConge)
);

CREATE TABLE DroitConge(
	NumEmploye NUMBER(10) ,
	NumNatureConge NUMBER(10) ,
	NbJours NUMBER(10),
	CONSTRAINT pk_droitc_emp_nat PRIMARY KEY (NumEmploye, NumNatureConge) using index tablespace tbs_index1,
	CONSTRAINT fk_num_employe FOREIGN KEY (NumEmploye) REFERENCES Employe (NumEmploye),
	CONSTRAINT fk_num_nature_conge FOREIGN KEY (NumNatureConge) REFERENCES NatureConge (NumNatureConge),
	CONSTRAINT ck_nb_jours CHECK (0<NbJours and NbJours<31)
);

CREATE TABLE CongePris(
	NumConge NUMBER(10),
	DateDebConge Date,
	DateFinConge Date,
	NumEmploye NUMBER(10),
	NumNatureConge NUMBER(10),
	CONSTRAINT pk_congepris PRIMARY KEY (NumConge) using index tablespace tbs_index1,
	CONSTRAINT fk_congepris_employe FOREIGN KEY (NumEmploye) REFERENCES Employe (NumEmploye),
	CONSTRAINT fk_congepris_natureconge FOREIGN KEY (NumNatureConge) REFERENCES NatureConge (NumNatureConge),
	CONSTRAINT ck_date CHECK (DateFinConge>DateDebConge)
);
