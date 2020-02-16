-- Group By : Gruplandirma
select sehir,count(*) as KisiSayisi from musteri group by sehir order by count(*) desc

select sehir, sum(bakiye) from musteri group by sehir
select sehir, avg(bakiye) from musteri group by sehir

-- Having : Sartli gruplandirma
select sehir, count(*) from musteri group by sehir having count(*)>1
select avg(bakiye) as ortalama, sehir from musteri group by sehir having avg(bakiye)>5000
select avg(bakiye) as ortalama, sehir from musteri group by sehir having avg(bakiye)>5000 and sehir like '%t%'
