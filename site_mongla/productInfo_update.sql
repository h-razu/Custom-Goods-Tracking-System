SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT W NUMBER PROMPT "Enter Product ID: ";

DECLARE
	pr_id productInfo2.productID%TYPE;
	item_count NUMBER;
	no_item_exp EXCEPTION;
	
BEGIN
	pr_id :=&W;
	item_count := 0;
	
	FOR R IN (SELECT arriveDate,cost,status,description FROM productInfo2 WHERE productID=pr_id)
	LOOP
		DBMS_OUTPUT.PUT_LINE('Item Name: '||R.description);
		DBMS_OUTPUT.PUT_LINE('Item Arrival Date: '||R.arriveDate);
		DBMS_OUTPUT.PUT_LINE('Item Cost: '||R.cost);
		DBMS_OUTPUT.PUT_LINE('Item Status: '||R.status);
		
		item_count :=item_count+1;
	END LOOP;
	
	IF item_count=0 THEN
		RAISE no_item_exp;
	ELSE
		UPDATE productinfo2 SET status='Delivered' WHERE productID=pr_id;
	END IF;	
	
	EXCEPTION 
		WHEN no_item_exp THEN
			DBMS_OUTPUT.PUT_LINE('No information available for this product id');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error occured on productInfo update file');
END;
/
			
COMMIT;
