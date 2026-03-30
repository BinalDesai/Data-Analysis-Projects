<h1 style="color:#2E86C1;">Leave Analysis Data Engineering Exercise</h1>

---

## Overview

This project is based on a Data Engineering Test Exercise focused on analyzing employee leave data from a payroll system.

The objective is to:

* Build a dimensional data model (star schema)
* Create fact tables using SQL
* Generate business insights for decision-making

---

## Dataset Description

The dataset consists of:

* LeaveRequest → Application-level data
* LeaveDay → Day-level leave records

### Leave Types

* AL – Annual Leave
* SL – Sick Leave
* UPL – Unpaid Leave
* OTHER

---

## Part A — Business Insights

### 1. Top Employees by Leave Type

* Measure: SUM(DayCount)
* Identifies employees taking the most leave by category

### 2. Leave Utilization

* Measures:

  * Total Leave Hours
  * Expected Work Hours
  * Leave Utilization Ratio
* Shows how much working time is spent on leave

### 3. Leave Approval Efficiency

* Approval Ratio (%)
* Average Lead Time
* Status Breakdown
* Evaluates approval process performance

### 4. Average Leave Duration

* Measure: AVG(Days per Request)
* Helps understand leave patterns (short vs long)

### 5. Sick & Unpaid Leave Trends

* Tracks monthly absenteeism patterns

### 6. Leave Application Lead Time

* Last-minute vs planned requests

### 7. Upcoming Leave Coverage

* Employees on leave in next 30 days

### 8. Monthly Leave Seasonality

* Identifies peak leave periods

### 9. Leave Before Termination

* Detects spikes in leave before exit

---

## Part B — Dimensional Model

## Data Model (From PDF - Diagram 1)

![Data Model](assets/data_model.png)

---

## Star Schema Design

### Fact Tables

* FactLeaveRequest → request-level analysis
* FactLeaveDay → day-level analysis

### Dimension Tables

* DimEmployee (SCD Type 2)
* DimDate
* DimLeaveType (SCD Type 1)
* DimStatus (SCD Type 1)

### Design Rationale

* Two fact tables maintain correct granularity
* Employee dimension is denormalized for performance
* Star schema simplifies reporting
* SCD Type 2 supports historical tracking

---

## Database Design (From PDF - Diagram 2)

![Database Design](assets/database_design.png)

---

## Part C — Fact Table Implementation

### Example: FactLeaveRequest

```sql
INSERT INTO FactLeaveRequest (...)
SELECT ...
FROM LeaveRequest ...
JOIN DimEmployee ...
```

Full implementation available in:

* setup.sql

---

### Example: FactLeaveDay

```sql
INSERT INTO FactLeaveDay (...)
SELECT ...
FROM LeaveDay ...
JOIN FactLeaveRequest ...
```

Full implementation available in:

* setup.sql

---

## How to Run

1. Run schema and data load:

```
setup.sql
```

2. Run analysis queries:

```
analysis.sql
```

---

## Tech Stack

* MySQL (MySQL Workbench 8.0)
* Dimensional Modeling (Star Schema)

---

## Notes

* SQL scripts were written and tested in MySQL
* Minor syntax changes may be required for SQL Server
* In BI tools such as Power BI, similar logic can be implemented using DAX

---

## Author

Binal Desai
