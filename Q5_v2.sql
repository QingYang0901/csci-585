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
--Created table Subjects of the all the subjects which need to be checked
--First join table Instruction and Subjects and then find the Instructor in the joined table whose subjects' number is equal to the number of the subjects in the Subjects table.
