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
	
	invalid_port_name_exp EXCEPTION;
	
BEGIN
	vn :='&N';
	lp :='&CN';
	cs :=&E;
	sd :='&A';
	pn :='&PN';
	
	IF LOWER(pn) = 'patenga' THEN
		INSERT INTO shipmentInfo1 (voyageNum,loadingPort,cost,shippingDate) VALUES (vn, lp, cs, sd);
	
	ELSIF LOWER(pn) = 'mongla' THEN
		INSERT INTO shipmentInfo2@site_mongla (voyageNum,loadingPort,cost,shippingDate) VALUES (vn, lp, cs, sd);
		
	ELSE
		RAISE invalid_port_name_exp;
		
	END IF;

	--exception for invalid unload port name 
	EXCEPTION
		WHEN invalid_port_name_exp THEN
			DBMS_OUTPUT.PUT_LINE('');
			DBMS_OUTPUT.PUT_LINE('Invalid unloading port name');
			DBMS_OUTPUT.PUT_LINE('');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error occured in shipmentInfo insert file');
		
END;
/

COMMIT;