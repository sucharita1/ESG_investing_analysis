-- Create table esg_full with esg data on companies whose stocks we want to predict
CREATE TABLE esg_full(
Ticker VARCHAR NOT NULL,
totalScore FLOAT(6),
eScore FLOAT(6),
sScore  FLOAT(6),
gScore FLOAT(6),
lastRated DATE,
esgPerformance VARCHAR,
peerGroup VARCHAR,
highestControversy FLOAT(6),
peerCount INTEGER, 
totalPercentile FLOAT(6),
relatedControversy VARCHAR(500),
minPeerESG FLOAT(6),
avgPeerESG FLOAT(6),
maxPeerESG FLOAT(6),
minPeerEnvironment FLOAT(6),
avgPeerEnvironment FLOAT(6),
maxPeerEnvironment FLOAT(6),
minPeerSocial FLOAT(6),
avgPeerSocial FLOAT(6),
maxPeerSocial FLOAT(6),
minPeerGovernance FLOAT(6),
avgPeerGovernance FLOAT(6),
maxPeerGovernance FLOAT(6),
minHighestControversy  FLOAT(6),
avgHighestControversy  FLOAT(6),
maxHighestControversy  FLOAT(6),
controversialBusinessAreas VARCHAR(500),
PRIMARY KEY (Ticker)
);

-- Create table stock_details with information on the companies whose stocks we want to predict
CREATE TABLE stock_details (
Ticker VARCHAR PRIMARY KEY NOT NULL,
longName VARCHAR,
sector VARCHAR,
industry VARCHAR,
city VARCHAR,
state VARCHAR,
country VARCHAR,
fullTimeEmployees INTEGER,
revenueGrowth FLOAT(6),
forwardEps FLOAT(6),
beta FLOAT(6),
priceToSalesTrailing12Months FLOAT(6),
forwardPE FLOAT(6),
dividendRate FLOAT(6),
trailingPE FLOAT(6),
bookValue FLOAT(6),
returnOnAssets FLOAT(6),
returnOnEquity FLOAT(6),
averageVolume INTEGER,
volume INTEGER,
currentPrice FLOAT(6),
fiftyTwoWeekLow FLOAT(6),
fiftyTwoWeekHigh FLOAT(6),
regularMarketPrice FLOAT(6),
marketCap BIGINT,
FOREIGN KEY (Ticker) REFERENCES esg_full(Ticker)
);

-- Create table stocks with stock market data historical data depending upon user defined time frame
CREATE TABLE stocks(
Ticker VARCHAR NOT NULL,
Date DATE NOT NULL,                               
Open FLOAT(6),
High FLOAT(6),
Low FLOAT(6),
Close FLOAT(6),
Adj_Close FLOAT(6),
Volume  FLOAT(6),
PRIMARY KEY (Ticker, Date),
FOREIGN KEY (Ticker) REFERENCES esg_full(Ticker)
);


-- Create table controversy_type with data on controversy that companies faced
CREATE TABLE controversy_type(
Ticker VARCHAR NOT NULL,
businessEthicsIncidents  INTEGER,
customerIncidents  INTEGER,
employeeIncidents INTEGER,
environmentalSupplyChainIncidents INTEGER,
governanceIncidents  INTEGER,
None  INTEGER,
operationsIncidents INTEGER,
productServiceIncidents INTEGER,
publicPolicyIncidents INTEGER,
socialSupplyChainIncidents INTEGER,
societyCommunityIncidents  INTEGER,
PRIMARY KEY (Ticker),
FOREIGN KEY (Ticker) REFERENCES esg_full(Ticker)
);

-- Create table business_controversy with data on business controversy that companies faced
CREATE TABLE business_controversy(
Ticker VARCHAR NOT NULL,
animalTesting INTEGER,
catholicValues INTEGER,
controversialWeapons INTEGER,
militaryContracting INTEGER,
None INTEGER,
Nuclear INTEGER,
smallArms INTEGER,
thermalCoal INTEGER,
PRIMARY KEY (Ticker),
FOREIGN KEY (Ticker) REFERENCES esg_full(Ticker)
);



