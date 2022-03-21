-- Creating tables for Project DB
CREATE TABLE info (
	TICKER VARCHAR,
	sector VARCHAR,
	full_time_employees VARCHAR,
	long_business_summary VARCHAR,
	city VARCHAR,
	country VARCHAR,
	industry VARCHAR,
	ebitda_margins VARCHAR,
	profit_margins VARCHAR,
	gross_margins VARCHAR,
	operating_cash_flow VARCHAR,
    revenue_growth VARCHAR,
    operating_margins VARCHAR,
	ebitda VARCHAR,
	gross_profits VARCHAR,
	current_price VARCHAR,
	earnings_growth VARCHAR,
	current_ratio VARCHAR,
	return_on_assets VARCHAR,
	debt_to_equity VARCHAR,
	return_on_equity VARCHAR,
	total_cash VARCHAR,
	total_debt VARCHAR,
	total_revenue VARCHAR,
	quitck_ratio VARCHAR,
	long_name VARCHAR,
	book_value VARCHAR,
	average_volume VARCHAR,
	volume VARCHAR,
	fifty_two_week_high VARCHAR,
	regular_market_price VARCHAR,
	market_cap VARCHAR,
	PRIMARY KEY (ticker)
	
);


CREATE TABLE stocks (
	open VARCHAR,
	high VARCHAR,
	low VARCHAR,
	close VARCHAR,
	adj_close VARCHAR,
	volume VARCHAR,
	ticker VARCHAR,
	date DATE,

	PRIMARY KEY (date, ticker)

);

CREATE TABLE society (
	ticker VARCHAR,
	society_n VARCHAR,
	society_p VARCHAR,
	jobs_n VARCHAR,
	jobs_p VARCHAR,
	taxes_n VARCHAR,
	taxes_p VARCHAR,
	societal_infrastructure_n VARCHAR,
	societal_infrasctucute_p VARCHAR,
	societal_stability_n VARCHAR,
	societal_stability_p VARCHAR,
	equality_human_rights_n VARCHAR,
	eqality_human_rights_p VARCHAR,
	
	PRIMARY KEY (ticker)

);

CREATE TABLE knowledge (
	ticker VARCHAR,
	knowledge_n VARCHAR,
	knowledge_p VARCHAR,
	knowledge_infrastructure_n VARCHAR,
	knowledge_infrastructure_p VARCHAR,
	creating_knowledge_n VARCHAR,
	creating_knowledge_p VARCHAR,
	distributing_knowledge_n VARCHAR,
	distributing_knowledge_p VARCHAR,
	scarce_human_capital_n VARCHAR,
	scarce_human_capital_p VARCHAR,
	
	PRIMARY KEY (ticker)

);

CREATE TABLE health (
	ticker VARCHAR,
	health_n VARCHAR,
	health_p VARCHAR,
	physical_diseases_n VARCHAR,
	physical_diseases_p VARCHAR,
	mental_diseases_n VARCHAR,
	mental_diseases_p VARCHAR,
	nutrition_n VARCHAR,
	nutrition_p VARCHAR,
	relationships_n VARCHAR,
	relationships_p VARCHAR,
	meaning_joy_n VARCHAR,
	meaning_joy_p VARCHAR,
	
	PRIMARY KEY (ticker)

);

CREATE TABLE environment (
	ticker VARCHAR,
	environment_n VARCHAR,
	environment_p VARCHAR,
	GHG_emission_n VARCHAR,
	GHG_emission_p VARCHAR,
	Non_GHG_emission_n VARCHAR
	Non_GHG_emission_p VARCHAR,
	scarce_natural_resources_n VARCHAR,
	scarce_natural_resources_p VARCHAR,
	bidodiversity_n VARCHAR,
	biodiversity_p VARCHAR,
	waste_n VARCHAR,
	waste_p VARCHAR,
	
	PRIMARY KEY (ticker)

);

CREATE TABLE net_impact (
	ticker VARCHAR,
	millennials VARCHAR,
	most_wanted_workforce VARCHAR,
	society_first VARCHAR,
	knowledge_first VARCHAR,
	health_first VARCHAR,
	net_impact_ratio VARCHAR,
	
	PRIMARY KEY (ticker)

);
