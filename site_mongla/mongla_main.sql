SET SERVEROUTPUT ON;
SET VERIFY OFF;
CLEAR SCREEN;


--connection link create file execution
@"C:\Users\moham\Desktop\DDS\Project\connection\patenga_site_link.sql"

--mongla site table
@"C:\Users\moham\Desktop\DDS\Project\tables_creation.sql"
 
 --create all trigger
@"C:\Users\moham\Desktop\DDS\Project\all_triggers.sql"

--dummy data insertion
@"C:\Users\moham\Desktop\DDS\Project\data_initial.sql"

--
@"C:\Users\moham\Desktop\DDS\Project\init_op.sql"

--PROCEDURE
@"C:\Users\moham\Desktop\DDS\Project\findEmployee_proc.sql"

DECLARE

BEGIN
	DBMS_OUTPUT.PUT_LINE('Connection done');
END;
/	

COMMIT;