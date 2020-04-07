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

insert into personel(id, ad, soyad, yas, cinsiyet, sehir, ulke, maas)
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

select * from personel;

-- Maaş alanındaki bilgilerden “Türkiye” de yaşayanlara %10 ilave eden güncellemeyi yapınız.
update personel
set maas = maas + maas * 10/100
where ulke = 'Türkiye';
select * from personel;

-- Cinsiyeti Erkek olan personelin tüm bilgilerini listeleyiniz. 
select *
from personel
where cinsiyet = 'E';

-- Ad, Soyad, Mail alanı listeleyin. (Mail adsoyad@hotmail.com)
-- yeni bir sutun ismi olustururken bir kac alan ismini birlestirirken || kullaniriz. 

select ad, soyad, ad || soyad || '@hotmail.com' As "Mail"
from personel

-- Maaşı 2000 ile 3500 arasında olan personel bilgilerini listeleyiniz.
select *
from personel 
where maas between '$2000.00' and '$3500.00'

-- Maaşı 2000, 3000 ve 4000 olan personel bilgilerini listeleyiniz.
select *
from personel
where maas in ('$2000.00','$3000.00','$4000.00')

-- Maaş bilgisi girilmeyen kayıtların ad, soyad, ülke bilgilerini listeleyiniz.
select ad, soyad, ulke, maas
from personel
where maas is null

-- İsmi “A” ile başlayan kayıtların tüm bilgilerini listeleyiniz.
select *
from personel
where ad like 'A%'

-- Personel ad, soyad, ülke ve maaş bilgilerini yaş bilgisine göre küçükten büyüğe sıralayınız.
select ad, soyad, ulke, maas, yas
from personel
order by yas asc

-- Ad alanı küçük, Soyad alanı büyük harf olacak şekilde maaş bilgisiyle listeleyin.
select lower(ad) as "isim", upper(soyad) as "Soyisim"
from personel

-- Çalışanların kaç kişi olduğunu ve yaş ortalamasını bulun ve Sayı, Yaş_Ortalaması başlığı ile yazdırınız
select count(ad) as "Sayi", avg(yas) as "Yas_Ortalamasi"
from personel

-- Boş maaş alanlarına 2500 kayıt bilgisi güncellemesi yapınız.
select *
from personel
where maas is null

update personel
set maas = 2500
where maas is null

-- En yüksek ve en düşük maaş bilgilerini yan yana listeleyiniz.
select max(maas) as "En Yuksek Maas", min(maas) as "En Dusuk Maas"
from personel

-- Toplam kaç adet kayıt olduğunu listeleyiniz.
select count(id) As "Toplam Kayit Sayisi"
from personel

-- Toplam ödenen maaş miktarını bulun ve gösterin.
select sum(maas) as "Toplam Odenen Maas"
from personel
 
-- Ülkeye göre gruplama yaparak hangi ülkeden kaç kişi olduğunu listeleyiniz.
select ulke, count(*) as "Ulkelerdeki Kisi Sayisi"
from personel
group by ulke

-- Ülke ve yaşa göre 30 yaş üstü personelin kaç kişi olduğunu listeleyiniz.
select ulke, count(*) as "Kisi Sayisi"
from personel
where yas > 30
group by ulke

-- Cinsiyete göre yaş ortalamalarını ve kişi sayısını gösteren listelemeyi yapınız.
select cinsiyet, avg(yas) as "Yas Ortalamasi", count(*) as "Kisi Sayisi"
from personel
group by cinsiyet

-- Ülkeye göre maaş ortalamalarını , cinsiyet ve sayıları ile birlikte listeleyiniz.
select ulke, cinsiyet, avg(maas::numeric) as "Maas Ortalamasi", count(*) as "Kisi Sayisi"
from personel
group by ulke, cinsiyet

-- Ülke ve maaş ortalamalarını, cinsiyeti E olan ve personel sayısı 2 den küçük olanları listeleyiniz.
select ulke, avg(maas::numeric) As "Maas Ortalamasi"
from personel
where cinsiyet = 'E'
group by ulke
having count(*) < 2
