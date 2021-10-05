/************************************************************************
  FILENAME: sa_api_events_seed.sql

  PROJECT: SmartSupplies - PMD API

  CLIENT: Signant Health
  
  DESCRIPTION: Creation of SmartSupplies - PMD API SA_API_EVENTS seed data
             
  REVISION HISTORY: 
  Date                  Name       Version      Ref.#        Description
  =============== ==============   ===========  =========    ===========
  03-Mar-2021      Sidhartha        1.0.0 (a)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Clinical_Programs
  10-Mar-2021      Sidhartha        1.0.0 (b)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Clinical_Projects module.
  15-Mar-2021      Sidhartha        1.0.0 (c)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Clinical_Trials module.
  23-Mar-2021      Sidhartha        1.0.0 (d)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Trial_Sites module. 
  31-Mar-2021      Sidhartha        1.0.0 (e)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Trial_Personnels module.
  01-Apr-2021      Sidhartha        1.0.0 (f)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Trial_Vendors module. 
  06-Apr-2021      Sidhartha        1.0.0 (g)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Trial_Pools module.
  08-Apr-2021      Sidhartha        1.0.0 (h)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Trial_Configuration module.
  14-Apr-2021      Sidhartha        1.0.0 (i)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Address_Book module. 
  16-Apr-2021      Sidhartha        1.0.0 (j)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Clinical_Personnel module.
  26-Apr-2021      Sidhartha        1.0.0 (k)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Batch_Review_Questions module.
  28-Apr-2021      Jayashree        1.0.0 (l)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Containers module.
  05-May-2021      Jayashree        1.0.0 (m)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - UOM module.
  08-May-2021      Jayashree        1.0.0 (n)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Test_Types module.
  09-May-2021      Jayashree        1.0.0 (o)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Countries module. 
  12-May-2021      Jayashree        1.0.0 (p)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Item_classifications module.
  13-May-2021      Jayashree        1.0.0 (q)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Item_Sub_class module.
  21-May-2021      Jayashree        1.0.0 (r)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Location_Container_type module.
  26-May-2021      Jayashree        1.0.0 (s)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Barcode_Types module. 
  31-May-2021      Jayashree        1.0.0 (t)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Statuses module. 
  02-Jun-2021      Jayashree        1.0.0 (u)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Carriers module.
  11-Jun-2021      Jayashree        1.0.0 (v)                Creation of SmartSupplies - PMD API SA_API_EVENTS seed data - Vendors module.                         
 *************************************************************************/                    

spool  sa_api_events_seed.log

