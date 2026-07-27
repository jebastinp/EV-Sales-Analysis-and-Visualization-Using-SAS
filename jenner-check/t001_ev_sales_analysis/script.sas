/* EV sales analysis — bundled for the Jenner API.
   The upstream analyze.sas imports ev_sales.csv via PROC IMPORT from an
   absolute path on the author's SAS OnDemand home directory. For a
   self-contained run we build the same ev_sales dataset (identical column
   names: region category parameter mode powertrain year unit value percentage)
   from a faithful 42-row sample of the repo's own data, then run the author's
   analysis PROCs exactly as written. */

DATA ev_sales;
    LENGTH region $20 category $20 parameter $20 mode $10 powertrain $6 unit $12 percentage $24;
    INFILE DATALINES DLM='|' DSD TRUNCOVER;
    INPUT region $ category $ parameter $ mode $ powertrain $ year unit $ value;
    /* percentage column mirrors the source file: value expressed as a percent
       string with a European decimal comma, e.g. value 350 -> "35000,00%" */
    percentage = CATS(PUT(value * 100, BEST12.), ",00%");
DATALINES;
China|Historical|EV sales|Cars|BEV|2010|Vehicles|1100
Germany|Historical|EV sales|Cars|BEV|2010|Vehicles|140
Norway|Historical|EV sales|Cars|BEV|2010|Vehicles|360
China|Historical|EV sales|Cars|BEV|2011|Vehicles|4800
Germany|Historical|EV sales|Cars|BEV|2011|Vehicles|1400
Norway|Historical|EV sales|Cars|BEV|2011|Vehicles|2000
China|Historical|EV sales|Cars|BEV|2012|Vehicles|9600
Germany|Historical|EV sales|Cars|BEV|2012|Vehicles|2200
Norway|Historical|EV sales|Cars|BEV|2012|Vehicles|3900
China|Historical|EV sales|Cars|BEV|2013|Vehicles|15000
Germany|Historical|EV sales|Cars|BEV|2013|Vehicles|5200
Norway|Historical|EV sales|Cars|BEV|2013|Vehicles|7900
China|Historical|EV sales|Cars|BEV|2014|Vehicles|49000
Germany|Historical|EV sales|Cars|BEV|2014|Vehicles|9100
Norway|Historical|EV sales|Cars|BEV|2014|Vehicles|20000
China|Historical|EV sales|Cars|BEV|2015|Vehicles|150000
Germany|Historical|EV sales|Cars|BEV|2015|Vehicles|12000
Norway|Historical|EV sales|Cars|BEV|2015|Vehicles|26000
China|Historical|EV sales|Cars|BEV|2016|Vehicles|260000
Germany|Historical|EV sales|Cars|BEV|2016|Vehicles|11000
Norway|Historical|EV sales|Cars|BEV|2016|Vehicles|24000
China|Historical|EV sales|Cars|BEV|2017|Vehicles|470000
Germany|Historical|EV sales|Cars|BEV|2017|Vehicles|25000
Norway|Historical|EV sales|Cars|BEV|2017|Vehicles|33000
China|Historical|EV sales|Cars|BEV|2018|Vehicles|820000
Germany|Historical|EV sales|Cars|BEV|2018|Vehicles|36000
Norway|Historical|EV sales|Cars|BEV|2018|Vehicles|46000
China|Historical|EV sales|Cars|BEV|2019|Vehicles|830000
Germany|Historical|EV sales|Cars|BEV|2019|Vehicles|63000
Norway|Historical|EV sales|Cars|BEV|2019|Vehicles|60000
China|Historical|EV sales|Cars|BEV|2020|Vehicles|920000
Germany|Historical|EV sales|Cars|BEV|2020|Vehicles|190000
Norway|Historical|EV sales|Cars|BEV|2020|Vehicles|77000
China|Historical|EV sales|Cars|BEV|2021|Vehicles|2700000
Germany|Historical|EV sales|Cars|BEV|2021|Vehicles|360000
Norway|Historical|EV sales|Cars|BEV|2021|Vehicles|110000
China|Historical|EV sales|Cars|BEV|2022|Vehicles|4400000
Germany|Historical|EV sales|Cars|BEV|2022|Vehicles|470000
Norway|Historical|EV sales|Cars|BEV|2022|Vehicles|140000
China|Historical|EV sales|Cars|BEV|2023|Vehicles|5400000
Germany|Historical|EV sales|Cars|BEV|2023|Vehicles|520000
Norway|Historical|EV sales|Cars|BEV|2023|Vehicles|100000
;
RUN;

PROC PRINT DATA=ev_sales (OBS=10);
RUN;

PROC CONTENTS DATA=ev_sales; 
RUN;

PROC MEANS DATA=ev_sales; 
RUN;

PROC MEANS DATA=ev_sales NMISS; 
RUN;


PROC SGPLOT DATA=ev_sales;
    SERIES X=year Y=mode;
    TITLE "EV Sales Trends by Region";
RUN;
