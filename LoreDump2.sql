BEGIN work;

INSERT INTO DnD.Personaggi("id","nome","cognome","patria","hp","status","statistiche","xp","livello","pc")
VALUES ('Zaphis','Zaphis','Van Creek','Narfgaard','100','true','081614081020','140000','14','true');

INSERT INTO DnD.Personaggi("id","nome","cognome","patria","hp","status","statistiche","xp","livello","pc")
VALUES ('Vilgy','Vilgefortz','Von Eldratch','Narfgaard','120','true','081416151620','150000','14','true');

INSERT INTO DnD.Personaggi("id","nome","patria","hp","status","statistiche","xp","livello","pc")
VALUES ('Nicolas','Nicolas','Narfgaard','150','true','181220101012','145000','14','false');

INSERT INTO DnD.Personaggi("id","nome","patria","hp","status","statistiche","xp","livello","pc")
VALUES ('Willy','Willy','Lania','115','true','082014101208','120000','13','false');

INSERT INTO DnD.Personaggi("id","nome","patria","hp","status","statistiche","cr","xp","pc")
VALUES ('Gallidan','Gallidan','Gwessaga','150','true','082018101214','11','5000','false');

INSERT INTO DnD.Personaggi("id","nome","patria","hp","status","statistiche","cr","xp","pc")
VALUES ('Jack','Jack','Nym','500','false','202020222620','25','200000','false');

INSERT INTO DnD.Personaggi("id","nome","patria","hp","status","statistiche","xp","livello","pc")
VALUES ('Gniks','Gniks','Lantus','46','true','081416160810','3000','6','true');

INSERT INTO DnD.Personaggi("id","nome","patria","hp","status","statistiche","xp","livello","pc")
VALUES ('Hamon','Hamon','Lania','110','true','122016101408','110000','12','true');

INSERT INTO DnD.Personaggi("id","nome","cognome","patria","hp","status","statistiche","xp","livello","pc")
VALUES ('Arcy','Arcadius','Flavius','Lantus','40','true','101216181214','14040','6','true');

INSERT INTO DnD.Giocatori("codicefiscale","nome","cognome","datadinascita")
VALUES ('HFCDJX52E65G406R','Tommaso','Iettam','13/10/2000');

INSERT INTO DnD.Giocatori("codicefiscale","nome","cognome","datadinascita")
VALUES ('BGCSSM65B60B117V','Mattia','Edacul','28/12/2000');

INSERT INTO DnD.Giocatori("codicefiscale","nome","cognome","datadinascita")
VALUES ('DLWBFL39L24I352R','Alessandro','Ippa','16/05/1996');

INSERT INTO DnD.Giocatori("codicefiscale","nome","cognome","datadinascita")
VALUES ('JGDSLY31H60A343A','Silvio','Oivlis','29/09/1936');

INSERT INTO DnD.Giocatori("codicefiscale","nome","cognome","datadinascita")
VALUES ('CCUVLZ43M64C732P','Max','Bunker','07/07/1985');

INSERT INTO DnD.Oggetti("nome","peso","attunement","rarita","magia")
VALUES ('Lama Caricata','10','false','Non Comune','true');

INSERT INTO DnD.Oggetti("nome","peso","prezzo","attunement","magia")
VALUES ('Scudo Nicolas','15','20','false','false');

INSERT INTO DnD.Oggetti("nome","peso","prezzo","attunement","magia")
VALUES ('Gemma verde','30','500','false','false');

INSERT INTO DnD.Oggetti("nome","peso","prezzo","attunement","magia")
VALUES ('Dadi','2','2','false','false');

INSERT INTO DnD.Oggetti("nome","peso","prezzo","attunement","magia")
VALUES ('Diamante','29','300','false','false');

INSERT INTO DnD.Oggetti("nome","peso","prezzo","attunement","magia")
VALUES ('Violet Crystal','40','500','false','false');

INSERT INTO DnD.Oggetti("nome","peso","attunement","magia")
VALUES ('Ciottolo','3','false','false');

INSERT INTO DnD.Oggetti("nome","peso","prezzo","attunement","magia")
VALUES ('Staffa','1','2','false','false');

INSERT INTO DnD.Incantesimi("nome","livello","tempodilancio","raggio","durata","scuola")
VALUES ('revivify','3','Azione','0','0','Necromanzia');

