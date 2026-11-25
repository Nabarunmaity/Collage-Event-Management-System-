# Collage-Event-Management-System-
COLLEGE EVENT MANAGEMENT SYSTEM

A Database Management System (DBMS) project for organizing college events in one place. It combines a MySQL database (students, clubs, venues, events, registrations and feedback) with a standalone HTML/CSS/JavaScript dashboard prototype.

Course: Database Management System Lab (BTD59117)
Program: B.Tech Computer Science & Engineering - Data Science
University: Brainware University, School of Engineering (Dept. of CSE - Cyber Security & Data Science)
Academic Year: 2026-2027
Type: Project Based Learning (PBL)


PROBLEM STATEMENT

Managing college events manually leads to scattered student lists, duplicate registrations, difficulty tracking payments and attendance, and slow preparation of event reports. This project provides a structured relational database and a simple dashboard to manage these activities.


FEATURES

Database (MySQL)
- Seven tables with primary keys and foreign keys
- Unique constraints that prevent duplicate registrations and duplicate feedback
- Sample data for 3 departments, 4 students, 3 clubs, 3 venues and 3 events
- An event_summary view showing registrations and seats left per event
- 12 retrieval and reporting queries

Dashboard (HTML/CSS/JavaScript)
- View events with category, club, venue, date, time, fee and seats left
- Register students for events (duplicate and capacity checks)
- Add new events and students
- Mark payment as paid and toggle attendance
- Submit event feedback (one per student per event)
- Export all data as a JSON file


TECH STACK

- Database: MySQL
- Frontend: HTML5, CSS3, JavaScript
- Browser storage: localStorage (frontend demo only)
- Runtime: any MySQL client or online MySQL compiler, and a modern web browser


DATABASE DESIGN

Tables
- department: department names
- student: name, email (unique), phone, department, year
- club: club name, faculty coordinator, department
- venue: venue name, capacity, location
- event: title, category, club, venue, date, start/end time, fee, max participants, status
- registration: links students to events, with payment status and attendance
- feedback: rating and comments from a student for an event

Relationships (all one-to-many)
- department.dept_id -> student.dept_id
- department.dept_id -> club.dept_id
- club.club_id -> event.club_id
- venue.venue_id -> event.venue_id
- event.event_id -> registration.event_id
- student.student_id -> registration.student_id
- event.event_id -> feedback.event_id
- student.student_id -> feedback.student_id

The registration table resolves the many-to-many relationship between students and events. UNIQUE (event_id, student_id) is applied on both registration and feedback.


SQL QUERIES INCLUDED

1. Display all students
2. Display all events
3. Upcoming events ordered by date
4. Students registered for a given event
5. Registration count for each event
6. Event summary (uses the event_summary view)
7. Revenue per event
8. Most active students
9. Average event rating
10. Department-wise participation
11. Events with no registrations
12. Event details with club and venue


PROJECT STRUCTURE

college-event-management-system/
  database/college_event_management.sql
  frontend/college_event_management_system.html
  docs/College_Event_Management_System_Project_Report.docx
  README.md


GETTING STARTED

1. Set up the database
Create and select the database:
  CREATE DATABASE college_event_management;
  USE college_event_management;

Then run the script from the command line:
  mysql -u root -p college_event_management < database/college_event_management.sql

Or paste the contents of college_event_management.sql into any online MySQL compiler. The script drops existing tables first, so it can be re-run safely.

2. Run the dashboard
No installation or server is needed. Open this file in a web browser:
  frontend/college_event_management_system.html

Data is saved in your browser's localStorage.


SAMPLE OUTPUT

Registrations per event
  HackSprint 2026      2
  Annual Fest Night    2
  Intro to Arduino     2

Average rating per event
  Annual Fest Night    4.50

Department-wise registrations
  Computer Science     3
  Electronics          2
  Management           1


LIMITATIONS

- The frontend and the MySQL database are separate demonstrations and are not connected.
- localStorage data exists only in the browser profile where the page is opened.
- The dashboard is a prototype with no login, user roles or server-side security.
- The SQL version has no automatic capacity trigger; capacity is checked in the frontend only.
- The average-rating query uses an inner join, so events with no feedback are not listed.


FUTURE ENHANCEMENTS

- Connect the frontend to MySQL through a backend (Flask, Node.js or PHP)
- Student and administrator login with role-based access
- Email notifications and event reminders
- Stronger database constraints and server-side capacity validation
- Downloadable attendance and revenue reports


TEAM

- Priyanka Mal
- Nobarun Kumar Maity
- Sangeeta Mullick
- Rohan Pal
- Sneha Modak
- Anindita Maity


REFERENCES

- MySQL documentation: https://dev.mysql.com/doc/
- HTML, CSS and JavaScript: https://developer.mozilla.org/
