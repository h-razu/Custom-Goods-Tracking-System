SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT AA CHAR PROMPT "Enter Employee Name: ";
ACCEPT BB CHAR PROMPT "Enter Employee Email: ";
ACCEPT CC CHAR PROMPT "Enter Employee Phone: ";
ACCEPT DD CHAR PROMPT "Enter Employee Address: ";
ACCEPT EE CHAR PROMPT "Enter Employee Work Site: ";



DECLARE
	ab employeeInfo.name%TYPE;
	bc employeeInfo.email%TYPE;
	cd employeeInfo.phone%TYPE;
	de employeeInfo.address%TYPE;
	ef employeeInfo.portName%TYPE;
	
	invalid_port_name_exp EXCEPTION;
	
BEGIN
	ab :='&AA';
	bc :='&BB';
	cd :='&CC';
	de :='&DD';
	ef :='&EE';
	
	IF LOWER(ef)='patenga' OR LOWER(ef)='mongla' THEN
		INSERT INTO employeeInfo (name, email, phone, address, portName) VALUES (ab, bc, cd, de, ef);
	
	ELSE 
		RAISE invalid_port_name_exp;
		
	END IF;	

	--exception for invalid port name 
	EXCEPTION
		WHEN invalid_port_name_exp THEN
			DBMS_OUTPUT.PUT_LINE('');
			DBMS_OUTPUT.PUT_LINE('Invalid unloading port name');
			DBMS_OUTPUT.PUT_LINE('');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other error occured in employeeInfo insert file');
			
END;
/

COMMIT;