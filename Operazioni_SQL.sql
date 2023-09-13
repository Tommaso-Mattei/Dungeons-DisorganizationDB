BEGIN work;

--Per comprendere meglio le queries presenti sono riportate di nuovo qui tutte le viste della base di dati

CREATE OR REPLACE VIEW DnD.DEBITSUM (nomeD, debitot) as
SELECT d.debitore, SUM(d.quantita)
FROM DnD.debiti as d
GROUP BY d.debitore;


CREATE OR REPLACE VIEW DnD.NSM (nomeP,livelloS) as
SELECT s.personaggio, MAX(i.livello) 
FROM DnD.incantesimi as i, DnD.studiare as s 
WHERE (s.incantesimo = i.nome)
GROUP BY s.personaggio;


CREATE OR REPLACE VIEW DnD.OGGETTINUMERO (nomep,numeroo) as
SELECT p.nome, COUNT(i.oggetto)
FROM DnD.Personaggi as p, DnD.Inventario as i, DnD.Oggetti as o
WHERE (p.id = i.personaggio) AND (o.nome = i.oggetto) AND (o.magia = true) AND (p.pc = true)
GROUP BY p.nome;



CREATE OR REPLACE VIEW DnD.Abilrace(nomeR,nomeAB) as
SELECT r.nome, i.abilita
FROM DnD.Razze as r, DnD.Innato as i 
WHERE (r.nome = i.razza);


CREATE OR REPLACE VIEW DnD.luogancount (nomeL, nomeAN, luogcount) as
SELECT l.nome, an.nome, COUNT(*)
FROM DnD.Luoghi as l, DnD.Visita as v, DnD.Sessioni as s, DnD.Episodi as e, DnD.ArchiNarrativi as an
WHERE (l.nome = v.luogo) AND (s.numero = v.sessione) AND (s.numero = e.sessione) AND (an.nome = e.arconarrativo) AND
(l.tipo = 'Regione') AND (an.datafine IS NOT NULL)
GROUP BY l.nome, an.nome;


CREATE OR REPLACE VIEW DnD.SSG (nomeG,numeroS) as
SELECT g.nome, COUNT(*)
FROM DnD.Giocatori as g, DnD.Giocare as gi 
WHERE (g.codicefiscale = gi.giocatore)
GROUP BY g.nome;



CREATE OR REPLACE VIEW DnD.PREZZIBG (nomebg, prezzotot) as
SELECT e.background, SUM(o.prezzo)
FROM DnD.Oggetti as o, DnD.Equipaggiamento as e 
WHERE (o.nome = e.oggetto) 
GROUP BY e.background;


CREATE OR REPLACE VIEW DnD.INCANCOUNT (nomeF,nomeSc,spellcount) as
SELECT ofi.fonte, i.scuola, COUNT(*)
FROM DnD.Incantesimi as i, DnD.Origine_F_I as ofi 
WHERE (i.nome = ofi.incantesimo)
GROUP BY ofi.fonte, i.scuola;

-- Da qui in poi sono presenti le queries con il numero dell'operazione e il suo significato in linguaggio naturale
-- Nelle queries talvolta compaiono dei valori con $ ; ciò simboleggia che l'utente con l'applicazione potrà sceglierne il valore
-- Sopra le queries sono presenti le viste utilizzate per una comprensione più chiara

-- op1) Il livello medio dei personaggi che sono PC e che appartengono ad un party

SELECT AVG(p.livello) 
FROM DnD.Personaggi as p, DnD.Affiliazione as a 
WHERE (p.nome = a.personaggio) AND (p.pc = true) AND (a.gruppo IN (SELECT g.nome FROM DnD.Gruppi as g WHERE (party = true)) 
AND (a.gruppo = '$gruppo' ));


-- op2/3/4) Le operazioni 2,3 e 4 sono rispettivamente dei comuni insert per personaggi, eventi e luoghi

-- op5) La spell di livello più alto conosciuta da ogni personaggio ed il nome del personaggio stesso

SELECT p.nome, s.incantesimo 
FROM DnD.Personaggi as p, DnD.studiare as s, DnD.NSM as n, DnD.Incantesimi as i 
WHERE (p.id = s.personaggio) AND (s.personaggio = n.nomeP) AND (s.incantesimo = i.nome) AND (i.livello = n.livelloS); 


