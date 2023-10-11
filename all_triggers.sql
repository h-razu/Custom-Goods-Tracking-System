--trigger for imp_ID sequence
CREATE OR REPLACE TRIGGER imp_ID_seq_trig 
BEFORE INSERT ON importerInfo 
FOR EACH ROW

BEGIN
  SELECT impID_seq.NEXTVAL
  INTO   :new.impID
  FROM   dual;
END;
/


--trigger for tariffID sequence
CREATE OR REPLACE TRIGGER tariffID_seq_trig 
BEFORE INSERT ON tariffInfo 
FOR EACH ROW

BEGIN
  SELECT tariffID_seq.NEXTVAL
  INTO   :new.tariffID
  FROM   dual;
END;
/

--trigger for productID_seq sequence
CREATE OR REPLACE TRIGGER productID_seq_trig 
BEFORE INSERT ON productInfo1 
FOR EACH ROW

BEGIN
  SELECT productID_seq.NEXTVAL
  INTO   :new.productID
  FROM   dual;
END;
/

--trigger for shippingID_seq sequence
CREATE OR REPLACE TRIGGER shippingID_seq_trig 
BEFORE INSERT ON shipmentInfo1 
FOR EACH ROW

BEGIN
  SELECT shippingID_seq.NEXTVAL
  INTO   :new.shippingID
  FROM   dual;
END;
/

--trigger for empID_seq sequence
CREATE OR REPLACE TRIGGER empID_seq_trig 
BEFORE INSERT ON employeeInfo 
FOR EACH ROW

BEGIN
  SELECT empID_seq.NEXTVAL
  INTO   :new.empID
  FROM   dual;
END;
/
-------------------------------------------------------------------INSERTION TRIG
--trig for shipmentInfo1 insertion successful message
CREATE OR REPLACE TRIGGER importerInfoTrig
AFTER INSERT
ON importerInfo

BEGIN
	DBMS_OUTPUT.PUT_LINE('New Importer Add Successful');
END;
/

--trig for shipmentInfo1 insertion successful message
CREATE OR REPLACE TRIGGER shipmentInfo1Trig
AFTER INSERT
ON shipmentInfo1

BEGIN
	DBMS_OUTPUT.PUT_LINE('Shipment Information Insertion Successful');
END;
/

--trig for productInfo insertion successful message
CREATE OR REPLACE TRIGGER productInfo1Trig
AFTER INSERT
ON productInfo1

BEGIN
	DBMS_OUTPUT.PUT_LINE('Product Information Insertion Successful');
END;
/

--trig for productInfo insertion successful message
CREATE OR REPLACE TRIGGER employeeInfoInsertTrig
AFTER INSERT
ON employeeInfo

BEGIN
	DBMS_OUTPUT.PUT_LINE('Employee Add Successful');
END;
/

--trig for tariffInfo insertion successful message
CREATE OR REPLACE TRIGGER tariffInfoInsertTrig
AFTER INSERT
ON tariffInfo

BEGIN
	DBMS_OUTPUT.PUT_LINE('New Tariff data add successful');
END;
/

-------------------------------------------------------------------UPDATE TRIG
--trig for shipmentInfo1 update successful message
CREATE OR REPLACE TRIGGER importerInfoUpdateTrig
AFTER UPDATE
ON importerInfo

BEGIN
	DBMS_OUTPUT.PUT_LINE('Importer Info Updated');
END;
/

--trig for shipmentInfo1 update successful message
CREATE OR REPLACE TRIGGER shipmentInfo1UpdateTrig
AFTER UPDATE
ON shipmentInfo1

BEGIN
	DBMS_OUTPUT.PUT_LINE('Shipment Delivery Information Updated');
END;
/

--trig for productInfo update successful message
CREATE OR REPLACE TRIGGER productInfo1UpdateTrig
AFTER UPDATE
ON productInfo1

BEGIN
	DBMS_OUTPUT.PUT_LINE('Product Info Updated');
END;
/

--trig for productInfo update successful message
CREATE OR REPLACE TRIGGER employeeInfoUpdateTrig
AFTER UPDATE
ON employeeInfo

BEGIN
	DBMS_OUTPUT.PUT_LINE('Employee Update Successful');
END;
/

--trig for tariffInfo update successful message
CREATE OR REPLACE TRIGGER tariffInfoUpdateTrig
AFTER UPDATE
ON tariffInfo

BEGIN
	DBMS_OUTPUT.PUT_LINE('Tariff data updated');
END;
/