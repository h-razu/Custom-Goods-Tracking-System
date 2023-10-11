SET SERVEROUTPUT ON;
SET VERIFY OFF;


ACCEPT N CHAR PROMPT "Enter Importer Name: ";
ACCEPT CN CHAR PROMPT "Enter Importer Company Name: ";
ACCEPT E CHAR PROMPT "Enter Email: ";
ACCEPT P CHAR PROMPT "Enter Phone: ";
ACCEPT A CHAR PROMPT "Enter Address: ";
ACCEPT BT CHAR PROMPT "Enter Importer Business Type: ";
ACCEPT TL CHAR PROMPT "Enter Trande License: ";


DECLARE
	na importerInfo.name%TYPE;
	compN importerInfo.compName%TYPE;
	em importerInfo.email%TYPE;
	ph importerInfo.phone%TYPE;
	ad importerInfo.address%TYPE;
	btype importerInfo.businessType%TYPE;
	tlice importerInfo.tradeLicense%TYPE;
	
BEGIN
	na :='&N';
	compN :='&CN';
	em :='&E';
	ph :='&P';
	ad :='&A';
	btype :='&BT';
	tlice :='&TL';
	
	INSERT INTO importerInfo (name,compName,email,phone,address,businessType,tradeLicense) VALUES (na, compN, em, ph, ad, btype, tlice);
	
END;
/

COMMIT;