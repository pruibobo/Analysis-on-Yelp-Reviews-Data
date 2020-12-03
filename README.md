# STAT 628 Module3: Analysis on Yelp Reviews Data

## Authors 

Huitong Kou, hkou2@wisc.edu

Zihang Wang, zwang2547@wisc.edu

Peibin Rui, prui@wisc.edu

## Introduction
There are tens of thousands of reviews for different types of businesses on Yelp. Our analysis mainly focuses on restaurants which serve steak in several US cities. We are trying to extract some insights from this reviews data and propose data-driven recommendations for steak restaurant owners to improve their ratings on Yelp based on our results.

## Procedure
Limited by the computing power, we chose to focus on restaurants whose category contained the word "steak".

- Cleaned txt data from Yelp reviews following Natural Language Processing (NLP) steps using NLTK in Python.
- Performed exploratory data analysis by making plots of rating distributions and got some useful insights.
- Performed t-tests on business attributes and fitted a multiple linear regression model using word frequencies.
- Proposed data-driven recommendations and actionable plans based on our results.
- Built a Shiny application to further demonstrate our results.

## Contents of Repository

`code` folder contains all the codes for our analysis.
- `yelp_clean.ipynb` is for reading and cleaning data.
- `code_EDA.R` is for exploratory data analysis.
- `code_plots_shiny.R` is for generating plots for Shiny app.
- `code_shiny_app.R` is for building Shiny app.
- `code_summary.R` is for running analysis in summary.
- `code_t_test.R` is for performing t-tests on business attributes.

`data` folder contains all the data used for analysis.
- `attributes_data_for_ttest.csv` is the business attributes data for t-tests.
- `business_city.json` is the original business data.
- `steak_cleaned.csv` is the cleaned data for steak restaurants.
- `word_freq.csv` is the data for word frequencies.

`image` folder contains all the figures used in our analysis.

`shiny` folder is the Shiny app codebase.

`summary.pdf` is the executive summary.


## Shiny App

Link: https://pruibobo.shinyapps.io/shiny/
- Show star distributions for words about steak types in reviews and corresponding comments.
- Show star distributions for words about meal times in reviews and corresponding comments.
- Show star distributions for words about foods other than steaks in reviews and corresponding comments.
- Show star distributions for words about non-food factors in reviews and corresponding comments.
- Provided general advice for opening a new steak restaurant and improving an existed steak restaurant.



