-- CREATE DATABASE aeroporto;

-- USE aeroporto;

CREATE TABLE tbl_admin(
	pk_IDadmin		INT PRIMARY KEY AUTO_INCREMENT,
    name_admin		VARCHAR(60)  NOT NULL,
    email_admin		VARCHAR(120) NOT NULL,
    password_admin  VARCHAR(30)  NOT NULL
    
);

CREATE TABLE tbl_employer(
	pk_IDemployer	INT PRIMARY KEY AUTO_INCREMENT,
    name_employer	VARCHAR(60)  NOT NULL,
    cpf_employer	VARCHAR(11)  NOT NULL,
    phone_employer	INT(13)		 NOT NULL,
    email_employer	VARCHAR(120) NOT NULL,
    prof_employer	VARCHAR(60)  NOT NULL

);

CREATE TABLE tbl_airplane(
	pk_IDairplane	INT PRIMARY KEY AUTO_INCREMENT,
    name_airplane	VARCHAR(60)  NOT NULL,
    agency_airplane VARCHAR(60)	 NOT NULL
    
);

CREATE TABLE tbl_airport(
	pk_IDairport	 INT PRIMARY KEY AUTO_INCREMENT,
    name_airport	 VARCHAR(60)  NOT NULL,
    cnpj_airport 	 CHAR(14)     NOT NULL,
	adress_airport	 VARCHAR(60)  NOT NULL,
    city_airport	 CHAR(30)	  NOT NULL,
    state_airport	 CHAR(2)	  NOT NULL
    
);

CREATE TABLE tbl_client(
	pk_IDclient		INT PRIMARY KEY AUTO_INCREMENT,
    name_client		VARCHAR(60)  NOT NULL,
    cpf_client 		CHAR(11)     NOT NULL,
    rg_client		CHAR(9),    
    phone_client	CHAR(13)	 NOT NULL,
    birth_cliente	DATE 		 NOT NULL,
    adress_client	VARCHAR(120) NOT NULL,
    adressC_client	VARCHAR(120),
    email_client	VARCHAR(120) NOT NULL,
    password_client VARCHAR(30)  NOT NULL
    
);

CREATE TABLE tbl_flight(
	pk_IDflight 	 	 INT PRIMARY KEY AUTO_INCREMENT,
    
    fk_boarding_airport  INT(11),
    fk_landing_airport	 INT(11),
    
    fk_pilot			 INT(11),
    fk_copilot			 INT(11),
    fk_airplane			 INT(11),
    
	FOREIGN KEY(fk_boarding_airport) REFERENCES tbl_airport(pk_IDairport),
    FOREIGN KEY(fk_landing_airport)  REFERENCES tbl_airport(pk_IDairport),
    
    FOREIGN KEY(fk_pilot) 			 REFERENCES tbl_employer(pk_IDemployer),
	FOREIGN KEY(fk_copilot) 		 REFERENCES tbl_employer(pk_IDemployer),
    
	FOREIGN KEY(fk_airplane) 	     REFERENCES tbl_airplane(pk_IDairplane)
    
);

CREATE TABLE tbl_ticket(
	fk_client			 INT(11),
    fk_airplane			 INT(11),
    seat				 INT NOT NULL,
    
	FOREIGN KEY(fk_client)  	     REFERENCES tbl_client(pk_IDclient),
	FOREIGN KEY(fk_airplane) 	     REFERENCES tbl_airplane(pk_IDairplane)    
);

insert into tbl_admin(name_admin, email_admin, password_admin) 
values(
	'Erica Lelis',
    'lls@gmail.com',
    '12345'
);