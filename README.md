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
    * **`stg_movies`**: Refines the raw movie information, ensuring data accuracy and consistency in titles, genres, and studio details.
    * **`stg_ticket_sales`**: Unifies raw ticket sales data from different locations into a comprehensive view, including location details and monthly aggregation.
    * **`stg_revenue`**: Unifies raw revenue data from different locations, similar to ticket sales.
    * **`stg_rental_costs`**: Standardizes and prepares monthly rental cost data.

2.  **Intermediate Layer (`int_*` models - *if applicable*):** Combines and transforms data from the staging layer to create more complex, reusable datasets. (e.g., `int_monthly_movie_performance` joining sales and revenue before costs).

3.  **Marts/Fact Layer (`fct_*` models):** Builds the final, aggregated, and business-ready tables for analytical consumption.
    * **`fct_silver_screen_monthly_performance`**: This is the core output table. It integrates cleaned movie details, unified ticket sales and revenue data, and corresponding monthly rental costs to provide a comprehensive view of each movie's performance across all locations.

## Data Quality & Testing (dbt Tests)

A critical aspect of this dbt project is its emphasis on data quality. Numerous `dbt tests` have been implemented across various models to ensure the reliability and accuracy of the transformed data. Key tests include:

* `unique` and `not_null` tests on primary keys (e.g., `movie_id`, `location_id`, `month_id`).
* `relationships` tests to ensure referential integrity between models.
* `accepted_values` tests for categorical data (e.g., `genre`, `studio`).
* Custom tests to validate data ranges (e.g., non-negative ticket sales, reasonable rental costs).

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
* **[Your Data Warehouse, e.g., Snowflake, Google BigQuery, Amazon Redshift, PostgreSQL]:** The data platform where dbt models are built and stored.
* **[Your BI Tool, if applicable, e.g., Power BI, Tableau, Looker, Metabase]:** For visualization and dashboarding of the final `fct_silver_screen_monthly_performance` table.
* **Git/GitHub:** For version control and collaboration of the dbt project.

## How to Run This dbt Project

To view, extend, or re-run this analysis, follow these steps:

1.  **Prerequisites:**
    * Ensure you have `dbt` installed (`pip install dbt-[your_data_warehouse_adapter]`).
    * Access to the `[Your Data Warehouse]` with necessary credentials.
    * A local Git client.

2.  **Clone the Repository:**
    ```bash
    git clone [repository_url]
    cd silver_screen_dbt_project
    ```

3.  **Configure dbt Profiles:**
    * Edit your `~/.dbt/profiles.yml` file to connect to your data warehouse. An example `profiles.yml` entry for this project might look like:
        ```yaml
        silver_screen_dbt_project:
          target: dev
          outputs:
            dev:
              type: [your_data_warehouse_adapter_type] # e.g., snowflake, bigquery, postgres
              # ... add your specific connection details (account, user, password, database, schema, etc.)
        ```
    * Refer to the [dbt documentation](https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml) for detailed connection instructions for your specific data platform.

4.  **Load Source Data:**
    * Ensure your raw data sources are accessible and configured in your data warehouse. This dbt project assumes raw data tables already exist in a specified schema (e.g., `raw_data_schema`).
    * (If source data needs to be loaded by dbt itself, include instructions here for initial `dbt seed` or `dbt run --select source:*` if using external tables/sources).

5.  **Run dbt Models:**
    * Navigate to the project root directory in your terminal.
    * Test your dbt connection:
        ```bash
        dbt debug
        ```
    * Run all dbt models, including transformations and tests:
        ```bash
        dbt build
        ```
    * Alternatively, to run only models or tests:
        ```bash
        dbt run # Builds all models
        dbt test # Runs all tests
        dbt docs generate # Generates project documentation
        dbt docs serve # Serves local documentation in browser
        ```

6.  **Explore the Output:**
    * After `dbt build` completes, the `fct_silver_screen_monthly_performance` table will be available in your data warehouse for further analysis and visualization using your chosen BI tool.
