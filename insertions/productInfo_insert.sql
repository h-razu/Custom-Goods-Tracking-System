SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT HH CHAR PROMPT "Enter Unloading Port Name: ";
ACCEPT AA NUMBER PROMPT "Enter Product Type: ";
ACCEPT BB CHAR PROMPT "Enter Product Name: ";
ACCEPT CC NUMBER PROMPT "Enter Product Quantity: ";
ACCEPT EE NUMBER PROMPT "Enter Importer ID: ";
ACCEPT FF NUMBER PROMPT "Enter Shipping ID:";
ACCEPT GG NUMBER PROMPT "Enter Employee ID: ";


DECLARE
	ab productInfo1.productTypeID%TYPE;
	bc productInfo1.description%TYPE;
	cd productInfo1.quantity%TYPE;
	ef productInfo1.impID%TYPE;
	fg productInfo1.shippingID%TYPE;
	gh productInfo1.empID%TYPE;
	hi VARCHAR2(10);
	
	org_country productInfo1.orgCountry%TYPE;
	duty_rate tariffInfo.rateOfDuty%TYPE;
	add_tax tariffInfo.additionalTaxes%TYPE;
	total_cost productInfo1.cost%TYPE;
	invalid_port_name_exp EXCEPTION;
	
BEGIN
	ab :=&AA;
	bc :='&BB';
	cd :=&CC;
	ef :=&EE;
	fg :=&FF;
	gh :=&GG;
	hi :='&HH';
	
	
	IF LOWER(hi) = 'patenga' THEN
	
		SELECT loadingPort INTO org_country FROM shipmentInfo1 WHERE shippingID=fg;
		
		SELECT rateOfDuty, additionalTaxes INTO duty_rate, add_tax FROM tariffInfo WHERE productTypeID=ab;
		
		total_cost := (duty_rate * cd)+ (duty_rate*cd)*(add_tax/100);
		
		--DBMS_OUTPUT.PUT_LINE(total_cost);
		
		INSERT INTO productInfo1 (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost) VALUES 
		(ab, bc, cd, org_country, ef, fg, gh, total_cost);
		
		--update importHistory in importerInfo table
		UPDATE importerInfo SET lastImportDate=SYSDATE WHERE impID=ef;
	
	
	ELSIF LOWER(hi) = 'mongla' THEN
		SELECT loadingPort INTO org_country FROM shipmentInfo2@site_mongla WHERE shippingID=fg;
		
		SELECT rateOfDuty, additionalTaxes INTO duty_rate, add_tax FROM tariffInfo WHERE productTypeID=ab;
		
		total_cost := (duty_rate * cd)+ (duty_rate*cd)*(add_tax/100);
		
		
		INSERT INTO productInfo2@site_mongla (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost) VALUES 
		(ab, bc, cd, org_country, ef, fg, gh, total_cost);
		
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
			DBMS_OUTPUT.PUT_LINE('Other error occured in productInfo insert file');
			
END;
/

COMMIT;