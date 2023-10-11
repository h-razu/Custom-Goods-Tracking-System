
DROP TABLE importerInfo CASCADE CONSTRAINTS;
DROP SEQUENCE impID_seq;

DROP TABLE tariffInfo CASCADE CONSTRAINTS;
DROP SEQUENCE tariffID_seq;

DROP TABLE productInfo1 CASCADE CONSTRAINTS;
DROP SEQUENCE productID_seq;

DROP TABLE shipmentInfo1 CASCADE CONSTRAINTS;
DROP SEQUENCE shippingID_seq;

DROP TABLE employeeInfo CASCADE CONSTRAINTS;
DROP SEQUENCE empID_seq;


----------------------------------------importerInfo
CREATE TABLE importerInfo
(
impID INTEGER,
name VARCHAR(20),
compName VARCHAR(25),
email VARCHAR(20),
phone VARCHAR(11),
address VARCHAR2(20),
businessType VARCHAR2(20),
status VARCHAR2(15) DEFAULT 'Active',
tradeLicense VARCHAR2(10),
tradeHistory DATE DEFAULT SYSDATE,
lastImportDate DATE DEFAULT SYSDATE,
PRIMARY KEY(impID)
);
CREATE SEQUENCE impID_seq START WITH 1;


---------------------------------------tariffInfo
CREATE TABLE tariffInfo
(
tariffID INTEGER,
productTypeID INTEGER,
productType VARCHAR2(15),
rateOfDuty NUMBER,
validity NUMBER,
additionalCost NUMBER,
additionalTaxes NUMBER,
PRIMARY KEY(tariffID)
);
CREATE SEQUENCE tariffID_seq START WITH 1;


---------------------------------------------shipmentInfo1
CREATE TABLE shipmentInfo1
(
shippingID INTEGER,
voyageNum VARCHAR2(15),
loadingPort VARCHAR2(10),
unloadingPort VARCHAR2(10) DEFAULT 'Patenga',
cost INTEGER,
shippingDate DATE,
arrivalDate DATE DEFAULT SYSDATE,
PRIMARY KEY(shippingID)
);
CREATE SEQUENCE shippingID_seq START WITH 1001;

---------------------------------------------employee
CREATE TABLE employeeInfo
(
empID INTEGER,
name VARCHAR2(20),
email VARCHAR2(20),
phone VARCHAR2(11),
address VARCHAR2(25),
portName VARCHAR2(11),
status varchar2(15) DEFAULT 'ACTIVE',
startDate DATE DEFAULT SYSDATE,
endDate DATE,
PRIMARY KEY(empID)
);
CREATE SEQUENCE empID_seq START WITH 1;

-------------------------------------------productInfo1
CREATE TABLE productInfo1
(
productID INTEGER,
productTypeID INTEGER,
description varchar2(40),
quantity NUMBER,
orgCountry VARCHAR2(20),
arriveDate DATE DEFAULT SYSDATE,
impID INTEGER,
shippingID INTEGER,
empID INTEGER,
cost INTEGER,
status VARCHAR(15) DEFAULT 'on-shed',
PRIMARY KEY(productID),
FOREIGN KEY(impID) REFERENCES importerInfo(impID),
FOREIGN KEY (shippingID) REFERENCES shipmentInfo1(shippingID),
FOREIGN KEY (empID) REFERENCES employeeInfo(empID)
);
CREATE SEQUENCE productID_seq START WITH 10001;

COMMIT;
