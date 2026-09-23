# Employee Management System (Python + MySQL)

A Graphical Interface Employee Management System built with **Python** and **MySQL**. It lets you add, edit, promote, activate/deactivate, and display employee records stored in a MySQL database.

## Features

- **Add Employee** — insert a new employee record (auto-generated ID, defaults to `Active` status)
- **Edit Employee Details** — update name, position, or salary for an existing employee
- **Mark Employee Inactive / Active** — toggle an employee's status
- **Promote Employee** — increase an employee's salary by a given amount (blocked for inactive employees)
- **Display Employees** — list all employee records in a formatted view

## Project Structure

```
Employee_Management_System/
├── Employee_Management_System_using_Python_and_MySQL.ipynb   # Main notebook (all application code)
├── database/
│   └── schema.sql                                            # MySQL database + table + sample data
├── requirements.txt                                           # Python dependencies
└── README.md
```

## Requirements

- Python 3.8+
- MySQL Server (5.7+ or 8.0+)
- `mysql-connector-python` package

Install the Python dependency:

```bash
pip install -r requirements.txt
```

## Database Setup

1. Make sure MySQL Server is running locally.
2. Run the provided schema script to create the database, table, and sample data:

   ```bash
   mysql -u root -p < database/schema.sql
   ```

   This creates a database named **`company_db`** with a single table **`employee`**:

   | Column   | Type                          | Notes                        |
   |----------|-------------------------------|-------------------------------|
   | id       | INT, AUTO_INCREMENT, PRIMARY KEY | Unique employee ID          |
   | name     | VARCHAR(100)                  | Employee name                 |
   | position | VARCHAR(100)                  | Job title / post              |
   | salary   | DECIMAL(10,2)                 | Current salary                |
   | status   | ENUM('Active','Inactive')     | Employment status              |

   The script also inserts sample employees matching the demo run shown in the notebook (Aadil, Afraz, Rayaan, Kaushik, Afnan, Afzal, Ray, Rahman).

3. Update the connection credentials in the notebook to match your local MySQL setup:

   ```python
   con = mysql.connector.connect(
       host="localhost",
       user="root",
       password="YOUR_PASSWORD",
       database="company_db"
   )
   ```

## Running the Application

1. Open the notebook:

   ```bash
   jupyter notebook Employee_Management_System_using_Python_and_MySQL.ipynb
   ```

2. Run all cells. The connection cell will connect to MySQL and define all the functions; the final cell starts the interactive menu:

   ```
   Welcome to Employee Management Record
   ------------------------------------
   1. Add Employee
   2. Edit Employee Details
   3. Mark Employee Inactive
   4. Mark Employee Active
   5. Promote Employee
   6. Display Employees
   7. Exit
   ```

3. Enter the number corresponding to the action you want and follow the prompts.

## Notes

- All database operations use parameterized queries (`%s` placeholders) to prevent SQL injection.
- Every write operation (`INSERT`/`UPDATE`) is wrapped in a `try/except/finally` block with `commit()`/`rollback()` for data integrity.
- Inactive employees cannot be promoted — the system checks status before applying a raise.
- Consider not hard-coding your MySQL password directly in the notebook for real deployments; use an environment variable or a config file instead.

## Author

Built as a portfolio project demonstrating Python ↔ MySQL integration (CRUD operations, transactions, and CLI menu design).
