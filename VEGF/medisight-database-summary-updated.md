# Updated Medisight Database Structure Summary (Updated 2024-10-07)

## Key Tables and Their Structures

1. patient
   - Primary Key: pat_id (uniqueidentifier)
   - Key Fields:
     - pat_surname, pat_forename, pat_initials, pat_title (nvarchar)
     - pat_dob (date)
     - pat_lks_id_gender (int) - likely a foreign key to a lookup table
     - pat_deceased (tinyint)
     - pat_status (int)
     - pat_isdeleted (bit)

2. injection
   - Primary Key: ijp_id (int)
   - Foreign Keys:
     - ijp_act_id -> activity.act_id (uniqueidentifier)
     - ijp_bod_id -> bodypart.bod_id (int)
   - Key Fields:
     - ijp_entryfromlimbus (decimal)
     - ijp_lks_id_preparationmethod (int)
     - ijp_lks_id_needleangle (int)
     - ijp_conjunctivadisplaced (bit)
     - ijp_actap (bit)
     - ijp_clockhours (varchar)

3. activity (inferred structure)
   - Primary Key: act_id (uniqueidentifier)
   - Foreign Key: act_pat_id -> patient.pat_id (inferred)
   - Key Fields:
     - act_date (datetime or date, inferred)

4. bodypart
   - Primary Key: bod_id (int)
   - Key Fields:
     - bod_name (likely includes 'Left Eye' and 'Right Eye')

## Relationships

1. injection to activity: One-to-One (ijp_act_id -> act_id)
2. injection to bodypart: Many-to-One (ijp_bod_id -> bod_id)
3. activity to patient: Many-to-One (act_pat_id -> pat_id, inferred)

## Other Relevant Tables

1. injectionnumberingcategorydetail
   - Foreign Key: icd_ijp_id -> injection.ijp_id

2. injectionnumberingdetail
   - Foreign Key: pin_pqg_id -> procedurequalifiergroup.pqg_id

3. InjectionPlanningActivity
   - Foreign Keys:
     - ipa_act_id -> activity.act_id
     - ipa_bod_id -> bodypart.bod_id
     - ipa_itp_id -> TreatmentPlan.itp_id
     - ipa_lpe_id -> LinkedPlannedEvent.lpe_id

## Lookup Tables

Several 'lks_id' fields in the patient and injection tables suggest the use of lookup tables for standardized values (e.g., gender, preparation method, needle angle).

## Key Observations

1. Patient Identification: Patients are primarily identified by a GUID (pat_id) rather than a numeric or string-based ID.
2. Soft Delete: The patient table includes an 'isdeleted' flag, suggesting a soft delete approach.
3. Eyes: The bodypart table likely distinguishes between left and right eyes.
4. Injection Details: The injection table captures specific details about each injection procedure.
5. Activity Linking: The activity table appears to be a central linking point between patients and injections.

## Query Strategy for Injection History

To query injections for a specific patient and eye:

1. Start with the patient table
2. Join to activity table
3. Join to injection table
4. Join to bodypart table
5. Filter by patient ID (pat_id) and eye (bod_name)
6. Order by injection date (from activity table)

## Uncertainties and Areas for Further Investigation

1. The exact structure of the activity table
2. The precise naming convention for eyes in the bodypart table
3. The purpose and content of various patient-related tables (e.g., patientlog, patientclinicalplan)
4. The role of InjectionPlanningActivity and how it relates to actual injections

