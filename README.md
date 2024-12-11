# Product Analysis of Sales Duration

<p align="center">
  <img src="https://github.com/aliaksparkh/Sales-Duration/blob/main/Recruiter-Action-Stopwatch-825x510.jpg" width="400">
</p>

## Project Overview
This project focuses on analyzing the duration of sales, leveraging SQL queries, raw event data, and Tableau visualizations. The insights generated aim to inform key stakeholders about product performance and guide strategic decisions to optimize sales duration.

- **Query File**: [Duration_PA.sql](https://github.com/aliaksparkh/Sales-Duration/blob/main/Duration_PA.sql)
- **Data File**: [Raw-events-PA.csv](https://github.com/aliaksparkh/Sales-Duration/blob/main/Raw-events-PA.csv)
- **Tableau Dashboard**: [Dashboard Link](https://public.tableau.com/app/profile/aliaksandr.parkhomenka/viz/Product_Analysis_OSD/Dashboard1)
- **Presentation**: [Project Presentation](https://github.com/aliaksparkh/Sales-Duration/blob/main/Presentation_PA.pptx)

## Table of Contents
1. [Introduction](#introduction)
2. [Data Sources and Preparation](#data-sources-and-preparation)
3. [Key Findings](#key-findings)
4. [Visualizations](#visualizations)
5. [Recommendations](#recommendations)

## Introduction
This analysis aims to examine the time taken for each sales action and identify trends or areas for improvement. The project investigates factors impacting sales duration and highlights patterns that could streamline sales processes.

## Data Sources and Preparation
- **Source**: Data collected from the `turing_data_analytics.raw_events` database.
- **Preparation**: Data was cleaned and structured using SQL queries (see [Duration_PA.sql](https://github.com/aliaksparkh/Sales-Duration/blob/main/Duration_PA.sql)) to focus on relevant metrics.

## Key Findings
  - The median time to complete a purchase is 20 minutes.
  - Quick purchases are less profitable on average but generate most of the revenue.
  - Users tend to spend longer before purchasing during pre-holidays and marketing campaigns.
  - Most orders are made in the morning and late at night.
  - On Sundays, orders are completed 6 minutes faster than on Wednesdays.
  - The most lucrative purchases are made within 30 minutes to 2 hours.
  - Xiaomi users and tablet users are the quickest buyers.

## Visualizations
The analysis is supported by a series of visualizations created in Tableau. Key charts and graphs illustrate:
- Trends in sales duration over time.
- Comparisons of durations across different user segments.
- Highlighted areas with potential for improvement.

Explore the full **[Tableau Dashboard](https://public.tableau.com/app/profile/aliaksandr.parkhomenka/viz/Product_Analysis_OSD/Dashboard1)**.

## Recommendations
- **Enhancing Average Order Value for Quick Purchases**: Encourage higher-value purchases by offering personalized product bundles, implementing strategic upselling at checkout, and highlighting limited-time discounts.
- **Optimizing Purchase Flow for Mobile Users**: Simplify and streamline the checkout process, reduce steps, and leverage single-click purchasing options to minimize friction for mobile transactions.
- **Refining the User Journey for Apple, Samsung, and Huawei Users**: Implement device-specific UX enhancements, optimize page loading speeds, and ensure seamless compatibility to elevate the shopping experience.
- **Engaging Users Through Timely Notifications**: Send follow-up notifications or emails within two hours of product viewing to re-engage potential customers, providing relevant recommendations or reminders for items left in their cart.
- **Improving Sales Duration in Key Markets (Canada and India)**: Tailor the timing and length of sales events to local purchasing behaviors, considering cultural and seasonal preferences to maximize engagement and revenue.
- **Improving the User Journey in Slower-Performing Countries via A/B Testing**: Conduct A/B tests across different stages of the purchase funnel to identify and address points of friction, refining the experience based on user behavior insights to enhance conversion rates.
