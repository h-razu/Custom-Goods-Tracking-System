SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT AA CHAR PROMPT "Enter Product Type Name: ";
ACCEPT BB NUMBER PROMPT "Enter Rate Of Duty: ";
ACCEPT CC NUMBER PROMPT "Enter Max Validity Stay: ";
ACCEPT DD NUMBER PROMPT "Enter Addition Cost for Over Stay: ";
ACCEPT EE NUMBER PROMPT "Enter Other Taxes: ";



DECLARE
	ab tariffInfo.productType%TYPE;
	bc tariffInfo.rateOfDuty%TYPE;
	cd tariffInfo.validity%TYPE;
	de tariffInfo.additionalCost%TYPE;
	ef tariffInfo.additionalTaxes%TYPE;
	
	total NUMBER;
	
BEGIN
	ab :='&AA';
	bc :=&BB;
	cd :=&CC;
	de :=&DD;
	ef :=&EE;
	
	SELECT COUNT(tariffID) INTO total FROM tariffInfo;
	INSERT INTO tariffInfo (productTypeID, productType, rateOfDuty, validity, additionalCost, additionalTaxes) 
	VALUES (total, ab, bc, cd, de, ef);
	
	 
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error occured in tariffInfo insert file');
			
END;
/

COMMIT;