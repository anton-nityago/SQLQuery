

create database mindbox

go

use mindbox

create table products (product char(20) null constraint product unique)

create table categories (category char(20) null constraint category unique)

create table stor (product char(20) null, category char(20) null)


alter table stor add constraint FK_stor_products foreign key (product) references products (product)

alter table stor add constraint FK_stor_categories foreign key (category) references categories (category)


insert into categories (category) values ('молочка'), ('мясо'), ('одежда')

insert into products (product) values ('молоко'), ('колбаса'), ('кефир'), ('курица'), ('туфли'), ('майка'), ('шкатулка'), ('телефон')

insert into stor (product, category) values ('молоко', 'молочка'), ('колбаса', 'мясо'), ('кефир', 'молочка'), ('курица', 'мясо'), ('туфли', 'одежда'), ('майка', 'одежда')


go

-- Запрос к базе

select distinct product into #temp from products except select product from stor

alter table #temp add category char(20) null

select * from #temp union select product, category from stor


-- Вывод:

-- | product | category |  
--_|_________|__________|
-- | кефир   | молочка  |           
-- | колбаса | мясо     |           
-- | курица  | мясо     |           
-- | майка   | одежда   |           
-- | молоко  | молочка  |           
-- | телефон | NULL     |
-- | туфли   | одежда   |           
-- | шкатулка| NULL     | 


