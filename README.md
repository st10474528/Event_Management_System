RaceDay Event Management System - Part 1
📋 Table of Contents
System Overview

Features

User Roles

Documentation

Database Schema

Setup Instructions

CI/CD Pipeline

Video Presentation

GitHub Commit History

Author Information

🏃 System Overview
RaceDay is a comprehensive full-stack web-based event management system designed specifically for the South African road running, walking, and cycling community. The platform bridges the gap between event organisers and participants, digitizing the entire event lifecycle from creation to results tracking.

Key Statistics
8 Database Entities supporting a robust data model

27 API Endpoints planned for complete functionality

2 User Roles with distinct responsibilities

3 Sample Events pre-populated for testing

✨ Features
For Event Organisers
✅ Create, edit, and delete events

✅ Define event categories (age groups, distances)

✅ Capture participant results

✅ View all event enrolments

✅ Manage event weather information

✅ Generate event leaderboards

✅ Track event statistics

For Participants
✅ Create account and manage profile

✅ Browse upcoming events with filters

✅ Enrol in events by selecting categories

✅ View personal enrolment history

✅ Track personal results and performance

✅ Cancel enrolments if needed

👥 User Roles
🎯 Organiser
Capability	Description
Event Management	Full CRUD operations on events
Category Management	Define age groups, distances, and fees
Enrolment Viewing	See all participants registered for their events
Results Capture	Record finish times and positions
Weather Updates	Manage weather information for events
Statistics	View event analytics and reports
🏅 Participant
Capability	Description
Profile Management	Update personal information
Event Discovery	Search and filter upcoming events
Event Enrolment	Register for events and select categories
History Tracking	View past and current enrolments
Results Access	View personal race results and performance
Enrolment Management	Cancel enrolments if necessary
📚 Documentation
All planning documents are located in the /docs folder of the repository:

Document	Description	Format
ERD Diagram	Entity Relationship Diagram showing 8 entities with relationships	PNG
API Endpoint Plan	Complete API specification with 27 endpoints	Markdown/PDF
Database Script	SQL Server script with schema and sample data	SQL
Database Entity Breakdown
Users - Authentication and base user information

Organisers - Event organiser details (extends Users)

Participants - Participant details (extends Users)

Events - Core event management

Categories - Event categories (age/distances)

EventEnrolments - Participant registration linking

Results - Race performance data

Weather - Event weather conditions

🗄️ Database Schema
Entity Relationship Diagram
text
Users (1) ─── (1) Organisers
   │
   └─── (1) Participants
         │
Events (1) ─── (M) Categories (1) ─── (M) EventEnrolments
   │                                          │
   └─── (1) Weather                           └─── (1) Results
Key Relationships
One-to-One: Users → Organisers, Users → Participants, Events → Weather, EventEnrolments → Results

One-to-Many: Organisers → Events, Events → Categories, Categories → EventEnrolments, Participants → EventEnrolments

Sample Data Overview
2 Organisers: Cape Town Marathon Events, Soweto Sports Association

2 Participants: Michael Brown, Lisa Davis

3 Events: Cape Town Marathon, Table Mountain Challenge, Soweto Community Walk

10 Categories: Various distances and age groups

3 Enrolments: Participants registered for events

2 Results: Completed race results

2 Weather Records: Weather conditions for events

🚀 Setup Instructions
Prerequisites
SQL Server (2019 or later)

SQL Server Management Studio (SSMS)

Git (for version control)

GitHub Account

Step 1: Clone the Repository
bash
git clone https://github.com/yourusername/RaceDay.git
cd RaceDay
Step 2: Review Documentation
Navigate to the /docs folder to review:

ERD.png - Database design visualization

API-Endpoint-Plan.md - Complete endpoint specification

RaceDay-Database.sql - Database creation script

Step 3: Setup Database
Open SQL Server Management Studio (SSMS)

Connect to your SQL Server instance

Open docs/RaceDay-Database.sql

Run the entire script (press F5)

Verify the database RaceDayDB is created with all tables

Step 4: Verify Installation
Run this query in SSMS to confirm setup:

sql
USE RaceDayDB;
GO
SELECT 
    (SELECT COUNT(*) FROM Users) AS Users,
    (SELECT COUNT(*) FROM Organisers) AS Organisers,
    (SELECT COUNT(*) FROM Participants) AS Participants,
    (SELECT COUNT(*) FROM Events) AS Events,
    (SELECT COUNT(*) FROM Categories) AS Categories,
    (SELECT COUNT(*) FROM EventEnrolments) AS Enrolments;
Expected Output:

text
Users | Organisers | Participants | Events | Categories | Enrolments
------|------------|--------------|--------|------------|-----------
4     | 2          | 2            | 3      | 10         | 3
🔄 CI/CD Pipeline
GitHub Actions Workflow
The project includes a GitHub Actions workflow that validates the documentation structure:

