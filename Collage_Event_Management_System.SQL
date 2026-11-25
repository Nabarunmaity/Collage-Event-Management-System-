CREATE DATABASE college_event_management;
USE college_event_management;

CREATE TABLE department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(80) NOT NULL
);

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    dept_id INT,
    year INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE club (
    club_id INT PRIMARY KEY AUTO_INCREMENT,
    club_name VARCHAR(100),
    faculty_coordinator VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE venue (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_name VARCHAR(100),
    capacity INT,
    location VARCHAR(100)
);

CREATE TABLE event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    category VARCHAR(50),
    club_id INT,
    venue_id INT,
    event_date DATE,
    start_time TIME,
    end_time TIME,
    fee DECIMAL(8,2) DEFAULT 0,
    max_participants INT,
    status VARCHAR(30) DEFAULT 'Upcoming',
    FOREIGN KEY (club_id) REFERENCES club(club_id),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

CREATE TABLE registration (
    reg_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    student_id INT,
    reg_date DATE,
    payment_status VARCHAR(20),
    attended VARCHAR(10) DEFAULT 'No',
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    UNIQUE(event_id, student_id)
);

CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    student_id INT,
    rating INT,
    comments VARCHAR(500),
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    UNIQUE(event_id, student_id)
);

-- SAMPLE DATA

INSERT INTO department (dept_name) VALUES
('Computer Science'),
('Electronics'),
('Management');

INSERT INTO student
(name,email,phone,dept_id,year) VALUES
('Aman Roy','aman@mail.com','9000000001',1,3),
('Riya Das','riya@mail.com','9000000002',1,2),
('Sourav Paul','sourav@mail.com','9000000003',2,4),
('Neha Sen','neha@mail.com','9000000004',3,1);

INSERT INTO club
(club_name,faculty_coordinator,dept_id) VALUES
('Coding Club','Dr. Ghosh',1),
('Cultural Club','Prof. Mitra',NULL),
('Robotics Club','Dr. Basu',2);

INSERT INTO venue
(venue_name,capacity,location) VALUES
('Main Auditorium',500,'Block A'),
('Seminar Hall',120,'Block B'),
('Computer Lab 2',60,'Block C');

INSERT INTO event
(title,category,club_id,venue_id,event_date,
start_time,end_time,fee,max_participants,status)
VALUES
('HackSprint 2026','Technical',1,3,'2026-12-10',
'09:00','18:00',100,60,'Upcoming'),
('Annual Fest Night','Cultural',2,1,'2026-12-15',
'17:00','21:00',0,400,'Upcoming'),
('Intro to Arduino','Workshop',3,2,'2026-12-12',
'10:00','13:00',50,50,'Upcoming');

INSERT INTO registration
(event_id,student_id,reg_date,payment_status,attended)
VALUES
(1,1,'2026-11-25','Paid','Yes'),
(1,2,'2026-11-25','Paid','No'),
(2,1,'2026-11-25','Free','No'),
(2,3,'2026-11-25','Free','No'),
(3,3,'2026-11-25','Paid','No'),
(3,4,'2026-11-25','Paid','No');

INSERT INTO feedback
(event_id,student_id,rating,comments) VALUES
(2,1,5,'Great show'),
(2,3,4,'Loved it');

-- DISPLAY EVENTS

SELECT * FROM event;

-- DISPLAY STUDENTS

SELECT * FROM student;

-- DISPLAY REGISTRATIONS

SELECT * FROM registration;

-- EVENT-WISE REGISTRATION COUNT

SELECT e.title, COUNT(r.reg_id) AS total_registrations
FROM event e
LEFT JOIN registration r
ON e.event_id = r.event_id
GROUP BY e.event_id, e.title;

-- EVENT FEEDBACK

SELECT e.title, AVG(f.rating) AS average_rating
FROM event e
JOIN feedback f ON e.event_id = f.event_id
GROUP BY e.event_id, e.title;