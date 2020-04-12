create table tbl_ogrenci(
id serial, 
	ad varchar(50) not null, 
	soyad varchar(50) not null, 
	tc_kimlik bigint not null,
	primary key(id),
	unique(tc_kimlik)
);

create table tbl_ogrenci_iletisim(
id serial,
	tbl_ogrenci_id integer not null,
	iletisim_turu varchar(30),
	iletisim_deger varchar(50),
	primary key(id)
);


insert into tbl_ogrenci(id,ad,soyad,tc_kimlik)
values (1, 'Sevdanur', 'Genc', 12345678910),
(2,'Selcuk', 'Genc', 12345678911);

select * from tbl_ogrenci;

insert into tbl_ogrenci_iletisim(id, tbl_ogrenci_id, iletisim_turu, iletisim_deger)
values (1,1,'Cep Tel', '0 577 777 77 77'),
(2,1,'E-Mail','deneme@gmail.com'),
(3,1,'Ev Tel','0266 777 77 77');

select * from tbl_ogrenci_iletisim;

create or replace function sp_ogrenciCepTel(tcKimlik bigint)
returns varchar as
$body$
declare 
	cepTel varchar(50);
begin
	select oi.iletisim_deger into cepTel
	from tbl_ogrenci o
	left join tbl_ogrenci_iletisim oi on o.id = oi.tbl_ogrenci_id and oi.iletisim_turu = 'Cep Tel'
	where o.tc_kimlik = tcKimlik;
return cepTel;
end;
$body$
language 'plpgsql';

select * from sp_ogrenciCepTel(12345678910);

select *, sp_ogrenciCepTel(o.tc_kimlik) from tbl_ogrenci o;

select * from tbl_ogrenci o 
left join sp_ogrenciCepTel(o.tc_kimlik) cep_tel on 1=1;

create or replace function sp_ogrenciIletisim(tcNo bigint, out ilTur varchar, out ilDeger varchar)
returns setof record as
$body$
begin
	select oi.iletisim_deger, oi.iletisim_turu into ilTur, ilDeger
	from tbl_ogrenci o 
	left join tbl_ogrenci_iletisim oi on o.id = oi.tbl_ogrenci_id
	where o.tc_kimlik = tcNo;
return next;
end;
$body$
language 'plpgsql';

select * from sp_ogrenciIletisim(12345678910)

create or replace function sp_ogrenciIletisim2(tcNo bigint, out ilTur varchar, out ilDeger varchar)
returns setof record as
$body$
begin
for ilTur, ilDeger in
	select oi.iletisim_deger, oi.iletisim_turu
	from tbl_ogrenci o 
	left join tbl_ogrenci_iletisim oi on o.id = oi.tbl_ogrenci_id
	where o.tc_kimlik = tcNo
loop
	return next;
$body$
language 'plpgsql';

select * from sp_ogrenciIletisim2(12345678910)

create or replace function sp_ogrenciIletisim3(tcNo bigint, out ilTur varchar, out ilDeger varchar)
returns setof record as
$body$
begin
return query select oi.iletisim_deger as ilDeger, oi.iletisim_turu as ilTur
 	from tbl_ogrenci o 
	left join tbl_ogrenci_iletisim oi on o.id = oi.tbl_ogrenci_id
	where o.tc_kimlik = tcNo;
end;
$body$
language 'plpgsql';

select * from sp_ogrenciIletisim3(12345678910)


create or replace function sp_ogrenciIletisim4(tcNo bigint, out ilTur varchar, out ilDeger varchar)
returns setof record as
$body$
begin
return query select oi.iletisim_deger as ilDeger, oi.iletisim_turu as ilTur
 	from tbl_ogrenci o 
	left join tbl_ogrenci_iletisim oi on o.id = oi.tbl_ogrenci_id
	where o.tc_kimlik = tcNo;
return next;
end;
$body$
language 'plpgsql';

select *, sp_ogrenciIletisim4(o.tc_kimlik) from tbl_ogrenci o

select *, (sp_ogrenciIletisim4(o.tc_kimlik)).ilTur from tbl_ogrenci o

select *, (sp_ogrenciIletisim4(o.tc_kimlik)).ilTur,
(sp_ogrenciIletisim4(o.tc_kimlik)).ilDeger
from tbl_ogrenci o

select * from tbl_ogrenci o
join sp_ogrenciIletisim4(o.tc_kimlik) sp on 1=1


select * from sp_ogrenciIletisim4(12345678910) osp 
where osp.ilDeger = 'E-Mail'

select * from tbl_ogrenci o
join sp_ogrenciIletisim4(o.tc_kimlik) osp on true
where osp.ilDeger = 'E-Mail'

create or replace function sp_ogrenciIletisim5(tcNo bigint)
returns table (ilTur varchar,  ilDeger varchar) as 
$body$
begin
return query select oi.iletisim_deger as ilDeger, oi.iletisim_turu as ilTur
 	from tbl_ogrenci o 
	left join tbl_ogrenci_iletisim oi on o.id = oi.tbl_ogrenci_id
	where o.tc_kimlik = tcNo;
end;
$body$
language 'plpgsql';

select * from sp_ogrenciIletisim5(12345678910)


drop function sp_ogrenciIletisim4(tcNo bigint, out ilTur varchar, out ilDeger varchar)

 