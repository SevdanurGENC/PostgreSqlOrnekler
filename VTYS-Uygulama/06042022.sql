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
where ogrno = 1
select * from ogrenci