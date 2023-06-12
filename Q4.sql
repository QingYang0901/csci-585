/* use livesql */
CREATE TABLE Instruction(
   Instructor CHAR(15),
   hourly_rate INTEGER NOT NULL,
   PRIMARY KEY (Instructor)
   };

CREATE TABLE Classes{
  student_count INTEGER NOT NULL,
  subject CHAR(30),
  Instructor CHAR(15),
  PRIMARY KEY (subject)
};

INSERT INTO Instruction VALUES('Aleph',40);
INSERT INTO Instruction VALUES('Bit',40);
INSERT INTO Instruction VALUES('CRC',50);
INSERT INTO Instruction VALUES('Dat',60);

INSERT INTO Classes VALUES(10,'MIDI controllers','Aleph');
INSERT INTO Classes VALUES(20,'Sound mixing','Aleph');
INSERT INTO Classes VALUES(30,'Synthesis algorithms','Aleph');
INSERT INTO Classes VALUES(20,'EDM synthesis','Bit');
INSERT INTO Classes VALUES(30,'Electronic Music Fundamentals','Bit');
INSERT INTO Classes VALUES(20,'Sound mixing','Bit');
INSERT INTO Classes VALUES(30,'EDM synthesis','CRC');
INSERT INTO Classes VALUES(20,'Electronic Music Fundamentals','CRC');
INSERT INTO Classes VALUES(40,'MIDI controllers','Dat');
INSERT INTO Classes VALUES(30,'EDM synthesis','Dat');
INSERT INTO Classes VALUES(35,'Electronic Music Fundamentals','Dat');

SELECT Instructor, SUM(hourly_rate*srudent_count*o.1) AS bonus
FROM Instruction
JOIN Classes ON Instruction.Instructor=Classes.Instructor
GROUP BY Instruction.instructor
ORDER BY bonus DESC
LIMIT 1;
