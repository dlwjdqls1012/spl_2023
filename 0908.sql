--���տ����� : ������(UNION), ������(MINUS), ������(INTERSECT)
--������ ������ ���
--������ �ֹ����� ���� ���� �̸��� ���ÿ�.
select name from customer;

select distinct custid from orders;

select name from customer
where custid in(select custid from orders);

--������ ������ ����� ���
select name from customer
minus
select name from customer
where custid in(select distinct custid from orders);

--������ ������ ������� ���� ���
select name from customer
where custid not in(select distinct custid from orders);

--EXISTS: ���������� ����� �����ϴ� ��쿡 true
--�ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.
--in������ ����� ���
select name, address from customer
where custid in (select distinct custid from orders);

--�������ΰ� �ߺ��� ������ ���
select distinct name, address from customer c, orders o
where c.custid = o.custid;

--Exists ����� ���
select name, address from customer c
where exists(select * from orders o
                            where c.custid = o.custid);
                            
--�������� ������ ������ ���ǻ� ��
SELECT COUNT(DISTINCT publisher) as "���ǻ� ��"
FROM Customer c, Orders o, Book b
WHERE (c.custid=o.custid) AND (b.bookid=o.bookid) AND (c.name='������');

--�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
SELECT bookname, price, (price-saleprice) as "���� ����"
from customer c, orders o, book b
where(c.custid = o.custid) and (b.bookid = o.bookid) and (c.name='������');

--�������� �������� ���� ������ �̸�
select bookname
from book, orders, customer
minus
select bookname
from book b, orders o, customer c
where(c.custid = o.custid) and (b.bookid = o.bookid) and (c.name='������');
--�ֹ����� ���� ���� �̸�(�μ����� ���)
SELECT name
FROM Customer
WHERE custid NOT IN (SELECT custid FROM Orders);
--�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
SELECT SUM(saleprice), AVG(saleprice)
FROM Orders;
-- ���� �̸��� ���� ���ž�
SELECT name, SUM(saleprice)
FROM Orders, Customer
WHERE Orders.custid=Customer.custid GROUP BY name;
-- ���� �̸��� ���� ������ ���� ���
SELECT name, bookname
FROM Book, Orders, Customer
WHERE Orders.bookid=Book.bookid AND Orders.custid=Customer.custid;
-- ������ ����(book���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
SELECT *
FROM Book, Orders
WHERE Book.bookid=Orders.bookid AND price-saleprice=(SELECT MAX(price-saleprice) FROM Book, Orders WHERE Book.bookid=Orders.bookid);
--������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
SELECT name
FROM Customer, Orders
WHERE Customer.custid=Orders.custid GROUP BY name HAVING AVG(saleprice) > (SELECT AVG(saleprice) FROM Orders);

--DDl(Data Defination Language): ������ ���Ǿ�
--create table/alter table/drop table
--���̺� ���� ����1
create table newbook1(
        bookid number,
        bookname varchar2(20),
        publisher varchar2(20),
        price number
);

--���̺� ���� ����2
--primary key ���� ��� 1
create table newbook2(
        bookid number,
        bookname varchar2(20),
        publisher varchar2(20),
        price number,
        PRIMARY KEY (bookid)
);

--primary key ���� ���2
create table newbook3(
        bookid number primary key,
        bookname varchar2(20),
        publisher varchar2(20),
        price number
);

--bookname �÷�: null�� ���� �� ����
--publisher �÷�: ������ ���� ���� �� ����
--price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000�����ϰ� �Էµ� ���� 1000�ʰ��� ��
--bookname, publisher �÷��� ����Ű�� ����

create table newbook4(
        bookname varchar2(20) not null,
        publisher varchar2(20) unique,
        price number default 10000 check (price > 1000),
        primary key(bookname, publisher)
);