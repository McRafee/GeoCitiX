# GeoCitiX

[![Oracle](https://img.shields.io/badge/Oracle-Database-F80000.svg)](https://www.oracle.com/database/)
[![PL/SQL](https://img.shields.io/badge/PL%2FSQL-Programming-FF8C00.svg)](https://www.oracle.com/database/technologies/appdev/plsql.html)

GeoCitiX is a project that demonstrates the usage of Oracle Database, PL/SQL, and spatial data to store and calculate distances between cities using GPS coordinates.



<p align="center">
  ![GeoCitiX](cover.png)
</p>

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Introduction

This project showcases how to store and work with city coordinates in an Oracle Database using PL/SQL. It provides a table structure to store city names and their corresponding GPS coordinates. Additionally, it includes a PL/SQL procedure to calculate the distances between cities using the spatial capabilities of Oracle Database.

## Installation

To use this project, you need the following prerequisites:
- Oracle Database (version 21.3.0.0.0 or higher)
- Oracle SQLDeveloper or another SQL client

1. Clone the repository:

```bash
git clone https://github.com/McRafee/GeoCitiX.git
```
Connect to your Oracle Database using SQLDeveloper or another SQL client.

Execute the city_coordinates.sql file to create the necessary table and insert sample data.

## Usage
To calculate the distances between cities, you can execute the CalculateCityDistance procedure. Here's an example of how to use it:

```plsql
BEGIN
  CalculateCityDistance('Valletta');
END;
```

Replace 'Valletta' with the name of the desired starting city.

### License
This project is licensed under the MIT License.
