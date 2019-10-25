--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--
-- Modified by Sanjeev Dasari on 10-18-19
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame CASCADE;
DROP TABLE IF EXISTS GameProperty CASCADE;
DROP TABLE IF EXISTS Game CASCADE;
DROP TABLE IF EXISTS Player CASCADE;
DROP TABLE IF EXISTS Property CASCADE;


-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	location integer
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50) NOT NULL
	);


CREATE TABLE GameProperty (
	gameID integer REFERENCES Game(ID),
	propertyID integer REFERENCES Property(ID),
	houses integer, 
	hotels integer,
	playerID integer REFERENCES Player(ID)
	);


-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON GameProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 200, 15);
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 12000, 35);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 400, 26);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 10000, 8);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 150, 0);
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 14356, 18);
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 7001, 7);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 805, 18);

INSERT INTO Property VALUES (1, 'Sylvan Avenue');
INSERT INTO Property VALUES (2, 'K.G.MARG');
INSERT INTO Property VALUES (3, 'Pandara Road');
INSERT INTO Property VALUES (4, 'Burton ST SE');
INSERT INTO Property VALUES (5, 'Zakir Hussain Marg');
INSERT INTO Property VALUES (6, 'Michigan Ave');
INSERT INTO Property VALUES (7, 'Woodcliff AVE');
INSERT INTO Property VALUES (8, 'Samsung AVE');
INSERT INTO Property VALUES (9, 'Lodi Road');

INSERT INTO GameProperty VALUES (3, 7, 0, 0, 3);
INSERT INTO GameProperty VALUES (3, 3, 0, 1, 1);
INSERT INTO GameProperty VALUES (2, 1, 3, 0, 2);
INSERT INTO GameProperty VALUES (2, 4, 1, 1, 1);
INSERT INTO GameProperty VALUES (1, 7, 0, 2, 2);

-- Test commands to see table
SELECT * FROM GameProperty;
SELECT * FROM Property;