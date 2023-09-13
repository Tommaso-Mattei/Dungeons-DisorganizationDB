/*
Create trigger Nome
Before|After Insert|Update|Delete on Goblussy(Tabella)
[referencing referenza]
[for each statement|row]
[when(istruzioneSQL)]
Begin
Istruzione/proceduraSQL
End;
*/
BEGIN work;

CREATE OR REPLACE FUNCTION DnD.morte()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
Begin
    IF (NEW.status = false ) THEN
    new.hp=0;
    END IF;
    RETURN new;
END;
$$
;

CREATE OR REPLACE  trigger morte
Before Insert or Update on DnD.Personaggi
for each Row
execute procedure DnD.morte();



CREATE OR REPLACE FUNCTION DnD.play()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
Begin
    IF (NEW.status = false) THEN
    delete from DnD.controllo where (personaggio = new.id);
    END IF;
    RETURN new;
END;
$$
;

CREATE OR REPLACE  trigger play
Before Update on DnD.Personaggi
for each Row
execute procedure DnD.play();



CREATE OR REPLACE FUNCTION DnD.challenge()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
Begin
    IF (NEW.pc = true ) THEN
    new.cr=null;
    END IF;
    RETURN new;
END;
$$
;

CREATE OR REPLACE  trigger attune
Before Insert or Update on DnD.Personaggi
for each Row
execute procedure DnD.challenge();

CREATE OR REPLACE FUNCTION DnD.attune()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
Begin
    IF (NEW.magia = false ) THEN
    new.attunement=false;
    END IF;
    RETURN new;
END;
$$
;

CREATE OR REPLACE  trigger attune
Before Insert or Update on DnD.oggetti
for each Row
execute procedure DnD.attune();


CREATE OR REPLACE FUNCTION DnD.magic()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
Begin
    IF (NEW.magia = false) THEN
        new.attunement=false;
    END IF;
    RETURN new;
END;
$$
;

CREATE OR REPLACE  trigger magic
Before Update on DnD.oggetti
for each Row
execute procedure DnD.magic();


CREATE OR REPLACE FUNCTION DnD.maxAttunement()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.attunement 
        WHERE personaggio = NEW.personaggio;
    IF (
        tot >= 3
    ) THEN
    RAISE EXCEPTION 'Cannot insert more than 3 attunement for each character.';
    END IF;
    RETURN new;
END;
$$
;

CREATE OR REPLACE trigger maxAttunement
Before Insert or Update on DnD.attunement
for each Row
execute procedure DnD.MaxAttunement();



CREATE OR REPLACE FUNCTION DnD.Attunanza()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
Appoggio Boolean := true;
Begin
    SELECT attunement
    INTO Appoggio
    FROM DnD.Oggetti
    WHERE (Nome = new.oggetto);
    IF (
        Appoggio = false
    )THEN
        RAISE EXCEPTION 'The chosen object does not possess attunement';
    END IF;
    RETURN new;
END;
$$
;



CREATE OR REPLACE  trigger Attunanza
Before Insert or Update on DnD.Attunement
for each Row
execute procedure DnD.Attunanza();


CREATE OR REPLACE FUNCTION DnD.Partianza()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
Appoggio Boolean := true;
Begin
    SELECT party
    INTO Appoggio
    FROM DnD.gruppi
    WHERE (nome = new.gruppo) AND (datafondazione = new.datafondazione);
    IF (
        Appoggio = false
    )THEN
        RAISE EXCEPTION 'The chosen group is not a party';
    END IF;
    RETURN new;
END;
$$
;



CREATE OR REPLACE  trigger Partianza
Before Insert or Update on DnD.riguardare
for each Row
execute procedure DnD.Partianza();



