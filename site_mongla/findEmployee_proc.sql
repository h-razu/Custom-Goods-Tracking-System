CREATE OR REPLACE PROCEDURE findEmployeeDetails(id IN NUMBER)
IS
emp_name employeeInfo.name@site_patenga%TYPE;
productTypeName tariffInfo.productType@site_patenga%TYPE;
item NUMBER;
no_item_exp EXCEPTION;

BEGIN
	item :=0;
	
	SELECT name INTO emp_name FROM employeeInfo@site_patenga WHERE empID=id;
	
	DBMS_OUTPUT.PUT_LINE('Employee Name: '||emp_name);
	DBMS_OUTPUT.PUT_LINE('Handled Product Info: ');
	
	DBMS_OUTPUT.PUT_LINE('Name							'||'TYPE		'||'Status		');
	FOR R IN (SELECT productTypeID, description, status FROM productInfo2 WHERE empID=id)
	LOOP
		SELECT productType INTO productTypeName FROM tariffInfo@site_patenga WHERE productTypeID=R.productTypeID;
		
		DBMS_OUTPUT.PUT_LINE(R.description||'	'||productTypeName||'  '||R.status);
		
		item := item+1;
	END LOOP;	
	
	IF item=0 THEN
		RAISE no_item_exp;
	END IF;

	EXCEPTION
		WHEN no_item_exp THEN
			DBMS_OUTPUT.PUT_LINE('No Product Info Found');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error');
	END findEmployeeDetails;
/	