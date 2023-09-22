--���밪 ���
select abs(-15) from dual;  
--�ø� ���
select ceil(15.7) from dual;
--�ڻ��� ���
select cos(3.14159) from dual;
-- ���� ���
select floor(15.7) from dual;
-- �α� ���
select log(10,100) from dual;
-- ������ ���
select mod(11,4) from dual;
--�ŵ����� ���
select power(3,2) from dual;
--�ݿø� ���
select round(15.7) from dual;
--���� ��ȣ Ȯ��
select sign(-15) from dual;
-- �Ҽ��� ���� ����
select trunc(15.7) from dual;
--�ƽ�Ű �ڵ� ��ȯ
select chr(67) from dual;
--���ڿ� ����
select concat('HAPPY','Birthday') from dual;
-- ���ڿ� �ҹ��� ��ȯ
select lower('Birthday') from dual;
-- ���� �е� �߰�
select lpad('Page 1', 15, '*.') from dual;
--���� ���� ����
select ltrim('Page 1','ae') from dual;
--���ڿ� ��ü
select replace('JACK', 'J', 'BL') from dual;
--������ �е� �߰�
select rpad('Page 1', 15, '*.') from dual;
--������ ���� ����
select rtrim('Page 1', 'ae') from dual;
--���ڿ� �Ϻ� ����
select substr('ABCDEFG',3,4) from dual;
-- ���� O ����
select trim(LEADING 0 FROM '00AA00') from dual;
-- �빮�ڷ� ��ȯ
select upper('Birthday') from dual;
--������ �ƽ�Ű �ڵ� Ȯ��
select ascii('A') from dual;
-- ���ڿ� �� ��ġ ã��
select instr('CORPORATE FLOOR','OR',3,2) from dual;
-- ���ڿ� ���� Ȯ��
select length('Birthday') from dual;
-- �� �߰�
select add_months(TO_DATE('14/05/21', 'yy/mm/dd'),1) from dual;
-- ���� ���� ������ ��¥ Ȯ��
select last_day(sysdate) from dual;
-- ���� �� Ư�� ���� Ȯ��
select next_day(sysdate, 'Thu') from dual;
-- ���� ��¥ �� �ð� �ݿø�
select round(sysdate) from dual;
-- ���� �ý��� ��¥ �� �ð� Ȯ��
select sysdate from dual;
--��¥�� ���ڿ��� ��ȯ
select to_char(sysdate) from dual;
--���ڸ� ���ڿ��� ��ȯ
select to_char(123) from dual;
--���ڿ��� ��¥�� ��ȯ
select to_date('12 05 2014', 'DD MM YYYY') from dual;
--���ڿ��� ���ڷ� ��ȯ
select to_number('12.3') from dual;
-- ���ǿ� ���� �� ��ȯ
select decode(1,1,'aa','bb') from dual;
-- �� �� �� �� �� ��ȯ
select nullif(123,345) from dual;
-- ��ó��
select nvl(null, 123) from dual;

--���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�. (��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ���)
select name �̸�, phone ��ȭ��ȣ from customer;

select name �̸�, nvl (phone,'����ó����') ��ȭ��ȣ from customer;

--����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� ���� �θ� ����Ͻÿ�.
select rownum ����, custid, name, phone from customer;

select rownum ����, custid, name, phone from customer
where rownum<=2;

--mybook ���̺� ����
create table mybook(
    bookid number not null primary key,
    price number
);

--������ �� ����
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;
--mybook�� ������� ������ ����
select bookid, nvl(price,0) from mybook;
--price�� null�� ���� 0���� ǥ��
select *from mybook where price is null;
--mybook���� price �� null�� �����͸� ǥ��
select * from mybook where price='';
--�ƹ��͵� �ȳ����µ���.....?
select bookid,price+100 from mybook;
--price ���� 100�� �߰�
select sum(price), avg(price), count(*) from mybook
where bookid >=4;
--bookid�� 4�̻��ΰ��� ��� �׷��� ���ϴ°ǵ� 4�̻��� ����
select sum(price), avg(price) from mybook;
--mybook�� price�������� ��հ� ���Ѱ��� ������

-- 1  "book" ���̺��� ��� �����͸� ��ȯ
select * from book;
-- 2 "book" ���̺��� ó�� 5���� �ุ ����
select * from book
where rownum <= 5;
-- 3  "book" ���̺��� ó�� 5���� ���� �����ϰ� "price" ���� �������� ������������ ����
select * from book
where rownum <= 5
order by price;
-- 4  "book" ���̺��� ��� ���� "price" ���� �������� ������ ����, �� ������� ó�� 5���� �ุ ����
select * from (select*from book order by price)b
where rownum <= 5;
-- 5 3�̶� ����
select * from (select*from book where rownum <= 5)b
order by price;
-- 6  "book" ���̺��� ó�� 5���� ���� �����ϰ�, �� ����� "price" ���� �������� ������������ ����
select *
from (select * from book where rownum <=5 order by price)b;

--����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

--�� ���� ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ���������ؼ��� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid=so.custid);

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.
select sum(saleprice) ���Ǹűݾ� from orders;

select custid from customer
where address like '%����%';

select sum(saleprice) ���Ǹűݾ� from orders
where custid not in(select custid from customer
where address like '%����%');

--3�� ���� �ֹ��� ������ �ְ�ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;
select saleprice from orders where custid = 3; 

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice > all(select saleprice from orders where custid = 3);

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) ���Ǹűݾ� from orders mo
where exists(
    select * from customer c
    where address like '%����%' and mo.custid = c.custid
);

--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�. (����ȣ, �Ǹ��հ�)
select custid ����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����, �Ǹ��հ�)
select (select name from customer c
        where c.custid=o.custid) ����, sum(saleprice) �Ǹ��հ� from orders o
group by o.custid;

--�ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders o set bookname=(select bookname from book b where b.bookid=o.bookid);

--����ȣ�� 2������ ����ȣ�� �̸��� ����Ͻÿ�.
select custid ����ȣ, name �̸� from customer
where custid <= 2;

--����ȣ�� 2������ ���� �Ǹűݾ��� ����Ͻÿ�. (���̸��� ���� �Ǹ��Ѿ� ���)
select name ���̸�, sum(saleprice) �Ǹ��Ѿ�
from (select custid, name from customer
        where custid <= 2) c, orders o
where c.custid=o.custid
group by name;

--����ȣ, �ּ�, ���Ǹž��� ����ȣ���� �����µǰ� �ϴ� ���๮
select custid,(select address from customer cs
                where cs.custid=od.custid) "address",
                        sum(saleprice)"total"
from orders od
group by od.custid;