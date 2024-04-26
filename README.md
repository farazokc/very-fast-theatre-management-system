# VeryFAST Theatre Management System (VFTMS)

## Introduction

The VeryFAST Theatre Management System (VFTMS), is a comprehensive software solution designed to facilitate the management of movie theatres for a global cinema company, VeryFAST. This document outlines the complete system specifications and functionalities.

## Overall Description

### Product Perspective

VFTMS is inspired by similar systems like the Neuplex website but offers additional features such as online ticket purchasing.

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

### Technology Stack

VFTMS is built and tested on:
- **Operating System**:
  - Windows 10 64-bit

- **Front-end**:
  - HTML, CSS, JS

- **Back-end**:
  - Java EE Web project with Maven.

- **Server**:
  - Apache Tomcat Server 9.0.68

- **Database**:
  - MySQL Server 8.0 with InnoDB engine.

### Design and Implementation Constraints

- The system may exhibit undefined behavior under concurrent data access.
- It is designed for current technology and may require updates for future environments.
