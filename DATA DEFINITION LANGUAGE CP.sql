CREATE TABLE Department (
    Num_S INT PRIMARY KEY,
    Label NVARCHAR(255) NOT NULL,
    Manager_Name NVARCHAR(255) NOT NULL
);

CREATE TABLE Employee (
    Num_E INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Position NVARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Department_Num_S INT FOREIGN KEY REFERENCES Department(Num_S)
);

CREATE TABLE Project (
    Num_P INT PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Department_Num_S INT FOREIGN KEY REFERENCES Department(Num_S)
);

CREATE TABLE Employee_Project (
    Employee_Num_E INT,
    Project_Num_P INT,
    Role NVARCHAR(255) NOT NULL,
    PRIMARY KEY (Employee_Num_E, Project_Num_P),
    FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E),
    FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P)
);

