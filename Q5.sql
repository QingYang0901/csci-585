/* use livesql */
CREATE TABLE Instruction(
    Instructor CHAR(15),
    Subject CHAR(30),
    PRIMARY KEY (Instructor, Subject));  

INSERT INTO Instruction VALUES ('Aleph', 'MIDI controllers');        
INSERT INTO Instruction VALUES ('Aleph', 'Sound mixing');         
INSERT INTO Instruction VALUES ('Aleph', 'Synthesis algorithms');       
INSERT INTO Instruction VALUES ('Bit', 'EDM synthesis');
INSERT INTO Instruction VALUES ('Bit', 'Electronic Music Fundamentals');
INSERT INTO Instruction VALUES ('Bit', 'Sound mixing');
INSERT INTO Instruction VALUES ('CRC', 'EDM synthesis');
INSERT INTO Instruction VALUES ('CRC', 'Electronic Music Fundamentals');
INSERT INTO Instruction VALUES ('Dat', 'MIDI controllers');
INSERT INTO Instruction VALUES ('Dat', 'EDM synthesis');
INSERT INTO Instruction VALUES ('Dat', 'Electronic Music Fundamentals');
INSERT INTO Instruction VALUES ('Emscr', 'MIDI controllers');
INSERT INTO Instruction VALUES ('Emscr', 'Synthesis algorithms');
INSERT INTO Instruction VALUES ('Emscr', 'Electronic Music Fundamentals');
INSERT INTO Instruction VALUES ('Emscr', 'EDM synthesis');

CREATE TABLE Subjects(
    Subject Char(30),
    PRIMARY KEY(Subject));

INSERT INTO Subjects VALUES ('Electronic Music Fundamentals'); 
INSERT INTO Subjects VALUES ('MIDI controllers'); 
INSERT INTO Subjects VALUES ('EDM synthesis'); 


SELECT Instructor
FROM Instruction 
WHERE Subject IN (SELECT subject FROM Subjects)
GROUP BY Instructor
HAVING COUNT(*) = (SELECT COUNT(*) FROM Subjects)
/*use count toextract the instructor in the table instruction who teaches all the subjects contained in the table Subjects.*/
