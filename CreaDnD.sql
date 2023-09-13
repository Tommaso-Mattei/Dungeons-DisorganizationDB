BEGIN work;

CREATE SCHEMA DnD;

CREATE TYPE DnD.LocTypes AS ENUM('Piano Dimensionale', 'Pianeta', 'Continente', 'Stato', 'Regione', 'Citta', 'Villaggio', 'Quartiere', 'Struttura');

CREATE TYPE DnD.Rarities AS ENUM('Comune','Non Comune','Raro','Molto Raro','Leggendario','Artefatto');

CREATE TYPE DnD.Sizes AS ENUM('Molto Piccolo', 'Piccolo', 'Medio','Grande','Enorme','Mastodontico');

CREATE TYPE DnD.CastTime AS ENUM('Azione','Azione Bonus','Reazione','Rituale');

CREATE TYPE DnD.MagicSchools AS ENUM('Abiurazione','Ammaliamento','Illusione','Divinazione','Evocazione','Invocazione','Necromanzia','Dunamanzia');

CREATE DOMAIN DnD.CF AS char(16);

CREATE DOMAIN DnD.Stats AS char(12);


CREATE DOMAIN DnD.Level AS REAL
    CHECK (value >0 AND value <21);

CREATE DOMAIN DnD.SpellLevel AS SMALLINT
    CHECK (value >=0 AND value <10);
    
