# BA / DA Delivery Pipeline

## Business question
Which investment projects are under-realised or overdue and therefore require management intervention?

## 01 — Excel — mandatory first pass
Clean the project register, reconcile announced vs realised investment and promised vs verified jobs, use formulas/pivots, calculate ageing and create a project exception queue.

## 02 — Python (Pandas + NumPy) — optional
Use Python for EDA, ageing distributions, anomaly checks, sector/district concentration analysis and automated transformation when it adds value.

## 03 — SQL — mandatory analytical layer
Use joins, CTEs, aggregations and window functions for investment funnels, realisation rankings, ageing cohorts, sector/district benchmarks and jobs-impact queues.

## 04 — Power BI — mandatory decision interface
Build the model, DAX measures, slicers and drill-through: Investment Executive → Realisation Funnel → Project Exceptions → Jobs Scenario.

## 05 — Decision — mandatory outcome
Escalate high-value, low-realisation or overdue projects with priority, owner, next milestone, expected employment impact and assumptions.

## Acceptance criteria
Investment and job totals reconcile across stages; exception thresholds are governed; synthetic project records are explicitly labelled.