CREATE OR REPLACE FUNCTION DnD.LocSize(a DnD.LocTypes, b DnD.LocTypes)
RETURNS Boolean
LANGUAGE PLPGSQL
AS
$$
DECLARE
Appoggio Boolean := false;
Begin
    Appoggio = 
        (a='Piano Dimensionale' AND b<>'Piano Dimensionale') OR
        (a='Pianeta' AND (b<>'Piano Dimensionale' AND b <>'Pianeta')) OR
        (a='Continente' AND (b<>'Piano Dimensionale' AND b <>'Pianeta' AND b<>'Continente')) OR
        (a='Struttura' AND (b<>'Piano Dimensionale' AND b <>'Pianeta' AND b<>'Continente')) OR
        (a='Stato' AND (b<>'Piano Dimensionale' AND b<>'Pianeta' AND b<>'Continente' AND b<>'Stato')) OR 
        (a='Città' AND (b='Quartiere' OR b ='Struttura')) OR
        (a='Villaggio' AND (b='Quartiere' OR b ='Struttura')) OR
        (a='Quartiere' AND (b ='Struttura'));
    RETURN Appoggio;
END;
$$
;



CREATE OR REPLACE FUNCTION DnD.LocInsert()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
Appoggio Boolean := true;
a DnD.LocTypes='Quartiere' ;
b DnD.LocTypes=a;
Begin
SELECT tipo
    INTO a
    FROM DnD.luoghi
    WHERE (nome = new.esterno);
    SELECT tipo
    INTO b
    FROM DnD.luoghi
    WHERE (nome = new.interno);
    IF (
        DnD.LocSize(a,b) = 'false'
    )THEN
        RAISE EXCEPTION 'Cannot insert a place into a smaller one';
    END IF;
    RETURN new;
END;
$$
;



CREATE OR REPLACE  trigger LocInsert
Before Insert or Update on DnD.area
for each Row
execute procedure DnD.LocInsert();





CREATE OR REPLACE FUNCTION DnD.PartianzaMax()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
Appoggio Boolean := true;
tot integer = 0;
Begin
    SELECT party
    INTO Appoggio
    FROM DnD.gruppi
    WHERE (nome = new.gruppo) AND (datafondazione = new.datafondazione);
    SELECT INTO tot COUNT(*) 
        FROM DnD.affiliazione as af
        WHERE (af.personaggio = new.personaggio) AND (af.gruppo in (SELECT nome
                                                                    FROM DnD.gruppi as g
                                                                     WHERE (g.party=true)));
    IF (
        (Appoggio) AND (tot > 0)
    )THEN
        RAISE EXCEPTION 'the chosen character is too many parties';
    END IF;
    RETURN new;
END;
$$
;



CREATE OR REPLACE  trigger PartianzaMax
Before Insert or Update on DnD.affiliazione
for each Row
execute procedure DnD.PartianzaMax();



CREATE OR REPLACE FUNCTION DnD.DateCheck()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
Bd date = null;
Begin
    SELECT pg.compleanno INTO Bd
    FROM DnD.personaggi as pg ,DnD.adesione as ad
    WHERE (pg.id = new.personaggio) AND (ad.data = new.data) AND (ad.evento=new.evento);
    IF (
        (Bd=null) OR (Bd>new.data)
    )THEN
        RAISE EXCEPTION 'The chosen event happened before the character was born';
    END IF;
    RETURN new;
END;
$$
;



CREATE OR REPLACE  trigger DateCheck
Before Insert or Update on DnD.adesione
for each Row
execute procedure DnD.DateCheck();



CREATE OR REPLACE FUNCTION DnD.PCCheck()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
pc boolean = false;
prt boolean = false;
Begin
    SELECT pg.pc INTO pc
    FROM DnD.personaggi as pg, DnD.gruppi as gr
    WHERE (pg.id = new.personaggio) AND (gr.datafondazione = new.datafondazione) AND (gr.nome=new.gruppo);
    SELECT gr.party INTO prt
    FROM DnD.personaggi as pg, DnD.gruppi as gr
    WHERE (pg.id = new.personaggio) AND (gr.datafondazione = new.datafondazione) AND (gr.nome=new.gruppo);
    IF (
        ((NOT pc) AND prt)
    )THEN
        RAISE EXCEPTION 'The selected character is not a player character hence he cannot join a party';
    END IF;
    RETURN new;
