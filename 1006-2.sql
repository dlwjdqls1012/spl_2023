create or replace trigger afterinsertbook
after insert on book for each row
declare
    aveage number;
begin
    insert into book_log 
    values (:new.bookid, :new.bookname, :new.publisher, :new.price);
    DBMS_OUTPUT.PUT_LINE('���� ���� book_log ���̺� ����߽��ϴ�.');
end;

insert into book values(15, '���� �Ⱦ��', '���й̵��', 25000);
select * from book where bookid_1=15;
select * from book_log where bookid_1=15;