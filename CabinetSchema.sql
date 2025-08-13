drop table cbMedic cascade constraints;
drop table cbProgramare cascade constraints;
drop table cbReteta cascade constraints;
drop table cbSpecialitate cascade constraints;
drop table cbGrad cascade constraints;


CREATE TABLE cbReteta(
cnp CHAR(13) NOT NULL,   -- CNP pacient
medicament VARCHAR2(30), -- DENUMIRE medicament
doza_zi VARCHAR2(20),     -- MOD administrare
durata_zile NUMBER(2),   -- NUMAR zile de administrare
CONSTRAINT reteta_pk PRIMARY KEY(cnp)
);

CREATE TABLE cbSpecialitate(
codSpec VARCHAR2(20) NOT NULL, -- ID specialitate
denumire VARCHAR2(40),         -- DENUMIRE specialitate
coefPlata NUMBER(10,1),          -- coeficient de plata
CONSTRAINT spec_pk PRIMARY KEY(codSpec)
);

CREATE TABLE cbGrad(
codGrad CHAR(1) NOT NULL,  -- ID grad
denumire VARCHAR2(30),     -- DENUMIRE grad
tarif NUMBER(3),           -- TARIF consultatie
CONSTRAINT grad_pk PRIMARY KEY(codGrad)
);

CREATE TABLE cbMedic(
medID CHAR(4) NOT NULL,  -- ID medic
nume VARCHAR2(40),       -- NUME medic
codSpec VARCHAR2(20) NOT NULL,    -- ID specialitate
codGrad CHAR(1) NOT NULL,         -- ID grad 
CONSTRAINT medic_pk PRIMARY KEY(medID),
CONSTRAINT spec_fk  FOREIGN KEY (codSpec) REFERENCES cbSpecialitate(codSpec) on delete cascade,
CONSTRAINT grad_fk  FOREIGN KEY (codGrad) REFERENCES cbGrad(codGrad) on delete cascade
);

CREATE TABLE cbProgramare(
codPro CHAR(5) NOT NULL,      -- ID programare
dataP DATE,                   -- DATA programarii
cnp CHAR(13) NOT NULL,        -- CNP pacient
nume VARCHAR2 (40),           -- NUME pacient
medID CHAR(4) NOT NULL,       -- ID medic
cabinet CHAR(4),              -- NUME sala cabinet
CONSTRAINT prog_pk PRIMARY KEY(codPro),
CONSTRAINT medic_fk  FOREIGN KEY (medID) REFERENCES cbMedic(medID) on delete cascade,
CONSTRAINT reteta_fk  FOREIGN KEY (cnp) REFERENCES cbReteta(cnp) on delete cascade
);
