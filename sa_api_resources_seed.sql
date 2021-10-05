/************************************************************************
  FILENAME: sa_api_resources_seed.sql

  PROJECT: SmartSupplies - PMD API

  CLIENT: Signant Health
  
  DESCRIPTION: Creation of SmartSupplies - PMD API SA_API_EVENTS seed data
             
  REVISION HISTORY: 
  Date                  Name           Version    Ref.#            Description
  ================      ============= ========   =============  ====================
  03-Mar-2021           Sidhartha      1.0.0 (a)                 Creation of SmartSupplies - PMD API SA_API_RESOURCES seed data
  10-Mar-2021           Sidhartha      1.0.0 (b)                 SmartSupplies - PMD API RESOURCES seed data - Clinical_Projects
  16-Mar-2021           Sidhartha      1.0.0 (c)                 SmartSupplies - PMD API RESOURCES seed data - Clinical_Trials
  23-Mar-2021           Sidhartha      1.0.0 (d)                 SmartSupplies - PMD API RESOURCES seed data - Trial_Sites
  31-Mar-2021           Sidhartha      1.0.0 (e)                 SmartSupplies - PMD API RESOURCES seed data - Trial_Personnels
  01-Apr-2021           Sidhartha      1.0.0 (f)                 SmartSupplies - PMD API RESOURCES seed data - Trial_Vendors
  06-Apr-2021           Sidhartha      1.0.0 (g)                 SmartSupplies - PMD API RESOURCES seed data - Trial_Pools
  08-Apr-2021           Sidhartha      1.0.0 (h)                 SmartSupplies - PMD API RESOURCES seed data - Trial_Configuration
  14-Apr-2021           Sidhartha      1.0.0 (i)                 SmartSupplies - PMD API RESOURCES seed data - Address_Book
  19-Apr-2021           Sidhartha      1.0.0 (j)                 SmartSupplies - PMD API RESOURCES seed data - Clinical_Personnel
  26-Apr-2021           Sidhartha      1.0.0 (k)                 SmartSupplies - PMD API RESOURCES seed data - Batch_Review_Questions
  28-Apr-2021           Jayashree      1.0.0 (l)                 SmartSupplies - PMD API RESOURCES seed data - Containers
  05-May-2021           Jayashree      1.0.0 (m)                 SmartSupplies - PMD API RESOURCES seed data - UOM
  08-May-2021           Jayashree      1.0.0 (n)                 SmartSupplies - PMD API RESOURCES seed data - Test_Types
  09-May-2021           Jayashree      1.0.0 (O)                 SmartSupplies - PMD API RESOURCES seed data - Countries
  12-May-2021           Jayashree      1.0.0 (p)                 SmartSupplies - PMD API RESOURCES seed data - Item_classifications
  13-May-2021           Jayashree      1.0.0 (q)                 SmartSupplies - PMD API RESOURCES seed data - Item_Sub_class
  21-May-2021           Jayashree      1.0.0 (r)                 SmartSupplies - PMD API RESOURCES seed data - Location_Container_type
  26-May-2021           Jayashree      1.0.0 (s)                 SmartSupplies - PMD API RESOURCES seed data - Barcode_Types
  31-May-2021           Jayashree      1.0.0 (t)                 SmartSupplies - PMD API RESOURCES seed data - Statuses
  02-Jun-2021           Jayashree      1.0.0 (u)                 SmartSupplies - PMD API RESOURCES seed data - Carriers
  11-Jun-2021           Jayashree      1.0.0 (v)                 SmartSupplies - PMD API RESOURCES seed data - Vendors
*************************************************************************/                    

spool  sa_api_resources_seed.log

Prompt Creating seed data in SA_API_RESOURCES for Clinical_Programs

INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Clinical_Programs',
	1,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Clinical_Programs')
	);
COMMIT;	
Prompt Creating seed data in SA_API_RESOURCES for Clinical_Projects

INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
        SELECT
            'Clinical_Projects',
            2,
            25,
	        null,
            user,
            sysdate
        FROM
            dual
        WHERE
            NOT EXISTS (
                SELECT
                    1
                FROM
                    sa_api_resources
                WHERE
                    upper(module_name) = upper('Clinical_Projects')
            );		
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Clinical_Trials
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
        SELECT
            'Clinical_Trials',
            3,
            25,
	        null,
            user,
            sysdate
        FROM
            dual
        WHERE
            NOT EXISTS (
                SELECT
                    1
                FROM
                    sa_api_resources
                WHERE
                    upper(module_name) = upper('Clinical_Trials')
            );
COMMIT;

Prompt Creating seed data in SA_API_RESOURCES for Trial_Sites
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
        SELECT
            'Trial_Sites',
            4,
            25,
	        null,
            user,
            sysdate
        FROM
            dual
        WHERE
            NOT EXISTS (
                SELECT
                    1
                FROM
                    sa_api_resources
                WHERE
                    upper(module_name) = upper('Trial_Sites')
            );
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Trial_Personnels

INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Trial_Personnels',
	5,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Trial_Personnels')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Trial_Vendors

INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Trial_Vendors',
	6,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Trial_Vendors')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Trial_Pools

INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Trial_Pools',
	7,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Trial_Pools')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Trial_Configuration

INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Trial_Configuration',
	8,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Trial_Configuration')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Address_Book

INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Address_Book',
	9,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Address_Book')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Clinical_Personnel
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Clinical_Personnel',
	10,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Clinical_Personnel')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Batch_Review_Questions
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Batch_Review_Questions',
	11,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Batch_Review_Questions')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Containers
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Containers',
	12,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Containers')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for UOM
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'UOM',
	13,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('UOM')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Test_Types
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Test_Types',
	14,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Test_Types')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Countries
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Countries',
	15,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Countries')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Item_classifications
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Item_classifications',
	16,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Item_classifications')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Item_Sub_class
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Item_Sub_class',
	17,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Item_Sub_class')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Location_Container_type
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Location_Container_type',
	18,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Location_Container_type')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Barcode_Types
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Barcode_Types',
	19,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Barcode_Types')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Statuses
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Statuses',
	20,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Statuses')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Carriers
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Carriers',
	21,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Carriers')
	);
COMMIT;
Prompt Creating seed data in SA_API_RESOURCES for Vendors
INSERT INTO sa_api_resources (
        module_name,
        module_order,
        page_set,
	    sub_page_set,
        create_user,
        create_date
    )
SELECT
	'Vendors',
	22,
	25,
	null,
	user,
	sysdate
FROM
	dual
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sa_api_resources
		WHERE
			upper(module_name) = upper('Vendors')
	);
COMMIT;
spool off