INSERT INTO DnD.Incantesimi("nome","livello","tempodilancio","raggio","durata","scuola")
VALUES ('Prismatic Spray','7','Azione','60','0','Evocazione');

INSERT INTO DnD.Incantesimi("nome","livello","tempodilancio","raggio","durata","scuola")
VALUES ('Magic Jar','6','Rituale','0','200','Necromanzia');

INSERT INTO DnD.Incantesimi("nome","livello","tempodilancio","raggio","durata","scuola")
VALUES ('Chill Touch','0','Azione','120','10','Necromanzia');

INSERT INTO DnD.Incantesimi("nome","livello","tempodilancio","raggio","durata","scuola")
VALUES ('Magnify Gravity','1','Azione','60','10','Dunamanzia');

INSERT INTO DnD.Incantesimi("nome","livello","tempodilancio","raggio","durata","scuola")
VALUES ('Wish','9','Azione','0','0','Invocazione');

INSERT INTO DnD.Eventi("nome","data")
VALUES ('Prove del santuario','13/03/2022');

INSERT INTO DnD.Eventi("nome","data")
VALUES ('Scoperta del cimelio di Arnelius','17/12/2021');

INSERT INTO DnD.Eventi("nome","data")
VALUES ('Sconfitta di Losk','1/06/2021');

INSERT INTO DnD.ArchiNarrativi("nome","datainizio","datafine")
VALUES ('Il risveglio di Ugarth','26/09/2021','31/05/2022');

INSERT INTO DnD.ArchiNarrativi("nome","datainizio","datafine")
VALUES ('La corte dei conti','11/10/2019','2/06/2021');

INSERT INTO DnD.Sessioni("numero","luogo","data","titolo")
VALUES ('0','Viska','26/09/2021','Naufragio in grande stile');

INSERT INTO DnD.Sessioni("numero","luogo","data","titolo")
VALUES ('28','Viska','31/05/2022','Addio alla valle');

INSERT INTO DnD.Classi("nome","requisiti")
VALUES ('Artificer','13 intelligenza');

INSERT INTO DnD.Classi("nome","requisiti")
VALUES ('Blood Hunter','13 intelligenza e forza/destrezza');

INSERT INTO DnD.Classi("nome","requisiti")
VALUES ('Bard','13 carisma');

INSERT INTO DnD.Classi("nome","requisiti")
VALUES ('Fighter','13 forza o destrezza');

INSERT INTO DnD.Classi("nome","requisiti")
VALUES ('Warlock','13 carisma');

INSERT INTO DnD.Classi("nome","requisiti")
VALUES ('Monk','13 destrezza e saggezza');

INSERT INTO DnD.Classi("nome","requisiti")
VALUES ('Wizard','13 intelligenza');

INSERT INTO DnD.Classi("nome","requisiti")
VALUES ('Ranger','13 destrezza e saggezza');

INSERT INTO DnD.Background("nome","linguaggio","feature")
VALUES ('Lomza','elfico','Glorious return');

INSERT INTO DnD.Background("nome","linguaggio","feature")
VALUES ('Sage','Primordial','Ancient Lore');

INSERT INTO DnD.Background("nome","linguaggio","feature")
VALUES ('Outlander','Undercommon','Weirdness of interest');

INSERT INTO DnD.Background("nome","linguaggio","feature")
VALUES ('Folk Hero','Nanico','Heroic Might');

INSERT INTO DnD.Background("nome","linguaggio","feature")
VALUES ('Noble','Common','Noble Following');

INSERT INTO DnD.Razze("nome","grandezza","maturazione","aspettativadivita","linguaggio","velocita")
VALUES('Umano','Medio','18','80','comune','30');

INSERT INTO DnD.Razze("nome","grandezza","maturazione","aspettativadivita","linguaggio","velocita")
VALUES ('Nano','Medio','50','350','Nanico','25');

INSERT INTO DnD.Razze("nome","grandezza","maturazione","aspettativadivita","linguaggio","velocita")
VALUES ('Elfo','Medio','100','750','Elfico','35');

INSERT INTO DnD.Razze("nome","grandezza","maturazione","aspettativadivita","linguaggio","velocita")
VALUES ('Tiefling','Medio','18','100','Infernale','30');

INSERT INTO DnD.Razze("nome","grandezza","maturazione","aspettativadivita","linguaggio","velocita")
VALUES ('Sur','Medio','500','10000','Sur','60');

