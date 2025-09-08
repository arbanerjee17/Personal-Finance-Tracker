CREATE DATABASE finance;
USE finance;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150)
);

CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(80) NOT NULL,
  type ENUM('expense','income') DEFAULT 'expense'
);

CREATE TABLE income (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  category_id INT,
  amount DECIMAL(12,2) NOT NULL,
  date DATE NOT NULL,
  note TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE expenses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  category_id INT,
  amount DECIMAL(12,2) NOT NULL,
  date DATE NOT NULL,
  payee VARCHAR(150),
  note TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE INDEX idx_expenses_date ON expenses(date);
CREATE INDEX idx_income_date ON income(date);

-- users
INSERT INTO users (name,email) VALUES ('You','you@example.com');

-- categories
INSERT INTO categories (name,type) VALUES
 ('Salary','income'), ('Freelance','income'),
 ('Groceries','expense'), ('Transport','expense'),
 ('Rent','expense'), ('Entertainment','expense');

-- income (example dates)
INSERT INTO income (user_id, category_id, amount, date, note) VALUES
 (1,1,50000,'2025-07-01','July salary'),
 (1,2,6000,'2025-07-15','Website gig');

-- expenses
INSERT INTO expenses (user_id, category_id, amount, date, payee, note) VALUES
 (1,3,3200,'2025-07-03','BigMart','weekly groceries'),
 (1,5,15000,'2025-07-05','Landlord','monthly rent'),
 (1,4,300,'2025-07-06','Metro','commute'),
 (1,6,800,'2025-07-20','Cinema','movie night');
 SELECT * FROM USERS;
 SELECT * FROM CATEGORIES;
 SELECT * FROM INCOME;
 
 SELECT DATE_FORMAT(date,'%Y-%m') AS month,
       SUM(amount) AS total_expenses
FROM expenses
WHERE user_id = 1
GROUP BY month
ORDER BY month;

-- SQLite
SELECT c.name, SUM(e.amount) AS spent
FROM expenses e
JOIN categories c ON e.category_id = c.id
WHERE e.user_id = 1
GROUP BY c.name
ORDER BY spent DESC;

-- MySQL: same but DATE_FORMAT if needed above

CREATE VIEW monthly_balance AS
SELECT user_id, month,
       SUM(total_income) AS total_income,
       SUM(total_expense) AS total_expense,
       SUM(total_income) - SUM(total_expense) AS net
FROM (
  SELECT user_id, DATE_FORMAT(date,'%Y-%m') AS month, amount AS total_income, 0 AS total_expense FROM income
  UNION ALL
  SELECT user_id, DATE_FORMAT(date,'%Y-%m') AS month, 0 AS total_income, amount AS total_expense FROM expenses
) t
GROUP BY user_id, month;
SELECT * FROM monthly_balance WHERE user_id = 1 ORDER BY month;

SELECT c.name AS category, 
       SUM(e.amount) AS total_spent
FROM expenses e
JOIN categories c ON e.category_id = c.id
WHERE e.user_id = 1
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

SELECT month, total_income, total_expense, net
FROM monthly_balance
WHERE user_id = 1
ORDER BY month;

SELECT month, total_income, total_expense, net
FROM monthly_balance
WHERE user_id = 1
ORDER BY month;

SELECT month,
       SUM(total_income) AS total_income,
       SUM(total_expense) AS total_expense,
       SUM(total_income) - SUM(total_expense) AS net
FROM (
    SELECT user_id, DATE_FORMAT(date,'%Y-%m') AS month, amount AS total_income, 0 AS total_expense 
    FROM income
    UNION ALL
    SELECT user_id, DATE_FORMAT(date,'%Y-%m') AS month, 0 AS total_income, amount AS total_expense 
    FROM expenses
) t
WHERE user_id = 1
GROUP BY month
ORDER BY month;

-- August
INSERT INTO income (user_id, category_id, amount, date, note)
VALUES (1, 1, 50000, '2025-08-01', 'August salary');

INSERT INTO expenses (user_id, category_id, amount, date, payee, note)
VALUES (1, 5, 15000, '2025-08-05', 'Landlord', 'August rent');

-- September
INSERT INTO income (user_id, category_id, amount, date, note)
VALUES (1, 1, 50000, '2025-09-01', 'September salary');

INSERT INTO expenses (user_id, category_id, amount, date, payee, note)
VALUES (1, 3, 3500, '2025-09-03', 'BigMart', 'September groceries');

SELECT COUNT(*) FROM expenses WHERE user_id=1;
SELECT SUM(amount) FROM expenses WHERE user_id=1;
SELECT SUM(amount) FROM income WHERE user_id=1;

SELECT c.name AS category,
       SUM(e.amount) AS total_spent
FROM expenses e
JOIN categories c ON e.category_id = c.id
WHERE e.user_id = 1
GROUP BY c.name
ORDER BY total_spent DESC;








