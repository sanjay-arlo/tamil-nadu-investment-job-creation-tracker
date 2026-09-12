# Tamil Nadu Investment & Job-Creation Realisation Tracker

> **Business Analyst / Data Analyst portfolio case study** tracking announced investment, realised investment and promised-versus-verified jobs by sector and district.

## 🚀 Live Dashboard

**[Open the interactive dashboard](https://sanjay-arlo.github.io/tamil-nadu-investment-job-creation-tracker/)**

## Executive summary

This case treats an investment register as an execution-management problem: reconcile announced versus realised value, measure job conversion, identify ageing and under-realised projects, segment sector/district performance, and produce an intervention queue for management follow-up.

## Business problem

**Which investment projects are under-realised or overdue, and where should management intervene to improve capital conversion and verified employment outcomes?**

## Analyst workflow

**Excel → Python / Pandas / NumPy (optional) → SQL / MySQL → Power BI → Decision**

### 1. Excel — first-pass control

Clean the project register, reconcile announced and realised investment, compare promised versus verified jobs, calculate ageing and build sector/district pivots and exception views.

### 2. Python — optional analytical layer

Use **Pandas + NumPy** for portfolio profiling, outlier analysis, repeatable transformations and scenario/sensitivity analysis where useful.

### 3. SQL / MySQL — mandatory analytical layer

Use CTEs, joins, aggregations, window functions, funnel analysis, ageing segmentation, ranking and exception queues to produce reproducible execution KPIs.

### 4. Power BI — mandatory executive layer

Build a governed data model and DAX measures, then deliver **Investment Executive → Realisation Funnel → Project Exceptions → Jobs Scenario** with sector/district/project drill-through.

### 5. Decision — mandatory outcome

Escalate high-value, low-realisation or overdue projects with **priority, owner, next milestone, intervention, expected investment/job impact and escalation trigger**.

## Technical stack

- **Excel** — data cleaning, reconciliation, formulas, pivots, exception analysis and scenario planning
- **SQL / MySQL** — investment KPIs, funnels, ageing, segmentation and ranking
- **Python / Pandas / NumPy** — optional EDA, transformation, outlier and sensitivity analysis
- **HTML / CSS / JavaScript** — interactive live dashboard
- **Chart.js** — browser-based visualisation
- **GitHub Pages** — live dashboard hosting
- **Power BI** — compatible dashboard design direction, data model, DAX and executive reporting specification
- **GitHub** — version control and documentation

## Dashboard story

1. **Investment Executive** — announced vs realised value
2. **Realisation Funnel** — project progression through execution
3. **Project Exceptions** — under-realised and ageing projects
4. **Sector / District View** — concentration and performance patterns
5. **Jobs Scenario** — promised vs verified employment and illustrative uplift
6. **Decision Queue** — management actions and escalation priorities

## KPI framework

- **Realisation %** = realised investment / announced investment × 100
- **Jobs verification %** = verified jobs / promised jobs × 100
- **Jobs gap** = promised jobs − verified jobs
- **Days to realisation** = project execution time measure from source data
- **Priority** = investment materiality + low realisation + ageing + employment impact

## Business Analyst deliverables

Business case, stakeholder framing, KPI dictionary, Excel workflow, optional Python analysis, SQL/MySQL analysis, Power BI/DAX specification, interactive dashboard, project exception framework and management action plan.

## Data quality & governance

Validate investment/job relationships, numeric ranges, duplicates, ageing fields, sector/district master data and KPI reconciliation. Every illustrative record and scenario assumption is clearly separated from verified official information.

## Production upgrade path

Use verified MoU milestones, project-status evidence, employment verification, district/sector master data and dated source lineage. Add ageing alerts, owner-based follow-up workflows, refresh SLAs, auditability and governed status definitions.

## Important limitation

This is a **portfolio case study using synthetic / illustrative data**. It is not an investment audit or an official Guidance Tamil Nadu monitoring system.

## Author

**Sanjay Arlo**  
Business Analyst / Data Analyst Portfolio  
[GitHub](https://github.com/sanjay-arlo)