INSERT INTO DnD.Razze("nome","grandezza","maturazione","aspettativadivita","linguaggio","velocita")
VALUES ('Goblin','Piccolo','8','60','Goblin','30');

INSERT INTO DnD.Razze("nome","grandezza","maturazione","aspettativadivita","linguaggio","velocita")
VALUES ('Firbolg','Medio','30','500','Gigante','30');

INSERT INTO DnD.Gruppi("nome","datafondazione","nmax","grado","party")
VALUES ('Lomza','22/09/18','5','7','true');

INSERT INTO DnD.Gruppi("nome","datafondazione","nmax","grado","party")
VALUES ('I Gloriosi Apiostoli','11/10/2019','6','6','true');

INSERT INTO DnD.Gruppi("nome","datafondazione","nmax","grado","party")
VALUES ('DAGAR','26/09/2021','5','3','true');

INSERT INTO DnD.Gruppi("nome","datafondazione","nmax","party")
VALUES ('Caccia Astrale','25/06/2019','120','false');

INSERT INTO DnD.Gruppi("nome","datafondazione","nmax","party")
VALUES ('Gilda degli avventurieri','16/01/2019','10000','false');

INSERT INTO DnD.Gruppi("nome","datafondazione","nmax","party")
VALUES ('Banditi dalla capitale','19/06/2021','28','false');

INSERT INTO DnD.Fonti("nome","datauscita")
VALUES ('Manuale del giocatore','19/08/2014');

INSERT INTO DnD.Fonti("nome","datauscita")
VALUES ('Manuale del Dungeon Master','9/12/2014');

INSERT INTO DnD.Fonti("nome","datauscita")
VALUES ('Volo guide to monsters','15/11/2016');

INSERT INTO DnD.Fonti("nome","datauscita")
VALUES ('Tasha cauldron of everything','17/11/2020');

INSERT INTO DnD.Fonti("nome","datauscita")
VALUES ('Xanathar guide to everything','21/11/2017');

INSERT INTO DnD.Fonti("nome","datauscita")
VALUES ('Mordenkainen tome of foes','29/05/2017');

INSERT INTO DnD.Fonti("nome")
VALUES ('Homebrew');

INSERT INTO DnD.Luoghi("nome","tipo")
VALUES ('Bytopia','Piano Dimensionale');

INSERT INTO DnD.Luoghi("nome","tipo")
VALUES ('Narfgaard','Stato');

INSERT INTO DnD.Luoghi("nome","tipo")
VALUES ('Lania','Stato');

INSERT INTO DnD.Luoghi("nome","tipo")
VALUES ('Gwessaga','Continente');

INSERT INTO DnD.Luoghi("nome","tipo")
VALUES ('Valle di Kymal','Regione');

INSERT INTO DnD.Luoghi("nome","tipo")
VALUES ('Nym','Pianeta');

INSERT INTO DnD.Luoghi("nome","tipo")
VALUES ('Ammonia','Citta');

INSERT INTO DnD.Abilita("nome","usi","pors","raggio") --BG OPOLI
VALUES ('Glorious return','3','false','30');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Ancient Lore','true','1','true','10');

INSERT INTO DnD.Abilita("nome","usi","pors","raggio")
VALUES ('Weirdness of interest','1','false','30');

INSERT INTO DnD.Abilita("nome","usi","pors","raggio")
VALUES ('Heroic Might','6','true','100');

INSERT INTO DnD.Abilita("nome","usi","pors","raggio") --FINE BG OPOLI
VALUES ('Noble Following','1','false','30');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")  --RAZZOPOLI
VALUES ('Mask of the Wild','true','10','false','0');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('All purpose skill','false','2','true','30');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Lore of stone','false','1','false','30');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Hellish fire','false','1','false','30');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Benediction of the creator','true','6','false','100');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Fury of the small','true','4','true','90');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio") --END RAZZOPOLI
VALUES ('Hidden step','false','1','true','0');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio") --CLASSOPOLI
VALUES ('Flash of genius','true','5','false','60');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Blood maledict','true','5','true','60');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Bardic inspiration','true','5','true','60');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Second wind','false','1','true','0');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Eldritch invocation','true','3','false','60');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Stunning strike','true','10','true','5');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")
VALUES ('Arcane recovery','false','1','true','0');

