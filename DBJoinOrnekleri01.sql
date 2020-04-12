CREATE TABLE departman (
   departman_id serial PRIMARY KEY,
   departman_ismi VARCHAR (255) NOT NULL
);
 
CREATE TABLE personel (
   personel_id serial PRIMARY KEY,
   personel_ismi VARCHAR (255),
   departman_id INTEGER
);

CREATE TABLE demirbas (
   demirbas_id serial PRIMARY KEY,
   demirbas_ismi VARCHAR (255),
   departman_id INTEGER
);

INSERT INTO departman (departman_ismi)
VALUES
   ('Satış'),
   ('Pazarlama'),
   ('İnsan Kaynakları'),
   ('Bilişim'),
   ('Üretim');
 
INSERT INTO personel (personel_ismi,departman_id)
VALUES
   ('Bette Nicholson', 1),
   ('Christian Gable', 1),
   ('Joe Swank', 2),
   ('Fred Costner', 3),
   ('Sandra Kilmer', 4),
   ('Julia Mcqueen', NULL);
 
INSERT INTO demirbas (demirbas_ismi, departman_id)
VALUES
   ('Mantar Pano', 1),
   ('Bilgisayar', 4),
   ('Yazıcı', 4),
   ('mouse',4),
   ('fatura koçanı', 2);


-- inner join 

select personel_ismi, departman_ismi
from personel p
inner join departman d 
on d.departman_id = p.departman_id

select personel_ismi, departman_ismi
from personel p
inner join departman d 
on d.departman_id = p.departman_id 
order by departman_ismi

select personel_ismi, departman_ismi
from personel p
inner join departman d 
on d.departman_id = p.departman_id
where p.departman_id = 3


-- left join 

select personel_ismi, departman_ismi
from personel p
left join departman d on d.departman_id = p.departman_id

select personel_ismi, departman_ismi
from personel p
left join departman d on d.departman_id = p.departman_id
where departman_ismi is null


-- right join

select personel_ismi, departman_ismi
from personel p
right join departman d on d.departman_id = p.departman_id  

select personel_ismi, departman_ismi
from personel p
right join departman d on d.departman_id = p.departman_id 
where personel_ismi is null


-- full outer join
select personel_ismi, departman_ismi
from personel p
full outer join departman d
on d.departman_id = p.departman_id

select personel_ismi, departman_ismi
from personel p
full outer join departman d
on d.departman_id = p.departman_id
where personel_ismi is null

select personel_ismi, departman_ismi
from personel p
full outer join departman d
on d.departman_id = p.departman_id
where departman_ismi is null




































