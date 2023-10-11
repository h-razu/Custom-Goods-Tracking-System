SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT W NUMBER PROMPT "Enter Employee ID: ";

DECLARE
	e_id employeeInfo.empID%TYPE;
	end_date DATE;
	
BEGIN
	e_id :=&W;
	end_date:=SYSDATE;
	
	UPDATE employeeInfo SET status='terminate', endDate=end_date WHERE empID=e_id;
	
	
	EXCEPTION 
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Incorrect Employee ID');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error occured on employeeInfo update file');
END;
/
			
COMMIT;
