DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_date DATE,
    sex CHAR(1),
    salary INT,
    branch_id INT,
    super_id INT

    FOREIGN KEY (super_id) REFERENCES employee(emp_id)
);


INSERT INTO employee VALUES 
(100, 'Jan', 'Levinson', '1999-03-11', 'F', 110000, 1, NULL),
(101, 'Michael', 'Scott', '1967-01-21', 'M', 75000, 2, 100),
(102, 'Josh', 'Porter', '1969-03-12', 'M', 78000, 3, 100),
(103, 'Angela', 'Martin', '1971-06-05', 'F', 63000, 3, 101),
(104, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 3, 101);

SELECT * FROM employee;


--BRANCH TABLE
DROP TABLE branch;
CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT

    -- FOREIGN KEY (mgr_id) REFERENCES employee(emp_id)
);

INSERT INTO branch VALUES
(2, 'Scrantom', 101),
(3, 'Stamford', 102),
(1, 'Corporate', 108);

SELECT * FROM branch;

DROP TABLE client;


--CLIENT TABLE
CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(60),
    branch_id INT,

    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

INSERT INTO client VALUES
(400, 'Dummore Highschool', 2),
(401, 'Lackawana Country', 2), 
(402, 'FedEx', 3),
(403, 'John Daly Law, LLC', 3),
(404, 'Scranton Whitepages', 2);

SELECT * FROM client;


--Work with 
CREATE TABLE works_with (
    emp_id INT,
    client_id INT,
    total_sales INT

    PRIMARY KEY (emp_id, client_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (client_id) REFERENCES client(client_id)
);

INSERT INTO works_with VALUES 
(107, 400, 55000),
(101, 401, 267000),
(105, 402, 53000),
(104, 402, 62000),
(102, 404, 45000);

SELECT * FROM works_with;


