# Leave-Analysis-for-Payhero-workforce-management-platfrom
<h1 style="color:#2E86C1;">Leave Analysis Data Engineering Exercise</h1>

## Candidate  
**Binal Desai**

---

## Overview  
This project is based on a data engineering test exercise focused on analyzing employee leave data from a payroll system.  

The objective is to design a data model, generate meaningful business insights, and build fact tables to support reporting and analytics for business owners.

---

## Dataset Description  

The dataset consists of employee leave records with the following key components:

- Leave Requests (application-level data)  
- Leave Days (day-level breakdown of approved leave)  

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

**Explanation**  
Identifies employees with the highest leave usage across different leave types. Helps detect patterns such as excessive sick or unpaid leave that may impact operations.

---

### 2. Leave Utilization by Employee and Company  

**Measures**  
- Total Approved Leave Hours = SUM(HoursTaken)  
- Expected Work Hours = StandardHours × Working Days  
- Leave Utilization Ratio = Leave Hours / Expected Work Hours  

**Explanation**  
Shows how much working time is consumed by leave. Helps identify employees with high leave utilization and potential productivity risks.

---

### 3. Leave Approval Efficiency  

**Measures**  
- Approval Ratio (%) = Approved Requests / Total Requests  
- Average Lead Time = AVG(Start Date - Request Date)  

**Explanation**  
Evaluates how efficiently leave requests are processed and highlights delays in approval workflows.

---

### 4. Average Leave Duration  

**Measures**  
- Average Leave Duration = AVG(Days per Request)  

**Explanation**  
Helps understand whether employees take short or long leave periods and how this varies by leave type.

---

### 5. Monthly Sick and Unpaid Leave Trends  

**Measures**  
- Total Sick Leave Days  
- Total Unpaid Leave Days  

**Explanation**  
Identifies seasonal patterns and spikes in sick or unpaid leave, supporting workforce planning.

---

### 6. Leave Application Lead Time  

**Measures**  
- Average Lead Time  
- Last-Minute Requests (≤1 day)  
- Planned Requests (>7 days)  

**Explanation**  
Shows whether employees plan leave in advance or apply last-minute, helping improve scheduling.

---

### 7. Upcoming Leave Coverage  

**Measures**  
- Employees on Leave (Next 30 Days)  

**Explanation**  
Helps managers plan staffing and ensure adequate coverage during upcoming absences.

---

### 8. Monthly Leave Seasonality  

**Measures**  
- Total Leave Requests  
- Total Leave Days  

**Explanation**  
Highlights peak and low periods of leave activity for better workload planning.

---

### 9. Leave Before Termination  

**Measures**  
- Leave Days in Last 90 Days  

**Explanation**  
Identifies patterns where employees take increased leave before leaving the organization.

---

## Part B — Dimensional Model  

### Design Approach  

The model is designed using a **star schema** to support both request-level and day-level analysis.

### Fact Tables  

- **FactLeaveRequest**  
  Stores leave request-level information such as request dates, approval status, and total days requested.

- **FactLeaveDay**  
  Stores day-level leave data to analyze actual absences.

### Dimension Tables  

- **DimEmployee**  
  Includes employee and company information (SCD Type 2 for historical tracking)

- **DimDate**  
  Calendar table with attributes such as year, month, and day

- **DimLeaveType**  
  Stores leave categories (SCD Type 1)

- **DimStatus**  
  Stores request status (Approved, Rejected, etc.)

### Rationale  

- Two fact tables are used to maintain proper granularity  
- Employee dimension is denormalized to include company data  
- Star schema simplifies reporting and improves query performance  

---

## Part C — Fact Table SQL Implementation  

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
