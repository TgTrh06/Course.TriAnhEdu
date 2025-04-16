/*
	- * Join
		- Left Join (A, B): A và phần trùng lặp giữa A và B
        - Right Join (A, B): B và phần trùng lặp giữa B và A
		- Inner Join (A, B): Phân trùng lặp giữa A và B
        - Full Join
*/

Create table Customer 
(
	cID int not null primary key auto_increment,
    cName varchar(25),
    cAge tinyint
);

Create table Product
(
	pID int not null primary key auto_increment,
    pName varchar(25),
    pPrice int
);

Create table Orders
(
	oID int not null primary key auto_increment,
    cID int,
    oDate datetime,
    oTotalPrice int,
    foreign key (cID) references Customer(cID)
);

Create table OrderDetail
(
	oID int,
    pID int,
    odQTY int,
	foreign key(oID) references Orders(oID),
    foreign key(pID) references Product(pID)
);

insert into customer (cName, cAge) values
("Minh Quân", 10),
("Ngọc Oanh", 20),
("Hồng Hà", 50);

insert into product (pName, pPrice) values
("Máy giặt", 3),
("Tủ lạnh", 5),
("Điều hòa", 7),
("Quạt", 1),
("Bếp điện", 2);

insert into Orders (cID, oDate, oTotalPrice)
values
(1, "2016-3-10", null),
(3, "2016-4-20", null),
(2, "2016-4-21", null),
(1, "2016-4-22", null),
(3, "2016-5-23", null);


insert into orderDetail
values
(1, 1, 3),
(1, 1, 3),
(1, 2, 3),
(2, 4, 3),
(3, 2, 3),
(2, 3, 3);


select oID, oDate, oTotalPrice
from orders
order by oDate DESC;

select * from product
where pprice = (select max(pPrice) from product);

select cName, pName
from customer cus
join orders ors
on cus.cID = ors.cID
join orderDetail ord
on ors.oID = ord.oID
join product p
on ord.pID = p.pID;

select * 
from customer
where cID not in (select cID from Orders group by cID);

select ors.*, p.pname, p.pprice
from orders ors
join orderDetail ord
on ors.oID = ord.oID
join product p
on ord.pID = p.pID;

select ors.oID, ors.odate, (ord.odQTY * p.pprice) as 'Total_money'
from orders ors
join orderDetail ord
on ors.oID = ord.oID
join product p
on ord.pID = p.pID;

select ors.oID, ors.odate, sum(ord.odQTY * p.pprice) as 'Total_money'
from orders ors
join orderDetail ord
on ors.oID = ord.oID
join product p
on ord.pID = p.pID
group by ors.oID;