/* use livesql */
CREATE TABLE Instruction(
   Instructor CHAR(15),
   hourly_rate INTEGER NOT NULL,
   PRIMARY KEY (Instructor)
   };

CREATE TABLE classes{
  student_count INTEGER NOT NULL,
  subject CHAR(30),
  Instructor CHAR(15),
  PRIMARY KEY (subject)
};

INSERT INTO instruction VALUES('Aleph',40);
INSERT INTO instruction VALUES('Bit',40);
INSERT INTO instruction VALUES('CRC',50);
INSERT INTO instruction VALUES('Dat',60);

INSERT INTO classes VALUEs(10,'MIDI controllers','Aleph');
INSERT INTO classes VALUEs(20,'Sound mixing','Aleph');
INSERT INTO classes VALUEs(30,'Synthesis algorithms','Aleph');
INSERT INTO classes VALUEs(20,'EDM synthesis','Bit');
INSERT INTO classes VALUEs(30,'Electronic Music Fundamentals','Bit');
INSERT INTO classes VALUEs(20,'Sound mixing','Bit');
INSERT INTO classes VALUEs(30,'EDM synthesis','CRC');
INSERT INTO classes VALUEs(20,'Electronic Music Fundamentals','CRC');
INSERT INTO classes VALUEs(40,'MIDI controllers','Dat');
INSERT INTO classes VALUEs(30,'EDM synthesis','Dat');
INSERT INTO classes VALUEs(35,'Electronic Music Fundamentals','Dat');

SELECT name, SUM(hourly_rate*srudent_count*o.1) AS bonus
FROM instructors
JOIN classes ON instructors.instructor_id=classes.instructor_id
GROUP BY instructors.instructor_id
ORDER BY bonus DESC
LIMIT 1;
