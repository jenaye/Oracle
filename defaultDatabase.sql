CREATE TABLESPACE TBS_DATA DATAFILE 'data.dat' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 100M;

CREATE TABLESPACE TBS_INDEX1 DATAFILE 'index.dat' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 100M;

CREATE TABLE Service
(
  NumService VARCHAR2(8),
  LibelleS   VARCHAR2(50),
  Hierarchie VARCHAR2(8),
  CONSTRAINT pk_service PRIMARY KEY (NumService)
    USING INDEX TABLESPACE TBS_INDEX1
);

CREATE TABLE Employe
(
  NumEmploye VARCHAR2(8),
  Nom        VARCHAR2(50),
  Prenom     VARCHAR2(50),
  NumService VARCHAR2(8),
  CONSTRAINT pk_employe PRIMARY KEY (NumEmploye)
    USING INDEX TABLESPACE TBS_INDEX1
);

CREATE TABLE NatureConge
(
  NumNatureConge VARCHAR2(8),
  LibelleNat     VARCHAR2(50),
  CONSTRAINT pk_natureConge PRIMARY KEY (NumNatureConge)
    USING INDEX TABLESPACE TBS_INDEX1
);

CREATE TABLE DroitConge
(
  NumEmploye     VARCHAR2(8),
  NumNatureConge VARCHAR2(8),
  NbJours        NUMBER(2),
  CONSTRAINT pk_droitConge PRIMARY KEY (NumEmploye, NumNatureConge)
    USING INDEX TABLESPACE TBS_INDEX1
);

CREATE TABLE CongePris
(
  NumConge       VARCHAR2(8),
  DateDebConge   DATE,
  DateFinConge   DATE,
  NumNatureConge VARCHAR2(8),
  NumEmploye     VARCHAR2(8),
  CONSTRAINT pk_congePris PRIMARY KEY (NumConge)
    USING INDEX TABLESPACE TBS_INDEX1,
  CONSTRAINT chk_dateConge CHECK (DateDebConge < DateFinConge)
);

ALTER TABLE Service
  ADD (CONSTRAINT fk_hierarchie FOREIGN KEY (Hierarchie) REFERENCES Service (NumService));

ALTER TABLE Employe
  ADD (CONSTRAINT fk_numService FOREIGN KEY (NumService) REFERENCES Service (NumService));

ALTER TABLE DroitConge
  ADD (CONSTRAINT fk_numEmploye FOREIGN KEY (NumEmploye) REFERENCES Employe (NumEmploye),
  CONSTRAINT fk_numNatureConge FOREIGN KEY (NumNatureConge) REFERENCES NatureConge (NumNatureConge));

ALTER TABLE CongePris
  ADD (CONSTRAINT fk_cp_numNatureConge FOREIGN KEY (NumNatureConge) REFERENCES NatureConge (NumNatureConge),
  CONSTRAINT fk_cp_numEmploye FOREIGN KEY (NumEmploye) REFERENCES Employe (NumEmploye));

INSERT INTO Service VALUES (1000, 'Direction Générale', NULL);
INSERT INTO Service VALUES (1100, 'Ressources Humaines', 1000);
INSERT INTO Service VALUES (1101, 'Service Payes', 1100);
INSERT INTO Service VALUES (1102, 'Service Recrutement', 1100);
INSERT INTO Service VALUES (1103, 'Service Formation', 1100);
INSERT INTO Service VALUES (1200, 'Comptabilité', 1000);
INSERT INTO Service VALUES (1201, 'Service Facturation', 1200);
INSERT INTO Service VALUES (1202, 'Service Fournisseur', 1200);
INSERT INTO Service VALUES (1300, 'Marketing', 1000);
INSERT INTO Service VALUES (1400, 'Production', 1000);
INSERT INTO Service VALUES (1401, 'Atelier Montage', 1400);
INSERT INTO Service VALUES (1402, 'Atelier Finition', 1400);