-- op6) Il numero di oggetti che sono magici e che sono nell'inventario

SELECT i.personaggio, COUNT(i.oggetto) 
FROM DnD.Inventario as i, DnD.Oggetti as o 
WHERE (i.oggetto = o.nome) AND (o.magia = true) AND (i.personaggio IN (SELECT p.id 
                                                                        FROM DnD.Personaggi as p 
                                                                        WHERE (p.pc = true) 
                                                                ) 
) 
GROUP BY i.personaggio;

-- op7) Il nome del personaggio che è un PC, avente almeno un oggetto magico, con il minimo numero di oggetti magici

SELECT p.nome  
FROM DnD.Personaggi as p, DnD.OGGETTINUMERO as onm  
WHERE (p.nome = onm.nomep) AND (onm.numeroo = (SELECT MIN(onm.numeroo) 
                                                FROM    DnD.OGGETTINUMERO as onm  
)
);


-- op8) Il nome della fonte con il massimo numero di incantesimi di una determinata scuola

SELECT f.nome FROM DnD.Fonti as f, DnD.INCANCOUNT as inc 
WHERE (f.nome = inc.nomeF) AND ( inc.nomeSc = '$scuola') AND (inc.spellcount = ( SELECT MAX(inc.spellcount)  
												  FROM DnD.INCANCOUNT as inc WHERE(inc.nomesc='$scuola')));


-- op9) Il nome degli eventi che sono accaduti nell'ultimo arco narrativo

SELECT e.nome 
FROM DnD.Eventi as e, DnD.Quando as q  
WHERE (e.nome = q.evento) AND (e.data = q.data) 
        AND (q.arconarrativo = (SELECT an.nome 
                               FROM DnD.ArchiNarrativi as an 
                               WHERE (an.datafine = (SELECT MAX(an.datafine) 
                                                    FROM DnD.ArchiNarrativi as an 
                                                    )) 
                               ) 
        );


-- op10) Il nome dei giocatori appartenenti ad un determinato gruppo e il numero di sessioni a cui hanno partecipato

SELECT DISTINCT g.nome, sg.numeroS 
FROM DnD.Giocatori as g, DnD.SSG as sg  
WHERE (g.nome = sg.nomeG) AND (g.nome IN (SELECT g.nome 
FROM DnD.Personaggi as pg, DnD.affiliazione as af, DnD.controllo as ct 
WHERE (pg.id=af.personaggio) AND (pg.id= ct.personaggio) AND (af.gruppo = '$gruppo') AND (af.datafondazione = '$data')
)
);


-- op11) Il nome del luogo (regione) visitato più volte all'interno di ogni arco narrativo concluso

SELECT lc.nomeAN, lc.nomeL 
FROM DnD.luogancount as lc  
WHERE (lc.luogcount = (SELECT MAX(ln.luogcount) 
                    FROM DnD.luogancount as ln 
)
);


-- op12) Il nome del debitore (personaggio) con il minor numero di debito cumulativo

SELECT p.nome 
FROM DnD.Personaggi as p, DnD.DEBITSUM as ds 
WHERE (p.id = ds.nomeD) AND (ds.debitot = (SELECT MIN(ds.debitot) FROM DnD.DEBITSUM as ds));

-- op13) Il nome, l'id e la posizione attuale di ogni personaggio in vita

SELECT p.nome, p.id, pr.luogo  
FROM DnD.Personaggi as p, DnD.Presenza as pr  
WHERE (p.id = pr.personaggio) AND (p.status = 'true');

-- op14) Il nome dei personaggi che hanno un incantesimo almeno di un certo livello di una determinata scuola e il nome dell'incantesimo

SELECT p.nome, s.incantesimo 
FROM DnD.Personaggi as p, DnD.Studiare as s 
WHERE (p.id = s.personaggio) AND (s.incantesimo IN ( SELECT i.nome  
                                                    FROM DnD.Incantesimi as i 
                                                    WHERE (i.livello >= '$livello') AND (i.scuola = '$scuola') 
)
);


-- op15) Il nome delle abilità della razza giocata da un personaggio in particolare che è un PC

