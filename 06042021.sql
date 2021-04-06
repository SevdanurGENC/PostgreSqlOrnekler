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




