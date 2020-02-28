-- buyukten kucuge siralama
select * 
from  public."tblOgrenci" 
order by ortalama desc

-- gruplama yapma
select ogrno, AVG(ortalama)
from  public."tblOgrenci" 
group by ogrno

-- having ifadesi
SELECT fakulte, AVG(ortalama) 
FROM public."tblOgrenci"
GROUP BY fakulte 
HAVING AVG(ortalama) > 2.5
 
SELECT fakulte, COUNT(*) 
FROM public."tblOgrenci"
GROUP BY fakulte 
HAVING COUNT(*) > 1

-- ortalama alma fonksiyonu
select AVG(ortalama)
from public."tblOgrenci"  

-- toplama fonksiyonu
select SUM(ortalama)
from  public."tblOgrenci" 

-- toplam kayit sayisi
select count(*)
from  public."tblOgrenci" 

-- en buyuk ve en kucuk degerleri alan fonksiyonlar
select max(ortalama), min(ortalama)
from  public."tblOgrenci" 
