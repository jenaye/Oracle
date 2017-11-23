INSERT ALL
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1000,'Direction Generale',NULL)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1100,'Ressources Humaines',1000)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1101,'Service Payes',1100)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1102,'Service Recrutement',1100)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1103,'Service Formation',1100)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1200,'Comptabilite',1000)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1201,'Service Facturation',1200)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1202,'Service Fournisseur',1200)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1300,'Marketing',1000)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1400,'Production',1000)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1401,'Atelier Montage',1400)
  INTO Service (NumService,LibelleS,Hierarchie) VALUES (1402,'Atelier Finition',1400)
SELECT * FROM DUAL;

INSERT ALL
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (1,'JUGNOT','Gerard',NULL,1000)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (2,'CLAVIER','Christian',NULL,1103)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (3,'CHAZEL','Marie-Anne',NULL,1100)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (4,'LHERMITTE','Thierry',NULL,1202)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (5,'BALASKO','Josiane',NULL,1200)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (6,'MOYNOT','Bruno',NULL,1103)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (7,'CHEVIT','Maurice',NULL,1401)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (8,'BLANC','Michel',NULL,1300)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (9,'LAVANANT','Dominique',NULL,1400)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (10,'GIRAUD','Roland',NULL,1402)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (11,'SUCH','Michel',NULL,1201)
  INTO Employe (NumEmploye,Nom,Prenom,Telephone,NumService) VALUES (12,'LAPORTE','Guy',NULL,1401)
SELECT * FROM DUAL;

INSERT ALL
  INTO NatureConge (NumNatureConge,LibelleNat) VALUES (1,'Conge Annuel')
  INTO NatureConge (NumNatureConge,LibelleNat) VALUES (2,'RTT Entreprise')
  INTO NatureConge (NumNatureConge,LibelleNat) VALUES (3,'RTT Salarie')
  INTO NatureConge (NumNatureConge,LibelleNat) VALUES (4,'Recupération')
SELECT * FROM DUAL;

INSERT ALL
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (4,1,20)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (2,1,3)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (11,4,4)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (3,1,20)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (6,2,10)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (6,3,3)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (8,3,5)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (1,2,4)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (11,1,20)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (7,1,15)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (9,1,17)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (7,2,11)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (8,2,1)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (7,4,1)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (6,1,15)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (7,3,6)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (9,3,4)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (11,3,5)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (4,4,3)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (11,2,12)
  INTO DroitConge (NumEmploye,NumNatureConge,NbJours) VALUES (12,4,2)
SELECT * FROM DUAL;

INSERT ALL
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (1,TO_DATE('01/01/2017', 'DD/MM/YYYY'),TO_DATE('05/01/2017', 'DD/MM/YYYY'),1,11)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (2,TO_DATE('10/01/2017', 'DD/MM/YYYY'),TO_DATE('16/01/2017', 'DD/MM/YYYY'),4,4)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (3,TO_DATE('15/02/2017', 'DD/MM/YYYY'),TO_DATE('18/02/2017', 'DD/MM/YYYY'),1,2)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (4,TO_DATE('12/02/2017', 'DD/MM/YYYY'),TO_DATE('13/02/2017', 'DD/MM/YYYY'),2,8)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (5,TO_DATE('07/05/2017', 'DD/MM/YYYY'),TO_DATE('11/05/2017', 'DD/MM/YYYY'),2,1)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (6,TO_DATE('12/07/2017', 'DD/MM/YYYY'),TO_DATE('15/07/2017', 'DD/MM/YYYY'),3,6)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (7,TO_DATE('03/09/2017', 'DD/MM/YYYY'),TO_DATE('05/09/2017', 'DD/MM/YYYY'),1,6)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (8,TO_DATE('09/07/2017', 'DD/MM/YYYY'),TO_DATE('15/07/2017', 'DD/MM/YYYY'),1,11)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (9,TO_DATE('09/08/2017', 'DD/MM/YYYY'),TO_DATE('14/08/2017', 'DD/MM/YYYY'),3,8)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (10,TO_DATE('10/04/2017', 'DD/MM/YYYY'),TO_DATE('14/04/2017', 'DD/MM/YYYY'),1,9)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (11,TO_DATE('15/09/2017', 'DD/MM/YYYY'),TO_DATE('17/09/2017', 'DD/MM/YYYY'),1,9)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (12,TO_DATE('15/07/2017', 'DD/MM/YYYY'),TO_DATE('17/07/2017', 'DD/MM/YYYY'),2,1)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (13,TO_DATE('22/12/2017', 'DD/MM/YYYY'),TO_DATE('24/12/2017', 'DD/MM/YYYY'),4,12)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (14,TO_DATE('24/12/2017', 'DD/MM/YYYY'),TO_DATE('29/12/2017', 'DD/MM/YYYY'),1,11)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (15,TO_DATE('15/12/2017', 'DD/MM/YYYY'),TO_DATE('19/12/2017', 'DD/MM/YYYY'),1,4)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (16,TO_DATE('22/11/2017', 'DD/MM/YYYY'),TO_DATE('25/11/2017', 'DD/MM/YYYY'),3,6)
  INTO CongePris (NumConge,DateDebConge,DateFinConge,NumNatureConge,NumEmploye) VALUES (17,TO_DATE('04/12/2017', 'DD/MM/YYYY'),TO_DATE('06/12/2017', 'DD/MM/YYYY'),4,12)
SELECT * FROM DUAL;