END;
$$
;



CREATE OR REPLACE  trigger PCCheck
Before Insert or Update on DnD.affiliazione
for each Row
execute procedure DnD.PCCheck();




CREATE OR REPLACE FUNCTION DnD.ControlCheck()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
pc boolean = false;
prt boolean = false;
Begin
    SELECT pg.pc INTO pc
    FROM DnD.personaggi as pg
    WHERE (pg.id = new.personaggio);
    IF (
        ((NOT pc))
    )THEN
        RAISE EXCEPTION 'The selected character is not a player character hence he cannot be controlled by a player';
    END IF;
    RETURN new;
END;
$$
;



CREATE OR REPLACE  trigger ControlCheck
Before Insert or Update on DnD.controllo
for each Row
execute procedure DnD.ControlCheck();



CREATE OR REPLACE FUNCTION DnD.CRCheck()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
pc boolean = false;
prt boolean = false;
Begin
    SELECT pg.pc INTO pc
    FROM DnD.personaggi as pg
    WHERE (pg.id = new.id);
    IF (
        (pc)
    )THEN
        new.cr=null;
    END IF;
    RETURN new;
END;
$$
;



CREATE OR REPLACE  trigger CRCheck
Before Insert or Update on DnD.personaggi
for each Row
execute procedure DnD.CRCheck();

/* CONSTRAINT TRIGGERS
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*/

