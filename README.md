# Data Analytics and Business Intelligence Internship

**Internship Organisation:** QABash  
**Role:** Data Analyst Intern  
**Internship Period:** 17 October 2026 – 17 November 2026  
**College:** MVJ Degree College  
**Programme:** BCA – Data Science  
**Academic Year:** 2026–2027  

---

## 1. About the Internship

This repository documents my work and learning during my Data Analytics and Business Intelligence Internship at **QABash**.

The internship provided practical exposure to data analysis, data cleaning, SQL, Python, Excel, predictive analytics, machine learning concepts and business intelligence using Power BI.

The activities involved working with business, retail, customer, housing, banking and public transport datasets. The internship concluded with a capstone project focused on analysing BMTC bus network coverage across Bengaluru wards.

## 2. Tools and Technologies

| Technology | Application |
|---|---|
| Microsoft Excel | Spreadsheet analysis and KPI calculations |
| SQL | Data querying, aggregation and joins |
| Python | Data analysis and preprocessing |
| Google Colab | Python development environment |
| Pandas and NumPy | Data manipulation and analysis |
| Matplotlib | Data visualisation |
| Scikit-learn | Machine learning exercises |
| Microsoft Power BI | Interactive dashboards |
| Power Query | Data transformation |
| DAX | Measures and calculations |
| Git and GitHub | Version control and documentation |

---

# 3. Internship Projects and Activities

## Project 1 – Business and Customer Analytics

This project involved analysing business datasets and understanding performance indicators, customer behaviour and transactional trends.

### Maven Analytics – KPI Analysis

- Explored business datasets and identified important KPIs.
- Prepared a KPI summary.
- Created a KPI tree for Namma Metro.
- Studied business performance measurement.
- Interpreted KPIs and prepared findings and recommendations.

### Coffee Shop Analysis

- Explored coffee shop data.
- Practised Excel formulas, including SUMIFS and XLOOKUP.
- Used spreadsheet functions for data summarisation and retrieval.
- Studied business data interpretation.

### Online Retail II – Data Analysis

Worked with the Online Retail II dataset using SQL and Python.

Activities included:

- Dataset inspection and exploration.
- SQL aggregations, joins and CASE statements.
- SQLBolt lessons and Kaggle Python exercises.
- Pandas-based analysis using Google Colab.
- Monthly and overall KPI summaries.
- Repeat-customer and top-product analysis.
- Data cleaning and missing Customer ID handling.
- Identification of cancellation invoices, negative quantities and revenue outliers.
- Creation of derived analytical columns.
- Data-quality checks and cleaning documentation.

Additional columns created included:

- `Revenue`
- `Is_Cancellation_Invoice`
- `Is_Negative_Quantity`
- `Is_Revenue_Outlier`

### Customer Analytics

- RFM analysis (Recency, Frequency and Monetary).
- Cohort analysis.
- Customer segmentation.
- Funnel analysis.
- A/B testing exercises.
- Customer retention planning.

**Outcome:** Developed foundational skills in Excel, SQL, Python, business KPI analysis, data cleaning and customer analytics.

---

## Project 2 – Predictive Analytics and Machine Learning

This phase introduced predictive modelling and machine learning concepts using Python.

### Bengaluru House Price Prediction

- Inspected the Bengaluru house-price dataset.
- Identified and handled missing values.
- Prepared training and testing datasets.
- Built a regression model with preprocessing.
- Evaluated the model.
- Saved the trained model and preprocessor.

### Bank Customer Churn

- Explored the Bank Churn dataset and data dictionary.
- Examined customer-related variables.
- Studied classification concepts.
- Practised model evaluation using confusion matrices.

### Additional Concepts

- Regression and classification.
- Clustering fundamentals.
- Mean Squared Error (MSE).
- Root Mean Squared Error (RMSE).
- Confusion Matrix.
- Predictive model evaluation.

**Outcome:** Gained an understanding of predictive analytics workflows, model preparation and evaluation techniques.

---

## Project 3 – Power BI and Business Intelligence

This phase focused on business intelligence and interactive dashboard development.

Activities included:

- Exploring the Power BI interface.
- Working with Power Query Editor.
- Understanding tables and data connections.
- Preparing and transforming data.
- Creating data models and relationships.
- Learning DAX measures.
- Exploring dashboard visualisations.
- Understanding interactive reporting.

