create table departman(
d_id serial primary key,
	d_ismi varchar(255) not null
);

create table personel(
p_id serial primary key,
	p_ismi varchar(255), 
	d_id integer
);

insert into departman(d_id, d_ismi)
values (1, 'Satis'),
(2, 'Pazarlama'),
(3, 'Insan Kaynaklari'),
(4, 'IT - Bilgi islem'),
(5, 'Uretim');

select * from departman;

insert into personel(p_id, p_ismi, d_id)
values (1, 'Bette Nicholson', 1),
(2, 'Christian Gable', 1),
(3, 'Joe Swank', 2),
(4, 'Fred Conster', 3),
(5, 'Sandra Kilmer', 4),
(6, 'Julia McQueen', null);

select * from personel;

select p.p_ismi, d.d_ismi
from personel p
inner join departman d on p.d_id = d.d_id
where p.p_id = 3

select p.p_ismi, d.d_ismi
from personel p
inner join departman d on p.d_id = d.d_id
order by d.d_ismi

select p.p_ismi, d.d_ismi
from personel p
left join departman d on d.d_id = p.d_id
where d.d_ismi is null


select p.p_ismi, d.d_ismi
from personel p
right join departman d on d.d_id = p.d_id
where p.p_ismi is null

select p.p_ismi, d.d_ismi
from personel p
full outer join departman d on d.d_id = p.d_id
--where p.p_ismi is null
where d.d_ismi is null

create table demirbas(
dm_id serial primary key, 
	dm_ismi varchar(255),
	d_id integer
);

insert into demirbas(dm_id, dm_ismi, d_id)
values (1, 'Mantar Pano', 1),
(2, 'Bilgisayar', 4),
(3, 'Yazici', 4),
(4, 'Mouse', 4),
(5, 'Fatura Kocani', 2);

select * from demirbas;

select p.p_ismi, d.d_ismi, dm.dm_ismi
from personel p
inner join departman d on p.d_id = d.d_id
inner join demirbas dm on dm.d_id = d.d_id

select p.p_ismi, d.d_ismi, dm.dm_ismi
from personel p
left join departman d on p.d_id = d.d_id
left join demirbas dm on dm.d_id = d.d_id

select p.p_ismi, d.d_ismi, dm.dm_ismi
from personel p
right join departman d on p.d_id = d.d_id
right join demirbas dm on dm.d_id = d.d_id

select p.p_ismi, d.d_ismi, dm.dm_ismi
from personel p
full join departman d on p.d_id = d.d_id
full join demirbas dm on dm.d_id = d.d_id
