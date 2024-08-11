drop database if exists gestion_stag;
create database if not exists gestion_stag;
use gestion_stag;

create table stagiaire(
    idStagiaire int(4) auto_increment primary key,
    nom varchar(50),
    prenom varchar(50),
    civilite varchar(1),
    photo varchar(100),
    idFiliere int(4)
);

create table filiere(
    idFiliere int(4) auto_increment primary key,
    nomFiliere varchar(50),
    niveau varchar(50)
);

create table utilisateur(
    iduser int(4) auto_increment primary key,
    login varchar(50),
    email varchar(255),
    role varchar(50),   -- admin ou visiteur
    etat int(1),        -- 1:activé 0:desactivé
    pwd varchar(255)
);

Alter table stagiaire add constraint 
    foreign key(idFiliere) references filiere(idFiliere);

INSERT INTO filiere(nomFiliere,niveau) VALUES
    ('GENIE LOGICIEL','1'),
    ('RESEAU ET SECURITE II','2'),
    ('RESEAU ET TELELCOM III','3'),
    ('MECATRONIQUE IV','4'),
    ('IIA V','5'),
    
    ('GENIE LOGICIEL V','5'),
    ('RESEAU ET SECURITE','1'),
    ('RESEAU ET TELELCOM II','2'),
    ('MECATRONIQUE III','3'),
    ('IIA IV','4'),
    
    ('GENIE LOGICIEL IV','4'),
    ('RESEAU ET SECURITE V','5'),
    ('RESEAU ET TELELCOM','1'),
    ('MECATRONIQUE II','2'),
    ('IIA III','3'),
    
    ('GENIE LOGICIEL III','3'),
    ('RESEAU ET SECURITE IV','4'),
    ('RESEAU ET TELELCOM V','5'),
    ('MECATRONIQUE','1'),
    ('IIA II','2'),
    
    ('GENIE LOGICIEL II','2'),
    ('RESEAU ET SECURITE III','3'),
    ('RESEAU ET TELELCOM IV','4'),
    ('MECATRONIQUE V','5'),
    ('IIA','1');

INSERT INTO utilisateur (login, email, role, etat, pwd) VALUES
('admin', 'senkuhasagere@gmail.com', 'ADMIN',1,md5('123')),
('user', 'user1@gmail.com', 'VISITEUR',0,md5('123')), 
('user2', 'byrontakamichi@gmail.com', 'VISITEUR',1,md5('123'));
INSERT INTO stagiaire (nom, prenom, civilite, photo, idFiliere) VALUES
('TCHANGO', 'LOUIS', 'M', 'MOI.jpg',21),
('ANOS', 'VOLDIGOAD', 'M', 'ANOS.jpg',2),
('HOSHINO', 'AI', 'F', 'AI.jpg',3),

('VERMILION', 'MEROLEONA', 'F', 'MEROLEONA.jpg',4),
('HOSHINO', 'AQUA', 'M', 'AQUA.jpg',5),
('DONQUIXOT', 'DOFLAMINGO', 'M', 'DOFLAMINGO.jpg',6),

('YEAGEAR', 'EREN', 'M', 'EREN.jpg',7),
('SON', 'GOKU', 'M', 'GOKU.jpg',8),
('HYUGA', 'HINATA', 'F', 'HINATA.jpg',1),

('FRESC', 'GON', 'M', 'GON.jpg',12),
('SATOU', 'KAZUMA', 'M', 'KAZUMA.jpg', 3),
('KIRIGAYA', 'KAZUTO', 'M', 'KIRITO.jpg',5),

('ISHIGAMI', 'SENKU', 'M', 'SENKU.jpg',5),
('NATSUKI', 'SUBARU', 'M', 'SUBARU.jpg',2),
('KEN', 'KANEKI', 'M', 'KANEKI.png',13),

('YAGAMI', 'LIGTH', 'M', 'LIGTH.jpg',7),
('MONKEY D', 'LUFFY', 'M', 'LUFFY.jpg',9),
('TEMPEST', 'LIMULE', 'M', 'LIMULE.jpg',9),

('GREMORY', 'RIAS', 'F', 'RIAS.jpg',15),
('USHUWA', 'SASUKE', 'M', 'SASUKE.png',7),
('7', '', 'M', '7.jpg',4),

('ASTA', '', 'M', 'ASTA.png',1),
('UZUMAKI', 'NARUTO', 'M', 'NARUTO.png',1),
('BURNDEAD', 'MASH', 'M', 'MASH.jpg',2),

('GOD', 'USHOP', 'M', 'GOD.jpg',11),
('ZERO TWO', '', 'F', 'zero.jpg',10),
('KIOTAKA', 'AYANOKOJI', 'M', 'AYANOKOJI.jpg',5),

('NARA', 'SHIKAMARU', 'M', 'SHIKAMARU.jpg',5),
('KATAGIRI', 'YUICHI', 'M', 'YUICHI.jpg',5),
('KIOTAKA', 'AYANOKOJI', 'M', 'AYANOKOJI.jpg',5),

('NAMIKAZE', 'MINATO', 'M', 'MINATO.jpg',5),
('SHIZURU', 'ICHINOI', 'F', 'SHIZURU.jpg',5),
('SUKIHIRO', 'YAMI', 'M', 'YAMI.jpg',5),

('LAMPEROUGE', 'LELOUCHE', 'M', 'LELOUCHE.png',5),
('GIOVANA', 'GIONOR', 'M', 'GIONOR.jpg',1),
('BATMAN ', '', 'M', 'BATMAN.jpg',5);
select * from filiere;
select * from stagiaire;
select * from utilisateur;