**Outcome:** Developed foundational knowledge of Power BI, data modelling and DAX.

---

# 4. Capstone Project – BMTC Bus Network Analytics

## Project Overview

The **BMTC Bus Network Analytics** project focuses on analysing the distribution of BMTC bus stops and route coverage across Bengaluru wards.

The main objective was to identify wards with comparatively limited mapped bus coverage, assess potential accessibility gaps and develop preliminary feeder-route proposals for selected areas.

The project combined BMTC GTFS data with Bengaluru ward boundary data. Python and Google Colab were used for data processing and spatial analysis, while Power BI was used to develop the final interactive dashboard.

## Problem Statement

Bus-stop and route coverage may vary across different wards. Analysing this distribution can help identify areas that may require further public transport accessibility assessment.

The project investigated:

- Bus-stop distribution across Bengaluru wards.
- Number of mapped routes serving each ward.
- Bus-stop density per square kilometre.
- Distance from ward centroids to the nearest mapped bus stop.
- Potential underserved areas.
- Preliminary feeder-route opportunities.

## Data Sources

**BMTC GTFS Data:**  
https://github.com/ponraghuram/bmtc

**Bengaluru Ward Boundary Data:**  
https://bharatlas.com/view/wards_bengaluru_gba

The ward boundary source contains 369 GBA wards. The analysis used the available versions of the datasets, subject to their completeness and geographic compatibility.

## Project Methodology

The project was completed through eight major phases:

1. **Data Acquisition:** Collected BMTC GTFS and Bengaluru ward boundary data and organised the project environment.
2. **Data Inspection:** Examined dataset structures, identifiers, missing values, coordinates and geographic information.
3. **Data Cleaning:** Standardised relevant fields and validated identifiers, coordinates and ward geometries.
4. **Network Analysis:** Examined routes, trips, stops and network-level summaries.
5. **Spatial Analysis:** Mapped bus stops to ward boundaries and calculated ward-level coverage indicators.
6. **Gap Assessment:** Identified potential underserved wards using stop density, route coverage and nearest-stop distance.
7. **Feeder-Route Planning:** Developed preliminary feeder-route proposals for selected wards.
8. **Dashboard Development:** Presented the analytical findings through an interactive Power BI dashboard.

## Gap Assessment Methodology

Three indicators were used:

- **Stop Density:** Number of mapped bus stops relative to ward area.
- **Route Coverage:** Number of mapped routes serving each ward.
- **Nearest-Stop Distance:** Straight-line distance from the ward centroid to the nearest mapped bus stop.

Project-defined percentile thresholds were used to identify weaker coverage indicators:

- Q25 for stop density.
- Q25 for routes serving a ward.
- Q75 for nearest-stop distance.

A combined gap score was used to classify wards into High, Moderate and Lower Priority categories, with an additional Insufficient Data category for wards that could not be reliably assessed.

Sensitivity checks were also performed using alternative indicator weights to understand how the prioritisation could change.

## Feeder-Route Planning

Two wards were selected for preliminary feeder-route planning:

- **Old Guddadahalli – Ward 51**
- **Rayapuram – Ward 53**

Both wards recorded zero mapped bus stops and zero mapped routes within their boundaries in the ward-level coverage dataset.

Nearby stop records and existing network connectivity were examined to identify possible connections.

The planning process included:

- Identifying nearby bus stops.
- Examining route connectivity using GTFS trip and stop-time information.
- Selecting potential terminal stops.
- Identifying up to three intermediate stops near proposed corridors.
- Estimating distances using the Haversine formula.
- Preparing preliminary route geometries.

These are analytical proposals and are not official BMTC-approved routes.

## Power BI Dashboard

The final dashboard, `BMTC_Bus_Network_Analytics.pbix`, contains five pages:

1. **Executive Overview:** Overall KPIs and ward coverage summary.
2. **Ward Coverage Analysis:** Stop density, route coverage and geographic distribution.
3. **Underserved Ward Analysis:** Priority classifications and coverage gaps.
4. **Feeder Route Proposals:** Proposed corridors, stop sequences and distance summaries.
5. **Findings and Recommendations:** Key observations, recommendations and limitations.

