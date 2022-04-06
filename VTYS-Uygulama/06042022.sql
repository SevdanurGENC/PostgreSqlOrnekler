create table bolum(
id int not null,
fakulteAdi varchar(50) not null,
primary key(id)
)
insert into bolum(id, fakulteadi)
values (1, 'Muhendislik Fakultesi'),
(2, 'Ziraat Fakultesi'),
(3, 'Fen Bilimleri Fakultesi'),
(4, 'Mimarlik Fakultesi')
select * from bolum

select * from ogrenci

--alter table : Tablo guncelleme islemi yapılıyor;
--add column : sütun ekler (yeni alan ismi ve veri türü verilir)
alter table ogrenci
add column fakulte varchar(50)

--tablodaki verileri güncellemek için update komudu kullanılır
update ogrenci
set fakulte = 2
where ogrno = 1;

update ogrenci
set fakulte = 3
where ogrno = 2;

update ogrenci
set fakulte = 4
where ogrno = 3;

update ogrenci
set fakulte = 1
where ogrno = 4;

update ogrenci
set fakulte = 2
where ogrno = 5;

select * from ogrenci

--iliskilendirme cumlesi için gerekli olan yapı;
--where 'den sonra birinciTabloİsmi.Alanİsmi = ikinciTabloİsmi.Alanİsmi
select ogrenci.ogrno, ogrenci.ograd, ogrenci.ogrsoyad,
ogrenci.ortalama, bolum.fakulteadi
from ogrenci, bolum
where bolum.id = ogrenci.fakulte

--drop column: var olan bir alanı tablodan kaldırır
alter table ogrenci
drop column fakulte

--alter table : Tablo guncelleme islemi yapılıyor;
--add column : sütun ekler (yeni alan ismi ve veri türü verilir)
alter table ogrenci
add column fakulte int

--tablodan veri silme
delete from ogrenci
where ogrno = 5

select * from ogrenci