INSERT INTO DnD.Abilita("nome","recupero","usi","pors","raggio")  --END CLASSOPOLI
VALUES ('Favored foe','true','5','false','60');  

INSERT INTO DnD.Equipaggiamento("background","oggetto")
VALUES ('Lomza','Scudo Nicolas');

INSERT INTO DnD.Equipaggiamento("background","oggetto")
VALUES ('Sage','Staffa');

INSERT INTO DnD.Equipaggiamento("background","oggetto")
VALUES ('Folk Hero','Dadi');

INSERT INTO DnD.Equipaggiamento("background","oggetto")
VALUES ('Outlander','Ciottolo');

INSERT INTO DnD.Equipaggiamento("background","oggetto")
VALUES ('Noble','Diamante');

INSERT INTO DnD.Equipaggiamento("background","oggetto")
VALUES ('Noble','Violet Crystal');

INSERT INTO DnD.Equipaggiamento("background","oggetto")
VALUES ('Lomza','Diamante');

INSERT INTO DnD.Studiare("personaggio","incantesimo")
VALUES ('Zaphis','Prismatic Spray');

INSERT INTO DnD.Studiare("personaggio","incantesimo")
VALUES ('Zaphis','revivify');

INSERT INTO DnD.Studiare("personaggio","incantesimo")
VALUES ('Vilgy','Magic Jar');

INSERT INTO DnD.Studiare("personaggio","incantesimo")
VALUES ('Vilgy','Chill Touch');

INSERT INTO DnD.Studiare("personaggio","incantesimo")
VALUES ('Vilgy','revivify');

INSERT INTO DnD.Studiare("personaggio","incantesimo")
VALUES ('Arcy','Wish');

INSERT INTO DnD.Studiare("personaggio","incantesimo")
VALUES ('Arcy','Magnify Gravity');

INSERT INTO DnD.Studiare("personaggio","incantesimo")
VALUES ('Gniks','Wish');

INSERT INTO DnD.Sviluppo("classe","abilita")
VALUES ('Artificer','Flash of genius');

INSERT INTO DnD.Sviluppo("classe","abilita")
VALUES ('Blood Hunter','Blood maledict');

INSERT INTO DnD.Sviluppo("classe","abilita")
VALUES ('Bard','Bardic inspiration');

INSERT INTO DnD.Sviluppo("classe","abilita")
VALUES ('Fighter','Second wind');

INSERT INTO DnD.Sviluppo("classe","abilita")
VALUES ('Warlock','Eldritch invocation');

INSERT INTO DnD.Sviluppo("classe","abilita")
VALUES ('Monk','Stunning strike');

INSERT INTO DnD.Sviluppo("classe","abilita")
VALUES ('Wizard','Arcane recovery');

INSERT INTO DnD.Sviluppo("classe","abilita")
VALUES ('Ranger','Favored foe');

INSERT INTO DnD.Conferire("background","abilita")
VALUES ('Lomza','Glorious return');

INSERT INTO DnD.Conferire("background","abilita")
VALUES ('Sage','Ancient Lore');

INSERT INTO DnD.Conferire("background","abilita")
VALUES ('Outlander','Weirdness of interest');

INSERT INTO DnD.Conferire("background","abilita")
VALUES ('Folk Hero','Heroic Might');

INSERT INTO DnD.Conferire("background","abilita")   
VALUES ('Noble','Noble Following');

INSERT INTO DnD.Innato("razza","abilita")
VALUES ('Elfo','Mask of the Wild');

INSERT INTO DnD.Innato("razza","abilita")
VALUES ('Umano','All purpose skill');

INSERT INTO DnD.Innato("razza","abilita")
VALUES ('Nano','Lore of stone');

INSERT INTO DnD.Innato("razza","abilita")
VALUES ('Tiefling','Hellish fire');

INSERT INTO DnD.Innato("razza","abilita")
VALUES ('Sur','Benediction of the creator');

INSERT INTO DnD.Innato("razza","abilita")
VALUES ('Goblin','Fury of the small');

INSERT INTO DnD.Innato("razza","abilita")
VALUES ('Firbolg','Hidden step');

INSERT INTO DnD.Presenza("personaggio","luogo")
VALUES ('Zaphis','Narfgaard');

INSERT INTO DnD.Presenza("personaggio","luogo")
VALUES ('Vilgy','Narfgaard');

INSERT INTO DnD.Presenza("personaggio","luogo")
VALUES ('Nicolas','Narfgaard');

