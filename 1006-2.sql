create or replace trigger afterinsertbook
after insert on book for each row
declare
    aveage number;
begin
    insert into book_log 
    values (:new.bookid, :new.bookname, :new.publisher, :new.price);
    DBMS_OUTPUT.PUT_LINE('삽입 행을 book_log 테이블에 백업했습니다.');
end;

insert into book values(15, '과학 싫어요', '과학미디어', 25000);
select * from book where bookid_1=15;
select * from book_log where bookid_1=15;