INSERT INTO Employe VALUES (1, 'JUGNOT', 'Gérard', 1000);
INSERT INTO Employe VALUES (2, 'CLAVIER', 'Christian', 1103);
INSERT INTO Employe VALUES (3, 'CHAZEL', 'Marie-Anne', 1100);
INSERT INTO Employe VALUES (4, 'LHERMITTE', 'Thierry', 1202);
INSERT INTO Employe VALUES (5, 'BALASKO', 'Josiane', 1200);
INSERT INTO Employe VALUES (6, 'MOYNO', 'Bruno', 1103);
INSERT INTO Employe VALUES (7, 'CHEVIT', 'Maurice', 1401);
INSERT INTO Employe VALUES (8, 'BLANC', 'Michel', 1300);
INSERT INTO Employe VALUES (9, 'LAVANANT', 'Dominique', 1400);
INSERT INTO Employe VALUES (10, 'GIRAUD', 'Roland', 1402);
INSERT INTO Employe VALUES (11, 'SUCH', 'Michel', 1201);
INSERT INTO Employe VALUES (12, 'LAPORTE', 'Guy', 1401);

INSERT INTO NatureConge VALUES (1, 'Congé Annuel');
INSERT INTO NatureConge VALUES (2, 'RTT Entreprise');
INSERT INTO NatureConge VALUES (3, 'RTT Salarié');
INSERT INTO NatureConge VALUES (4, 'Récupération');

INSERT INTO DroitConge VALUES (4, 1, 20);
INSERT INTO DroitConge VALUES (2, 1, 3);
INSERT INTO DroitConge VALUES (11, 4, 4);
INSERT INTO DroitConge VALUES (3, 1, 20);
INSERT INTO DroitConge VALUES (6, 2, 10);
INSERT INTO DroitConge VALUES (6, 3, 3);
INSERT INTO DroitConge VALUES (8, 3, 5);
INSERT INTO DroitConge VALUES (1, 2, 4);
INSERT INTO DroitConge VALUES (11, 1, 20);
INSERT INTO DroitConge VALUES (7, 1, 15);
INSERT INTO DroitConge VALUES (9, 1, 17);
INSERT INTO DroitConge VALUES (7, 2, 11);
INSERT INTO DroitConge VALUES (8, 2, 1);
INSERT INTO DroitConge VALUES (7, 4, 1);
INSERT INTO DroitConge VALUES (6, 1, 15);
INSERT INTO DroitConge VALUES (7, 3, 6);
INSERT INTO DroitConge VALUES (9, 3, 4);
INSERT INTO DroitConge VALUES (11, 3, 5);
INSERT INTO DroitConge VALUES (4, 4, 3);
INSERT INTO DroitConge VALUES (11, 2, 12);
INSERT INTO DroitConge VALUES (12, 4, 2);

INSERT INTO CongePris VALUES (1, '01-JAN-2017', '05-JAN-2017', 1, 11);
INSERT INTO CongePris VALUES (2, '10-JAN-2017', '16-JAN-2017', 4, 4);
INSERT INTO CongePris VALUES (3, '15-FEB-2017', '18-FEB-2017', 1, 2);
INSERT INTO CongePris VALUES (4, '12-FEB-2017', '13-FEB-2017', 2, 8);
INSERT INTO CongePris VALUES (5, '07-MAY-2017', '11-MAY-2017', 2, 1);
INSERT INTO CongePris VALUES (6, '12-JUL-2017', '15-JUL-2017', 3, 6);
INSERT INTO CongePris VALUES (7, '03-SEP-2017', '05-SEP-2017', 1, 6);
INSERT INTO CongePris VALUES (8, '09-JUL-2017', '15-JUL-2017', 1, 11);
INSERT INTO CongePris VALUES (9, '09-AUG-2017', '14-AUG-2017', 3, 8);
INSERT INTO CongePris VALUES (10, '10-APR-2017', '14-APR-2017', 1, 9);
INSERT INTO CongePris VALUES (11, '15-SEP-2017', '17-SEP-2017', 1, 9);
INSERT INTO CongePris VALUES (12, '15-JUL-2017', '17-JUL-2017', 2, 1);
INSERT INTO CongePris VALUES (13, '22-DEC-2017', '24-DEC-2017', 4, 12);
INSERT INTO CongePris VALUES (14, '24-DEC-2017', '29-DEC-2017', 1, 11);
INSERT INTO CongePris VALUES (15, '15-DEC-2017', '19-DEC-2017', 1, 4);
INSERT INTO CongePris VALUES (16, '22-NOV-2017', '25-NOV-2017', 3, 6);
INSERT INTO CongePris VALUES (17, '04-DEC-2017', '06-DEC-2017', 4, 12);
