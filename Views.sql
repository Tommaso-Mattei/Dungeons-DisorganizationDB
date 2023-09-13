BEGIN work;


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







COMMIT WORK;