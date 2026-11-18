# BMTC Bus Network Analytics

## One-Page Project Charter

**Project type:** Data Analytics Capstone\
**Domain:** Urban mobility and public transportation\
**Geographic focus:** Bengaluru, Karnataka, India\
**Project option:** 10 --- BMTC Bus Network (MVJ BCA Data Science
Internship 2026--27)\
**Prepared on:** 9 November 2026\
**Project status:** Planning and data-acquisition phase\
**Team / author:** To be filled in

------------------------------------------------------------------------

## 1. Problem statement

Access to public transportation may vary across Bengaluru's wards. Some
areas may have fewer nearby BMTC stops or weaker connections to the
wider bus network than others. This project will examine available BMTC
route and stop information alongside Bengaluru ward-level geographical
data to identify areas that appear relatively underserved.

The project will develop **two evidence-based feeder-route proposals**
intended to improve connectivity between selected underserved areas and
existing bus corridors or important transport hubs.

This is an analytical study based on the datasets available to the
project. It is not an official BMTC service plan and will not claim to
measure actual passenger demand unless suitable passenger data is
obtained.

## 2. Project goal

Assess the spatial coverage of the BMTC bus network across Bengaluru
wards, identify potential gaps in access, and recommend two feasible
feeder-route concepts supported by data and clearly stated assumptions.

## 3. Objectives

1.  Obtain and document a BMTC General Transit Feed Specification (GTFS)
    dataset and a compatible Bengaluru ward-boundary dataset.
2.  Inspect, clean and validate the source data while preserving the
    original raw files.
3.  Summarise routes, stops, trips and scheduled service information
    where available.
4.  Relate bus-stop locations to ward boundaries.
5.  Compare wards using suitable accessibility and coverage indicators.
6.  Identify candidate underserved wards using transparent, reproducible
    criteria.
7.  Design two proposed feeder-route concepts connecting selected areas
    to existing routes or transport hubs.
8.  Communicate the results through a Power BI dashboard, a seven-slide
    Demo Day presentation and project documentation.

## 4. Scope

### Included

-   Bengaluru ward-level analysis, subject to the coverage and vintage
    of the available ward dataset.
-   GTFS-based analysis of routes, stops, trips, stop times and service
    calendars, where those files are present and usable.
-   Data cleaning, validation, exploratory analysis and SQL/Python
    summaries.
-   Spatial analysis of stop distribution and approximate access to
    stops.
-   Comparative assessment of ward-level bus coverage.
-   Two proposed feeder-route concepts with rationale, suggested
    connections and limitations.
-   Power BI reporting and a documented analytical workflow.

### Excluded unless additional reliable data becomes available

-   Actual passenger counts, passenger demand, occupancy or ridership
    forecasts.
-   Live bus tracking, actual arrival-time reliability or
    traffic-adjusted journey times.
-   Financial costing, fleet availability, driver scheduling or
    operational feasibility certification.
-   Claims that proposed routes have been approved or endorsed by BMTC.
-   Engineering-grade route optimisation or road-network simulation.

## 5. Data sources and acquisition plan

  -----------------------------------------------------------------------
  Dataset           Intended use      Planned source    Status
  ----------------- ----------------- ----------------- -----------------
  BMTC GTFS feed    Routes, stops,    Kaggle --- search To be located and
                    trips, schedules  for **BMTC GTFS** verified
                    and service                         
                    calendars                           

  Bengaluru ward    Ward polygons,    OpenCity or       To be located and
  boundaries / ward identifiers and   another           verified
  data              available ward    documented public 
                    attributes        source            

  Optional          Contextualise     Official/public   Optional; not
  population data   stop coverage     source, if        confirmed
                    relative to       available and     
                    residents         compatible        
  -----------------------------------------------------------------------

After download, record each dataset's title, publisher, URL, access
date, licence, date range, geographical coverage, file names and known
limitations.

The ward dataset may use an older 198-ward BBMP structure. Its boundary
vintage and compatibility with the selected GTFS feed must be checked
and disclosed. Do not assume historical ward boundaries match current
administrative boundaries.

## 6. Key questions

-   How many routes, stops and scheduled trips are represented in the
    selected GTFS feed?
-   Which wards contain the greatest and fewest numbers of mapped bus
    stops?
-   Which wards have relatively low stop density or weaker route
    coverage?
-   How far are ward locations from their nearest mapped BMTC stops?
-   Which candidate areas have the strongest evidence for improved
    feeder connectivity?
-   Which two feeder-route concepts could connect those areas to
    existing public-transport services?

## 7. Proposed KPIs and measures

  -----------------------------------------------------------------------
  KPI / measure           Definition or           Interpretation
                          calculation             
  ----------------------- ----------------------- -----------------------
  Total routes            Count of distinct route Size of represented
                          IDs                     route network

  Total stops             Count of distinct stop  Number of mapped stops
                          IDs                     

  Total scheduled trips   Count of distinct trip  Scheduled service
                          IDs for the selected    volume in the feed
                          service period          

  Average stops per route Route-stop occurrences  Indicative route
                          divided by distinct     structure; document
                          routes                  counting method

  Routes serving a ward   Count of distinct       Breadth of route
                          routes associated with  connectivity
                          stops in that ward      

  Bus stops per sq. km    Stops assigned to a     Stop-density comparison
                          ward divided by ward    
                          area in sq. km          

  Nearest-stop distance   Distance from a defined Approximate spatial
                          ward reference point or access; explain method
                          sampled location to the 
                          nearest stop            

  Candidate underserved   Wards meeting           Areas for further
  wards                   documented low-coverage investigation
                          criteria                
  -----------------------------------------------------------------------

