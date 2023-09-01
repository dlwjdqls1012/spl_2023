select * from book;

select * from book
            where bookname like '%과학%' and price>=15000;
            
select * from book
            where publisher='굿스포츠' or publisher='어크로스';
            
select * from book
            where publisher in('굿스포츠','어크로스');
            
select * from book order by bookname;

select * from book order by bookid;

select * from book order by price, bookname;

select * from book order by  price desc, bookname asc;

select * from orders;

select sum(saleprice) as 총판매금액 from orders;

select sum(saleprice) as 총판매금액 from orders
                            where custid=1;
                            
select sum(saleprice) as 총판매금액,
avg(saleprice) as 판매액평균,
min(saleprice) as 최저가격,
max(saleprice) as 최대가격
from orders;

select count(*) from orders;

select count(*) from orders where saleprice >= 13000;

select count(*) from orders where custid in(1, 3);

select count(*) 주문수량, sum(saleprice) 주문총액 from orders
group by custid
order by custid;

select custid, count(*) as 도서수량 from orders 
where saleprice > 8000
group by custid
having count(*) >=2
order by custid;

--1번문제

select * from book where bookid = 1;

select * from book where price >= 20000;

select sum(saleprice)
from orders
where custid = (select custid
from customer
where name = '박지성');

select count(*)
from orders
where custid = 1;

--2번문제

select count(*)
from book;

select count(DISTINCT publisher)
from book;

select  name, address
from customer;

select orderid from orders where orderdate between '23-11-12' and '23-11-30';

select orderid from orders where orderdate not between '23-11-12' and '23-11-30';

select name, address
from customer
where name like '권%';

select name, address
from customer
where name like '권_헌';