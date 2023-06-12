/* use livesql */
CREATE TABLE instructors{
instructor_id INTEGER PRIMARY KEY,
hourly_rate FLOAT NOT NULL,
name TEXT NOT NULL
};

CREATE TABLE classes{
class_id INTEGER PRIMARY KEY,
instructor_id INTEGER REFERENCES instructor(instructor_id);
student_count INTEGER NOT NULL,
subject TEXT NOT NULL
};

INSERT INTO instructor (instructor_id, hourly_rate, name)
VALUES(1,40, 'Aleph'),(2,40,'Bit'),(3,50,'CRC'),(4,60,'Dat');

INSERT INTO classes (class_id, instructor_id, student_count, subject)
VALUE(1,1,10,'MIDI controllers'),(2,1,20,'Sound mixing'),(3,1,30,'Synthesis algorithms'),(4,2,20,'EDM synthesis'),
(5,2,30,'Electronic Music Fundamentals'),(2,2,20,'Sound mixing'),(4,3,30,'EDM synthesis'),(5,3,20,'Electronic Music Fundamentals'),
(1,4,40,'MIDI controllers'),(4,4,30,'EDM synthesis'),(5,4,35,'Electronic Music Fundamentals');

SELECT name, SUM(hourly_rate*srudent_count*o.1) AS bonus
FROM instructors
JOIN classes ON instructors.instructor_id=classes.instructor_id
GROUP BY instructors.instructor_id
ORDER BY bonus DESC
LIMIT 1;