**KPI caution:** Stop counts and density are proxies for spatial
coverage, not proof of passenger access or service adequacy. A ward may
be served by stops just outside its boundary. Test more than one spatial
measure where practical, such as stops within the ward and distance to
the nearest stop. Use population-normalised measures only if reliable,
suitably dated population data is available.

## 8. Methodology and tools

1.  **Data acquisition:** Download the selected GTFS and ward datasets.
    Preserve original files in `data/raw/`.
2.  **Data inspection:** Review file structure, columns, data types,
    date coverage, coordinate reference systems, identifiers and missing
    values.
3.  **Cleaning and quality checks:** Use Python (Pandas/GeoPandas)
    and/or SQL (DuckDB) to standardise fields, handle duplicates and
    invalid records, check relationships between GTFS tables and
    validate coordinates.
4.  **Network analysis:** Calculate route, stop, trip and ward-level
    summaries using documented counting rules.
5.  **Spatial analysis:** Use ward polygons and stop coordinates to
    assign stops to wards and calculate coverage measures. Check
    coordinate systems and spatial-join results.
6.  **Gap assessment:** Define and document a transparent method for
    flagging candidate underserved wards. Compare relevant measures
    rather than relying on a single stop-count ranking.
7.  **Feeder-route proposals:** Select two candidate connections based
    on identified gaps, existing network connections and available
    geographical evidence. Document proposed stops, endpoints, served
    areas and assumptions.
8.  **Visualisation and communication:** Build a Power BI dashboard,
    capture screenshots and prepare a seven-slide story deck.

**Tools:** Google Colab, Python, Pandas, GeoPandas, DuckDB/SQL, Power BI
Desktop, Google Drive and GitHub. Final tool choices may be adjusted to
the actual dataset formats and fields.

## 9. Data quality and validation plan

-   Confirm required GTFS files and essential columns are present.
-   Check route, stop and trip identifiers for missing values and
    duplicates.
-   Validate referenced route, stop, trip and service IDs across GTFS
    tables.
-   Check that latitude and longitude are numeric and within valid
    geographic ranges.
-   Parse date and time fields and check for invalid or inconsistent
    values.
-   Check ward identifiers and geometries for missing, invalid or
    duplicate records.
-   Review spatial joins for unmatched stops and unexpected assignments.
-   Record row counts before and after cleaning, explaining exclusions.
-   Reconcile summary totals across source and processed tables where
    applicable.

Record all checks, assumptions, exclusions and transformations in a
cleaning log. Keep raw source files unchanged.

## 10. Expected deliverables

1.  **One-page project charter:** This document, saved as `charter.md`.
2.  **Clean data pipeline:** Reproducible SQL and/or Python scripts,
    processed datasets and documented quality checks.
3.  **Analysis notebooks:** Notebooks for inspection, cleaning, network
    analysis, ward accessibility and feeder-route assessment.
4.  **Power BI dashboard:** Editable `.pbix` file and clear screenshots
    of completed report pages.
5.  **Seven-slide Demo Day story deck:** A concise narrative covering
    the problem, data, method, findings, two proposed feeder routes,
    recommendations and limitations.
6.  **README:** Project overview, data sources, setup/run instructions,
    key findings, limitations, reproducibility notes and an AI-use log.

## 11. Risks, assumptions and limitations

-   The GTFS feed may be incomplete, outdated, unofficial or may not
    represent every BMTC service. Verify its publisher, version, date
    coverage and licence.
-   The ward dataset may use historical boundaries or identifiers that
    do not match the GTFS period. Assess and document compatibility.
-   GTFS scheduled trips do not establish actual bus operations,
    passenger demand, occupancy or reliability.
-   Stop density alone does not establish whether a ward is underserved.
    Consider ward area, nearby stops, route connectivity and population
    context where data permits.
-   Straight-line distance is not the same as walking distance or travel
    time. If a road/pedestrian network dataset is unavailable, label
    distance results as approximate.
-   Proposed feeder routes are preliminary analytical concepts. Road
    access, safety, operating cost, fleet requirements, passenger demand
    and BMTC operational approval are outside the evidence available
    unless separately researched.
-   Clearly identify missing, inferred or manually created values. Do
    not make unsupported ridership or impact claims.

## 12. Responsible AI-use plan

AI tools may be used to explain concepts, help draft code, troubleshoot
errors, suggest analytical approaches and improve documentation. The
project author(s) remain responsible for checking all generated work.

The final README will contain an AI-use log:

  --------------------------------------------------------------------------
  Date           Tool           Purpose        Output used    Verification
                                                              performed
  -------------- -------------- -------------- -------------- --------------
  To be filled   To be filled   To be filled   To be filled   To be filled
  in             in             in             in             in

  --------------------------------------------------------------------------

Do not enter hypothetical AI-use activities as completed work. Record
actual use as the project progresses. Verify code against the real data,
independently check calculations and cite external datasets and
references.

## 13. Success criteria

The project will be considered complete when: - Source datasets,
versions, licences and limitations are documented. - Raw data is
preserved and the cleaning process is reproducible. - Quality checks are
run and their results are recorded. - Ward-level coverage measures are
calculated using documented methods. - Candidate underserved wards are
identified with evidence and caveats. - Two feeder-route concepts are
presented with clear endpoints, connections and rationale. - The Power
BI `.pbix` and screenshots are saved. - The seven-slide Demo Day deck
and README, including findings, limitations and the actual AI-use log,
are complete.

------------------------------------------------------------------------

**Charter note:** This charter defines the planned scope.
Dataset-specific details, final KPI definitions and analytical methods
may be refined after source files are inspected. Document any material
change to the project question or deliverables.
