set serveroutput on;
set verify off;
clear screen;

Insert into importerInfo (name,compName,email,phone,address,businessType,tradeLicense) values 
('karim ahmed','B-B logistics','karimzanat@gmail.com','01828948924','dhaka','Industry','ABC-101');
Insert into importerInfo (name,compName,email,phone,address,businessType,tradeLicense) values
('fahim khan','Fahim foods','fahim@gmail.com','01828948922','khulna','Consumer Goods','ABC-141');
Insert into importerInfo (name,compName,email,phone,address,businessType,tradeLicense) values
('rasel ali','rasel technology','rasel@gmail.com','01828948024','pabna','Technology','ABC-131');
Insert into importerInfo (name,compName,email,phone,address,businessType,tradeLicense) values
('montu rahman','A-Q apparel','rahman@gmail.com','01828948984','dhaka','Industry','ABC-121');


Insert into tariffInfo (productTypeID,productType,rateOfDuty,validity,additionalCost,additionalTaxes) values 
(1,'Electronics',20,20,30,15);
Insert into tariffInfo (productTypeID,productType,rateOfDuty,validity,additionalCost,additionalTaxes) values
(2,'Clothing',10,20,20,5);
Insert into tariffInfo (productTypeID,productType,rateOfDuty,validity,additionalCost,additionalTaxes) values
(3,'Frozen Food',20,10,40,10);
Insert into tariffInfo (productTypeID,productType,rateOfDuty,validity,additionalCost,additionalTaxes) values
(4,'Chemical',50,10,40,30);


Insert into shipmentInfo1 (voyageNum,loadingPort,cost,shippingDate) values 
('12-DLL-TW','SYDNEY',1200,'01-FEB-2023');
Insert into shipmentInfo1 (voyageNum,loadingPort,cost,shippingDate,arrivalDate) values
('14-DMS-TW','ULAN BATOR',1000,'03-FEB-2023', '10-FEB-2023');
Insert into shipmentInfo1 (voyageNum,loadingPort,cost,shippingDate) values
('11-DSS-TW','NAMIBIA',1300,'02-FEB-2023');
Insert into shipmentInfo1 (voyageNum,loadingPort,cost,shippingDate,arrivalDate) values
('10-DTQ-TW','PORTO',1800,'02-FEB-2023', '13-FEB-2023');


Insert into employeeInfo (name,email,phone,address,portName,status) values 
('Rifat','rifat@gmail.com','01982345627','CUMILLA','PATENGA','ACTIVE');
Insert into employeeInfo (name,email,phone,address,portName,status) values 
('Rohit','rohit@gmail.com','01982345227','SIRAJGONJ','MONGLA','ACTIVE');
Insert into employeeInfo (name,email,phone,address,portName,status) values 
('Saher','saher@gmail.com','01982345127','RAJSHAHI','PATENGA','ACTIVE');
Insert into employeeInfo (name,email,phone,address,portName,status) values 
('Rizwan','rizwan@gmail.com','01982335627','DHAKA','MONGLA','ACTIVE');
Insert into employeeInfo (name,email,phone,address,portName,status) values 
('Tabit','tabit@gmail.com','01982345927','PABNA','MONGLA','ACTIVE');

Insert into productInfo1 (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost,arriveDate) values 
(1,'SAMSUNG-11002-43" SMART TV',23,'SOUTH KOREA',3,1002,3,250,'28-JAN-2023');
Insert into productInfo1 (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost,arriveDate) values 
(3,'CANNED TUNA',200,'PORTUGAL',2,1004,3,3000,'18-FEB-2023');
Insert into productInfo1 (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost,arriveDate) values 
(4,'HCL',150,'PORTUGAL',4,1004,1,8000,'18-FEB-2023');
Insert into productInfo1 (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost,arriveDate) values 
(5,'RDX',100,'PORTUGAL',4,1004,1,5000,'16-FEB-2023');

COMMIT