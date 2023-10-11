SET SERVEROUTPUT ON;
SET VERIFY OFF;
CLEAR SCREEN;

ACCEPT X NUMBER PROMPT "Enter Employee ID: ";

DECLARE
	id employeeInfo.empID@site_patenga%TYPE;
	
BEGIN
	id := &X;
	
	findEmployeeDetails(id);
END;
/	