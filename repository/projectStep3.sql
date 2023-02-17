-- CREATE DATABASE PROJECT_Step_3
CREATE DATABASE PROJECT_Step_3;

CREATE TABLE User( 
    userId integer, 
    first_name varchar(25), 
    last_name varchar(25), 
    phone_number varchar(20), 
    created_at DATE, 
    Updated_at DATE, 
    PRIMARY KEY(userId) 
);

CREATE TABLE Manager( 
    userId integer, 
    Manager_id integer, 
    Salary integer, 
    PRIMARY KEY(Manager_id), 
    FOREIGN KEY(userId) 
    REFERENCES User(userId) 
);

CREATE TABLE Resident( 
    userId integer, 
    resident_id integer, 
    Number_of_family integer, 
    PRIMARY KEY(resident_id), 
    FOREIGN KEY(userId) 
    REFERENCES User(userId) 
);

CREATE TABLE Location( 
    location_id integer, 
    city varchar(25), 
    created_at DATE, 
    Updated_at DATE, 
    Sub_city varchar(25), 
    Street varchar(30), 
    PRIMARY KEY(location_id) 
);

CREATE TABLE Building( 
    building_id integer, 
    Manager_id integer, 
    location_id integer, 
    PRIMARY KEY(building_id), 
    created_at DATE, 
    Updated_at DATE, 
    FOREIGN KEY(Manager_id) 
    REFERENCES Manager(Manager_id), 
    FOREIGN KEY(location_id) 
    REFERENCES Location(location_id) 
);


CREATE TABLE Floor( 
    floor_id integer, 
    Building_id integer, 
    created_at DATE, 
    Updated_at DATE,
    PRIMARY KEY(floor_id), 
    FOREIGN KEY(Building_id) 
    REFERENCES Building(Building_id) 
);

CREATE TABLE Room( 
    room_id integer, 
    Floor_id integer, 
    created_at DATE, 
    Updated_at DATE, 
    Number_of_classes integer, 
    PRIMARY KEY(room_id), 
    FOREIGN KEY(Floor_id) 
    REFERENCES Floor(Floor_id) 
);

CREATE TABLE Rent( 
    rent_id integer, 
    Resident_id integer, 
    Room_id integer, 
    Monthly_Price integer, 
    created_at DATE, 
    Updated_at DATE, 
    PRIMARY KEY(rent_id), 
    FOREIGN KEY(Resident_id) 
    REFERENCES Resident(Resident_id), 
    FOREIGN KEY(Room_id) 
    REFERENCES Room(Room_id) 
);

INSERT INTO EMP VALUES
(7934,"Miller","Kent","Clerk",7782,"2002/03/21",21300.00,1,NULL,10,current_timestamp(),current_timestamp());


INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(1,'Marcus', 'Alonso', '110909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(2,'Alexi', 'Alonso', '220909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(3,'Mount', 'Alonso', '330909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(4,'Jossi', 'John', '440909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(5,'James', 'Alonso', '550909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(6,'Alonso', 'Marcus', '660909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(7,'Elsabet', 'Alonso', '770909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(8,'John', 'Jossi', '880909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(9,'Alexander', 'Lacazate', '990909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(10,'Shemaicle', 'James', '1000909090', now(),now());



INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(11,'RF1', 'Rl1', '110909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(12,'RF2', 'Alonso', '220909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(13,'RF3', 'Alonso', '330909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(14,'RF4', 'John', '440909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(15,'RF5', 'Alonso', '550909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(16,'RF6', 'Marcus', '660909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(17,'RF7', 'Alonso', '770909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(18,'RF8', 'Jossi', '880909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(19,'RF9', 'Lacazate', '990909090', now(),now());

INSERT INTO User(userId,first_name,last_name,phone_number ,created_at ,Updated_at)
VALUES(20,'RF10', 'James', '1000909090', now(),now());

    
INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(1,1,100000);

INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(2,2,10000230);

INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(3,3,10045000);

INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(4,4,100000);

INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(5,5,13400000);

INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(6,6,100000);

INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(7,7,30000);

INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(8,8,1000);

INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(9,9,21000000);

INSERT INTO Manager(userId,Manager_id,Salary)
VALUES(10,10,500000);
    

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(1,"Newyork",now(),now(),"Manhattan","01");

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(2,"Minisota",now(),now(),"Hains","23301");

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(3,"Losangeles",now(),now(),"Arizona","2301");

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(4,"Amsterdam",now(),now(),"Alaska","2101");

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(5,"Brookhaven",now(),now(),"Cordova","101");

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(6,"Hempstead town",now(),now(),"Fairbanks","001");

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(7,"Yonkers",now(),now(),"Avondale","023");

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(8,"Buffalo",now(),now(),"Andalusia","02");

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(9,"Chicago",now(),now(),"Alexander","019");

INSERT INTO Location(location_id,city,created_at, Updated_at,Sub_city, Street )
VALUES(10,"Metro",now(),now(),"Anniston","010");


    
INSERT INTO Building(building_id,Manager_id,location_id,created_at, Updated_at)
VALUES(0,1,1,now(),now());

INSERT INTO Building(building_id,Manager_id,location_id,created_at, Updated_at)
VALUES(1,8,4,now(),now());

INSERT INTO Building(building_id,Manager_id,location_id,created_at, Updated_at)
VALUES(2,8,2,now(),now());

INSERT INTO Building(building_id,Manager_id,location_id,created_at, Updated_at)
VALUES(3,7,10,now(),now());

INSERT INTO Building(building_id,Manager_id,location_id,created_at, Updated_at)
VALUES(4,2,1,now(),now());

INSERT INTO Building(building_id,Manager_id,location_id,created_at, Updated_at)
VALUES(5,4,5,now(),now());

INSERT INTO Building(building_id,Manager_id,location_id,created_at, Updated_at)
VALUES(6,4,3,now(),now());

INSERT INTO Building(building_id,Manager_id,location_id,created_at, Updated_at)
VALUES(7,10,10,now(),now());

    

INSERT INTO Floor(floor_id,Building_id,created_at,Updated_at)
VALUES(1,1,now(),now());

INSERT INTO Floor(floor_id,Building_id,created_at,Updated_at)
VALUES(2,1,now(),now());

INSERT INTO Floor(floor_id,Building_id,created_at,Updated_at)
VALUES(3,1,now(),now());

INSERT INTO Floor(floor_id,Building_id,created_at,Updated_at)
VALUES(4,1,now(),now());

INSERT INTO Floor(floor_id,Building_id,created_at,Updated_at)
VALUES(5,2,now(),now());

INSERT INTO Floor(floor_id,Building_id,created_at,Updated_at)
VALUES(6,2,now(),now());

INSERT INTO Floor(floor_id,Building_id,created_at,Updated_at)
VALUES(7,2,now(),now());

INSERT INTO Floor(floor_id,Building_id,created_at,Updated_at)
VALUES(8,2,now(),now());




 

INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(1,1,now(),now(),2);

INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(2,2,now(),now(),2);

INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(3,3,now(),now(),1);

INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(4,1,now(),now(),4);

INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(5,2,now(),now(),3);

INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(6,3,now(),now(),1);
INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(7,1,now(),now(),6);

INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(8,2,now(),now(),4);

INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(9,3,now(),now(),10);

INSERT INTO Room(room_id,Floor_id, created_at, Updated_at, Number_of_classes)
VALUES(10,1,now(),now(),6);


     
INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(11,1,1);

INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(12,2,2);

INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(13,3,3);

INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(14,4,4);

INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(15,5,5);

INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(16,6,6);

INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(17,7,7);

INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(18,8,8);

INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(19,9,9);

INSERT INTO Resident(userId ,resident_id,Number_of_family)
VALUES(20,10,10);


    
INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(1,1,1,1000,'1000-01-01',now()); 

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(1,1,1,1000,'2000-01-01',now());

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(2,2,1,12000,'3000-03-03',now());

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(3,3,1,12000,'4000-01-01',now());

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(4,4,1,19000,'5000-05-05',now());

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(5,5,1,10000,'6000-06-06',now());

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(6,6,1,7000,'1000-01-01',now());

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(7,7,1,7000,'1000-01-01',now());

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(8,8,1,8000,'7000-07-07',now());

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(9,9,1,9000,'8000-08-08',now());

INSERT INTO Rent(rent_id,Resident_id,Room_id,Monthly_Price,created_at,Updated_at)
VALUES(10,10,1,10000,'9000-00-00',now());


--1- Find how many buildings there are Newyork city
SELECT count(*) as number_of_buildings
FROM Building
JOIN Location
ON Location.city='Newyork' AND Building.location_id=Location.location_id;

--2-How much total income can a building collect from all rent per month
SELECT sum(Rent.Monthly_Price),Room.room_id,Floor.floor_id,Building.building_id
FROM Rent,Room,Floor,Building
WHERE Rent.room_id=Room.room_id AND Room.room_id=Floor.floor_id AND Floor.floor_id=Building.building_id
GROUP BY Room.room_id,Floor.floor_id,Building.building_id;

-- 3- Find the largest rent for each building. 
---The output should be a list of Rent Id, Resident Name for each Rent Id, and the actual monthly_income 

SELECT User.first_name,Building.building_id, max(Rent.Monthly_Price) as HighestRent
from Rent
JOIN Resident
ON Rent.resident_id=Resident.resident_id
JOIN User
ON Resident.userId=User.userId
JOIN Room
ON Rent.room_id=Room.room_id
Join Floor
ON Room.floor_id=Floor.floor_id
join Building
ON Building.building_id=Floor.building_id
group by User.first_name, Building.building_id;

-- 4 how many building can a manager is managing
SELECT(
      SELECT COUNT(*)
	  FROM   building
	  ) AS number_of_buildings,
	  (SELECT COUNT(*)
	  FROM   manager
	  ) AS number_of_managers
FROM Manager;

-- 5- Find Resident ID, Resident name  sorted by Rent'. 
SELECT Resident.resident_id, , customer_state_cd
FROM customer
NATURAL JOIN Borrower
ORDER BY customer_state_cd, customer_last_name;

--6 How many rent can found with monthly income above 5000
SELECT COUNT( * ) as Number_of_rent
FROM Rent
WHERE Rent.Monthly_Price>5000;

-- 7 Find all the rental prices in Brookhaven city
SELECT Rent.Monthly_Price,Location.city
FROM Rent
JOIN Room
ON Room.room_id=Rent.room_id
JOIN Floor
ON Floor.floor_id=Room.floor_id
JOIN Building
ON Building.building_id=Floor.building_id 
JOIN Location
ON Location.location_id=Building.building_id AND Location.city="Brookhaven"
GROUP BY Location.city;


-- 8 Find how many rents have monthly price between $2,000 and $16,000  

SELECT count(*) from Rent WHERE Monthly_Price BETWEEN 2000 AND 16000;


-- 9 find the maxium and the minimum rent price for each buuilding
SELECT rent_id, Floor.floor_id
    max(Monthly_Price), 
    min(Monthly_Price)
from Rent,Floor
JOIN Room
ON Room.room_id=Rent.room_id
JOIN Floor
ON Floor.floor_id=Room.floor_id
group by rent_id, Floor.floor_id;

-- 10 Create a view that can show only Rent_id,rent price, Resident_id, Location city
CREATE or REPLACE VIEW Rent_resident_price_Location AS
SELECT DISTINCT Rent.rent_id, Rent.Monthly_Price,Resident.resident_id, Location.city
FROM Rent,Resident,Location
JOIN Resident
ON Rent.resident_id=Resident.resident_id
JOIN Room
ON Room.room_id=Rent.room_id
JOIN Floor
ON Floor.floor_id=Room.floor_id
JOIN Building
ON Building.building_id=Floor.building_id 
JOIN Location
ON Location.location_id=Building.building_id 
Group BY Rent.rent_id, Rent.Monthly_Price,Resident.resident_id, Location.city;