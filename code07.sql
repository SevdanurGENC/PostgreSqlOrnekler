-- Alt Sorgular : Sub Query
select * from musteri where bakiye = (select max(bakiye) from musteri) 
select * from musteri where bakiye = (select max(bakiye) from musteri where sehir = 'Kastamonu') 
select * from musteri where meslek = (select id from meslek where ad='Ogretmen')

update musteri set bakiye=bakiye+bakiye*0.1 where meslek=(select id from meslek where ad='Muhendis');
select * from musteri where meslek = (select id from meslek where ad='Muhendis')
