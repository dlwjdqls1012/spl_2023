create table book_log(
    bookid_1 number,
    bookname_1 varchar2(40),
    publisher_1 varchar2(40),
    price_1 number
);

create or replace function fnc_interest (price number)
                            return int
is
    myInterest number;
begin
    if price >= 30000 then
        myInterest := price*0.1;
    else
        myInterest := price*0.05;
    end if;
    return myInterest;
end;

--실행할 떄 블럭설정하고 실행하세요
select custid, orderid, saleprice, fnc_interest(saleprice) from orders;

