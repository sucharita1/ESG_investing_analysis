# ESG (Environmental, Social, and Governance) Investing and Analysis

## Overview
### Background
Comapnies have always found it a challenge to balance generating a healthy profit for their stakeholder's as well as ensuring that they are performing to the highest standards in ESG (Environmental, Social, and Governance). As world stands at the brink of global warming upto 3.5 degress at end of century, population rising to 9.7 billion by 2050 the only way to ensure a sustainable and inclusive economic and human developement is by hightening our contribution and focus on ESG.

### Purpose
We are building a machine learning model to 
- Help you in ESG investing
- Figure out if ESG scores have any relation to a stock's market performance

## Questions we hope to answer
- Do ESG scores affect company's bottomline?
- What are the RED flags that affect ESG ratings?
- Is there a correlation between stock market performance and ESG ratings?
- Which industries have highest ESG scores?
- How can we help you in ESG investing?

## Technologies used
* AWS RDS Postgres 12 for database on Cloud.
* Jupyter Notebook and python libraries like pandas, numpy, seaborn, matplotlib etc. for data cleaning and analysis
* yesg and yfinance APIs for data extraction from yahoo finance
* fbprophet, Sklearn for machine learning

## Data Extraction and Preliminary Data Processing for ML
Using [api_data_extraction.ipynb](https://github.com/mododds/Group_2_Project/blob/775cca5fe9d84b68a5c36e06f38b082d5ef1a464/api_data_extraction.ipynb) to
extract the data from yfinance and yesg and then clean the data.
![data_extraction_cleaning.png](https://github.com/mododds/Group_2_Project/blob/1461bd88e15ecd94d159db9e51afa0bfe24df965/Images/data_extraction_cleaning.png)


## Database connection
[Connect_Database.ipynb](https://github.com/mododds/Group_2_Project/blob/775cca5fe9d84b68a5c36e06f38b082d5ef1a464/Connect_Database.ipynb) takes the database password from you and connects to the database. If you want to connect to existing data. When you want to update the tables from time to time as company financials change you need to make the variable refresh_table = 'Y' it calls **api_data_extraction.ipynb**. It collects the data from yahoo finance using yfinance and yesg apis converts them into dataframes and cleans the data for null , duplicate values and wrong datatypes and returns the dataframes to **Connect_Database.ipynb**.
- **Connect_Database.ipynb** converts the dataframes into sql tables and loads them to AWS RDS.
- If you dont want to update the database, **Connect_Database.ipynb** loads the existing tables and performs a sql join using sqlalchemy. Next it converts all the existing tables to dataframes for further analysis on other notebooks.
![connect_database.png](https://github.com/mododds/Group_2_Project/blob/1461bd88e15ecd94d159db9e51afa0bfe24df965/Images/connect_database.png)

- ERD and schema are available [here](https://github.com/mododds/Group_2_Project/tree/esg_eda_ml/ERD%20and%20Schema)


## Machine Learning
### Model 1:
Regression model for correlation between ESG and investor's confidence
- We use three methods to calculate Stock price increase from investor confidence.Then, we choose one of them to calculate test and train. 
- - 3 Methonds choose see **Stock_Price_valuation_ 3_Methods.ipynb**
- - train and test see [PS_Method_Machine_Learning _Model.ipynb](https://github.com/mododds/Group_2_Project/blob/1461bd88e15ecd94d159db9e51afa0bfe24df965/PS_Method_Machine_Learning%20_Model.ipynb)

#### Description of preliminary feature engineering and preliminary feature selection, including their decision-making process
- We want to measure how ESG affects stock prices. Firstly, we should calculate passive value by stock valuation. Then, MV value minus passive value that is equal to value of Stock Price change from investor confidence. We get all finanical information from our dataset, then we calculate value of Stock Price change from investor confidence More detail and analysis. Finally, we create a Liner Regression.   see **Stock_Price_valuation_ 3_Methods.ipynb**
- Why we choose EGS? ESG is not only reason to influence stock price,but it cover most of internal factors and it can also influence external factors. In our model, we assume the ESG is only reason to inflence the stock price.

#### current accuracy score
A perfect R-squared is 1, which means that all predictions matched the expected values exactly.
This model current accuracy score is very low.
**R-squared is 0.017 so it is discarded as the dataset has only 55 datapoints too less. Our analysis requires around 1000 datapoints but ESG paramaters for most companies as well as historical ESG data is not available freely. So this model is discarded**

### Model 2:
Prediction of stocks using Ridge linear regression vs fbprophet
#### Ridge Linear Regression for stock prediction
This model was the linear regrssion model that was used to predict stocks the code can be found in [Predict_Stocks.ipynb](https://github.com/mododds/Group_2_Project/blob/1461bd88e15ecd94d159db9e51afa0bfe24df965/Predict_Stocks.ipynb)

![Ridge model](https://github.com/mododds/Group_2_Project/blob/ea82183ccca0f696953ba72a1c2f3d903e0427d3/Images/Stocks%20Prediction%20using%20regression.png)
- This model was able to predict stocks using ridge linear regression but it could predict a few days ahead because it could not handle non linearity and seasonality often seen when we want to predict stocks into the future. A sample code can be seen as follows:
![Stock_prediction](https://github.com/mododds/Group_2_Project/blob/ea82183ccca0f696953ba72a1c2f3d903e0427d3/Images/Stock_prediction.png)
### Model 3:
#### fbprophet for stock prediction
This was the model finally chosen as it could predict the stock close price for the next 365 days and allow investors to do ESG investing.
- Stock prediction beyond a few days needs to handle seasonality, shift in trends, outliers etc. which is not possible using linear regression.
- fbprophet is does not require much prior knowledge of forecasting time series data as it can automatically find seasonal trends with a set of data and offers easy to understand parameters.
![fbprophet_flow_diagram](https://github.com/mododds/Group_2_Project/blob/ea82183ccca0f696953ba72a1c2f3d903e0427d3/Images/fbprophet%20flow%20diagram.png)

#### Preliminary Data Preprocessing 
- Data clean: check there no null or inf
- Data intergration:
   - ds - Date 
   - y: Closing Price of the stock
 - Data Reduction:
    - Five years of historical data on 55 stocks was obtained including Open, Close, High, Low, Adj. Close
    - Only Close Value was chosen to the predicted
 
#### Description of preliminary feature engineering and preliminary feature selection, including their decision-making process
Model parameters were selected based on the performance of the model. fbprophet allows us to define holidays, sesonality , type of growth etc. for hyperparamter tuning.
    1. First set of parameters was linear with daily seasonality but it lead to higher values of **Mean Absolute Percentage Error(MAPE)**
    2. Second set of parameters included:
    ![fbprophet_model_parameters.png](https://github.com/mododds/Group_2_Project/blob/54e5fbee9078028acee33a189c978d0d0ab2fe8a/Images/fbprophet_model_parameters.png)
The second set of parameters gave better values of MAPE, so it the model parameters that was chosen.
#### Benefits
- It does not require much prior knowledge of forecasting time series data as it can automatically find seasonal trends with a set of data and offers easy to understand parameters.
- Based on an additive model where non-linear trends are fit with yearly, weekly, and daily seasonality, plus holiday effects.
- Prophet is robust to missing data and shifts in the trend, and typically handles outliers well.
- fbprophet has its own methods for plots, scoring etc. So, you once you have fbprophet you may not need many other additional libraries.

#### Limitations
- Prophet is generally recommended only for time series where the only informative signals are trends, and the residuals are just noise.
- There are other models like ARIMA can consistenly outperform Prophet when trends are not too important.
#### Improvement
- Bring the MAPE down by rigorous hyperparamter tuning the model.
- Look into ARIMA, LSTM and use the model that gives us the best prediction.
#### Train and Test
fbprophet has its own diagnostics tolls like cross_validation, performance_metrics to train and test the data.
The training data was first 1095 days and the test data was divided into 3 forecasts with cutoffs between 2020-03-20 00:00:00 and 2021-03-15 00:00:00. The average mape for all the 55 stocks was : 0.15319351039177415
![MAPE_test_train.png](https://github.com/mododds/Group_2_Project/blob/54e5fbee9078028acee33a189c978d0d0ab2fe8a/Images/MAPE_test_train.png)

The code for the fbprophet model can be found in [fbprophet_Predict_Stocks.ipynb](https://github.com/mododds/Group_2_Project/blob/54e5fbee9078028acee33a189c978d0d0ab2fe8a/fbprophet_Predict_Stocks.ipynb)

- The final forecasts for all the stocks can be found [here](https://github.com/mododds/Group_2_Project/tree/main/Images/forecast)
- The final Mean Absolute Percentage Error(MAPE) for all the stocks can be found [here](https://github.com/mododds/Group_2_Project/tree/main/Images/mape)

A sample forecast for Apple stocks is :

![AAPL.png](https://github.com/mododds/Group_2_Project/blob/54e5fbee9078028acee33a189c978d0d0ab2fe8a/Images/forecast/AAPL.png)

A sample Mean Absolute Percentage Error(MAPE) for  Apple stock is:

![AAPL.png](https://github.com/mododds/Group_2_Project/blob/54e5fbee9078028acee33a189c978d0d0ab2fe8a/Images/mape/AAPL.png)

## Analysis 
- [ESG_Analysis.ipynb](https://github.com/mododds/Group_2_Project/blob/54e5fbee9078028acee33a189c978d0d0ab2fe8a/ESG_Analysis.ipynb) uses **Connect_Database.ipynb** to access the database and uses the esg_info_df to perform analysis on ESG parameters, red flags relations between ESG and ROE to ensure that data is suitable for machine learning.
- [stock_analysis.ipynb](https://github.com/mododds/Group_2_Project/blob/54e5fbee9078028acee33a189c978d0d0ab2fe8a/stock_analysis.ipynb) uses **Connect_Database.ipynb** to access the database and uses the stocks_df to perform analysis on stock prices, volumes and daily returns to ensure that data is suitable for machine learning.

## Dashboard 
Tableau is chosen to visualize the dashboard it connects to the AWS RDS postgres and performs the visualizations.
![Tableau_connecting_tables.png](https://github.com/mododds/Group_2_Project/blob/54e5fbee9078028acee33a189c978d0d0ab2fe8a/Images/Tableau_connecting_tables.png)

The tables contains the data from yahoo finance as well as the tables generated from Regression based mahcine learning for esg and stock market correlation as well as stock predictions.

The final tableau storyboard presentation is available in [here](https://public.tableau.com/app/profile/sucharita.bhattacharjee/viz/ESG_Analysis/ESGAnalysisforpredictedstocks?publish=yes)

## Presentation 
The presentation provides a glimpse about our project **ESG and You** is available [here](https://docs.google.com/presentation/d/1CQRtlGkKOA2NHdxgLHuaUuumPaWmU9E0O-gZS-EAxo8/edit?usp=sharing)

## Recommendation for future analysis:
- Improve the MAPE for fbprophet Model.
- Explore ARIMA, SARIMA for stock prediction
- Update the stock and esg data periodically so that the analysis stays relevent.
- Also AWS RDS will be replaced by CSV files as free tier benefits will ceash shortly but the code to host the project on cloud works and can be implemented easily.

## Environment dependencies and gitignore files
The environment dependencies can be found in [requirements.txt](https://github.com/mododds/Group_2_Project/blob/c6ef83c033a2239e7f400a69e772671eb6fa68dc/requirements.txt)

The ignored files can be found in [.gitignore](https://github.com/mododds/Group_2_Project/blob/c6ef83c033a2239e7f400a69e772671eb6fa68dc/.gitignore)


## Our Team
- Sucharita Bhattacharjee- Lead Analyst - fbprophet, tableau dashboard, Database design and sqlalchemy
- Monica Dodds - visualization
- Yicong Luo - ml for correlation
- Sachin Nabar - Amazon Cloud RDS

Credits:
- https://www.forbes.com/just-companies/#5d410d762bf0
- https://en.wikipedia.org/wiki/List_of_S%26P_500_companies
- https://www.marketbeat.com/
- https://ca.finance.yahoo.com/
- https://www.investopedia.com/terms/d/ddm.asp#:~:text=The%20dividend%20discount%20model%20(DDM,back%20to%20their%20present%20value.
- https://www.investopedia.com/ask/answers/100314/what-are-key-factors-cause-market-go-and-down.asp
- https://deepnote.com/@reslan-al-tinawi/Visualizing-data-with-seaborn-plotly-2hf4mb-sTnC9LyUXbTVKDw
- https://community.plotly.com/t/how-to-visualize-3-columns-with-boolean-values/36181/2
- https://help.tableau.com/current/pro/desktop/en-us/dashboards.htm
- https://facebook.github.io/prophet/docs/quick_start.html#python-api