INSERT INTO DnD.Presenza("personaggio","luogo")
VALUES ('Willy','Lania');

INSERT INTO DnD.Presenza("personaggio","luogo")
VALUES ('Hamon','Ammonia');

INSERT INTO DnD.Presenza("personaggio","luogo")
VALUES ('Jack','Bytopia');

INSERT INTO DnD.Presenza("personaggio","luogo")
VALUES ('Gallidan','Gwessaga');

INSERT INTO DnD.Presenza("personaggio","luogo")
VALUES ('Gniks','Valle di Kymal');

INSERT INTO DnD.Presenza("personaggio","luogo")
VALUES ('Arcy','Valle di Kymal');

INSERT INTO DnD.Origine_F_I("incantesimo","fonte")
VALUES ('Chill Touch','Xanathar guide to everything');

INSERT INTO DnD.Origine_F_I("incantesimo","fonte")
VALUES ('Magnify Gravity','Tasha cauldron of everything');

INSERT INTO DnD.Origine_F_I("incantesimo","fonte")
VALUES ('revivify','Manuale del giocatore');

INSERT INTO DnD.Origine_F_I("incantesimo","fonte")
VALUES ('Prismatic Spray','Manuale del giocatore');

INSERT INTO DnD.Origine_F_I("incantesimo","fonte")
VALUES ('Magic Jar','Xanathar guide to everything');

INSERT INTO DnD.Origine_F_I("incantesimo","fonte")
VALUES ('Wish','Manuale del Dungeon Master');

INSERT INTO DnD.Origine_F_R("razza","fonte")
VALUES ('Umano','Manuale del giocatore');

INSERT INTO DnD.Origine_F_R("razza","fonte")
VALUES ('Nano','Manuale del giocatore');

INSERT INTO DnD.Origine_F_R("razza","fonte")
VALUES ('Elfo','Manuale del giocatore');

INSERT INTO DnD.Origine_F_R("razza","fonte")
VALUES ('Tiefling','Mordenkainen tome of foes');

INSERT INTO DnD.Origine_F_R("razza","fonte")
VALUES ('Sur','Manuale del Dungeon Master');

INSERT INTO DnD.Origine_F_R("razza","fonte")
VALUES ('Goblin','Volo guide to monsters');

INSERT INTO DnD.Origine_F_R("razza","fonte")
VALUES ('Firbolg','Volo guide to monsters');

INSERT INTO DnD.Origine_F_C("classe","fonte")
VALUES ('Artificer','Tasha cauldron of everything');

INSERT INTO DnD.Origine_F_C("classe","fonte")
VALUES ('Blood Hunter','Xanathar guide to everything');

INSERT INTO DnD.Origine_F_C("classe","fonte")
VALUES ('Bard','Manuale del giocatore');

INSERT INTO DnD.Origine_F_C("classe","fonte")
VALUES ('Fighter','Manuale del giocatore');

INSERT INTO DnD.Origine_F_C("classe","fonte")
VALUES ('Warlock','Manuale del giocatore');

INSERT INTO DnD.Origine_F_C("classe","fonte")
VALUES ('Monk','Xanathar guide to everything');

INSERT INTO DnD.Origine_F_C("classe","fonte")
VALUES ('Ranger','Volo guide to monsters');

INSERT INTO DnD.Origine_F_C("classe","fonte")
VALUES ('Wizard','Manuale del Dungeon Master');

INSERT INTO DnD.Origine_F_B("background","fonte")
VALUES ('Lomza','Homebrew');

INSERT INTO DnD.Origine_F_B("background","fonte")
VALUES ('Sage','Manuale del giocatore');

INSERT INTO DnD.Origine_F_B("background","fonte")
VALUES ('Folk Hero','Manuale del Dungeon Master');

INSERT INTO DnD.Origine_F_B("background","fonte")
VALUES ('Outlander','Manuale del giocatore');

INSERT INTO DnD.Origine_F_B("background","fonte")
VALUES ('Noble','Xanathar guide to everything');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Zaphis','Lomza','22/09/18');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Vilgy','Lomza','22/09/18');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Gniks','DAGAR','26/09/2021');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Arcy','DAGAR','26/09/2021');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Hamon','I Gloriosi Apiostoli','11/10/2019');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Gallidan','Caccia Astrale','25/06/2019');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Gniks','Banditi dalla capitale','19/06/2021');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Arcy','Banditi dalla capitale','19/06/2021');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Gniks','Gilda degli avventurieri','16/01/2019');