yaml
name: Validate Documentation

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  validate-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Check /docs folder exists
        run: test -d docs
      - name: Check ERD exists
        run: test -f docs/ERD.png || test -f docs/ERD.pdf
      - name: Check API plan exists
        run: test -f docs/API-Endpoint-Plan.md || test -f docs/API-Endpoint-Plan.pdf
      - name: Check SQL script exists
        run: test -f docs/RaceDay-Database.sql
      - name: Validate SQL script
        run: grep -q "CREATE TABLE" docs/RaceDay-Database.sql
CI/CD Status
https://github.com/yourusername/RaceDay/actions/workflows/validate-docs.yml/badge.svg

Build Requirements:

✅ All documentation files present

✅ SQL script contains CREATE TABLE statements

✅ Repository structure validated

✅ Green build status achieved

🎥 Video Presentation
Part 1 Video Walkthrough
Watch the complete walkthrough of Part 1, including:

📊 Explanation of the ERD design decisions

📝 API endpoint plan overview

💻 Live SQL script execution in SSMS

🗄️ Database verification and testing

Click here to watch the Part 1 Video Presentation

Note: Video is unlisted and only accessible via this link.

What to Expect in the Video
Introduction (0:00 - 2:00)

System overview and project goals

Explanation of South African events context

ERD Walkthrough (2:00 - 8:00)

Entity relationship explanation

Cardinality decisions

Data model design choices

API Plan Review (8:00 - 15:00)

Endpoint structure explanation

Role-based access control design

Request/Response patterns

Database Script Live (15:00 - 25:00)

Running the SQL script in SSMS

Verifying table creation

Viewing sample data

Testing constraints and relationships

Conclusion (25:00 - 27:00)

Summary of Part 1

Preview of Part 2

Q&A and closing remarks

📊 GitHub Commit History
Commit Requirements for Part 1
Minimum: 20 meaningful commits

Valid Commits:

✅ Adding ERD diagram

✅ Creating API endpoint plan

✅ Writing SQL script

✅ Creating README file

✅ Setting up CI/CD workflow

✅ Adding documentation

✅ Updating design decisions

Invalid Commits (don't count):

❌ "fixed typo"

❌ "updated file"

❌ "minor changes"

❌ Commits with no meaningful code changes

Recommended Commit Structure
bash
# Initial structure
git add .github/workflows/validate-docs.yml
git commit -m "Add GitHub Actions workflow for doc validation"

# Documentation
git add docs/ERD.png
git commit -m "Add Entity Relationship Diagram with 8 entities"

git add docs/API-Endpoint-Plan.md
git commit -m "Add API endpoint plan with 27 endpoints"

git add docs/RaceDay-Database.sql
git commit -m "Add SQL database script with schema and sample data"

# README
git add README.md
git commit -m "Add comprehensive README with setup instructions"

# Final verification
git commit -m "Finalize Part 1 documentation and structure"
📁 Repository Structure
text
RaceDay/
├── .github/
│   └── workflows/
│       └── validate-docs.yml      # CI/CD workflow
├── docs/
│   ├── ERD.png                    # Entity Relationship Diagram
│   ├── API-Endpoint-Plan.md       # API endpoint specification
│   └── RaceDay-Database.sql       # SQL Server database script
├── README.md                      # This file
└── .gitignore                     # Git ignore configuration
🛠️ Technologies Used
Technology	Purpose
SQL Server	Relational database management
SSMS	Database development and management
Git	Version control
GitHub	Repository hosting and CI/CD
GitHub Actions	Continuous Integration
Markdown	Documentation formatting
PNG/PDF	ERD diagram format
🔜 What's Next?
Part 2 - API Development
Build RESTful API in C#

Connect to the RaceDay database

Implement all 27 endpoints

Write unit tests

Deploy with GitHub CI/CD

Part 3 - MVC Web Application
Build MVC web application

Consume the API

Integrate Azure Blob Storage

Containerize with Docker

📝 Submission Requirements
What to Submit
✅ GitHub repository link on ARC

✅ /docs folder containing:

ERD image (PNG or PDF)

API endpoint plan (Markdown or PDF)

SQL script (SQL)

✅ README.md with:

System description

Role descriptions

CI/CD screenshot

<img width="1582" height="178" alt="Screenshot 2026-09-04 193248" src="https://github.com/user-attachments/assets/c8358d86-1b05-46d3-8501-62916f869c22" />

YouTube video link


📄 License
This project is created for educational purposes as part of the [Course Name] Portfolio of Evidence.

🙏 Acknowledgments
South African road events community for inspiration

Lecturers and course instructors for guidance

SQL Server documentation resources

© 2026 RaceDay Event Management System - All Rights Reserved

Last Updated: September 2026

🎯 Quick Links
Repository

Video Presentation

CI/CD Status

Issue Tracker
