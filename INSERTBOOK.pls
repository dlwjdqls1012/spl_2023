CREATE OR REPLACE PROCEDURE INSERTBOOK (
    myBookId in number,
    myBookName in varchar2, 
    myPublisher in varchar2,
    myPrice in number)
AS 
BEGIN
  insert into book(bookid, bookname, publisher, price)
  values(myBookId, myBookName, myPublisher, myPrice);
END;