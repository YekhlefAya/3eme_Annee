

create table produit( 
np         number(4), 
libp         varchar(30), 
coul         char(15), 
poids number(10), 
PU           number(10), 
QTES          number(10), 
constraint pk_pro primary key(np));

create table client( 
ncl         char(10), 
nomcl         char(20), 
adrcl char(20), 
constraint pk_cl primary key(ncl));


create table commande( 
ncmd varchar(10), 
datecmd date, 
ncl char(10), 
constraint pk_cmd primary key(ncmd), 
constraint fk_cmd_cl foreign key(ncl) references client(ncl) 
);

create table ligne_cmd( 
ncmd varchar(10), 
np number(10), 
qte number(20));


insert into produit values(1,'Robinet','Gris',5,18,1200);

insert into produit values(2,'Prise','Blanc',2,15,1000);

insert into produit values(3,'Cable','Blanc',2,25,1500);

insert into produit values(4,'Peinture','Blanc',25,330,900);

insert into produit values(5,'Poignée','Gris',3,12,1300);

insert into produit values(6,'Serrure','Jaune',2,47,1250);

insert into produit values(7,'Verrou','Gris',5,7,2000);

insert into produit values(8,'Fer','Noir',50,90,800);



insert into client values('CL01','Erradi','Tanger');

insert into client values('CL02','Sbai','Kenitra');

insert into client values('CL03','Raouf','Casablanca');

insert into client values('CL04','Kamil','Rabat');

insert into client values('CL05','Raouf','Marrakech');

insert into client values('CL06','Elkohen','Safi');

insert into client values('CL07','Mamoun','Marrakech');

insert into client values('CL08','Samir','Casablanca');

insert into client values('CL09','Diouri','Agadir');

insert into client values('CL10','Essaid','Oujda');

insert into client values('CL11','Berrada',' ');







insert into ligne_cmd values('C001',1,250);

insert into ligne_cmd values('C001',4,300);

insert into ligne_cmd values('C001',6,100);

insert into ligne_cmd values('C002',2,200);

insert into ligne_cmd values('C002',7,550);

insert into ligne_cmd values('C003',1,50);

insert into ligne_cmd values('C004',2,100);

insert into ligne_cmd values('C004',4,150);

insert into ligne_cmd values('C004',5,70);

insert into ligne_cmd values('C004',8,90);

insert into ligne_cmd values('C005',1,650);

insert into ligne_cmd values('C005',2,100);



insert into commande values('C001',TO_DATE('12/01/2016', 'DD/MM/YYYY'),'CL02');

insert into commande values('C002',TO_DATE('13/02/2017','DD/MM/YYYY'),'CL05');

insert into commande values('C003',TO_DATE('15/08/2019','DD/MM/YYYY'),'CL03');

insert into commande values('C004',TO_DATE('21/03/2020','DD/MM/YYYY'),'CL05');

insert into commande values('C005',TO_DATE('19/04/2020','DD/MM/YYYY'),'CL03');


