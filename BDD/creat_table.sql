#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: salle
#------------------------------------------------------------

CREATE TABLE salle(
        salle_num         Int  Auto_increment  NOT NULL ,
        salle_nom         Varchar (50) NOT NULL ,
        salle_places      Int NOT NULL ,
        salle_informatise Bool NOT NULL
	,CONSTRAINT salle_PK PRIMARY KEY (salle_num)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: utilisateur
#------------------------------------------------------------

CREATE TABLE utilisateur(
        utilisateur_num            Int  Auto_increment  NOT NULL ,
        utilisateur_identifiant    Varchar (30) NOT NULL ,
        utilisateur_mdp            Varchar (40) NOT NULL ,
        utilisateur_admin          Bool NOT NULL ,
        ligue_num                  Int NOT NULL ,
        ligue_num_est_responssable Int NOT NULL
	,CONSTRAINT utilisateur_PK PRIMARY KEY (utilisateur_num)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ligue
#------------------------------------------------------------

CREATE TABLE ligue(
        ligue_num                        Int  Auto_increment  NOT NULL ,
        ligue_nom                        Varchar (50) NOT NULL ,
        ligue_sport                      Varchar (50) NOT NULL ,
        ligue_tel                        Varchar (10) NOT NULL ,
        utilisateur_num                  Int NOT NULL ,
        utilisateur_num_est_responssable Int NOT NULL
	,CONSTRAINT ligue_PK PRIMARY KEY (ligue_num)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: reservation
#------------------------------------------------------------

CREATE TABLE reservation(
        reservation_num     Int  Auto_increment  NOT NULL ,
        reservation_demande Datetime NOT NULL ,
        reservation_debut   Datetime NOT NULL ,
        reservation_fin     Datetime NOT NULL ,
        ligue_num           Int NOT NULL ,
        salle_num           Int NOT NULL
	,CONSTRAINT reservation_PK PRIMARY KEY (reservation_num)
)ENGINE=InnoDB;




ALTER TABLE utilisateur
	ADD CONSTRAINT utilisateur_ligue0_FK
	FOREIGN KEY (ligue_num)
	REFERENCES ligue(ligue_num);

ALTER TABLE utilisateur
	ADD CONSTRAINT utilisateur_ligue1_FK
	FOREIGN KEY (ligue_num_est_responssable)
	REFERENCES ligue(ligue_num);

ALTER TABLE utilisateur 
	ADD CONSTRAINT utilisateur_ligue0_AK 
	UNIQUE (ligue_num);

ALTER TABLE utilisateur 
	ADD CONSTRAINT utilisateur_ligue1_AK 
	UNIQUE (ligue_num_est_responssable);

ALTER TABLE ligue
	ADD CONSTRAINT ligue_utilisateur0_FK
	FOREIGN KEY (utilisateur_num)
	REFERENCES utilisateur(utilisateur_num);

ALTER TABLE ligue
	ADD CONSTRAINT ligue_utilisateur1_FK
	FOREIGN KEY (utilisateur_num_est_responssable)
	REFERENCES utilisateur(utilisateur_num);

ALTER TABLE ligue 
	ADD CONSTRAINT ligue_utilisateur0_AK 
	UNIQUE (utilisateur_num);

ALTER TABLE ligue 
	ADD CONSTRAINT ligue_utilisateur1_AK 
	UNIQUE (utilisateur_num_est_responssable);

ALTER TABLE reservation
	ADD CONSTRAINT reservation_ligue0_FK
	FOREIGN KEY (ligue_num)
	REFERENCES ligue(ligue_num);

ALTER TABLE reservation
	ADD CONSTRAINT reservation_salle1_FK
	FOREIGN KEY (salle_num)
	REFERENCES salle(salle_num);
