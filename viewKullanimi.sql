create table yazarlar(
id int not null, 
isim varchar(50) not null,
soyisim varchar(50) not null,
primary key(id)
);

create table kitaplar(
id int not null, 
yazar_id int not null,
isbn bigint not null,
	kitap_ismi varchar(50) not null,
	primary key(id)
);

insert into kitaplar(id, yazar_id, isbn, kitap_ismi)
values (1, 1, 234234, 'Dava'),
(2, 1, 349893, 'Donusum'),
(3, 2, 982374, 'Satranc');

select * from kitaplar;


insert into yazarlar(id, isim, soyisim)
values (1, 'Franz', 'Kafka'),
(2, 'Stefan', 'Zweid');

select * from yazarlar;


create or replace view kitapVeYazarBilgileri as
select kitaplar.kitap_ismi, kitaplar.isbn, yazarlar.isim, yazarlar.soyisim, yazarlar.id
from kitaplar, yazarlar
where kitaplar.yazar_id = yazarlar.id
and yazarlar.id = 2


select * from kitapveyazarbilgileri

drop view if exists kitapveyazarbilgileri
