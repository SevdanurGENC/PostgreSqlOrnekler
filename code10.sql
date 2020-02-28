-- veri tanimlama dili (DDL)

-- veri tabani olusturma
CREATE DATABASE universite

-- ALTER : tabloya yeni bir alan(sutun, column) ekleme
alter table public."tblPersonel" 
add eposta varchar(100) not null

-- DROP : var olan tablo veya veri tabanini silme
drop table public."tblPersonel" 