## Key Observations

The analysis identified Old Guddadahalli (Ward 51) and Rayapuram (Ward 53) as candidate areas for further feeder-route assessment.

Both recorded zero mapped stops and routes within their ward boundaries in the coverage dataset. Nearby stop records were examined to understand possible connections to the existing network.

The gap-assessment framework provided a structured method to compare wards using multiple coverage indicators.

## Important Limitations

- The BMTC GTFS source is unofficial and may not represent the complete operational network.
- GTFS schedules do not represent actual passenger ridership.
- Stop density and route coverage are proxy indicators, not direct measures of accessibility or demand.
- Nearest-stop distance is straight-line distance, not walking distance.
- Nearby stops in neighbouring wards may still serve residents.
- Gap-assessment thresholds and weights are project-defined.
- Proposed feeder routes require road-network analysis, operational assessment and field validation.

## Future Scope

The project could be improved by incorporating:

- Official and updated BMTC data.
- Population and demographic information.
- Passenger boarding and alighting data.
- Road-network-based route distances.
- Walking accessibility analysis.
- Service frequency and waiting-time information.
- Traffic and travel-time data.
- Field validation of proposed feeder routes.

---

# 5. Internship Learning Outcomes

The internship helped develop skills in the following areas:

**Technical Skills**
- Excel and spreadsheet analysis.
- SQL querying and data manipulation.
- Python programming and Pandas.
- Data cleaning and exploratory analysis.
- Customer analytics and segmentation.
- Regression, classification and clustering concepts.
- Model evaluation using MSE, RMSE and confusion matrices.
- Power BI, Power Query and DAX.
- Git and GitHub.

**Analytical Skills**
- KPI identification and interpretation.
- Business data analysis.
- Customer behaviour analysis.
- Data-quality assessment.
- Spatial and network analysis.
- Identifying potential coverage gaps.
- Presenting findings and recommendations.

---

# 6. Repository Structure

```text
mvj-internship-data-analytics/
│
├── README.md
├── timesheet.xlsx
│
├── Project_1/
│   ├── Maven_Analytics/
│   ├── Coffee_Shop_Analysis/
│   └── Online_Retail_II/
│
├── Predictive_Analytics/
│   ├── Bengaluru_House_Price_Regression/
│   └── Bank_Customer_Churn/
│
├── Power_BI/
│
└── BMTC_Bus_Network_Analytics/
    ├── notebooks/
    ├── data/
    ├── outputs/
    ├── reports/
    └── BMTC_Bus_Network_Analytics.pbix
```

*Note: This is a representative structure. Actual folder names may differ.*

---

# 7. Internship Timeline

| Period | Activities |
|---|---|
| 17–20 October 2026 | Internship setup, Maven Analytics and KPI exercises |
| 21–25 October 2026 | Coffee Shop Analysis, SQL and Python learning |
| 26–29 October 2026 | Pandas analysis, data cleaning, RFM and cohort analysis |
| 30 October–2 November 2026 | Funnel analysis, A/B testing and customer retention |
| 3–7 November 2026 | Predictive analytics, machine learning and Power BI fundamentals |
| 8–9 November 2026 | Power BI data modelling and DAX |
| 10–17 November 2026 | BMTC Bus Network Analytics capstone |
| 18 November 2026 | Post-internship dashboard finalisation, validation and GitHub upload |

**Note:** The official internship period ended on 17 November 2026. Work recorded on 18 November represents post-internship project closure.

---

# 8. Conclusion

The internship provided practical exposure to the complete data analytics workflow, from data inspection and cleaning to analysis, predictive modelling and dashboard development.

Working with different datasets helped strengthen my understanding of business analytics, customer behaviour, machine learning concepts and business intelligence.

The BMTC Bus Network Analytics capstone brought together several of these skills through network analysis, spatial analysis, gap assessment and interactive dashboard development.

Overall, this internship strengthened my technical foundation and helped me understand how data analytics can be applied to real-world problems and decision-making.

---

## Repository Link

**GitHub:** https://github.com/manuhatescoding/mvj-internship-data-analytics

**Student:** Manoj H S  
**Programme:** BCA – Data Science  
**College:** MVJ Degree College  
**Internship Organisation:** QABash