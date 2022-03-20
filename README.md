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

## Week One Roles: 

- Monica: GitHub set up, [Goggle Sheets tracker](https://docs.google.com/spreadsheets/d/1Tx0D1V8oL79opbk0O3R_YSJzzYVRPobm1d6glIpdfCw/edit?usp=sharing), [mock presentation](https://docs.google.com/presentation/d/1v7ZUbO-Ruz_PWBoh0hCuRYt4P9jFr0jfmyfjzph_FJQ/edit#slide=id.g1f88252dc4_0_662) for deliverables
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

Credits:
- https://www.forbes.com/just-companies/#5d410d762bf0
- https://en.wikipedia.org/wiki/List_of_S%26P_500_companies
- https://www.marketbeat.com/
- https://ca.finance.yahoo.com/
- https://www.investopedia.com/terms/d/ddm.asp#:~:text=The%20dividend%20discount%20model%20(DDM,back%20to%20their%20present%20value.
- https://www.investopedia.com/ask/answers/100314/what-are-key-factors-cause-market-go-and-down.asp