INSERT INTO DnD.Affiliazione("personaggio","gruppo","datafondazione")
VALUES ('Arcy','Gilda degli avventurieri','16/01/2019');

INSERT INTO DnD.Origine_P_R("personaggio","razza")
VALUES ('Zaphis','Umano');

INSERT INTO DnD.Origine_P_R("personaggio","razza")
VALUES ('Vilgy','Umano');

INSERT INTO DnD.Origine_P_R("personaggio","razza")
VALUES ('Nicolas','Nano');

INSERT INTO DnD.Origine_P_R("personaggio","razza")
VALUES ('Willy','Elfo');

INSERT INTO DnD.Origine_P_R("personaggio","razza")
VALUES ('Gallidan','Tiefling');

INSERT INTO DnD.Origine_P_R("personaggio","razza")
VALUES ('Jack','Sur');

INSERT INTO DnD.Origine_P_R("personaggio","razza")
VALUES ('Gniks','Goblin');

INSERT INTO DnD.Origine_P_R("personaggio","razza")
VALUES ('Hamon','Firbolg');

INSERT INTO DnD.Origine_P_R("personaggio","razza")
VALUES ('Arcy','Umano');

INSERT INTO DnD.Passato("background","personaggio")
VALUES ('Lomza','Zaphis');

INSERT INTO DnD.Passato("background","personaggio")
VALUES ('Sage','Vilgy');

INSERT INTO DnD.Passato("background","personaggio")
VALUES ('Sage','Arcy');

INSERT INTO DnD.Passato("background","personaggio")
VALUES ('Outlander','Gniks');

INSERT INTO DnD.Passato("background","personaggio")
VALUES ('Noble','Hamon');

INSERT INTO DnD.Controllo("personaggio","giocatore")
VALUES ('Zaphis','HFCDJX52E65G406R');

INSERT INTO DnD.Controllo("personaggio","giocatore")
VALUES ('Vilgy','CCUVLZ43M64C732P');

INSERT INTO DnD.Controllo("personaggio","giocatore")
VALUES ('Gniks','BGCSSM65B60B117V');

INSERT INTO DnD.Controllo("personaggio","giocatore")
VALUES ('Hamon','DLWBFL39L24I352R');

INSERT INTO DnD.Controllo("personaggio","giocatore")
VALUES ('Arcy','JGDSLY31H60A343A');

INSERT INTO DnD.Progressione("personaggio","classe","livello")
VALUES ('Zaphis','Bard','14');

INSERT INTO DnD.Progressione("personaggio","classe","livello")
VALUES ('Vilgy','Warlock','14');

INSERT INTO DnD.Progressione("personaggio","classe","livello")
VALUES ('Nicolas','Fighter','14');

INSERT INTO DnD.Progressione("personaggio","classe","livello")
VALUES ('Willy','Monk','13');

INSERT INTO DnD.Progressione("personaggio","classe","livello")
VALUES ('Gniks','Artificer','6');

INSERT INTO DnD.Progressione("personaggio","classe","livello")
VALUES ('Hamon','Ranger','12');

INSERT INTO DnD.Progressione("personaggio","classe","livello")
VALUES ('Arcy','Wizard','6');

--INSERT INTO DnD.attunement("personaggio","oggetto")
--VALUES ('Zaphis','Lama Caricata');

INSERT INTO DnD.Quando("evento","arconarrativo","data")
VALUES ('Sconfitta di Losk','La corte dei conti','1/06/2021');

INSERT INTO DnD.Quando("evento","arconarrativo","data")
VALUES ('Prove del santuario','Il risveglio di Ugarth','13/03/2022');

INSERT INTO DnD.Quando("evento","arconarrativo","data")
VALUES ('Scoperta del cimelio di Arnelius','Il risveglio di Ugarth','17/12/2021');

INSERT INTO DnD.Giocare("giocatore","sessione")
VALUES ('BGCSSM65B60B117V','0');

INSERT INTO DnD.Giocare("giocatore","sessione")
VALUES ('BGCSSM65B60B117V','28');

INSERT INTO DnD.Inventario("personaggio","oggetto")
VALUES ('Zaphis','Lama Caricata');

INSERT INTO DnD.Debiti("debitore","creditore","quantita")
VALUES ('Zaphis','Vilgy','140');

