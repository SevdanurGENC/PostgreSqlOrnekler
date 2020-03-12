create database DBJoinOkul;

CREATE TABLE Ogrenci(
    OgrenciId int,
    AdSoyad varchar(100)
);

CREATE TABLE Danisman(
    DanismanId int,
    AdSoyad varchar(100)
);
  
CREATE TABLE OgrenciDanisman(
    OgrenciDanismanId int,
    OgrenciId int,
    DanismanId int
);

INSERT into Ogrenci 
VALUES 
(1,'Öğrenci_1'),
(2,'Öğrenci_2'),
(3,'Öğrenci_3'),
(4,'Öğrenci_4');
 
INSERT into Danisman 
VALUES
(1,'Danışman_1'),
(2,'Danışman_2'),
(3,'Danışman_3'),
(4,'Danışman_4');
 
INSERT into OgrenciDanisman 
VALUES 
(1,1,2),
(2,3,2),
(3,4,1);

select * from ogrenci;
select * from danisman;
select * from ogrencidanisman;

--inner join kullanımı
select o.* 
from ogrenci o
inner join ogrencidanisman od
on o.ogrenciid = od.ogrenciid

--ikiden fazla tabloda ilişki kurabilmek için ikinci bir inner join kullanmış oluyoruz
select o.ogrenciid, o.adsoyad, d.danismanid, d.adsoyad
from ogrenci o
inner join ogrencidanisman od
on o.ogrenciid = od.ogrenciid
inner join danisman d
on od.danismanid = d.danismanid

-- left join kullanımı
select *
from ogrenci o
left join ogrencidanisman od
on o.ogrenciid = od.ogrenciid
 
select *
from ogrenci o
left join ogrencidanisman od
on o.ogrenciid = od.ogrenciid
where od.danismanid is null

-- right join kullanımı 
select *
from ogrencidanisman od
right join danisman d
on d.danismanid = od.danismanid

select *
from ogrencidanisman od
right join danisman d
on d.danismanid = od.danismanid
where od.danismanid is null

-- full join kullanımı
select *
from ogrenci o
full join ogrencidanisman od
on o.ogrenciid = od.ogrenciid
full join danisman d
on d.danismanid = od.danismanid

-- cross join kullanımı
select *
from ogrenci o
cross join danisman d
order by ogrenciid





























































