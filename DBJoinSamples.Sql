create database DBJoinSamples;

create table tb_ogrenci(
id serial,
	ad varchar(50) not null,
	soyad varchar(50) not null,
	tc_kimlikno bigint not null,
	constraint tb_ogrenci_pkey primary key (id),
	constraint tb_ogrenci_tc_kimlikno_key unique (tc_kimlikno)
);

create table tb_dersler(
id serial,
	ders_adi varchar(20),
	derslik varchar(20),
	ogretmen_id integer,
	constraint tb_dersler_pkey primary key (id)
);

create table tb_ogrenci_notlar(
id serial,
	ogrenci_id integer,
	notu numeric(5,2),
	ders_id integer,
	constraint tb_ogrenci_notlar_pkey primary key (id),
	constraint tb_ogrenci_notlar_ogrenci_no_fkey foreign key(ogrenci_id)
	references tb_ogrenci(id)
	on delete no action
	on update no action
	not deferrable
);

create table tb_ogretmenler(
id serial, 
	adi varchar(50),
	soyadi varchar(50),
	constraint tb_ogretmenler_pkey primary key(id)
);

insert into tb_ogretmenler(id,adi,soyadi)
values (1, 'Ahmet', 'DEMIR'),
(2, 'Aslan', 'KULA'),
(4, 'Baki', 'SURGIT'),
(5, 'Basak', 'ALTAN'),
(6, 'Derya', 'FINDIKOGLU');

insert into tb_ogrenci(id, ad, soyad, tc_kimlikno)
values (1, 'Yasin','TATAR',102345678901),
(2, 'Ahmet','FINCAN', 99876543213),
(3, 'Fetih', 'ALA', 89876543567),
(4, 'Mehmet Emin', 'KARAKAS', 34567823456),
(5, 'Sahap', 'ASCI', 34780956342);

insert into tb_ogrenci_notlar(id,ogrenci_id,notu,ders_id)
values (1,1,85.00,1),
(2,1,75.00,2),
(3,1,100.00,4),
(6,1,90.00,5),
(7,1,52.00,3),
(8,2,88.00,1),
(9,2,78.00,2),
(10,2,100.00,4),
(11,2,93.00,5),
(12,2,55.00,3),
(13,3,80.00,1),
(14,3,70.00,2),
(15,3,95.00,4),
(16,3,85.00,5),
(17,3,47.00,3),
(18,4,78.00,1),
(19,4,68.00,2),
(20,4,93.00,4),
(21,4,83.00,5),
(22,4,45.00,3);

insert into tb_dersler(id,ders_adi,derslik,ogretmen_id)
values (1, 'Matematik', '1 Nolu Derslik', 1),
(2, 'Turkce', '5 Nolu Derslik', 2),
(3, 'Bilgisayar', 'Lab 1', 4),
(4, 'PostgreSql', 'Lab 2', Null),
(5, 'Delphi', '2 Nolu Derslik', Null);

// SELF JOIN
select * from tb_ogrenci og, tb_ogrenci_notlar ogn
where og.id = ogn.ogrenci_id 
and og.ad like '%a%'
and ogn.notu>50

select * from tb_ogrenci og, tb_ogrenci_notlar ogn, tb_dersler d
where og.id = ogn.ogrenci_id 
and d.id = ogn.ders_id
and og.ad like '%a%'
and ogn.notu>50

//INNER JOIN
select * from tb_ogrenci o
inner join tb_ogrenci_notlar n 
on n.ogrenci_id = o.id;

select * from tb_ogrenci o
inner join tb_ogrenci_notlar n on n.ogrenci_id = o.id
inner join tb_dersler d on d.id = n.ders_id
inner join tb_ogretmenler og on og.id = d.ogretmen_id
where n.notu >= 80
and o.id <>1;

//OUTER JOIN
////LEFT OUTER JOIN
select * from tb_ogrenci o
left outer join tb_ogrenci_notlar n on n.ogrenci_id = o.id
left outer join tb_dersler d on d.id = n.ders_id
left outer join tb_ogretmenler og on og.id = d.ogretmen_id

select * from tb_ogrenci o
left outer join tb_ogrenci_notlar n on n.ogrenci_id = o.id
left outer join tb_dersler d on d.id = n.ders_id
left outer join tb_ogretmenler og on og.id = d.ogretmen_id
where n.notu >= 80 and o.id <>1

select * from tb_ogrenci o
left outer join tb_ogrenci_notlar n on n.ogrenci_id = o.id
where n.ogrenci_id is Null

////RIGHT OUTER JOIN
select * from tb_ogrenci o
right outer join tb_ogrenci_notlar n on n.ogrenci_id = o.id
right outer join tb_dersler d on d.id = n.ders_id
right outer join tb_ogretmenler og on og.id = d.ogretmen_id

////FULL OUTER JOIN
select * from tb_ogrenci o
full outer join tb_ogrenci_notlar n on n.ogrenci_id = o.id
full outer join tb_dersler d on d.id = n.ders_id
full outer join tb_ogretmenler og on og.id = d.ogretmen_id

