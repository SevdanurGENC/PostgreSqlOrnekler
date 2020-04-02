-- Order by : Sirlama ASC / DESC paremetrelerini alir

select *
from public."tblOgrenci"
order by ortalama desc;

select ad, soyad
from public."tblOgrenci"
order by soyad, ad;

select ad, soyad
from public."tblOgrenci"
order by soyad desc, ad asc;

select ad, soyad
from public."tblOgrenci"
order by ogrno desc;

select ad, soyad, ortalama
from public."tblOgrenci"
where ortalama between 2.00 and 3.50
order by soyad desc

select * 
from public."tblOgrenci"
order by random();

-- Group By : Guruplama icin kullanilir
-- from ve where'den once kullanilir

select fakulte
from public."tblOgrenci"
where fakulte = 3
group by fakulte

select fakulte, count(*) As "Kac kisi"
from public."tblOgrenci"
where fakulte = 3
group by fakulte

select ortalama
from public."tblOgrenci"
where ortalama >= 1.50 and ortalama <= 3.50
group by ortalama

select ortalama, sum(ortalama)
from public."tblOgrenci"
where ortalama >= 1.50 and ortalama <= 3.50
group by ortalama

select ortalama, count(*) as "Kac kisi"
from public."tblOgrenci"
where ortalama >= 1.50 and ortalama <= 3.50
group by ortalama

select ortalama, count(*) as "Kac kisi"
from public."tblOgrenci"
where ortalama between 1.50 and 3.50
group by ortalama
order by ortalama desc

select ortalama, count(*) as "Kac kisi"
from public."tblOgrenci"
where ortalama between 1.50 and 3.50
group by ortalama
order by count(*) desc

select ortalama, avg(ortalama)
from public."tblOgrenci"
group by ortalama

select ortalama, count(*)
from public."tblOgrenci"
group by ortalama

-- Having : Where gibi kullanilir

select ortalama, avg(ortalama)
from public."tblOgrenci"
group by ortalama
having avg(ortalama) > 2.5

select ortalama, count(*)
from public."tblOgrenci"
group by ortalama
having count(*) > 1

select ortalama, sum(ortalama)
from public."tblOgrenci"
group by ortalama
having count(*) > 1

-- Limit ve Offset 
-- limit : sirali sayida
-- offset : belli bir sayidan sonra verileri getir

select ogrno, ad, soyad
from public."tblOgrenci"
limit 3;

select ogrno, ad, soyad
from public."tblOgrenci"
order by ogrno desc
limit 3;

select ogrno, ad, soyad
from public."tblOgrenci"
offset 2;

select ogrno, ad, soyad
from public."tblOgrenci"
order by ogrno desc
offset 2;

select ogrno, ad, soyad
from public."tblOgrenci"
order by ogrno desc
offset 2
limit 2;
