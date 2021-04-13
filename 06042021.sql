create database denemeDB;

create table ogrenci(
ogrno int not null, 
ad varchar(40) not null, 
soyad varchar(40) not null, 
dogumtarihi date, 
ortalama real,
primary key (ogrno)
);

select * 
from ogrenci;

insert into ogrenci (ogrno, ad, soyad, dogumtarihi, ortalama)
values (1, 'Sevdanur', 'GENC', '1983-04-03', 3.70);

insert into ogrenci
values (2, 'Selcuk', 'GENC', '1975-06-01', 3.90);

insert into ogrenci
values (3, 'Zeynep', 'Karaca', '1990-09-10', 2.20),
(4, 'Huseyin', 'Sahin', '1983-12-01', 2.00),
(5, 'Dogus Can', 'Yildiz', '1982-02-12', 1.90);


select *
from ogrenci;

select ogrno, ad, ortalama
from ogrenci;

select ogrno as "Ogrencinin Numarasi", ad as "Ogrencinin Adi", dogumtarihi as "Ogrencinin Dogum Tarihi"
from ogrenci;

-- Where Kullanımı
select *
from ogrenci
where ad = 'Zeynep' or soyad = 'Sahin'

select *
from ogrenci
where ortalama not between 2 and 3.8

select *
from ogrenci
where soyad not in ('GENC')

-- where ile iliskilendirme
create table fakulte(
id int,
fakulteadi varchar(100),
primary key (id)
)

insert into fakulte (id, fakulteadi)
values (1, 'Muhendislik Fakultesi'),
(2, 'Ziraat Fakultesi'),
(3, 'Tip Fakultesi'),
(4, 'Mimarlik Fakultesi')

select *
from fakulte

drop table ogrenci

create table ogrenci(
ogrno int not null, 
ad varchar(40) not null, 
soyad varchar(40) not null, 
dogumtarihi date, 
ortalama real,
fakulte int,
primary key (ogrno)
);

select * from ogrenci
 
insert into ogrenci (ogrno, ad, soyad, dogumtarihi, ortalama, fakulte)
values (1, 'Sevdanur', 'GENC', '1983-04-03', 3.70, 2),
(2, 'Selcuk', 'GENC', '1975-06-01', 3.90, 3),
(3, 'Zeynep', 'Karaca', '1990-09-10', 2.20, 1),
(4, 'Huseyin', 'Sahin', '1983-12-01', 2.00, 4),
(5, 'Dogus Can', 'Yildiz', '1982-02-12', 1.90, 2);


select ogrenci.ogrno, ogrenci.ad, ogrenci.soyad, ogrenci.ortalama, fakulte.fakulteadi
from ogrenci, fakulte
where ogrenci.fakulte = fakulte.id
and ad like '%e%'
and ortalama between 2 and 2.5


select o.ogrno, o.ad, o.soyad, o.ortalama, f.fakulteadi
from ogrenci as o, fakulte as f
where o.fakulte = f.





