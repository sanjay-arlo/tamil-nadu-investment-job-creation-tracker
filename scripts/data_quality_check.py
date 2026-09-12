from pathlib import Path
import csv
p=Path(__file__).parents[1]/'sample_tn_investment_mou_tracker.csv'
req={'mou_id','sector','district','announced_investment_inr','realisation_pct','realised_investment_inr','jobs_promised','jobs_verified','days_to_realisation'}
with p.open(newline='',encoding='utf-8') as f: rows=list(csv.DictReader(f))
missing=sorted(req-set(rows[0])) if rows else sorted(req)
invalid=sum(1 for r in rows if float(r['announced_investment_inr'])<0 or float(r['realised_investment_inr'])<0 or not 0<=float(r['realisation_pct'])<=100 or int(r['jobs_promised'])<0 or int(r['jobs_verified'])<0 or int(r['days_to_realisation'])<0)
print({'rows':len(rows),'missing_columns':missing,'invalid_rows':invalid})
