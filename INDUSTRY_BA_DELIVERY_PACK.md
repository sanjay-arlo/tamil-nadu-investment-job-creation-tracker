# Industry BA Delivery Pack — Tamil Nadu Investment-to-Employment Realisation

## Executive decision
Prioritise high-value investments that have large realisation gaps, ageing milestones or significant promised-versus-verified employment gaps.

## Stakeholders
Investment promotion, sector departments, district administration, project owners, finance and executive review teams.

## Requirements
- Track investment from announcement to realisation.
- Compare promised and verified jobs.
- Identify ageing and delayed projects.
- Rank intervention candidates by financial and employment impact.
- Support owner-based follow-up.

## KPI dictionary
Announced investment, realised investment, realisation %, jobs promised, jobs verified, jobs gap and days to realisation.

## Analytical model
`dim_sector` + `dim_district` + `dim_project` → `fact_investment_milestone` → realisation/ageing KPI layer.

## Scenario model
Test realisation uplift, employment-verification uplift and ageing thresholds to prioritise intervention portfolios.

## Acceptance criteria
Realisation % reconciles to announced/realised values, job gaps are reproducible, filters update all views and high-value ageing projects surface consistently.

## Production controls
Verified milestone evidence, project master data, employment verification, ageing definitions, owner workflow, source lineage and audit history.

## Portfolio note
Synthetic illustrative data only; not an investment audit.