SELECT ar.nomeAB 
FROM DnD.Abilrace as ar, DnD.Personaggi as p, DnD.Origine_P_R as opr 
WHERE (ar.nomeR = opr.razza) AND (p.id = opr.personaggio) AND (p.pc = 'true') AND (p.nome = '$id');

-- op16) Il nome e il livello degli incantesimi conosciuti da un certo personaggio che è un PC

SELECT i.nome, i.livello, p.id 
FROM DnD.personaggi as p, DnD.Studiare as s, DnD.incantesimi as i  
WHERE (p.id = s.personaggio) AND (i.nome = s.incantesimo)  
        AND (p.pc = true) AND (p.id = '$id'); 


-- op17) Il nome del background con il massimo prezzo cumulativo degli oggetti che offre

SELECT b.nome 
FROM DnD.Background as b, DnD.PREZZIBG as pbg 
WHERE (b.nome = pbg.nomebg) AND (pbg.prezzotot = (SELECT MAX(pbg.prezzotot) 
                                                  FROM DnD.PREZZIBG as pbg
)
);


-- op18) Il nome delle classi presenti nella fonte più recente

SELECT o.classe 
FROM DnD.Fonti as f, DnD.Origine_F_C as o  
WHERE (f.nome = o.fonte) AND (f.datauscita = (SELECT MAX(f.datauscita) 
                                                FROM DnD.Fonti as f  
                                    ) 
);

-- op19) Il nome di tutti i gruppi a cui partecipa un personaggio e il suo nome

SELECT p.nome, a.gruppo 
FROM DnD.Personaggi as p, DnD.Affiliazione as a  
WHERE (p.id = a.personaggio) AND (p.id = '$id');


-- op20) Il nome e l'id dei personaggi che hanno un oggetto magico di una data rarità con cui sono attuned ed il nome dell'oggetto

SELECT DISTINCT p.nome, p.id  , i.oggetto 
FROM DnD.Personaggi as p, DnD.Inventario as i 
WHERE (p.id = i.personaggio) AND (i.oggetto IN (SELECT o.nome 
                                                FROM DnD.Oggetti as o 
                                                WHERE (o.rarita = '$rarita'))) 
                            AND (i.oggetto IN (SELECT a.oggetto 
                                                FROM DnD.Attunement as a 
                                                WHERE (a.personaggio = p.id)
                                                ));

-- op21) Il nome dei personaggi che, a partire da una certa data, hanno partecipato in eventi nella loro posizione attuale più il mome dell'evento

SELECT pg.nome, ad.evento FROM DnD.personaggi as pg, DnD.adesione as ad WHERE (pg.id= ad.personaggio) 
		AND (ad.evento IN (SELECT evento FROM DnD.dove as dv
						 WHERE (dv.data = ad.data) AND (dv.data>'$data') AND (ad.evento=dv.evento) AND (dv.luogo = (SELECT ps.luogo FROM DnD.presenza as ps 
																			WHERE (ps.personaggio=pg.id) AND (ps.luogo=dv.luogo) )
																						 )));



-- op22) Il nome delle fonti che presentano un incantesimo di una determinata scuola e gli incantesimi stessi

SELECT f.nome, oi.incantesimo 
FROM DnD.Fonti as f, DnD.Origine_F_I  as oi  
WHERE (f.nome = oi.fonte) AND (oi.incantesimo IN (SELECT i.nome 
                                                FROM DnD.Incantesimi as i 
                                                WHERE (i.scuola = '$scuola') 
)
);


-- op23) Il nome delle abilità date dalle razze dei PC in un particolare gruppo

SELECT i.abilita  
FROM DnD.Innato as i, DnD.Razze as r 
WHERE (r.nome = i.razza) AND (r.nome IN (SELECT opr.razza 
FROM DnD.Origine_P_R as opr, DnD.Personaggi as p, DnD.gruppi as g 
WHERE (opr.personaggio = p.id) AND (g.nome = '$gruppo') AND (g.datafondazione = '$data') AND (p.pc='true') 
AND p.id in (SELECT personaggio FROM DnD.affiliazione as af WHERE (af.gruppo='$gruppo') AND (af.datafondazione='$data')) 
)
);






COMMIT work;