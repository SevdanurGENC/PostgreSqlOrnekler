-- online ders icerigi (6.hafta genel tekrar)

-- tablo olusturma
create table ogrenci(
	ogrno int not null,
	ad varchar(40) not null,
	soyad varchar(40) not null,
	dogumtarihi date,
	ortalama real,
	primary key(ogrno)
)

select * from ogrenci
-- tekli kayit ekleme
insert into ogrenci (ogrno, ad, soyad, dogumtarihi, ortalama)
values (1, 'Ali', 'Cengiz', '1960-08-10', 2.70)

-- coklu kayit ekleme
insert into ogrenci (ogrno, ad, soyad, dogumtarihi, ortalama)
values (2, 'Ayse','Coban','1990-12-20',3.47),
(3, 'kadir','nizam','1980-10-30',4.00),
(4,'meltem','onder','1999-05-29',1.70)


select ogrno As "ogrencinin numarasi" , ad as "Ogrenci Adi", ortalama As "Ogrencinin Ortalamasi"
from ogrenci

select *
from ogrenci
where ortalama <= 3.00

select *
from ogrenci
where ortalama between 2.5 and 3.5

select *
from ogrenci
where ad like '%e%'

select *
from ogrenci
where ad not in ('Ali') 
and ortalama > 2.0
and soyad like '%z%'












