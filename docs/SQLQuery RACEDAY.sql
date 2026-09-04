
CREATE DATABASE RaceDayDB;
GO

USE RaceDayDB;
GO

  --  USER TABLE--
   

CREATE TABLE [User]
(
    UserID INT IDENTITY(1,1) PRIMARY KEY,

    FirstName NVARCHAR(50) NOT NULL,

    LastName NVARCHAR(50) NOT NULL,

    Email NVARCHAR(100) NOT NULL UNIQUE,

    PasswordHash NVARCHAR(255) NOT NULL,

    PhoneNumber NVARCHAR(20) NULL,

    Role NVARCHAR(20) NOT NULL,

    CreatedAt DATETIME2 NOT NULL
        CONSTRAINT DF_User_CreatedAt DEFAULT SYSDATETIME(),

    CONSTRAINT CK_User_Role
        CHECK (Role IN ('Organiser', 'Participant'))
);
GO
-- EVENT TYPE TABLE --
 

CREATE TABLE EventType
(
    EventTypeID INT IDENTITY(1,1) PRIMARY KEY,

    TypeName NVARCHAR(20) NOT NULL UNIQUE
);
GO



   -- EVENT TABLE--
   

CREATE TABLE Event
(
    EventID INT IDENTITY(1,1) PRIMARY KEY,

    OrganiserID INT NOT NULL,

    EventTypeID INT NOT NULL,

    Name NVARCHAR(150) NOT NULL,

    Description NVARCHAR(1000) NULL,

    EventDate DATE NOT NULL,

    Location NVARCHAR(200) NOT NULL,

    Distance DECIMAL(6,2) NOT NULL,

    BannerImageUrl NVARCHAR(500) NULL,

    CreatedAt DATETIME2 NOT NULL
        CONSTRAINT DF_Event_CreatedAt DEFAULT SYSDATETIME(),

    CONSTRAINT FK_Event_Organiser
        FOREIGN KEY (OrganiserID)
        REFERENCES [User](UserID),

    CONSTRAINT FK_Event_EventType
        FOREIGN KEY (EventTypeID)
        REFERENCES EventType(EventTypeID),

    CONSTRAINT CK_Event_Distance
        CHECK (Distance > 0)
);
GO
