SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
	day_difference NUMBER;
	max_validity NUMBER;
	additional_cost NUMBER;
	new_cost productInfo2.cost%TYPE;
	currentDate DATE;
	

BEGIN
	currentDate :=SYSDATE;	

	--calculating product cost for over stay
	FOR X IN (SELECT productID,productTypeID,cost,arriveDate,status FROM productInfo2)
	LOOP
		SELECT validity,additionalCost INTO max_validity, additional_cost FROM tariffInfo@site_patenga WHERE productTypeID=X.productTypeID;
		
		day_difference :=TRUNC(currentDate) - TRUNC(X.arriveDate);
		
		IF(day_difference>max_validity) AND X.status='on-shed' THEN
			new_cost := X.cost+ X.cost*(additional_cost/100);
			
			UPDATE productInfo2 SET cost=new_cost WHERE productID=X.productID;
		END IF;
	END LOOP;	
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('No data found');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other exception occured in initial operation');
END;
/
COMMIT;