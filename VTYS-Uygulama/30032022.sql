create database taskoprumyo

create table ogrenci(
	ogrNo int not null,
	ogrAd varchar(50) not null,
	ogrSoyad varchar(50) not null,
	dogumTarihi date,
	ortalama real,
	primary key (ogrNo)
)

--tabloya veri ekleme kodudur
insert into ogrenci (ogrno,ograd,ogrsoyad,dogumtarihi,ortalama) 
values (1,'Ali','Cengiz','2000-10-12',3.75)

--tablodaki tüm verileri görmek için * kullanılır
select *
from ogrenci
--tablodaki belirli alanları görebilmek için istenen alan isimleri kullanılır
select ograd, ogrsoyad, ortalama
from ogrenci

--tabloya veri ekleme kodudur
insert into ogrenci (ogrno,ograd,ogrsoyad,dogumtarihi,ortalama) 
values (2,'Fatma','Burcak','2000-05-25',1.60),
(3,'Barış','Özarslan','2000-10-15',4.00),
(4,'Ayşe','Yusuf','2000-08-28',2.55),
(5,'Can','Aksakal','2000-12-12',3.00)

-- AS Parametresi : İstenilen alanın ismini geçici olarak değiştirebiliyoruz.
select ogrno AS "Öğrenci Numarası", ogrAd as "Öğrenci Adı", ogrsoyad as "Öğrenci Soyadı" 
from ogrenci

-- WHERE Koşul yapısı
-- ortalaması 3 ve 3ün üzerindeki öğrencileri listeleme
select *
from ogrenci
where ortalama >= 3.00 


-- doğum tarihi 2000 ağustos ve ekim arasındakileri listeleyelim
select * 
from ogrenci
where dogumtarihi between '2000-08-01' and '2000-10-31'