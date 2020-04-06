create table personel(
id int,
ad varchar(50),
soyad varchar(50),
yas int,
cinsiyet varchar(2),
sehir varchar(50),
ulke varchar(50),
maas money
);

insert into personel(id,ad,soyad,yas,cinsiyet,sehir,ulke,maas)
values (2,'Ahmet','Yilmaz',20, 'E', 'Ankara', 'Türkiye',2000),
(3,'Mehmet','Efe',22, 'E', 'Bolu', 'Türkiye',2000),
(4,'Ayse','Can',23, 'B', 'Istanbul', 'Türkiye',null),
(5,'Fatma','Ak',35, 'B', 'Ankara', 'Türkiye',3200),
(6,'John','Smith',45, 'E', 'New York', 'USA',3000),
(7,'Ellen','Smith',40, 'B', 'New York', 'USA',3500),
(8,'Hans','Müller',30, 'E', 'Berlin', 'Almanya',4000),
(9,'Frank','Cesanne',35, 'E', 'Paris', 'Fransa',null),
(10,'Abbas','Demir',26, 'E', 'Adana', 'Türkiye',2000),
(11,'Hatice','Topsuz',26, 'B', 'Hatay', 'Türkiye',2200),
(12,'Gülsüm','Demir',35, 'B', 'Adana', 'Türkiye',2000); 

update personel
set maas = maas + maas * 10/100
where ulke = 'Türkiye';

select * from personel;

select *
from personel
where cinsiyet = 'E';

select ad, soyad, ad || soyad || '@hotmail.com' As "Mail"
from personel;
 
select * 
from personel
where maas between '$2000.00' and '$3500.00';
 
select *
from personel 
where maas in ('$2000.00','$3000.00','$4000.00');

select ad,soyad,ulke
from personel 
where maas is null;

select *
from personel 
where ad Like 'A%';

select ad,soyad,ulke,maas
from personel 
order by yas asc;

select upper(ad) As isim, lower(soyad) As soyisim, maas
from personel;
 
select COUNT(ad) as Sayi, avg(yas) as Yas_Ortalamasi 
from personel; 

update personel
set maas = 2500
where maas is null;

select * from personel;

select MAX(maas) as "en yüksek maas", MIN(maas) as "en düsük maas"
from personel; 

select COUNT(id) as "toplam kayıt"
from personel;  

select SUM(maas) as "toplam Odenen Maas"
from personel; 

select ulke, COUNT(*) as "kisi Sayisi"
from personel
group by ulke; 

select ulke, COUNT(*) as "Sayı"
from personel
where yas>30
group by ulke; 

select cinsiyet, AVG(yas) as "yas Ortalaması", COUNT(*) as "sayı"
from personel
group by cinsiyet;
 
select ulke, cinsiyet, AVG(maas::numeric) as "Maas Ortalamasi", COUNT(*) as "Sayı"
from personel
group by ulke,cinsiyet; 

select ulke, AVG(maas::numeric) as "Maas Ortalamasi"
from personel
where cinsiyet = 'E' 
group by ulke
having count(*)<2; 
