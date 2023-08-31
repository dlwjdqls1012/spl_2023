insert into orders values (1, 1, 1, 6000, TO_DATE('2023-01-10', 'yyyy-mm-dd'));
insert into orders values (2, 1, 3, 11000, TO_DATE('2023-03-14', 'yyyy-mm-dd'));
insert into orders values (3, 2, 2, 7000, TO_DATE('2023-06-23', 'yyyy-mm-dd'));
insert into orders values (4, 3, 5, 9000, TO_DATE('2023-08-23', 'yyyy-mm-dd'));
insert into orders values (5, 4, 4, 3000, TO_DATE('2023-9-12', 'yyyy-mm-dd'));
insert into orders values (6, 2, 6, 5000, TO_DATE('2023-10-10', 'yyyy-mm-dd'));
insert into orders values (7, 4, 8, 6000, TO_DATE('2023-10-12', 'yyyy-mm-dd'));
insert into orders values (8, 1, 9, 7000, TO_DATE('2023-11-12', 'yyyy-mm-dd'));
insert into orders values (9, 3, 7, 6000, TO_DATE('2023-11-30', 'yyyy-mm-dd'));
insert into orders values (10, 1, 10, 11000, TO_DATE('2023-12-20', 'yyyy-mm-dd'));

INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

COMMIT;

select publisher, price from book
                        where bookname like 'Ãà±¸ÀÇ ¿ª»ç';
                        
select name, phone from customer
                        where name = '¹ÚÁö¼º';
            
select * from customer
                where name = '¹ÚÁö¼º';
                
select bookname, price from book;

select price, bookname from book;

select * from book;

select publisher from book;

select distinct publisher from book;

select * from book
        where price < 15000;

select * from book
        where price between 10000 and 16000;
        
select * from book
        where price >= 10000 and price <= 16000;
        
select * from book
        where publisher in ('±Â½ºÆ÷Ã÷','ÇØ³¿', '¿õÁøÁö½ÄÇÏ¿ì½º');
        
select * from book
        where publisher ='±Â½ºÆ÷Ã÷' or publisher='ÇØ³¿' or publisher='¿õÁøÁö½ÄÇÏ¿ì½º';
        
select * from book
        where publisher not in('±Â½ºÆ÷Ã÷', 'ÇØ³¿', '¿õÁøÁö½ÄÇÏ¿ì½º');
        
select * from book
        where publisher <> '±Â½ºÆ÷Ã÷' and publisher<>'ÇØ³¿' and publisher<>'¿îÁøÁö½ÄÇÏ¿ì½º';