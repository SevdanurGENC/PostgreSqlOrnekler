-- COUNT fonksiyonu
select count(*) from musteri
select count(*) from musteri where sehir = 'Kastamonu'
select count(*) from musteri where sehir = 'Kastamonu' and bakiye>8000

-- SUM fonksiyonu
select sum(bakiye) from musteri
select sum(bakiye) from musteri where sehir = 'Kastamonu'
select sum(bakiye) from musteri where sehir != 'Kastamonu'

-- AVG Fonksiyonu
select AVG(bakiye) from musteri
select AVG(bakiye) from musteri where sehir = 'Kastamonu'

-- MAX Fonksiyonu
select Max(bakiye) from musteri
 
-- MIN Fonksiyonu
select Min(bakiye) from musteri

select Max(bakiye), Min(bakiye) from musteri 
select Max(bakiye) - Min(bakiye) from musteri
select Min(bakiye) from musteri where sehir = 'Kastamonu'
