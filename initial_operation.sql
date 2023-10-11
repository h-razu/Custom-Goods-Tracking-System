SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
	month_difference NUMBER;
	currentDate DATE;
	
	day_difference NUMBER;
	max_validity NUMBER;
	additional_cost NUMBER;
	new_cost productInfo1.cost%TYPE;
	

BEGIN
	currentDate :=SYSDATE;
	
	--change status of importer if they don't import in last 1 YEAR;
	FOR R IN (SELECT impID,lastImportDate FROM importerInfo) 
	LOOP
		month_difference := MONTHS_BETWEEN(currentDate, R.lastImportDate);
		
		IF(ROUND(month_difference)>12) THEN
			UPDATE importerInfo SET status='inactive' WHERE impID=R.impID;
		END IF;
	END LOOP;	


	--calculating product cost for over stay
	FOR X IN (SELECT productID,productTypeID,cost,arriveDate,status FROM productInfo1)
	LOOP
		SELECT validity,additionalCost INTO max_validity, additional_cost FROM tariffInfo WHERE productTypeID=X.productTypeID;
		
		day_difference :=TRUNC(currentDate) - TRUNC(X.arriveDate);
		
		IF(day_difference>max_validity) AND X.status='on-shed' THEN
			new_cost := X.cost+ X.cost*(additional_cost/100);
			
			UPDATE productInfo1 SET cost=new_cost WHERE productID=X.productID;
		END IF;
	END LOOP;	
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('No data found');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other exception occured in initial operation');
END;
/