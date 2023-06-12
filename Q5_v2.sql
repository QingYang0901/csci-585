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
FROM Instruction join Subjects
on Instruction.subject=Subjects.subject
GROUP BY Instructor
HAVING COUNT(*) = (SELECT COUNT(*) FROM Subjects)
/*First join the tables Instruction and Subjects,
then find the Instructor whose subject number is equal to the subject number in the Subjects table in the joined table.*/
