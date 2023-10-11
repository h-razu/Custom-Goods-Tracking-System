SET SERVEROUTPUT ON;
SET VERIFY OFF;
CLEAR SCREEN;

--connection link create file execution
@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\Connection\mongla_site_link.sql"

--table creation
@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\tables_creation.sql"
 
 --trigger creation
@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\all_triggers.sql"

--insert some initial data
@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\data_initial.sql" 

--execute some validity issue
@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\initial_operation.sql"

--procedures
@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\PACKAGES.sql"
 
  
DECLARE

BEGIN
	
	DBMS_OUTPUT.PUT_LINE('Connection create successful');

END;
/

commit;