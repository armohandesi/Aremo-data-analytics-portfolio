# 📡 Telecom Database Design for Enterprise Systems

This project involves the design and implementation of a relational database system tailored for a telecommunications provider. It covers data modeling, SQL query writing, and a CAP-theorem based system evaluation.

## 🎯 Objective
To build a normalized, scalable, and analysis-ready database system that captures:
- Customer profiles and plans
- Usage records (calls, SMS, data)
- Billing, payment history, and device metadata
- Support interaction and satisfaction feedback

## 🧰 Tools & Technologies
- MySQL (local)
- ERD design (normalized model)
- Transaction control (SQL COMMIT, START TRANSACTION)
- Google Drive for script hosting

## 🔍 Key Features
- Revenue analysis by region and service plan
- Heavy user identification
- Billing delay and audit tracking
- Feedback analysis on support interactions
- Transaction-safe payment update logic

## 🔁 Transaction Example
The system uses `START TRANSACTION`, `UPDATE`, and `COMMIT` to manage billing status updates atomically, ensuring integrity in financial subsystems.

## 📌 Analytical Highlights
- CAP theorem application: Availability prioritized in service layer; Consistency emphasized in billing layer
- ER diagram supporting referential integrity and normalization
- Advanced SQL queries for real-world telecom KPIs

## 🔗 Resources
- 📄 [Project Report (PDF)](../telecom-database-design/telecom-report.pdf)
- 📁 [Google Drive: Scripts & ERD](https://drive.google.com/file/d/1SEGyD8bbMA_eWSWvO30Ca9vmSG0IwrrN/view?usp=sharing)

---

This database system represents a practical integration of design principles and analytical goals in enterprise telecom operations.

