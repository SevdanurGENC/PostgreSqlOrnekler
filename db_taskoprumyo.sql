create database taskoprumyo

create table ogrenci(
ogrno int not null,
ad varchar(40) not null,
soyad varchar(40) not null,
dogumtarihi date,
ortalama real,
primary key (ogrno)
) 

select ogrno, ad, soyad, dogumtarihi, ortalama, fakulteadi
from public."tblOgrenci", public."tblFakulte"
where public."tblOgrenci".fakulte = public."tblFakulte".id
and ortalama between 2.5 and 4
and ad like '%e%'
 
