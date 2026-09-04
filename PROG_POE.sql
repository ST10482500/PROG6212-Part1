
CREATE DATABASE RaceDayDB;
GO 
USE RaceDayDB;
GO

--Drop old tables if they exist
DROP TABLE IF EXISTS Result;
DROP TABLE IF EXISTS Enrolment;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Participant;
DROP TABLE IF EXISTS Organiser;

 CREATE TABLE Organiser (
    OrganiserID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
     ContactNumber VARCHAR(20)
);

 CREATE TABLE Participant (
    ParticipantID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Age INT,
    Gender VARCHAR(10)
);

CREATE TABLE  Event (
    EventID INT PRIMARY KEY IDENTITY,
    Title VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    EventDate DATE NOT NULL,
    OrganiserID INT NOT NULL,
    FOREIGN KEY (OrganiserID) REFERENCES Organiser(OrganiserID)
);

CREATE TABLE  Category (
    CategoryID INT PRIMARY KEY IDENTITY,
    EventID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Distance VARCHAR(20),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

 CREATE TABLE Enrolment (
    EnrolmentID INT PRIMARY KEY IDENTITY,
    ParticipantID INT NOT NULL,
    EventID INT NOT NULL,
    CategoryID INT NOT NULL,
    RegistrationDate DATE NOT NULL,
    FOREIGN KEY (ParticipantID) REFERENCES Participant(ParticipantID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Result (
    ResultID INT PRIMARY KEY IDENTITY,
    EnrolmentID INT NOT NULL,
    FinishTime TIME,
    Position INT,
    FOREIGN KEY (EnrolmentID) REFERENCES Enrolment(EnrolmentID)
);

--  Insert sample data 

INSERT INTO Organiser (Name, Email, ContactNumber)
VALUES ('John Smith', 'john@raceday.com', '0821234567');

INSERT INTO Participant (Name, Email, Age, Gender)
VALUES ('Alice Brown', 'alice@gmail.com', 25, 'Female'),
       ('David Green', 'david@gmail.com', 30, 'Male');

INSERT INTO Event (Title, Location, EventDate, OrganiserID)
VALUES ('Comrades Marathon', 'Durban', '2026-06-10', 1);

INSERT INTO Category (EventID, Name, Distance)
VALUES (1, '5km Fun Run', '5km'),
       (1, '10km Race', '10km');

INSERT INTO Enrolment (ParticipantID, EventID, CategoryID, RegistrationDate)
VALUES (1, 1, 1, '2026-05-01'),
       (2, 1, 2, '2026-05-02');

INSERT INTO Result (EnrolmentID, FinishTime, Position)
VALUES (1, '00:25:30', 5),
       (2, '00:45:10', 12);

