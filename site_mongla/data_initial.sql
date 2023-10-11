set serveroutput on;
set verify off;




Insert into shipmentInfo2 (voyageNum,loadingPort,cost,shippingDate) values 
('12-DLL-TW','SYDNEY',1200,'01-FEB-2023');
Insert into shipmentInfo2 (voyageNum,loadingPort,cost,shippingDate) values
('14-DMS-TW','ULAN BATOR',1000,'03-FEB-2023');
Insert into shipmentInfo2 (voyageNum,loadingPort,cost,shippingDate) values
('11-DSS-TW','NAMIBIA',1300,'02-FEB-2023');
Insert into shipmentInfo2 (voyageNum,loadingPort,cost,shippingDate) values
('10-DTQ-TW','PORTO',1800,'02-FEB-2023');



Insert into productInfo2 (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost,arriveDate) values 
(1,'SAMSUNG-11002-43" SMART TV',23,'SOUTH KOREA',3,2002,2,350,'15-JAN-2023');
Insert into productInfo2 (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost,arriveDate) values 
(3,'CANNED TUNA',200,'PORTUGAL',2,2004,4,550,'10-FEB-2023');
Insert into productInfo2 (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost,arriveDate) values 
(4,'HCL',150,'PORTUGAL',4,2004,5,450,'20-FEB-2023');

COMMIT;