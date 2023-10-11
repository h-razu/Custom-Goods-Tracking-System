SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT AA NUMBER PROMPT "Enter Product Type: ";
ACCEPT BB CHAR PROMPT "Enter Product Name: ";
ACCEPT CC NUMBER PROMPT "Enter Product Quantity: ";
ACCEPT EE NUMBER PROMPT "Enter Importer ID: ";
ACCEPT FF NUMBER PROMPT "Enter Shipping ID:";
ACCEPT GG NUMBER PROMPT "Enter Employee ID: ";


DECLARE
	ab productInfo2.productTypeID%TYPE;
	bc productInfo2.description%TYPE;
	cd productInfo2.quantity%TYPE;
	ef productInfo2.impID%TYPE;
	fg productInfo2.shippingID%TYPE;
	gh productInfo2.empID%TYPE;
	
	org_country productInfo2.orgCountry%TYPE;
	duty_rate tariffInfo.rateOfDuty@site_patenga%TYPE;
	add_tax tariffInfo.additionalTaxes@site_patenga%TYPE;
	total_cost productInfo2.cost%TYPE;
	
BEGIN
	ab :=&AA;
	bc :='&BB';
	cd :=&CC;
	ef :=&EE;
	fg :=&FF;
	gh :=&GG;
	
	
		SELECT loadingPort INTO org_country FROM shipmentInfo2 WHERE shippingID=fg;
		
		SELECT rateOfDuty, additionalTaxes INTO duty_rate, add_tax FROM tariffInfo@site_patenga WHERE productTypeID=ab;
		
		total_cost := (duty_rate * cd)+ (duty_rate*cd)*(add_tax/100);
		
		--DBMS_OUTPUT.PUT_LINE(total_cost);
		
		INSERT INTO productInfo2 (productTypeID,description,quantity,orgCountry,impID,shippingID,empID,cost) VALUES 
		(ab, bc, cd, org_country, ef, fg, gh, total_cost);
		
		--update importHistory in importerInfo table
		UPDATE importerInfo@site_patenga SET lastImportDate=SYSDATE WHERE impID=ef;
	
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error occured in productInfo insert file');
			
END;
/

COMMIT;