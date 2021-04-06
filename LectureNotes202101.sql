 -- veri tabani olusturma
 CREATE DATABASE deneme123;
 
 -- tablo olusturma
 Create table personel (
        personel_id int NOT NULL,
        soyad varchar(30) NOT NULL,
        isim varchar(50),
        adres varchar(100),
        sehir varchar(14),
   UNIQUE (personel_id)
);

-- tabloya veri girisi
INSERT INTO personel(personel_id,soyad,isim,adres,sehir) VALUES (1,'GENC', 'Sevdanur', 'Kastamonu Üniversitesi', 'Kastamonu');
INSERT INTO personel VALUES (2,'SAHIN','Huseyin','Uludag Universitesi','Bursa');
INSERT INTO personel VALUES (3,'KARACA','Zeynep','Anadolu Universitesi','Eskisehir');
INSERT INTO personel VALUES (4,'YILDIZ','Dogus Can','Dokuz Eylul Universitesi','Izmir');
INSERT INTO personel VALUES (5,'GENC','Selcuk','Tech University Of America','USA');

-- tablodaki verileri listeleme
select * from personel;

-- veri guncelleme
UPDATE personel SET sehir='İstanbul' WHERE personel_id=1;
UPDATE personel SET adres='Suleyman Demirel Universitesi' WHERE personel_id=1;
UPDATE personel SET adres='Kastamonu Üniversitesi' WHERE personel_id BETWEEN 2 AND 4; 

-- veri silme
DELETE FROM personel WHERE sehir='USA';

-- tablodaki verileri listeleme
SELECT * FROM personel WHERE personel_id<=3;
SELECT * FROM personel ORDER BY personel_id;
SELECT * FROM personel WHERE sehir='İstanbul' OR (personel_id=2 OR personel_id=4); 

-- tablo silme
DROP TABLE personel;

-- veri tabani silme
DROP DATABASE deneme;
