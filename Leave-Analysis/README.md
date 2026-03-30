<h1 style="color:#2E86C1;">Leave Analysis Data Engineering Exercise</h1>

## Candidate  
Binal Desai  

---

## Project Overview  
This project is part of a data engineering exercise focused on analyzing employee leave data from a payroll system.

The solution covers:
- Business insight generation
- Dimensional data modeling (star schema)
- SQL-based transformation logic to build fact tables

The goal is to enable business owners to better understand employee leave behavior, approval processes, and workforce planning.

---

## Problem Context  

Organizations need visibility into:
- How employees use leave
- Approval efficiency and delays
- Workforce availability and planning risks  

The raw data alone is not sufficient for analysis, so a structured data model and metrics are required.

---

## Dataset Overview  

### Source Tables  
- LeaveRequest (request-level data)  
- LeaveDay (day-level leave records)  

### Leave Types  
- AL – Annual Leave  
- SL – Sick Leave  
- UPL – Unpaid Leave  
- OTHER  

---

## Part A — Business Insights  

### 1. Top Employees by Leave Type  

**Measures**  
- Total Leave Days Taken = SUM(DayCount)  

**Purpose**  
Identifies employees with high leave usage across categories. Helps detect excessive leave patterns that may impact operations.

---

### 2. Leave Utilization (Employee & Company Level)  

**Measures**  
- Total Leave Hours = SUM(HoursTaken)  
- Expected Work Hours = StandardHours × Working Days  
- Leave Utilization Ratio = Leave Hours / Expected Hours  

**Purpose**  
Evaluates how much working time is lost due to leave. Helps identify productivity risks and high-utilization employees.

---

### 3. Leave Approval Efficiency  

**Measures**  
- Approval Ratio (%)  
- Average Lead Time (Request → Start Date)  

**Purpose**  
Assesses how efficiently leave requests are processed and highlights delays in approval workflows.

---

### 4. Average Leave Duration  

**Measures**  
- Average Days per Leave Request  

**Purpose**  
Helps understand whether employees take short or extended leave and how this varies by leave type.

---

### 5. Monthly Sick and Unpaid Leave Trends  

**Measures**  
- Total Sick Leave Days  
- Total Unpaid Leave Days  

**Purpose**  
Identifies seasonal patterns and unusual spikes, supporting workforce planning.

---

### 6. Leave Application Lead Time  

**Measures**  
- Average Lead Time  
- Last-Minute Requests (≤1 day)  
- Planned Requests (>7 days)  

**Purpose**  
Highlights whether leave is planned or last-minute, helping improve scheduling and reduce disruptions.

---

### 7. Upcoming Leave Coverage (Next 30 Days)  

**Measures**  
- Employees on Leave per Day  

**Purpose**  
Supports short-term workforce planning and ensures adequate staffing levels.

---

### 8. Monthly Leave Seasonality  

**Measures**  
- Total Leave Requests  
- Total Leave Days  

**Purpose**  
Identifies peak and low leave periods for better workload planning.

---

### 9. Leave Before Termination  

**Measures**  
- Leave Days in Last 90 Days before termination  

**Purpose**  
Detects patterns where employees take increased leave before leaving the company.

---

## Part B — Dimensional Model  

### Design Strategy  

Two levels of analysis are required:

1. Request-level (application, approval, leave type)  
2. Day-level (actual employee absence)

To support both, two fact tables are designed.

---

### Fact Tables  

#### FactLeaveRequest  
Stores leave request-level data:
- Request, start, and end dates  
- Leave type and status  
- Requested and approved days  

#### FactLeaveDay  
Stores day-level leave data:
- Individual leave dates  
- Hours taken  
- Daily absence tracking  

---

### Dimension Tables  

- **DimEmployee**  
  Includes employee and company information  
  Modeled as SCD Type 2 to track historical changes  

- **DimDate**  
  Full calendar dimension for time-based analysis  

- **DimLeaveType**  
  Stores leave categories (SCD Type 1)  

- **DimStatus**  
  Stores request status values (SCD Type 1)  

---

### Design Decisions  

- Two fact tables ensure correct granularity  
- Employee dimension is denormalized for performance  
- Star schema simplifies reporting and reduces joins  
- Model is optimized for BI tools such as Power BI  

---

## Part C — SQL Implementation  

### FactLeaveRequest  

```sql
INSERT INTO FactLeaveRequest (
    EmployeeKey,
    LeaveTypeKey,
    StatusKey,
    RequestDateKey,
    StartDateKey,
    EndDateKey,
    ApproverKey,
    RequestedDays,
    ApprovedDays,
    RequestCount,
    SourceLeaveRequestID
)
SELECT 
    de.EmployeeKey,
    dlt.LeaveTypeKey,
    ds.StatusKey,
    ddReq.DateKey,
    ddStart.DateKey,
    ddEnd.DateKey,
    NULL,
    DATEDIFF(lr.EndDate, lr.StartDate) + 1,
    CASE 
        WHEN lr.StatusCode = 'APPROVED' 
        THEN (DATEDIFF(lr.EndDate, lr.StartDate) + 1)
        ELSE 0 
    END,
    1,
    lr.LeaveRequestID
FROM LeaveRequest lr
JOIN DimEmployee de ON lr.EmployeeID = de.EmployeeID
JOIN DimLeaveType dlt ON lr.LeaveTypeCode = dlt.LeaveTypeCode
JOIN DimStatus ds ON lr.StatusCode = ds.StatusCode
JOIN DimDate ddReq ON ddReq.FullDate = lr.RequestDate
JOIN DimDate ddStart ON ddStart.FullDate = lr.StartDate
JOIN DimDate ddEnd ON ddEnd.FullDate = lr.EndDate;
