
--trigger for productID_seq sequence
CREATE OR REPLACE TRIGGER productID_seq_trig 
BEFORE INSERT ON productInfo2 
FOR EACH ROW

BEGIN
  SELECT productID_seq.NEXTVAL
  INTO   :new.productID
  FROM   dual;
END;
/

--trigger for shippingID_seq sequence
CREATE OR REPLACE TRIGGER shippingID_seq_trig 
BEFORE INSERT ON shipmentInfo2 
FOR EACH ROW

BEGIN
  SELECT shippingID_seq.NEXTVAL
  INTO   :new.shippingID
  FROM   dual;
END;
/

---------------------------------------insertion
--trig for shipmentInfo2 insertion successful message
CREATE OR REPLACE TRIGGER shipmentInfo1Trig
AFTER INSERT
ON shipmentInfo2

BEGIN
	DBMS_OUTPUT.PUT_LINE('Shipment Information Insertion Successful');
END;
/

--trig for productInfo insertion successful message
CREATE OR REPLACE TRIGGER productInfo1Trig
AFTER INSERT
ON productInfo2

BEGIN
	DBMS_OUTPUT.PUT_LINE('Product Information Insertion Successful');
END;
/

-------------------------------update
--trig for shipmentInfo1 update successful message
CREATE OR REPLACE TRIGGER shipmentInfo1UpdateTrig
AFTER UPDATE
ON shipmentInfo2

BEGIN
	DBMS_OUTPUT.PUT_LINE('Shipment Delivery Information Updated');
END;
/

--trig for productInfo update successful message
CREATE OR REPLACE TRIGGER productInfo1UpdateTrig
AFTER UPDATE
ON productInfo2

BEGIN
	DBMS_OUTPUT.PUT_LINE('Product Info Updated');
END;
/
