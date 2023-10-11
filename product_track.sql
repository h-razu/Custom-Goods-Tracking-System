SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT W NUMBER PROMPT "Enter Product ID: ";

DECLARE
	pr_id productInfo1.productID%TYPE;
	port shipmentInfo1.unloadingPort%TYPE;
	name importerInfo.compName%TYPE;
	cost NUMBER;
	
BEGIN
	pr_id :=&W;

	port:= myPack.findProduct(pr_id, name, cost);
	
	DBMS_OUTPUT.PUT_LINE('Unloading Port Name: '||port);
	DBMS_OUTPUT.PUT_LINE('Importer Company Name: '||name);
	DBMS_OUTPUT.PUT_LINE('Product Cost: '||cost);
	
	EXCEPTION 
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error occured on track  file');
END;
/
			
COMMIT;