Prompt Creating seed data into SA_API_EVENTS for 'Clinical_Programs' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_programs_jn;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            sp_programs_jn;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Clinical_Programs',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Clinical_Programs'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Clinical_Programs',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Clinical_Programs'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Clinical_Projects' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_projects_jn;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            sp_projects_jn;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Clinical_Projects',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Clinical_Projects'
                        AND uuid = 'ALL'
                );

	ELSE
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Clinical_Projects',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Clinical_Projects'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Clinical_Trials' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_trials_jn tj,sp_trials t
		WHERE t.sspmd_audit_id = tj.sspmd_audit_id 
		AND t.status_cd IS NOT NULL;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(tj.update_date, tj.create_date))
        INTO v_max_create_date
        FROM
            sp_trials_jn tj,sp_trials t
		WHERE t.sspmd_audit_id = tj.sspmd_audit_id 
		AND t.status_cd IS NOT NULL;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Clinical_Trials',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Clinical_Trials'
                        AND uuid = 'ALL'
                );
	
	ELSE
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Clinical_Trials',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Clinical_Trials'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Trial_Sites' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_trial_sites_jn;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            sp_trial_sites_jn;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Sites',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Sites'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Sites',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Sites'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Trial_Personnels' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_trial_personnel_jn;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            sp_trial_personnel_jn;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Personnels',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Personnels'
                        AND uuid = 'ALL'
                );

	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Personnels',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Personnels'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Trial_Vendors' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_trial_vendors_jn;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            sp_trial_vendors_jn;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Vendors',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Vendors'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Vendors',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Vendors'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Trial_Pools' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_trials_jn tj,sp_trials_jn t
		WHERE t.sspmd_action = 'INSERT' 
		and tj.sspmd_audit_id = t.sspmd_audit_id 
		and t.status_cd IS NULL;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(tj.update_date, tj.create_date))
        INTO v_max_create_date
        FROM
            sp_trials_jn tj,sp_trials_jn t
		WHERE t.sspmd_action = 'INSERT'
		and tj.sspmd_audit_id = t.sspmd_audit_id 
		and t.status_cd IS NULL;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Pools',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Pools'
                        AND uuid = 'ALL'
                );
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Pools',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Pools'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Trial_Configuration' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_trial_config_parameters_jn;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            sp_trial_config_parameters_jn;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Configuration',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Configuration'
                        AND uuid = 'ALL'
                );
	
	ELSE 
		
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Trial_Configuration',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Trial_Configuration'
                        AND uuid = 'ALL'
                );

    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Address_Book' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_addresses_jn;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            sp_addresses_jn;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Address_Book',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Address_Book'
                        AND uuid = 'ALL'
                );
	
	ELSE 
		
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Address_Book',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Address_Book'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Clinical_Personnel' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_clinical_personnel_jn;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            sp_clinical_personnel_jn;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Clinical_Personnel',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Clinical_Personnel'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	 
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Clinical_Personnel',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Clinical_Personnel'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Batch_Review_Questions' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        sp_batch_review_questions_jn;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            sp_batch_review_questions_jn;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Batch_Review_Questions',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Batch_Review_Questions'
                        AND uuid = 'ALL'
                );
		
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Batch_Review_Questions',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Batch_Review_Questions'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Containers' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_LOCATION_CONTAINERS_JN CJ
        WHERE EXISTS (SELECT 1 FROM SP_LOCATION_CONTAINERS_JN C           
		WHERE C.sspmd_action = 'INSERT'
        AND C.is_container = 'Y'
		AND C.sspmd_audit_id =  CJ.sspmd_audit_id); 

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(CJ.update_date, CJ.create_date))
        INTO v_max_create_date
        FROM
        SP_LOCATION_CONTAINERS_JN CJ
        WHERE EXISTS (SELECT 1 FROM SP_LOCATION_CONTAINERS_JN C           
		WHERE C.sspmd_action = 'INSERT'
        AND C.is_container = 'Y'
		AND C.sspmd_audit_id =  CJ.sspmd_audit_id); 

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Containers',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Containers'
                        AND uuid = 'ALL'
                );
	
	ELSE 
		
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Containers',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Containers'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'UOM' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_UOM_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_UOM_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'UOM',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'UOM'
                        AND uuid = 'ALL'
                );
	
	ELSE 
		
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'UOM',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'UOM'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Test_Types' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_TEST_TYPES_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_TEST_TYPES_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Test_Types',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Test_Types'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Test_Types',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Test_Types'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
Prompt Creating seed data into SA_API_EVENTS for 'Countries' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_COUNTRIES_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_COUNTRIES_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Countries',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Countries'
                        AND uuid = 'ALL'
                );
	
	ELSE 
		
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Countries',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Countries'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
Prompt Creating seed data into SA_API_EVENTS for 'Item_classifications' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_ITEM_CLASSIFICATIONS_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_ITEM_CLASSIFICATIONS_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Item_classifications',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Item_classifications'
                        AND uuid = 'ALL'
                );
	
	ELSE 
		
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Item_classifications',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Item_classifications'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
Prompt Creating seed data into SA_API_EVENTS for 'Item_Sub_class' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_ITEM_SUBCLASS_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_ITEM_SUBCLASS_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Item_Sub_class',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Item_Sub_class'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Item_Sub_class',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Item_Sub_class'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
Prompt Creating seed data into SA_API_EVENTS for 'Location_Container_type' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_LOCATION_CONTAINER_TYPES_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_LOCATION_CONTAINER_TYPES_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Location_Container_type',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Location_Container_type'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Location_Container_type',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Location_Container_type'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
Prompt Creating seed data into SA_API_EVENTS for 'Barcode_Types' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_BARCODE_CONFIGURATION_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_BARCODE_CONFIGURATION_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Barcode_Types',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Barcode_Types'
                        AND uuid = 'ALL'
                );
	
	ELSE
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Barcode_Types',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Barcode_Types'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
Prompt Creating seed data into SA_API_EVENTS for 'Statuses' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_STATUSES_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_STATUSES_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Statuses',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Statuses'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Statuses',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Statuses'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
Prompt Creating seed data into SA_API_EVENTS for 'Carriers' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_CARRIERS_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_CARRIERS_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Carriers',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Carriers'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Carriers',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Carriers'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
Prompt Creating seed data into SA_API_EVENTS for 'Vendors' module
DECLARE
    v_cnt               NUMBER;
    v_max_create_date   sa_api_events.create_date%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO v_cnt
    FROM
        SP_VENDORS_JN;

    IF v_cnt > 0 THEN
        SELECT
            MAX(nvl(update_date, create_date))
        INTO v_max_create_date
        FROM
            SP_VENDORS_JN;

        INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Vendors',
                'CREATE',
                'ALL',
                v_max_create_date,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Vendors'
                        AND uuid = 'ALL'
                );
	
	ELSE 
	
		INSERT INTO sa_api_events (
            module_name,
            event_type,
            uuid,
            event_timestamp,
            create_user,
            create_date
        )
            SELECT
                'Vendors',
                'CREATE',
                'ALL',
                sysdate,
                'Mig-Script-PMD-APIv100',
                sysdate
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        sa_api_events
                    WHERE
                        module_name = 'Vendors'
                        AND uuid = 'ALL'
                );
				
    END IF;

END;
/
COMMIT;
spool off