CREATE TABLE DnD.Personaggi(
    id varchar(30) UNIQUE NOT NULL,
    Nome varchar(30) NOT NULL,
    Cognome varchar(30),
    Patria varchar(30),
    Compleanno date,
    hp SMALLINT NOT NULL,
    status boolean NOT NULL,
    Statistiche DnD.Stats NOT NULL,
    cr SMALLINT,
    XP Integer NOT NULL,
    Livello DnD.Level,
    pc boolean NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE DnD.Giocatori(
    CodiceFiscale DnD.CF UNIQUE NOT NULL,
    Nome varchar(30) NOT NULL,
    Cognome varchar(30) NOT NULL,
    DataDiNascita date NOT NULL,
    PRIMARY KEY(CodiceFIscale)
);

CREATE TABLE DnD.ArchiNarrativi(
    Nome varchar(30) UNIQUE NOT NULL,
    DataInizio date NOT NULL,
    DataFine date,
    PRIMARY KEY(Nome)
);

CREATE TABLE DnD.Sessioni(
    Numero BIGSERIAL UNIQUE NOT NULL,
    Data date NOT NULL,
    Luogo varchar(100) NOT NULL,
    Titolo varchar(60) NOT NULL,
    PRIMARY KEY(Numero)
);

CREATE TABLE DnD.Gruppi(
    Nome varchar(60) NOT NULL,
    DataFondazione date NOT NULL,
    NMax SMALLINT NOT NULL DEFAULT 32000,
    Grado SMALLINT,
    Party boolean NOT NULL,
    UNIQUE(Nome,DataFOndazione),
    PRIMARY KEY(Nome,DataFOndazione)
);

CREATE TABLE DnD.Luoghi(
    Nome varchar(100) UNIQUE NOT NULL,
    Tipo DnD.LocTypes NOT NULL,
    PRIMARY KEY(Nome)
);

CREATE TABLE DnD.Eventi(
    Nome varchar(100) NOT NULL,
    Data date NOT NULL,
    UNIQUE(Nome,Data),
    PRIMARY KEY(Nome,Data)
);

CREATE TABLE DnD.Oggetti(
    Nome varchar(50) UNIQUE NOT NULL,
    Peso real NOT NULL,
    Prezzo real,
    Attunement boolean NOT NULL,
    Rarita DnD.Rarities,
    Restrizioni varchar(280),
    Magia boolean NOT NULL,
    PRIMARY KEY(Nome)
);

CREATE TABLE DnD.Background(
    Nome varchar(50) UNIQUE NOT NULL,
    Linguaggio varchar(30) NOT NULL,
    Feature varchar(280) NOT NULL,
    PRIMARY KEY(Nome)
);

CREATE TABLE DnD.Abilita(
    Nome varchar(35) UNIQUE NOT NULL,
    Recupero boolean,
    Raggio SMALLINT,
    Usi smallint NOT NULL,
    PorS boolean NOT NULL,
    PRIMARY KEY(Nome)
);

CREATE TABLE DnD.Razze(
    Nome varchar(30) UNIQUE NOT NULL,
    Grandezza DnD.Sizes NOT NULL,
    Maturazione SMALLINT NOT NULL,
    AspettativaDiVita SMALLINT NOT NULL,
    Linguaggio varchar(30) NOT NULL,
    Velocita SMALLINT NOT NULL,
    PRIMARY KEY(Nome)
);

CREATE TABLE DnD.Fonti(
    Nome varchar(50) UNIQUE NOT NULL,
    DataUscita date,
    PRIMARY KEY(Nome)
);

CREATE TABLE DnD.Classi(
    Nome varchar(30) UNIQUE NOT NULL,
    Requisiti varchar(280) NOT NULL,
    PRIMARY KEY(Nome)
);

CREATE TABLE DnD.Incantesimi(
    Nome varchar(40) UNIQUE NOT NULL,
    Livello DnD.SpellLevel NOT NULL,
    TempoDiLancio DnD.CastTime NOT NULL,
    Raggio SMALLINT NOT NULL,
    Durata real NOT NULL,
    Scuola DnD.MagicSchools NOT NULL,
    PRIMARY KEY(Nome)
);

CREATE TABLE DnD.Debiti(
    Debitore varchar(30) NOT NULL,
    Creditore varchar(30) NOT NULL,
    Quantita real NOT NULL,
    UNIQUE(Debitore,Creditore),
    PRIMARY KEY(Debitore,Creditore)
);

CREATE TABLE DnD.Adesione(
    Personaggio varchar(30) NOT NULL,
    Evento varchar(100) NOT NULL,
    Data date NOT NULL,
    UNIQUE(Personaggio,Evento,Data),
    PRIMARY KEY(Personaggio,Evento,Data)
);

CREATE TABLE DnD.Presenza(
    Personaggio varchar(30) UNIQUE NOT NULL,
    Luogo varchar(100) NOT NULL,
    PRIMARY KEY(Personaggio)

);

CREATE TABLE DnD.Attunement(
    Personaggio varchar(30) NOT NULL,
    Oggetto varchar(50) NOT NULL,
    UNIQUE(Personaggio,Oggetto),
    PRIMARY KEY(Personaggio,Oggetto)
);

CREATE TABLE DnD.Origine_P_R(
    Personaggio varchar(30) UNIQUE NOT NULL,
    Razza varchar(30) NOT NULL,
    PRIMARY KEY(Personaggio)
);

CREATE TABLE DnD.Studiare(
    Personaggio varchar(30) NOT NULL,
    Incantesimo varchar(40) NOT NULL,
    UNIQUE(Personaggio,Incantesimo),
    PRIMARY KEY(Personaggio, Incantesimo)
);

CREATE TABLE DnD.Inventario(
    Personaggio varchar(30) NOT NULL,
    Oggetto varchar(50) NOT NULL,
    UNIQUE(Personaggio,Oggetto),
    PRIMARY KEY(Personaggio,Oggetto)
);

CREATE TABLE DnD.Passato(
    Personaggio varchar(30) UNIQUE NOT NULL,
    Background varchar(50) NOT NULL,
    PRIMARY KEY(Personaggio)
);

CREATE TABLE DnD.Affiliazione(
    Personaggio varchar(30) NOT NULL,
    Gruppo varchar(60) NOT NULL,
    DataFondazione date NOT NULL,
    UNIQUE(Personaggio,Gruppo,DataFondazione),
    PRIMARY KEY(Personaggio, Gruppo,DataFondazione)
);

CREATE TABLE DnD.Dove(
    Luogo varchar(100) NOT NULL,
    Evento varchar(100) NOT NULL,
    Data date NOT NULL,
    UNIQUE(Luogo,Evento,Data),
    PRIMARY KEY(Luogo,Evento,Data)
);

CREATE TABLE DnD.Effetto(
    Evento varchar(100) NOT NULL,
    Oggetto varchar(50) NOT NULL,
    Data date NOT NULL,
    UNIQUE(Evento,Oggetto,Data),
    PRIMARY KEY(Evento,Oggetto,Data)
);

CREATE TABLE DnD.Avvenimento(
    Evento varchar(100) NOT NULL,
    Sessione Integer NOT NULL,
    Data date NOT NULL,
    UNIQUE(Evento,Sessione,Data),
    PRIMARY KEY(Evento,Sessione,Data)
);

CREATE TABLE DnD.Quando(
    Evento varchar(100) NOT NULL,
    ArcoNarrativo varchar(30) NOT NULL,
    Data date NOT NULL,
    UNIQUE(Evento,Data),
    PRIMARY KEY(Evento,Data)
);

CREATE TABLE DnD.FarParte(
    Evento varchar(100) NOT NULL,
    Gruppo varchar(60) NOT NULL,
    Data date NOT NULL,
    DataFondazione date NOT NULL,
    UNIQUE(Evento,Gruppo,Data,DataFondazione),
    PRIMARY KEY(Evento,Gruppo,Data,DataFondazione)
);

CREATE TABLE DnD.Giocare(
    Giocatore DnD.CF NOT NULL,
    Sessione Integer NOT NULL,
    UNIQUE(Giocatore, Sessione),
    PRIMARY KEY(Giocatore, Sessione)
);

CREATE TABLE DnD.Episodi(
    ArcoNarrativo varchar(30) NOT NULL,
    Sessione Integer UNIQUE NOT NULL,
    PRIMARY KEY(Sessione)
);

CREATE TABLE DnD.Riguardare(
    Gruppo varchar(60) NOT NULL,
    DataFondazione date NOT NULL,
    Sessione Integer NOT NULL,
    UNIQUE(Sessione,Gruppo,DataFondazione),
    PRIMARY KEY(Sessione,Gruppo,DataFondazione)
);

CREATE TABLE DnD.Visita(
    Sessione Integer NOT NULL,
    Luogo Varchar(30) NOT NULL,
    UNIQUE(Sessione,Luogo),
    PRIMARY KEY(Sessione, Luogo)
);

CREATE TABLE DnD.Posizione(
    Oggetto varchar(50) NOT NULL,
    Luogo varchar(100) NOT NULL,
    UNIQUE(Oggetto, Luogo),
    PRIMARY KEY(Oggetto, Luogo)
);

CREATE TABLE DnD.Dono(
    Oggetto varchar(50) NOT NULL,
    Abilita varchar(35) NOT NULL,
    UNIQUE(Oggetto, Abilita),
    PRIMARY KEY(Oggetto, Abilita)
);

CREATE TABLE DnD.Sviluppo(
    Classe varchar(30) NOT NULL,
    Abilita varchar(35) NOT NULL,
    UNIQUE(Classe,Abilita),
    PRIMARY KEY(Classe,Abilita)
);

CREATE TABLE DnD.Area(
    Esterno varchar(100) NOT NULL,
    Interno varchar(100) UNIQUE NOT NULL,
    PRIMARY KEY(Esterno,Interno)
);

CREATE TABLE DnD.Componenti(
    Incantesimo varchar(40) NOT NULL,
    Oggetto varchar(50) NOT NULL,
    UNIQUE(Incantesimo,Oggetto),
    PRIMARY KEY(Incantesimo,Oggetto)
);

CREATE TABLE DnD.Conoscenza(
    Incantesimo varchar(40) NOT NULL,
    Classe varchar(30) NOT NULL,
    UNIQUE(Incantesimo,Classe),
    PRIMARY KEY(Incantesimo,Classe)
);

CREATE TABLE DnD.Conferire(
    Background varchar(50) NOT NULL,
    Abilita varchar(35) NOT NULL,
    UNIQUE(Background,Abilita),
    PRIMARY KEY(Background,Abilita)
);

CREATE TABLE DnD.Equipaggiamento(
    Background varchar(50) NOT NULL,
    Oggetto varchar(50) NOT NULL,
    UNIQUE(Background,Oggetto),
    PRIMARY KEY(Background,Oggetto)
);

CREATE TABLE DnD.Origine_F_B(
    Background varchar(50) NOT NULL,
    Fonte varchar(50) NOT NULL,
    UNIQUE(Background,Fonte),
    PRIMARY KEY(Background,Fonte)
);


CREATE TABLE DnD.Origine_F_I(
    Incantesimo varchar(40) NOT NULL,
    Fonte varchar(50) NOT NULL,
    UNIQUE(Incantesimo,Fonte),
    PRIMARY KEY(Incantesimo,Fonte)
);

CREATE TABLE DnD.Origine_F_OM(
    Oggetto varchar(50) NOT NULL,
    Fonte varchar(50) NOT NULL,
    UNIQUE(Oggetto,Fonte),
    PRIMARY KEY(Oggetto,Fonte)
);

CREATE TABLE DnD.Origine_F_C(
    Classe varchar(30) NOT NULL,
    Fonte varchar(50) NOT NULL,
    UNIQUE(Classe,Fonte),
    PRIMARY KEY(Classe,Fonte)
);

CREATE TABLE DnD.Origine_F_R(
    Razza varchar(30) NOT NULL,
    Fonte varchar(50) NOT NULL,
    UNIQUE(Razza,Fonte),
    PRIMARY KEY(Razza,Fonte)
);

CREATE TABLE DnD.Innato(
    Razza varchar(30) NOT NULL,
    Abilita varchar(35) NOT NULL,
    UNIQUE(Razza,Abilita),
    PRIMARY KEY(Razza,Abilita)
);

CREATE TABLE DnD.Progressione(
    Personaggio varchar(30) NOT NULL,
    Classe varchar(30) NOT NULL,
    Livello DnD.Level NOT NULL,
    UNIQUE(Personaggio,Classe),
    PRIMARY KEY(Personaggio,Classe)
);

CREATE TABLE DnD.Controllo(
    Personaggio varchar(30) UNIQUE NOT NULL,
    Giocatore DnD.CF UNIQUE NOT NULL,
    PRIMARY KEY(Personaggio,Giocatore)
);


COMMIT work;