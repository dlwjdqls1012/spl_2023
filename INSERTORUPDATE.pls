create or replace PROCEDURE insertorupdate(
mybookid number,
mybookname varchar2,
mypublisher varchar2,
myprice int
)
as
mycount number;

BEGIN
    select count(*) into mycount from book
    where bookname like mybookname;

if mycount != 0 then
update book set price = myprice
where bookname like mybookname;
else 
    insert into book(bookid, bookname, publisher, price)
    values(mybookid, mybookname, mypublisher, myprice);
    end if;
end insertorupdate;