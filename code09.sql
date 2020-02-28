-- veri ekleme sql cumlesi 
insert into public."tblFakulte" (id, fakulteadi)
values(5,'Veterinerlik Fakultesi');

select *
from public."tblFakulte"  

-- veri guncelleme sql cumlesi
update public."tblFakulte"
set fakulteadi = 'Ziraat Fakultesi'
where id = 5;

select *
from public."tblFakulte"  

-- veri silme sql cumlesi
delete from public."tblFakulte"
where id = 5;

select *
from public."tblFakulte"