INSERT INTO DnD.Visita("sessione","luogo")
VALUES ('0','Valle di Kymal');

INSERT INTO DnD.Visita("sessione","luogo")
VALUES ('28','Valle di Kymal');

INSERT INTO DnD.Riguardare("gruppo","datafondazione","sessione")
VALUES ('DAGAR','26/09/2021','0');

INSERT INTO DnD.Riguardare("gruppo","datafondazione","sessione")
VALUES ('DAGAR','26/09/2021','28');

INSERT INTO DnD.Episodi("arconarrativo","sessione")
VALUES ('Il risveglio di Ugarth','0');

INSERT INTO DnD.Episodi("arconarrativo","sessione")
VALUES ('Il risveglio di Ugarth','28');

INSERT INTO DnD.Dove("luogo","evento","data")
VALUES ('Valle di Kymal','Prove del santuario','13/03/2022');

INSERT INTO DnD.Dove("luogo","evento","data")
VALUES ('Valle di Kymal','Scoperta del cimelio di Arnelius','17/12/2021');

INSERT INTO DnD.Dove("luogo","evento","data")
VALUES ('Lania','Sconfitta di Losk','1/06/2021');

INSERT INTO DnD.Origine_F_OM("oggetto","fonte")
VALUES ('Lama Caricata','Manuale del giocatore');

INSERT INTO DnD.oggetti("nome","peso","attunement","rarita","magia")
VALUES ('Anello della luna','12','true','Molto Raro','true');

INSERT INTO DnD.oggetti("nome","peso","attunement","rarita","magia")
VALUES ('Anello del sole','32','true','Artefatto','true');

INSERT INTO DnD.oggetti("nome","peso","attunement","rarita","magia")
VALUES ('fiamma sacra','2','true','Artefatto','true');

INSERT INTO DnD.oggetti("nome","peso","attunement","rarita","magia")
VALUES ('Carte del destino','13','true','Comune','true');

INSERT INTO DnD.oggetti("nome","peso","attunement","rarita","magia")
VALUES ('Tavola della legge','53','true','Non Comune','true');

INSERT INTO DnD.oggetti("nome","peso","attunement","rarita","magia")
VALUES ('Olio blu','11','true','Raro','true');

INSERT INTO DnD.origine_F_om("oggetto","fonte")
VALUES ('Anello della luna','Homebrew');

INSERT INTO DnD.origine_F_om("oggetto","fonte")
VALUES ('Anello del sole','Homebrew');

INSERT INTO DnD.origine_F_om("oggetto","fonte")
VALUES ('fiamma sacra','Homebrew');

INSERT INTO DnD.origine_F_om("oggetto","fonte")
VALUES ('Carte del destino','Homebrew');

INSERT INTO DnD.origine_F_om("oggetto","fonte")
VALUES ('Tavola della legge','Homebrew');

INSERT INTO DnD.origine_F_om("oggetto","fonte")
VALUES ('Olio blu','Homebrew');

INSERT INTO DnD.attunement("oggetto","personaggio")
VALUES ('Anello della luna','Gniks');

INSERT INTO DnD.attunement("oggetto","personaggio")
VALUES ('Anello del sole','Gniks');

INSERT INTO DnD.attunement("oggetto","personaggio")
VALUES ('fiamma sacra','Hamon');

INSERT INTO DnD.attunement("oggetto","personaggio")
VALUES ('Carte del destino','Jack');

INSERT INTO DnD.attunement("oggetto","personaggio")
VALUES ('Tavola della legge','Zaphis');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('Olio blu','Gniks');

INSERT INTO DnD.attunement("oggetto","personaggio")
VALUES ('Anello della luna','Vilgy');

INSERT INTO DnD.attunement("oggetto","personaggio")
VALUES ('Anello del sole','Arcy');

INSERT INTO DnD.attunement("oggetto","personaggio")
VALUES ('Tavola della legge','Nicolas');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('Anello della luna','Gniks');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('Anello del sole','Gniks');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('fiamma sacra','Hamon');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('Carte del destino','Jack');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('Tavola della legge','Zaphis');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('Olio blu','Gniks');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('Anello della luna','Vilgy');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('Anello del sole','Arcy');

INSERT INTO DnD.inventario("oggetto","personaggio")
VALUES ('Tavola della legge','Nicolas');

COMMIT work;