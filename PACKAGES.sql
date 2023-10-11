SET SERVEROUTPUT ON;
SET VERIFY OFF;
CLEAR SCREEN;

---PACKAGE SPECIFICATION
CREATE OR REPLACE PACKAGE myPack 
AS
	FUNCTION findProduct(id IN productInfo1.productID%TYPE, impCom OUT importerInfo.compName%TYPE, currentCost OUT NUMBER)
	RETURN shipmentInfo1.unloadingPort%TYPE;
	
	PROCEDURE updateProductStatus(pr_id IN NUMBER, port IN CHAR);
	
END myPack;
/	

---PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY myPack 
AS
	---FUNCTION
	FUNCTION findProduct(id IN productInfo1.productID%TYPE, impCom OUT importerInfo.compName%TYPE, currentCost OUT NUMBER)
	RETURN shipmentInfo1.unloadingPort%TYPE
	IS
	
	portName shipmentInfo1.unloadingPort%TYPE;
	shipment_id shipmentInfo1.shippingID%TYPE;
	imp importerInfo.impID%TYPE;
	impCo importerInfo.compName%TYPE;
	cs NUMBER;
	
	BEGIN
		portName := 'NULL';
		shipment_id := 0;
		
		--search for port
		 SELECT shippingID, impID, cost INTO shipment_id, imp, cs FROM 
		 (SELECT shippingID, impID, cost FROM productInfo1 WHERE productID=id
		 UNION 
		 SELECT shippingID, impID, cost FROM productInfo2@site_mongla WHERE productID=id);
		 
		 SELECT unloadingPort INTO portName FROM 
		 (SELECT unloadingPort FROM shipmentInfo1 WHERE shippingID=shipment_id 
		 UNION 
		 SELECT unloadingPort FROM shipmentInfo2@site_mongla WHERE shippingID=shipment_id);

		SELECT compName INTO impCo FROM importerInfo WHERE impID=imp;
		

		impCom := impCo;
		currentCost := cs;
		 
		RETURN portName;
	END findProduct;
	
	
	---PROCEDURE
	PROCEDURE updateProductStatus(pr_id IN NUMBER, port IN CHAR)
	IS

	BEGIN
	IF LOWER(port) = 'patenga' THEN
		UPDATE productinfo1 SET status='Delivered' WHERE productID=pr_id;
		
	ELSIF LOWER(port) = 'mongla' THEN
		UPDATE productinfo2@site_mongla SET status='Delivered' WHERE productID=pr_id;
	END IF;	

	END updateProductStatus;

END myPack;
/