CREATE OR REPLACE FUNCTION DnD.minPos()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.presenza 
        WHERE (personaggio = new.id);
    IF (
        tot <> 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a character without a position.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minPos ON DnD.personaggi;
CREATE CONSTRAINT trigger minPos
After Insert or Update on DnD.personaggi
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minPos();


CREATE OR REPLACE FUNCTION DnD.onePlayer()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
pc boolean = false;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.controllo
        WHERE (personaggio = new.id);
    SELECT pg.pc INTO pc 
        FROM DnD.Personaggi as pg
        WHERE (pg.id = new.id);
    IF (
        tot <> 1 AND pc
    ) THEN
        RAISE EXCEPTION 'Cannot insert a player character that does not have a player.';
    END IF;
    RETURN new;
END;
$$
;


CREATE OR REPLACE FUNCTION DnD.oneSource()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
m boolean = false;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.origine_f_om
        WHERE (oggetto = new.nome);
    SELECT og.magia INTO m 
        FROM DnD.oggetti as og
        WHERE (og.nome = new.nome);
    IF (
        tot < 1 AND m
    ) THEN
        RAISE EXCEPTION 'Cannot insert an magical object character that does not have a source.';
    END IF;
    RETURN new;
END;
$$
;


--DROP trigger oneSource ON DnD.oggetti;
CREATE CONSTRAINT trigger oneSource
After Insert or Update on DnD.oggetti
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.oneSource();


CREATE OR REPLACE FUNCTION DnD.minRaz()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.origine_p_r 
        WHERE (personaggio = new.id);
    IF (
        tot <> 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a character without a race.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minRaz ON DnD.personaggi;
CREATE CONSTRAINT trigger minRaz
After Insert or Update on DnD.personaggi
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minRaz();



CREATE OR REPLACE FUNCTION DnD.minEPos()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.dove
        WHERE (evento = new.nome);
    IF (
        tot <> 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert an event without a position.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minEPos ON DnD.eventi;
CREATE CONSTRAINT trigger minEPos 
After Insert or Update on DnD.eventi
DEFERRABLE INITIALLY DEFERRED
for each row
execute procedure DnD.minEPos();


CREATE OR REPLACE FUNCTION DnD.minPl()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.giocare
        WHERE (sessione = new.numero);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a session without a player.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minPl ON DnD.sessioni;
CREATE CONSTRAINT trigger minPl
After Insert or Update on DnD.sessioni
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minPl();


CREATE OR REPLACE FUNCTION DnD.minArc()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.episodi
        WHERE (sessione = new.numero);
    IF (
        tot <> 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a session that is not in one and only one an arc.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minArc ON DnD.sessioni;
CREATE CONSTRAINT trigger minArc
After Insert or Update on DnD.sessioni
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minArc();




CREATE OR REPLACE FUNCTION DnD.minReg()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.riguardare
        WHERE (sessione = new.numero);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a session that does concern any group.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minReg ON DnD.sessioni;
CREATE CONSTRAINT trigger minReg
After Insert or Update on DnD.sessioni
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minReg();



CREATE OR REPLACE FUNCTION DnD.minPlaces()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.visita
        WHERE (sessione = new.numero);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a session that does not visit any places.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minPlaces ON DnD.sessioni;
CREATE CONSTRAINT trigger minPlaces
After Insert or Update on DnD.sessioni
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minPlaces();




CREATE OR REPLACE FUNCTION DnD.minAb()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.sviluppo
        WHERE (classe = new.nome);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a class that does not grant any abilities.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minAb ON DnD.classi;
CREATE CONSTRAINT trigger minAb
After Insert or Update on DnD.classi
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minAb();


CREATE OR REPLACE FUNCTION DnD.minBAb()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.conferire
        WHERE (background = new.nome);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a background that does not grant any abilities.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minBAb ON DnD.background;
CREATE CONSTRAINT trigger minBAb
After Insert or Update on DnD.background
DEFERRABLE INITIALLY DEFERRED
for each row
execute procedure DnD.minBAb();


CREATE OR REPLACE FUNCTION DnD.minBOg()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.equipaggiamento
        WHERE (background = new.nome);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a background that does not grant any objects.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minBOg ON DnD.background;
CREATE CONSTRAINT trigger minBOg
After Insert or Update on DnD.background
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minBOg();


CREATE OR REPLACE FUNCTION DnD.minBF()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.origine_f_b
        WHERE (background = new.nome);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a background that does not have a source.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minBF ON DnD.background;
CREATE CONSTRAINT trigger minBF
After Insert or Update on DnD.background
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minBF();


CREATE OR REPLACE FUNCTION DnD.minIF()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.origine_f_i
        WHERE (incantesimo = new.nome);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a spell that does not have a source.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minIF ON DnD.incantesimi;
CREATE CONSTRAINT trigger minIF
After Insert or Update on DnD.incantesimi
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minIF();



CREATE OR REPLACE FUNCTION DnD.minCF()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.origine_f_c
        WHERE (classe = new.nome);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a class that does not have a source.';
    END IF;
    RETURN new;
END;
$$
;

--DROP trigger minCF ON DnD.classi;

CREATE CONSTRAINT trigger minCF
After Insert or Update on DnD.classi
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minCF();



CREATE OR REPLACE FUNCTION DnD.minRF()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.origine_f_r
        WHERE (razza = new.nome);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a race that does not have a source.';
    END IF;
    RETURN new;
END;
$$
;


--DROP trigger minRF ON DnD.razze;

CREATE CONSTRAINT trigger minRF
After Insert or Update on DnD.razze
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minRF();


CREATE OR REPLACE FUNCTION DnD.minAR()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
DECLARE
tot INTEGER := 0;
Begin
    SELECT INTO tot COUNT(*) 
        FROM DnD.innato
        WHERE (razza = new.nome);
    IF (
        tot < 1
    ) THEN
        RAISE EXCEPTION 'Cannot insert a race that does not grant any abilities.';
    END IF;
    RETURN new;
END;
$$
;


--DROP trigger minAR ON DnD.razze;

CREATE CONSTRAINT trigger minAR
After Insert or Update on DnD.razze
DEFERRABLE INITIALLY DEFERRED
for each Row
execute procedure DnD.minAR();




COMMIT work;

