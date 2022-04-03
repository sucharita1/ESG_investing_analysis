# Group 2 Team Project

## ESG (Environmental, Social, and Governance) 

## Our Team
- Sucharita Bhattacharjee
- Monica Dodds
- Yicong Luo
- Sachin Nabar


## Our Question
Do sustainability models help predict a company’s overall Performance?
- Stock values
- Brand image
- Employee retention
- Customer retention

## Branches
### esg_data_extraction
- Primary contributor: Sucharita Bhattacharjee
- Primary focus: Data extraction pre-processing
- Number of commits (as of March 20, 2022): 14

### project_database
- Primary contributor: Sachin
- Primary focus: Database set up and data manipulation
- Number of commits (as of March 20, 2022): 5

### stock_price
- Primary contributor: Yicong
- Primary focus: Machine Learning module
- Number of commits (as of March 20, 2022): 2

### project_visualizations
- Primary Contibutor: Monica
- Primary Focus: Visualization & presentation of data
- Number of commits (as of March 20, 2022): 13

## Week One Roles: 

- Monica: GitHub set up, [Goggle Sheets tracker](https://docs.google.com/spreadsheets/d/1Tx0D1V8oL79opbk0O3R_YSJzzYVRPobm1d6glIpdfCw/edit?usp=sharing) for deliverables
- Sucharita: Data Gathering (Yahoo Finance & MarketBeat)
- Sachin: DBA (Create ERD and Mock up DB on PGAdmin)
- Yicong: Mock up Machine Learning
- Monica: Mock up visualizings (Tableau) 

### Data Gathering (Yahoo Finance & MarketBeat)
- Used notebook **Scrape_ESG.ipynb** to collect data  about 112 companies in  S&P 500 wiki and Forbes just 100 and used marketbeat.com to scrape the ESG related data and saved the data in Stocks_with_ESG.csv

- Used notebook **Extract_stocks_time_data.ipynb**  using yfinance python wrapper to get the following data from yahoo fianance
    - to collect stock performance of 112 companies since last five years and saved as Stocks_with_time.csv
    - to Collect company info like name , state, city , sector, marketcap, 52 week high etc. and saved as Stocks_info.csv

- Used notebook **final_tables_after_EDA.ipynb** to perform preliminary EDA and ensure that 
    - all three tables have the data about the same 112 companies and companies with no data is deleted. 
    - the no of fields is reduced to exclude unwanted fields.
    - the fields in the dataframe have the correct object type.
    - the Stocks_with_ESG.csv is converted into ESG_df and broken into society_ESG.csv, health_ESG.csv, knowledge_ESG.csv, environment_ESG.csv, net_impact_ESG.csv for further analysis and loading to postgres.

All the csv files can be found in **Resources/Postgres_Input**.

- Based on the csv files an ERD diagram has been created which can be viewed here **ERD_TABLES** 

## Mockup Database
- An ASW RDS database is created with all the tables as shown in the ERD. The tables can be found in **AWS RDS DATBASE.png**
- Used notebook **Connect_Database.ipynb**
    - to connect to aws server
    - select and print data from table

## Mockup Machine learning
- Before predicting the stocks using complex neural network models a linear regression model is used as a mockup,  which can be found in **Stock_Price_valuation.ipynb**

## Week2 and Week3 roles:
- The square will focus on the machine learning model. [Yicong]
- The triangle role is involved in upscaling the project's database. [Sucharita]
- The circle role will continue to refine the analysis. [Sachin]
- The X role will focus on the team's dashboard. [Monica]
  
## Data Extraction and connecting to database
- **Connect_Database.ipynb** takes the database password from you and connects to the database. If you want to connect to existing data. When you want to update the tables from time to time as company financials change you need to make the variable refresh_table = 'Y' it calls **api_data_extraction.ipynb**. It collects the data from yahoo finance using yfinance and yesg apis converts them into dataframes and cleans the data for null , duplicate values and wrong datatypes and returns the dataframes to **Connect_Database.ipynb**.
- **Connect_Database.ipynb** converts the dataframes into sql tables and loads them to AWS RDS.
- If you dont want to update the database, **Connect_Database.ipynb** loads the existing tables and performs a sql join using sqlalchemy. Next it converts all the existing tables to dataframes for further analysis on other notebooks.
- ERD and schema are available in **ERD and Schema** folder.


## Machine learning model

- **Predict_Stocks.ipynb** uses **Connect_Database.ipynb** to connect to existing AWS RDS tables and load the dataframes. And then uses Ridge Model in regression to perform stock prediction. 
- We use three methods to calculate Stock price increse from investor confidence.Then, we choose one of them to calculate test and train. 
- - 3 Methonds choose see **Stock_Price_valuation_ 3_Methods.ipynb**
- - train and test see **PS_Method_Machine_Learning _Model.ipynb**
### Benefit
- All the companies can use this method because sales are always positive. Like the dividend method, if the current year dividend is Zero, we cannot use it.
- No human intervention is needed (automation)
- It shows a negative relationship between the value of Stock Price increase from investor confidence and ESG Score.
### Limitation
- This method is comparable to companies(industry). We need to make sure all the companies in the same industry must have a similar size. ex: Sobey and Walmart are supermarkets, but one is national, and another is global
- The K-value is 0.30, which is higher than 0.05. We cannot use this model to measure how many prices of ESG influences the stock price, but it shows us ESG has a negative relationship with the stock price.
- Our model only uses 2022 information, which can show you a short-term relationship. If we can add past year information, it will establish an exact relationship.
### Improvement
- More Data, Increasing Scope and Time. In this model, we use 89 companies, that are not enough, and we only get the 2022 ESG score because the old information is not for the public. 
### Train and Test
We have 89 stock info, we choose 21 as the Test set and other is Train set


## Analysis 
- **ESG_Analysis.ipynb** uses **Connect_Database.ipynb** to to connect to existing AWS RDS tables and load the dataframes. And then does analysis on the data to confirm that the data types are correct, there is no duplicate, null data, whether the esg scores have a normal distibution etc.


## Dashboard
- Tableau dashboard is available in **Dashboard** folder as **ESG_Analysis.twb**.



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
