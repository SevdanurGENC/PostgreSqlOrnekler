-- select id,ad,soyad from musteri
-- select sehir from musteri
-- select * from musteri

select * from musteri where ad='birsen'
select * from musteri where sehir='Ankara' and id=3
select bakiye from musteri
select * from musteri where sehir='Ankara' and bakiye>3000 or soyad='Kaya'

-- Like operatorunun kullanilmasi
select * from musteri where ad like '%a%'

-- Not Like operatorunun kullanilmasi                                                                                                                                                          
select * from musteri where ad not like '%s%'





