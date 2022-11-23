CREATE TABLE MovieExec(
	name varchar(20), 
	address text,
	cert INT primary key,
	netWorth int
);
create table Movies(
    title varchar(30),
    year int ,
    length int,
    genre varchar(20) ,
    studioName varchar(20) ,
    producerC int,
    primary key(title, year),
    FOREIGN KEY (producerC) references MovieExec(cert) ON UPDATE RESTRICT ON DELETE RESTRICT
	-- (1.1a) FOREIGN KEY producerC REFERENCES MovieExec(name) ON DELETE RESTRICT ON UPDATE RESTRICT
	-- (1.1b) FOREIGN KEY producerC REFERENCES MovieExec(name)  ON DELETE SET NULL ON UPDATE RESTRICT
	-- (1.1c)FOREIGN KEY producerC REFERENCES MovieExec(name)  ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE MovieStar(
	-- 1.2c
	name varchar(20) ,
	address varchar(20),
	gender char(1),
 	birthdate datetime,
     PRIMARY KEY (name)
);

CREATE TABLE StarsIn(
	movieTitle varchar(20),
	movieYear int,
    -- (1.1e)
	movieStarName varchar(20) check(MovieStar(birthdate) > movieYear) REFERENCES MovieStar(name) ON UPDATE RESTRICT ON DELETE RESTRICT,
    
    -- (2.1a) movieStarName varchar(20) check(MovieStar(birthdate) > movieYear),
    
    
     -- (1.1d)
	FOREIGN KEY (movieTitle,movieYear) REFERENCES Movies(title, year) ON UPDATE RESTRICT ON DELETE RESTRICT
);


CREATE TABLE Studio (
	-- (1.2d)
	name varchar(30) , 
    -- (1.2b)
	address varchar(20) unique,  
	presC varchar(20),
    PRIMARY KEY (name),
    CHECK (name IN (SELECT title  FROM Movies))
);
CREATE TABLE 
-- 2c), 2d)
Product(maker varchar(20), model int primary key check(model in ((SELECT PC.model  FROM PC) union (SELECT Printer.model  FROM Printer) union (SELECT Laptop.model  FROM Laptop))), type varchar(20) check(type in ('PC','Printer','Laptop')));
CREATE TABLE
-- 
PC(model int references Product , speed float, ram int, hd int, price int);
CREATE TABLE
-- 2a)
Laptop(model int references Product, speed float check( speed > 2.0), ram int, hd int, screen float, price float);
CREATE TABLE
-- 2b)
Printer(model int references Product, color boolean, type varchar(20) check(type in ('laser', 'ink-jet','bubble-jet')), price int);