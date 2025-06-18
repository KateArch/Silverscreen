# Silverscreen

## Overview

This project leverages `dbt (data build tool)` to analyze the efficiency of 'Silver Screen', a recently acquired chain of three movie theaters in New Jersey. The core objective was to understand the critical relationship between movie rental costs and the revenue generated from ticket sales, providing management with actionable insights into each location's monthly performance.

## Problem Statement

Management seeks to understand the efficiency of the newly acquired 'Silver Screen' movie theaters in New Jersey. The core business question revolves around the relationship between **movie rental costs** and the **revenue generated from ticket sales** for each movie across all three locations on a monthly basis. This analysis aims to support strategic decisions regarding movie programming and cost management.

## Data Sources

The analysis integrates data from various raw sources, representing the operational facets of 'Silver Screen' movie theaters. These sources include:

* **Movie Details:** Raw data containing movie titles, genres, and studio information.
* **Ticket Sales Data:** Raw transaction-level data for ticket sales at each location.
* **Revenue Data:** Raw data detailing revenue generated from ticket sales at each location.
* **Rental Cost Data:** Raw monthly rental cost figures for each movie at each specific location.

## dbt Project Overview & Data Transformation Workflow

This project is entirely orchestrated using `dbt` to manage data transformations, ensure data quality, and build a robust analytics-ready data model. The dbt project follows best practices for modularity, testing, and documentation.

The data pipeline progresses through the following layers within the dbt project:

1.  **Staging Layer (`stg_*` models):** Cleans and standardizes raw source data.

2.  **Intermediate Layer (`int_*` models - *if applicable*):** Combines and transforms data from the staging layer to create more complex, reusable datasets.

3.  **Marts/Fact Layer:** Builds the final, aggregated, and business-ready tables for analytical consumption.
    * **`mart_movies`**: This is the core output table. It integrates cleaned movie details, unified ticket sales and revenue data, and corresponding monthly rental costs to provide a comprehensive view of each movie's performance across all locations.

## Data Quality & Testing (dbt Tests)

A critical aspect of this dbt project is its emphasis on data quality. Numerous `dbt tests` have been implemented across various models to ensure the reliability and accuracy of the transformed data. Key tests include:

* `unique` and `not_null` tests on primary keys (e.g., `movie_id`, `location_id`, `month_id`).

## Key Metrics & Analysis

The primary output, the `fct_silver_screen_monthly_performance` table, provides the foundational data for management's analysis. It includes:

* **Movie Details:** Comprehensive attributes for each film.
* **Location Information:** Specific identifiers for each New Jersey theater.
* **Monthly Rental Costs:** The expense incurred for each movie at each location.
* **Total Monthly Ticket Sales:** The total count of tickets sold.
* **Total Monthly Revenue Generated:** The total monetary value from ticket sales.

This granular data enables subsequent analysis of:
* **Profitability per Movie:** By comparing revenue and rental costs.
* **Location Efficiency:** Identifying which locations perform better for specific movies.
* **Cost-Benefit Ratio:** Understanding the return on investment for movie rental expenses.

## Tools & Technologies

* **dbt (data build tool):** Core framework for all data transformations and modeling.
* **SQL:** The primary language used for all dbt models and transformations.
* **Snowflake:** The data platform where dbt models are built and stored.
* **Tableau:** For visualization and dashboarding of the final table.
* **Git/GitHub:** For version control and collaboration of the dbt project.
