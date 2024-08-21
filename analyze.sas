PROC IMPORT DATAFILE='/home/u63929691/EV_Sales/ev_sales.csv'
    OUT=ev_sales
    DBMS=CSV
    REPLACE;
    GETNAMES=YES;
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


