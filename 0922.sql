--절대값 계산
select abs(-15) from dual;  
--올림 계산
select ceil(15.7) from dual;
--코사인 계산
select cos(3.14159) from dual;
-- 내림 계산
select floor(15.7) from dual;
-- 로그 계산
select log(10,100) from dual;
-- 나머지 계산
select mod(11,4) from dual;
--거듭제곱 계산
select power(3,2) from dual;
--반올림 계산
select round(15.7) from dual;
--숫자 부호 확인
select sign(-15) from dual;
-- 소수점 이하 제거
select trunc(15.7) from dual;
--아스키 코드 반환
select chr(67) from dual;
--문자열 연결
select concat('HAPPY','Birthday') from dual;
-- 문자열 소문자 변환
select lower('Birthday') from dual;
-- 왼쪽 패딩 추가
select lpad('Page 1', 15, '*.') from dual;
--왼쪽 문자 제거
select ltrim('Page 1','ae') from dual;
--문자열 대체
select replace('JACK', 'J', 'BL') from dual;
--오른쪽 패딩 추가
select rpad('Page 1', 15, '*.') from dual;
--오른쪽 문자 제거
select rtrim('Page 1', 'ae') from dual;
--문자열 일부 추출
select substr('ABCDEFG',3,4) from dual;
-- 왼쪽 O 제거
select trim(LEADING 0 FROM '00AA00') from dual;
-- 대문자로 변환
select upper('Birthday') from dual;
--문자의 아스키 코드 확인
select ascii('A') from dual;
-- 문자열 내 위치 찾기
select instr('CORPORATE FLOOR','OR',3,2) from dual;
-- 문자열 길이 확인
select length('Birthday') from dual;
-- 월 추가
select add_months(TO_DATE('14/05/21', 'yy/mm/dd'),1) from dual;
-- 현재 월의 마지막 날짜 확인
select last_day(sysdate) from dual;
-- 다음 주 특정 요일 확인
select next_day(sysdate, 'Thu') from dual;
-- 현재 날짜 및 시간 반올림
select round(sysdate) from dual;
-- 현재 시스템 날짜 및 시간 확인
select sysdate from dual;
--날짜를 문자열로 변환
select to_char(sysdate) from dual;
--숫자를 문자열로 변환
select to_char(123) from dual;
--문자열을 날짜로 변환
select to_date('12 05 2014', 'DD MM YYYY') from dual;
--문자열을 숫자로 변환
select to_number('12.3') from dual;
-- 조건에 따른 값 반환
select decode(1,1,'aa','bb') from dual;
-- 두 값 비교 후 널 반환
select nullif(123,345) from dual;
-- 널처리
select nvl(null, 123) from dual;

--고객의 이름과 전화번호를 출력하시오. (단, 전화번호가 없는 고객은 '연락처없음'으로 출력)
select name 이름, phone 전화번호 from customer;

select name 이름, nvl (phone,'연락처없음') 전화번호 from customer;

--고객목록에서 순번, 고객번호, 이름, 전화번호를 앞의 두명만 출력하시오.
select rownum 순번, custid, name, phone from customer;

select rownum 순번, custid, name, phone from customer
where rownum<=2;

--mybook 테이블 생성
create table mybook(
    bookid number not null primary key,
    price number
);

--데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;
--mybook에 만들어진 데이터 나옴
select bookid, nvl(price,0) from mybook;
--price가 null인 값을 0으로 표기
select *from mybook where price is null;
--mybook에서 price 가 null인 데이터만 표기
select * from mybook where price='';
--아무것도 안나오는데요.....?
select bookid,price+100 from mybook;
--price 값에 100씩 추가
select sum(price), avg(price), count(*) from mybook
where bookid >=4;
--bookid가 4이상인것의 평균 그런거 구하는건데 4이상이 없음
select sum(price), avg(price) from mybook;
--mybook의 price데이터의 평균과 더한것을 나오게

-- 1  "book" 테이블의 모든 데이터를 반환
select * from book;
-- 2 "book" 테이블에서 처음 5개의 행만 선택
select * from book
where rownum <= 5;
-- 3  "book" 테이블에서 처음 5개의 행을 선택하고 "price" 열을 기준으로 오름차순으로 정렬
select * from book
where rownum <= 5
order by price;
-- 4  "book" 테이블의 모든 행을 "price" 열을 기준으로 정렬한 다음, 그 결과에서 처음 5개의 행만 선택
select * from (select*from book order by price)b
where rownum <= 5;
-- 5 3이랑 같음
select * from (select*from book where rownum <= 5)b
order by price;
-- 6  "book" 테이블에서 처음 5개의 행을 선택하고, 그 결과를 "price" 열을 기준으로 오름차순으로 정렬
select *
from (select * from book where rownum <=5 order by price)b;

--평균판매금액 이하의 주문에 대해 주문번호와 판매금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액 from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

--각 고객의 평균판매금액보다 큰 금액의 주문 내역에대해서만 주문번호, 고객번호, 판매금액을 출력하시오.
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders;

select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid=so.custid);

--서울에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매금액 from orders;

select custid from customer
where address like '%서울%';

select sum(saleprice) 총판매금액 from orders
where custid not in(select custid from customer
where address like '%서울%');

--3번 고객이 주문한 도서의 최고금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액 from orders;
select saleprice from orders where custid = 3; 

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice > all(select saleprice from orders where custid = 3);

--서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
select sum(saleprice) 총판매금액 from orders mo
where exists(
    select * from customer c
    where address like '%서울%' and mo.custid = c.custid
);

--고객별 판매금액의 합계를 출력하시오. (고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

--고객별 판매금액의 합계를 출력하시오.(고객명, 판매합계)
select (select name from customer c
        where c.custid=o.custid) 고객명, sum(saleprice) 판매합계 from orders o
group by o.custid;

--주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname varchar2(40);

update orders o set bookname=(select bookname from book b where b.bookid=o.bookid);

--고객번호가 2이하인 고객번호와 이름을 출력하시오.
select custid 고객번호, name 이름 from customer
where custid <= 2;

--고객번호가 2이하인 고객의 판매금액을 출력하시오. (고객이름과 고객별 판매총액 출력)
select name 고객이름, sum(saleprice) 판매총액
from (select custid, name from customer
        where custid <= 2) c, orders o
where c.custid=o.custid
group by name;

--고객번호, 주소, 총판매액이 고객번호별로 묶어서출력되게 하는 수행문
select custid,(select address from customer cs
                where cs.custid=od.custid) "address",
                        sum(saleprice)"total"
from orders od
group by od.custid;