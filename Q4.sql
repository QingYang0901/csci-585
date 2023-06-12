/* use livesql */
CREATE TABLE Instructors (
  InstructorID INT PRIMARY KEY,
  InstructorName VARCHAR(50),
  HourlyRate DECIMAL(8, 2)
);
CREATE TABLE Courses (
  CourseID INT PRIMARY KEY,
  CourseName VARCHAR(50),
  InstructorID INT,
  StudentCount INT,
  FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

INSERT INTO Instructors VALUES (1, 'Aleph', 30.0);
INSERT INTO Instructors VALUES(2, 'Bit', 40.0);
INSERT INTO Instructors VALUES(3, 'CRC', 50.0);


INSERT INTO Courses VALUES(1, 'csci 585', 1, 20);
INSERT INTO Courses VALUES(2, 'csci 570', 1, 30);
INSERT INTO Courses VALUES(3, 'ee 503', 2, 40);
INSERT INTO Courses VALUES(4, 'ee 510', 3, 30);

SELECT
  i.InstructorName,
  SUM(i.HourlyRate*c.StudentCount) * 0.1 AS Bonus
FROM
  Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID 
GROUP BY
  i.InstructorName
ORDER BY Bonus DESC FETCH FIRST ROW ONLY;
