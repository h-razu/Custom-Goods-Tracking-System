SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT W NUMBER PROMPT "Enter Product ID: ";
ACCEPT Z CHAR PROMPT "Enter Unloading Port: ";

DECLARE
	pr_id productInfo1.productID%TYPE;
	port shipmentInfo1.unloadingPort%TYPE;
	item_count NUMBER;
	no_item_exp EXCEPTION;
	invalid_port_name_exp EXCEPTION;
	
BEGIN
	pr_id :=&W;
	port :='&Z';
	item_count := 0;
	
	IF LOWER(port) = 'patenga' THEN
	
		FOR R IN (SELECT arriveDate,cost,status,description FROM productInfo1 WHERE productID=pr_id)
		LOOP
			DBMS_OUTPUT.PUT_LINE('Item Name: '||R.description);
			DBMS_OUTPUT.PUT_LINE('Item Arrival Date: '||R.arriveDate);
			DBMS_OUTPUT.PUT_LINE('Item Cost: '||R.cost);
			DBMS_OUTPUT.PUT_LINE('Item Status: '||R.status);
		
			item_count :=item_count+1;
		END LOOP;

	ELSIF LOWER(port) ='mongla' THEN
		FOR Q IN (SELECT arriveDate,cost,status,description FROM productInfo2@site_mongla WHERE productID=pr_id)
		LOOP
			DBMS_OUTPUT.PUT_LINE('Item Name: '||Q.description);
			DBMS_OUTPUT.PUT_LINE('Item Arrival Date: '||Q.arriveDate);
			DBMS_OUTPUT.PUT_LINE('Item Cost: '||Q.cost);
			DBMS_OUTPUT.PUT_LINE('Item Status: '||Q.status);
		
			item_count :=item_count+1;
		END LOOP;
	ELSE 
		RAISE invalid_port_name_exp;
	END IF;	
	
	IF item_count=0 THEN
		RAISE no_item_exp;
	ELSIF item_count>0 THEN
		myPack.updateProductStatus(pr_id, port);
	END IF;	
	
	EXCEPTION 
		WHEN no_item_exp THEN
			DBMS_OUTPUT.PUT_LINE('No information available for this product id');
		WHEN invalid_port_name_exp THEN
			DBMS_OUTPUT.PUT_LINE('');
			DBMS_OUTPUT.PUT_LINE('Invalid unloading port name');
			DBMS_OUTPUT.PUT_LINE('');	
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error occured on productInfo update file');
END;
/
			
COMMIT;
