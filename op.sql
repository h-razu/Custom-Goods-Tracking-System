SET SERVEROUTPUT ON;
SET VERIFY OFF;
CLEAR SCREEN;

--------------------------------------------------------DISPLAY
--SELECT *FROM importerInfo;

--SELECT *FROM tariffInfo;

SELECT *FROM employeeInfo;

--SELECT *FROM shipmentInfo1;

--SELECT *FROM shipmentInfo2@site_mongla;

--SELECT *FROM productInfo1;

--SELECT *FROM productInfo2@site_mongla;

----------------------------------------------------------INSERT

--importerInfo table data insertion
--@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\insertions\importerInfo_insert.sql"

--shipmentInfo for both site data insertion
--@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\insertions\shipmentInfo_insert.sql"

--employee insertion
--@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\insertions\employeeInfo_insert.sql"

--product add
--@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\insertions\productInfo_insert.sql"

--tariff data add
--@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\insertions\tariffInfo_insert.sql"


------------------------------------------------------UPDATE

--product delivery info update
--@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\update\productInfo_update.sql"

--terminate employee
--@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\update\terminate_employee.sql"



------------------------------------------------product track

--
--@"D:\[4,1] Spring'22\CSE4126\Project\Custom Goods Tracking System\product_track.sql"