select * from book;

select * from book
            where bookname like '%����%' and price>=15000;
            
select * from book
            where publisher='�½�����' or publisher='��ũ�ν�';
            
select * from book
            where publisher in('�½�����','��ũ�ν�');
            
select * from book order by bookname;

select * from book order by bookid;

select * from book order by price, bookname;

select * from book order by  price desc, bookname asc;

select * from orders;

select sum(saleprice) as ���Ǹűݾ� from orders;

select sum(saleprice) as ���Ǹűݾ� from orders
                            where custid=1;
                            
select sum(saleprice) as ���Ǹűݾ�,
avg(saleprice) as �Ǹž����,
min(saleprice) as ��������,
max(saleprice) as �ִ밡��
from orders;

select count(*) from orders;

select count(*) from orders where saleprice >= 13000;

select count(*) from orders where custid in(1, 3);

select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� from orders
group by custid
order by custid;

select custid, count(*) as �������� from orders 
where saleprice > 8000
group by custid
having count(*) >=2
order by custid;

--1������
--������ȣ�� 1�� ������ �̸�
select * from book where bookid = 1;
--������ 20000�� �̻��� ������ �̸�
select * from book where price >= 20000;
--�������� �� ���ž�
select sum(saleprice)
from orders
where custid = (select custid
from customer
where name = '������');
--�������� ������ ������ ��
select count(*)
from orders
where custid = 1;

--2������
--���缭�� ������ �� ����
select count(*)
from book;
--���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(DISTINCT publisher)
from book;
--��� ���� �̸�,�ּ�
select  name, address
from customer;
--2023�� 11�� 12�� ���� 2023�� 11�� 30�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid from orders where orderdate between '23-11-12' and '23-11-30';
--2023�� 11�� 12�� ���� 2023�� 11�� 30�� ������ �ֹ� ���� ������ �ֹ���ȣ
select orderid from orders where orderdate not between '23-11-12' and '23-11-30';
--���� �Ǿ��� ����� �̸��� �ּ�
select name, address
from customer
where name like '��%';
--���� �Ǿ��̰� �̸��� ������ ������ ���� �̸��� �ּ�
select name, address
from customer
where name like '��_��';