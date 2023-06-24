CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
--Create Table
CREATE TABLE MAPS (name varchar, geom geometry);
INSERT INTO MAPS VALUES
	('Statue 1','POINT(-118.28442 34.02205)'),
	('Statue 2', 'POINT(-118.28542 34.02059)'),
	('Statue 3', 'POINT(-118.28843 34.02019)'),
	('Statue 4', 'POINT(-118.28526 34.02019)'),
	('Statue 5', 'POINT(-118.28620 34.01884)'),
	('Statue 6', 'POINT(-118.28588 34.01948)'),
	('Waterwork 1', 'POINT(-118.28346 34.02056)'),
	('Waterwork 2', 'POINT(-118.28520 34.02029)'),
	('Waterwork 3', 'POINT(-118.28620 34.02040)'),
	('Waterwork 4', 'POINT(-118.28459 34.02052)'),
	('Waterwork 5', 'POINT(-118.28300 34.02142)'),
	('Waterwork 6', 'POINT(-118.28320 34.02221)'),
	('Home', 'POINT(-118.27982 34.02379)');
	

SELECT name, ST_AsText(geom) FROM MAPS;

--Convex Hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) FROM MAPS;

--Nearest Neighbors of Home
SELECT name, ST_Astext(geom) as location, ST_Distance(geom,'POINT(-118.27982 34.02379)') as distance 
FROM Maps
WHERE name<>'Home' 
ORDER BY ST_Distance(geom,'POINT(-118.27982 34.02379)') 
limit 4;
