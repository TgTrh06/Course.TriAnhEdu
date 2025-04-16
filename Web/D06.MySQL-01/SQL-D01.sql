show tables

/*
	- SELECT
*/
SELECT * FROM books;

INSERT INTO books(title, price)
VALUE ('De men phieu luu ky', 20000);
INSERT INTO books(title, price)
VALUE ('Nhung ngoi sao xa soi', 30000);
INSERT INTO books(title, price)
VALUE ('Trang non', 40000);

DELETE FROM books WHERE id=1;

UPDATE books 
SET title = 'Thuy hu tap 2' WHERE id = 3;

ALTER table books
ADD COLUMN author nvarchar(255) null;