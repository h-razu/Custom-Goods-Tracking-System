DROP TABLE productInfo2 CASCADE CONSTRAINTS;
DROP SEQUENCE productID_seq;

DROP TABLE shipmentInfo2 CASCADE CONSTRAINTS;
DROP SEQUENCE shippingID_seq;

---------------------------------------------shipmentInfo2
CREATE TABLE shipmentInfo2
(
shippingID INTEGER,
voyageNum VARCHAR2(15),
loadingPort VARCHAR2(10),
unloadingPort VARCHAR2(10) DEFAULT 'Mongla',
cost INTEGER,
shippingDate DATE,
arrivalDate DATE DEFAULT SYSDATE,
PRIMARY KEY(shippingID)
);
CREATE SEQUENCE shippingID_seq START WITH 2001;

-------------------------------------------productInfo2
CREATE TABLE productInfo2
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
FOREIGN KEY (shippingID) REFERENCES shipmentInfo2(shippingID)
);
CREATE SEQUENCE productID_seq START WITH 20001;

COMMIT;