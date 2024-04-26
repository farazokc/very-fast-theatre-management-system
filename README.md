# VeryFAST Theatre Management System (VFTMS)

## Introduction

The VeryFAST Theatre Management System (VFTMS), is a comprehensive software solution designed to facilitate the management of movie theatres for a global cinema company, VeryFAST. This document outlines the complete system specifications and functionalities.

## Document Conventions

The system will be referred to as "VFTMS" throughout this document.

## Product Scope

VFTMS is aimed at providing an intuitive and efficient movie theatre management system for VeryFAST, which operates multiple theatres worldwide. The system is designed to be user-friendly and straightforward.

## References

- [https://www.nueplex.com](https://www.nueplex.com/) - Inspiration for certain system features and functionalities.

## Overall Description

### Product Perspective

VFTMS is inspired by similar systems like the Neuplex website but offers additional features such as online ticket purchasing.

### Product Functions

- Allow users to browse cinemas by location
- Enable users to select movies based on cinema and schedule
- Support searching by time or movie name
- Allow seat reservations and cancellations
- Provide account creation and management capabilities
- Offer various management options for company officials
- Allow users to add and view movie reviews
- Enable users to view movie details and trailers

### User Classes and Characteristics

User classes include general users, company officials, developers, testers, and administrators. Each class has specific privileges and access levels within the system.

### Operating Environment

VFTMS is built and tested on:
- Operating System: Windows 10 64-bit
- Server: Apache Tomcat Server 9.0.68

### Design and Implementation Constraints

- The system may exhibit undefined behavior under concurrent data access.
- It is designed for current technology and may require updates for future environments.

### Assumptions and Dependencies

The project assumes a stable operating environment with the specified hardware and software components.

## External Interface Requirements

### User Interfaces

The system will feature intuitive and user-friendly interfaces for various user interactions.

### Hardware Interfaces

VFTMS will interact with standard hardware components as specified in the operating environment.

### Software Interfaces

The system will integrate with databases, operating systems, and other software components to perform its functions.

### Communications Interfaces

VFTMS will support various communication protocols for functions like web-based interactions.

## System Features

### Search Cinemas by Location

Allow users to search and view cinemas based on location.

#### Stimulus/Response Sequences

- User selects desired location.
- System displays available cinemas in the area.

#### Functional Requirements

- Retrieve relevant data from the database.
- Display cinema information on the webpage.

### Search by Cinema and Select via Schedule 

Enable users to select a cinema and view available movie screenings.

#### Stimulus/Response Sequences

- User selects a cinema.
- System presents available movie screenings.

#### Functional Requirements

- Retrieve and display cinema schedules from the database.

### Select via Time or Movie Name 

Allow users to search movie screenings by time or movie name.

#### Stimulus/Response Sequences

- User selects time or movie name.
- System displays relevant movie screenings.

#### Functional Requirements

- Implement controllers and data access objects (DAO) for accurate data retrieval.

### Reserve Seats 

Enable users to reserve seats for movie screenings.

#### Stimulus/Response Sequences

- User selects desired movie.
- System allows seat selection and booking.

#### Functional Requirements

- Ensure accurate data retrieval and booking functionalities.

### Search Bookings 

Allow users to search their bookings by booking ID or account.

#### Functional Requirements

- Implement data retrieval and display functionalities for user bookings.

### Account Creation 

Facilitate account creation for users and company officials.

#### Functional Requirements

- Implement user registration and data storage functionalities.

### Management Options 

Provide management capabilities for company officials.

#### Functional Requirements

- Implement functionalities for movie and schedule management, ticket pricing, revenue tracking, reservation management, and report generation.

### See and Add Review (Priority 6)

Allow users to view and add reviews for movies.

#### Functional Requirements

- Implement review management functionalities.

### Check Movie Details and Description (Priority 8)

Enable users to view movie details and watch trailers.

#### Functional Requirements

- Implement functionalities to retrieve movie details and trailers from the database.

---

Based on the provided information from your SRS document, I've extracted the relevant details that would typically be included in a project README.md file. Below is a markdown template summarizing the key points for your VeryFAST Theatre Management System project:

---

# VeryFAST Theatre Management System (VFTMS)

![VFTMS Logo](link_to_logo_image)

This project is a movie theatre management system developed for VeryFAST, a global cinema company, to facilitate theatre operations and online ticket reservations.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [System Requirements](#system-requirements)
- [Technology Stack](#technology-stack)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The VeryFAST Theatre Management System (VFTMS) is a comprehensive solution for managing multiple theatres and screening rooms within the VeryFAST cinema chain. This document outlines the core features and functionality of the system.

## Features

- **Search Cinemas by Location**
  - Users can select preferred locations and view all cinemas in the area.
  
- **Search by Cinema and Select via Schedule**
  - Allows users to choose a specific cinema and select movie screenings based on schedules.
  
- **Select via Time or Movie Name**
  - Users can search for screenings by time or movie name.
  
- **Seat Reservation**
  - Users can reserve seats for movie screenings by providing relevant information.
  
- **Manage Bookings**
  - Users can search and manage their bookings using booking IDs or accounts.
  
- **Account Creation**
  - Provides user and company officials with the ability to create accounts for personalized experiences.
  
- **Management Options**
  - Various management capabilities including movie addition/change, schedule management, ticket pricing, revenue viewing, and more.
  
- **Reviews and Movie Details**
  - Users can add and view movie reviews and check movie details including trailers.

## System Requirements

- **Operating Environment:**
  - Developed and tested on Windows 10 64-bit, hosted on Apache Tomcat Server 9.0.68.

- **Software Stack:**
  - Utilizes MySQL Server 8.0 with InnoDB engine for database compatibility.

## Technology Stack

- Frontend:
  - HTML/CSS
  - JavaScript (React/Angular/Vue)
  
- Backend:
  - Java (Spring Boot)
  
- Database:
  - MySQL
  
- Deployment:
  - Apache Tomcat
