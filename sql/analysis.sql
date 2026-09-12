-- Tamil Nadu Investment & Job-Creation: reproducible SQL analysis
-- MySQL 8+; portfolio data is synthetic/illustrative.

-- 1) Portfolio profile
SELECT COUNT(*) AS project_count,
       COUNT(DISTINCT sector) AS sector_count,
       COUNT(DISTINCT district) AS district_count,
       ROUND(SUM(announced_investment_inr),0) AS announced_investment_inr,
       ROUND(SUM(realised_investment_inr),0) AS realised_investment_inr,
       SUM(jobs_promised) AS jobs_promised,
       SUM(jobs_verified) AS jobs_verified
FROM sample_tn_investment_job_creation;

-- 2) Sector KPI layer using a CTE
WITH sector_kpi AS (
    SELECT sector,
           COUNT(*) AS projects,
           SUM(announced_investment_inr) AS announced_inr,
           SUM(realised_investment_inr) AS realised_inr,
           SUM(jobs_promised) AS jobs_promised,
           SUM(jobs_verified) AS jobs_verified,
           AVG(realisation_pct) AS avg_realisation_pct
    FROM sample_tn_investment_job_creation
    GROUP BY sector
)
SELECT sector,
       projects,
       ROUND(announced_inr,0) AS announced_inr,
       ROUND(realised_inr,0) AS realised_inr,
       ROUND(100.0 * realised_inr / NULLIF(announced_inr,0),2) AS conversion_pct,
       jobs_promised,
       jobs_verified,
       jobs_promised - jobs_verified AS jobs_gap,
       ROUND(avg_realisation_pct,2) AS avg_realisation_pct
FROM sector_kpi
ORDER BY conversion_pct ASC, announced_inr DESC;

-- 3) District ranking with window function
WITH district_kpi AS (
    SELECT district,
           SUM(announced_investment_inr) AS announced_inr,
           SUM(realised_investment_inr) AS realised_inr,
           SUM(jobs_promised) AS jobs_promised,
           SUM(jobs_verified) AS jobs_verified
    FROM sample_tn_investment_job_creation
    GROUP BY district
)
SELECT district,
       ROUND(announced_inr,0) AS announced_inr,
       ROUND(realised_inr,0) AS realised_inr,
       ROUND(100.0 * realised_inr / NULLIF(announced_inr,0),2) AS conversion_pct,
       jobs_promised - jobs_verified AS jobs_gap,
       DENSE_RANK() OVER (
           ORDER BY (announced_inr - realised_inr) DESC
       ) AS realisation_gap_rank
FROM district_kpi
ORDER BY realisation_gap_rank;

-- 4) Project exception queue using CTE + window function
WITH ranked_projects AS (
    SELECT *,
           (announced_investment_inr - realised_investment_inr) AS investment_gap_inr,
           (jobs_promised - jobs_verified) AS jobs_gap,
           ROW_NUMBER() OVER (
               ORDER BY (announced_investment_inr - realised_investment_inr) DESC,
                        jobs_promised - jobs_verified DESC,
                        days_to_realisation DESC
           ) AS priority_rank
    FROM sample_tn_investment_job_creation
)
SELECT priority_rank,
       mou_id, sector, district,
       ROUND(announced_investment_inr,0) AS announced_investment_inr,
       ROUND(realised_investment_inr,0) AS realised_investment_inr,
       ROUND(realisation_pct,2) AS realisation_pct,
       jobs_promised, jobs_verified, jobs_gap,
       days_to_realisation
FROM ranked_projects
WHERE realisation_pct < 60
   OR investment_gap_inr > 0
ORDER BY priority_rank
LIMIT 25;

-- 5) Self-join benchmark: projects below their sector's average realisation
WITH sector_avg AS (
    SELECT sector, AVG(realisation_pct) AS sector_avg_realisation_pct
    FROM sample_tn_investment_job_creation
    GROUP BY sector
)
SELECT p.mou_id, p.sector, p.district,
       ROUND(p.realisation_pct,2) AS project_realisation_pct,
       ROUND(s.sector_avg_realisation_pct,2) AS sector_avg_realisation_pct,
       ROUND(s.sector_avg_realisation_pct - p.realisation_pct,2) AS gap_vs_sector_avg
FROM sample_tn_investment_job_creation p
JOIN sector_avg s
  ON p.sector = s.sector
WHERE p.realisation_pct < s.sector_avg_realisation_pct
ORDER BY gap_vs_sector_avg DESC;

-- 6) Data-quality control
SELECT COUNT(*) AS invalid_rows
FROM sample_tn_investment_job_creation
WHERE mou_id IS NULL
   OR sector IS NULL
   OR district IS NULL
   OR announced_investment_inr IS NULL
   OR realised_investment_inr IS NULL
   OR jobs_promised IS NULL
   OR jobs_verified IS NULL;
