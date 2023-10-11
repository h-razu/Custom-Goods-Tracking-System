SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT N CHAR PROMPT "Enter Voyage Number: ";
ACCEPT CN CHAR PROMPT "Enter Loading Port Name: ";
ACCEPT PN CHAR PROMPT "Enter Unloading Port Name: ";
ACCEPT E NUMBER PROMPT "Enter Cost: ";
ACCEPT A CHAR PROMPT "Enter Shipping Date: ";

DECLARE
	vn VARCHAR2(15);
	lp VARCHAR2(10);
	cs INTEGER;
	sd DATE;
	pn VARCHAR2(10);
	
BEGIN
	vn :='&N';
	lp :='&CN';
	cs :=&E;
	sd :='&A';
	pn :='&PN';
	
	INSERT INTO shipmentInfo2 (voyageNum,loadingPort,cost,shippingDate) VALUES (vn, lp, cs, sd);

	--exception for invalid unload port name 
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error occured in shipmentInfo insert file');
		
END;
/

COMMIT;