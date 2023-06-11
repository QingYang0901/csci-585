/* use livesql */
CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime),
CONSTRAINT Check_time CHECK (startTime<endTime));
/* check whether startTime is later than endTime */
    
CREATE OR REPLACE TRIGGER roomcheck
BEFORE INSERT OR UPDATE ON ProjectRoomBookings
FOR EACH ROW
DECLARE
count_room_booking NUMBER;
BEGIN
select count(*) into count_room_booking
from ProjectRoomBookings
where :new.roomNum=roomNum and NOT (:new.startTime>=endTime or :new.endTime<=startTime);
IF count_room_booking>0
THEN
  RAISE_APPLICATION_ERROR(-20001, 'Error in entry');
END IF;
END;
/
/*check whether the room has been booked by othergroup */

INSERT INTO ProjectRoomBookings VALUES (201, 12, 14, 'Group 1');
INSERT INTO ProjectRoomBookings VALUES (201, 14, 16, 'Group 2');
INSERT INTO ProjectRoomBookings VALUES (201, 8, 12, 'Group 3');
INSERT INTO ProjectRoomBookings VALUES (202, 8, 10, 'Group 4');
INSERT INTO ProjectRoomBookings VALUES (202, 10, 12, 'Group 4');

SELECT * 
FROM ProjectRoomBookings;
