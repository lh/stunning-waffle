CREATE TABLE AccessionNumber (
    han_Id int(4) NOT NULL,
    han_hpc_ProcedureCodeId int(4),
    han_IsFromRegistration bit(1) NOT NULL
);

CREATE TABLE AccessionNumberEncounterLink (
    hel_ect_EncounterId uniqueidentifier(16) NOT NULL,
    hel_StudyInstanceUid nvarchar(400)
);

CREATE TABLE AccessToken (
    Id int(4) NOT NULL,
    PatientId uniqueidentifier(16) NOT NULL,
    UserId uniqueidentifier(16) NOT NULL,
    DeviceId uniqueidentifier(16) NOT NULL,
    ClaimedAt datetime2(8) NOT NULL,
    ReleasedAt datetime2(8),
    ExpiresAt datetime2(8) NOT NULL
);

CREATE TABLE AccessTokenSetting (
    Id int(4) NOT NULL,
    Name varchar(50) NOT NULL,
    Description varchar(100) NOT NULL,
    Value int(4) NOT NULL
);

CREATE TABLE Accommodation (
    psa_pss_id int(4) NOT NULL,
    psa_lks_accomodation int(4) NOT NULL,
    psa_comments nvarchar(-1)
);

CREATE TABLE AccommodationAssessment (
    Id int(4) NOT NULL,
    CorrectionId int(4),
    Comments nvarchar(2000),
    MeasurementUnit int(4) NOT NULL
);

CREATE TABLE AccommodationAssessmentLog (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    CorrectionId int(4),
    Comments nvarchar(2000),
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    MeasurementUnit int(4) NOT NULL
);

CREATE TABLE AccommodationMeasurement (
    Id int(4) NOT NULL,
    NearLineId int(4),
    NearPointValue int(4),
    AmplitudeValue decimal(5)
);

CREATE TABLE AccommodationMeasurementLog (
    Id int(4) NOT NULL,
    AccommodationAssessmentId int(4) NOT NULL,
    BodyPartId int(4) NOT NULL,
    NearLineId int(4),
    NearPointValue int(4),
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Order int(4) NOT NULL,
    AmplitudeValue decimal(5)
);

CREATE TABLE AcFill (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE AcMaintainer (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE AcMaintainerLog (
    Id int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE ActionType (
    Id int(4) NOT NULL,
    Description nvarchar(40) NOT NULL,
    Code nvarchar(4) NOT NULL
);

CREATE TABLE Activity (
    ActivityId uniqueidentifier(16) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    eta_act_ActivityId uniqueidentifier(16) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    smt_Id int(4) NOT NULL
);

CREATE TABLE activity (
    act_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE Activity (
    aba_Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    ira_id int(4) NOT NULL,
    ira_act_id uniqueidentifier(16) NOT NULL,
    PreparationId int(4) NOT NULL,
    aba_Description nvarchar(500) NOT NULL,
    smt_ect_EncounterId uniqueidentifier(16) NOT NULL,
    PrescriptionIssued bit(1),
    eta_abv_VersionId int(4) NOT NULL,
    UnderstandsConditionResponseId int(4),
    ComplianceToDrops_LookupDataId int(4),
    KnowsHowToAdminister_LookupDataId int(4),
    UnderstandsDiagnosisResponseId int(4),
    MonthsPrescriptionValidFor int(4),
    aba_Name nvarchar(500) NOT NULL,
    SurgicalCompletionId int(4),
    VoucherIssued bit(1),
    UnderstandsEyeAffectedResponseId int(4),
    Comments nvarchar(2000),
    KnowsSignsAndSymptomsResponseId int(4),
    smt_das_SectionId int(4) NOT NULL,
    smt_smr_ReviewTypeId int(4),
    Comments nvarchar(2000),
    smt_smr_HasHiddenQueries bit(1) NOT NULL,
    smt_ShowRemovedSectionWarning bit(1) NOT NULL
);

CREATE TABLE activity (
    act_parent_id uniqueidentifier(16)
);

CREATE TABLE activitybinary (
    abn_id int(4) NOT NULL,
    abn_bod_id int(4) NOT NULL,
    abn_abt_TypeId int(4) NOT NULL,
    abn_mim_id int(4) NOT NULL,
    abn_blb_id uniqueidentifier(16) NOT NULL,
    abn_editablestate nvarchar(-1) NOT NULL,
    abn_description nvarchar(4000),
    abn_creationdate datetime(8),
    abn_deleted bit(1),
    abn_template_id int(4),
    abn_templatetype int(4),
    abn_initialstate varchar(-1),
    abn_drawingcreationoption int(4),
    abn_thumbnail_blb_id uniqueidentifier(16),
    abn_autopopulatelock bit(1) NOT NULL
);

CREATE TABLE ActivityBinaryType (
    abt_id int(4) NOT NULL,
    abt_description nvarchar(60) NOT NULL
);

CREATE TABLE activitycomment (
    acm_id int(4) NOT NULL,
    acm_comment nvarchar(-1)
);

CREATE TABLE activitycommentlog (
    acm_ObjectId int(4) NOT NULL,
    acm_id int(4) NOT NULL,
    acm_act_id uniqueidentifier(16) NOT NULL,
    acm_bod_id int(4) NOT NULL,
    acm_comment nvarchar(-1),
    acm_cty_id int(4),
    acm_DateAdded datetime(8) NOT NULL,
    acm_AddedBy uniqueidentifier(16) NOT NULL,
    acm_TransactionId uniqueidentifier(16) NOT NULL,
    acm_Action char(1) NOT NULL
);

CREATE TABLE activitydocumentlink (
    dac_id int(4) NOT NULL
);

CREATE TABLE activitydrug (
    adr_id int(4) NOT NULL,
    adr_drs_id int(4),
    adr_none bit(1) NOT NULL,
    adr_mcn_id int(4),
    adr_dos_id int(4),
    adr_dro_id int(4),
    adr_dfr_id int(4),
    adr_ddu_id int(4),
    adr_ant_id int(4),
    adr_time time(5),
    adr_order int(4),
    adr_sourceset int(4),
    adr_lks_id_type int(4),
    adr_pdt_expired uniqueidentifier(16),
    adr_batchnumber varchar(255),
    adr_deleted bit(1)
);

CREATE TABLE activitydrugconcept (
    adc_id int(4) NOT NULL,
    adc_concept varchar(255) NOT NULL
);

CREATE TABLE ActivityDrugDuplicateMedicationRemovalBackup (
    adr_id int(4) NOT NULL,
    adr_act_id uniqueidentifier(16) NOT NULL,
    adr_bod_id int(4),
    adr_drs_id int(4),
    adr_adc_id int(4) NOT NULL,
    adr_none bit(1) NOT NULL,
    adr_mcn_id int(4),
    adr_dos_id int(4),
    adr_dro_id int(4),
    adr_dfr_id int(4),
    adr_ddu_id int(4),
    adr_ant_id int(4),
    adr_time time(5),
    adr_order int(4),
    adr_sourceset int(4),
    adr_lks_id_type int(4),
    adr_pdt_expired uniqueidentifier(16),
    adr_batchnumber varchar(255),
    adr_deleted bit(1),
    adr_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE activitydruglog (
    adr_ObjectId int(4) NOT NULL,
    adr_id int(4) NOT NULL,
    adr_act_id uniqueidentifier(16) NOT NULL,
    adr_bod_id int(4),
    adr_drs_id int(4),
    adr_adc_id int(4) NOT NULL,
    adr_none bit(1) NOT NULL,
    adr_dos_id int(4),
    adr_dro_id int(4),
    adr_dfr_id int(4),
    adr_ddu_id int(4),
    adr_ant_id int(4),
    adr_time time(5),
    adr_order int(4),
    adr_sourceset int(4),
    adr_lks_id_type int(4),
    adr_DateAdded datetime(8) NOT NULL,
    adr_AddedBy uniqueidentifier(16) NOT NULL,
    adr_TransactionId uniqueidentifier(16) NOT NULL,
    adr_Action char(1) NOT NULL,
    adr_mcn_id int(4),
    adr_pdt_expired uniqueidentifier(16),
    adr_batchnumber varchar(255),
    adr_deleted bit(1)
);

CREATE TABLE activitygroup (
    acg_id int(4) NOT NULL
);

CREATE TABLE activitygroupitem (
    agi_id int(4) NOT NULL
);

CREATE TABLE ActivityIOPGUID (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE ActivityItem (
    irm_id int(4) NOT NULL,
    irm_lks_Id_Device int(4),
    irm_iro_id_LeftEyeOutcome int(4),
    irm_LeftEyeComments nvarchar(4000),
    irm_iro_id_RightEyeOutcome int(4),
    irm_RightEyeComments nvarchar(4000),
    irm_Deleted bit(1) NOT NULL
);

CREATE TABLE ActivityItemInvestigation (
    irv_Id int(4) NOT NULL,
    irv_irm_id int(4) NOT NULL,
    irv_iri_id int(4) NOT NULL,
    irv_Deleted bit(1) NOT NULL
);

CREATE TABLE ActivityItemInvestigationLog (
    irv_ObjectId int(4) NOT NULL,
    irv_Id int(4) NOT NULL,
    irv_irm_id int(4) NOT NULL,
    irv_iri_id int(4) NOT NULL,
    irv_Deleted bit(1) NOT NULL,
    irv_DateAdded datetime(8) NOT NULL,
    irv_AddedBy uniqueidentifier(16) NOT NULL,
    irv_Transactionid uniqueidentifier(16) NOT NULL,
    irv_Action char(1) NOT NULL
);

CREATE TABLE ActivityItemLog (
    irm_ObjectId int(4) NOT NULL,
    irm_id int(4) NOT NULL,
    irm_ira_id int(4) NOT NULL,
    irm_lks_Id_Device int(4),
    irm_iro_id_LeftEyeOutcome int(4),
    irm_LeftEyeComments nvarchar(4000),
    irm_iro_id_RightEyeOutcome int(4),
    irm_RightEyeComments nvarchar(4000),
    irm_DateAdded datetime(8) NOT NULL,
    irm_AddedBy uniqueidentifier(16) NOT NULL,
    irm_Transactionid uniqueidentifier(16) NOT NULL,
    irm_Action char(1) NOT NULL,
    irm_Deleted bit(1) NOT NULL
);

CREATE TABLE ActivityLaterality (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    BodyPartId int(4) NOT NULL,
    TypeId int(4) NOT NULL,
    Sphere float(8),
    Cylinder float(8),
    Axis float(8),
    SphericalEquivalent float(8),
    Add float(8),
    VisualAcuityId int(4),
    Bvd int(4),
    PrismRange1 decimal(5),
    PrismRange2 decimal(5),
    PrismBase1LookupDataId int(4),
    PrismBase2LookupDataId int(4),
    BalanceLens bit(1)
);

CREATE TABLE ActivityLateralityLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    VisualAcuityId int(4),
    BodyPartId int(4) NOT NULL,
    TypeId int(4) NOT NULL,
    Sphere float(8),
    Cylinder float(8),
    Axis float(8),
    SphericalEquivalent float(8),
    Add float(8),
    Bvd int(4),
    PrismRange1 decimal(5),
    PrismRange2 decimal(5),
    PrismBase1LookupDataId int(4),
    PrismBase2LookupDataId int(4),
    BalanceLens bit(1)
);

CREATE TABLE ActivityLog (
    ActivityId int(4) NOT NULL,
    eta_act_ActivityId int(4) NOT NULL,
    Id int(4) NOT NULL
);

CREATE TABLE activitylog (
    act_ObjectId uniqueidentifier(16) NOT NULL
);

CREATE TABLE ActivityLog (
    smt_Id int(4) NOT NULL,
    ira_ObjectId int(4) NOT NULL,
    aba_Id int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    aba_ObjectId int(4) NOT NULL,
    ira_id int(4) NOT NULL,
    smt_ObjectId int(4) NOT NULL
);

CREATE TABLE activitylog (
    act_id int(4) NOT NULL
);

CREATE TABLE ActivityLog (
    ObjectId uniqueidentifier(16) NOT NULL,
    eta_ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    eta_DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL
);

CREATE TABLE activitylog (
    act_ect_id uniqueidentifier(16)
);

CREATE TABLE ActivityLog (
    smt_DateAdded datetime(8) NOT NULL,
    ira_act_id uniqueidentifier(16) NOT NULL,
    aba_DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    aba_AddedBy uniqueidentifier(16) NOT NULL,
    ira_DateAdded datetime(8) NOT NULL,
    smt_AddedBy uniqueidentifier(16) NOT NULL
);

CREATE TABLE activitylog (
    act_aty_id int(4)
);

CREATE TABLE ActivityLog (
    AddedBy uniqueidentifier(16) NOT NULL,
    eta_AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    eta_Transactionid uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL
);

CREATE TABLE activitylog (
    act_loc_id uniqueidentifier(16)
);

CREATE TABLE ActivityLog (
    smt_Transactionid uniqueidentifier(16) NOT NULL,
    ira_AddedBy uniqueidentifier(16) NOT NULL,
    aba_Transactionid uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    aba_Action char(1) NOT NULL,
    ira_Transactionid uniqueidentifier(16) NOT NULL,
    smt_Action char(1) NOT NULL
);

CREATE TABLE activitylog (
    act_daterecorded datetime(8)
);

CREATE TABLE ActivityLog (
    Action char(1) NOT NULL,
    eta_Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    UnderstandsConditionResponseId int(4),
    eta_abv_VersionId int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL
);

CREATE TABLE activitylog (
    act_datesaved datetime(8)
);

CREATE TABLE ActivityLog (
    smt_ect_EncounterId uniqueidentifier(16) NOT NULL,
    ira_Action char(1) NOT NULL,
    aba_Description nvarchar(500) NOT NULL,
    PreparationId int(4) NOT NULL,
    ComplianceToDrops_LookupDataId int(4),
    KnowsHowToAdminister_LookupDataId int(4),
    SurgicalCompletionId int(4),
    aba_Name nvarchar(500) NOT NULL,
    smt_act_ActivityId uniqueidentifier(16)
);

CREATE TABLE activitylog (
    act_mode int(4) NOT NULL
);

CREATE TABLE ActivityLog (
    PrescriptionIssued bit(1),
    UnderstandsDiagnosisResponseId int(4),
    UnderstandsEyeAffectedResponseId int(4),
    MonthsPrescriptionValidFor int(4)
);

CREATE TABLE activitylog (
    act_status int(4)
);

CREATE TABLE ActivityLog (
    aba_UniqueKey uniqueidentifier(16),
    Comments nvarchar(2000)
);

CREATE TABLE activitylog (
    act_displayset int(4)
);

CREATE TABLE ActivityLog (
    smt_das_SectionId int(4) NOT NULL,
    VoucherIssued bit(1),
    KnowsSignsAndSymptomsResponseId int(4),
    Comments nvarchar(2000),
    smt_smr_ReviewTypeId int(4)
);

CREATE TABLE activitylog (
    act_parent_id uniqueidentifier(16),
    act_DateAdded datetime(8) NOT NULL
);

CREATE TABLE ActivityLog (
    smt_smr_HasHiddenQueries bit(1) NOT NULL,
    smt_ShowRemovedSectionWarning bit(1) NOT NULL
);

CREATE TABLE activitylog (
    act_AddedBy uniqueidentifier(16) NOT NULL,
    act_TransactionId uniqueidentifier(16) NOT NULL,
    act_Action char(1) NOT NULL
);

CREATE TABLE ActivityNurseClinicGUID (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE ActivityOperationIndicationGUID (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE activitypatientcontactdetails (
    apc_id int(4) NOT NULL,
    apc_patientphoneday nvarchar(510),
    apc_patientphoneevening nvarchar(510),
    apc_patientphonemobile nvarchar(510),
    apc_nextofkinsurname nvarchar(510),
    apc_nextofkinforename nvarchar(510),
    apc_nextofkintitle nvarchar(510),
    apc_lks_id_nextofkinrelation int(4),
    apc_nextofkinrelationothertext nvarchar(510),
    apc_nextofkinaddress1 nvarchar(510),
    apc_nextofkinaddress2 nvarchar(510),
    apc_nextofkinaddress3 nvarchar(510),
    apc_nextofkinaddress4 nvarchar(510),
    apc_nextofkinaddress5 nvarchar(510),
    apc_nextofkinpostcode nvarchar(510),
    apc_nextofkinphoneday nvarchar(510),
    apc_nextofkinphoneevening nvarchar(510),
    apc_nextofkinphonemobile nvarchar(510)
);

CREATE TABLE activitypatientcontactdetailslog (
    apc_objectId int(4) NOT NULL,
    apc_id int(4) NOT NULL,
    apc_act_id uniqueidentifier(16) NOT NULL,
    apc_patientphoneday nvarchar(510),
    apc_patientphoneevening nvarchar(510),
    apc_patientphonemobile nvarchar(510),
    apc_nextofkinsurname nvarchar(510),
    apc_nextofkinforename nvarchar(510),
    apc_nextofkintitle nvarchar(510),
    apc_lks_id_nextofkinrelation int(4),
    apc_nextofkinrelationothertext nvarchar(510),
    apc_nextofkinaddress1 nvarchar(510),
    apc_nextofkinaddress2 nvarchar(510),
    apc_nextofkinaddress3 nvarchar(510),
    apc_nextofkinaddress4 nvarchar(510),
    apc_nextofkinaddress5 nvarchar(510),
    apc_nextofkinpostcode nvarchar(510),
    apc_nextofkinphoneday nvarchar(510),
    apc_nextofkinphoneevening nvarchar(510),
    apc_nextofkinphonemobile nvarchar(510),
    apc_dateadded datetime(8) NOT NULL,
    apc_addedby uniqueidentifier(16) NOT NULL,
    apc_transactionid uniqueidentifier(16) NOT NULL,
    apc_action char(1) NOT NULL
);

CREATE TABLE activitypersonnel (
    eap_id int(4) NOT NULL,
    eap_use_id uniqueidentifier(16) NOT NULL,
    eap_acp_id int(4) NOT NULL,
    eap_bod_id int(4) NOT NULL
);

CREATE TABLE activitypersonnellog (
    eap_ObjectId int(4) NOT NULL,
    eap_id int(4) NOT NULL,
    eap_act_id uniqueidentifier(16) NOT NULL,
    eap_use_id uniqueidentifier(16) NOT NULL,
    eap_acp_id int(4) NOT NULL,
    eap_bod_id int(4) NOT NULL,
    eap_DateAdded datetime(8) NOT NULL,
    eap_AddedBy uniqueidentifier(16) NOT NULL,
    eap_TransactionId uniqueidentifier(16) NOT NULL,
    eap_Action char(1) NOT NULL
);

CREATE TABLE ActivityQuery (
    aaq_squ_QueryId int(4) NOT NULL,
    aaq_smt_StudyMonitoringActivityId int(4) NOT NULL
);

CREATE TABLE ActivityReview (
    sar_smt_StudyMonitoringActivityId int(4) NOT NULL,
    sar_act_ActivityId uniqueidentifier(16) NOT NULL,
    sar_bod_BodyPartId int(4) NOT NULL,
    sar_smr_ReviewTypeId int(4) NOT NULL
);

CREATE TABLE ActivityReviewLog (
    sar_smt_StudyMonitoringActivityId int(4) NOT NULL,
    sar_ObjectId int(4) NOT NULL,
    sar_DateAdded datetime(8) NOT NULL,
    sar_AddedBy uniqueidentifier(16) NOT NULL,
    sar_Transactionid uniqueidentifier(16) NOT NULL,
    sar_Action char(1) NOT NULL,
    sar_act_ActivityId uniqueidentifier(16) NOT NULL,
    sar_bod_BodyPartId int(4) NOT NULL,
    sar_smr_ReviewTypeId int(4) NOT NULL
);

CREATE TABLE ActivitySectionVersion (
    asv_abv_ActivityVersionId int(4) NOT NULL,
    asv_svr_SectionVersionId int(4) NOT NULL
);

CREATE TABLE activitytype (
    aty_id int(4) NOT NULL,
    aty_desc varchar(100) NOT NULL,
    aty_title varchar(100) NOT NULL
);

CREATE TABLE ActivityVersion (
    abv_Id int(4) NOT NULL,
    abv_Name nvarchar(200) NOT NULL,
    abv_Description nvarchar(500) NOT NULL
);

CREATE TABLE ActivityVersionLog (
    abv_id int(4) NOT NULL,
    abv_ObjectId int(4) NOT NULL,
    abv_DateAdded datetime(8) NOT NULL,
    abv_AddedBy uniqueidentifier(16) NOT NULL,
    abv_TransactionId uniqueidentifier(16) NOT NULL,
    abv_Action char(1) NOT NULL,
    abv_aba_ActivityId int(4) NOT NULL,
    abv_Name nvarchar(200),
    abv_Description nvarchar(500),
    abv_Version int(4)
);

CREATE TABLE AdditionalData (
    fad_id int(4) NOT NULL,
    fad_fdt_id int(4) NOT NULL,
    fad_lks_id int(4) NOT NULL
);

CREATE TABLE AdditionalDataLog (
    fad_ObjectId int(4) NOT NULL,
    fad_id int(4) NOT NULL,
    fad_fdt_id int(4) NOT NULL,
    fad_pfd_id int(4) NOT NULL,
    fad_lks_id int(4) NOT NULL,
    fad_DateAdded datetime(8) NOT NULL,
    fad_AddedBy uniqueidentifier(16) NOT NULL,
    fad_TransactionId uniqueidentifier(16) NOT NULL,
    fad_Action char(1) NOT NULL
);

CREATE TABLE AdditionalDataType (
    fdt_id int(4) NOT NULL,
    fdt_description nvarchar(510) NOT NULL,
    fdt_formatString nvarchar(510) NOT NULL,
    fdt_separator nvarchar(20) NOT NULL,
    fdt_finalSeparator nvarchar(20),
    fdt_priority int(4) NOT NULL
);

CREATE TABLE AdditionalDisplayOption (
    ado_Id int(4) NOT NULL
);

CREATE TABLE AddLens (
    Id int(4) NOT NULL,
    AddLensValue float(8) NOT NULL
);

CREATE TABLE address (
    add_id uniqueidentifier(16) NOT NULL,
    add_name nvarchar(510),
    add_address1 nvarchar(510),
    add_address2 nvarchar(510),
    add_address3 nvarchar(510),
    add_address4 nvarchar(510),
    add_address5 nvarchar(510),
    add_postcode varchar(255),
    add_prd_PractitionerDataSourceId int(4),
    add_Active bit(1) NOT NULL
);

CREATE TABLE AddressBackup (
    add_id uniqueidentifier(16) NOT NULL,
    add_name nvarchar(510),
    add_address1 nvarchar(510),
    add_address2 nvarchar(510),
    add_address3 nvarchar(510),
    add_address4 nvarchar(510),
    add_address5 nvarchar(510),
    add_postcode varchar(255),
    add_code varchar(255),
    add_CrossDatabaseIdentifier uniqueidentifier(16),
    InsertDateTime datetime(8)
);

CREATE TABLE addresscontact (
    aco_id uniqueidentifier(16) NOT NULL,
    aco_value varchar(255) NOT NULL,
    aco_lks_id_contact int(4) NOT NULL,
    aco_preferred tinyint(1) NOT NULL
);

CREATE TABLE addresscontactlog (
    aco_objectid uniqueidentifier(16) NOT NULL,
    aco_id int(4) NOT NULL,
    aco_add_id uniqueidentifier(16) NOT NULL,
    aco_value varchar(255) NOT NULL,
    aco_lks_id_contact int(4) NOT NULL,
    aco_preferred tinyint(1) NOT NULL,
    aco_dateadded datetime(8) NOT NULL,
    aco_addedby uniqueidentifier(16) NOT NULL,
    aco_transactionid uniqueidentifier(16) NOT NULL,
    aco_action char(1) NOT NULL
);

CREATE TABLE addresslog (
    add_objectid uniqueidentifier(16) NOT NULL,
    add_id int(4) NOT NULL,
    add_name nvarchar(510),
    add_code varchar(255),
    add_address1 nvarchar(510),
    add_address2 nvarchar(510),
    add_address3 nvarchar(510),
    add_address4 nvarchar(510),
    add_address5 nvarchar(510),
    add_postcode varchar(255),
    add_dateadded datetime(8) NOT NULL,
    add_addedby uniqueidentifier(16) NOT NULL,
    add_transactionid uniqueidentifier(16) NOT NULL,
    add_action char(1) NOT NULL,
    add_CrossDatabaseIdentifier uniqueidentifier(16),
    add_prd_PractitionerDataSourceId int(4),
    add_Active bit(1)
);

CREATE TABLE AdHocSeriesRequest (
    asr_Id int(4) NOT NULL,
    asr_SeriesInstanceUid nvarchar(400) NOT NULL,
    asr_StudyInstanceUid nvarchar(400) NOT NULL,
    asr_SubjectId nvarchar(50) NOT NULL,
    asr_SubjectYearOfBirth int(4) NOT NULL,
    asr_DestinationCloudPartnerName nvarchar(200) NOT NULL,
    asr_tri_PreviousRequestIdentifier uniqueidentifier(16) NOT NULL,
    asr_Processed bit(1) NOT NULL,
    asr_ErrorReason nvarchar(2000)
);

CREATE TABLE Adjustment (
    Id int(4) NOT NULL,
    RightAdjustmentPerformed bit(1),
    LeftAdjustmentPerformed bit(1)
);

CREATE TABLE AdjustmentLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    RightAdjustmentPerformed bit(1),
    LeftAdjustmentPerformed bit(1)
);

CREATE TABLE Advancement (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    PseudotendonExcised float(8),
    SutureId int(4),
    MuscleFoundAt float(8) NOT NULL,
    AmountOfAdvancement float(8) NOT NULL,
    AdditionalResection float(8),
    SutureId int(4)
);

CREATE TABLE AdvancementLog (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    SutureId int(4),
    PseudotendonExcised float(8),
    MuscleFoundAt float(8) NOT NULL,
    AmountOfAdvancement float(8) NOT NULL,
    AdditionalResection float(8),
    SutureId int(4)
);

CREATE TABLE AimsOfSurgery (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    PreparationId int(4) NOT NULL,
    PreparationId int(4) NOT NULL,
    AimsOfSurgeryId int(4) NOT NULL,
    AimsOfSurgeryId int(4) NOT NULL
);

CREATE TABLE AimsOfSurgeryLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    PreparationId int(4) NOT NULL,
    PreparationId int(4) NOT NULL,
    AimsOfSurgeryId int(4) NOT NULL,
    AimsOfSurgeryId int(4) NOT NULL
);

CREATE TABLE AlphabetOverlayPattern (
    Id int(4) NOT NULL,
    PatternDescription nvarchar(6) NOT NULL
);

CREATE TABLE anaesthesiatechnique (
    ant_id int(4) NOT NULL,
    ant_desc nvarchar(510),
    ant_drs_id int(4),
    ant_dro_id int(4)
);

CREATE TABLE AnonymisedPatient (
    anp_Id int(4) NOT NULL,
    anp_MessagesQueued datetime(8),
    anp_DataTransferMessagesQueued datetime(8),
    anp_EdcDataTransferred bit(1) NOT NULL,
    anp_SuccessfullyTransferredRequests bit(1) NOT NULL
);

CREATE TABLE AnterionInvestigationVersion (
    eav_iiv_InvestigationItemVersionId int(4) NOT NULL,
    eav_eat_ApplicationTypeId int(4) NOT NULL
);

CREATE TABLE AnterionInvestigationVersionLog (
    eav_iiv_InvestigationItemVersionId int(4) NOT NULL,
    eav_eat_ApplicationTypeId int(4) NOT NULL,
    eav_ObjectId int(4) NOT NULL,
    eav_DateAdded datetime(8) NOT NULL,
    eav_AddedBy uniqueidentifier(16) NOT NULL,
    eav_Transactionid uniqueidentifier(16) NOT NULL,
    eav_Action char(1) NOT NULL
);

CREATE TABLE Antimetabolite (
    gan_Id int(4) NOT NULL,
    gda_id int(4) NOT NULL,
    gda_sft_id int(4) NOT NULL,
    gan_ActivityId uniqueidentifier(16) NOT NULL,
    gan_AntimetaboliteQualifierStrengthId int(4) NOT NULL,
    gda_DrugId int(4),
    gda_RouteId int(4),
    gda_Dose decimal(5),
    gda_Minutes int(4),
    gda_Seconds int(4),
    gda_pqa_id int(4)
);

CREATE TABLE AntimetaboliteDrugStrengthUnitRecording (
    gad_Id int(4) NOT NULL,
    gad_Value decimal(5)
);

CREATE TABLE AntimetaboliteDrugStrengthUnitRecordingLog (
    gad_Id int(4) NOT NULL,
    gad_ObjectId int(4) NOT NULL,
    gad_AntimetaboliteId int(4) NOT NULL,
    gad_DrugUnitOfMeasureId int(4) NOT NULL,
    gad_Value decimal(5),
    gad_DateAdded datetime(8) NOT NULL,
    gad_AddedBy uniqueidentifier(16) NOT NULL,
    gad_Transactionid uniqueidentifier(16) NOT NULL,
    gad_Action char(1) NOT NULL
);

CREATE TABLE AntimetaboliteLog (
    gan_Id int(4) NOT NULL,
    gda_id int(4) NOT NULL,
    gda_ObjectId int(4) NOT NULL,
    gan_ObjectId int(4) NOT NULL,
    gan_ActivityId uniqueidentifier(16) NOT NULL,
    gda_DateAdded datetime(8) NOT NULL,
    gda_AddedBy uniqueidentifier(16) NOT NULL,
    gan_AntimetaboliteQualifierStrengthId int(4) NOT NULL,
    gan_DateAdded datetime(8) NOT NULL,
    gda_Transactionid uniqueidentifier(16) NOT NULL,
    gda_Action char(1) NOT NULL,
    gan_AddedBy uniqueidentifier(16) NOT NULL,
    gan_Transactionid uniqueidentifier(16) NOT NULL,
    gda_sft_id int(4) NOT NULL,
    gda_DrugId int(4),
    gan_Action char(1) NOT NULL,
    gda_RouteId int(4),
    gda_Dose decimal(5),
    gda_Minutes int(4),
    gda_Seconds int(4),
    gda_pqa_id int(4)
);

CREATE TABLE apicachemanager (
    amr_methodhash varchar(255) NOT NULL,
    amr_filehash varchar(255) NOT NULL
);

CREATE TABLE ApplicableTestType (
    Id int(4) NOT NULL,
    Name nvarchar(200) NOT NULL
);

CREATE TABLE Application (
    eaa_Id int(4) NOT NULL,
    eaa_Name nvarchar(510) NOT NULL,
    eaa_eat_ApplicationTypeId int(4) NOT NULL,
    eaa_eam_ApplicationMethodId int(4) NOT NULL,
    eaa_Enabled bit(1) NOT NULL,
    eaa_TextBasedFile bit(1),
    eaa_blb_Id_IconBinary uniqueidentifier(16),
    eaa_GenderMaleIdentifier nvarchar(510),
    eaa_GenderFemaleIdentifier nvarchar(510),
    eaa_GenderNotKnownIdentifier nvarchar(510),
    eaa_GenderNotSpecifiedIdentifier nvarchar(510),
    eaa_IconTooltip nvarchar(2000) NOT NULL,
    eaa_ForceClose bit(1),
    eaa_ClosePatientCommand nvarchar(510),
    eaa_CloseApplicationCommand nvarchar(510),
    eaa_ShowOnApplicationsScreen bit(1) NOT NULL,
    eaa_ShowOnEncounter bit(1) NOT NULL,
    eaa_ButtonText nvarchar(50),
    eaa_Label nvarchar(50),
    eaa_epc_PreConfigurationId int(4)
);

CREATE TABLE ApplicationExeDetail (
    aed_Id int(4) NOT NULL,
    aed_eaa_ApplicationId int(4) NOT NULL,
    aed_Filepath nvarchar(2000) NOT NULL,
    aed_Parameters nvarchar(2000),
    aed_TextBasedFileType nvarchar(20),
    aed_TextBasedFileName nvarchar(510),
    aed_TextBasedFileContent nvarchar(1000),
    aed_TextBasedFilePath nvarchar(1000),
    aed_CleanUpTimeSeconds int(4),
    aed_RelaunchIfAlreadyOpen bit(1) NOT NULL,
    aed_TextBasedEncodingCode int(4)
);

CREATE TABLE ApplicationExeDetailLog (
    aed_ObjectId int(4) NOT NULL,
    aed_Id int(4) NOT NULL,
    aed_eaa_ApplicationId int(4) NOT NULL,
    aed_Filepath nvarchar(2000) NOT NULL,
    aed_Parameters nvarchar(2000),
    aed_DateAdded datetime(8) NOT NULL,
    aed_AddedBy uniqueidentifier(16) NOT NULL,
    aed_Transactionid uniqueidentifier(16) NOT NULL,
    aed_Action char(1) NOT NULL,
    aed_TextBasedFileType nvarchar(20),
    aed_TextBasedFileName nvarchar(510),
    aed_TextBasedFileContent nvarchar(1000),
    aed_TextBasedFilePath nvarchar(1000),
    aed_CleanUpTimeSeconds int(4),
    aed_RelaunchIfAlreadyOpen bit(1),
    aed_TextBasedEncodingCode int(4)
);

CREATE TABLE ApplicationGroup (
    eag_Id int(4) NOT NULL,
    eag_grp_Id uniqueidentifier(16) NOT NULL,
    eag_eaa_Id int(4) NOT NULL
);

CREATE TABLE ApplicationGroupLog (
    eag_ObjectId int(4) NOT NULL,
    eag_Id int(4) NOT NULL,
    eag_grp_Id uniqueidentifier(16),
    eag_eaa_Id int(4),
    eag_DateAdded datetime(8) NOT NULL,
    eag_AddedBy uniqueidentifier(16) NOT NULL,
    eag_Transactionid uniqueidentifier(16) NOT NULL,
    eag_Action char(1) NOT NULL
);

CREATE TABLE ApplicationInterfaceType (
    ait_Id int(4) NOT NULL,
    ait_eaa_ApplicationId int(4) NOT NULL
);

CREATE TABLE ApplicationInterfaceTypeLog (
    ait_id int(4) NOT NULL,
    ait_ObjectId int(4) NOT NULL,
    ait_DateAdded datetime(8) NOT NULL,
    ait_AddedBy uniqueidentifier(16) NOT NULL,
    ait_TransactionId uniqueidentifier(16) NOT NULL,
    ait_Action char(1) NOT NULL,
    ait_eaa_ApplicationId int(4) NOT NULL,
    ait_ity_InterfaceTypeId int(4) NOT NULL
);

CREATE TABLE ApplicationLog (
    eaa_ObjectId int(4) NOT NULL,
    eaa_Id int(4) NOT NULL,
    eaa_Name nvarchar(510) NOT NULL,
    eaa_eat_ApplicationTypeId int(4) NOT NULL,
    eaa_eam_ApplicationMethodId int(4) NOT NULL,
    eaa_Enabled bit(1) NOT NULL,
    eaa_TextBasedFile bit(1),
    eaa_blb_Id_IconBinary uniqueidentifier(16),
    eaa_DateAdded datetime(8) NOT NULL,
    eaa_AddedBy uniqueidentifier(16) NOT NULL,
    eaa_Transactionid uniqueidentifier(16) NOT NULL,
    eaa_Action char(1) NOT NULL,
    eaa_GenderMaleIdentifier nvarchar(510),
    eaa_GenderFemaleIdentifier nvarchar(510),
    eaa_GenderNotKnownIdentifier nvarchar(510),
    eaa_GenderNotSpecifiedIdentifier nvarchar(510),
    eaa_IconTooltip nvarchar(2000),
    eaa_ForceClose bit(1),
    eaa_ClosePatientCommand nvarchar(510),
    eaa_CloseApplicationCommand nvarchar(510),
    eaa_ShowOnApplicationsScreen bit(1),
    eaa_ShowOnEncounter bit(1),
    eaa_ButtonText nvarchar(50),
    eaa_Label nvarchar(50),
    eaa_epc_PreConfigurationId int(4)
);

CREATE TABLE ApplicationMethod (
    eam_Id int(4) NOT NULL,
    eam_Description nvarchar(510) NOT NULL
);

CREATE TABLE applicationstring (
    ast_id int(4) NOT NULL,
    ast_string nvarchar(-1),
    ast_htmlstring nvarchar(8000)
);

CREATE TABLE ApplicationType (
    hat_Id int(4) NOT NULL,
    eat_Id int(4) NOT NULL,
    eat_Id int(4) NOT NULL,
    eat_Description nvarchar(500) NOT NULL,
    eat_Description nvarchar(510) NOT NULL
);

CREATE TABLE ApplicationUrlDetail (
    aud_Id int(4) NOT NULL,
    aud_eaa_ApplicationId int(4) NOT NULL,
    aud_ebt_BrowserTypeId int(4) NOT NULL,
    aud_Url nvarchar(1000) NOT NULL
);

CREATE TABLE ApplicationUrlDetailLog (
    aud_Id int(4) NOT NULL,
    aud_ObjectId int(4) NOT NULL,
    aud_eaa_ApplicationId int(4) NOT NULL,
    aud_ebt_BrowserTypeId int(4) NOT NULL,
    aud_Url nvarchar(1000) NOT NULL,
    aud_DateAdded datetime(8) NOT NULL,
    aud_AddedBy uniqueidentifier(16) NOT NULL,
    aud_Transactionid uniqueidentifier(16) NOT NULL,
    aud_Action char(1) NOT NULL
);

CREATE TABLE Appointment (
    app_ect_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE AppointmentIdentifier (
    aid_id int(4) NOT NULL
);

CREATE TABLE AppointmentIdentifierLog (
    aid_Id int(4) NOT NULL,
    aid_csc_id int(4) NOT NULL,
    aid_idt_TypeId int(4) NOT NULL,
    aid_value nvarchar(40),
    aid_TypeOther nvarchar(100),
    aid_ObjectId int(4) NOT NULL,
    aid_DateAdded datetime(8) NOT NULL,
    aid_AddedBy uniqueidentifier(16) NOT NULL,
    aid_TransactionId uniqueidentifier(16) NOT NULL,
    aid_Action char(1) NOT NULL
);

CREATE TABLE AppointmentLog (
    app_ect_id int(4) NOT NULL,
    app_ObjectId uniqueidentifier(16) NOT NULL,
    app_DateAdded datetime(8) NOT NULL,
    app_AddedBy uniqueidentifier(16) NOT NULL,
    app_Transactionid uniqueidentifier(16) NOT NULL,
    app_Action char(1) NOT NULL,
    app_ppr_id int(4) NOT NULL,
    app_pat_id uniqueidentifier(16) NOT NULL,
    app_plc_id int(4) NOT NULL,
    app_act_ArrivalId uniqueidentifier(16),
    app_IsDeleted bit(1) NOT NULL,
    app_use_LockedByUser uniqueidentifier(16)
);

CREATE TABLE AppointmentStepStatus (
    ass_app_id uniqueidentifier(16) NOT NULL,
    ass_sst_id int(4) NOT NULL,
    ass_sps_id int(4) NOT NULL,
    ass_use_InProgressWith uniqueidentifier(16)
);

CREATE TABLE AppointmentStepStatusLog (
    ass_app_id int(4) NOT NULL,
    ass_ObjectId uniqueidentifier(16) NOT NULL,
    ass_DateAdded datetime(8) NOT NULL,
    ass_AddedBy uniqueidentifier(16) NOT NULL,
    ass_Transactionid uniqueidentifier(16) NOT NULL,
    ass_Action char(1) NOT NULL,
    ass_sst_id int(4) NOT NULL,
    ass_sps_id int(4) NOT NULL,
    ass_use_InProgressWith uniqueidentifier(16)
);

CREATE TABLE AppointmentType (
    apy_id int(4) NOT NULL,
    apy_description nvarchar(2000) NOT NULL,
    apy_available bit(1) NOT NULL
);

CREATE TABLE AppointmentTypeLog (
    apy_Id int(4) NOT NULL,
    apy_description nvarchar(2000) NOT NULL,
    apy_available bit(1) NOT NULL,
    apy_ObjectId int(4) NOT NULL,
    apy_DateAdded datetime(8) NOT NULL,
    apy_AddedBy uniqueidentifier(16) NOT NULL,
    apy_TransactionId uniqueidentifier(16) NOT NULL,
    apy_Action char(1) NOT NULL
);

CREATE TABLE ArgonLaserTrabeculoplasty (
    ald_sdf_id int(4) NOT NULL,
    alt_ActivityId uniqueidentifier(16) NOT NULL,
    alt_SpotSize int(4),
    ald_SpotSize int(4),
    ald_PowerOfLaser int(4),
    alt_Variable bit(1) NOT NULL,
    alt_MinimumPowerOflaser int(4) NOT NULL,
    ald_Duration int(4),
    alt_MaximumPowerOflaser int(4),
    alt_MinimumDuration int(4) NOT NULL,
    alt_MaximumDuration int(4),
    alt_TotalEnergy decimal(5)
);

CREATE TABLE ArgonLaserTrabeculoplastyLog (
    alt_ActivityId int(4) NOT NULL,
    ald_sdf_id int(4) NOT NULL,
    ald_ObjectId int(4) NOT NULL,
    alt_ObjectId uniqueidentifier(16) NOT NULL,
    alt_DateAdded datetime(8) NOT NULL,
    ald_DateAdded datetime(8) NOT NULL,
    ald_AddedBy uniqueidentifier(16) NOT NULL,
    alt_AddedBy uniqueidentifier(16) NOT NULL,
    alt_Transactionid uniqueidentifier(16) NOT NULL,
    ald_Transactionid uniqueidentifier(16) NOT NULL,
    ald_Action char(1) NOT NULL,
    alt_Action char(1) NOT NULL,
    alt_SpotSize int(4),
    ald_SpotSize int(4),
    ald_PowerOfLaser int(4),
    alt_Variable bit(1) NOT NULL,
    alt_MinimumPowerOflaser int(4) NOT NULL,
    ald_Duration int(4),
    alt_MaximumPowerOflaser int(4),
    alt_MinimumDuration int(4) NOT NULL,
    alt_MaximumDuration int(4),
    alt_TotalEnergy decimal(5)
);

CREATE TABLE ArrivalAndFinishTime (
    arr_act_id uniqueidentifier(16) NOT NULL,
    arr_ArrivalTime time(5),
    arr_IsDidNotAttend bit(1) NOT NULL,
    arr_lks_DidNotAttendReasonId int(4),
    arr_DidNotAttendAdditionalText nvarchar(1000),
    arr_FinishTime time(5)
);

CREATE TABLE ArrivalAndFinishTimeLog (
    arr_act_id int(4) NOT NULL,
    arr_ObjectId uniqueidentifier(16) NOT NULL,
    arr_DateAdded datetime(8) NOT NULL,
    arr_AddedBy uniqueidentifier(16) NOT NULL,
    arr_Transactionid uniqueidentifier(16) NOT NULL,
    arr_Action char(1) NOT NULL,
    arr_ArrivalTime time(5),
    arr_FinishTime time(5),
    arr_IsDidNotAttend bit(1) NOT NULL,
    arr_lks_DidNotAttendReasonId int(4),
    arr_DidNotAttendAdditionalText nvarchar(1000)
);

CREATE TABLE ascan (
    asc_id int(4) NOT NULL,
    asc_bod_id int(4) NOT NULL,
    asc_lks_id_machine int(4),
    asc_axiallength float(8),
    asc_acdepth float(8),
    asc_lensthickness float(8),
    asc_snr float(8),
    asc_lks_id_lensstatus int(4)
);

CREATE TABLE ascanlog (
    asc_ObjectId int(4) NOT NULL,
    asc_id int(4) NOT NULL,
    asc_act_id uniqueidentifier(16) NOT NULL,
    asc_bod_id int(4) NOT NULL,
    asc_lks_id_machine int(4),
    asc_axiallength float(8),
    asc_acdepth float(8),
    asc_lensthickness float(8),
    asc_snr float(8),
    asc_DateAdded datetime(8) NOT NULL,
    asc_AddedBy uniqueidentifier(16) NOT NULL,
    asc_TransactionId uniqueidentifier(16) NOT NULL,
    asc_Action char(1) NOT NULL,
    asc_lks_id_lensstatus int(4)
);

CREATE TABLE AssessmentType (
    cat_Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    cat_Name nvarchar(510) NOT NULL,
    ClinicTypeId int(4),
    IsActive bit(1) NOT NULL,
    Order int(4) NOT NULL
);

CREATE TABLE AssessmentTypeLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Name nvarchar(100) NOT NULL,
    ClinicTypeId int(4),
    IsActive bit(1) NOT NULL,
    Order int(4) NOT NULL,
    StaticId int(4)
);

CREATE TABLE AttachmentReview (
    smh_doc_SystemDocumentId uniqueidentifier(16) NOT NULL,
    smh_smt_StudyMonitoringActivityId int(4) NOT NULL,
    smh_smr_ReviewTypeId int(4) NOT NULL
);

CREATE TABLE AttachmentReviewLog (
    smh_doc_SystemDocumentId int(4) NOT NULL,
    smh_ObjectId uniqueidentifier(16) NOT NULL,
    smh_DateAdded datetime(8) NOT NULL,
    smh_AddedBy uniqueidentifier(16) NOT NULL,
    smh_TransactionId uniqueidentifier(16) NOT NULL,
    smh_Action char(1) NOT NULL,
    smh_smt_StudyMonitoringActivityId int(4) NOT NULL,
    smh_smr_ReviewTypeId int(4) NOT NULL
);

CREATE TABLE Audit (
    AuditId int(4) NOT NULL,
    AuditOverviewId int(4) NOT NULL,
    InsertDateTime datetime(8) NOT NULL,
    ErrorOutputId int(4),
    AuditStatusId tinyint(1) NOT NULL
);

CREATE TABLE AuditFile (
    AuditFileId int(4) NOT NULL,
    PatchSyntax varchar(-1)
);

CREATE TABLE AuditOverview (
    AuditOverviewId int(4) NOT NULL,
    ReleaseVersion varchar(30),
    StartedOn datetime(8) NOT NULL,
    CompletedOn datetime(8),
    PatchRunStatusId tinyint(1) NOT NULL
);

CREATE TABLE AuditStatus (
    AuditStatusId tinyint(1) NOT NULL
);

CREATE TABLE audittrailtables (
    att_id int(4) NOT NULL,
    att_name varchar(255),
    att_prefix varchar(3),
    att_flag int(4)
);

CREATE TABLE BandageContactLens (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL
);

CREATE TABLE BandageContactLensLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL,
    StaticId int(4)
);

CREATE TABLE BaudRate (
    sbr_id int(4) NOT NULL
);

CREATE TABLE beavrsmacularhole (
    bmh_id int(4) NOT NULL,
    bmh_idiopathic bit(1) NOT NULL,
    bmh_lks_id_stage int(4) NOT NULL,
    bmh_bod_id int(4) NOT NULL,
    bmh_bhd_id int(4)
);

CREATE TABLE beavrsmacularholedetails (
    bhd_id int(4) NOT NULL,
    bhd_lks_id_vitreofovealattachment int(4) NOT NULL,
    bhd_internalholediameter int(4) NOT NULL,
    bhd_basalholediameter int(4),
    bhd_lks_id_vitreous int(4) NOT NULL,
    bhd_lks_id_ilmpeel int(4) NOT NULL,
    bhd_symptomonsetdate datetime(8),
    bhd_attachedretinabreaks int(4),
    bhd_retinalbreaksat int(4),
    bhd_largestretinalbreaksize decimal(5),
    bhd_nosymptoms bit(1)
);

CREATE TABLE beavrsmacularholedetailslog (
    bhd_ObjectId int(4) NOT NULL,
    bhd_id int(4) NOT NULL,
    bhd_lks_id_vitreofovealattachment int(4) NOT NULL,
    bhd_internalholediameter int(4) NOT NULL,
    bhd_basalholediameter int(4),
    bhd_lks_id_vitreous int(4) NOT NULL,
    bhd_lks_id_ilmpeel int(4) NOT NULL,
    bhd_symptomonsetdate datetime(8),
    bhd_attachedretinabreaks int(4),
    bhd_retinalbreaksat int(4),
    bhd_largestretinalbreaksize decimal(5),
    bhd_nosymptoms bit(1),
    bhd_DateAdded datetime(8) NOT NULL,
    bhd_AddedBy uniqueidentifier(16) NOT NULL,
    bhd_TransactionId uniqueidentifier(16) NOT NULL,
    bhd_Action char(1) NOT NULL
);

CREATE TABLE beavrsmacularholelog (
    bmh_ObjectId int(4) NOT NULL,
    bmh_id int(4) NOT NULL,
    bmh_idiopathic bit(1) NOT NULL,
    bmh_lks_id_stage int(4) NOT NULL,
    bmh_act_id uniqueidentifier(16) NOT NULL,
    bmh_bod_id int(4) NOT NULL,
    bmh_bhd_id int(4),
    bmh_DateAdded datetime(8) NOT NULL,
    bmh_AddedBy uniqueidentifier(16) NOT NULL,
    bmh_TransactionId uniqueidentifier(16) NOT NULL,
    bmh_Action char(1) NOT NULL
);

CREATE TABLE beavrsretinaldetachment (
    brd_id int(4) NOT NULL,
    brd_primaryretinaldetachment bit(1) NOT NULL,
    brd_bod_id int(4) NOT NULL,
    brd_bdd_id int(4)
);

CREATE TABLE beavrsretinaldetachmentdetails (
    bdd_id int(4) NOT NULL,
    bdd_retinaldetachmentat int(4) NOT NULL,
    bdd_lks_id_fovealattachment int(4) NOT NULL,
    bdd_chronic bit(1) NOT NULL,
    bdd_lks_id_pvrgrade int(4) NOT NULL,
    bdd_pvranterior int(4),
    bdd_pvrposterior int(4),
    bdd_lks_id_vitreous int(4),
    bdd_lks_id_vitreoushaemorrhage int(4) NOT NULL,
    bdd_choroidaleffusion bit(1) NOT NULL,
    bdd_pathologicalmyopia bit(1),
    bdd_latticedegeneration bit(1),
    bdd_latticedegenerationat int(4),
    bdd_priorretinaldetachmentsurgery bit(1) NOT NULL,
    bdd_initialsurgerydate datetime(8),
    bdd_lks_id_causeoffailure int(4),
    bdd_symptomonsetdate date(3),
    bdd_centralvisionlossonsetdate date(3),
    bdd_lks_id_systemiccondition int(4),
    bdd_detachedretinabreaks int(4) NOT NULL,
    bdd_attachedretinabreaks int(4) NOT NULL,
    bdd_retinalbreaksat int(4),
    bdd_lks_id_largestretinalbreaktype int(4),
    bdd_largestretinalbreaksize decimal(5),
    bdd_subretinalbands int(4),
    bdd_nocentralvisionloss bit(1),
    bdd_nosymptoms bit(1)
);

CREATE TABLE beavrsretinaldetachmentdetailslog (
    bdd_ObjectId int(4) NOT NULL,
    bdd_id int(4) NOT NULL,
    bdd_retinaldetachmentat int(4) NOT NULL,
    bdd_lks_id_fovealattachment int(4) NOT NULL,
    bdd_chronic bit(1) NOT NULL,
    bdd_lks_id_pvrgrade int(4) NOT NULL,
    bdd_pvranterior int(4),
    bdd_pvrposterior int(4),
    bdd_lks_id_vitreous int(4),
    bdd_lks_id_vitreoushaemorrhage int(4) NOT NULL,
    bdd_choroidaleffusion bit(1) NOT NULL,
    bdd_pathologicalmyopia bit(1),
    bdd_latticedegeneration bit(1),
    bdd_latticedegenerationat int(4),
    bdd_priorretinaldetachmentsurgery bit(1) NOT NULL,
    bdd_initialsurgerydate datetime(8),
    bdd_lks_id_causeoffailure int(4),
    bdd_symptomonsetdate date(3),
    bdd_centralvisionlossonsetdate date(3),
    bdd_lks_id_systemiccondition int(4),
    bdd_detachedretinabreaks int(4) NOT NULL,
    bdd_attachedretinabreaks int(4) NOT NULL,
    bdd_retinalbreaksat int(4),
    bdd_lks_id_largestretinalbreaktype int(4),
    bdd_largestretinalbreaksize decimal(5),
    bdd_subretinalbands int(4),
    bdd_nocentralvisionloss bit(1),
    bdd_nosymptoms bit(1),
    bdd_DateAdded datetime(8) NOT NULL,
    bdd_AddedBy uniqueidentifier(16) NOT NULL,
    bdd_TransactionId uniqueidentifier(16) NOT NULL,
    bdd_Action char(1) NOT NULL
);

CREATE TABLE beavrsretinaldetachmentlog (
    brd_ObjectId int(4) NOT NULL,
    brd_id int(4) NOT NULL,
    brd_primaryretinaldetachment bit(1) NOT NULL,
    brd_act_id uniqueidentifier(16) NOT NULL,
    brd_bod_id int(4) NOT NULL,
    brd_bdd_id int(4),
    brd_DateAdded datetime(8) NOT NULL,
    brd_AddedBy uniqueidentifier(16) NOT NULL,
    brd_TransactionId uniqueidentifier(16) NOT NULL,
    brd_Action char(1) NOT NULL
);

CREATE TABLE Bifoveal (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    Comments nvarchar(5000),
    Prism int(4),
    PrismDirection int(4),
    Correction int(4),
    Result int(4)
);

CREATE TABLE BifovealLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    Comments nvarchar(5000),
    Prism int(4),
    PrismDirection int(4),
    Correction int(4),
    Result int(4)
);

CREATE TABLE BilirubinData (
    ubl_id int(4) NOT NULL,
    ubl_available bit(1) NOT NULL
);

CREATE TABLE BillingChargeMappingDrugDuplicateMedicationRemovalBackup (
    bmd_Id int(4) NOT NULL,
    bmd_bic_ChargeId int(4) NOT NULL,
    bmd_mcn_MedicationElementId int(4) NOT NULL,
    bmd_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE BinaryDocument (
    Id int(4) NOT NULL
);

CREATE TABLE binarydocument (
    bdc_id int(4) NOT NULL
);

CREATE TABLE BinaryDocument (
    SystemDocumentId uniqueidentifier(16) NOT NULL,
    Content varbinary(-1) NOT NULL
);

CREATE TABLE binarydocument (
    bdc_mim_id int(4) NOT NULL
);

CREATE TABLE BinaryDocument (
    MimeTypeId int(4) NOT NULL,
    PageNumber int(4) NOT NULL,
    DateCreated datetime2(6) NOT NULL
);

CREATE TABLE binarydocument (
    bdc_renamedto varchar(255),
    bdc_filedatetime datetime(8),
    bdc_dtp_id int(4),
    bdc_LegacyFileSystemStorage bit(1) NOT NULL,
    bdc_LegacyFileAvailableForMigration bit(1) NOT NULL
);

CREATE TABLE binarydocumentlog (
    bdc_objectId int(4) NOT NULL,
    bdc_id int(4) NOT NULL,
    bdc_doc_id uniqueidentifier(16) NOT NULL,
    bdc_version int(4) NOT NULL,
    bdc_mim_id int(4) NOT NULL,
    bdc_bod_id int(4),
    bdc_blb_id uniqueidentifier(16) NOT NULL,
    bdc_renamedto varchar(255),
    bdc_originalpath varchar(255),
    bdc_filedatetime datetime(8),
    bdc_dtp_id int(4),
    bdc_blb_readonlyid uniqueidentifier(16),
    bdc_dateadded datetime(8) NOT NULL,
    bdc_addedby uniqueidentifier(16) NOT NULL,
    bdc_transactionid uniqueidentifier(16) NOT NULL,
    bdc_action char(1) NOT NULL,
    bdc_publicversion int(4),
    bdc_LegacyFileSystemStorage bit(1) NOT NULL,
    bdc_LegacyFileAvailableForMigration bit(1) NOT NULL
);

CREATE TABLE BinaryDocumentRecipientCopy (
    BinaryDocumentId int(4) NOT NULL,
    DocumentRecipientId int(4) NOT NULL,
    BlobId uniqueidentifier(16) NOT NULL,
    ReadonlyBlobId uniqueidentifier(16)
);

CREATE TABLE BinaryDocumentRecipientCopyLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    DocumentRecipientId int(4) NOT NULL,
    BlobId uniqueidentifier(16) NOT NULL,
    ReadonlyBlobId uniqueidentifier(16)
);

CREATE TABLE blobrepository (
    blb_id uniqueidentifier(16) NOT NULL,
    blb_image varbinary(-1),
    blb_mim_id int(4)
);

CREATE TABLE BloodData (
    ubd_id int(4) NOT NULL,
    ubd_available bit(1) NOT NULL
);

CREATE TABLE bodypart (
    bod_id int(4) NOT NULL,
    bod_code varchar(255) NOT NULL,
    bod_desc nvarchar(510),
    bod_number int(4) NOT NULL,
    bod_dro_id int(4),
    bod_cpt_id int(4),
    bod_available bit(1) NOT NULL
);

CREATE TABLE BodySystem (
    rbs_id int(4) NOT NULL,
    rbs_bsm_id int(4) NOT NULL,
    rbs_comments nvarchar(-1),
    rbs_order tinyint(1)
);

CREATE TABLE BodySystemLog (
    rbs_ObjectId int(4) NOT NULL,
    rbs_id int(4) NOT NULL,
    rbs_ros_id int(4) NOT NULL,
    rbs_bsm_id int(4) NOT NULL,
    rbs_comments nvarchar(-1),
    rbs_order tinyint(1),
    rbs_DateAdded datetime(8) NOT NULL,
    rbs_AddedBy uniqueidentifier(16) NOT NULL,
    rbs_TransactionId uniqueidentifier(16) NOT NULL,
    rbs_Action char(1) NOT NULL
);

CREATE TABLE BotulinumToxin (
    SubSectionId int(4) NOT NULL,
    Id int(4) NOT NULL,
    BodyPartId int(4) NOT NULL,
    Units float(8),
    TechniqueId int(4),
    TechniqueId int(4) NOT NULL,
    DrugId int(4) NOT NULL,
    DrugId int(4),
    ActivityId uniqueidentifier(16) NOT NULL,
    Comments nvarchar(1000)
);

CREATE TABLE BotulinumToxinDrug (
    Id int(4) NOT NULL,
    Description nvarchar(1000) NOT NULL
);

CREATE TABLE BotulinumToxinLog (
    Id int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    BodyPartId int(4) NOT NULL,
    Units float(8),
    TechniqueId int(4),
    TechniqueId int(4) NOT NULL,
    DrugId int(4) NOT NULL,
    DrugId int(4),
    ActivityId uniqueidentifier(16) NOT NULL,
    Comments nvarchar(1000)
);

CREATE TABLE BotulinumToxinTechnique (
    Id int(4) NOT NULL,
    Description nvarchar(1000) NOT NULL
);

CREATE TABLE BrowserType (
    ebt_Id int(4) NOT NULL,
    ebt_Name nvarchar(200) NOT NULL,
    ebt_Available bit(1) NOT NULL
);

CREATE TABLE bulkpatientload (
    PatientNo varchar(50),
    NhsNo varchar(50),
    NHSNumberStatusCode varchar(50),
    Title varchar(50),
    Surname varchar(50),
    Forenames varchar(50),
    MaritalStatus varchar(50),
    Sex varchar(50),
    Dob varchar(50),
    Address1 varchar(800),
    Address2 varchar(800),
    Address3 varchar(200),
    Address4 varchar(200),
    Address5 varchar(200),
    PostCode varchar(50),
    HomeTelephone varchar(50),
    WorkTelephone varchar(50),
    MobileTelephone varchar(50),
    DeathDate varchar(50),
    Deceased varchar(50),
    GPCode varchar(50),
    GPPracticeCode varchar(50),
    GPPracticeName varchar(50),
    GPName varchar(50),
    GPTitle varchar(50),
    GPInitials varchar(50),
    GPSurname varchar(50),
    GPAddress1 varchar(50),
    GPAddress2 varchar(50),
    GPAddress3 varchar(50),
    GPAddress4 varchar(50),
    GPAddress5 varchar(50),
    GPPostCode varchar(50),
    GPTelephone1 varchar(50),
    GPTelephone2 varchar(50),
    Religion varchar(50),
    EthnicOrigin varchar(50),
    OptedOut varchar(50),
    Merged varchar(50),
    MergedTo varchar(50)
);

CREATE TABLE Calculation (
    rpc_Id int(4) NOT NULL,
    rpc_use_UserId uniqueidentifier(16) NOT NULL,
    rpc_DateTime datetime2(6) NOT NULL,
    rpc_ect_EncounterId uniqueidentifier(16),
    rpc_pln_PatientClinicalPlanId int(4)
);

CREATE TABLE CalculationLog (
    rpc_Id int(4) NOT NULL,
    rpc_ObjectId int(4) NOT NULL,
    rpc_pat_PatientId uniqueidentifier(16) NOT NULL,
    rpc_use_UserId uniqueidentifier(16) NOT NULL,
    rpc_DateTime datetime2(6) NOT NULL,
    rpc_ect_EncounterId uniqueidentifier(16),
    rpc_ppr_PatientClinicalPlanRootId int(4),
    rpc_pln_PatientClinicalPlanId int(4),
    rpc_DateAdded datetime(8) NOT NULL,
    rpc_AddedBy uniqueidentifier(16) NOT NULL,
    rpc_Transactionid uniqueidentifier(16) NOT NULL,
    rpc_Action char(1) NOT NULL
);

CREATE TABLE CarePathwayDefaultStep (
    pds_id int(4) NOT NULL,
    pds_description nvarchar(510) NOT NULL,
    pds_cpw_id int(4) NOT NULL,
    pds_stp_id int(4) NOT NULL,
    pds_order int(4) NOT NULL,
    pds_active bit(1) NOT NULL,
    pds_IsPreArrival bit(1) NOT NULL
);

CREATE TABLE CarePathwayDefaultStepLog (
    pds_Id int(4) NOT NULL,
    pds_description nvarchar(510),
    pds_cpw_id int(4) NOT NULL,
    pds_stp_id int(4) NOT NULL,
    pds_order int(4) NOT NULL,
    pds_active bit(1) NOT NULL,
    pds_ObjectId int(4) NOT NULL,
    pds_DateAdded datetime(8) NOT NULL,
    pds_AddedBy uniqueidentifier(16) NOT NULL,
    pds_TransactionId uniqueidentifier(16) NOT NULL,
    pds_Action char(1) NOT NULL,
    pds_IsPreArrival bit(1)
);

CREATE TABLE cataract (
    cat_id int(4) NOT NULL,
    cat_eyeopnumber int(4),
    cat_lks_id_iolposition int(4),
    cat_iollensinserted bit(1),
    cat_lks_id_corticalclearance int(4),
    cat_lks_id_nucleusdelivery int(4),
    cat_lks_id_capsulotomy int(4),
    cat_lks_id_woundclosure int(4),
    cat_lks_id_incisionsite int(4),
    cat_incisionlength float(8),
    cat_incisionmeridian int(4),
    cat_lks_id_phacomachine int(4),
    cat_phacotime time(5),
    cat_phacopower tinyint(1),
    cat_effectivephacotime time(5),
    cat_miochol bit(1),
    cat_predpostrefcylinder float(8),
    cat_predpostrefaxis float(8),
    cat_nosutures tinyint(1),
    cat_lks_id_pupilsize int(4),
    cat_viscoelasticremoved bit(1),
    cat_lks_id_surgeonposition int(4),
    cat_icdilation bit(1),
    cat_visionblue bit(1),
    cat_hydrodelamination bit(1),
    cat_hydrodissection bit(1),
    cat_lks_id_biometrynotusedreason int(4),
    cat_sideports int(4),
    cat_lks_id_viscoelastic int(4),
    cat_lks_id_viscoelastic2 int(4),
    cat_noacpara tinyint(1),
    cat_angcaptear int(4),
    cat_lks_id_incisionplane int(4),
    cat_phacominutes tinyint(1),
    cat_phacoseconds tinyint(1),
    cat_phacoeffectivetime bit(1) NOT NULL
);

CREATE TABLE cataractiol (
    cil_id int(4) NOT NULL,
    cil_power float(8),
    cil_order tinyint(1),
    cil_powercylinder float(8),
    cil_poweraxis float(8),
    cil_poweradd float(8)
);

CREATE TABLE cataractiollog (
    cil_ObjectId int(4) NOT NULL,
    cil_id int(4) NOT NULL,
    cil_cat_id int(4),
    cil_iol_id uniqueidentifier(16),
    cil_power float(8),
    cil_order tinyint(1),
    cil_powercylinder float(8),
    cil_poweraxis float(8),
    cil_poweradd float(8),
    cil_DateAdded datetime(8) NOT NULL,
    cil_AddedBy uniqueidentifier(16) NOT NULL,
    cil_TransactionId uniqueidentifier(16) NOT NULL,
    cil_Action char(1) NOT NULL
);

CREATE TABLE cataractlog (
    cat_ObjectId int(4) NOT NULL,
    cat_id int(4) NOT NULL,
    cat_act_id uniqueidentifier(16) NOT NULL,
    cat_bod_id int(4) NOT NULL,
    cat_eyeopnumber int(4),
    cat_lks_id_iolposition int(4),
    cat_iollensinserted bit(1),
    cat_lks_id_corticalclearance int(4),
    cat_lks_id_nucleusdelivery int(4),
    cat_lks_id_capsulotomy int(4),
    cat_lks_id_woundclosure int(4),
    cat_lks_id_incisionsite int(4),
    cat_incisionlength float(8),
    cat_incisionmeridian int(4),
    cat_lks_id_phacomachine int(4),
    cat_phacotime time(5),
    cat_phacopower tinyint(1),
    cat_effectivephacotime time(5),
    cat_miochol bit(1),
    cat_predpostref float(8),
    cat_predpostrefcylinder float(8),
    cat_predpostrefaxis float(8),
    cat_nosutures tinyint(1),
    cat_lks_id_pupilsize int(4),
    cat_viscoelasticremoved bit(1),
    cat_lks_id_surgeonposition int(4),
    cat_icdilation bit(1),
    cat_visionblue bit(1),
    cat_hydrodelamination bit(1),
    cat_hydrodissection bit(1),
    cat_lks_id_biometrynotusedreason int(4),
    cat_sideports int(4),
    cat_lks_id_viscoelastic int(4),
    cat_lks_id_viscoelastic2 int(4),
    cat_noacpara tinyint(1),
    cat_angcaptear int(4),
    cat_lks_id_incisionplane int(4),
    cat_phacominutes tinyint(1),
    cat_phacoseconds tinyint(1),
    cat_phacoeffectivetime bit(1),
    cat_DateAdded datetime(8) NOT NULL,
    cat_AddedBy uniqueidentifier(16) NOT NULL,
    cat_TransactionId uniqueidentifier(16) NOT NULL,
    cat_Action char(1) NOT NULL
);

CREATE TABLE CataractPlan (
    spc_id int(4) NOT NULL,
    spc_bod_id int(4) NOT NULL,
    spc_firsteye bit(1) NOT NULL,
    spc_planforsecondeye_lks_id int(4),
    spc_iol_id uniqueidentifier(16),
    spc_targetrefraction float(8),
    spc_comments nvarchar(1000)
);

CREATE TABLE CataractPlanLog (
    spc_ObjectId int(4) NOT NULL,
    spc_id int(4) NOT NULL,
    spc_spp_id int(4) NOT NULL,
    spc_bod_id int(4) NOT NULL,
    spc_firsteye bit(1) NOT NULL,
    spc_planforsecondeye_lks_id int(4),
    spc_iol_id uniqueidentifier(16),
    spc_targetrefraction float(8),
    spc_comments nvarchar(1000),
    spc_isdeleted bit(1) NOT NULL,
    spc_DateAdded datetime(8) NOT NULL,
    spc_AddedBy uniqueidentifier(16) NOT NULL,
    spc_TransactionId uniqueidentifier(16) NOT NULL,
    spc_Action char(1) NOT NULL
);

CREATE TABLE Cct (
    ActivityId uniqueidentifier(16) NOT NULL,
    WithEpitheliumOn int(4),
    WithEpitheliumOff int(4),
    PreUv int(4),
    PostUv int(4)
);

CREATE TABLE CctLog (
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    WithEpitheliumOn int(4),
    WithEpitheliumOff int(4),
    PreUv int(4),
    PostUv int(4)
);

CREATE TABLE CertificateOfVisionImpairment (
    cvi_pss_id int(4) NOT NULL,
    cvi_lks_certified_blind int(4) NOT NULL,
    cvi_pdt_date_of_certification_blind uniqueidentifier(16),
    cvi_cpt_certified_blind_main_cause int(4),
    cvi_lks_certified_partially_sighted int(4) NOT NULL,
    cvi_pdt_date_of_certification_partially_sighted uniqueidentifier(16),
    cvi_cpt_certified_partially_sighted_main_cause int(4),
    cvi_comments nvarchar(-1)
);

CREATE TABLE Charge (
    bic_id int(4) NOT NULL,
    bsc_Id int(4) NOT NULL,
    bic_description nvarchar(800) NOT NULL,
    bic_medisightdescription nvarchar(200) NOT NULL,
    bic_requireslaterality bit(1) NOT NULL,
    bsc_IsDeleted bit(1) NOT NULL,
    bsc_Description nvarchar(800) NOT NULL,
    bic_available bit(1) NOT NULL,
    bic_QualifierFreeText nvarchar(510),
    bsc_MedisightDescription nvarchar(200) NOT NULL,
    bsc_QualifierValue nvarchar(510),
    bic_HelpText nvarchar(500),
    bic_CodeLaterality int(4),
    bsc_QualifierTypeDescription nvarchar(510),
    bsc_bic_ChargeId int(4),
    bsc_use_ResponsibleUserId uniqueidentifier(16),
    bsc_CodeLaterality int(4),
    bsc_pro_ProcedureId int(4),
    bsc_pqi_ProcedureQualifierId int(4),
    bsc_QualifierName nvarchar(510),
    bsc_QualifierCode nvarchar(510)
);

CREATE TABLE ChargeActivity (
    bac_id int(4) NOT NULL,
    bac_bic_ChargeId int(4),
    bac_QualifierFreeText nvarchar(510),
    bac_AddedBySearch bit(1) NOT NULL,
    bac_pro_ProcedureId int(4),
    bac_pqi_ProcedureQualifierId int(4)
);

CREATE TABLE ChargeActivityLog (
    bac_ObjectId int(4) NOT NULL,
    bac_id int(4) NOT NULL,
    bac_act_id uniqueidentifier(16) NOT NULL,
    bac_bic_ChargeId int(4),
    bac_QualifierFreeText nvarchar(510),
    bac_AddedBySearch bit(1) NOT NULL,
    bac_DateAdded datetime(8) NOT NULL,
    bac_AddedBy uniqueidentifier(16) NOT NULL,
    bac_TransactionId uniqueidentifier(16) NOT NULL,
    bac_Action char(1) NOT NULL,
    bac_pro_ProcedureId int(4),
    bac_pqi_ProcedureQualifierId int(4)
);

CREATE TABLE ChargeActivitySelection (
    cas_Id int(4) NOT NULL,
    cas_bod_BodyPartId int(4) NOT NULL,
    cas_Selected bit(1) NOT NULL,
    cas_use_SelectedUserId uniqueidentifier(16)
);

CREATE TABLE ChargeActivitySelectionLog (
    cas_ObjectId int(4) NOT NULL,
    cas_Id int(4) NOT NULL,
    cas_bac_ChargeActivityId int(4) NOT NULL,
    cas_bod_BodyPartId int(4) NOT NULL,
    cas_Selected bit(1) NOT NULL,
    cas_use_SelectedUserId uniqueidentifier(16),
    cas_DateAdded datetime(8) NOT NULL,
    cas_AddedBy uniqueidentifier(16) NOT NULL,
    cas_TransactionId uniqueidentifier(16) NOT NULL,
    cas_Action char(1) NOT NULL
);

CREATE TABLE ChargeIdentifier (
    sci_Id int(4) NOT NULL
);

CREATE TABLE ChargeInstanceIdentifier (
    cii_Id int(4) NOT NULL
);

CREATE TABLE ChargeLog (
    bic_ObjectId int(4) NOT NULL,
    bic_id int(4) NOT NULL,
    bic_code nvarchar(20) NOT NULL,
    bic_description nvarchar(800) NOT NULL,
    bic_medisightdescription nvarchar(200) NOT NULL,
    bic_bct_id int(4) NOT NULL,
    bic_bqt_id int(4) NOT NULL,
    bic_requireslaterality bit(1) NOT NULL,
    bic_available bit(1) NOT NULL,
    bic_DateAdded datetime(8) NOT NULL,
    bic_AddedBy uniqueidentifier(16) NOT NULL,
    bic_TransactionId uniqueidentifier(16) NOT NULL,
    bic_Action char(1) NOT NULL,
    bic_QualifierFreeText nvarchar(510),
    bic_HelpText nvarchar(500),
    bic_CodeLaterality int(4)
);

CREATE TABLE ChargeMappingDrug (
    bmd_Id int(4) NOT NULL
);

CREATE TABLE ChargeMappingDrugLog (
    bmd_Id int(4) NOT NULL,
    bmd_bic_ChargeId int(4) NOT NULL,
    bmd_mcn_MedicationElementId int(4) NOT NULL,
    bmd_ObjectId int(4) NOT NULL,
    bmd_DateAdded datetime(8) NOT NULL,
    bmd_AddedBy uniqueidentifier(16) NOT NULL,
    bmd_TransactionId uniqueidentifier(16) NOT NULL,
    bmd_Action char(1) NOT NULL
);

CREATE TABLE ChargeMappingEncounter (
    bme_Id int(4) NOT NULL
);

CREATE TABLE ChargeMappingEncounterLog (
    bme_Id int(4) NOT NULL,
    bme_bic_ChargeId int(4) NOT NULL,
    bme_ety_EncounterTypeId int(4) NOT NULL,
    bme_ObjectId int(4) NOT NULL,
    bme_DateAdded datetime(8) NOT NULL,
    bme_AddedBy uniqueidentifier(16) NOT NULL,
    bme_TransactionId uniqueidentifier(16) NOT NULL,
    bme_Action char(1) NOT NULL,
    bme_cpw_Id int(4)
);

CREATE TABLE ChargeMappingProcedure (
    bmp_Id int(4) NOT NULL
);

CREATE TABLE ChargeMappingProcedureLog (
    bmp_Id int(4) NOT NULL,
    bmp_bic_ChargeId int(4) NOT NULL,
    bmp_pro_ProcedureId int(4) NOT NULL,
    bmp_pqi_ProcedureQualifierId int(4),
    bmp_ObjectId int(4) NOT NULL,
    bmp_DateAdded datetime(8) NOT NULL,
    bmp_AddedBy uniqueidentifier(16) NOT NULL,
    bmp_TransactionId uniqueidentifier(16) NOT NULL,
    bmp_Action char(1) NOT NULL
);

CREATE TABLE ChargeType (
    bct_id int(4) NOT NULL,
    bct_description nvarchar(510),
    bct_Active bit(1) NOT NULL
);

CREATE TABLE Checklist (
    chk_act_id uniqueidentifier(16) NOT NULL,
    chk_Comments nvarchar(-1)
);

CREATE TABLE ChecklistLog (
    chk_act_id int(4) NOT NULL,
    chk_ObjectId uniqueidentifier(16) NOT NULL,
    chk_DateAdded datetime(8) NOT NULL,
    chk_AddedBy uniqueidentifier(16) NOT NULL,
    chk_Transactionid uniqueidentifier(16) NOT NULL,
    chk_Action char(1) NOT NULL,
    chk_Comments nvarchar(-1)
);

CREATE TABLE Clinic (
    clt_id int(4) NOT NULL,
    clt_desc nvarchar(510),
    clt_loc_id uniqueidentifier(16),
    clt_loc_id_reception uniqueidentifier(16),
    clt_code nvarchar(40),
    clt_use_id_consultant uniqueidentifier(16),
    clt_active bit(1),
    clt_apy_id int(4),
    clt_new bit(1),
    clt_followup bit(1),
    clt_cpw_id int(4),
    clt_AllowMultipleStepsInProgress bit(1) NOT NULL,
    clt_ForReview bit(1)
);

CREATE TABLE clinicalbodysystem (
    bsm_id int(4) NOT NULL,
    bsm_shortdesc nvarchar(510),
    bsm_longdesc nvarchar(510)
);

CREATE TABLE clinicalconceptalias (
    cpa_id int(4) NOT NULL,
    cqa_lks_id_aliastype int(4) NOT NULL,
    cpa_cpt_id_alias int(4),
    cpa_description nvarchar(510),
    cpa_cql_id int(4)
);

CREATE TABLE clinicalconceptcategory (
    cfd_id int(4) NOT NULL,
    cfd_description nvarchar(510),
    cfd_ccc_id int(4) NOT NULL
);

CREATE TABLE clinicalconceptcategoryitem (
    cci_id int(4) NOT NULL
);

CREATE TABLE clinicalconceptcategorytype (
    ccc_id int(4) NOT NULL,
    ccc_description varchar(255) NOT NULL
);

CREATE TABLE clinicalconceptcommonitems (
    coi_id int(4) NOT NULL,
    coi_cot_id int(4) NOT NULL,
    coi_cpt_id int(4) NOT NULL,
    coi_order int(4)
);

CREATE TABLE clinicalconceptcommontypes (
    cot_id int(4) NOT NULL,
    cot_name varchar(255) NOT NULL
);

CREATE TABLE clinicalconceptconditiontype (
    ccy_id int(4) NOT NULL,
    ccy_description nvarchar(510)
);

CREATE TABLE ClinicalConceptDefaultPanel (
    cdp_id int(4) NOT NULL,
    cdp_ccp_id int(4) NOT NULL
);

CREATE TABLE ClinicalConceptFeature (
    ccf_id int(4) NOT NULL,
    ccf_ftr_id int(4) NOT NULL,
    ccf_cpt_id int(4) NOT NULL,
    ccf_orderId int(4) NOT NULL
);

CREATE TABLE ClinicalConceptFeatureExclusionCriteria (
    cle_id int(4) NOT NULL,
    cle_ccf_ClinicalConceptFeatureId int(4) NOT NULL,
    cle_ftr_ExclusionFeatureId int(4) NOT NULL,
    cle_flk_ExclusionFeatureLookupId int(4) NOT NULL
);

CREATE TABLE ClinicalConceptFeatureLookup (
    ccl_ccf_id int(4) NOT NULL,
    ccl_flk_id int(4) NOT NULL
);

CREATE TABLE clinicalconceptgroup (
    ccg_id int(4) NOT NULL,
    ccg_title nvarchar(510),
    ccg_exclusive bit(1) NOT NULL,
    ccg_separator varchar(10),
    ccg_finalSeparator varchar(10),
    ccg_ccg_id_parent int(4),
    ccg_order int(4),
    ccg_excludeGroupIfEmpty bit(1) NOT NULL,
    ccg_formatString nvarchar(-1) NOT NULL,
    ccg_AllowIndividualFindingInteraction bit(1) NOT NULL
);

CREATE TABLE clinicalconceptgroupitem (
    cgi_id int(4) NOT NULL,
    cgi_ccg_id int(4) NOT NULL,
    cgi_cpt_id int(4) NOT NULL,
    cgi_narrativetext nvarchar(510) NOT NULL,
    cgi_useConceptTerm bit(1) NOT NULL,
    cgi_subGroupNumber int(4)
);

CREATE TABLE clinicalconceptmenu (
    cmn_id int(4) NOT NULL,
    cmn_description nvarchar(510),
    cmn_itemsexclusive bit(1) NOT NULL
);

CREATE TABLE clinicalconceptmenuitems (
    cmi_id int(4) NOT NULL,
    cmi_ast_id int(4) NOT NULL,
    cmi_child int(4),
    cmi_ccp_id int(4),
    cmi_ccg_id int(4),
    cmi_negated bit(1) NOT NULL,
    cmi_lks_id_measurementtype int(4)
);

CREATE TABLE clinicalconceptpanel (
    ccp_id int(4) NOT NULL,
    ccp_name nvarchar(510)
);

CREATE TABLE clinicalconceptpanelgroup (
    cgr_id int(4) NOT NULL,
    cgr_name nvarchar(510)
);

CREATE TABLE clinicalconceptpanelitem (
    cpi_id int(4) NOT NULL,
    cpi_ccp_id int(4) NOT NULL,
    cpi_type int(4) NOT NULL,
    cpi_cpt_id int(4),
    cpi_cgr_id int(4),
    cpi_lks_id_measuretypeid int(4),
    cpi_order int(4) NOT NULL,
    cpi_displaytext nvarchar(510),
    cpi_exclusive bit(1),
    cpi_helptext nvarchar(510),
    cpi_negated bit(1) NOT NULL
);

CREATE TABLE clinicalconceptparsegroup (
    cpg_id int(4) NOT NULL,
    cpg_desc nvarchar(510),
    cpg_prependQualifier bit(1) NOT NULL,
    cpg_preappend nvarchar(510),
    cpg_append varchar(255)
);

CREATE TABLE clinicalconceptparsingrules (
    cop_id int(4) NOT NULL,
    cop_prepend nvarchar(510),
    cop_append nvarchar(510)
);

CREATE TABLE clinicalconceptqualified (
    ccq_id int(4) NOT NULL,
    ccq_cpt_id_qualified int(4) NOT NULL
);

CREATE TABLE clinicalconceptqualifier (
    cql_id int(4) NOT NULL,
    cql_description nvarchar(510),
    cql_qualifiertype int(4) NOT NULL,
    cql_cqm_id int(4)
);

CREATE TABLE clinicalconceptqualifiergroup (
    cqg_id int(4) NOT NULL,
    cqg_cql_id int(4) NOT NULL,
    cqg_title nvarchar(510),
    cqg_parsemember bit(1) NOT NULL
);

CREATE TABLE clinicalconceptqualifieritem (
    cqm_id int(4) NOT NULL
);

CREATE TABLE ClinicalConceptQualifierMenu (
    cqm_id int(4) NOT NULL,
    cqm_text nvarchar(510) NOT NULL,
    cqm_cpt_id int(4)
);

CREATE TABLE clinicalconcepts (
    cpt_id int(4) NOT NULL,
    cpt_snomedid varchar(50),
    cpt_searchable bit(1) NOT NULL,
    cpt_status tinyint(1),
    cpt_action int(4),
    cpt_mustqualify bit(1),
    cpt_clinicfinding bit(1) NOT NULL,
    cpt_diagnosis bit(1) NOT NULL,
    cpt_history bit(1) NOT NULL,
    cpt_investigation bit(1) NOT NULL,
    cpt_flag int(4),
    cpt_bsm_id int(4) NOT NULL,
    cpt_negated bit(1) NOT NULL,
    cpt_negationcomment nvarchar(100),
    cpt_cpt_idpositive int(4),
    cpt_eyerelated bit(1) NOT NULL,
    cpt_icd10 varchar(20),
    cpt_readcode varchar(10),
    cpt_version int(4) NOT NULL,
    cpt_abbreviated nvarchar(510),
    cpt_preventAddingFromPreviousFinding bit(1) NOT NULL
);

CREATE TABLE clinicalconceptsbackup (
    cpt_id int(4) NOT NULL,
    cpt_description varchar(255) NOT NULL,
    cpt_cpy_id int(4) NOT NULL,
    cpt_snomedid varchar(50),
    cpt_searchable bit(1),
    cpt_status tinyint(1),
    cpt_action int(4),
    cpt_mustqualify bit(1),
    cpt_flag int(4)
);

CREATE TABLE clinicalconceptsmap (
    cmp_id int(4) NOT NULL,
    cmp_description varchar(255) NOT NULL,
    cmp_cpt_id int(4) NOT NULL,
    cmp_cpy_id int(4) NOT NULL,
    cmp_cpy_id_unique int(4)
);

CREATE TABLE clinicalconceptspromotion (
    cpr_id int(4) NOT NULL,
    cpr_cpt_id_promoted int(4) NOT NULL
);

CREATE TABLE clinicalconceptsretired (
    cpt_id int(4) NOT NULL,
    cpt_description varchar(255) NOT NULL,
    cpt_cpy_id int(4) NOT NULL,
    cpt_id_mapped int(4),
    cpt_description_mapped varchar(255),
    cpt_cpy_id_mapped int(4)
);

CREATE TABLE clinicalconcepttype (
    cpy_id int(4) NOT NULL,
    cpy_description varchar(255) NOT NULL,
    cpy_tempid uniqueidentifier(16) NOT NULL
);

CREATE TABLE clinicaldatahistory (
    cdh_id int(4) NOT NULL,
    cdh_subject varchar(255) NOT NULL,
    cdh_update varchar(255),
    cdh_updatedate datetime(8)
);

CREATE TABLE clinicaloutcome (
    cou_id int(4) NOT NULL,
    cou_desclong varchar(50),
    cou_descshort varchar(50),
    cou_ety_id int(4),
    cou_aty_id int(4),
    cou_future bit(1)
);

CREATE TABLE ClinicLog (
    clt_Id int(4) NOT NULL,
    clt_desc nvarchar(510),
    clt_loc_id uniqueidentifier(16),
    clt_loc_id_reception uniqueidentifier(16),
    clt_code nvarchar(40),
    clt_lks_id_mode int(4),
    clt_use_id_consultant uniqueidentifier(16),
    clt_active bit(1),
    clt_clerksteps int(4),
    clt_id_guid uniqueidentifier(16),
    clt_apy_id int(4),
    clt_new bit(1),
    clt_followup bit(1),
    clt_cpw_id int(4),
    clt_ObjectId int(4) NOT NULL,
    clt_DateAdded datetime(8) NOT NULL,
    clt_AddedBy uniqueidentifier(16) NOT NULL,
    clt_TransactionId uniqueidentifier(16) NOT NULL,
    clt_Action char(1) NOT NULL,
    clt_std_ClinicalStudyId int(4),
    clt_AllowMultipleStepsInProgress bit(1),
    clt_ForReview bit(1)
);

CREATE TABLE ClinicType (
    Id int(4) NOT NULL
);

CREATE TABLE Colour (
    col_id int(4) NOT NULL,
    col_description varchar(50) NOT NULL,
    col_hex char(7) NOT NULL
);

CREATE TABLE ColourData (
    uco_id int(4) NOT NULL,
    uco_available bit(1) NOT NULL
);

CREATE TABLE Comment (
    psc_pss_id int(4) NOT NULL,
    psc_comments nvarchar(-1)
);

CREATE TABLE CommentFindings (
    Id int(4) NOT NULL,
    Comments nvarchar(4000)
);

CREATE TABLE CommentFindingsLog (
    Id int(4) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL,
    Comments nvarchar(4000),
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE commenttype (
    cty_id int(4) NOT NULL,
    cty_code nvarchar(510),
    cty_desc nvarchar(510)
);

CREATE TABLE commonlyprescribedmedication (
    cpm_id int(4) NOT NULL,
    cpm_dmy_id int(4) NOT NULL,
    cpm_dbr_id int(4),
    cpm_order tinyint(1) NOT NULL,
    cpm_contextflag int(4) NOT NULL
);

CREATE TABLE CommonlyPrescribedMedicationDuplicateMedicationRemovalBackup (
    cpm_id int(4) NOT NULL,
    cpm_dmy_id int(4) NOT NULL,
    cpm_dbr_id int(4),
    cpm_order tinyint(1) NOT NULL,
    cpm_contextflag int(4) NOT NULL
);

CREATE TABLE commonlyprescribedmedicationlog (
    cpm_objectId int(4) NOT NULL,
    cpm_id int(4) NOT NULL,
    cpm_dmy_id int(4) NOT NULL,
    cpm_dbr_id int(4),
    cpm_order tinyint(1) NOT NULL,
    cpm_contextflag int(4) NOT NULL,
    cpm_dateadded datetime(8) NOT NULL,
    cpm_addedby uniqueidentifier(16) NOT NULL,
    cpm_transactionid uniqueidentifier(16) NOT NULL,
    cpm_action char(1) NOT NULL
);

CREATE TABLE CommunicationRule (
    sdr_id int(4) NOT NULL,
    sdr_rulename nvarchar(510) NOT NULL
);

CREATE TABLE CommunityFollowUpOutcomes (
    cfo_Id int(4) NOT NULL,
    cfo_act_ActivityId uniqueidentifier(16) NOT NULL,
    cfo_NoFurtherActionSelected bit(1) NOT NULL,
    cfo_RefractiveAim nvarchar(4000),
    cfo_ListForSecondEyeSelected bit(1) NOT NULL,
    cfo_HospitalReviewRoutineSelected bit(1) NOT NULL,
    cfo_HospitalReviewUrgentSelected bit(1) NOT NULL,
    cfo_CommunityFollowUpSelected bit(1),
    cfo_HospitalMustViewSelected bit(1)
);

CREATE TABLE CommunityFollowUpOutcomesLog (
    cfo_Id int(4) NOT NULL,
    cfo_ObjectId int(4) NOT NULL,
    cfo_DateAdded datetime(8) NOT NULL,
    cfo_AddedBy uniqueidentifier(16) NOT NULL,
    cfo_TransactionId uniqueidentifier(16) NOT NULL,
    cfo_Action char(1) NOT NULL,
    cfo_act_ActivityId uniqueidentifier(16) NOT NULL,
    cfo_NoFurtherActionSelected bit(1) NOT NULL,
    cfo_RefractiveAim nvarchar(4000),
    cfo_ListForSecondEyeSelected bit(1) NOT NULL,
    cfo_HospitalReviewRoutineSelected bit(1) NOT NULL,
    cfo_HospitalReviewUrgentSelected bit(1) NOT NULL,
    cfo_CommunityFollowUpSelected bit(1),
    cfo_HospitalMustViewSelected bit(1)
);

CREATE TABLE CompletionStatus (
    Id int(4) NOT NULL,
    Description nvarchar(200) NOT NULL
);

CREATE TABLE ConfiguredSource (
    hcs_Id int(4) NOT NULL
);

CREATE TABLE ConvergenceAssessment (
    Id int(4) NOT NULL,
    MethodId int(4),
    CorrectionId int(4),
    ToNose bit(1) NOT NULL,
    NilConvergence bit(1) NOT NULL,
    NearConvergencePoint1 int(4),
    NearConvergencePoint2 int(4),
    NearConvergencePoint3 int(4),
    Recovery1 int(4),
    Recovery2 int(4),
    Recovery3 int(4),
    Comments nvarchar(2000)
);

CREATE TABLE ConvergenceAssessmentLog (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    MethodId int(4),
    CorrectionId int(4),
    ToNose bit(1) NOT NULL,
    NilConvergence bit(1) NOT NULL,
    NearConvergencePoint1 int(4),
    NearConvergencePoint2 int(4),
    NearConvergencePoint3 int(4),
    Recovery1 int(4),
    Recovery2 int(4),
    Recovery3 int(4),
    Comments nvarchar(2000),
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE ConvergenceAssessmentObservations (
    Id int(4) NOT NULL
);

CREATE TABLE ConvergenceAssessmentObservationsLog (
    Id int(4) NOT NULL,
    ObservationId int(4) NOT NULL,
    AssessmentId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE ConvergenceObservation (
    Id int(4) NOT NULL,
    Order int(4) NOT NULL,
    IsActive bit(1) NOT NULL,
    StaticId int(4)
);

CREATE TABLE ConvergenceObservationLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Name nvarchar(40) NOT NULL,
    Order int(4) NOT NULL,
    IsActive bit(1) NOT NULL,
    StaticId int(4)
);

CREATE TABLE CoPathologyRiskGroup (
    crg_Id int(4) NOT NULL,
    crg_Description nvarchar(200)
);

CREATE TABLE Correction (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    CorrectionName nvarchar(120) NOT NULL,
    Name nvarchar(200) NOT NULL
);

CREATE TABLE Correspondence (
    crl_Id int(4) NOT NULL,
    crl_ActivityId uniqueidentifier(16) NOT NULL,
    crl_MethodLookupDataId int(4),
    crl_Correction int(4),
    crl_AngleCorrected bit(1),
    crl_Distance int(4),
    crl_ResultLookupDataId int(4),
    crl_Comments nvarchar(5000)
);

CREATE TABLE CorrespondenceLog (
    crl_Id int(4) NOT NULL,
    crl_ObjectId int(4) NOT NULL,
    crl_DateAdded datetime(8) NOT NULL,
    crl_AddedBy uniqueidentifier(16) NOT NULL,
    crl_Transactionid uniqueidentifier(16) NOT NULL,
    crl_Action char(1) NOT NULL,
    crl_ActivityId uniqueidentifier(16) NOT NULL,
    crl_MethodLookupDataId int(4),
    crl_Correction int(4),
    crl_AngleCorrected bit(1),
    crl_Distance int(4),
    crl_ResultLookupDataId int(4),
    crl_Comments nvarchar(5000)
);

CREATE TABLE CoverTestHorizontalTestFindings (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    HorizontalDeviationId int(4),
    SeverityId int(4),
    DiplopiaId int(4),
    RecoveryId int(4),
    NoDeviation bit(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE CoverTestHorizontalTestFindingsLog (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    HorizontalDeviationId int(4),
    SeverityId int(4),
    DiplopiaId int(4),
    RecoveryId int(4),
    NoDeviation bit(1) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE CoverTestTorsionTestFindings (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    TorsionDeviationId int(4),
    SeverityId int(4),
    DiplopiaId int(4),
    RecoveryId int(4),
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE CoverTestTorsionTestFindingsLog (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    TorsionDeviationId int(4),
    SeverityId int(4),
    DiplopiaId int(4),
    RecoveryId int(4),
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE CoverTestVerticalTestFindings (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    VerticalDeviationId int(4),
    SeverityId int(4),
    DiplopiaId int(4),
    RecoveryId int(4),
    NoDeviation bit(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE CoverTestVerticalTestFindingsLog (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    VerticalDeviationId int(4),
    SeverityId int(4),
    DiplopiaId int(4),
    RecoveryId int(4),
    NoDeviation bit(1) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE customersite (
    sit_id uniqueidentifier(16) NOT NULL,
    sit_code varchar(255) NOT NULL,
    sit_abbreviation varchar(255),
    sit_trustname varchar(255) NOT NULL,
    sit_trustsub varchar(255) NOT NULL,
    sit_name nvarchar(510),
    sit_add_id uniqueidentifier(16) NOT NULL,
    sit_type int(4),
    sit_sharedcarescheme varchar(255),
    sit_available bit(1),
    sit_attributes int(4),
    sit_webaddress nvarchar(510),
    sit_trustcode varchar(255),
    sit_blb_id_letterheadimage uniqueidentifier(16),
    sit_envelopetop int(4),
    sit_envelopeleft int(4),
    sit_lks_id_letterheadtype int(4),
    sit_letterheadimageleftindent int(4),
    sit_OptoMizeHospitalCode nvarchar(50)
);

CREATE TABLE customersitecontact (
    ccn_id int(4) NOT NULL,
    ccn_value varchar(255) NOT NULL,
    ccn_lks_id_contact int(4) NOT NULL
);

CREATE TABLE customersitecontactlog (
    ccn_objectId int(4) NOT NULL,
    ccn_id int(4) NOT NULL,
    ccn_sit_id uniqueidentifier(16) NOT NULL,
    ccn_value varchar(255) NOT NULL,
    ccn_lks_id_contact int(4) NOT NULL,
    ccn_dateadded datetime(8) NOT NULL,
    ccn_addedby uniqueidentifier(16) NOT NULL,
    ccn_transactionid uniqueidentifier(16) NOT NULL,
    ccn_action char(1) NOT NULL
);

CREATE TABLE customersitelog (
    sit_objectId uniqueidentifier(16) NOT NULL,
    sit_id int(4) NOT NULL,
    sit_code varchar(255) NOT NULL,
    sit_trustname varchar(255) NOT NULL,
    sit_trustsub varchar(255) NOT NULL,
    sit_name nvarchar(510),
    sit_add_id uniqueidentifier(16) NOT NULL,
    sit_type int(4),
    sit_sharedcarescheme varchar(255),
    sit_available bit(1),
    sit_attributes int(4),
    sit_webaddress nvarchar(510),
    sit_abbreviation varchar(255),
    sit_trustcode varchar(255),
    sit_blb_id_letterheadimage uniqueidentifier(16),
    sit_envelopetop int(4),
    sit_envelopeleft int(4),
    sit_lks_id_letterheadtype int(4),
    sit_dateadded datetime(8) NOT NULL,
    sit_addedby uniqueidentifier(16) NOT NULL,
    sit_transactionid uniqueidentifier(16) NOT NULL,
    sit_action char(1) NOT NULL,
    sit_letterheadimageleftindent int(4),
    sit_OptoMizeHospitalCode nvarchar(50)
);

CREATE TABLE CxlActivity (
    ActivityId uniqueidentifier(16) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE CxlActivityLog (
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE CxlCornealSurgery (
    Id int(4) NOT NULL
);

CREATE TABLE CxlCornealSurgeryLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE CxlPreparation (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    EpithelialStatusId int(4) NOT NULL,
    EpithelialStatusId int(4),
    MethodOfRemovalId int(4),
    MethodOfRemovalId int(4),
    EpithelialDebridement int(4),
    EpithelialDebridement int(4)
);

CREATE TABLE CxlPreparationLog (
    Id int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    EpithelialStatusId int(4),
    EpithelialStatusId int(4) NOT NULL,
    MethodOfRemovalId int(4),
    MethodOfRemovalId int(4),
    EpithelialDebridement int(4),
    EpithelialDebridement int(4)
);

CREATE TABLE CxlSurgicalCompletion (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    BandageContactLens bit(1),
    BandageContactLens bit(1),
    BandageTypeId int(4),
    TypeId int(4)
);

CREATE TABLE CxlSurgicalCompletionDrugs (
    Id int(4) NOT NULL,
    TypeId int(4) NOT NULL,
    RouteId int(4) NOT NULL,
    NameId int(4) NOT NULL
);

CREATE TABLE CxlSurgicalCompletionDrugsLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TypeId int(4) NOT NULL,
    RouteId int(4) NOT NULL,
    NameId int(4) NOT NULL
);

CREATE TABLE CxlSurgicalCompletionLog (
    Id int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    BandageContactLens bit(1),
    BandageContactLens bit(1),
    TypeId int(4),
    BandageTypeId int(4)
);

CREATE TABLE Cyclodiode (
    cyc_sdf_id int(4) NOT NULL,
    cyc_act_ActivityId uniqueidentifier(16) NOT NULL,
    cyc_bod_BodyPartId int(4) NOT NULL,
    cyc_lks_InstrumentId int(4),
    cyc_RightEyeDegreesTreated int(4),
    cyc_lks_InstrumentId int(4) NOT NULL,
    cyc_DegreesTreated int(4) NOT NULL,
    cyc_RightEyePositionFrom int(4),
    cyc_RightEyePositionTo int(4),
    cyc_FromPosition int(4),
    cyc_ToPosition int(4),
    cyc_RightEyeSparing bit(1) NOT NULL,
    cyc_LeftEyeDegreesTreated int(4),
    cyc_Sparing bit(1) NOT NULL,
    cyc_NumberOfLaserSpots int(4),
    cyc_LeftEyePositionFrom int(4),
    cyc_LeftEyePositionTo int(4),
    cyc_LeftEyeSparing bit(1) NOT NULL
);

CREATE TABLE CyclodiodeLog (
    cyc_act_ActivityId int(4) NOT NULL,
    cyc_sdf_id int(4) NOT NULL,
    cyc_ObjectId int(4) NOT NULL,
    cyc_bod_BodyPartId int(4) NOT NULL,
    cyc_lks_InstrumentId int(4) NOT NULL,
    cyc_DateAdded datetime(8) NOT NULL,
    cyc_AddedBy uniqueidentifier(16) NOT NULL,
    cyc_ObjectId uniqueidentifier(16) NOT NULL,
    cyc_DateAdded datetime(8) NOT NULL,
    cyc_Transactionid uniqueidentifier(16) NOT NULL,
    cyc_Action char(1) NOT NULL,
    cyc_AddedBy uniqueidentifier(16) NOT NULL,
    cyc_Transactionid uniqueidentifier(16) NOT NULL,
    cyc_lks_InstrumentId int(4),
    cyc_RightEyeDegreesTreated int(4),
    cyc_Action char(1) NOT NULL,
    cyc_DegreesTreated int(4) NOT NULL,
    cyc_RightEyePositionFrom int(4),
    cyc_RightEyePositionTo int(4),
    cyc_FromPosition int(4),
    cyc_ToPosition int(4),
    cyc_RightEyeSparing bit(1) NOT NULL,
    cyc_LeftEyeDegreesTreated int(4),
    cyc_Sparing bit(1) NOT NULL,
    cyc_NumberOfLaserSpots int(4),
    cyc_LeftEyePositionFrom int(4),
    cyc_LeftEyePositionTo int(4),
    cyc_LeftEyeSparing bit(1) NOT NULL
);

CREATE TABLE CyclodiodeMedications (
    sdm_SurgeonDefaultId int(4) NOT NULL,
    sdm_lks_id int(4) NOT NULL,
    sdm_dro_id int(4) NOT NULL,
    sdm_mcn_id int(4) NOT NULL
);

CREATE TABLE CyclodiodeMedicationsLog (
    sdm_SurgeonDefaultId int(4) NOT NULL,
    sdm_ObjectId int(4) NOT NULL,
    sdm_DateAdded datetime(8) NOT NULL,
    sdm_AddedBy uniqueidentifier(16) NOT NULL,
    sdm_Transactionid uniqueidentifier(16) NOT NULL,
    sdm_Action char(1) NOT NULL,
    sdm_lks_id int(4),
    sdm_dro_id int(4),
    sdm_mcn_id int(4)
);

CREATE TABLE CycloTarget (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    CycloTargetId int(4),
    CycloTargetId int(4) NOT NULL,
    RangeFrom tinyint(1),
    RangeFrom tinyint(1),
    RangeTo tinyint(1),
    RangeTo tinyint(1)
);

CREATE TABLE CycloTargetLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    CycloTargetId int(4) NOT NULL,
    CycloTargetId int(4),
    RangeFrom tinyint(1),
    RangeFrom tinyint(1),
    RangeTo tinyint(1),
    RangeTo tinyint(1)
);

CREATE TABLE Data (
    sdd_id int(4) NOT NULL,
    dtd_id int(4) NOT NULL,
    dtd_data varbinary(-1) NOT NULL,
    sdd_data varbinary(-1) NOT NULL,
    sdd_mappedData nvarchar(-1),
    sdd_humanReadableData nvarchar(-1),
    sdd_sid_id int(4) NOT NULL,
    sdd_dateOfTransfer datetime2(6) NOT NULL,
    sdd_dateOfInsertion datetime2(6),
    sdd_ect_id uniqueidentifier(16),
    sdd_ipm_id int(4),
    sdd_use_id uniqueidentifier(16) NOT NULL,
    sdd_use_id_seenBy uniqueidentifier(16),
    sdd_cpw_id int(4),
    sdd_ety_id_encounterTypeToCreate int(4),
    sdd_ety_id_encounterTypeBeingLinked int(4),
    sdd_loc_LocationId uniqueidentifier(16)
);

CREATE TABLE DataActivityImport (
    sdi_Id int(4) NOT NULL,
    sdi_aty_ActivityTypeId int(4) NOT NULL,
    sdi_ActivitySubTypeId int(4),
    sdi_Imported bit(1) NOT NULL
);

CREATE TABLE DataActivityImportLog (
    sdi_Id int(4) NOT NULL,
    sdi_ObjectId int(4) NOT NULL,
    sdi_sdd_DataId int(4) NOT NULL,
    sdi_aty_ActivityTypeId int(4) NOT NULL,
    sdi_ActivitySubTypeId int(4),
    sdi_Imported bit(1) NOT NULL,
    sdi_DateAdded datetime(8) NOT NULL,
    sdi_AddedBy uniqueidentifier(16) NOT NULL,
    sdi_Transactionid uniqueidentifier(16) NOT NULL,
    sdi_Action char(1) NOT NULL
);

CREATE TABLE DataBits (
    sdb_id int(4) NOT NULL
);

CREATE TABLE DataChecks (
    dcs_Id int(4) NOT NULL,
    dcs_StoredProcedureName varchar(255) NOT NULL,
    dcs_IsDeleted bit(1) NOT NULL
);

CREATE TABLE DataImportMethod (
    dim_Id int(4) NOT NULL
);

CREATE TABLE DataLog (
    sdd_objectId int(4) NOT NULL,
    sdd_id int(4) NOT NULL,
    sdd_data varbinary(-1) NOT NULL,
    sdd_mappedData nvarchar(-1),
    sdd_humanReadableData nvarchar(-1),
    sdd_sds_id int(4) NOT NULL,
    sdd_sid_id int(4) NOT NULL,
    sdd_dateOfTransfer datetime2(6) NOT NULL,
    sdd_dateOfInsertion datetime2(6),
    sdd_ect_id uniqueidentifier(16),
    sdd_pat_id uniqueidentifier(16) NOT NULL,
    sdd_dateAdded datetime(8) NOT NULL,
    sdd_addedBy uniqueidentifier(16) NOT NULL,
    sdd_transactionid uniqueidentifier(16) NOT NULL,
    sdd_action char(1) NOT NULL,
    sdd_ipm_id int(4),
    sdd_use_id uniqueidentifier(16),
    sdd_use_id_seenBy uniqueidentifier(16),
    sdd_cpw_id int(4),
    sdd_ety_id_encounterTypeToCreate int(4),
    sdd_ety_id_encounterTypeBeingLinked int(4),
    sdd_loc_LocationId uniqueidentifier(16)
);

CREATE TABLE DataRunCheckLogging (
    dcc_Id int(4) NOT NULL,
    dcc_DataCompletenessCheckId int(4) NOT NULL,
    dcc_PatientId uniqueidentifier(16) NOT NULL,
    dcc_RunDate datetime(8) NOT NULL,
    dcc_ElapsedTimeInMilliSeconds int(4) NOT NULL,
    dcc_CheckPassed bit(1) NOT NULL,
    dcc_FailureMessages varchar(-1)
);

CREATE TABLE dataupdatetoken (
    dut_id uniqueidentifier(16) NOT NULL,
    dut_use_id uniqueidentifier(16),
    dut_device varchar(255),
    dut_documentrelated bit(1) NOT NULL,
    dut_eps_id uniqueidentifier(16)
);

CREATE TABLE dataupdatetoken_bak_patch90620190802 (
    dut_id uniqueidentifier(16) NOT NULL,
    dut_use_id uniqueidentifier(16),
    dut_ety_id int(4),
    dut_pat_id uniqueidentifier(16),
    dut_ect_id uniqueidentifier(16),
    dut_device varchar(255),
    dut_datetaken datetime(8) NOT NULL,
    dut_status int(4),
    dut_documentrelated bit(1) NOT NULL,
    dut_eps_id uniqueidentifier(16)
);

CREATE TABLE DataUpdateTokenLog (
    dut_id int(4) NOT NULL,
    dut_ObjectId uniqueidentifier(16) NOT NULL,
    dut_DateAdded datetime(8) NOT NULL,
    dut_AddedBy uniqueidentifier(16) NOT NULL,
    dut_Transactionid uniqueidentifier(16) NOT NULL,
    dut_Action char(1) NOT NULL,
    dut_use_id uniqueidentifier(16),
    dut_ety_id int(4),
    dut_pat_id uniqueidentifier(16),
    dut_ect_id uniqueidentifier(16),
    dut_device varchar(255),
    dut_datetaken datetime(8) NOT NULL,
    dut_status int(4) NOT NULL,
    dut_documentrelated bit(1) NOT NULL,
    dut_eps_id uniqueidentifier(16),
    dut_ExpirationDate datetime(8),
    dut_aet_EncounterTemplateId int(4)
);

CREATE TABLE DataUploadHistory (
    cpu_Id int(4) NOT NULL,
    cpu_OperationDate datetime(8) NOT NULL,
    cpu_UploadSuccessful bit(1) NOT NULL,
    cpu_UploadMessage nvarchar(510) NOT NULL
);

CREATE TABLE DatePrecisionType (
    dpy_id int(4) NOT NULL,
    dpy_Description nvarchar(60),
    dpy_DisplayFormat nvarchar(40)
);

CREATE TABLE DateQuestion (
    dqp_qui_QuestionId int(4) NOT NULL,
    dqp_dpy_DatePrecisionTypeId int(4) NOT NULL,
    dqp_PreventPrecisionChanges bit(1) NOT NULL
);

CREATE TABLE DateQuestionLog (
    dqp_qui_QuestionId int(4) NOT NULL,
    dqp_dpy_DatePrecisionTypeId int(4) NOT NULL,
    dqp_PreventPrecisionChanges bit(1) NOT NULL,
    dqp_ObjectId int(4) NOT NULL,
    dqp_DateAdded datetime(8) NOT NULL,
    dqp_AddedBy uniqueidentifier(16) NOT NULL,
    dqp_TransactionId uniqueidentifier(16) NOT NULL,
    dqp_Action char(1) NOT NULL
);

CREATE TABLE DateQuestionVersion (
    dqv_quv_QuestionVersionId int(4) NOT NULL,
    dqv_dpy_DatePrecisionTypeId int(4) NOT NULL,
    dqv_PreventPrecisionChanges bit(1) NOT NULL
);

CREATE TABLE DateQuestionVersionLog (
    dqv_quv_QuestionVersionId int(4) NOT NULL,
    dqv_dpy_DatePrecisionTypeId int(4) NOT NULL,
    dqv_PreventPrecisionChanges bit(1) NOT NULL,
    dqv_ObjectId int(4) NOT NULL,
    dqv_DateAdded datetime(8) NOT NULL,
    dqv_AddedBy uniqueidentifier(16) NOT NULL,
    dqv_TransactionId uniqueidentifier(16) NOT NULL,
    dqv_Action char(1) NOT NULL
);

CREATE TABLE DayOfSurgeryChecksDropsAndMedicationItemDuplicateMedicationRemovalBackup (
    pde_id int(4) NOT NULL,
    pde_act_id uniqueidentifier(16) NOT NULL,
    pde_bod_id int(4),
    pde_mcn_id int(4) NOT NULL,
    pde_dro_id int(4) NOT NULL,
    pde_dco_id int(4) NOT NULL,
    pde_use_id_PrescribedBy uniqueidentifier(16) NOT NULL,
    pde_PrescribedDate datetime(8) NOT NULL,
    pde_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE DayOfSurgeryChecksPlannedProcedureMedicationItemDuplicateMedicationRemovalBackup (
    dmi_id int(4) NOT NULL,
    dmi_dpm_id int(4) NOT NULL,
    dmi_bod_id int(4),
    dmi_mcn_id int(4) NOT NULL,
    dmi_dro_id int(4) NOT NULL,
    dmi_dco_id int(4) NOT NULL,
    dmi_use_id_PrescribedBy uniqueidentifier(16) NOT NULL,
    dmi_PrescribedDate datetime(8) NOT NULL,
    dmi_AdditionalNotes nvarchar(500),
    dmi_StartDateDayAfterSurgery bit(1),
    dmi_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE DayOfSurgeryChecksPlannedProcedureMedicationRemovalBackup (
    dpm_id int(4) NOT NULL,
    dpm_pln_id int(4) NOT NULL,
    dpm_dsc_id int(4) NOT NULL,
    dpm_NotRequired bit(1) NOT NULL,
    dpm_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE DBVersion (
    DBVersionId int(4) NOT NULL,
    InsertedOn datetime(8) NOT NULL,
    Comments nvarchar(400)
);

CREATE TABLE Default (
    Id int(4) NOT NULL,
    DeviceId int(4),
    EncounterTypeId int(4) NOT NULL
);

CREATE TABLE defaultdrugoptions (
    ddo_id int(4) NOT NULL,
    ddo_mcn_id int(4),
    ddo_dro_id int(4),
    ddo_dco_id int(4),
    ddo_order int(4),
    ddo_additionalNotes nvarchar(500)
);

CREATE TABLE DefaultDrugOptionsDuplicateMedicationRemovalBackup (
    ddo_id int(4) NOT NULL,
    ddo_mcn_id int(4),
    ddo_drs_id int(4),
    ddo_dro_id int(4),
    ddo_dco_id int(4),
    ddo_order int(4),
    ddo_additionalNotes nvarchar(500),
    ddo_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE defaultdrugoptionslog (
    ddo_objectId int(4) NOT NULL,
    ddo_id int(4) NOT NULL,
    ddo_mcn_id int(4),
    ddo_drs_id int(4),
    ddo_dro_id int(4),
    ddo_dco_id int(4),
    ddo_order int(4),
    ddo_dateadded datetime(8) NOT NULL,
    ddo_addedby uniqueidentifier(16) NOT NULL,
    ddo_transactionid uniqueidentifier(16) NOT NULL,
    ddo_action char(1) NOT NULL,
    ddo_additionalNotes nvarchar(500)
);

CREATE TABLE DefaultDrugs (
    sdd_SurgeonDefaultId int(4) NOT NULL,
    sdd_lks_id int(4) NOT NULL,
    sdd_dro_id int(4) NOT NULL,
    sdd_mcn_id int(4) NOT NULL
);

CREATE TABLE DefaultDrugsLog (
    sdd_SurgeonDefaultId int(4) NOT NULL,
    sdd_ObjectId int(4) NOT NULL,
    sdd_DateAdded datetime(8) NOT NULL,
    sdd_AddedBy uniqueidentifier(16) NOT NULL,
    sdd_Transactionid uniqueidentifier(16) NOT NULL,
    sdd_Action char(1) NOT NULL,
    sdd_lks_id int(4),
    sdd_dro_id int(4),
    sdd_mcn_id int(4)
);

CREATE TABLE DefaultExpiration (
    pfe_Id int(4) NOT NULL,
    pfe_Name nvarchar(100)
);

CREATE TABLE DefaultLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    DeviceId int(4),
    EncounterTypeId int(4) NOT NULL
);

CREATE TABLE DefaultQuestionResponse (
    QuestionVersionId int(4) NOT NULL,
    QuestionResponseVersionId int(4) NOT NULL
);

CREATE TABLE defaults (
    def_id int(4) NOT NULL
);

CREATE TABLE defaultslog (
    def_objectId int(4) NOT NULL,
    def_id int(4) NOT NULL,
    def_use_id uniqueidentifier(16),
    def_loc_id uniqueidentifier(16),
    def_host varchar(255),
    def_set_id int(4) NOT NULL,
    def_value varchar(255),
    def_valuenumeric decimal(9),
    def_dateadded datetime(8) NOT NULL,
    def_addedby uniqueidentifier(16) NOT NULL,
    def_transactionid uniqueidentifier(16) NOT NULL,
    def_action char(1) NOT NULL
);

CREATE TABLE Dependency (
    vde_Id int(4) NOT NULL,
    vde_Description varchar(500),
    vde_Executed bit(1)
);

CREATE TABLE DependencyIolPowerCalculation (
    dpc_id int(4) NOT NULL
);

CREATE TABLE DependencyLog (
    vde_Id int(4) NOT NULL,
    vde_ObjectId int(4) NOT NULL,
    vde_DateAdded datetime(8) NOT NULL,
    vde_AddedBy uniqueidentifier(16) NOT NULL,
    vde_Transactionid uniqueidentifier(16) NOT NULL,
    vde_Action char(1) NOT NULL,
    vde_Description varchar(500),
    vde_Executed bit(1)
);

CREATE TABLE deploymentlog (
    dpl_major int(4),
    dpl_minor int(4),
    dpl_build int(4),
    dpl_revision int(4),
    dpl_script int(4),
    dpl_Id int(4) NOT NULL
);

CREATE TABLE DeploymentLogDateTime (
    DeploymentLogDateTimeId int(4) NOT NULL,
    DeploymentLogId int(4) NOT NULL,
    DeploymentLogVersion varchar(200) NOT NULL,
    InsertDateTime datetime(8) NOT NULL
);

CREATE TABLE DeploymentLogDeletionioneAudit (
    DeploymentLog varchar(200),
    InsertDateTime datetime(8) NOT NULL,
    DeletionioneAuditId int(4) NOT NULL
);

CREATE TABLE Destination (
    hmd_Id int(4) NOT NULL
);

CREATE TABLE DestinationScanType (
    dst_hmd_DestinationId int(4) NOT NULL,
    dst_hst_ScanTypeId int(4) NOT NULL
);

CREATE TABLE devdefaultiolmodels (
    rowid int(4) NOT NULL,
    IOL model Id uniqueidentifier(16),
    Name* varchar(255),
    Short name varchar(255),
    Description varchar(255),
    Manufacturer's A constant* varchar(255),
    Optical (IOL Master) A varchar(255),
    Optical (IOL Master) pACD varchar(255),
    Optical (IOL Master) SF varchar(255),
    Optical (IOL Master) a0 varchar(255),
    Optical (IOL Master) a1 varchar(255),
    Optical (IOL Master) a2 varchar(255),
    Lens type varchar(255),
    Phakic varchar(255),
    Premium lens varchar(255),
    Aspheric varchar(255),
    Blue blocking varchar(255),
    Ref index varchar(255),
    Optic material varchar(255),
    Haptic material varchar(255),
    Optic size width varchar(255),
    Optic size height varchar(255),
    Length varchar(255),
    Haptic angle varchar(255),
    Optic style varchar(255),
    Haptic style varchar(255),
    Pieces varchar(255),
    Range 1 From varchar(255),
    Range 1 To varchar(255),
    Range 1 Incr varchar(255),
    Range 2 From varchar(255),
    Range 2 To varchar(255),
    Range 2 Incr varchar(255),
    Range 3 From varchar(255),
    Range 3 To varchar(255),
    Range 3 Incr varchar(255),
    Range 4 From varchar(255),
    Range 4 To varchar(255),
    Range 4 Incr varchar(255),
    Range 5 From varchar(255),
    Range 5 To varchar(255),
    Range 5 Incr varchar(255),
    version decimal(5),
    processed bit(1),
    Optical (IOL Master) LF varchar(255),
    Design Factor varchar(255)
);

CREATE TABLE DeviationAfterSurgery (
    Id int(4) NOT NULL
);

CREATE TABLE device (
    dev_id uniqueidentifier(16) NOT NULL,
    dev_deviceid varchar(32),
    dev_name varchar(32),
    dev_macaddress varchar(17),
    dev_os varchar(255),
    dev_lastlogin datetime(8) NOT NULL,
    dev_loc_id uniqueidentifier(16),
    dev_use_id uniqueidentifier(16),
    dev_lastlogout datetime(8),
    dev_TotalPhysicalMemoryInBytes bigint(8)
);

CREATE TABLE devicelog (
    dev_objectId uniqueidentifier(16) NOT NULL,
    dev_id int(4) NOT NULL,
    dev_deviceid varchar(32),
    dev_name varchar(32),
    dev_macaddress varchar(17),
    dev_os varchar(255),
    dev_lastlogin datetime(8),
    dev_loc_id uniqueidentifier(16),
    dev_use_id uniqueidentifier(16),
    dev_dateadded datetime(8) NOT NULL,
    dev_addedby uniqueidentifier(16) NOT NULL,
    dev_transactionid uniqueidentifier(16) NOT NULL,
    dev_action char(1) NOT NULL,
    dev_lastlogout datetime(8),
    dev_TotalPhysicalMemoryInBytes bigint(8)
);

CREATE TABLE DeviceScreen (
    dsc_Id int(4) NOT NULL,
    dsc_dev_DeviceId uniqueidentifier(16) NOT NULL,
    dsc_XResolution int(4) NOT NULL,
    dsc_YResolution int(4) NOT NULL,
    dsc_XDpiScale decimal(5) NOT NULL,
    dsc_YDpiScale decimal(5) NOT NULL
);

CREATE TABLE DeviceType (
    ird_Id int(4) NOT NULL,
    ird_lkt_DeviceLookupType int(4) NOT NULL,
    ird_OmitWhenInGroup bit(1) NOT NULL
);

CREATE TABLE devindexlistmaster (
    TableName sysname(256) NOT NULL,
    TableID int(4) NOT NULL,
    IndexName sysname(256),
    IndexID int(4) NOT NULL,
    IndexType nvarchar(120),
    FillFactor tinyint(1) NOT NULL,
    IsPadded bit(1),
    ColumnName sysname(256),
    IndexColumnOrdinal tinyint(1) NOT NULL,
    IsPrimaryKey bit(1),
    IsIncludedColumn bit(1),
    DateAdded datetime(8) NOT NULL,
    ColumnList varchar(8000)
);

CREATE TABLE DevMergeConceptsSchema (
    ParentID float(8),
    ParentName nvarchar(510),
    ChildID float(8),
    ChildName nvarchar(510)
);

CREATE TABLE DevVR1to1Mappings (
    RowId int(4) NOT NULL,
    Section nvarchar(510),
    Field nvarchar(510),
    Type nvarchar(510),
    Value nvarchar(510),
    Procedure nvarchar(510),
    MappingDirection nvarchar(510),
    Processed bit(1)
);

CREATE TABLE devwarningcheckstatus (
    dws_id int(4) NOT NULL,
    dws_name varchar(255),
    dws_clusteredindexcheck bit(1),
    dws_multipleindexcheck bit(1),
    dws_extendedpropertycheck bit(1)
);

CREATE TABLE DiabeticControlMethod (
    Id int(4) NOT NULL,
    Control nvarchar(200)
);

CREATE TABLE DiabeticEyeScreeningFeature (
    Id int(4) NOT NULL,
    Feature nvarchar(510)
);

CREATE TABLE DiabeticEyeScreeningFeatureMapping (
    Id int(4) NOT NULL,
    FeatureId int(4) NOT NULL,
    ClinicalConceptId int(4),
    FreeText nvarchar(400)
);

CREATE TABLE DiabeticEyeScreeningOtherCondition (
    Id int(4) NOT NULL,
    Description nvarchar(510)
);

CREATE TABLE DiabeticEyeScreeningOtherConditionMapping (
    Id int(4) NOT NULL,
    OtherConditionId int(4) NOT NULL,
    ClinicalConceptId int(4),
    FreeText nvarchar(400)
);

CREATE TABLE DiabeticEyeScreeningPathway (
    Id int(4) NOT NULL,
    Pathway varchar(255) NOT NULL
);

CREATE TABLE DiabeticEyeScreeningProcedure (
    Id int(4) NOT NULL
);

CREATE TABLE DiabeticEyeScreeningProcedureMapping (
    Id int(4) NOT NULL,
    DiabeticEyeScreeningProcedureId int(4) NOT NULL
);

CREATE TABLE DiabeticEyeScreeningReferral (
    ReferralRequestId int(4) NOT NULL,
    DateOfScreening date(3) NOT NULL,
    DateOfNotification date(3),
    ReferredFromPathway int(4) NOT NULL,
    DiabeticEyeScreeningOutcome int(4) NOT NULL,
    ScreeningComments varchar(2000),
    NotesForOphthalmologist varchar(2000),
    DiabeticEyeScreeningProgrammeCode nvarchar(510) NOT NULL
);

CREATE TABLE DiabeticStatusRequest (
    DiabeticType int(4),
    RequestId int(4) NOT NULL,
    IsDiabetic bit(1) NOT NULL,
    OnsetOfDiabetesYear int(4),
    OnsetOfDiabetesMonth int(4),
    OnsetOfDiabetesDay int(4),
    DiabeticEyeScreeningProgrammeCode nvarchar(510)
);

CREATE TABLE DiabeticStatusRequestControlMethod (
    Id int(4) NOT NULL,
    DiabeticRequestId int(4) NOT NULL,
    ControlMethodId int(4) NOT NULL
);

CREATE TABLE DiabeticType (
    Id int(4) NOT NULL,
    Type nvarchar(200)
);

CREATE TABLE Diplopia (
    Id int(4) NOT NULL,
    DiplopiaName nvarchar(6) NOT NULL
);

CREATE TABLE DiplopiaPreAdjustment (
    Id int(4) NOT NULL
);

CREATE TABLE Direction (
    Id int(4) NOT NULL,
    DirectionName nvarchar(10) NOT NULL
);

CREATE TABLE DischargePlanningComments (
    dpc_ActivityId uniqueidentifier(16) NOT NULL,
    dpc_Comments nvarchar(8000)
);

CREATE TABLE DischargePlanningCommentsLog (
    dpc_ActivityId int(4) NOT NULL,
    dpc_ObjectId uniqueidentifier(16) NOT NULL,
    dpc_DateAdded datetime(8) NOT NULL,
    dpc_AddedBy uniqueidentifier(16) NOT NULL,
    dpc_Transactionid uniqueidentifier(16) NOT NULL,
    dpc_Action char(1) NOT NULL,
    dpc_Comments nvarchar(8000)
);

CREATE TABLE DischargeReasons (
    cdr_id int(4) NOT NULL
);

CREATE TABLE Distance (
    Id int(4) NOT NULL,
    DistanceName nvarchar(20) NOT NULL
);

CREATE TABLE documentcategory (
    dcy_id int(4) NOT NULL,
    dcy_dcs_id int(4) NOT NULL,
    dcy_name nvarchar(510) NOT NULL
);

CREATE TABLE DocumentClass (
    dcs_id int(4) NOT NULL,
    dcs_name nvarchar(510) NOT NULL,
    dcs_batchprintable bit(1)
);

CREATE TABLE documentexport (
    dex_id int(4) NOT NULL,
    dex_versiontoexport int(4) NOT NULL,
    dex_isdeleted bit(1) NOT NULL,
    dex_exportattempts int(4) NOT NULL,
    dex_nextexportattempt datetime(8),
    dex_deg_GroupId int(4) NOT NULL,
    dex_IsCancelMessage bit(1) NOT NULL,
    dex_ExportedFileName nvarchar(2000),
    dex_CaseNumber nvarchar(60),
    dex_BillingReference nvarchar(60)
);

CREATE TABLE documentexportendpoint (
    dee_id int(4) NOT NULL,
    dee_name varchar(255) NOT NULL,
    dee_active bit(1) NOT NULL
);

CREATE TABLE DocumentExportLog (
    dex_Id int(4) NOT NULL,
    dex_ObjectId int(4) NOT NULL,
    dex_DateAdded datetime(8) NOT NULL,
    dex_AddedBy uniqueidentifier(16) NOT NULL,
    dex_TransactionId uniqueidentifier(16) NOT NULL,
    dex_Action char(1) NOT NULL,
    dex_doc_id uniqueidentifier(16),
    dex_versiontoexport int(4) NOT NULL,
    dex_dee_id int(4) NOT NULL,
    dex_dor_id int(4) NOT NULL,
    dex_isdeleted bit(1) NOT NULL,
    dex_exportattempts int(4) NOT NULL,
    dex_nextexportattempt datetime(8),
    dex_deg_GroupId int(4) NOT NULL,
    dex_IsCancelMessage bit(1) NOT NULL,
    dex_ExportedFileName nvarchar(2000),
    dex_CaseNumber nvarchar(60),
    dex_BillingReference nvarchar(60)
);

CREATE TABLE documentexportstatus (
    des_id int(4) NOT NULL,
    des_validationresult nvarchar(-1)
);

CREATE TABLE documenthistory (
    dhy_id int(4) NOT NULL,
    dhy_processsubject int(4),
    dhy_detail varchar(255)
);

CREATE TABLE documentprocessstage (
    dps_id int(4) NOT NULL,
    dps_name nvarchar(510) NOT NULL,
    dps_description nvarchar(510) NOT NULL
);

CREATE TABLE documentrecipient (
    dor_id int(4) NOT NULL,
    dor_addressname nvarchar(510),
    dor_forename nvarchar(510),
    dor_lks_id_gender int(4),
    dor_drg_GroupId int(4) NOT NULL,
    dor_includeInAllFutureCorrespondence bit(1),
    dor_add_AddressId uniqueidentifier(16),
    dor_LargePrint bit(1) NOT NULL,
    dor_UniqueDocumentRecipientKey uniqueidentifier(16) NOT NULL
);

CREATE TABLE DocumentRecipientGroup (
    drg_Id int(4) NOT NULL
);

CREATE TABLE documentrecipientlog (
    dor_objectId int(4) NOT NULL,
    dor_id int(4) NOT NULL,
    dor_doc_id uniqueidentifier(16) NOT NULL,
    dor_version int(4) NOT NULL,
    dor_lks_id_recipient int(4) NOT NULL,
    dor_address1 nvarchar(510),
    dor_address2 nvarchar(510),
    dor_address3 nvarchar(510),
    dor_address4 nvarchar(510),
    dor_postcode varchar(255),
    dor_initials nvarchar(510),
    dor_surname nvarchar(510),
    dor_title nvarchar(510),
    dor_firstname nvarchar(510),
    dor_source int(4) NOT NULL,
    dor_signoff varchar(255),
    dor_includeaddresspage bit(1) NOT NULL,
    dor_batchcopies int(4) NOT NULL,
    dor_localcopies int(4) NOT NULL,
    dor_edoc bit(1) NOT NULL,
    dor_lks_id_recipienttype int(4),
    dor_organisation nvarchar(510),
    dor_includeaddresspagebatch bit(1),
    dor_jobtitle nvarchar(510),
    dor_recipient_id uniqueidentifier(16),
    dor_address5 nvarchar(510),
    dor_addressname nvarchar(510),
    dor_forename nvarchar(510),
    dor_dateadded datetime(8) NOT NULL,
    dor_addedby uniqueidentifier(16) NOT NULL,
    dor_transactionid uniqueidentifier(16) NOT NULL,
    dor_action char(1) NOT NULL,
    dor_copies int(4),
    dor_lks_id_gender int(4),
    dor_drg_GroupId int(4),
    dor_includeInAllFutureCorrespondence bit(1),
    dor_add_AddressId uniqueidentifier(16),
    dor_LargePrint bit(1),
    dor_UniqueDocumentRecipientKey uniqueidentifier(16)
);

CREATE TABLE documentrecipientoverride (
    dov_id int(4) NOT NULL,
    dov_include bit(1) NOT NULL,
    dov_lks_id_recipient int(4) NOT NULL,
    dov_address1 nvarchar(510),
    dov_address2 nvarchar(510),
    dov_address3 nvarchar(510),
    dov_address4 nvarchar(510),
    dov_postcode varchar(255),
    dov_initials nvarchar(510),
    dov_surname nvarchar(510),
    dov_title nvarchar(510),
    dov_firstname nvarchar(510),
    dov_source int(4) NOT NULL,
    dov_copies int(4) NOT NULL,
    dov_signoff varchar(255),
    dov_includeaddresspage bit(1) NOT NULL,
    dov_batchcopies int(4) NOT NULL,
    dov_localcopies int(4) NOT NULL,
    dov_edoc bit(1) NOT NULL,
    dov_lks_id_recipienttype int(4),
    dov_organisation nvarchar(510),
    dov_includeaddresspagebatch bit(1),
    dov_jobtitle nvarchar(510),
    dov_recipient_id uniqueidentifier(16),
    dov_address5 nvarchar(510),
    dov_addressname nvarchar(510),
    dov_forename nvarchar(510),
    dov_lks_id_gender int(4),
    dov_LargePrint bit(1) NOT NULL
);

CREATE TABLE documentrecipientoverridelog (
    dov_objectId int(4) NOT NULL,
    dov_id int(4) NOT NULL,
    dov_dtp_id int(4) NOT NULL,
    dov_pat_id uniqueidentifier(16) NOT NULL,
    dov_datecreated datetime(8) NOT NULL,
    dov_include bit(1) NOT NULL,
    dov_lks_id_recipient int(4) NOT NULL,
    dov_address1 nvarchar(510),
    dov_address2 nvarchar(510),
    dov_address3 nvarchar(510),
    dov_address4 nvarchar(510),
    dov_postcode varchar(255),
    dov_initials nvarchar(510),
    dov_surname nvarchar(510),
    dov_title nvarchar(510),
    dov_firstname nvarchar(510),
    dov_source int(4) NOT NULL,
    dov_copies int(4) NOT NULL,
    dov_signoff varchar(255),
    dov_includeaddresspage bit(1) NOT NULL,
    dov_batchcopies int(4) NOT NULL,
    dov_localcopies int(4) NOT NULL,
    dov_edoc bit(1) NOT NULL,
    dov_lks_id_recipienttype int(4),
    dov_organisation nvarchar(510),
    dov_includeaddresspagebatch bit(1),
    dov_jobtitle nvarchar(510),
    dov_recipient_id uniqueidentifier(16),
    dov_address5 nvarchar(510),
    dov_addressname nvarchar(510),
    dov_forename nvarchar(510),
    dov_dateadded datetime(8) NOT NULL,
    dov_addedby uniqueidentifier(16) NOT NULL,
    dov_transactionid uniqueidentifier(16) NOT NULL,
    dov_action char(1) NOT NULL,
    dov_lks_id_gender int(4),
    dov_LargePrint bit(1)
);

CREATE TABLE documentrecipienttype (
    dre_id int(4) NOT NULL,
    dre_dtp_id int(4) NOT NULL,
    dre_lks_id_recipient int(4) NOT NULL
);

CREATE TABLE DocumentStaging (
    mds_id uniqueidentifier(16) NOT NULL,
    mds_source_epi_id uniqueidentifier(16) NOT NULL,
    mds_target_epi_id uniqueidentifier(16),
    mds_blob varbinary(-1),
    mds_datecreated datetime(8),
    mds_contenttype int(4),
    mds_let_id uniqueidentifier(16) NOT NULL,
    mds_dtp_id int(4) NOT NULL,
    mds_let_printed bit(1) NOT NULL,
    mds_let_esigned bit(1) NOT NULL,
    mds_ismain bit(1) NOT NULL,
    mds_version int(4),
    mds_documentcreatedate datetime(8),
    mds_storedonfilesystem bit(1)
);

CREATE TABLE documentstatus (
    dst_id int(4) NOT NULL,
    dst_name nvarchar(510) NOT NULL,
    dst_isaction bit(1) NOT NULL
);

CREATE TABLE documentTemplate_bak (
    dtm_id int(4) NOT NULL,
    dtm_name nvarchar(1024) NOT NULL,
    dtm_dtp_id int(4) NOT NULL,
    dtm_tbk_id_rootBlock int(4) NOT NULL,
    dtm_displayName nvarchar(1024)
);

CREATE TABLE documenttype (
    dtp_id int(4) NOT NULL,
    dtp_type tinyint(1),
    dtp_name nvarchar(510),
    dtp_available bit(1),
    dtp_code nvarchar(510),
    dtp_edit int(4),
    dtp_orientation int(4),
    dtp_flag int(4),
    dtp_dcy_id int(4),
    dtp_defaultNote bit(1),
    dtp_isencounterletter bit(1) NOT NULL
);

CREATE TABLE DonorInsertion (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    StainId int(4),
    LeftInSitu int(4) NOT NULL,
    StainId int(4),
    DonorInsertion_LookupDataId int(4) NOT NULL,
    GasBubbleId int(4) NOT NULL,
    DonorInsertionId int(4),
    GasBubbleConcentration int(4),
    HighPressureTime int(4),
    GasBubbleId int(4),
    Concentration int(4),
    LeftInSitu int(4),
    SizeReducedTo int(4),
    HighPressureTime int(4),
    SizeReducedTo int(4)
);

CREATE TABLE DonorInsertionLog (
    Id int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    LeftInSitu int(4) NOT NULL,
    StainId int(4),
    DonorInsertion_LookupDataId int(4) NOT NULL,
    StainId int(4),
    DonorInsertionId int(4),
    GasBubbleId int(4) NOT NULL,
    GasBubbleConcentration int(4),
    HighPressureTime int(4),
    GasBubbleId int(4),
    Concentration int(4),
    LeftInSitu int(4),
    SizeReducedTo int(4),
    HighPressureTime int(4),
    SizeReducedTo int(4)
);

CREATE TABLE DonorPositioning (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE DonorPreparation (
    ActivityId uniqueidentifier(16) NOT NULL,
    Id int(4) NOT NULL,
    OrientationMarkId int(4),
    TransplantNumber nvarchar(60) NOT NULL,
    Precut bit(1) NOT NULL,
    Precut bit(1) NOT NULL,
    MethodId int(4),
    MethodId int(4),
    InstrumentId int(4),
    InstrumentId int(4),
    ThicknessOfDonor int(4),
    DiameterOfDonor decimal(5) NOT NULL,
    ThicknessOfDonor int(4),
    AdditionalThinningPerformed bit(1) NOT NULL,
    AdditionalThinningPerformed bit(1) NOT NULL,
    EndothelialCellCount int(4),
    OrientationMarkId int(4),
    AgeOfDonor int(4)
);

CREATE TABLE DonorPreparationLog (
    ActivityId int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    TransplantNumber nvarchar(60) NOT NULL,
    OrientationMarkId int(4),
    Precut bit(1) NOT NULL,
    Precut bit(1) NOT NULL,
    MethodId int(4),
    MethodId int(4),
    InstrumentId int(4),
    InstrumentId int(4),
    DiameterOfDonor decimal(5) NOT NULL,
    ThicknessOfDonor int(4),
    AdditionalThinningPerformed bit(1) NOT NULL,
    ThicknessOfDonor int(4),
    AdditionalThinningPerformed bit(1) NOT NULL,
    EndothelialCellCount int(4),
    OrientationMarkId int(4),
    AgeOfDonor int(4)
);

CREATE TABLE Drinking (
    pdk_pss_id int(4) NOT NULL,
    pdk_lks_status int(4) NOT NULL,
    pdk_unitsperweek int(4),
    pdk_comments nvarchar(-1)
);

CREATE TABLE Driving (
    psd_pss_id int(4) NOT NULL,
    psd_lks_status int(4) NOT NULL,
    psd_comments nvarchar(-1)
);

CREATE TABLE DrivingVehicle (
    psv_pss_id int(4) NOT NULL,
    psv_lks_vehicle int(4) NOT NULL
);

CREATE TABLE DropsAndMedicationAdministeredItem (
    pda_id int(4) NOT NULL,
    pda_pde_id int(4) NOT NULL,
    pda_TimeGiven time(5) NOT NULL,
    pda_pdt_Expired uniqueidentifier(16),
    pda_BatchNumber varchar(255),
    pda_ois_id int(4),
    pda_Deleted bit(1) NOT NULL,
    pda_bod_id int(4),
    pda_use_id_AdministeredBy uniqueidentifier(16) NOT NULL
);

CREATE TABLE DropsAndMedicationAdministeredItemLog (
    pda_id int(4) NOT NULL,
    pda_ObjectId int(4) NOT NULL,
    pda_DateAdded datetime(8) NOT NULL,
    pda_AddedBy uniqueidentifier(16) NOT NULL,
    pda_Transactionid uniqueidentifier(16) NOT NULL,
    pda_Action char(1) NOT NULL,
    pda_pde_id int(4) NOT NULL,
    pda_TimeGiven time(5) NOT NULL,
    pda_pdt_Expired uniqueidentifier(16),
    pda_BatchNumber varchar(255),
    pda_ois_id int(4),
    pda_Deleted bit(1) NOT NULL,
    pda_bod_id int(4),
    pda_use_id_AdministeredBy uniqueidentifier(16) NOT NULL
);

CREATE TABLE DropsAndMedicationItem (
    pde_id int(4) NOT NULL,
    pde_bod_id int(4),
    pde_mcn_id int(4) NOT NULL,
    pde_dro_id int(4) NOT NULL,
    pde_dco_id int(4) NOT NULL,
    pde_use_id_PrescribedBy uniqueidentifier(16) NOT NULL,
    pde_PrescribedDate datetime(8) NOT NULL
);

CREATE TABLE DropsAndMedicationItemLog (
    pde_id int(4) NOT NULL,
    pde_ObjectId int(4) NOT NULL,
    pde_DateAdded datetime(8) NOT NULL,
    pde_AddedBy uniqueidentifier(16) NOT NULL,
    pde_Transactionid uniqueidentifier(16) NOT NULL,
    pde_Action char(1) NOT NULL,
    pde_act_id uniqueidentifier(16) NOT NULL,
    pde_bod_id int(4),
    pde_mcn_id int(4) NOT NULL,
    pde_dro_id int(4) NOT NULL,
    pde_dco_id int(4) NOT NULL,
    pde_use_id_PrescribedBy uniqueidentifier(16) NOT NULL,
    pde_PrescribedDate datetime(8) NOT NULL
);

CREATE TABLE drugactualproduct (
    dap_id int(4) NOT NULL,
    dap_strength nvarchar(510),
    dap_strengthandform nvarchar(510),
    dap_dfm_id int(4),
    dap_preservativefree bit(1) NOT NULL,
    dap_modifiedrelease bit(1) NOT NULL,
    dap_description nvarchar(4000),
    dap_descriptionshort nvarchar(4000),
    dap_dcl_id int(4),
    dap_ampid bigint(8),
    dap_available bit(1),
    dap_atc nvarchar(510),
    dap_generic bit(1) NOT NULL,
    dap_invalid bit(1) NOT NULL,
    dap_mdd_id int(4)
);

CREATE TABLE DrugActualProductDuplicate (
    dad_id int(4) NOT NULL,
    dad_dap_id_duplicate int(4),
    dad_dap_description_duplicate nvarchar(8000),
    dad_dap_ampid_duplicate bigint(8),
    dad_dap_id_master int(4),
    dad_dap_description_master nvarchar(8000),
    dad_dap_ampid_master bigint(8)
);

CREATE TABLE DrugActualProductDuplicateMedicationRemovalBackup (
    dap_id int(4) NOT NULL,
    dap_dvp_id int(4),
    dap_dbr_id int(4),
    dap_strength nvarchar(510),
    dap_strengthandform nvarchar(510),
    dap_dfm_id int(4),
    dap_preservativefree bit(1) NOT NULL,
    dap_modifiedrelease bit(1) NOT NULL,
    dap_description nvarchar(510),
    dap_descriptionshort nvarchar(510),
    dap_descriptionshortforsearch nvarchar(510),
    dap_dcl_id int(4),
    dap_ampid bigint(8),
    dap_available bit(1),
    dap_atc nvarchar(510),
    dap_generic bit(1) NOT NULL,
    dap_invalid bit(1) NOT NULL
);

CREATE TABLE DrugActualProductPatchHistory (
    dap_id int(4) NOT NULL,
    dap_dvp_id int(4),
    dap_dbr_id int(4),
    dap_strength nvarchar(510),
    dap_strengthandform nvarchar(510),
    dap_dfm_id int(4),
    dap_preservativefree bit(1) NOT NULL,
    dap_modifiedrelease bit(1) NOT NULL,
    dap_description nvarchar(4000),
    dap_descriptionshort nvarchar(4000),
    dap_descriptionshortforsearch nvarchar(4000),
    dap_dcl_id int(4),
    dap_ampid bigint(8),
    dap_available bit(1),
    dap_atc nvarchar(510),
    dap_generic bit(1) NOT NULL,
    dap_invalid bit(1) NOT NULL,
    dap_mdd_id int(4) NOT NULL,
    dap_pns_id int(4) NOT NULL,
    dap_identifier uniqueidentifier(16)
);

CREATE TABLE DrugActualProductVersionHistory (
    dap_id int(4) NOT NULL,
    dap_dvp_id int(4),
    dap_dbr_id int(4),
    dap_strength nvarchar(510),
    dap_strengthandform nvarchar(510),
    dap_dfm_id int(4),
    dap_preservativefree bit(1) NOT NULL,
    dap_modifiedrelease bit(1) NOT NULL,
    dap_description nvarchar(4000),
    dap_descriptionshort nvarchar(4000),
    dap_descriptionshortforsearch nvarchar(4000),
    dap_dcl_id int(4),
    dap_ampid bigint(8),
    dap_available bit(1),
    dap_atc nvarchar(510),
    dap_generic bit(1) NOT NULL,
    dap_invalid bit(1) NOT NULL,
    dap_mdd_id int(4),
    dap_identifier uniqueidentifier(16),
    PackageVersion int(4) NOT NULL
);

CREATE TABLE drugbrand (
    dbr_id int(4) NOT NULL,
    dbr_description nvarchar(4000),
    dbr_concept_id bigint(8),
    dbr_available bit(1),
    dbr_custom bit(1),
    dbr_mdd_id int(4)
);

CREATE TABLE DrugBrandDuplicate (
    dbd_id int(4) NOT NULL,
    dbd_dbr_id_duplicate int(4),
    dbd_dbr_description_duplicate nvarchar(8000),
    dbd_dbr_concept_id_duplicate bigint(8),
    dbd_dbr_id_master int(4),
    dbd_dbr_description_master nvarchar(8000),
    dbd_dbr_concept_id_master bigint(8)
);

CREATE TABLE DrugBrandDuplicateMedicationRemovalBackup (
    dbr_id int(4) NOT NULL,
    dbr_description nvarchar(510),
    dbr_concept_id bigint(8),
    dbr_available bit(1),
    dbr_custom bit(1)
);

CREATE TABLE DrugBrandPatchHistory (
    dbr_id int(4) NOT NULL,
    dbr_description nvarchar(4000),
    dbr_concept_id bigint(8),
    dbr_available bit(1),
    dbr_custom bit(1),
    dbr_mdd_id int(4) NOT NULL,
    dbr_pns_id int(4) NOT NULL,
    dbr_identifier uniqueidentifier(16)
);

CREATE TABLE DrugBrandVersionHistory (
    dbr_id int(4) NOT NULL,
    dbr_description nvarchar(4000),
    dbr_concept_id bigint(8),
    dbr_available bit(1),
    dbr_custom bit(1),
    dbr_identifier uniqueidentifier(16),
    dbr_mdd_id int(4),
    PackageVersion int(4) NOT NULL
);

CREATE TABLE drugcategory (
    dca_id int(4) NOT NULL,
    dca_desclong nvarchar(510),
    dca_descshort nvarchar(510),
    dca_order int(4)
);

CREATE TABLE drugclass (
    dcl_id int(4) NOT NULL,
    dcl_desclong nvarchar(510),
    dcl_descshort nvarchar(510),
    dcl_dca_id int(4) NOT NULL,
    dcl_order int(4)
);

CREATE TABLE drugcontainer (
    drv_id int(4) NOT NULL,
    drv_description nvarchar(510),
    drv_mdd_id int(4)
);

CREATE TABLE drugcourse (
    dco_id int(4) NOT NULL,
    dco_taperingcourse bit(1) NOT NULL,
    dco_totaldurationintervalnumber int(4),
    dco_totaldurationcontextflag int(4),
    dco_coursedescription varchar(255)
);

CREATE TABLE drugcourseitem (
    dci_id int(4) NOT NULL
);

CREATE TABLE DrugDatabase (
    ddb_id int(4) NOT NULL,
    ddb_description nvarchar(510) NOT NULL
);

CREATE TABLE drugdose (
    dos_id int(4) NOT NULL,
    dos_code varchar(255),
    dos_desc nvarchar(510),
    dos_order int(4) NOT NULL,
    dos_flexible bit(1),
    dos_descex nvarchar(510),
    dos_ddt_id int(4),
    dos_numericvalue float(8),
    dos_textvalue nvarchar(510)
);

CREATE TABLE drugdoseunit (
    ddt_id int(4) NOT NULL,
    ddt_description nvarchar(510),
    ddt_descriptionextended nvarchar(510),
    ddt_singular nvarchar(510)
);

CREATE TABLE drugduration (
    ddu_id int(4) NOT NULL,
    ddu_code varchar(255) NOT NULL,
    ddu_desc nvarchar(510),
    ddu_order int(4) NOT NULL,
    ddu_intervalno int(4),
    ddu_promotedstatus int(4),
    ddu_ddc_id int(4),
    ddu_intervaltype varchar(2),
    ddu_descex nvarchar(510)
);

CREATE TABLE DrugDurationContext (
    ddc_id int(4) NOT NULL
);

CREATE TABLE drugfamily (
    dfy_id int(4) NOT NULL,
    dfy_desclong nvarchar(510),
    dfy_descshort nvarchar(510),
    dfy_dcl_id int(4),
    dfy_order int(4)
);

CREATE TABLE drugform (
    dfm_id int(4) NOT NULL,
    dfm_description nvarchar(510),
    dfm_ddt_id int(4),
    dfm_concept_id bigint(8),
    dfm_mdd_id int(4)
);

CREATE TABLE drugfrequency (
    dfr_id int(4) NOT NULL,
    dfr_code varchar(255) NOT NULL,
    dfr_desc nvarchar(510),
    dfr_order int(4) NOT NULL,
    dfr_descex nvarchar(510),
    dfr_promotedstatus int(4),
    dfr_dfc_id int(4)
);

CREATE TABLE DrugFrequencyContext (
    dfc_id int(4) NOT NULL
);

CREATE TABLE DrugMigration (
    MedisoftID int(4),
    MedisoftIDOld uniqueidentifier(16) NOT NULL,
    MedisoftDrug nvarchar(510),
    DMDBrand nvarchar(510),
    MedisoftBrandId bigint(8),
    exactBrand int(4),
    DMDMoiety nvarchar(510),
    MedisoftMoietyId bigint(8),
    exactMoiety int(4),
    VMP nvarchar(510),
    MedisoftVPid bigint(8),
    exactVMP int(4),
    AMP nvarchar(510),
    MedisoftApid bigint(8),
    exactAMP int(4),
    dru_dcl_id uniqueidentifier(16),
    mcn_id int(4),
    RowNumber int(4) NOT NULL,
    DateMigrated datetime(8),
    MigrationSource varchar(1000),
    Autofixed int(4) NOT NULL
);

CREATE TABLE DrugMigrationFinal (
    MedisoftID int(4),
    MedisoftIDOld uniqueidentifier(16),
    MedisoftDrug nvarchar(510),
    DMDBrand varchar(255),
    MedisoftBrandId bigint(8),
    exactBrand int(4),
    DMDMoiety varchar(255),
    MedisoftMoietyId bigint(8),
    exactMoiety int(4),
    VMP nvarchar(510),
    MedisoftVPid bigint(8),
    exactVMP int(4),
    AMP nvarchar(510),
    MedisoftApid int(4),
    exactAMP int(4)
);

CREATE TABLE DrugMigrationNewDrugStaging (
    ID uniqueidentifier(16) NOT NULL,
    Bug ID float(8),
    Desc nvarchar(510),
    Version nvarchar(4000),
    Dru_desc nvarchar(510),
    VTM nvarchar(510),
    VTMID nvarchar(510),
    dmy_id int(4),
    VP nvarchar(510),
    VPID nvarchar(510),
    dvp_id int(4),
    AP nvarchar(510),
    APID nvarchar(510),
    dap_id int(4),
    mcn_key varchar(100),
    DateMigrated datetime(8) NOT NULL,
    Duplicate bit(1) NOT NULL,
    Validated bit(1) NOT NULL,
    Autofixed bit(1) NOT NULL,
    DMDBrand nvarchar(510),
    MedisoftBrandId int(4),
    MedisoftID int(4),
    exactVMP int(4),
    exactAMP int(4),
    MedisoftIDOld varchar(100),
    MigrationSource varchar(1000)
);

CREATE TABLE drugmoiety (
    dmy_id int(4) NOT NULL,
    dmy_description nvarchar(4000),
    dmy_dmd_id bigint(8),
    dmy_invalid bit(1),
    dmy_descriptionshort nvarchar(4000),
    dmy_mdd_id int(4)
);

CREATE TABLE DrugMoietyDuplicate (
    dmd_id int(4) NOT NULL,
    dmd_dmy_id_duplicate int(4),
    dmd_dmy_description_duplicate nvarchar(8000),
    dmd_dmy_dmd_id_duplicate bigint(8),
    dmd_dmy_id_master int(4),
    dmd_dmy_description_master nvarchar(8000),
    dmd_dmy_dmd_id_master bigint(8)
);

CREATE TABLE DrugMoietyDuplicateMedicationRemovalBackup (
    dmy_id int(4) NOT NULL,
    dmy_description nvarchar(4000),
    dmy_dmd_id bigint(8),
    dmy_invalid bit(1),
    dmy_descriptionshort nvarchar(510)
);

CREATE TABLE DrugMoietyPatchHistory (
    dmy_id int(4) NOT NULL,
    dmy_description nvarchar(4000),
    dmy_dmd_id bigint(8),
    dmy_invalid bit(1),
    dmy_descriptionshort nvarchar(4000),
    dmy_mdd_id int(4) NOT NULL,
    dmy_pns_id int(4) NOT NULL,
    dmy_identifier uniqueidentifier(16)
);

CREATE TABLE DrugMoietyVersionHistory (
    dmy_id int(4) NOT NULL,
    dmy_description nvarchar(4000),
    dmy_descriptionshort nvarchar(4000),
    dmy_dmd_id bigint(8),
    dmy_invalid bit(1),
    dmy_identifier uniqueidentifier(16),
    dmy_mdd_id int(4),
    PackageVersion int(4) NOT NULL
);

CREATE TABLE drugroute (
    dro_id int(4) NOT NULL,
    dro_code varchar(255) NOT NULL,
    dro_desc nvarchar(510),
    dro_order int(4) NOT NULL,
    dro_flexible bit(1),
    dro_descex nvarchar(510),
    dro_desclong nvarchar(510),
    dro_contextflag int(4),
    dro_dmd_id bigint(8),
    dro_mdd_id int(4)
);

CREATE TABLE drugset (
    drs_id int(4) NOT NULL,
    drs_code varchar(255),
    drs_desc nvarchar(510),
    drs_abbreviation nvarchar(100),
    drs_minimumrequirement int(4),
    drs_available bit(1)
);

CREATE TABLE drugsetcategory (
    dsc_id int(4) NOT NULL,
    dsc_description nvarchar(510),
    dsc_contextflag int(4) NOT NULL
);

CREATE TABLE drugsetdruglink (
    ddl_id int(4) NOT NULL,
    ddl_dru_source int(4),
    ddl_dro_DrugRouteId int(4)
);

CREATE TABLE DrugsetDrugLinkDuplicateMedicationRemovalBackup (
    ddl_id int(4) NOT NULL,
    ddl_mcn_id int(4) NOT NULL,
    ddl_drs_id int(4) NOT NULL,
    ddl_order int(4),
    ddl_available bit(1) NOT NULL,
    ddl_dru_source int(4),
    ddl_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE drugsetdruglinkstatic (
    dsm_id int(4) NOT NULL,
    dsm_mcn_id int(4),
    dsm_drs_id int(4) NOT NULL,
    dsm_order int(4),
    dsm_available bit(1) NOT NULL,
    dsm_dru_source int(4),
    dsm_mcn_key varchar(255)
);

CREATE TABLE DrugsetDrugLinkStaticDuplicateMedicationRemovalBackup (
    dsm_id int(4) NOT NULL,
    dsm_mcn_id int(4),
    dsm_drs_id int(4) NOT NULL,
    dsm_order int(4),
    dsm_available bit(1) NOT NULL,
    dsm_dru_source int(4),
    dsm_mcn_key varchar(255),
    dsm_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE drugsetdrugsetcategorylink (
    drl_id int(4) NOT NULL,
    drl_drs_id int(4) NOT NULL,
    drl_dsc_id int(4) NOT NULL
);

CREATE TABLE drugstandardorder (
    dso_id int(4) NOT NULL,
    dso_mcn_id int(4),
    dso_dro_id int(4),
    dso_dco_id int(4),
    dso_order int(4),
    dso_additionalNotes nvarchar(500)
);

CREATE TABLE DrugStandardOrderDuplicateMedicationRemovalBackup (
    dso_id int(4) NOT NULL,
    dso_mcn_id int(4),
    dso_dro_id int(4),
    dso_dco_id int(4),
    dso_order int(4),
    dso_additionalNotes nvarchar(500),
    dso_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE DrugStrengthUnit (
    dsu_AntimetaboliteProcedureId int(4) NOT NULL,
    dsu_DrugUnitOfMeasureId int(4) NOT NULL
);

CREATE TABLE drugtyperouteset (
    dtr_id int(4) NOT NULL,
    dtr_lks_id int(4) NOT NULL,
    dtr_dro_id int(4) NOT NULL,
    dtr_drs_id int(4) NOT NULL,
    dtr_pro_code varchar(4)
);

CREATE TABLE drugunit (
    drn_id int(4) NOT NULL,
    drn_code varchar(255) NOT NULL,
    drn_description nvarchar(510),
    drn_order int(4) NOT NULL
);

CREATE TABLE DrugUnitOfMeasure (
    dum_Id int(4) NOT NULL,
    dum_Description nvarchar(40)
);

CREATE TABLE drugvirtualproduct (
    dvp_id int(4) NOT NULL,
    dvp_strength nvarchar(510),
    dvp_strengthandform nvarchar(510),
    dvp_dfm_id int(4),
    dvp_preservativefree bit(1) NOT NULL,
    dvp_modifiedrelease bit(1) NOT NULL,
    dvp_description nvarchar(4000),
    dvp_descriptionshort nvarchar(4000),
    dvp_dcl_id int(4),
    dvp_vmpid bigint(8),
    dvp_available bit(1),
    dvp_prescribable bit(1),
    dvp_sugarfree bit(1),
    dvp_cfcfree bit(1),
    dvp_drv_id int(4),
    dvp_atc nvarchar(510),
    dvp_invalid bit(1) NOT NULL,
    dvp_mdd_id int(4)
);

CREATE TABLE DrugVirtualProductDuplicate (
    dvd_id int(4) NOT NULL,
    dvd_dvp_id_duplicate int(4),
    dvd_dvp_description_duplicate nvarchar(8000),
    dvd_dvp_vmpid_duplicate bigint(8),
    dvd_dvp_id_master int(4),
    dvd_dvp_description_master nvarchar(8000),
    dvd_dvp_vmpid_master bigint(8)
);

CREATE TABLE DrugVirtualProductDuplicateMedicationRemovalBackup (
    dvp_id int(4) NOT NULL,
    dvp_dmy_id int(4),
    dvp_strength nvarchar(510),
    dvp_strengthandform nvarchar(510),
    dvp_dfm_id int(4),
    dvp_preservativefree bit(1) NOT NULL,
    dvp_modifiedrelease bit(1) NOT NULL,
    dvp_description nvarchar(510),
    dvp_descriptionshort nvarchar(510),
    dvp_descriptionshortforsearch nvarchar(510),
    dvp_dcl_id int(4),
    dvp_vmpid bigint(8),
    dvp_available bit(1),
    dvp_prescribable bit(1),
    dvp_sugarfree bit(1),
    dvp_cfcfree bit(1),
    dvp_drv_id int(4),
    dvp_atc nvarchar(510),
    dvp_invalid bit(1) NOT NULL
);

CREATE TABLE drugvirtualproductduration (
    vpd_id int(4) NOT NULL
);

CREATE TABLE DrugVirtualProductDurationDuplicateMedicationRemovalBackup (
    vpd_id int(4) NOT NULL,
    vpd_dvp_id int(4) NOT NULL,
    vpd_ddu_id int(4) NOT NULL
);

CREATE TABLE DrugVirtualProductPatchHistory (
    dvp_id int(4) NOT NULL,
    dvp_dmy_id int(4),
    dvp_strength nvarchar(510),
    dvp_strengthandform nvarchar(510),
    dvp_dfm_id int(4),
    dvp_preservativefree bit(1) NOT NULL,
    dvp_modifiedrelease bit(1) NOT NULL,
    dvp_description nvarchar(4000),
    dvp_descriptionshort nvarchar(4000),
    dvp_descriptionshortforsearch nvarchar(4000),
    dvp_dcl_id int(4),
    dvp_vmpid bigint(8),
    dvp_available bit(1),
    dvp_prescribable bit(1),
    dvp_sugarfree bit(1),
    dvp_cfcfree bit(1),
    dvp_drv_id int(4),
    dvp_atc nvarchar(510),
    dvp_invalid bit(1) NOT NULL,
    dvp_mdd_id int(4) NOT NULL,
    dvp_pns_id int(4) NOT NULL,
    dvp_identifier uniqueidentifier(16)
);

CREATE TABLE drugvirtualproductroute (
    vpr_id int(4) NOT NULL,
    vpr_mdd_id int(4)
);

CREATE TABLE DrugVirtualProductRouteDuplicateMedicationRemovalBackup (
    vpr_id int(4) NOT NULL,
    vpr_dvp_id int(4) NOT NULL,
    vpr_dro_id int(4) NOT NULL,
    vpr_mdd_id int(4)
);

CREATE TABLE DrugVirtualProductRoutePatchHistory (
    vpr_id int(4) NOT NULL,
    vpr_dvp_id int(4) NOT NULL,
    vpr_dro_id int(4) NOT NULL,
    vpr_mdd_id int(4) NOT NULL,
    vpr_pns_id int(4) NOT NULL
);

CREATE TABLE DrugVirtualProductRouteVersionHistory (
    vpr_id int(4) NOT NULL,
    vpr_dvp_id int(4) NOT NULL,
    vpr_dro_id int(4) NOT NULL,
    vpr_mdd_id int(4),
    PackageVersion int(4) NOT NULL,
    ActionType char(1)
);

CREATE TABLE DrugVirtualProductVersionHistory (
    dvp_id int(4) NOT NULL,
    dvp_dmy_id int(4),
    dvp_strength nvarchar(510),
    dvp_strengthandform nvarchar(510),
    dvp_dfm_id int(4),
    dvp_preservativefree bit(1) NOT NULL,
    dvp_modifiedrelease bit(1) NOT NULL,
    dvp_description nvarchar(4000),
    dvp_descriptionshort nvarchar(4000),
    dvp_descriptionshortforsearch nvarchar(4000),
    dvp_dcl_id int(4),
    dvp_vmpid bigint(8),
    dvp_available bit(1),
    dvp_prescribable bit(1),
    dvp_sugarfree bit(1),
    dvp_cfcfree bit(1),
    dvp_drv_id int(4),
    dvp_atc nvarchar(510),
    dvp_invalid bit(1) NOT NULL,
    dvp_mdd_id int(4),
    dvp_identifier uniqueidentifier(16),
    PackageVersion int(4) NOT NULL
);

CREATE TABLE DuctionOptions (
    DuctionValue float(8) NOT NULL,
    DuctionDescription nvarchar(8) NOT NULL,
    DuctionId int(4) NOT NULL
);

CREATE TABLE DuplicateLastPathWaystoUpdateBackup_20240201_1551 (
    ppv_id int(4) NOT NULL,
    ppv_pcs_id int(4) NOT NULL,
    ppv_startDate datetime(8),
    ppv_versionEffectiveDate datetime2(8) NOT NULL,
    ppv_use_id_editedBy uniqueidentifier(16) NOT NULL,
    ppv_ect_id_editedFrom uniqueidentifier(16),
    ppv_ect_id_relatedWith uniqueidentifier(16)
);

CREATE TABLE DuplicateLastPathWaystoUpdateBackup_20240226_1705 (
    ppv_id int(4) NOT NULL,
    ppv_pcs_id int(4) NOT NULL,
    ppv_startDate datetime(8),
    ppv_versionEffectiveDate datetime2(8) NOT NULL,
    ppv_use_id_editedBy uniqueidentifier(16) NOT NULL,
    ppv_ect_id_editedFrom uniqueidentifier(16),
    ppv_ect_id_relatedWith uniqueidentifier(16)
);

CREATE TABLE DuplicateLastPathWaystoUpdateBackup_20240509_1249 (
    ppv_id int(4) NOT NULL,
    ppv_pcs_id int(4) NOT NULL,
    ppv_startDate datetime(8),
    ppv_versionEffectiveDate datetime2(8) NOT NULL,
    ppv_use_id_editedBy uniqueidentifier(16) NOT NULL,
    ppv_ect_id_editedFrom uniqueidentifier(16),
    ppv_ect_id_relatedWith uniqueidentifier(16)
);

CREATE TABLE DuplicateLastPathWaystoUpdateBackup_20240610_1053 (
    ppv_id int(4) NOT NULL,
    ppv_pcs_id int(4) NOT NULL,
    ppv_startDate datetime(8),
    ppv_versionEffectiveDate datetime2(8) NOT NULL,
    ppv_use_id_editedBy uniqueidentifier(16) NOT NULL,
    ppv_ect_id_editedFrom uniqueidentifier(16),
    ppv_ect_id_relatedWith uniqueidentifier(16)
);

CREATE TABLE DuplicateLastPathWaystoUpdateBackup_20240923_1204 (
    ppv_id int(4) NOT NULL,
    ppv_pcs_id int(4) NOT NULL,
    ppv_startDate datetime(8),
    ppv_versionEffectiveDate datetime2(8) NOT NULL,
    ppv_use_id_editedBy uniqueidentifier(16) NOT NULL,
    ppv_ect_id_editedFrom uniqueidentifier(16),
    ppv_ect_id_relatedWith uniqueidentifier(16)
);

CREATE TABLE DuplicateLastPathWaystoUpdateBackup_20240923_1711 (
    ppv_id int(4) NOT NULL,
    ppv_pcs_id int(4) NOT NULL,
    ppv_startDate datetime(8),
    ppv_versionEffectiveDate datetime2(8) NOT NULL,
    ppv_use_id_editedBy uniqueidentifier(16) NOT NULL,
    ppv_ect_id_editedFrom uniqueidentifier(16),
    ppv_ect_id_relatedWith uniqueidentifier(16)
);

CREATE TABLE DurationUnit (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE EkActivity (
    ActivityId uniqueidentifier(16) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE EkActivityLog (
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE EKCornealSurgery (
    Id int(4) NOT NULL
);

CREATE TABLE EKCornealSurgeryLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE EkOther (
    ActivityId uniqueidentifier(16) NOT NULL,
    Comments nvarchar(4000)
);

CREATE TABLE EkOtherDetails (
    Id int(4) NOT NULL
);

CREATE TABLE EkOtherDetailsLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE EkOtherLog (
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Comments nvarchar(4000)
);

CREATE TABLE EkSurgicalCompletion (
    ActivityId uniqueidentifier(16) NOT NULL,
    Id int(4) NOT NULL,
    SutureNumber int(4),
    Number int(4) NOT NULL,
    MaterialId int(4),
    SutureMaterialId int(4)
);

CREATE TABLE EkSurgicalCompletionLog (
    Id int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    SutureNumber int(4),
    Number int(4) NOT NULL,
    MaterialId int(4),
    SutureMaterialId int(4)
);

CREATE TABLE EmploymentStatus (
    pes_pss_id int(4) NOT NULL,
    pes_lks_employment_status int(4) NOT NULL,
    pes_occupation nvarchar(500),
    pes_comments nvarchar(-1)
);

CREATE TABLE EmrReport (
    fer_ect_EncounterId uniqueidentifier(16) NOT NULL,
    fer_bod_BodyPartId int(4) NOT NULL,
    fer_StudyInstanceUid nvarchar(510) NOT NULL,
    fer_SeriesInstanceUid nvarchar(510) NOT NULL,
    fer_SopInstanceUid nvarchar(510) NOT NULL,
    fer_AccessionNumber nvarchar(510) NOT NULL,
    fer_Manufacturer nvarchar(510) NOT NULL,
    fer_ManufacturerModelName nvarchar(510),
    fer_InstanceNumber nvarchar(510) NOT NULL,
    fer_ContentDate datetime(8) NOT NULL,
    fer_DocumentTitle nvarchar(510),
    fer_Angle decimal(5),
    fer_Modality nvarchar(20) NOT NULL,
    fer_StudyDate datetime(8) NOT NULL,
    fer_AcquisitionDate datetime(8)
);

CREATE TABLE Encounter (
    bec_Id int(4) NOT NULL
);

CREATE TABLE encounter (
    ect_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE Encounter (
    EncounterId uniqueidentifier(16) NOT NULL,
    cpe_Id int(4) NOT NULL,
    bse_Id int(4) NOT NULL,
    eae_Id int(4) NOT NULL,
    ufe_ect_EncounterId uniqueidentifier(16) NOT NULL,
    cpe_ect_EncounterId uniqueidentifier(16) NOT NULL,
    dna_ect_EncounterId uniqueidentifier(16) NOT NULL,
    dna_lks_EpisodeTypeId int(4) NOT NULL,
    cpe_cat_AssessmentTypeId int(4),
    IsDeleted bit(1) NOT NULL,
    ufe_lkt_ReasonTypeId int(4) NOT NULL,
    ufe_Comments nvarchar(4000),
    bse_IsDeleted bit(1) NOT NULL,
    dna_lks_ReasonId int(4) NOT NULL,
    bec_csc_ClinicId int(4),
    bec_lks_NewFollowUpAppointmentType int(4),
    dna_clt_ClinicId int(4),
    bse_pat_PatientId uniqueidentifier(16) NOT NULL,
    bse_PatientNumber nvarchar(510) NOT NULL,
    bse_VisitDate date(3) NOT NULL,
    bse_use_ResponsibleUserId uniqueidentifier(16)
);

CREATE TABLE encounter (
    ect_mode int(4) NOT NULL
);

CREATE TABLE Encounter (
    bse_BillingReference nvarchar(60),
    bse_CaseNumber nvarchar(60)
);

CREATE TABLE encounter (
    ect_private bit(1)
);

CREATE TABLE Encounter (
    bse_VisitClass nvarchar(60),
    bse_VisitCategory nvarchar(100)
);

CREATE TABLE encounter (
    ect_lks_id_visitreason int(4),
    ect_interpreter bit(1)
);

CREATE TABLE Encounter (
    bse_Service nvarchar(100),
    bse_Location nvarchar(100)
);

CREATE TABLE encounter (
    ect_lks_id_language int(4),
    ect_lks_id_transport int(4)
);

CREATE TABLE Encounter (
    bse_cpw_CarePathwayId int(4) NOT NULL,
    bse_ppw_PatientCarePathwayId int(4) NOT NULL,
    bse_DateEncounterSaved datetime2(6) NOT NULL,
    bse_EventDate datetime2(6)
);

CREATE TABLE encounter (
    ect_visittype int(4),
    ect_remotelocationid uniqueidentifier(16)
);

CREATE TABLE Encounter (
    bse_LocationSegment nvarchar(100),
    bse_OutcomeCode nvarchar(20)
);

CREATE TABLE encounter (
    ect_remotelocation varchar(255)
);

CREATE TABLE Encounter (
    bse_ReferralToTreatmentCode nvarchar(20),
    bse_csc_ClinicId int(4)
);

CREATE TABLE encounter (
    ect_lks_id_communicationtype int(4),
    ect_plannedoperation int(4)
);

CREATE TABLE Encounter (
    bse_ClinicVisitNumber nvarchar(40),
    bse_ClinicLocationHospital nvarchar(510)
);

CREATE TABLE encounter (
    ect_operation uniqueidentifier(16)
);

CREATE TABLE Encounter (
    bse_ClinicArrivalDate datetime2(6),
    bse_PatientNationalNumber nvarchar(510),
    bse_ExternalAppointmentId nvarchar(510)
);

CREATE TABLE encounter (
    ect_pdh_id int(4),
    ect_HasApplicableBillingReference bit(1),
    ect_brf_BillingReferenceId int(4),
    ect_EncounterTime time(4)
);

CREATE TABLE encounteractivitytypes (
    etx_id int(4) NOT NULL,
    etx_mandatory bit(1)
);

CREATE TABLE encountercomment (
    cmt_id int(4) NOT NULL,
    cmt_comment nvarchar(-1)
);

CREATE TABLE encountercommentlog (
    cmt_ObjectId int(4) NOT NULL,
    cmt_id int(4) NOT NULL,
    cmt_ect_id uniqueidentifier(16) NOT NULL,
    cmt_comment nvarchar(-1),
    cmt_cty_id int(4),
    cmt_DateAdded datetime(8) NOT NULL,
    cmt_AddedBy uniqueidentifier(16) NOT NULL,
    cmt_TransactionId uniqueidentifier(16) NOT NULL,
    cmt_Action char(1) NOT NULL
);

CREATE TABLE EncounterCompletionState (
    bes_Id int(4) NOT NULL
);

CREATE TABLE EncounterCompletionStateLog (
    bes_Id int(4) NOT NULL,
    bes_ObjectId int(4) NOT NULL,
    bes_DateAdded datetime(8) NOT NULL,
    bes_AddedBy uniqueidentifier(16) NOT NULL,
    bes_Transactionid uniqueidentifier(16) NOT NULL,
    bes_Action char(1) NOT NULL,
    bes_ect_EncounterId uniqueidentifier(16) NOT NULL,
    bes_Completed bit(1) NOT NULL,
    bes_DateTimeUpdated datetime2(8) NOT NULL
);

CREATE TABLE EncounterConsultationReview (
    erv_ect_EncounterIdToReview uniqueidentifier(16) NOT NULL,
    erv_ApprovedDateTime datetime(8),
    erv_use_SeenByUserId uniqueidentifier(16) NOT NULL,
    erv_use_ReviewerUserGroupId uniqueidentifier(16),
    erv_use_ApprovedByUserId uniqueidentifier(16),
    erv_IsDeleted bit(1)
);

CREATE TABLE EncounterConsultationReviewLog (
    erv_ObjectId uniqueidentifier(16),
    erv_ect_EditedEncounterId uniqueidentifier(16),
    erv_use_ReviewerUserId uniqueidentifier(16),
    erv_Approved bit(1) NOT NULL,
    erv_ApprovedDateTime datetime(8),
    erv_DateAdded datetime(8) NOT NULL,
    erv_AddedBy uniqueidentifier(16) NOT NULL,
    erv_TransactionId uniqueidentifier(16) NOT NULL,
    erv_Action char(1) NOT NULL,
    erv_use_SeenByUserId uniqueidentifier(16),
    erv_ect_EncounterIdToReview int(4) NOT NULL,
    erv_use_ReviewerUserGroupId uniqueidentifier(16),
    erv_use_ApprovedByUserId uniqueidentifier(16),
    erv_IsDeleted bit(1)
);

CREATE TABLE encounterdocumentlink (
    den_id int(4) NOT NULL,
    den_ppr_PatientClinicalPlanRootId int(4)
);

CREATE TABLE encounterdocumentlinklog (
    den_objectId int(4) NOT NULL,
    den_id int(4) NOT NULL,
    den_ect_id uniqueidentifier(16),
    den_doc_id uniqueidentifier(16),
    den_flag int(4),
    den_dateadded datetime(8) NOT NULL,
    den_addedby uniqueidentifier(16) NOT NULL,
    den_transactionid uniqueidentifier(16) NOT NULL,
    den_action char(1) NOT NULL,
    den_ppr_PatientClinicalPlanRootId int(4)
);

CREATE TABLE encounterdocumenttypes (
    edt_id int(4) NOT NULL,
    edt_dtp_id int(4),
    edt_ety_id int(4)
);

CREATE TABLE EncounterExtractState (
    Id int(4) NOT NULL
);

CREATE TABLE EncounterForReview (
    EncounterId uniqueidentifier(16) NOT NULL,
    AssessmentTypeId int(4)
);

CREATE TABLE EncounterForReviewLog (
    EncounterId int(4) NOT NULL,
    ObjectId uniqueidentifier(16),
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    AssessmentTypeId int(4)
);

CREATE TABLE EncounterGradingResult (
    res_Id uniqueidentifier(16) NOT NULL,
    res_State int(4) NOT NULL,
    res_RightEyeDiagnosticsComments varchar(256),
    res_LeftEyeDiagnosticsComments varchar(256)
);

CREATE TABLE EncounterGradingResultLog (
    res_Id int(4) NOT NULL,
    res_ObjectId uniqueidentifier(16) NOT NULL,
    res_DateAdded datetime(8) NOT NULL,
    res_AddedBy uniqueidentifier(16) NOT NULL,
    res_Transactionid uniqueidentifier(16) NOT NULL,
    res_Action char(1) NOT NULL,
    res_ect_EncounterId uniqueidentifier(16),
    res_State int(4) NOT NULL,
    res_RightEyeDiagnosticsComments varchar(256),
    res_LeftEyeDiagnosticsComments varchar(256)
);

CREATE TABLE EncounterIdentifier (
    eid_Id int(4) NOT NULL
);

CREATE TABLE EncounterIdentifierType (
    eit_Id int(4) NOT NULL
);

CREATE TABLE EncounterLink (
    bel_AssociatedEncounterId uniqueidentifier(16) NOT NULL,
    bel_BillingEncounterId uniqueidentifier(16) NOT NULL
);

CREATE TABLE encounterlistitem (
    eli_id int(4) NOT NULL,
    eli_displayset int(4)
);

CREATE TABLE encounterlistitemlog (
    eli_ObjectId int(4) NOT NULL,
    eli_id int(4) NOT NULL,
    eli_ect_id uniqueidentifier(16) NOT NULL,
    eli_lks_id int(4) NOT NULL,
    eli_status int(4) NOT NULL,
    eli_displayset int(4),
    eli_DateAdded datetime(8) NOT NULL,
    eli_AddedBy uniqueidentifier(16) NOT NULL,
    eli_TransactionId uniqueidentifier(16) NOT NULL,
    eli_Action char(1) NOT NULL
);

CREATE TABLE encounterlocationtypes (
    lte_id int(4) NOT NULL
);

CREATE TABLE EncounterLog (
    ufe_ect_EncounterId int(4) NOT NULL
);

CREATE TABLE encounterlog (
    ect_ObjectId uniqueidentifier(16) NOT NULL
);

CREATE TABLE EncounterLog (
    EncounterId int(4) NOT NULL,
    eae_Id int(4) NOT NULL,
    eae_ObjectId int(4) NOT NULL,
    EncounterForReviewId uniqueidentifier(16) NOT NULL
);

CREATE TABLE encounterlog (
    ect_id int(4) NOT NULL
);

CREATE TABLE EncounterLog (
    ufe_lkt_ReasonTypeId int(4) NOT NULL,
    ufe_Comments nvarchar(4000)
);

CREATE TABLE encounterlog (
    ect_pat_id uniqueidentifier(16)
);

CREATE TABLE EncounterLog (
    ObjectId uniqueidentifier(16) NOT NULL,
    eae_DateAdded datetime(8) NOT NULL,
    eae_AddedBy uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL
);

CREATE TABLE encounterlog (
    ect_loc_id uniqueidentifier(16),
    ect_date datetime(8)
);

CREATE TABLE EncounterLog (
    AddedBy uniqueidentifier(16) NOT NULL,
    ufe_DateAdded datetime(8) NOT NULL,
    eae_Transactionid uniqueidentifier(16) NOT NULL,
    eae_Action char(1) NOT NULL,
    ufe_AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL
);

CREATE TABLE encounterlog (
    ect_daterecorded datetime(8),
    ect_datesaved datetime(8)
);

CREATE TABLE EncounterLog (
    Action char(1) NOT NULL,
    ufe_TransactionId uniqueidentifier(16) NOT NULL,
    eae_ect_EncounterId uniqueidentifier(16) NOT NULL,
    eae_ApplyPreviousFindings bit(1) NOT NULL,
    ufe_Action char(1) NOT NULL,
    IsDeleted bit(1) NOT NULL
);

CREATE TABLE encounterlog (
    ect_ety_id int(4),
    ect_mode int(4) NOT NULL,
    ect_csc_id int(4),
    ect_private bit(1),
    ect_status int(4),
    ect_lks_id_visitreason int(4),
    ect_interpreter bit(1),
    ect_lks_id_language int(4),
    ect_lks_id_transport int(4),
    ect_title nvarchar(400),
    ect_visittype int(4),
    ect_remotelocationid uniqueidentifier(16),
    ect_remotelocation varchar(255),
    ect_readonly bit(1),
    ect_DateAdded datetime(8) NOT NULL,
    ect_AddedBy uniqueidentifier(16) NOT NULL,
    ect_TransactionId uniqueidentifier(16) NOT NULL,
    ect_Action char(1) NOT NULL,
    ect_lks_id_communicationtype int(4),
    ect_plannedoperation int(4),
    ect_operation uniqueidentifier(16),
    ect_containsprescription bit(1),
    ect_datedeleted datetime(8),
    ect_isdeleted bit(1),
    ect_use_id_lastsaved uniqueidentifier(16),
    ect_pdh_id int(4),
    ect_lastsavedsource int(4),
    ect_skiplettergeneration bit(1),
    ect_ity_InterfaceTypeId_CreatedBy int(4),
    ect_etv_EncounterTemplateVersionId int(4),
    ect_HasApplicableBillingReference bit(1),
    ect_brf_BillingReferenceId int(4),
    ect_EncounterTime time(4)
);

CREATE TABLE encounteroutcome (
    eou_id int(4) NOT NULL,
    eou_cou_id int(4) NOT NULL
);

CREATE TABLE encounterpartialsave (
    eps_id uniqueidentifier(16) NOT NULL,
    eps_created_use_id uniqueidentifier(16) NOT NULL,
    eps_encounterdto nvarchar(-1),
    eps_encounterdate datetime(8) NOT NULL,
    eps_diabetic_version int(4) NOT NULL,
    eps_allergy_version int(4) NOT NULL,
    eps_mrsa_version int(4) NOT NULL,
    eps_smoking_version int(4) NOT NULL,
    eps_drinking_version int(4) NOT NULL,
    eps_medication_version int(4),
    eps_plannedvisit_version int(4),
    eps_plannedoperation_version int(4),
    eps_planneddischarge_version int(4),
    eps_problems_version int(4),
    eps_lens_left_version int(4),
    eps_lens_right_version int(4),
    eps_substance_use_version int(4),
    eps_driving_version int(4),
    eps_mobility_version int(4),
    eps_patientfamilyhistory_version int(4),
    eps_accommodation_version int(4),
    eps_social_services_version int(4),
    eps_marital_status_version int(4),
    eps_employment_status_version int(4),
    eps_social_status_comment_version int(4),
    eps_certificate_of_vision_impairment int(4),
    eps_etv_EncounterTemplateVersionId int(4),
    eps_iop_target_left_eye_version int(4),
    eps_iop_target_right_eye_version int(4)
);

CREATE TABLE encounterpartialsavelinkeduser (
    elu_id uniqueidentifier(16) NOT NULL,
    elu_eps_id uniqueidentifier(16) NOT NULL,
    elu_use_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE encounterpartialsavelog (
    eps_ObjectId uniqueidentifier(16) NOT NULL,
    eps_id int(4) NOT NULL,
    eps_ect_id uniqueidentifier(16),
    eps_pat_id uniqueidentifier(16) NOT NULL,
    eps_created_use_id uniqueidentifier(16) NOT NULL,
    eps_lastsaved_use_id uniqueidentifier(16) NOT NULL,
    eps_ety_id int(4) NOT NULL,
    eps_encounterdto nvarchar(-1),
    eps_encounterdate datetime(8) NOT NULL,
    eps_datecreated datetime(8) NOT NULL,
    eps_datesaved datetime(8) NOT NULL,
    eps_isdeleted bit(1) NOT NULL,
    eps_datedeleted datetime(8),
    eps_diabetic_version int(4) NOT NULL,
    eps_allergy_version int(4) NOT NULL,
    eps_mrsa_version int(4) NOT NULL,
    eps_smoking_version int(4) NOT NULL,
    eps_drinking_version int(4) NOT NULL,
    eps_medication_version int(4),
    eps_plannedvisit_version int(4),
    eps_plannedoperation_version int(4),
    eps_planneddischarge_version int(4),
    eps_problems_version int(4),
    eps_lens_left_version int(4),
    eps_lens_right_version int(4),
    eps_DateAdded datetime(8) NOT NULL,
    eps_AddedBy uniqueidentifier(16) NOT NULL,
    eps_TransactionId uniqueidentifier(16) NOT NULL,
    eps_Action char(1) NOT NULL,
    eps_permanentlyexpired bit(1) NOT NULL,
    eps_undeleteddate datetime(8),
    eps_substance_use_version int(4),
    eps_driving_version int(4),
    eps_mobility_version int(4),
    eps_patientfamilyhistory_version int(4),
    eps_accommodation_version int(4),
    eps_social_services_version int(4),
    eps_marital_status_version int(4),
    eps_employment_status_version int(4),
    eps_social_status_comment_version int(4),
    eps_certificate_of_vision_impairment int(4),
    eps_etv_EncounterTemplateVersionId int(4),
    eps_iop_target_left_eye_version int(4),
    eps_iop_target_right_eye_version int(4)
);

CREATE TABLE encounterpersonnel (
    enp_id int(4) NOT NULL,
    enp_displayset int(4),
    enp_gra_id int(4),
    enp_rug_ConsultationReviewUserGroupId uniqueidentifier(16),
    enp_VirtualReviewUserGroupId uniqueidentifier(16)
);

CREATE TABLE encounterpersonnel_backup (
    enp_id int(4) NOT NULL,
    enp_ect_id uniqueidentifier(16) NOT NULL,
    enp_use_id uniqueidentifier(16) NOT NULL,
    enp_acp_id int(4) NOT NULL,
    enp_displayset int(4),
    enp_gra_id int(4)
);

CREATE TABLE encounterpersonnellog (
    enp_ObjectId int(4) NOT NULL,
    enp_id int(4) NOT NULL,
    enp_ect_id uniqueidentifier(16) NOT NULL,
    enp_use_id uniqueidentifier(16),
    enp_acp_id int(4) NOT NULL,
    enp_displayset int(4),
    enp_gra_id int(4),
    enp_DateAdded datetime(8) NOT NULL,
    enp_AddedBy uniqueidentifier(16) NOT NULL,
    enp_TransactionId uniqueidentifier(16) NOT NULL,
    enp_Action char(1) NOT NULL,
    enp_rug_ConsultationReviewUserGroupId uniqueidentifier(16),
    enp_VirtualReviewUserGroupId uniqueidentifier(16)
);

CREATE TABLE EncounterReason (
    uer_Id int(4) NOT NULL,
    uer_lks_ReasonId int(4) NOT NULL,
    uer_ufe_EncounterId uniqueidentifier(16) NOT NULL
);

CREATE TABLE encounterrollbackhistory (
    erb_id int(4) NOT NULL,
    erb_dut_id uniqueidentifier(16) NOT NULL,
    erb_rollbackdatetime datetime(8) NOT NULL,
    erb_log varchar(-1) NOT NULL
);

CREATE TABLE EncounterSectionConfiguration (
    dae_id int(4) NOT NULL,
    dae_ety_id int(4) NOT NULL,
    dae_das_id int(4) NOT NULL,
    dae_dat_id int(4) NOT NULL,
    dae_Order int(4)
);

CREATE TABLE EncounterSectionStatus (
    dat_id int(4) NOT NULL
);

CREATE TABLE encountersource (
    esr_id int(4) NOT NULL,
    esr_generatenotefromeventlist bit(1) NOT NULL
);

CREATE TABLE encountersourcehistory (
    esh_id int(4) NOT NULL,
    esh_datechanged datetime(8) NOT NULL
);

CREATE TABLE encounterstore (
    ecs_id uniqueidentifier(16) NOT NULL,
    ecs_dut_id uniqueidentifier(16) NOT NULL,
    ecs_datestored datetime(8) NOT NULL,
    ecs_objecttype int(4),
    ecs_state int(4),
    ecs_ety_id int(4),
    ecs_dtoimage varbinary(-1),
    ecs_use_id uniqueidentifier(16)
);

CREATE TABLE EncounterTemplate (
    aet_id int(4) NOT NULL,
    aet_Name nvarchar(70),
    aet_Description nvarchar(500),
    aet_Icon varbinary(-1) NOT NULL,
    aet_RequiresStudyMonitoring bit(1) NOT NULL
);

CREATE TABLE EncounterTemplateActivity (
    sma_act_ActivityId uniqueidentifier(16) NOT NULL,
    sma_ect_EncounterId uniqueidentifier(16) NOT NULL,
    sma_ShowRemovedSectionWarning bit(1) NOT NULL,
    sma_smr_ReviewTypeId int(4)
);

CREATE TABLE EncounterTemplateActivityLog (
    sma_act_ActivityId int(4) NOT NULL,
    sma_ObjectId uniqueidentifier(16) NOT NULL,
    sma_DateAdded datetime(8) NOT NULL,
    sma_AddedBy uniqueidentifier(16) NOT NULL,
    sma_Transactionid uniqueidentifier(16) NOT NULL,
    sma_Action char(1) NOT NULL,
    sma_ect_encounterId uniqueidentifier(16) NOT NULL,
    sma_Queried bit(1),
    sma_ShowRemovedSectionWarning bit(1) NOT NULL,
    sma_smr_ReviewTypeId int(4)
);

CREATE TABLE EncounterTemplateActivityQuery (
    eaq_squ_QueryId int(4) NOT NULL,
    eaq_sma_ActivityId uniqueidentifier(16) NOT NULL
);

CREATE TABLE EncounterTemplateActivityVersion (
    eav_etv_EncounterTemplateVersionId int(4) NOT NULL,
    eav_abv_ActivityVersionId int(4) NOT NULL
);

CREATE TABLE EncounterTemplateDynamicActivitySection (
    eds_etv_TemplateVersionId int(4) NOT NULL,
    eds_tps_ActivitySectionId int(4) NOT NULL
);

CREATE TABLE EncounterTemplatePermittedActivity (
    eta_aet_EncounterTemplateId int(4) NOT NULL,
    eta_aba_ActivityId int(4) NOT NULL
);

CREATE TABLE EncounterTemplateQuestion (
    smq_Id int(4) NOT NULL,
    smq_sms_SectionId int(4) NOT NULL,
    smq_qty_QuestionVersionId int(4) NOT NULL,
    smq_bod_BodyPartId int(4) NOT NULL,
    smq_smr_ReviewTypeId int(4)
);

CREATE TABLE EncounterTemplateQuestionLog (
    smq_Id int(4) NOT NULL,
    smq_ObjectId int(4) NOT NULL,
    smq_DateAdded datetime(8) NOT NULL,
    smq_AddedBy uniqueidentifier(16) NOT NULL,
    smq_Transactionid uniqueidentifier(16) NOT NULL,
    smq_Action char(1) NOT NULL,
    smq_sms_SectionId int(4) NOT NULL,
    smq_qty_QuestionVersionId int(4) NOT NULL,
    smq_bod_BodyPartId int(4) NOT NULL,
    smq_smr_ReviewTypeId int(4)
);

CREATE TABLE EncounterTemplateQuestionQuery (
    aqu_squ_QueryId int(4) NOT NULL,
    aqu_smq_QuestionId int(4) NOT NULL
);

CREATE TABLE EncounterTemplateSection (
    sms_ets_SectionId int(4) NOT NULL,
    sms_sma_ActivityId uniqueidentifier(16) NOT NULL
);

CREATE TABLE EncounterTemplateSectionComment (
    smc_Id int(4) NOT NULL,
    smc_smr_ReviewTypeId int(4)
);

CREATE TABLE EncounterTemplateSectionCommentLog (
    smc_Id int(4) NOT NULL,
    smc_ObjectId int(4) NOT NULL,
    smc_DateAdded datetime(8) NOT NULL,
    smc_AddedBy uniqueidentifier(16) NOT NULL,
    smc_TransactionId uniqueidentifier(16) NOT NULL,
    smc_Action char(1) NOT NULL,
    smc_sms_SectionId int(4) NOT NULL,
    smc_bod_BodyPartId int(4) NOT NULL,
    smc_smr_ReviewTypeId int(4)
);

CREATE TABLE EncounterTemplateSectionCommentQuery (
    cqu_squ_QueryId int(4) NOT NULL,
    cqu_smc_SectionCommentId int(4) NOT NULL
);

CREATE TABLE EncounterTemplateSectionLog (
    sms_ets_SectionId int(4) NOT NULL,
    sms_ObjectId int(4) NOT NULL,
    sms_DateAdded datetime(8) NOT NULL,
    sms_AddedBy uniqueidentifier(16) NOT NULL,
    sms_Transactionid uniqueidentifier(16) NOT NULL,
    sms_Action char(1) NOT NULL,
    sms_sma_ActivityId uniqueidentifier(16) NOT NULL
);

CREATE TABLE EncounterTemplateSettings (
    etm_aet_EncounterTemplateId int(4) NOT NULL,
    etm_Enabled bit(1) NOT NULL,
    etm_AutomaticUpgrades bit(1) NOT NULL,
    etm_LastUpgrade datetime(8),
    etm_LatestVersionNumber int(4) NOT NULL,
    etm_LatestVersionDescription nvarchar(500) NOT NULL,
    etm_PendingUpgradeVersionNumber int(4)
);

CREATE TABLE EncounterTemplateSettingsLog (
    etm_aet_EncounterTemplateId int(4) NOT NULL,
    etm_Enabled bit(1) NOT NULL,
    etm_AutomaticUpgrades bit(1) NOT NULL,
    etm_LastUpgrade datetime(8),
    etm_ObjectId int(4) NOT NULL,
    etm_DateAdded datetime(8) NOT NULL,
    etm_AddedBy uniqueidentifier(16) NOT NULL,
    etm_TransactionId uniqueidentifier(16) NOT NULL,
    etm_Action char(1) NOT NULL,
    etm_LatestVersionNumber int(4),
    etm_LatestVersionDescription nvarchar(500),
    etm_PendingUpgradeVersionNumber int(4)
);

CREATE TABLE EncounterTemplateVersion (
    etv_id int(4) NOT NULL,
    etv_LastModified datetime2(8),
    etv_use_LastModifiedBy uniqueidentifier(16),
    etv_Description nvarchar(500) NOT NULL,
    etv_RequiresStudyMonitoring bit(1) NOT NULL
);

CREATE TABLE EncounterTemplateVersionLog (
    etv_id int(4) NOT NULL,
    etv_ObjectId int(4) NOT NULL,
    etv_DateAdded datetime(8) NOT NULL,
    etv_AddedBy uniqueidentifier(16) NOT NULL,
    etv_TransactionId uniqueidentifier(16) NOT NULL,
    etv_Action char(1) NOT NULL,
    etv_aet_EncounterTemplateId int(4) NOT NULL,
    etv_Version int(4),
    etv_LastModified datetime2(8),
    etv_use_LastModifiedBy uniqueidentifier(16),
    etv_IsCurrentVersion bit(1) NOT NULL,
    etv_Description nvarchar(500) NOT NULL,
    etv_RequiresStudyMonitoring bit(1)
);

CREATE TABLE EncounterType (
    Id int(4) NOT NULL
);

CREATE TABLE encountertype (
    ety_id int(4) NOT NULL,
    ety_code varchar(255) NOT NULL
);

CREATE TABLE EncounterType (
    EncounterTypeId int(4) NOT NULL,
    SiteConfigurationId int(4) NOT NULL
);

CREATE TABLE encountertype (
    ety_order int(4),
    ety_active bit(1) NOT NULL,
    ety_optionflags int(4),
    ety_per_id int(4) NOT NULL,
    ety_lockingenabled bit(1) NOT NULL,
    ety_fullname nvarchar(510) NOT NULL,
    ety_shortname nvarchar(510) NOT NULL,
    ety_mandatorypathway bit(1) NOT NULL,
    ety_MandatoryToken bit(1) NOT NULL
);

CREATE TABLE encountertypefollowupgroup (
    efg_id int(4) NOT NULL,
    efg_lks_id_followupby int(4) NOT NULL
);

CREATE TABLE EncounterTypeLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    EncounterTypeId int(4) NOT NULL,
    SiteConfigurationId int(4) NOT NULL
);

CREATE TABLE EncounterUnlock (
    Id int(4) NOT NULL,
    EncounterId uniqueidentifier(16) NOT NULL,
    UserId uniqueidentifier(16) NOT NULL,
    UnlockDateTime datetime(8) NOT NULL
);

CREATE TABLE encounterversion (
    evr_id int(4) NOT NULL,
    evr_diabetic_version int(4) NOT NULL,
    evr_allergy_version int(4) NOT NULL,
    evr_mrsa_version int(4) NOT NULL,
    evr_smoking_version int(4) NOT NULL,
    evr_drinking_version int(4) NOT NULL,
    evr_medication_version int(4),
    evr_plannedvisit_version int(4),
    evr_plannedoperation_version int(4),
    evr_planneddischarge_version int(4),
    evr_problems_version int(4),
    evr_lens_left_version int(4),
    evr_lens_right_version int(4),
    evr_substance_use_version int(4),
    evr_driving_version int(4),
    evr_mobility_version int(4),
    evr_patientfamilyhistory_version int(4),
    evr_accommodation_version int(4),
    evr_social_services_version int(4),
    evr_marital_status_version int(4),
    evr_employment_status_version int(4),
    evr_social_status_comment_version int(4),
    evr_certificate_of_vision_impairment int(4),
    evr_iop_target_left_eye_version int(4),
    evr_iop_target_right_eye_version int(4)
);

CREATE TABLE Endocyclophotocoagulation (
    ecp_sdf_id int(4) NOT NULL,
    ecp_act_ActivityId uniqueidentifier(16) NOT NULL,
    ecp_MinimumPowerOfLaser int(4) NOT NULL,
    ecp_PowerOfLaser int(4),
    ecp_Duration int(4),
    ecp_MaximumPowerOfLaser int(4),
    ecp_MinimumDuration int(4),
    ecp_Continuous bit(1) NOT NULL,
    ecp_MaximumDuration int(4),
    ecp_Continuous bit(1) NOT NULL,
    ecp_Variable bit(1) NOT NULL,
    ecp_TotalEnergy decimal(5)
);

CREATE TABLE EndocyclophotocoagulationLog (
    ecp_act_ActivityId int(4) NOT NULL,
    ecp_sdf_id int(4) NOT NULL,
    ecp_ObjectId int(4) NOT NULL,
    ecp_ObjectId uniqueidentifier(16) NOT NULL,
    ecp_DateAdded datetime(8) NOT NULL,
    ecp_DateAdded datetime(8) NOT NULL,
    ecp_AddedBy uniqueidentifier(16) NOT NULL,
    ecp_AddedBy uniqueidentifier(16) NOT NULL,
    ecp_Transactionid uniqueidentifier(16) NOT NULL,
    ecp_Transactionid uniqueidentifier(16) NOT NULL,
    ecp_Action char(1) NOT NULL,
    ecp_Action char(1) NOT NULL,
    ecp_MinimumPowerOfLaser int(4),
    ecp_PowerOfLaser int(4),
    ecp_Duration int(4),
    ecp_MaximumPowerOfLaser int(4),
    ecp_MinimumDuration int(4),
    ecp_Continuous bit(1),
    ecp_MaximumDuration int(4),
    ecp_Continuous bit(1) NOT NULL,
    ecp_Variable bit(1) NOT NULL,
    ecp_TotalEnergy decimal(5)
);

CREATE TABLE Endpoint (
    Id int(4) NOT NULL,
    Endpoint nvarchar(200),
    MaximumRetryTicks bigint(8) NOT NULL
);

CREATE TABLE EpisodeDates (
    edt_ect_id uniqueidentifier(16),
    edt_ect_date datetime(8)
);

CREATE TABLE EpisodeGUID (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE EpisodeLastModifiedBy (
    ect_id uniqueidentifier(16),
    ect_use_id_lastsaved uniqueidentifier(16)
);

CREATE TABLE EpithelialStatus (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE erroridentifier (
    eri_id int(4) NOT NULL,
    eri_erl_id int(4) NOT NULL
);

CREATE TABLE errorlog (
    erl_id int(4) NOT NULL
);

CREATE TABLE ErrorLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    LogDateTime datetime(8) NOT NULL,
    QueueId int(4),
    Order int(4) NOT NULL
);

CREATE TABLE errorlog (
    erl_order tinyint(1) NOT NULL
);

CREATE TABLE ErrorLog (
    LogDateTime datetime2(6) NOT NULL,
    Message varchar(-1) NOT NULL,
    ExceptionType varchar(510) NOT NULL,
    Message varchar(-1) NOT NULL
);

CREATE TABLE errorlog (
    erl_message varchar(-1) NOT NULL,
    erl_exceptiontype varchar(-1) NOT NULL
);

CREATE TABLE ErrorLog (
    ExceptionType varchar(200) NOT NULL,
    StackTrace varchar(-1),
    Source varchar(200) NOT NULL
);

CREATE TABLE errorlog (
    erl_source varchar(-1) NOT NULL,
    erl_stacktrace varchar(-1) NOT NULL
);

CREATE TABLE ErrorLog (
    StackTrace varchar(-1) NOT NULL
);

CREATE TABLE errorlog (
    erl_traceeventtype tinyint(1) NOT NULL,
    erl_machinename varchar(255),
    erl_osarchitecture varchar(255),
    erl_requestqueryurl varchar(-1),
    erl_requestbody varchar(-1),
    erl_requesttype varchar(100),
    erl_ErrorSourceId int(4) NOT NULL,
    erl_LogMessage varchar(-1)
);

CREATE TABLE errorlogentry (
    err_id int(4) NOT NULL,
    err_date datetime(8) NOT NULL,
    err_thread varchar(255) NOT NULL,
    err_level varchar(50) NOT NULL,
    err_logger varchar(255) NOT NULL,
    err_message varchar(4000) NOT NULL,
    err_exception varchar(2000)
);

CREATE TABLE ErrorLogGroup (
    Id int(4) NOT NULL
);

CREATE TABLE ErrorOutput (
    ErrorOutputId int(4) NOT NULL,
    Message varchar(-1) NOT NULL
);

CREATE TABLE ErrorSource (
    Id int(4) NOT NULL,
    Name varchar(50) NOT NULL
);

CREATE TABLE eventlogentry (
    evt_id int(4) NOT NULL,
    evt_lks_id_type int(4) NOT NULL,
    evt_pat_id uniqueidentifier(16),
    evt_source varchar(50),
    evt_data varchar(8000),
    evt_exception bit(1)
);

CREATE TABLE EventType (
    Id int(4) NOT NULL,
    Description nvarchar(30) NOT NULL
);

CREATE TABLE ExaminationSiteConfiguration (
    dam_id int(4) NOT NULL
);

CREATE TABLE ExaminationSiteConfigurationLog (
    dam_ObjectId int(4) NOT NULL,
    dam_id int(4) NOT NULL,
    dam_dae_id int(4) NOT NULL,
    dam_dax_id int(4) NOT NULL,
    dam_DateAdded datetime(8) NOT NULL,
    dam_AddedBy uniqueidentifier(16) NOT NULL,
    dam_Transactionid uniqueidentifier(16) NOT NULL,
    dam_Action char(1) NOT NULL
);

CREATE TABLE ExaminationSubsection (
    dax_id int(4) NOT NULL,
    dax_Order int(4)
);

CREATE TABLE Excursion (
    Id int(4) NOT NULL,
    ExcursionName nvarchar(40) NOT NULL
);

CREATE TABLE Exposure (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE ExternalIdDataType (
    Id int(4) NOT NULL,
    DataType nvarchar(510)
);

CREATE TABLE ExternalPatientLink (
    Id int(4) NOT NULL,
    ExternalPatientId nvarchar(510) NOT NULL,
    ExternalPatientIdDataTypeId int(4) NOT NULL,
    ExternalPartnerCode nvarchar(510) NOT NULL
);

CREATE TABLE ExternalPatientLinkLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    EmrPatientId uniqueidentifier(16) NOT NULL,
    ExternalPatientId nvarchar(510) NOT NULL,
    ExternalPatientIdDataTypeId int(4) NOT NULL,
    ExternalPartnerCode nvarchar(510) NOT NULL,
    PartnerId int(4) NOT NULL
);

CREATE TABLE Extract (
    Id int(4) NOT NULL,
    ProgrammeExtractDefinitionId int(4) NOT NULL,
    Payload nvarchar(-1),
    PayloadDataType varchar(100),
    DateCreated datetime2(6) NOT NULL
);

CREATE TABLE ExtractDefinition (
    Id int(4) NOT NULL,
    ProgrammeExtractDefinitionId int(4) NOT NULL,
    Key varchar(50) NOT NULL
);

CREATE TABLE ExtractorType (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE ExtractState (
    Id int(4) NOT NULL,
    Description nvarchar(40)
);

CREATE TABLE ExtractToken (
    Id int(4) NOT NULL,
    ExtractId int(4) NOT NULL,
    Key varchar(50) NOT NULL,
    Value varchar(100) NOT NULL
);

CREATE TABLE EyeTarget (
    Id int(4) NOT NULL,
    EyeTargetName nvarchar(30) NOT NULL
);

CREATE TABLE Faden (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    Location float(8) NOT NULL,
    LocationFromId int(4),
    SutureId int(4),
    LocationFromId int(4) NOT NULL,
    SutureId int(4)
);

CREATE TABLE FadenLog (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    LocationFromId int(4),
    Location float(8) NOT NULL,
    LocationFromId int(4) NOT NULL,
    SutureId int(4),
    SutureId int(4)
);

CREATE TABLE FDT (
    Id int(4) NOT NULL,
    ResultsText nvarchar(1000)
);

CREATE TABLE FDTLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PreparationId int(4) NOT NULL,
    ResultsText nvarchar(1000),
    BodyPartId int(4) NOT NULL
);

CREATE TABLE Feature (
    ftr_id int(4) NOT NULL,
    ftr_set_FeatureSetId int(4) NOT NULL,
    ftr_grd_GradingTypeId int(4) NOT NULL,
    ftr_Name nvarchar(200) NOT NULL,
    ftr_Description nvarchar(500)
);

CREATE TABLE FeatureLookup (
    flk_id int(4) NOT NULL,
    flk_Name nvarchar(500) NOT NULL,
    flk_Description nvarchar(500),
    flk_OutcomeLookupId int(4)
);

CREATE TABLE FeatureLookupSet (
    fls_set_FeatureSetId int(4) NOT NULL,
    fls_flk_FeatureLookupId int(4) NOT NULL
);

CREATE TABLE FeatureResponse (
    fsp_Id int(4) NOT NULL,
    fsp_flk_FeatureLookupId int(4) NOT NULL
);

CREATE TABLE FeatureResult (
    frs_Id int(4) NOT NULL,
    frs_res_EncounterGradingResultId uniqueidentifier(16) NOT NULL,
    frs_ftr_FeatureId int(4) NOT NULL,
    frs_bod_BodyPartId int(4) NOT NULL
);

CREATE TABLE FeatureResultLog (
    frs_Id int(4) NOT NULL,
    frs_ObjectId int(4) NOT NULL,
    frs_DateAdded datetime(8) NOT NULL,
    frs_AddedBy uniqueidentifier(16) NOT NULL,
    frs_Transactionid uniqueidentifier(16) NOT NULL,
    frs_Action char(1) NOT NULL,
    frs_res_EncounterGradingResultId uniqueidentifier(16) NOT NULL,
    frs_ftr_FeatureId int(4) NOT NULL,
    frs_bod_BodyPartId int(4) NOT NULL
);

CREATE TABLE FeatureSet (
    set_id int(4) NOT NULL,
    set_Name nvarchar(200) NOT NULL,
    set_Description nvarchar(500)
);

CREATE TABLE femalepatients (
    pdm_id int(4) NOT NULL,
    pdm_gender nvarchar(510),
    pdm_lastupdated datetime(8)
);

CREATE TABLE FindingEye (
    Id int(4) NOT NULL,
    FindingEyeName nvarchar(100) NOT NULL
);

CREATE TABLE FindingsConditions (
    ExcursionId int(4),
    Id int(4) NOT NULL
);

CREATE TABLE FindingsConditionsLog (
    Id int(4) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL,
    ExcursionId int(4),
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE FixingEye (
    Id int(4) NOT NULL,
    FixingEyeName nvarchar(50) NOT NULL
);

CREATE TABLE Flag (
    flg_Id int(4) NOT NULL,
    flg_Description nvarchar(510) NOT NULL,
    flg_TypeId int(4) NOT NULL,
    flg_StartDate datetime(8) NOT NULL,
    flg_EndDate datetime(8),
    flg_SeverityId int(4),
    flg_DefaultExpirationId int(4),
    flg_Icon_blobRepositoryId uniqueidentifier(16),
    flg_Active bit(1)
);

CREATE TABLE FlagAdditionalDisplayOption (
    fdo_flg_FlagId int(4) NOT NULL,
    fdo_ado_AdditionalDisplayOptionId int(4) NOT NULL
);

CREATE TABLE FlagAdditionalDisplayOptionLog (
    fdo_flg_FlagId int(4) NOT NULL,
    fdo_ObjectId int(4) NOT NULL,
    fdo_DateAdded datetime(8) NOT NULL,
    fdo_AddedBy uniqueidentifier(16) NOT NULL,
    fdo_TransactionId uniqueidentifier(16) NOT NULL,
    fdo_Action char(1) NOT NULL,
    fdo_ado_AdditionalDisplayOptionId int(4) NOT NULL
);

CREATE TABLE FlagItem (
    pfi_Id int(4) NOT NULL,
    pfi_pat_id uniqueidentifier(16),
    pfi_flg_id int(4) NOT NULL,
    pfi_FlagAddedDate datetime(8) NOT NULL,
    pfi_Comments nvarchar(500),
    pfi_ExpirationId int(4),
    pfi_FlagRemovedDate datetime(8),
    pfi_ExpirationDate datetime(8)
);

CREATE TABLE FlagItemLog (
    pfi_Id int(4) NOT NULL,
    pfi_pat_id uniqueidentifier(16),
    pfi_flg_id int(4) NOT NULL,
    pfi_FlagAddedDate datetime(8) NOT NULL,
    pfi_ObjectId int(4) NOT NULL,
    pfi_DateAdded datetime(8) NOT NULL,
    pfi_AddedBy uniqueidentifier(16) NOT NULL,
    pfi_TransactionId uniqueidentifier(16) NOT NULL,
    pfi_Action char(1) NOT NULL,
    pfi_Comments nvarchar(500),
    pfi_ExpirationId int(4),
    pfi_FlagRemovedDate datetime(8),
    pfi_ExpirationDate datetime(8)
);

CREATE TABLE FlagLog (
    flg_Id int(4) NOT NULL,
    flg_ObjectId int(4) NOT NULL,
    flg_DateAdded datetime(8) NOT NULL,
    flg_AddedBy uniqueidentifier(16) NOT NULL,
    flg_TransactionId uniqueidentifier(16) NOT NULL,
    flg_Action char(1) NOT NULL,
    flg_Description nvarchar(510) NOT NULL,
    flg_TypeId int(4) NOT NULL,
    flg_StartDate datetime(8) NOT NULL,
    flg_EndDate datetime(8),
    flg_SeverityId int(4),
    flg_DefaultExpirationId int(4),
    flg_Icon_blobRepositoryId uniqueidentifier(16),
    flg_Active bit(1),
    flg_StaticId int(4)
);

CREATE TABLE FollowUpPathways (
    PathwayId int(4) NOT NULL,
    IsEnabled bit(1) NOT NULL,
    ShouldAutoCreateSharedCareFollowUps bit(1) NOT NULL,
    FollowUpIntervalInWeeks int(4),
    MaximumTimeInCommunityInMonths int(4)
);

CREATE TABLE FormConfiguration (
    bfc_id int(4) NOT NULL,
    bfc_Available bit(1) NOT NULL
);

CREATE TABLE FormConfigurationCharge (
    bsc_Id int(4) NOT NULL
);

CREATE TABLE FormConfigurationChargeLog (
    bsc_Id int(4) NOT NULL,
    bsc_bic_Id int(4) NOT NULL,
    bsc_ObjectId int(4) NOT NULL,
    bsc_DateAdded datetime(8) NOT NULL,
    bsc_AddedBy uniqueidentifier(16) NOT NULL,
    bsc_TransactionId uniqueidentifier(16) NOT NULL,
    bsc_Action char(1) NOT NULL,
    bsc_bfc_Id int(4) NOT NULL
);

CREATE TABLE FormConfigurationLog (
    bfc_ObjectId int(4) NOT NULL,
    bfc_id int(4) NOT NULL,
    bfc_cpw_id int(4) NOT NULL,
    bfc_Available bit(1) NOT NULL,
    bfc_DateAdded datetime(8) NOT NULL,
    bfc_AddedBy uniqueidentifier(16) NOT NULL,
    bfc_Transactionid uniqueidentifier(16) NOT NULL,
    bfc_Action char(1) NOT NULL,
    bfc_bft_FormTypeId int(4) NOT NULL
);

CREATE TABLE FormType (
    bft_Id int(4) NOT NULL
);

CREATE TABLE ForReviewDefault (
    Id int(4) NOT NULL,
    Name nvarchar(200) NOT NULL,
    DisplayOrder int(4) NOT NULL
);

CREATE TABLE FresnelPrismBaseHorizontalDirection (
    Id int(4) NOT NULL,
    DirectionName nvarchar(4) NOT NULL
);

CREATE TABLE FresnelPrismBaseVerticalDirection (
    Id int(4) NOT NULL,
    DirectionName nvarchar(4) NOT NULL
);

CREATE TABLE FusionRange (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    Comments nvarchar(5000),
    Correction int(4),
    Distance int(4),
    AngleCorrected bit(1),
    EyeId int(4),
    FromPrismDirectionId int(4),
    FromPrismDirectionValue int(4),
    ToPrismDirectionId int(4),
    ToPrismDirectionValue int(4)
);

CREATE TABLE FusionRangeLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    Comments nvarchar(5000),
    Correction int(4),
    Distance int(4),
    AngleCorrected bit(1),
    EyeId int(4),
    FromPrismDirectionId int(4),
    FromPrismDirectionValue int(4),
    ToPrismDirectionId int(4),
    ToPrismDirectionValue int(4)
);

CREATE TABLE GasBubble (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE General (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    SutureId int(4),
    SutureId int(4)
);

CREATE TABLE generalclinicactivity (
    ecl_id uniqueidentifier(16) NOT NULL,
    ecl_act_id uniqueidentifier(16) NOT NULL,
    ecl_flag int(4),
    ecl_datereviewed datetime(8),
    ecl_reviewapproval int(4),
    ecl_bod_id_eyedilated int(4),
    ecl_time varchar(255),
    ecl_lku_id_hfamachine uniqueidentifier(16),
    ecl_pairsofglasses int(4)
);

CREATE TABLE GeneralLog (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    SutureId int(4),
    SutureId int(4)
);

CREATE TABLE GenericFollowUp (
    ActivityId uniqueidentifier(16) NOT NULL,
    CommunityPinId int(4) NOT NULL,
    PatientConsented bit(1) NOT NULL,
    RightEyeSubjectiveChange int(4),
    LeftEyeSubjectiveChange int(4),
    Findings nvarchar(2400),
    RemoteLocationId uniqueidentifier(16),
    RemoteLocation nvarchar(510)
);

CREATE TABLE GlaucomaDefaultsCyclodiodeMedicationsDuplicateMedicationRemovalBackup (
    sdm_SurgeonDefaultId int(4) NOT NULL,
    sdm_lks_id int(4) NOT NULL,
    sdm_dro_id int(4) NOT NULL,
    sdm_mcn_id int(4) NOT NULL,
    sdm_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE GlaucomaDefaultsDefaultDrugsDuplicateMedicationRemovalBackup (
    sdd_SurgeonDefaultId int(4) NOT NULL,
    sdd_lks_id int(4) NOT NULL,
    sdd_dro_id int(4) NOT NULL,
    sdd_mcn_id int(4) NOT NULL,
    sdd_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE GlaucomaDefaultsLTMedicationsDuplicateMedicationRemovalBackup (
    sdm_SurgeonDefaultId int(4) NOT NULL,
    sdm_lks_id int(4) NOT NULL,
    sdm_dro_id int(4) NOT NULL,
    sdm_mcn_id int(4) NOT NULL,
    sdm_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE GlucoseData (
    ugl_id int(4) NOT NULL,
    ugl_available bit(1) NOT NULL
);

CREATE TABLE grade (
    gra_id int(4) NOT NULL,
    gra_desc nvarchar(510),
    gra_seniorityorder tinyint(1),
    gra_listorder tinyint(1),
    gra_current bit(1),
    gra_desclong nvarchar(510),
    gra_showonwebui bit(1) NOT NULL,
    gra_FeminineDescription nvarchar(450)
);

CREATE TABLE gradeexact (
    gxt_id int(4) NOT NULL,
    gxt_gra_id int(4) NOT NULL,
    gxt_ust_id int(4) NOT NULL,
    gxt_desc nvarchar(510)
);

CREATE TABLE gradestousertypes (
    grade_id int(4) NOT NULL,
    usertype_id int(4) NOT NULL
);

CREATE TABLE Grading (
    Id int(4) NOT NULL,
    grd_id int(4) NOT NULL,
    grd_drg_GradingSchemeId int(4) NOT NULL,
    GradingType int(4) NOT NULL,
    Available bit(1) NOT NULL,
    grd_Name varchar(100) NOT NULL,
    grd_Description varchar(250),
    DisplayOrder int(4) NOT NULL
);

CREATE TABLE GradingClinicalConcept (
    cpt_id int(4) NOT NULL,
    grd_id int(4) NOT NULL,
    typ_id int(4) NOT NULL
);

CREATE TABLE GradingOutputResult (
    gor_Id int(4) NOT NULL,
    gor_res_EncounterGradingResultId uniqueidentifier(16) NOT NULL,
    gor_grd_GradingId int(4) NOT NULL,
    gor_rnk_GradingRankId int(4),
    gor_bod_EyePartId int(4) NOT NULL,
    gor_typ_GradingTypeId int(4) NOT NULL
);

CREATE TABLE GradingOutputResultLog (
    gor_Id int(4) NOT NULL,
    gor_ObjectId int(4) NOT NULL,
    gor_DateAdded datetime(8) NOT NULL,
    gor_AddedBy uniqueidentifier(16) NOT NULL,
    gor_Transactionid uniqueidentifier(16) NOT NULL,
    gor_Action char(1) NOT NULL,
    gor_res_EncounterGradingResultId uniqueidentifier(16) NOT NULL,
    gor_grd_GradingId int(4) NOT NULL,
    gor_rnk_GradingRankId int(4),
    gor_bod_EyePartId int(4) NOT NULL,
    gor_typ_GradingTypeId int(4) NOT NULL
);

CREATE TABLE GradingRank (
    rnk_id int(4) NOT NULL,
    rnk_Name nvarchar(100) NOT NULL,
    rnk_Description nvarchar(200)
);

CREATE TABLE GradingScheme (
    drg_Id int(4) NOT NULL,
    drg_Name nvarchar(100) NOT NULL,
    drg_Description nvarchar(200),
    drg_Available bit(1) NOT NULL,
    drg_Default bit(1) NOT NULL
);

CREATE TABLE GradingSchemeFeatures (
    gsf_drg_GradingSchemeId int(4) NOT NULL,
    gsf_ftr_FeatureId int(4) NOT NULL
);

CREATE TABLE GradingSchemeResult (
    gsr_res_Id uniqueidentifier(16) NOT NULL,
    gsr_drg_id int(4) NOT NULL
);

CREATE TABLE GradingSchemeResultLog (
    gsr_res_Id int(4) NOT NULL,
    gsr_ObjectId uniqueidentifier(16) NOT NULL,
    gsr_DateAdded datetime(8) NOT NULL,
    gsr_AddedBy uniqueidentifier(16) NOT NULL,
    gsr_Transactionid uniqueidentifier(16) NOT NULL,
    gsr_Action char(1) NOT NULL,
    gsr_drg_Id int(4) NOT NULL
);

CREATE TABLE GradingType (
    typ_id int(4) NOT NULL,
    typ_Name nvarchar(200) NOT NULL
);

CREATE TABLE Granularity (
    etg_id int(4) NOT NULL,
    etg_Description nvarchar(500) NOT NULL
);

CREATE TABLE Group (
    deg_Id int(4) NOT NULL
);

CREATE TABLE groups (
    grp_id uniqueidentifier(16) NOT NULL,
    grp_name nvarchar(510) NOT NULL,
    grp_active bit(1),
    grp_description nvarchar(510)
);

CREATE TABLE groupstopermissions (
    groups_id uniqueidentifier(16) NOT NULL,
    permission_id int(4) NOT NULL
);

CREATE TABLE groupstousers (
    user_id uniqueidentifier(16) NOT NULL,
    groups_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE Handshake (
    sdh_id int(4) NOT NULL,
    sdh_description nvarchar(200) NOT NULL
);

CREATE TABLE HaradaIto (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    AnteriorTendonTransposed int(4) NOT NULL,
    AnteriorTendonTransposed int(4),
    Positioned float(8),
    Positioned float(8) NOT NULL,
    SutureId int(4),
    SutureId int(4)
);

CREATE TABLE HaradaItoLog (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    AnteriorTendonTransposed int(4) NOT NULL,
    AnteriorTendonTransposed int(4),
    Positioned float(8),
    Positioned float(8) NOT NULL,
    SutureId int(4),
    SutureId int(4)
);

CREATE TABLE Hba1c (
    hba_Id int(4) NOT NULL,
    hba_Value decimal(5) NOT NULL,
    hba_ValueUnitId int(4) NOT NULL,
    hba_Date datetime(8) NOT NULL,
    hba_DateUnitId int(4) NOT NULL,
    hba_SourceId int(4) NOT NULL,
    hba_IsDeleted bit(1),
    hba_ConvertedValue decimal(5),
    hba_ConvertedValueUnitId int(4),
    hba_Precision int(4) NOT NULL
);

CREATE TABLE Hba1cActivityPatientLink (
    hbl_Id int(4) NOT NULL
);

CREATE TABLE Hba1cDateUnit (
    Id int(4) NOT NULL,
    Description nvarchar(20) NOT NULL
);

CREATE TABLE Hba1cLog (
    hba_ObjectId int(4) NOT NULL,
    hba_DateAdded datetime(8) NOT NULL,
    hba_AddedBy uniqueidentifier(16) NOT NULL,
    hba_Transactionid uniqueidentifier(16) NOT NULL,
    hba_Action char(1) NOT NULL,
    hba_Id int(4) NOT NULL,
    hba_Value decimal(5) NOT NULL,
    hba_ValueUnitId int(4) NOT NULL,
    hba_Date datetime(8) NOT NULL,
    hba_DateUnitId int(4) NOT NULL,
    hba_SourceId int(4) NOT NULL,
    hba_IsDeleted bit(1),
    hba_ConvertedValue decimal(5),
    hba_ConvertedValueUnitId int(4),
    hba_Precision int(4) NOT NULL
);

CREATE TABLE Hba1cLookup (
    hbl_Id int(4) NOT NULL,
    hbl_Description nvarchar(400) NOT NULL,
    hbl_Visible bit(1) NOT NULL,
    hbl_hlt_Id int(4) NOT NULL
);

CREATE TABLE Hba1cLookupType (
    hlt_Id int(4) NOT NULL,
    hlt_Description nvarchar(400) NOT NULL
);

CREATE TABLE Hba1cRequest (
    Id int(4) NOT NULL,
    Value decimal(5) NOT NULL,
    Precision int(4) NOT NULL,
    Unit int(4) NOT NULL,
    Date date(3) NOT NULL,
    Source int(4) NOT NULL,
    DateUnit int(4) NOT NULL
);

CREATE TABLE Hba1cSource (
    Id int(4) NOT NULL,
    Description nvarchar(400) NOT NULL
);

CREATE TABLE Hba1cUnit (
    Id int(4) NOT NULL,
    Description nvarchar(20) NOT NULL
);

CREATE TABLE HeadPostureSeverity (
    Id int(4) NOT NULL,
    HeadPostureSeverityName nvarchar(20) NOT NULL,
    IsEnabled bit(1) NOT NULL
);

CREATE TABLE HeadPostureStatus (
    Id int(4) NOT NULL,
    HeadPostureStatusName nvarchar(20) NOT NULL
);

CREATE TABLE healthcareservice (
    hsv_id int(4) NOT NULL,
    hsv_code varchar(10),
    hsv_description varchar(255) NOT NULL
);

CREATE TABLE HeartbeatSession (
    hss_Id int(4) NOT NULL,
    hss_hbs_SourceId int(4) NOT NULL,
    hss_use_UserId uniqueidentifier(16) NOT NULL,
    hss_dev_DeviceId uniqueidentifier(16) NOT NULL
);

CREATE TABLE HeartbeatSignal (
    hsg_Id int(4) NOT NULL,
    hsg_hss_SessionId int(4) NOT NULL,
    hsg_DateTime datetime(8),
    hsg_CurrentAvailablePhysicalMemoryInBytes bigint(8),
    hsg_CurrentPhysicalMemoryInUseByProcessInBytes bigint(8)
);

CREATE TABLE HeartbeatSource (
    hbs_Id int(4) NOT NULL,
    hbs_Value varchar(50) NOT NULL
);

CREATE TABLE HeyexScanNotificationInvestigationItem (
    esn_eip_InvestigationItemId int(4) NOT NULL,
    esn_hsn_SeriesInstanceUid nvarchar(400),
    esn_hsn_ClusterId uniqueidentifier(16)
);

CREATE TABLE HeyexScanNotificationInvestigationItemLog (
    esn_eip_InvestigationItemId int(4) NOT NULL,
    esn_hsn_SeriesInstanceUid nvarchar(400),
    esn_ObjectId int(4) NOT NULL,
    esn_DateAdded datetime(8) NOT NULL,
    esn_AddedBy uniqueidentifier(16) NOT NULL,
    esn_Transactionid uniqueidentifier(16) NOT NULL,
    esn_Action char(1) NOT NULL,
    esn_hsn_ClusterId uniqueidentifier(16)
);

CREATE TABLE HfaBinaryDocument (
    hbd_bdc_BinaryDocumentId int(4) NOT NULL,
    hbd_vtp_TestPatternId int(4) NOT NULL
);

CREATE TABLE HfaBinaryDocumentLog (
    hbd_bdc_BinaryDocumentId int(4) NOT NULL,
    hbd_ObjectId int(4) NOT NULL,
    hbd_DateAdded datetime(8) NOT NULL,
    hbd_AddedBy uniqueidentifier(16) NOT NULL,
    hbd_TransactionId uniqueidentifier(16) NOT NULL,
    hbd_Action char(1) NOT NULL,
    hbd_vtp_TestPatternId int(4) NOT NULL
);

CREATE TABLE HfaInvestigationItem (
    ehf_eip_InvestigationItemId int(4) NOT NULL,
    ehf_vfh_SeriesInstanceUid nvarchar(200),
    ehf_doc_DocumentId uniqueidentifier(16) NOT NULL,
    ehf_DocumentVersion int(4) NOT NULL
);

CREATE TABLE HfaInvestigationItemLog (
    ehf_eip_InvestigationItemId int(4) NOT NULL,
    ehf_vfh_SeriesInstanceUid nvarchar(200),
    ehf_ObjectId int(4) NOT NULL,
    ehf_DateAdded datetime(8) NOT NULL,
    ehf_AddedBy uniqueidentifier(16) NOT NULL,
    ehf_Transactionid uniqueidentifier(16) NOT NULL,
    ehf_Action char(1) NOT NULL,
    ehf_doc_DocumentId uniqueidentifier(16),
    ehf_DocumentVersion int(4) NOT NULL
);

CREATE TABLE HfaInvestigationVersion (
    hiv_iiv_InvestigationItemVersionId int(4) NOT NULL,
    hiv_vtp_TestPatternId int(4) NOT NULL,
    hiv_dim_DataImportMethodId int(4) NOT NULL
);

CREATE TABLE HfaInvestigationVersionLog (
    hiv_iiv_InvestigationItemVersionId int(4) NOT NULL,
    hiv_dim_DataImportMethodId int(4) NOT NULL,
    hiv_vtp_TestPatternId int(4) NOT NULL,
    hiv_ObjectId int(4) NOT NULL,
    hiv_DateAdded datetime(8) NOT NULL,
    hiv_AddedBy uniqueidentifier(16) NOT NULL,
    hiv_Transactionid uniqueidentifier(16) NOT NULL,
    hiv_Action char(1) NOT NULL
);

CREATE TABLE History (
    pah_id int(4) NOT NULL,
    pah_act_id uniqueidentifier(16) NOT NULL,
    pah_comments nvarchar(4000)
);

CREATE TABLE HistoryItem (
    phi_id int(4) NOT NULL,
    fhi_id int(4) NOT NULL,
    phi_cpt_id int(4) NOT NULL,
    phi_parsedText nvarchar(4000) NOT NULL,
    phi_bod_id int(4),
    phi_negated bit(1) NOT NULL,
    phi_freeText nvarchar(500)
);

CREATE TABLE HistoryItemLog (
    phi_ObjectId int(4) NOT NULL,
    phi_id int(4) NOT NULL,
    phi_pah_id int(4) NOT NULL,
    phi_cpt_id int(4) NOT NULL,
    phi_parsedText nvarchar(4000) NOT NULL,
    phi_bod_id int(4),
    phi_negated bit(1) NOT NULL,
    phi_freeText nvarchar(500),
    phi_DateAdded datetime(8) NOT NULL,
    phi_AddedBy uniqueidentifier(16) NOT NULL,
    phi_TransactionId uniqueidentifier(16) NOT NULL,
    phi_Action char(1) NOT NULL
);

CREATE TABLE HistoryItemQualifier (
    phq_id int(4) NOT NULL,
    phq_cql_id int(4) NOT NULL,
    phq_cpt_id int(4) NOT NULL
);

CREATE TABLE HistoryItemQualifierLog (
    phq_ObjectId int(4) NOT NULL,
    phq_id int(4) NOT NULL,
    phq_phi_id int(4) NOT NULL,
    phq_cql_id int(4) NOT NULL,
    phq_cpt_id int(4) NOT NULL,
    phq_DateAdded datetime(8) NOT NULL,
    phq_AddedBy uniqueidentifier(16) NOT NULL,
    phq_TransactionId uniqueidentifier(16) NOT NULL,
    phq_Action char(1) NOT NULL
);

CREATE TABLE HistoryLog (
    pah_ObjectId int(4) NOT NULL,
    pah_id int(4) NOT NULL,
    pah_act_id uniqueidentifier(16) NOT NULL,
    pah_comments nvarchar(4000),
    pah_DateAdded datetime(8) NOT NULL,
    pah_AddedBy uniqueidentifier(16) NOT NULL,
    pah_TransactionId uniqueidentifier(16) NOT NULL,
    pah_Action char(1) NOT NULL
);

CREATE TABLE hl7component (
    com_id int(4) NOT NULL,
    com_name varchar(255),
    com_variable varchar(255),
    com_seg_id int(4),
    com_xpath varchar(2000),
    com_attribute int(4),
    com_apisupport bit(1),
    com_pnt_id int(4),
    com_statusattribute int(4),
    com_lkt_id int(4),
    com_SearchText nvarchar(510),
    com_ReplaceText nvarchar(510),
    com_HospitalNumberSubtypeId int(4)
);

CREATE TABLE hl7datatype (
    dty_id int(4) NOT NULL,
    dty_category varchar(255),
    dty_datatypecode varchar(255) NOT NULL,
    dty_datatypename varchar(255),
    dty_hl7reference varchar(255),
    dty_notes nvarchar(510),
    dty_format varchar(2000)
);

CREATE TABLE hl7element (
    ele_id int(4) NOT NULL,
    ele_item int(4) NOT NULL,
    ele_description varchar(255) NOT NULL,
    ele_seg_id int(4),
    ele_sequence int(4) NOT NULL,
    ele_length int(4),
    ele_dty_id int(4),
    ele_repeat varchar(255),
    ele_table varchar(255)
);

CREATE TABLE hl7event (
    evn_id int(4) NOT NULL,
    evn_eventcode varchar(10) NOT NULL,
    evn_description varchar(255),
    evn_procedure varchar(255),
    evn_procedureactive bit(1)
);

CREATE TABLE hl7eventsegment (
    evs_id int(4) NOT NULL,
    evs_evn_id int(4),
    evs_seg_id int(4)
);

CREATE TABLE hl7interfacesettings (
    hls_id int(4) NOT NULL,
    hls_setting int(4) NOT NULL,
    hls_int int(4),
    hls_string varchar(-1)
);

CREATE TABLE Hl7Mapping (
    bhm_Id int(4) NOT NULL
);

CREATE TABLE Hl7MappingDataType (
    bhd_Id int(4) NOT NULL,
    bhd_Description nvarchar(60) NOT NULL
);

CREATE TABLE Hl7MappingLog (
    bhm_Id int(4) NOT NULL,
    bhm_hmt_Hl7MappableTypeId int(4) NOT NULL,
    bhm_Code nvarchar(30) NOT NULL,
    bhm_Value nvarchar(100) NOT NULL,
    bhm_ObjectId int(4) NOT NULL,
    bhm_DateAdded datetime(8) NOT NULL,
    bhm_AddedBy uniqueidentifier(16) NOT NULL,
    bhm_TransactionId uniqueidentifier(16) NOT NULL,
    bhm_Action char(1) NOT NULL
);

CREATE TABLE Hl7MappingType (
    hmt_Id int(4) NOT NULL,
    hmt_Description nvarchar(100) NOT NULL,
    hmt_IsSystem bit(1) NOT NULL,
    hmt_bhd_Hl7MappingDataTypeId int(4) NOT NULL
);

CREATE TABLE hl7message (
    hlm_id int(4) NOT NULL,
    hlm_hl7 varchar(-1),
    hlm_xml varchar(-1),
    hlm_ack varchar(-1),
    hlm_acksent bit(1),
    hlm_processed int(4),
    hlm_messagetype varchar(255),
    hlm_triggerevent varchar(255),
    hlm_ErrorMessage nvarchar(2000)
);

CREATE TABLE hl7messagequeue (
    hmq_id int(4) NOT NULL,
    hmq_messagecontrolid varchar(20) NOT NULL,
    hmq_triggerevent varchar(20) NOT NULL,
    hmq_datetimecreated datetime(8) NOT NULL,
    hmq_messagedirection int(4) NOT NULL,
    hmq_status int(4) NOT NULL,
    hmq_message varchar(-1) NOT NULL,
    hmq_ack varchar(-1) NOT NULL,
    hmq_exception varchar(-1) NOT NULL
);

CREATE TABLE hl7messagetype (
    mtp_id int(4) NOT NULL,
    mtp_messagecode varchar(3) NOT NULL,
    mtp_description varchar(255) NOT NULL,
    mtp_chapter int(4) NOT NULL,
    mtp_supported bit(1)
);

CREATE TABLE hl7practitionermap (
    hpm_id int(4) NOT NULL,
    hpm_include bit(1) NOT NULL
);

CREATE TABLE hl7segment (
    seg_id int(4) NOT NULL,
    seg_segmentcode varchar(3) NOT NULL,
    seg_description varchar(255) NOT NULL,
    seg_chapter varchar(255)
);

CREATE TABLE HorizontalDeviation (
    Id int(4) NOT NULL,
    HorizontalDeviationName nvarchar(100) NOT NULL
);

CREATE TABLE HorizontalPreAdjustment (
    Id int(4) NOT NULL
);

CREATE TABLE HorizontalTarget (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    HorizontalTargetId int(4),
    HorizontalTargetId int(4) NOT NULL,
    RangeFrom tinyint(1),
    RangeFrom tinyint(1),
    RangeTo tinyint(1),
    RangeTo tinyint(1)
);

CREATE TABLE HorizontalTargetLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    HorizontalTargetId int(4),
    HorizontalTargetId int(4) NOT NULL,
    RangeFrom tinyint(1),
    RangeFrom tinyint(1),
    RangeTo tinyint(1),
    RangeTo tinyint(1)
);

CREATE TABLE HorizontalTestFindings (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    HorizontalDeviationId int(4),
    MeasurementStartValue float(8),
    MeasurementEndValue float(8),
    MeasurementRange bit(1),
    MeasurementUnitId int(4) NOT NULL,
    Comments nvarchar(1000),
    FresnelPrismBaseHorizontalDirectionId int(4),
    NoDeviation bit(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE HorizontalTestFindingsLog (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    HorizontalDeviationId int(4),
    MeasurementStartValue float(8),
    MeasurementEndValue float(8),
    MeasurementRange bit(1),
    MeasurementUnitId int(4) NOT NULL,
    Comments nvarchar(1000),
    FresnelPrismBaseHorizontalDirectionId int(4),
    NoDeviation bit(1) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE HostPreparation (
    ActivityId uniqueidentifier(16) NOT NULL,
    Id int(4) NOT NULL,
    InicisionId int(4),
    InicisionId int(4) NOT NULL,
    IncisionSize decimal(5) NOT NULL,
    IncisionSize decimal(5),
    LeftIncisionDegrees int(4),
    IncisionDegrees int(4) NOT NULL,
    StrippingMethod_LookupId int(4) NOT NULL,
    RightIncisionDegrees int(4),
    StrippingMethodId int(4),
    AcFillId int(4),
    DiameterStripped decimal(5),
    AcFillId int(4)
);

CREATE TABLE HostPreparationLog (
    ActivityId int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    InicisionId int(4) NOT NULL,
    InicisionId int(4),
    IncisionSize decimal(5),
    IncisionSize decimal(5) NOT NULL,
    IncisionDegrees int(4) NOT NULL,
    LeftIncisionDegrees int(4),
    RightIncisionDegrees int(4),
    StrippingMethod_LookupId int(4) NOT NULL,
    AcFillId int(4),
    StrippingMethodId int(4),
    AcFillId int(4),
    DiameterStripped decimal(5)
);

CREATE TABLE HumphreyHemifieldTest (
    hht_Id int(4) NOT NULL,
    hht_Description nvarchar(200) NOT NULL
);

CREATE TABLE HumphreyHemifieldTestDescription (
    htd_Id int(4) NOT NULL,
    htd_htt_HemifieldTestId int(4) NOT NULL
);

CREATE TABLE HumphreyProbability (
    vhp_Id int(4) NOT NULL,
    vhp_Description nvarchar(200)
);

CREATE TABLE HumphreyProbabilityDescription (
    hpd_Id int(4) NOT NULL,
    hpd_vhp_HumphreyProbabilityId int(4) NOT NULL
);

CREATE TABLE HumphreyTest (
    vfh_bod_Id int(4) NOT NULL,
    vfh_ManufacturerModel nvarchar(200),
    vfh_TestDateTime datetime(8) NOT NULL,
    vfh_vts_TestStrategyId int(4) NOT NULL,
    vfh_vtp_TestPatternId int(4) NOT NULL,
    vfh_hht_HemifieldTestId int(4),
    vfh_PupilDiameter decimal(5),
    vfh_StudyInstanceUid nvarchar(200),
    vfh_SeriesInstanceUid nvarchar(200),
    vfh_DeviceSerialNumber nvarchar(100),
    vfh_SoftwareVersions nvarchar(200),
    vfh_SopInstanceUid nvarchar(200),
    vfh_StimulusSize nvarchar(200),
    vfh_StimulusColor nvarchar(200),
    vfh_BackgroundState nvarchar(200),
    vfh_FovealResult nvarchar(200),
    vfh_ScreeningMode nvarchar(200),
    vfh_VisualAcuity nvarchar(200),
    vfh_FixationMonitor nvarchar(200),
    vfh_FixationTarget nvarchar(200),
    vfh_FixationTrials int(4),
    vfh_FixationErrors int(4),
    vfh_FalsePositiveTrials int(4),
    vfh_FalsePositiveErrors int(4),
    vfh_FalsePositivePercent int(4),
    vfh_FalseNegativeTrials int(4),
    vfh_FalseNegativeErrors int(4),
    vfh_FalseNegativePercent int(4),
    vfh_TrialRxSphere decimal(5),
    vfh_TrialRxCylinder decimal(5),
    vfh_TrialRxAxis int(4),
    vfh_MeanDeviation decimal(5),
    vfh_vhp_MeanDeviationProbability int(4),
    vfh_PatternStandardDeviation decimal(5),
    vfh_vhp_PatternStandardDeviationProbability int(4),
    vfh_ShortTermFluctuation decimal(5),
    vfh_vhp_ShortTermFluctuationProbability int(4),
    vfh_CorrectedPatternStandardDeviation decimal(5),
    vfh_vhp_CorrectedPatternStandardDeviationProbability int(4),
    vfh_VisualFieldIndex int(4),
    vfh_DerivationDescription nvarchar(200),
    vfh_FileReference nvarchar(400),
    vfh_Id int(4) NOT NULL,
    vfh_TestName nvarchar(200),
    vfh_TestStrategyText nvarchar(200),
    vfh_TestPatternText nvarchar(200),
    vfh_HemifieldTestText nvarchar(200),
    vfh_MeanDeviationProbabilityText nvarchar(200),
    vfh_PatternStandardDeviationProbabilityText nvarchar(200),
    vfh_ShortTermFluctuationProbabilityText nvarchar(200),
    vfh_CorrectedPatternStandardDeviationProbabilityText nvarchar(200),
    vfh_IsReliable bit(1) NOT NULL
);

CREATE TABLE HumphreyTestPattern (
    vtp_Id int(4) NOT NULL,
    vtp_Description nvarchar(100) NOT NULL
);

CREATE TABLE HumphreyTestPatternDescription (
    tpd_Id int(4) NOT NULL,
    tpd_vtp_TestPatternId int(4) NOT NULL
);

CREATE TABLE HumphreyTestStrategy (
    vts_Id int(4) NOT NULL,
    vts_Description nvarchar(200) NOT NULL
);

CREATE TABLE HumphreyTestStrategyDescription (
    tsd_Id int(4) NOT NULL,
    tsd_vts_TestStrategyId int(4) NOT NULL
);

CREATE TABLE IdentifierType (
    idt_id int(4) NOT NULL,
    idt_description nvarchar(100),
    idt_HintText nvarchar(400)
);

CREATE TABLE Image (
    Id int(4) NOT NULL,
    Name varchar(255) NOT NULL,
    Data varbinary(-1) NOT NULL
);

CREATE TABLE ImageQuality (
    Id int(4) NOT NULL,
    Description nvarchar(50) NOT NULL
);

CREATE TABLE ImageType (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL,
    MimeTypeId int(4) NOT NULL
);

CREATE TABLE Incision (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE indicationprocedurelist (
    ipi_id int(4) NOT NULL,
    ipi_cfd_id int(4) NOT NULL,
    ipi_order int(4) NOT NULL
);

CREATE TABLE indicationprocedurelistitem (
    ili_id int(4) NOT NULL,
    ili_ipi_id int(4) NOT NULL,
    ili_pqi_id int(4),
    ili_order int(4) NOT NULL
);

CREATE TABLE indicationprocedurelistitemlog (
    ili_objectId int(4) NOT NULL,
    ili_id int(4) NOT NULL,
    ili_ipi_id int(4) NOT NULL,
    ili_pro_id int(4) NOT NULL,
    ili_pqi_id int(4),
    ili_order int(4) NOT NULL,
    ili_dateadded datetime(8) NOT NULL,
    ili_addedby uniqueidentifier(16) NOT NULL,
    ili_transactionid uniqueidentifier(16) NOT NULL,
    ili_action char(1) NOT NULL
);

CREATE TABLE indicationprocedurelistlog (
    ipi_objectId int(4) NOT NULL,
    ipi_id int(4) NOT NULL,
    ipi_cfd_id int(4) NOT NULL,
    ipi_order int(4),
    ipi_dateadded datetime(8) NOT NULL,
    ipi_addedby uniqueidentifier(16) NOT NULL,
    ipi_transactionid uniqueidentifier(16) NOT NULL,
    ipi_action char(1) NOT NULL
);

CREATE TABLE injection (
    ijp_id int(4) NOT NULL
);

CREATE TABLE injectionlog (
    ijp_ObjectId int(4) NOT NULL,
    ijp_id int(4) NOT NULL,
    ijp_act_id uniqueidentifier(16) NOT NULL,
    ijp_bod_id int(4) NOT NULL,
    ijp_lks_id_preparationmethod int(4),
    ijp_conjunctivadisplaced bit(1) NOT NULL,
    ijp_entryfromlimbus decimal(5),
    ijp_lks_id_needleangle int(4),
    ijp_actap bit(1) NOT NULL,
    ijp_craperfused bit(1) NOT NULL,
    ijp_abletocf bit(1) NOT NULL,
    ijp_clockhours varchar(255),
    ijp_lks_id_injectioncategory int(4),
    ijp_previousnumberofinjections int(4),
    ijp_previousnumberofinjectionsunknown bit(1),
    ijp_previousnumberofinjectionscalculated int(4),
    ijp_DateAdded datetime(8) NOT NULL,
    ijp_AddedBy uniqueidentifier(16) NOT NULL,
    ijp_TransactionId uniqueidentifier(16) NOT NULL,
    ijp_Action char(1) NOT NULL,
    ijp_batchnumber varchar(20),
    ijp_expirydate uniqueidentifier(16)
);

CREATE TABLE injectionnumberingcategorydetail (
    icd_id int(4) NOT NULL,
    icd_previousnumberofinjectionsunknown bit(1) NOT NULL,
    icd_previousnumberofinjectionstotal int(4),
    icd_previousnumberofinjectionscalculated int(4) NOT NULL
);

CREATE TABLE injectionnumberingcategorydetaillog (
    icd_ObjectId int(4) NOT NULL,
    icd_id int(4) NOT NULL,
    icd_ijp_id int(4),
    icd_lks_id_injectioncategory int(4),
    icd_previousnumberofinjectionsunknown bit(1) NOT NULL,
    icd_previousnumberofinjectionstotal int(4),
    icd_previousnumberofinjectionscalculated int(4) NOT NULL,
    icd_DateAdded datetime(8) NOT NULL,
    icd_AddedBy uniqueidentifier(16) NOT NULL,
    icd_TransactionId uniqueidentifier(16) NOT NULL,
    icd_Action char(1) NOT NULL
);

CREATE TABLE injectionnumberingdetail (
    pin_id int(4) NOT NULL
);

CREATE TABLE injectionnumberingdetaillog (
    pin_ObjectId int(4) NOT NULL,
    pin_id int(4) NOT NULL,
    pin_ijp_id int(4) NOT NULL,
    pin_pqg_id int(4) NOT NULL,
    pin_previousnumberunknown bit(1) NOT NULL,
    pin_previousnumber int(4),
    pin_displayorder int(4) NOT NULL,
    pin_calculated bit(1),
    pin_DateAdded datetime(8) NOT NULL,
    pin_AddedBy uniqueidentifier(16) NOT NULL,
    pin_TransactionId uniqueidentifier(16) NOT NULL,
    pin_Action char(1) NOT NULL
);

CREATE TABLE InjectionPlanningActivity (
    ipa_id int(4) NOT NULL,
    ipa_IsReview bit(1) NOT NULL
);

CREATE TABLE InjectionPlanningActivityLog (
    ipa_ObjectId int(4) NOT NULL,
    ipa_id int(4) NOT NULL,
    ipa_act_id uniqueidentifier(16) NOT NULL,
    ipa_bod_id int(4) NOT NULL,
    ipa_scenario int(4) NOT NULL,
    ipa_itp_id int(4) NOT NULL,
    ipa_injecttoday int(4),
    ipa_injectprotocoldrug int(4),
    ipa_continueasplanned int(4),
    ipa_continueprotocol int(4),
    ipa_donotinjecttodayreason int(4),
    ipa_plandeferscope int(4),
    ipa_lks_id_plandeferintervaltype int(4),
    ipa_plandeferinterval int(4),
    ipa_plandeferdate datetime(8),
    ipa_plandeferapplytoallinjections bit(1) NOT NULL,
    ipa_continuewithprotocolintervaltype int(4),
    ipa_continuewithprotocolinterval int(4),
    ipa_DateAdded datetime(8) NOT NULL,
    ipa_AddedBy uniqueidentifier(16) NOT NULL,
    ipa_TransactionId uniqueidentifier(16) NOT NULL,
    ipa_Action char(1) NOT NULL,
    ipa_ongoingplandisplaytext nvarchar(510),
    ipa_currentinjectiondisplaytext nvarchar(510),
    ipa_intendedintervaldisplaytext nvarchar(510),
    ipa_timeelapseddisplaytext nvarchar(510),
    ipa_lpe_id int(4),
    ipa_timeelapsed bit(1),
    ipa_intendedinterval int(4),
    ipa_IsReview bit(1) NOT NULL
);

CREATE TABLE InsertionDonorPositioning (
    DonorInsertionId int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    DonorPositioningId int(4) NOT NULL,
    DonorPositioningId int(4) NOT NULL
);

CREATE TABLE InsertionDonorPositioningLog (
    Id int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    DonorPositioningId int(4),
    DonorPositioningId int(4) NOT NULL
);

CREATE TABLE InstallationHistory (
    Id int(4) NOT NULL,
    PackageTypeId int(4),
    Description nvarchar(500),
    Version int(4),
    PublishedDate datetime(8),
    PublishedBy nvarchar(200),
    StartDateTime datetime(8) NOT NULL,
    EndDateTime datetime(8) NOT NULL,
    Success bit(1) NOT NULL,
    Message nvarchar(8000)
);

CREATE TABLE interfacedata (
    itd_id int(4) NOT NULL,
    itd_mim_id int(4) NOT NULL,
    itd_data varbinary(-1)
);

CREATE TABLE InterfaceDevice (
    sid_id int(4) NOT NULL,
    sid_deviceName nvarchar(510) NOT NULL,
    sid_active bit(1) NOT NULL,
    sid_baudRate int(4) NOT NULL,
    sid_dataBits int(4) NOT NULL,
    sid_parity int(4) NOT NULL,
    sid_stopBits int(4) NOT NULL,
    sid_handshake int(4) NOT NULL,
    sid_comPortSetting int(4) NOT NULL,
    sid_svu_id int(4),
    sid_validateChecksum bit(1) NOT NULL,
    sid_DtrEnable bit(1) NOT NULL,
    sid_requiresVisualAcuityUnit bit(1) NOT NULL,
    sid_ShouldImportSubjectiveIfZero bit(1),
    sid_ShouldImportSubjectiveIfEqualToAutoRefraction bit(1),
    sid_ShouldImportSubjectiveIfEqualToFocimetry bit(1),
    sid_lks_KeratometerId int(4),
    sid_RtsEnable bit(1) NOT NULL,
    sid_RtsEnableSimple bit(1) NOT NULL,
    sid_NidekHandshakeEnable bit(1) NOT NULL
);

CREATE TABLE InterfaceDeviceCommunicationRule (
    dcr_id int(4) NOT NULL,
    dcr_sdr_id int(4) NOT NULL,
    dcr_ruleactive bit(1) NOT NULL,
    dcr_rulevalue int(4)
);

CREATE TABLE interfacedevicemetadata (
    idm_id int(4) NOT NULL,
    idm_ity_id int(4) NOT NULL,
    idm_deviceserialnumber nvarchar(510),
    idm_loc_id uniqueidentifier(16)
);

CREATE TABLE interfacedevicemetadatalog (
    idm_ObjectId int(4) NOT NULL,
    idm_id int(4) NOT NULL,
    idm_ity_id int(4) NOT NULL,
    idm_deviceserialnumber nvarchar(510),
    idm_loc_id uniqueidentifier(16),
    idm_DateAdded datetime(8) NOT NULL,
    idm_AddedBy uniqueidentifier(16) NOT NULL,
    idm_TransactionId uniqueidentifier(16) NOT NULL,
    idm_Action char(1) NOT NULL
);

CREATE TABLE interfaceevent (
    iel_id int(4) NOT NULL,
    iel_ity_id int(4),
    iel_use_id uniqueidentifier(16),
    iel_host nvarchar(510),
    iel_loc_id uniqueidentifier(16),
    iel_message nvarchar(-1)
);

CREATE TABLE interfacepatientmatchcategory (
    pmc_id int(4) NOT NULL,
    pmc_description varchar(255)
);

CREATE TABLE interfacepatientmatchrule (
    pml_id int(4) NOT NULL,
    pml_description varchar(500),
    pml_apiclass varchar(255),
    pml_rulesucceededmessage nvarchar(510) NOT NULL,
    pml_rulefailedmessage nvarchar(510) NOT NULL
);

CREATE TABLE interfacequeue (
    itq_id int(4) NOT NULL,
    itq_lastupdated datetime(8),
    itq_use_id uniqueidentifier(16),
    itq_loc_id uniqueidentifier(16),
    itq_ipm_id int(4),
    itq_encountervalidationresult varchar(2000),
    itq_devicename varchar(255),
    itq_filepath varchar(500)
);

CREATE TABLE interfacequeue_topcon_statuschanged_PJB_20201111 (
    itq_id int(4) NOT NULL
);

CREATE TABLE interfacequeuelink (
    iql_id int(4) NOT NULL,
    iql_itq_id_parent int(4) NOT NULL,
    iql_itq_id_child int(4),
    iql_filenameparent varchar(255),
    iql_filenamechild varchar(255)
);

CREATE TABLE interfacequeuelog (
    itq_ObjectId int(4) NOT NULL,
    itq_id int(4) NOT NULL,
    itq_datecreated datetime(8),
    itq_status int(4),
    itq_lastupdated datetime(8),
    itq_use_id uniqueidentifier(16),
    itq_loc_id uniqueidentifier(16),
    itq_ect_id uniqueidentifier(16),
    itq_ipm_id int(4),
    itq_encountervalidationresult varchar(2000),
    itq_devicename varchar(255),
    itq_DateAdded datetime(8) NOT NULL,
    itq_AddedBy uniqueidentifier(16) NOT NULL,
    itq_TransactionId uniqueidentifier(16) NOT NULL,
    itq_Action char(1) NOT NULL,
    itq_ity_id int(4),
    itq_filepath varchar(500),
    itq_SourceUniqueIdentifier nvarchar(510)
);

CREATE TABLE InterfaceQueueOctopusFileMatching (
    iqo_Id int(4) NOT NULL,
    iqo_Identifier nvarchar(400) NOT NULL,
    iqo_pat_PatientId uniqueidentifier(16) NOT NULL
);

CREATE TABLE interfacetype (
    ity_id int(4) NOT NULL,
    ity_name varchar(255) NOT NULL,
    ity_queueprocesspriority int(4) NOT NULL,
    ity_initialqueuestatus int(4) NOT NULL,
    ity_parentInterfaceType int(4)
);

CREATE TABLE interfacetypepatientmatchrule (
    ipr_id int(4) NOT NULL,
    ipr_ity_id int(4) NOT NULL,
    ipr_pml_id int(4) NOT NULL,
    ipr_pmc_id int(4) NOT NULL,
    ipr_categoryorder int(4) NOT NULL,
    ipr_status int(4) NOT NULL,
    ipr_active bit(1) NOT NULL,
    ipr_interfacesubtype int(4)
);

CREATE TABLE interfaceworklist (
    iwl_id int(4) NOT NULL,
    iwl_timestamp datetime(8) NOT NULL,
    iwl_pat_id uniqueidentifier(16) NOT NULL,
    iwl_ity_id int(4),
    iwl_processedfromqueue bit(1)
);

CREATE TABLE Investigation (
    inv_id int(4) NOT NULL,
    iri_Id int(4) NOT NULL,
    pin_act_id uniqueidentifier(16) NOT NULL,
    pin_inr_value decimal(5),
    iri_OmitAllDevicesWhenInGroup bit(1) NOT NULL,
    pin_Hcg_Id int(4) NOT NULL,
    pin_uar_id int(4) NOT NULL,
    inv_loc_id uniqueidentifier(16) NOT NULL,
    inv_investigationstatus int(4) NOT NULL,
    pin_Comments nvarchar(1000),
    inv_daterequested date(3) NOT NULL,
    inv_bod_id int(4) NOT NULL,
    inv_icp_id int(4) NOT NULL,
    inv_orderedby uniqueidentifier(16) NOT NULL
);

CREATE TABLE InvestigationConcept (
    icp_id int(4) NOT NULL,
    icp_description varchar(200),
    icp_abbreviated varchar(200),
    icp_searchable bit(1),
    icp_eyerelated bit(1),
    icp_snomedid varchar(100)
);

CREATE TABLE InvestigationDeviceLink (
    irg_Id int(4) NOT NULL,
    irg_iri_id int(4) NOT NULL,
    irg_ird_DeviceType int(4) NOT NULL
);

CREATE TABLE InvestigationHcgResultType (
    Hcg_Id int(4) NOT NULL,
    hcg_Description varchar(100) NOT NULL
);

CREATE TABLE InvestigationItem (
    eip_Id int(4) NOT NULL,
    eii_eti_ItemId int(4) NOT NULL,
    eii_eit_InvestigationTypeId int(4) NOT NULL,
    eip_iiv_InvestigationVersionId int(4) NOT NULL
);

CREATE TABLE InvestigationItemLog (
    eip_Id int(4) NOT NULL,
    eii_eti_ItemId int(4) NOT NULL,
    eii_eit_InvestigationTypeId int(4) NOT NULL,
    eip_ObjectId int(4) NOT NULL,
    eip_DateAdded datetime(8) NOT NULL,
    eip_AddedBy uniqueidentifier(16) NOT NULL,
    eii_ObjectId int(4) NOT NULL,
    eii_DateAdded datetime(8) NOT NULL,
    eip_TransactionId uniqueidentifier(16) NOT NULL,
    eip_Action char(1) NOT NULL,
    eii_AddedBy uniqueidentifier(16) NOT NULL,
    eii_Transactionid uniqueidentifier(16) NOT NULL,
    eip_iiv_InvestigationVersionId int(4) NOT NULL,
    eii_Action char(1) NOT NULL
);

CREATE TABLE InvestigationItemVersion (
    iiv_eiv_ItemVersionId int(4) NOT NULL,
    iiv_eii_InvestigationItemId int(4) NOT NULL,
    iiv_bod_BodyPartId int(4) NOT NULL
);

CREATE TABLE InvestigationItemVersionLog (
    iiv_eiv_ItemVersionId int(4) NOT NULL,
    iiv_eii_InvestigationItemId int(4) NOT NULL,
    iiv_bod_BodyPartId int(4) NOT NULL,
    iiv_ObjectId int(4) NOT NULL,
    iiv_DateAdded datetime(8) NOT NULL,
    iiv_AddedBy uniqueidentifier(16) NOT NULL,
    iiv_Transactionid uniqueidentifier(16) NOT NULL,
    iiv_Action char(1) NOT NULL
);

CREATE TABLE InvestigationLog (
    inv_ObjectId int(4) NOT NULL,
    pin_act_id int(4) NOT NULL,
    pin_ObjectId uniqueidentifier(16),
    pin_DateAdded datetime(8) NOT NULL,
    inv_ect_id uniqueidentifier(16),
    inv_bod_id int(4) NOT NULL,
    pin_AddedBy uniqueidentifier(16) NOT NULL,
    pin_Transactionid uniqueidentifier(16) NOT NULL,
    inv_icp_id int(4) NOT NULL,
    pin_Action char(1) NOT NULL,
    inv_DateAdded datetime(8) NOT NULL,
    inv_AddedBy uniqueidentifier(16) NOT NULL,
    pin_inr_value decimal(5),
    pin_Hcg_Id int(4) NOT NULL,
    inv_TransactionId uniqueidentifier(16) NOT NULL,
    inv_Action char(1) NOT NULL,
    pin_uar_id int(4) NOT NULL,
    pin_Comments nvarchar(1000),
    inv_id int(4) NOT NULL,
    inv_identifier varchar(100),
    inv_pat_id uniqueidentifier(16),
    inv_loc_id uniqueidentifier(16),
    inv_investigationstatus int(4),
    inv_daterequested date(3),
    inv_orderedby uniqueidentifier(16)
);

CREATE TABLE Investigations (
    Id int(4) NOT NULL,
    InvestigationId int(4) NOT NULL,
    DefaultId int(4) NOT NULL
);

CREATE TABLE InvestigationsLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    InvestigationId int(4) NOT NULL,
    DefaultId int(4) NOT NULL
);

CREATE TABLE InvestigationStatus (
    ins_id int(4) NOT NULL,
    ins_description varchar(200) NOT NULL
);

CREATE TABLE InvestigationType (
    eit_id int(4) NOT NULL,
    eit_Description nvarchar(500) NOT NULL
);

CREATE TABLE InvestigationUrineAnalysisResultType (
    uar_id int(4) NOT NULL,
    uar_description varchar(100) NOT NULL
);

CREATE TABLE IolGUID (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE IolMasterReport (
    fir_ect_EncounterId uniqueidentifier(16) NOT NULL
);

CREATE TABLE iolmodel (
    iol_id uniqueidentifier(16) NOT NULL,
    iol_name varchar(255) NOT NULL,
    iol_description varchar(255),
    iol_available bit(1) NOT NULL,
    iol_multiplerange bit(1) NOT NULL,
    iol_stockitem bit(1) NOT NULL,
    iol_stockpowerlow decimal(5),
    iol_stockpowerhigh decimal(5),
    iol_lks_id_lenstype int(4),
    iol_phakic bit(1) NOT NULL,
    iol_lks_id_premiumlens int(4),
    iol_aspheric bit(1) NOT NULL,
    iol_blueblocking bit(1) NOT NULL,
    iol_lks_id_opticmaterial int(4),
    iol_lks_id_hapticmaterial int(4),
    iol_opticsizewidth decimal(5),
    iol_opticsizeheight decimal(5),
    iol_length decimal(5),
    iol_hapticangle decimal(5),
    iol_lks_id_opticstyle int(4),
    iol_lks_id_hapticstyle int(4),
    iol_pieces tinyint(1),
    iol_refractiveindex decimal(5),
    iol_notes nvarchar(510),
    iol_DesignFactor decimal(5)
);

CREATE TABLE iolmodelconstant (
    imc_id int(4) NOT NULL,
    imc_iol_id uniqueidentifier(16) NOT NULL,
    imc_lks_id_constanttype int(4) NOT NULL,
    imc_use_id uniqueidentifier(16),
    imc_aconstant decimal(5),
    imc_sf decimal(5),
    imc_pacd decimal(5),
    imc_a0 decimal(5),
    imc_a1 decimal(5),
    imc_a2 decimal(5),
    imc_LensFactor decimal(5)
);

CREATE TABLE iolmodelconstantlog (
    imc_ObjectId int(4) NOT NULL,
    imc_id int(4) NOT NULL,
    imc_iol_id uniqueidentifier(16) NOT NULL,
    imc_lks_id_constanttype int(4) NOT NULL,
    imc_use_id uniqueidentifier(16),
    imc_aconstant decimal(5),
    imc_sf decimal(5),
    imc_pacd decimal(5),
    imc_a0 decimal(5),
    imc_a1 decimal(5),
    imc_a2 decimal(5),
    imc_DateAdded datetime(8) NOT NULL,
    imc_AddedBy uniqueidentifier(16) NOT NULL,
    imc_TransactionId uniqueidentifier(16) NOT NULL,
    imc_Action char(1) NOT NULL,
    imc_LensFactor decimal(5)
);

CREATE TABLE iolmodellog (
    iol_ObjectId uniqueidentifier(16) NOT NULL,
    iol_id int(4) NOT NULL,
    iol_name varchar(255) NOT NULL,
    iol_description varchar(255),
    iol_available bit(1) NOT NULL,
    iol_multiplerange bit(1) NOT NULL,
    iol_stockitem bit(1) NOT NULL,
    iol_stockpowerlow decimal(5),
    iol_stockpowerhigh decimal(5),
    iol_lks_id_lenstype int(4),
    iol_phakic bit(1) NOT NULL,
    iol_lks_id_premiumlens int(4),
    iol_aspheric bit(1) NOT NULL,
    iol_blueblocking bit(1) NOT NULL,
    iol_lks_id_opticmaterial int(4),
    iol_lks_id_hapticmaterial int(4),
    iol_opticsizewidth decimal(5),
    iol_opticsizeheight decimal(5),
    iol_length decimal(5),
    iol_hapticangle decimal(5),
    iol_lks_id_opticstyle int(4),
    iol_lks_id_hapticstyle int(4),
    iol_pieces tinyint(1),
    iol_refractiveindex decimal(5),
    iol_notes nvarchar(510),
    iol_DateAdded datetime(8) NOT NULL,
    iol_AddedBy uniqueidentifier(16) NOT NULL,
    iol_TransactionId uniqueidentifier(16) NOT NULL,
    iol_Action char(1) NOT NULL,
    iol_DesignFactor decimal(5)
);

CREATE TABLE iolmodelrange (
    ilr_id int(4) NOT NULL,
    ilr_iol_id uniqueidentifier(16) NOT NULL,
    ilr_range_low decimal(5) NOT NULL,
    ilr_range_high decimal(5) NOT NULL,
    ilr_increment decimal(5) NOT NULL
);

CREATE TABLE iolmodelrangelog (
    ilr_ObjectId int(4) NOT NULL,
    ilr_id int(4) NOT NULL,
    ilr_iol_id uniqueidentifier(16) NOT NULL,
    ilr_range_low decimal(5) NOT NULL,
    ilr_range_high decimal(5) NOT NULL,
    ilr_increment decimal(5) NOT NULL,
    ilr_DateAdded datetime(8) NOT NULL,
    ilr_AddedBy uniqueidentifier(16) NOT NULL,
    ilr_TransactionId uniqueidentifier(16) NOT NULL,
    ilr_Action char(1) NOT NULL
);

CREATE TABLE iolmodelselection (
    ims_id int(4) NOT NULL,
    ims_bod_id int(4) NOT NULL,
    ims_choseniolpower float(8),
    ims_iol_id uniqueidentifier(16),
    ims_lks_id_iolformula int(4),
    ims_imc_id int(4),
    ims_lks_id_constanttype int(4),
    ims_aconstant decimal(5),
    ims_sf decimal(5),
    ims_pacd decimal(5),
    ims_a0 decimal(5),
    ims_a1 decimal(5),
    ims_a2 decimal(5),
    ims_targetrefraction float(8),
    ims_predpostopref float(8),
    ims_choseniolpowerdatetime datetime(8),
    ims_ExactIolPower float(8),
    ims_ExactIolPowerText varchar(10),
    ims_CalculatorVersion varchar(20),
    ims_ChosenIolPowerText varchar(10),
    ims_ChosenRefractionText varchar(10),
    ims_LensFactor decimal(5),
    ims_DesignFactor decimal(5),
    ims_ErrorDuringCalculation bit(1),
    ims_InputParametersOutOfRange bit(1)
);

CREATE TABLE iolmodelselectionhistory (
    ish_id int(4) NOT NULL,
    ish_bod_id int(4),
    ish_choseniolpower float(8),
    ish_dateselected datetime(8),
    ish_use_id_selectedby uniqueidentifier(16),
    ish_iol_id uniqueidentifier(16),
    ish_predictedrefraction float(8),
    ish_ChosenIolPowerText varchar(10),
    ish_ChosenRefractionText varchar(10),
    ish_CalculatorVersion varchar(20)
);

CREATE TABLE iolmodelselectionlog (
    ims_ObjectId int(4) NOT NULL,
    ims_id int(4) NOT NULL,
    ims_act_id uniqueidentifier(16) NOT NULL,
    ims_bod_id int(4) NOT NULL,
    ims_choseniolpower float(8),
    ims_iol_id uniqueidentifier(16),
    ims_lks_id_iolformula int(4),
    ims_imc_id int(4),
    ims_lks_id_constanttype int(4),
    ims_aconstant decimal(5),
    ims_sf decimal(5),
    ims_pacd decimal(5),
    ims_a0 decimal(5),
    ims_a1 decimal(5),
    ims_a2 decimal(5),
    ims_targetrefraction float(8),
    ims_predpostopref float(8),
    ims_DateAdded datetime(8) NOT NULL,
    ims_AddedBy uniqueidentifier(16) NOT NULL,
    ims_TransactionId uniqueidentifier(16) NOT NULL,
    ims_Action char(1) NOT NULL,
    ims_choseniolpowerdatetime datetime(8),
    ims_ExactIolPower float(8),
    ims_ExactIolPowerText varchar(10),
    ims_CalculatorVersion varchar(20),
    ims_ChosenIolPowerText varchar(10),
    ims_ChosenRefractionText varchar(10),
    ims_LensFactor decimal(5),
    ims_DesignFactor decimal(5),
    ims_ErrorDuringCalculation bit(1),
    ims_InputParametersOutOfRange bit(1)
);

CREATE TABLE IolPowerCalculation (
    ipc_id int(4) NOT NULL,
    ipc_IolPower float(8) NOT NULL,
    ipc_IolPowerText varchar(10) NOT NULL,
    ipc_Refraction float(8) NOT NULL,
    ipc_RefractionText varchar(10) NOT NULL,
    ipc_ClosestToTarget bit(1) NOT NULL
);

CREATE TABLE IolPowerCalculationLog (
    ipc_ObjectId int(4) NOT NULL,
    ipc_id int(4) NOT NULL,
    ipc_ims_id int(4) NOT NULL,
    ipc_IolPower float(8) NOT NULL,
    ipc_IolPowerText varchar(10) NOT NULL,
    ipc_Refraction float(8) NOT NULL,
    ipc_RefractionText varchar(10) NOT NULL,
    ipc_ClosestToTarget bit(1) NOT NULL,
    ipc_DateAdded datetime(8) NOT NULL,
    ipc_AddedBy uniqueidentifier(16) NOT NULL,
    ipc_TransactionId uniqueidentifier(16) NOT NULL,
    ipc_Action char(1) NOT NULL
);

CREATE TABLE IopTarget (
    iot_id int(4) NOT NULL,
    iot_pat_id uniqueidentifier(16) NOT NULL,
    iot_bod_id int(4) NOT NULL,
    iot_value decimal(5),
    iot_valuetype int(4),
    iot_current bit(1) NOT NULL,
    iot_daterecorded datetime(8)
);

CREATE TABLE iopvalue (
    iop_id int(4) NOT NULL,
    iop_bod_id int(4) NOT NULL,
    iop_value decimal(5),
    iop_valuetype int(4),
    iop_lks_id_reliability int(4),
    iop_lks_id_method int(4),
    iop_pdt_historicdate uniqueidentifier(16),
    iop_time time(5),
    iop_mode int(4),
    iop_lks_id_medicationstatus int(4),
    iop_lks_id_status int(4),
    iop_deleted bit(1)
);

CREATE TABLE iopvaluelog (
    iop_ObjectId int(4) NOT NULL,
    iop_id int(4) NOT NULL,
    iop_act_id uniqueidentifier(16) NOT NULL,
    iop_bod_id int(4) NOT NULL,
    iop_value decimal(5),
    iop_valuetype int(4),
    iop_lks_id_reliability int(4),
    iop_lks_id_method int(4),
    iop_pdt_historicdate uniqueidentifier(16),
    iop_time time(5),
    iop_mode int(4),
    iop_lks_id_medicationstatus int(4),
    iop_lks_id_status int(4),
    iop_DateAdded datetime(8) NOT NULL,
    iop_AddedBy uniqueidentifier(16) NOT NULL,
    iop_TransactionId uniqueidentifier(16) NOT NULL,
    iop_Action char(1) NOT NULL,
    iop_deleted bit(1)
);

CREATE TABLE IORecession (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    LocationRecessedToColumn int(4),
    SutureId int(4),
    LocationRecessedToRow int(4),
    SutureId int(4)
);

CREATE TABLE IORecessionLog (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    SutureId int(4),
    LocationRecessedToColumn int(4),
    LocationRecessedToRow int(4),
    SutureId int(4)
);

CREATE TABLE Item (
    eti_id int(4) NOT NULL,
    eti_Description nvarchar(2000) NOT NULL,
    eti_eci_ItemTypeId int(4) NOT NULL,
    eti_UniqueKey uniqueidentifier(16) NOT NULL
);

CREATE TABLE ItemLog (
    eti_id int(4) NOT NULL,
    eti_ObjectId int(4) NOT NULL,
    eti_DateAdded datetime(8) NOT NULL,
    eti_AddedBy uniqueidentifier(16) NOT NULL,
    eti_TransactionId uniqueidentifier(16) NOT NULL,
    eti_Action char(1) NOT NULL,
    eti_Description nvarchar(2000) NOT NULL,
    eti_eci_ItemTypeId int(4) NOT NULL,
    eti_UniqueKey uniqueidentifier(16)
);

CREATE TABLE ItemRelative (
    hir_id int(4) NOT NULL
);

CREATE TABLE ItemType (
    eci_id int(4) NOT NULL,
    eci_Description nvarchar(200) NOT NULL,
    eci_IsQuestion bit(1) NOT NULL
);

CREATE TABLE ItemTypeResponse (
    atr_eci_ItemTypeId int(4) NOT NULL,
    atr_aqr_QuestionResponseId int(4) NOT NULL
);

CREATE TABLE ItemVersion (
    eiv_id int(4) NOT NULL,
    eiv_Description nvarchar(2000) NOT NULL,
    eiv_eci_ItemTypeId int(4) NOT NULL,
    eiv_eti_PreviousItemId int(4),
    eiv_eti_ParentItemId int(4)
);

CREATE TABLE ItemVersionLog (
    eiv_id int(4) NOT NULL,
    eiv_ObjectId int(4) NOT NULL,
    eiv_DateAdded datetime(8) NOT NULL,
    eiv_AddedBy uniqueidentifier(16) NOT NULL,
    eiv_TransactionId uniqueidentifier(16) NOT NULL,
    eiv_Action char(1) NOT NULL,
    eiv_eti_ItemId int(4) NOT NULL,
    eiv_Description nvarchar(2000) NOT NULL,
    eiv_eci_ItemTypeId int(4) NOT NULL,
    eiv_Version int(4),
    eiv_eti_PreviousItemId int(4),
    eiv_eti_ParentItemId int(4)
);

CREATE TABLE IVIType (
    Id int(4) NOT NULL,
    Description nvarchar(512) NOT NULL
);

CREATE TABLE IVITypeChartConfiguration (
    Id int(4) NOT NULL,
    IVITypeId int(4) NOT NULL,
    AddChart bit(1) NOT NULL,
    ChartLabelDescription nvarchar(512),
    ChartColor varchar(256)
);

CREATE TABLE IVITypeChartSeriesDataConfiguration (
    Id int(4) NOT NULL,
    IVITypeId int(4) NOT NULL,
    PaneId int(4) NOT NULL,
    ChartSeriesPointValue decimal(9),
    ChartSeriesColor varchar(256)
);

CREATE TABLE keratometry (
    kty_id int(4) NOT NULL,
    kty_bod_id int(4) NOT NULL,
    kty_lks_id_keratometer int(4),
    kty_k1mm float(8),
    kty_k1dioptres float(8),
    kty_k1meridian float(8),
    kty_k2mm float(8),
    kty_k2dioptres float(8),
    kty_k2meridian float(8),
    kty_meankdioptres float(8),
    kty_meankmm float(8),
    kty_wtwcornealdiameter float(8),
    kty_keratometricindex float(8),
    kty_originalnotation int(4)
);

CREATE TABLE keratometrylog (
    kty_ObjectId int(4) NOT NULL,
    kty_id int(4) NOT NULL,
    kty_act_id uniqueidentifier(16) NOT NULL,
    kty_bod_id int(4) NOT NULL,
    kty_lks_id_keratometer int(4),
    kty_k1mm float(8),
    kty_k1dioptres float(8),
    kty_k1meridian float(8),
    kty_k2mm float(8),
    kty_k2dioptres float(8),
    kty_k2meridian float(8),
    kty_meankdioptres float(8),
    kty_meankmm float(8),
    kty_wtwcornealdiameter float(8),
    kty_keratometricindex float(8),
    kty_DateAdded datetime(8) NOT NULL,
    kty_AddedBy uniqueidentifier(16) NOT NULL,
    kty_TransactionId uniqueidentifier(16) NOT NULL,
    kty_Action char(1) NOT NULL,
    kty_originalnotation int(4)
);

CREATE TABLE KetoneData (
    ukt_id int(4) NOT NULL,
    ukt_available bit(1) NOT NULL
);

CREATE TABLE LanguageCode (
    LanguageCodeId int(4) NOT NULL,
    DecimalSeparatorOverride nvarchar(10)
);

CREATE TABLE languages (
    Code varchar(50),
    Interpreter language varchar(255)
);

CREATE TABLE laser (
    las_id int(4) NOT NULL,
    las_act_id uniqueidentifier(16),
    las_bod_id int(4),
    las_lks_id_instrument int(4),
    las_wavelength int(4),
    las_variable bit(1),
    las_powermin int(4),
    las_powermax int(4),
    las_durationmin int(4),
    las_durationmax int(4),
    las_lks_id_burnintensity int(4),
    las_lat_id int(4),
    las_lks_id_colour int(4),
    las_firstprp int(4),
    las_othercomments nvarchar(4000),
    las_iscontinuous bit(1) NOT NULL,
    las_areatreatedfull bit(1),
    las_areatreatedpartialclockhours int(4),
    las_areatreatedcomments nvarchar(4000)
);

CREATE TABLE laserdelivery (
    lsd_id int(4) NOT NULL,
    lsd_las_id int(4) NOT NULL,
    lsd_lks_id_lens int(4),
    lsd_spotsize int(4),
    lsd_burns int(4),
    lsd_order int(4) NOT NULL,
    lsd_isdeleted bit(1) NOT NULL
);

CREATE TABLE laserdeliverylog (
    lsd_ObjectId int(4) NOT NULL,
    lsd_id int(4) NOT NULL,
    lsd_las_id int(4) NOT NULL,
    lsd_lks_id_lens int(4),
    lsd_burns int(4),
    lsd_order int(4) NOT NULL,
    lsd_isdeleted bit(1) NOT NULL,
    lsd_DateAdded datetime(8) NOT NULL,
    lsd_AddedBy uniqueidentifier(16) NOT NULL,
    lsd_TransactionId uniqueidentifier(16) NOT NULL,
    lsd_Action char(1) NOT NULL,
    lsd_spotsize int(4)
);

CREATE TABLE laserlog (
    las_ObjectId int(4) NOT NULL,
    las_id int(4) NOT NULL,
    las_act_id uniqueidentifier(16),
    las_bod_id int(4),
    las_lks_id_instrument int(4),
    las_wavelength int(4),
    las_variable bit(1),
    las_powermin int(4),
    las_powermax int(4),
    las_durationmin int(4),
    las_durationmax int(4),
    las_lks_id_burnintensity int(4),
    las_lat_id int(4),
    las_firstprp int(4),
    las_DateAdded datetime(8) NOT NULL,
    las_AddedBy uniqueidentifier(16) NOT NULL,
    las_TransactionId uniqueidentifier(16) NOT NULL,
    las_Action char(1) NOT NULL,
    las_lks_id_colour int(4),
    las_othercomments nvarchar(4000),
    las_iscontinuous bit(1),
    las_areatreatedfull bit(1),
    las_areatreatedpartialclockhours int(4),
    las_areatreatedcomments nvarchar(4000)
);

CREATE TABLE lasersurgerytype (
    lat_id int(4) NOT NULL,
    lat_description varchar(255) NOT NULL
);

CREATE TABLE lasersurgerytypelog (
    lat_ObjectId int(4) NOT NULL,
    lat_id int(4) NOT NULL,
    lat_description varchar(255) NOT NULL,
    lat_DateAdded datetime(8) NOT NULL,
    lat_AddedBy uniqueidentifier(16) NOT NULL,
    lat_TransactionId uniqueidentifier(16) NOT NULL,
    lat_Action char(1) NOT NULL
);

CREATE TABLE lasersurgerytypeprocedures (
    lap_id int(4) NOT NULL,
    lap_lat_id int(4) NOT NULL,
    lap_pro_id int(4) NOT NULL,
    lap_pqi_id int(4)
);

CREATE TABLE lasersurgerytypeprocedureslog (
    lap_ObjectId int(4) NOT NULL,
    lap_id int(4) NOT NULL,
    lap_lat_id int(4) NOT NULL,
    lap_pro_id int(4) NOT NULL,
    lap_pqi_id int(4),
    lap_DateAdded datetime(8) NOT NULL,
    lap_AddedBy uniqueidentifier(16) NOT NULL,
    lap_TransactionId uniqueidentifier(16) NOT NULL,
    lap_Action char(1) NOT NULL
);

CREATE TABLE LaserTrabeculoplasty (
    dlt_sdf_id int(4) NOT NULL,
    glt_ActivityId uniqueidentifier(16) NOT NULL,
    glt_ProcedureType_LookupDataId int(4) NOT NULL,
    dlt_Instrument_LookupDataId int(4),
    dlt_GonioLens_LookupDataId int(4),
    glt_Instrument_LookupDataId int(4) NOT NULL,
    glt_GonioLens_LookupDataId int(4),
    dlt_RightEyeDegreesTreated int(4),
    dlt_RightEyePositionFrom int(4),
    glt_BodyPartId int(4) NOT NULL,
    glt_Sparing bit(1) NOT NULL,
    dlt_RightEyePositionTo int(4),
    dlt_RightEyeSparing bit(1) NOT NULL,
    glt_NumberOfLaserSpots int(4),
    glt_TissueReactionObserved bit(1),
    dlt_LeftEyeDegreesTreated int(4),
    dlt_LeftEyePositionFrom int(4),
    glt_DegreesTreated int(4),
    glt_FromPosition int(4),
    dlt_LeftEyePositionTo int(4),
    dlt_LeftEyeSparing bit(1) NOT NULL,
    glt_ToPosition int(4),
    glt_TissueReactionObservedComments nvarchar(500)
);

CREATE TABLE LaserTrabeculoplastyLog (
    glt_ActivityId int(4) NOT NULL,
    dlt_sdf_id int(4) NOT NULL,
    dlt_ObjectId int(4) NOT NULL,
    glt_ObjectId uniqueidentifier(16) NOT NULL,
    glt_DateAdded datetime(8) NOT NULL,
    dlt_DateAdded datetime(8) NOT NULL,
    dlt_AddedBy uniqueidentifier(16) NOT NULL,
    glt_AddedBy uniqueidentifier(16) NOT NULL,
    glt_Transactionid uniqueidentifier(16) NOT NULL,
    dlt_Transactionid uniqueidentifier(16) NOT NULL,
    dlt_Action char(1) NOT NULL,
    glt_Action char(1) NOT NULL,
    glt_ProcedureType_LookupDataId int(4) NOT NULL,
    dlt_Instrument_LookupDataId int(4),
    dlt_GonioLens_LookupDataId int(4),
    glt_Instrument_LookupDataId int(4) NOT NULL,
    glt_GonioLens_LookupDataId int(4),
    dlt_RightEyeDegreesTreated int(4),
    dlt_RightEyePositionFrom int(4),
    glt_BodyPartId int(4) NOT NULL,
    glt_Sparing bit(1) NOT NULL,
    dlt_RightEyePositionTo int(4),
    dlt_RightEyeSparing bit(1) NOT NULL,
    glt_NumberOfLaserSpots int(4),
    glt_TissueReactionObserved bit(1),
    dlt_LeftEyeDegreesTreated int(4),
    dlt_LeftEyePositionFrom int(4),
    glt_DegreesTreated int(4),
    glt_FromPosition int(4),
    dlt_LeftEyePositionTo int(4),
    dlt_LeftEyeSparing bit(1) NOT NULL,
    glt_ToPosition int(4),
    glt_TissueReactionObservedComments nvarchar(500)
);

CREATE TABLE LateralisedDiabeticEyeScreening (
    Id int(4) NOT NULL,
    BodyPartId int(4) NOT NULL,
    RetinopathyGrade int(4),
    MaculopathyGrade int(4),
    PhotocoagulationGrade int(4),
    ImageQuality int(4),
    Ungradable bit(1) NOT NULL
);

CREATE TABLE LateralisedDiabeticEyeScreeningFeature (
    Id int(4) NOT NULL,
    FeatureId int(4) NOT NULL
);

CREATE TABLE LateralisedDiabeticEyeScreeningOtherCondition (
    Id int(4) NOT NULL,
    Code int(4),
    Condition nvarchar(-1)
);

CREATE TABLE LateralisedRiskFactors (
    plf_Id int(4) NOT NULL,
    plf_IsFirstEye bit(1),
    plf_lks_PupilSizeId int(4),
    plf_ect_PreviousSurgeryEncounterId uniqueidentifier(16),
    plf_PreviousSurgeryProceduresDescription nvarchar(-1),
    plf_PreviousSurgeryOperativeComplicationsDescription nvarchar(-1)
);

CREATE TABLE LateralisedVisualAcuity (
    Id int(4) NOT NULL,
    Value nvarchar(510) NOT NULL,
    CorrectionId int(4) NOT NULL,
    NotationId int(4) NOT NULL
);

CREATE TABLE LateralizedRiskScore (
    Id int(4) NOT NULL,
    RiskScoreId int(4),
    Comments nvarchar(1000)
);

CREATE TABLE LateralizedRiskScoreLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    BodyPartId int(4) NOT NULL,
    RiskScoreId int(4),
    Comments nvarchar(1000)
);

CREATE TABLE LatestObservation (
    dob_id int(4) NOT NULL,
    dob_act_id uniqueidentifier(16) NOT NULL,
    dob_DateRecorded datetime(8) NOT NULL,
    dob_EncounterTypeId int(4) NOT NULL,
    dob_TimeRecorded time(5)
);

CREATE TABLE LatestObservationLog (
    dob_id int(4) NOT NULL,
    dob_ObjectId int(4) NOT NULL,
    dob_DateAdded datetime(8) NOT NULL,
    dob_AddedBy uniqueidentifier(16) NOT NULL,
    dob_Transactionid uniqueidentifier(16) NOT NULL,
    dob_Action char(1) NOT NULL,
    dob_act_id uniqueidentifier(16) NOT NULL,
    dob_DateRecorded datetime(8) NOT NULL,
    dob_EncounterTypeId int(4) NOT NULL,
    dob_TimeRecorded time(5)
);

CREATE TABLE LatestObservationReading (
    dom_id int(4) NOT NULL,
    dom_dob_id int(4) NOT NULL,
    dom_mlk_id int(4) NOT NULL
);

CREATE TABLE LatestObservationReadingLog (
    dom_id int(4) NOT NULL,
    dom_ObjectId int(4) NOT NULL,
    dom_DateAdded datetime(8) NOT NULL,
    dom_AddedBy uniqueidentifier(16) NOT NULL,
    dom_Transactionid uniqueidentifier(16) NOT NULL,
    dom_Action char(1) NOT NULL,
    dom_dob_id int(4) NOT NULL,
    dom_mlk_id int(4) NOT NULL
);

CREATE TABLE Layout (
    dtl_id tinyint(1) NOT NULL,
    dtl_description nvarchar(100) NOT NULL
);

CREATE TABLE LeucocytesData (
    uly_id int(4) NOT NULL,
    uly_available bit(1) NOT NULL
);

CREATE TABLE LinkedPlannedEvent (
    lpe_id int(4) NOT NULL
);

CREATE TABLE LinkedPlannedEventLog (
    lpe_ObjectId int(4) NOT NULL,
    lpe_id int(4) NOT NULL,
    lpe_eventnumber int(4) NOT NULL,
    lpe_planneddate datetime(8),
    lpe_pes_id int(4) NOT NULL,
    lpe_DateAdded datetime(8) NOT NULL,
    lpe_AddedBy uniqueidentifier(16) NOT NULL,
    lpe_TransactionId uniqueidentifier(16) NOT NULL,
    lpe_Action char(1) NOT NULL,
    lpe_ppr_id int(4) NOT NULL,
    lpe_tpp_id int(4),
    lpe_ActionedDate datetime(8),
    lpe_ppr_id_associatedevent int(4),
    lpe_createddate datetime(8),
    lpe_associatedeventdateoverride datetime(8),
    lpe_originalplanneddatetime datetime(8)
);

CREATE TABLE LinkedPlannedEventStatus (
    pes_id int(4) NOT NULL,
    pes_description nvarchar(400)
);

CREATE TABLE listactivity (
    lac_id int(4) NOT NULL
);

CREATE TABLE listactivitylog (
    lac_ObjectId int(4) NOT NULL,
    lac_id int(4) NOT NULL,
    lac_act_id uniqueidentifier(16) NOT NULL,
    lac_lqs_id int(4) NOT NULL,
    lac_pdt_id uniqueidentifier(16) NOT NULL,
    lac_ect_id_operation uniqueidentifier(16),
    lac_DateAdded datetime(8) NOT NULL,
    lac_AddedBy uniqueidentifier(16) NOT NULL,
    lac_TransactionId uniqueidentifier(16) NOT NULL,
    lac_Action char(1) NOT NULL
);

CREATE TABLE ListAdvancedResponseBooleanValue (
    nbv_Id int(4) NOT NULL
);

CREATE TABLE ListAdvancedResponseBooleanValueLog (
    nbv_Id int(4) NOT NULL,
    nbv_ObjectId int(4) NOT NULL,
    nbv_DateAdded datetime(8) NOT NULL,
    nbv_AddedBy uniqueidentifier(16) NOT NULL,
    nbv_TransactionId uniqueidentifier(16) NOT NULL,
    nbv_Action char(1) NOT NULL,
    nbv_AdvancedResponseQuestionItemId int(4) NOT NULL,
    nbv_ListResponseId int(4) NOT NULL,
    nbv_Value bit(1)
);

CREATE TABLE ListAdvancedResponseDataType (
    art_id int(4) NOT NULL
);

CREATE TABLE ListAdvancedResponseQuestion (
    arq_id int(4) NOT NULL,
    arq_HideDefaultResponses bit(1) NOT NULL,
    arq_DefaultResponseId int(4),
    arq_lks_TriggerResponseId int(4)
);

CREATE TABLE ListAdvancedResponseQuestionItem (
    aqi_id int(4) NOT NULL,
    aqi_Label nvarchar(400) NOT NULL,
    aqi_art_id_DataType int(4) NOT NULL,
    aqi_order int(4) NOT NULL
);

CREATE TABLE ListAdvancedResponseSingleSelectComboBoxValue (
    scv_Id int(4) NOT NULL
);

CREATE TABLE ListAdvancedResponseSingleSelectComboBoxValueLog (
    scv_Id int(4) NOT NULL,
    scv_ObjectId int(4) NOT NULL,
    scv_DateAdded datetime(8) NOT NULL,
    scv_AddedBy uniqueidentifier(16) NOT NULL,
    scv_TransactionId uniqueidentifier(16) NOT NULL,
    scv_Action char(1) NOT NULL,
    scv_AdvancedResponseQuestionItemId int(4) NOT NULL,
    scv_ListResponseId int(4) NOT NULL
);

CREATE TABLE ListAdvancedResponseTimeSpanValue (
    ard_id int(4) NOT NULL,
    ard_Value time(5) NOT NULL
);

CREATE TABLE ListAdvancedResponseTimeSpanValueLog (
    ard_id int(4) NOT NULL,
    ard_ObjectId int(4) NOT NULL,
    ard_DateAdded datetime(8) NOT NULL,
    ard_AddedBy uniqueidentifier(16) NOT NULL,
    ard_Transactionid uniqueidentifier(16) NOT NULL,
    ard_Action char(1) NOT NULL,
    ard_aqi_id int(4) NOT NULL,
    ard_lrp_id int(4) NOT NULL,
    ard_Value time(5) NOT NULL
);

CREATE TABLE listclinicalconceptquestion (
    lcq_id int(4) NOT NULL
);

CREATE TABLE listclinicalconceptquestion_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    lcq_id int(4) NOT NULL,
    lcq_lqu_id int(4) NOT NULL,
    lcq_cpt_id int(4) NOT NULL
);

CREATE TABLE listdrugfamilyquestion (
    ldf_id int(4) NOT NULL,
    ldf_dfy_id int(4) NOT NULL
);

CREATE TABLE listdrugfamilyquestion_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    ldf_id int(4) NOT NULL,
    ldf_lqu_id int(4) NOT NULL,
    ldf_dfy_id int(4) NOT NULL
);

CREATE TABLE listdrugsetquestion (
    ldq_id int(4) NOT NULL,
    ldq_drs_id int(4) NOT NULL
);

CREATE TABLE listdrugsetquestion_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    ldq_id int(4) NOT NULL,
    ldq_lqu_id int(4) NOT NULL,
    ldq_drs_id int(4) NOT NULL
);

CREATE TABLE listlookupquestion (
    llq_id int(4) NOT NULL
);

CREATE TABLE listlookupquestion_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    llq_id int(4) NOT NULL,
    llq_lqu_id int(4) NOT NULL,
    llq_lks_id int(4) NOT NULL
);

CREATE TABLE ListLookupQuestion_Backup_Patch702 (
    llq_id int(4) NOT NULL,
    llq_lqu_id int(4) NOT NULL,
    llq_lks_id int(4) NOT NULL
);

CREATE TABLE listmedicationquestion (
    lmq_id int(4) NOT NULL
);

CREATE TABLE listmedicationquestion_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    lmq_id int(4) NOT NULL,
    lmq_lqu_id int(4) NOT NULL,
    lmq_dmy_id int(4) NOT NULL
);

CREATE TABLE ListMedicationQuestionDuplicateMedicationRemovalBackup (
    lmq_id int(4) NOT NULL,
    lmq_lqu_id int(4) NOT NULL,
    lmq_dmy_id int(4) NOT NULL
);

CREATE TABLE ListPatient (
    lpc_id int(4) NOT NULL,
    lpc_arrival_time time(5),
    lpc_ppr_id int(4)
);

CREATE TABLE ListPatientLog (
    lpc_id int(4) NOT NULL,
    lpc_ObjectId int(4) NOT NULL,
    lpc_DateAdded datetime(8) NOT NULL,
    lpc_AddedBy uniqueidentifier(16) NOT NULL,
    lpc_Transactionid uniqueidentifier(16) NOT NULL,
    lpc_Action char(1) NOT NULL,
    lpc_pat_id uniqueidentifier(16) NOT NULL,
    lpc_plc_id int(4) NOT NULL,
    lpc_arrival_time time(5),
    lpc_ppr_id int(4)
);

CREATE TABLE listquestion (
    lqu_id int(4) NOT NULL,
    lqu_lkt_answeroptions int(4) NOT NULL,
    lqu_tooltiptext nvarchar(510),
    lqu_order int(4) NOT NULL,
    lqu_mandatory bit(1) NOT NULL,
    lqu_structural int(4),
    lqu_exclusive bit(1),
    lqu_other bit(1),
    lqu_noneoption bit(1),
    lqu_lks_id_highlight int(4),
    lqu_pullthrough bit(1),
    lqu_currenttag bit(1),
    lqu_legacy bit(1),
    lqu_membership int(4),
    lqu_lks_id_pullthrough_onresponse int(4),
    lqu_displaytype int(4) NOT NULL,
    lqu_CustomQuestionText nvarchar(510)
);

CREATE TABLE listquestion_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    lqu_id int(4) NOT NULL,
    lqu_lqs_id int(4) NOT NULL,
    lqu_lkt_answeroptions int(4) NOT NULL,
    lqu_questiontext varchar(255),
    lqu_tooltiptext varchar(255),
    lqu_order int(4) NOT NULL,
    lqu_mandatory bit(1) NOT NULL,
    lqu_structural int(4),
    lqu_exclusive bit(1),
    lqu_other bit(1),
    lqu_noneoption bit(1),
    lqu_lookupkey varchar(20),
    lqu_domain int(4),
    lqu_lks_id_highlight int(4),
    lqu_available bit(1),
    lqu_pullthrough bit(1),
    lqu_currenttag bit(1),
    lqu_legacy bit(1),
    lqu_membership int(4),
    lqu_lks_id_pullthrough_onresponse int(4),
    lqu_displaytype int(4) NOT NULL
);

CREATE TABLE listquestionalert (
    lal_id int(4) NOT NULL,
    lal_alerttext nvarchar(-1),
    lal_alertonvalue int(4)
);

CREATE TABLE listquestionalert_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    lal_id int(4) NOT NULL,
    lal_lqu_id nchar(20) NOT NULL,
    lal_alerttext varchar(-1) NOT NULL,
    lal_order int(4) NOT NULL,
    lal_alertonvalue int(4)
);

CREATE TABLE listquestioncascade (
    lqc_id int(4) NOT NULL,
    lqc_cascadeonvalue int(4) NOT NULL
);

CREATE TABLE listquestioncascade_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    lqc_id int(4) NOT NULL,
    lqc_lqu_parent int(4) NOT NULL,
    lqc_lqu_child int(4) NOT NULL,
    lqc_cascadeonvalue int(4) NOT NULL
);

CREATE TABLE listquestionconceptmapping (
    lcm_id int(4) NOT NULL,
    lcm_mappingtype int(4) NOT NULL,
    lcm_lqs_id int(4) NOT NULL,
    lcm_lqu_id int(4) NOT NULL,
    lcm_cpt_id int(4),
    lcm_cfd_id int(4),
    lcm_pro_id int(4),
    lcm_customrule int(4),
    lcm_excludeifindication bit(1)
);

CREATE TABLE listquestionlog (
    lqu_ObjectId int(4) NOT NULL,
    lqu_id int(4) NOT NULL,
    lqu_lqs_id int(4) NOT NULL,
    lqu_lkt_answeroptions int(4) NOT NULL,
    lqu_questiontext nvarchar(510),
    lqu_tooltiptext nvarchar(510),
    lqu_order int(4) NOT NULL,
    lqu_mandatory bit(1) NOT NULL,
    lqu_structural int(4),
    lqu_exclusive bit(1),
    lqu_other bit(1),
    lqu_noneoption bit(1),
    lqu_lookupkey varchar(20),
    lqu_domain int(4),
    lqu_lks_id_highlight int(4),
    lqu_available bit(1),
    lqu_pullthrough bit(1),
    lqu_currenttag bit(1),
    lqu_legacy bit(1),
    lqu_membership int(4),
    lqu_lks_id_pullthrough_onresponse int(4),
    lqu_displaytype int(4) NOT NULL,
    lqu_DateAdded datetime(8) NOT NULL,
    lqu_AddedBy uniqueidentifier(16) NOT NULL,
    lqu_TransactionId uniqueidentifier(16) NOT NULL,
    lqu_Action char(1) NOT NULL,
    lqu_unique_identifier uniqueidentifier(16),
    lqu_CustomQuestionText nvarchar(510)
);

CREATE TABLE ListQuestionMasterList (
    lqu_id int(4) NOT NULL,
    lqu_lkt_answeroptions int(4) NOT NULL,
    lqu_tooltiptext nvarchar(510),
    lqu_order int(4) NOT NULL,
    lqu_mandatory bit(1) NOT NULL,
    lqu_structural int(4),
    lqu_exclusive bit(1),
    lqu_other bit(1),
    lqu_noneoption bit(1),
    lqu_lookupkey varchar(20),
    lqu_domain int(4),
    lqu_lks_id_highlight int(4),
    lqu_available bit(1),
    lqu_pullthrough bit(1),
    lqu_currenttag bit(1),
    lqu_legacy bit(1),
    lqu_membership int(4),
    lqu_lks_id_pullthrough_onresponse int(4),
    lqu_displaytype int(4)
);

CREATE TABLE listquestionset (
    lqs_id int(4) NOT NULL,
    lqs_bilateral bit(1) NOT NULL,
    lqs_title nvarchar(400),
    lqs_lookupkey nvarchar(20),
    lqs_questiondomains int(4),
    lqs_bsm_id int(4),
    lqs_displaytype int(4),
    lqs_lkc_id int(4),
    lqs_CanAddItemsInWebUi bit(1) NOT NULL,
    lqs_AvailableInWebUi bit(1) NOT NULL
);

CREATE TABLE listresponse (
    lrp_id int(4) NOT NULL,
    lrp_responsevalue int(4) NOT NULL,
    lrp_questiontext nvarchar(510),
    lrp_answertext nvarchar(510),
    lrp_key varchar(50),
    lrp_isdeleted bit(1) NOT NULL,
    lrp_answernumber float(8),
    lrp_parsedtext nvarchar(-1),
    lrp_freetext nvarchar(-1)
);

CREATE TABLE listresponse_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    lrp_id int(4) NOT NULL,
    lrp_lqu_id int(4) NOT NULL,
    lrp_lac_id int(4),
    lrp_bod_id int(4) NOT NULL,
    lrp_responsevalue int(4) NOT NULL,
    lrp_questiontext varchar(255) NOT NULL,
    lrp_answertext varchar(255) NOT NULL,
    lrp_key varchar(50),
    lrp_isdeleted bit(1) NOT NULL,
    lrp_answernumber float(8),
    lrp_parsedtext nvarchar(-1)
);

CREATE TABLE listresponselog (
    lrp_ObjectId int(4) NOT NULL,
    lrp_id int(4) NOT NULL,
    lrp_lqu_id int(4) NOT NULL,
    lrp_lac_id int(4),
    lrp_bod_id int(4) NOT NULL,
    lrp_responsevalue int(4) NOT NULL,
    lrp_questiontext nvarchar(510),
    lrp_answertext nvarchar(510),
    lrp_key varchar(50),
    lrp_isdeleted bit(1) NOT NULL,
    lrp_DateAdded datetime(8) NOT NULL,
    lrp_AddedBy uniqueidentifier(16) NOT NULL,
    lrp_TransactionId uniqueidentifier(16) NOT NULL,
    lrp_Action char(1) NOT NULL,
    lrp_parsedtext nvarchar(-1),
    lrp_answernumber float(8),
    lrp_freetext nvarchar(-1)
);

CREATE TABLE LocalAnaestheticRoute (
    lar_Id int(4) NOT NULL,
    lar_Description nvarchar(60) NOT NULL
);

CREATE TABLE location (
    loc_id uniqueidentifier(16) NOT NULL,
    loc_sit_id uniqueidentifier(16) NOT NULL,
    loc_desc nvarchar(510),
    loc_order int(4) NOT NULL,
    loc_available bit(1) NOT NULL,
    loc_flag int(4)
);

CREATE TABLE LocationFrom (
    Id int(4) NOT NULL
);

CREATE TABLE LocationGUID (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE locationlog (
    loc_ObjectId uniqueidentifier(16) NOT NULL,
    loc_id int(4) NOT NULL,
    loc_sit_id uniqueidentifier(16) NOT NULL,
    loc_desc nvarchar(510),
    loc_order int(4) NOT NULL,
    loc_available bit(1) NOT NULL,
    loc_flag int(4),
    loc_DateAdded datetime(8) NOT NULL,
    loc_AddedBy uniqueidentifier(16) NOT NULL,
    loc_TransactionId uniqueidentifier(16) NOT NULL,
    loc_Action char(1) NOT NULL
);

CREATE TABLE locationstolocationtype (
    location_id uniqueidentifier(16) NOT NULL,
    locationtype_id int(4) NOT NULL
);

CREATE TABLE locationtype (
    lot_id int(4) NOT NULL,
    lot_desc nvarchar(510),
    lot_code varchar(4),
    lot_flag int(4),
    lot_defaultvisittype int(4) NOT NULL
);

CREATE TABLE Lookup (
    csl_Id int(4) NOT NULL,
    csl_Description nvarchar(60) NOT NULL
);

CREATE TABLE lookupcacheresult (
    lcr_id int(4) NOT NULL,
    lcr_guid uniqueidentifier(16) NOT NULL,
    lcr_lkt_id int(4) NOT NULL,
    lcr_cache_type_id int(4) NOT NULL
);

CREATE TABLE lookupcategory (
    lkc_id int(4) NOT NULL,
    lkc_desc nvarchar(100),
    lkc_image tinyint(1)
);

CREATE TABLE lookupcategorylog (
    lkc_ObjectId int(4) NOT NULL,
    lkc_id int(4) NOT NULL,
    lkc_desc nvarchar(100),
    lkc_image tinyint(1),
    lkc_DateAdded datetime(8) NOT NULL,
    lkc_AddedBy uniqueidentifier(16) NOT NULL,
    lkc_TransactionId uniqueidentifier(16) NOT NULL,
    lkc_Action char(1) NOT NULL
);

CREATE TABLE lookupdata (
    lks_id int(4) NOT NULL,
    lks_desclong nvarchar(2000),
    lks_descextra nvarchar(510),
    lks_number1 int(4),
    lks_number2 int(4),
    lks_number3 int(4),
    lks_number4 int(4),
    lks_number5 int(4),
    lks_float float(8),
    lks_order int(4) NOT NULL,
    lks_available bit(1),
    lks_fixed int(4),
    lks_interfacelookup1 nvarchar(100),
    lks_interfacelookup2 nvarchar(100),
    lks_interfacelookup3 varchar(50),
    lks_membershipnumber int(4),
    lks_cpt_id int(4),
    lks_mophth_rft_id uniqueidentifier(16),
    lks_showonwebui bit(1) NOT NULL
);

CREATE TABLE LookupData_Backup_Patch702 (
    lks_id int(4) NOT NULL,
    lks_code varchar(255) NOT NULL,
    lks_descshort varchar(255) NOT NULL,
    lks_desclong varchar(1000),
    lks_descextra varchar(255),
    lks_number1 int(4),
    lks_number2 int(4),
    lks_number3 int(4),
    lks_number4 int(4),
    lks_number5 int(4),
    lks_float float(8),
    lks_order int(4) NOT NULL,
    lks_available bit(1),
    lks_lkt_id int(4) NOT NULL,
    lks_fixed int(4),
    lks_interfacelookup1 int(4),
    lks_interfacelookup2 int(4),
    lks_interfacelookup3 varchar(50),
    lks_membershipnumber int(4),
    lks_cpt_id int(4),
    lks_guid uniqueidentifier(16),
    lks_mophth_rft_id uniqueidentifier(16),
    lks_lastupdated datetime(8) NOT NULL
);

CREATE TABLE LookupData_Backup_Patch727 (
    lqu_id int(4) NOT NULL,
    lqu_lqs_id int(4) NOT NULL,
    lqu_lkt_answeroptions int(4) NOT NULL,
    lqu_questiontext nvarchar(510),
    lqu_tooltiptext nvarchar(510),
    lqu_order int(4) NOT NULL,
    lqu_mandatory bit(1) NOT NULL,
    lqu_structural int(4),
    lqu_exclusive bit(1),
    lqu_other bit(1),
    lqu_noneoption bit(1),
    lqu_lookupkey varchar(20),
    lqu_domain int(4),
    lqu_lks_id_highlight int(4),
    lqu_available bit(1),
    lqu_pullthrough bit(1),
    lqu_currenttag bit(1),
    lqu_legacy bit(1),
    lqu_membership int(4),
    lqu_lks_id_pullthrough_onresponse int(4),
    lqu_displaytype int(4) NOT NULL,
    lqu_unique_identifier uniqueidentifier(16)
);

CREATE TABLE LookUpDataActivity (
    lda_id int(4) NOT NULL
);

CREATE TABLE LookUpDataActivityLog (
    lda_ObjectId int(4) NOT NULL,
    lda_id int(4) NOT NULL,
    lda_act_id uniqueidentifier(16) NOT NULL,
    lda_lkt_id int(4) NOT NULL,
    lda_lks_id int(4) NOT NULL,
    lda_DateAdded datetime(8) NOT NULL,
    lda_AddedBy uniqueidentifier(16) NOT NULL,
    lda_TransactionId uniqueidentifier(16) NOT NULL,
    lda_Action char(1) NOT NULL
);

CREATE TABLE lookupdatacodemap (
    lkp_id int(4) NOT NULL,
    lkp_lks_id int(4) NOT NULL,
    lkp_active bit(1) NOT NULL
);

CREATE TABLE lookupdataextension (
    lkx_id int(4) NOT NULL,
    lkx_lxt_id int(4),
    lkx_valuefloat float(8),
    lkx_valuetext varchar(255),
    lkx_lkt_id_list int(4)
);

CREATE TABLE lookupdataextensiontype (
    lxt_id int(4) NOT NULL,
    lxt_descshort nvarchar(510),
    lxt_extensiontype int(4),
    lxt_lkt_id_owner int(4),
    lxt_lkt_id_member int(4),
    lxt_lks_DefaultOptionId int(4),
    lxt_IsOptional bit(1) NOT NULL,
    lxt_IsSettingExtensionType bit(1) NOT NULL
);

CREATE TABLE lookupdatalog (
    lks_ObjectId int(4) NOT NULL,
    lks_id int(4) NOT NULL,
    lks_code varchar(255) NOT NULL,
    lks_descshort nvarchar(510),
    lks_desclong nvarchar(2000),
    lks_descextra nvarchar(510),
    lks_number1 int(4),
    lks_number2 int(4),
    lks_number3 int(4),
    lks_number4 int(4),
    lks_number5 int(4),
    lks_float float(8),
    lks_order int(4) NOT NULL,
    lks_available bit(1),
    lks_lkt_id int(4) NOT NULL,
    lks_fixed int(4),
    lks_interfacelookup1 nvarchar(100),
    lks_interfacelookup2 nvarchar(100),
    lks_interfacelookup3 varchar(50),
    lks_membershipnumber int(4),
    lks_cpt_id int(4),
    lks_guid uniqueidentifier(16),
    lks_mophth_rft_id uniqueidentifier(16),
    lks_lastupdated datetime(8) NOT NULL,
    lks_DateAdded datetime(8) NOT NULL,
    lks_AddedBy uniqueidentifier(16) NOT NULL,
    lks_TransactionId uniqueidentifier(16) NOT NULL,
    lks_Action char(1) NOT NULL,
    lks_showonwebui bit(1)
);

CREATE TABLE lookupdatamembership (
    lkm_id int(4) NOT NULL
);

CREATE TABLE lookupdatamembershipitem (
    lki_id int(4) NOT NULL,
    lki_lkm_id int(4),
    lki_membershipnumber int(4),
    lki_membershipdesc varchar(50)
);

CREATE TABLE lookupdatamembershipitemlog (
    lki_ObjectId int(4) NOT NULL,
    lki_id int(4) NOT NULL,
    lki_lkm_id int(4),
    lki_membershipnumber int(4),
    lki_membershipdesc varchar(50),
    lki_DateAdded datetime(8) NOT NULL,
    lki_AddedBy uniqueidentifier(16) NOT NULL,
    lki_TransactionId uniqueidentifier(16) NOT NULL,
    lki_Action char(1) NOT NULL
);

CREATE TABLE lookupdatamigrationtemp (
    lks_id int(4) NOT NULL,
    lks_code varchar(255) NOT NULL,
    lks_descshort varchar(255) NOT NULL,
    lks_desclong varchar(1000),
    lks_descextra varchar(255),
    lks_number1 int(4),
    lks_number2 int(4),
    lks_number3 int(4),
    lks_number4 int(4),
    lks_number5 int(4),
    lks_float float(8),
    lks_order int(4) NOT NULL,
    lks_available bit(1),
    lks_lkt_id int(4) NOT NULL,
    lks_fixed int(4),
    lks_interfacelookup1 int(4),
    lks_interfacelookup2 int(4),
    lks_interfacelookup3 varchar(50),
    lks_membershipnumber int(4),
    lks_cpt_id int(4),
    lks_guid uniqueidentifier(16)
);

CREATE TABLE LookupDataResponse (
    ActivityId uniqueidentifier(16) NOT NULL,
    LookupDataId int(4) NOT NULL,
    LookupTypeId int(4) NOT NULL
);

CREATE TABLE LookupDataResponseLog (
    Id int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    LookupDataId int(4) NOT NULL,
    LookupTypeId int(4) NOT NULL
);

CREATE TABLE LookUps (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE lookuptype (
    lkt_id int(4) NOT NULL,
    lkt_desc nvarchar(510),
    lkt_order int(4) NOT NULL,
    lkt_available bit(1) NOT NULL,
    lkt_category_no int(4),
    lkt_notavailable_reason varchar(255),
    lkt_CanAddItemsInWebUi bit(1) NOT NULL,
    lkt_HintText nvarchar(2000),
    lkt_AvailableInWebUi bit(1) NOT NULL,
    lkt_OrderAlphabetically bit(1) NOT NULL,
    lkt_CanEditDescriptionInWebUi bit(1) NOT NULL
);

CREATE TABLE LTMedications (
    sdm_SurgeonDefaultId int(4) NOT NULL,
    sdm_lks_id int(4) NOT NULL,
    sdm_dro_id int(4) NOT NULL,
    sdm_mcn_id int(4) NOT NULL
);

CREATE TABLE LTMedicationsLog (
    sdm_SurgeonDefaultId int(4) NOT NULL,
    sdm_ObjectId int(4) NOT NULL,
    sdm_DateAdded datetime(8) NOT NULL,
    sdm_AddedBy uniqueidentifier(16) NOT NULL,
    sdm_Transactionid uniqueidentifier(16) NOT NULL,
    sdm_Action char(1) NOT NULL,
    sdm_lks_id int(4),
    sdm_dro_id int(4),
    sdm_mcn_id int(4)
);

CREATE TABLE malepatients (
    pdm_id int(4) NOT NULL,
    pdm_gender nvarchar(510),
    pdm_lastupdated datetime(8)
);

CREATE TABLE managedlistactivity (
    mla_id int(4) NOT NULL,
    mla_mli_id int(4) NOT NULL,
    mla_ety_id int(4) NOT NULL,
    mla_aty_id int(4) NOT NULL
);

CREATE TABLE managedlists (
    mli_id int(4) NOT NULL,
    mli_name varchar(255),
    mli_bod_id int(4) NOT NULL
);

CREATE TABLE MandatoryGradingFeature (
    mdt_Id int(4) NOT NULL,
    mdt_ftr_FeatureId int(4) NOT NULL,
    mdt_grd_GradingId int(4) NOT NULL,
    mdt_rnk_GradingRankId int(4)
);

CREATE TABLE MandatoryGradingFeatureExclusion (
    exc_Id int(4) NOT NULL,
    exc_GroupingId int(4) NOT NULL,
    exc_ftr_ExcludingCriteriaFeatureId int(4) NOT NULL,
    exc_flk_ExcludingCriteriaFeatureLookupId int(4)
);

CREATE TABLE MappingType (
    bmt_id int(4) NOT NULL,
    bmt_description nvarchar(510)
);

CREATE TABLE MaritalStatus (
    ssm_pss_id int(4) NOT NULL,
    ssm_lks_marital_status int(4) NOT NULL,
    ssm_comments nvarchar(-1)
);

CREATE TABLE Measurement (
    Id int(4) NOT NULL,
    Name nvarchar(200) NOT NULL
);

CREATE TABLE MeasurementUnit (
    Id int(4) NOT NULL,
    MeasurementUnitName nvarchar(20) NOT NULL
);

CREATE TABLE MedicalReadingActivityLink (
    mra_id int(4) NOT NULL
);

CREATE TABLE MedicalReadingActivityLinkLog (
    mra_id int(4) NOT NULL,
    mra_ObjectId int(4) NOT NULL,
    mra_DateAdded datetime(8) NOT NULL,
    mra_AddedBy uniqueidentifier(16) NOT NULL,
    mra_Transactionid uniqueidentifier(16) NOT NULL,
    mra_Action char(1) NOT NULL,
    mra_act_id uniqueidentifier(16) NOT NULL,
    mra_mlk_id int(4) NOT NULL
);

CREATE TABLE medicalreadings (
    mlk_id int(4) NOT NULL,
    mlk_med_id int(4),
    mlk_value float(8),
    mlk_time time(5),
    mlk_measure int(4)
);

CREATE TABLE medicalreadingslog (
    mlk_ObjectId int(4) NOT NULL,
    mlk_id int(4) NOT NULL,
    mlk_med_id int(4),
    mlk_value float(8),
    mlk_time time(5),
    mlk_measure int(4),
    mlk_DateAdded datetime(8) NOT NULL,
    mlk_AddedBy uniqueidentifier(16) NOT NULL,
    mlk_TransactionId uniqueidentifier(16) NOT NULL,
    mlk_Action char(1) NOT NULL
);

CREATE TABLE medicalreadingtype (
    med_id int(4) NOT NULL,
    med_code varchar(255) NOT NULL,
    med_desc varchar(255) NOT NULL,
    med_warn_min float(8),
    med_warn_max float(8),
    med_unit varchar(8),
    med_id_guid uniqueidentifier(16) NOT NULL
);

CREATE TABLE MedicationDataSource (
    mdd_id int(4) NOT NULL,
    mdd_description nvarchar(4000)
);

CREATE TABLE medicationelements (
    mcn_id int(4) NOT NULL,
    mcn_context int(4)
);

CREATE TABLE MedicationElementsDuplicate (
    med_id int(4) NOT NULL,
    med_mcn_id_duplicate int(4),
    med_mcn_key_duplicate nvarchar(8000),
    med_mcn_id_master int(4),
    med_mcn_key_master nvarchar(8000),
    med_PatchVersion varchar(256),
    med_pns_PatchInstallationId int(4)
);

CREATE TABLE MedicationElementsDuplicateMedicationRemovalBackup (
    mcn_id int(4) NOT NULL,
    mcn_dmy_id int(4),
    mcn_dbr_id int(4),
    mcn_dvp_id int(4),
    mcn_dap_id int(4),
    mcn_context int(4),
    mcn_key varchar(255),
    mcn_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE MedicationElementsVersionDuplicate (
    Id int(4) NOT NULL,
    MedicationElementIdDuplicate int(4),
    MedicationElementKeyDuplicate nvarchar(8000),
    MedicationElementIdMaster int(4),
    MedicationElementKeyMaster nvarchar(8000),
    PackageVersion int(4)
);

CREATE TABLE MedisoftIdMigration (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE medisoftmigrationlog (
    mml_id int(4) NOT NULL,
    mml_procedure varchar(255),
    mml_type varchar(255),
    mml_tablesfrom varchar(255),
    mml_rowsfrom int(4),
    mml_tablesto varchar(255),
    mml_rowsto int(4),
    mml_log varchar(-1),
    mml_timestamp datetime(8),
    mml_hostname varchar(255),
    mml_username varchar(255)
);

CREATE TABLE MedisoftMigrationType (
    MedisoftMigrationTypeId int(4) NOT NULL,
    SourceObjectName varchar(256) NOT NULL,
    Description varchar(255),
    IsStaticEnum bit(1) NOT NULL,
    SourceObjectId int(4),
    DestinationObjectName varchar(256),
    DestinationObjectId int(4)
);

CREATE TABLE medisoftscriptstore (
    scriptclause varchar(-1) NOT NULL
);

CREATE TABLE medisoftsequentialguidstore (
    sgs_sequentialguid uniqueidentifier(16) NOT NULL
);

CREATE TABLE MedisoftStaticID (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4) NOT NULL
);

CREATE TABLE medisoftsupportencounteraudit (
    sea_ect_id uniqueidentifier(16) NOT NULL,
    sea_ety_id int(4) NOT NULL,
    sea_datestored datetime(8) NOT NULL,
    sea_pat_id uniqueidentifier(16) NOT NULL,
    sea_actiontype_id int(4) NOT NULL,
    sea_ticketId int(4) NOT NULL,
    sea_reason varchar(-1) NOT NULL
);

CREATE TABLE medisoftsupportstaff (
    mss_id uniqueidentifier(16) NOT NULL,
    mss_name varchar(255),
    mss_active bit(1)
);

CREATE TABLE medisoftupdatetoken (
    tok_id uniqueidentifier(16) NOT NULL,
    tok_tablename varchar(255) NOT NULL,
    tok_mss_id uniqueidentifier(16) NOT NULL,
    tok_supportreason varchar(-1) NOT NULL,
    tok_datetaken datetime(8) NOT NULL,
    tok_expired bit(1) NOT NULL
);

CREATE TABLE MergedEncounterHistory (
    Id int(4) NOT NULL,
    PreviousEncounterId uniqueidentifier(16) NOT NULL,
    NewEncounterId uniqueidentifier(16) NOT NULL
);

CREATE TABLE MergeField (
    smf_id int(4) NOT NULL,
    smf_name nvarchar(200) NOT NULL,
    smf_available bit(1) NOT NULL,
    smf_DocumentComponentDescription nvarchar(-1) NOT NULL,
    smf_FullFriendlyName nvarchar(-1)
);

CREATE TABLE MergeFieldGroup (
    smg_id int(4) NOT NULL
);

CREATE TABLE Message (
    mes_act_ActivityId uniqueidentifier(16) NOT NULL,
    bmg_Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    clm_Id int(4) NOT NULL,
    clm_mgn_ChainId int(4) NOT NULL,
    pcm_act_id uniqueidentifier(16) NOT NULL,
    mes_Content nvarchar(8000) NOT NULL,
    mes_met_MessageDestinationId int(4) NOT NULL,
    pcm_content nvarchar(5000),
    bmg_bms_MessageStateId int(4) NOT NULL,
    clm_MessageType varchar(5) NOT NULL,
    clm_TriggerEvent varchar(5) NOT NULL,
    bmg_DateCreated datetime2(6) NOT NULL,
    OutputLocation nvarchar(2000),
    mes_mdt_MessageSourceId int(4) NOT NULL,
    DateCreated datetime2(6) NOT NULL,
    bmg_OutputLocation nvarchar(2000),
    bmg_MessageContent varbinary(-1),
    MessageContent varbinary(-1),
    ErrorReason nvarchar(2000),
    bmg_ErrorReason nvarchar(2000),
    clm_ErrorReason varchar(255),
    clm_MessageVersion varchar(255),
    clm_ctt_TaskTypeId int(4) NOT NULL,
    clm_MessageDateTime datetime(8),
    clm_MessageReceivedDateTime datetime(8),
    clm_SuccessfullyProcessed bit(1) NOT NULL,
    clm_SuccessfullyResolved bit(1),
    clm_MessageControlId varchar(20),
    clm_ExcludeFromReprocessing bit(1) NOT NULL
);

CREATE TABLE MessageAppointment (
    msa_Id int(4) NOT NULL,
    msa_AppointmentTime datetime(8),
    msa_AppointmentArrivalTime datetime(8),
    msa_ResourceName nvarchar(510),
    msa_ClinicCode nvarchar(510),
    msa_LocationName nvarchar(510),
    msa_AppointmentType nvarchar(510),
    msa_New bit(1),
    msa_FollowUp bit(1),
    msa_SiteIdentifier nvarchar(510)
);

CREATE TABLE MessageAppointmentIdentifier (
    mid_id int(4) NOT NULL,
    mid_value nvarchar(40),
    mid_TypeOther nvarchar(100)
);

CREATE TABLE MessageChain (
    mgn_Id int(4) NOT NULL,
    mgn_TemporaryIdentifier varchar(255),
    mgn_IsArchived bit(1) NOT NULL
);

CREATE TABLE MessageCharge (
    bmc_Id int(4) NOT NULL,
    bmc_cat_ActionTypeId int(4) NOT NULL
);

CREATE TABLE MessageChargeActionType (
    cat_Id int(4) NOT NULL
);

CREATE TABLE MessageChargeLog (
    bmc_Id int(4) NOT NULL,
    bmc_ObjectId int(4) NOT NULL,
    bmc_DateAdded datetime(8) NOT NULL,
    bmc_AddedBy uniqueidentifier(16) NOT NULL,
    bmc_Transactionid uniqueidentifier(16) NOT NULL,
    bmc_Action char(1) NOT NULL,
    bmc_bsc_StagingChargeId int(4) NOT NULL,
    bmc_bmg_MessageId int(4) NOT NULL,
    bmc_cat_ActionTypeId int(4)
);

CREATE TABLE MessageDestination (
    met_Id int(4) NOT NULL,
    met_Description nvarchar(500) NOT NULL
);

CREATE TABLE MessageEncounter (
    bme_Id int(4) NOT NULL
);

CREATE TABLE MessageEncounterLog (
    bme_Id int(4) NOT NULL,
    bme_ObjectId int(4) NOT NULL,
    bme_DateAdded datetime(8) NOT NULL,
    bme_AddedBy uniqueidentifier(16) NOT NULL,
    bme_Transactionid uniqueidentifier(16) NOT NULL,
    bme_Action char(1) NOT NULL,
    bme_bse_StagingEncounterId int(4) NOT NULL,
    bme_bmg_MessageId int(4) NOT NULL
);

CREATE TABLE MessageId (
    vfm_id int(4) NOT NULL,
    vfm_nextMessageId int(4) NOT NULL
);

CREATE TABLE MessageLog (
    pcm_act_id int(4) NOT NULL,
    bmg_Id int(4) NOT NULL,
    mes_act_ActivityId int(4) NOT NULL,
    mes_ObjectId uniqueidentifier(16) NOT NULL,
    bmg_ObjectId int(4) NOT NULL,
    pcm_ObjectId uniqueidentifier(16) NOT NULL,
    pcm_DateAdded datetime(8) NOT NULL,
    bmg_DateAdded datetime(8) NOT NULL,
    mes_DateAdded datetime(8) NOT NULL,
    mes_AddedBy uniqueidentifier(16) NOT NULL,
    bmg_AddedBy uniqueidentifier(16) NOT NULL,
    pcm_AddedBy uniqueidentifier(16) NOT NULL,
    pcm_Transactionid uniqueidentifier(16) NOT NULL,
    bmg_Transactionid uniqueidentifier(16) NOT NULL,
    mes_Transactionid uniqueidentifier(16) NOT NULL,
    mes_Action char(1) NOT NULL,
    bmg_Action char(1) NOT NULL,
    pcm_Action char(1) NOT NULL,
    pcm_content nvarchar(5000),
    mes_Content nvarchar(8000) NOT NULL,
    mes_met_MessageDestinationId int(4) NOT NULL,
    bmg_bms_MessageStateId int(4) NOT NULL,
    bmg_DateCreated datetime2(6) NOT NULL,
    mes_mdt_MessageSourceId int(4),
    bmg_OutputLocation nvarchar(2000),
    bmg_MessageContent varbinary(-1),
    bmg_ErrorReason nvarchar(2000),
    bmg_MessageType int(4) NOT NULL
);

CREATE TABLE MessagePatient (
    msp_Id int(4) NOT NULL,
    msp_DateOfBirth datetime(8),
    msp_Surname nvarchar(510),
    msp_GivenName nvarchar(510),
    msp_Gender varchar(255),
    msp_Title nvarchar(510),
    msp_AddressLine1 nvarchar(510),
    msp_AddressLine2 nvarchar(510),
    msp_AddressLine3 nvarchar(510),
    msp_AddressLine4 nvarchar(510),
    msp_AddressLine5 nvarchar(510),
    msp_Postcode varchar(255),
    msp_HomeNumber varchar(255),
    msp_WorkNumber varchar(255),
    msp_HospitalNumber varchar(255)
);

CREATE TABLE Messages_0 (
    PayloadId bigint(8) NOT NULL,
    Payload varbinary(-1) NOT NULL,
    InsertedOn datetime(8) NOT NULL
);

CREATE TABLE Messages_0_Id (
    PayloadId bigint(8) NOT NULL
);

CREATE TABLE MessageSource (
    mdt_Id int(4) NOT NULL,
    mdt_Description nvarchar(500) NOT NULL
);

CREATE TABLE MessageState (
    bms_Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    hms_Id int(4) NOT NULL,
    hms_Description nvarchar(200) NOT NULL,
    Description nvarchar(200) NOT NULL,
    bms_Description nvarchar(200) NOT NULL
);

CREATE TABLE MessageTaskType (
    ctt_Id int(4) NOT NULL,
    ctt_Description varchar(255) NOT NULL
);

CREATE TABLE MessageToReviewer (
    ActivityId uniqueidentifier(16) NOT NULL,
    ForUrgentReview bit(1),
    Comments nvarchar(4000)
);

CREATE TABLE MessageToReviewerLog (
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ForUrgentReview bit(1),
    Comments nvarchar(4000)
);

CREATE TABLE MessageType (
    Id int(4) NOT NULL,
    Description nvarchar(100) NOT NULL
);

CREATE TABLE Method (
    Id int(4) NOT NULL,
    Name nvarchar(200) NOT NULL
);

CREATE TABLE MethodOfRemoval (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE MicropulseDiodeLaserTrabeculoplasty (
    mld_sdf_id int(4) NOT NULL,
    mdt_ActivityId uniqueidentifier(16) NOT NULL,
    mdt_SpotSize int(4),
    mld_SpotSize int(4),
    mld_PowerOfLaser int(4),
    mdt_Variable bit(1) NOT NULL,
    mdt_MinimumPowerOfLaser int(4) NOT NULL,
    mld_Duration int(4),
    mld_DutyCycle int(4),
    mdt_MaximumPowerOfLaser int(4),
    mdt_MinimumDuration int(4) NOT NULL,
    mdt_MaximumDuration int(4),
    mdt_DutyCycle int(4),
    mdt_TotalEnergy decimal(5)
);

CREATE TABLE MicropulseDiodeLaserTrabeculoplastyLog (
    mdt_ActivityId int(4) NOT NULL,
    mld_sdf_id int(4) NOT NULL,
    mld_ObjectId int(4) NOT NULL,
    mdt_ObjectId uniqueidentifier(16) NOT NULL,
    mdt_DateAdded datetime(8) NOT NULL,
    mld_DateAdded datetime(8) NOT NULL,
    mld_AddedBy uniqueidentifier(16) NOT NULL,
    mdt_AddedBy uniqueidentifier(16) NOT NULL,
    mdt_Transactionid uniqueidentifier(16) NOT NULL,
    mld_Transactionid uniqueidentifier(16) NOT NULL,
    mld_Action char(1) NOT NULL,
    mdt_Action char(1) NOT NULL,
    mdt_SpotSize int(4),
    mld_SpotSize int(4),
    mld_PowerOfLaser int(4),
    mdt_Variable bit(1),
    mdt_MinimumPowerOfLaser int(4),
    mld_Duration int(4),
    mld_DutyCycle int(4),
    mdt_MaximumPowerOfLaser int(4),
    mdt_MinimumDuration int(4),
    mdt_MaximumDuration int(4),
    mdt_DutyCycle int(4),
    mdt_TotalEnergy decimal(5)
);

CREATE TABLE MigrationMapper (
    old_rft_id uniqueidentifier(16) NOT NULL,
    mapping varchar(255),
    description varchar(255),
    new_id int(4)
);

CREATE TABLE MigrationPatients (
    mgp_pat_id_mophth uniqueidentifier(16) NOT NULL,
    mpg_pat_id uniqueidentifier(16)
);

CREATE TABLE MigrationState (
    mgs_id int(4) NOT NULL,
    mgs_state int(4) NOT NULL,
    mgs_step int(4) NOT NULL
);

CREATE TABLE MigrationStaticEnums (
    mse_id int(4) NOT NULL,
    mse_enum_type varchar(255) NOT NULL,
    mse_enum_heading varchar(255) NOT NULL,
    mse_migrate_enum bit(1) NOT NULL,
    mse_enum_text varchar(255) NOT NULL,
    mse_enum_friendly_desc varchar(255),
    mse_enum int(4) NOT NULL,
    mse_mophth_static_id uniqueidentifier(16),
    mse_code varchar(255),
    mse_code_parent varchar(255)
);

CREATE TABLE mimetypes (
    mim_id int(4) NOT NULL,
    mim_description nvarchar(510),
    mim_name nvarchar(510),
    mim_extension nvarchar(510),
    mim_uploadsupported bit(1)
);

CREATE TABLE MinorProcedures (
    mip_id int(4) NOT NULL,
    mip_act_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE MinorProceduresItem (
    mii_id int(4) NOT NULL,
    mii_mip_id int(4) NOT NULL,
    mii_pro_id int(4) NOT NULL,
    mii_bod_id int(4) NOT NULL,
    mii_comments nvarchar(500),
    mii_deleted bit(1) NOT NULL,
    mii_pqi_id int(4)
);

CREATE TABLE MinorProceduresItemLog (
    mii_ObjectId int(4) NOT NULL,
    mii_id int(4) NOT NULL,
    mii_mip_id int(4) NOT NULL,
    mii_pro_id int(4) NOT NULL,
    mii_bod_id int(4) NOT NULL,
    mii_comments nvarchar(500),
    mii_deleted bit(1) NOT NULL,
    mii_DateAdded datetime(8) NOT NULL,
    mii_AddedBy uniqueidentifier(16) NOT NULL,
    mii_Transactionid uniqueidentifier(16) NOT NULL,
    mii_Action char(1) NOT NULL,
    mii_pqi_id int(4)
);

CREATE TABLE MinorProceduresLog (
    mip_ObjectId int(4) NOT NULL,
    mip_id int(4) NOT NULL,
    mip_act_id uniqueidentifier(16) NOT NULL,
    mip_DateAdded datetime(8) NOT NULL,
    mip_AddedBy uniqueidentifier(16) NOT NULL,
    mip_Transactionid uniqueidentifier(16) NOT NULL,
    mip_Action char(1) NOT NULL
);

CREATE TABLE Mobility (
    pmb_pss_id int(4) NOT NULL,
    pmb_mobility_problems int(4) NOT NULL,
    pmb_patient_immobile int(4) NOT NULL,
    pmb_weight_bearing int(4) NOT NULL,
    pmb_comments nvarchar(-1)
);

CREATE TABLE MobilityAids (
    pma_pss_id int(4) NOT NULL,
    pma_lqu_mobility_aid int(4) NOT NULL
);

CREATE TABLE MobilityAssistanceRequired (
    mar_pss_id int(4) NOT NULL,
    mar_lqu_assistance_required int(4) NOT NULL
);

CREATE TABLE Modality (
    hmm_Id int(4) NOT NULL,
    hmm_Name nvarchar(510) NOT NULL,
    hmm_ScheduledStation nvarchar(200) NOT NULL,
    hmm_Code nvarchar(200) NOT NULL
);

CREATE TABLE MophthDrugClassMap (
    dcm_Id int(4) NOT NULL,
    dcm_mcn_MedicationElementsId int(4) NOT NULL,
    dcm_dcl_DrugClassId int(4) NOT NULL,
    dcm_dcl_MOphthDrugId uniqueidentifier(16) NOT NULL,
    dcm_dcl_MOphthDrugClassId uniqueidentifier(16) NOT NULL
);

CREATE TABLE MophthDrugClassMapDuplicateMedicationRemovalBackup (
    dcm_Id int(4) NOT NULL,
    dcm_mcn_MedicationElementsId int(4) NOT NULL,
    dcm_dcl_DrugClassId int(4) NOT NULL,
    dcm_dcl_MOphthDrugId uniqueidentifier(16) NOT NULL,
    dcm_dcl_MOphthDrugClassId uniqueidentifier(16) NOT NULL,
    dcm_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE MuscleAdjustment (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    AdjustmentId int(4) NOT NULL,
    MuscleId int(4) NOT NULL,
    MuscleAdjustmentId int(4) NOT NULL,
    Amount float(8) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE MuscleAdjustmentLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    AdjustmentId int(4) NOT NULL,
    MuscleId int(4) NOT NULL,
    MuscleAdjustmentId int(4) NOT NULL,
    Amount float(8) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE MuscleIsolated (
    mus_SurgeonDefaultId int(4) NOT NULL,
    mus_lks_Muscle int(4) NOT NULL,
    mus_bod_id int(4) NOT NULL
);

CREATE TABLE MuscleIsolatedLog (
    mus_SurgeonDefaultId int(4) NOT NULL,
    mus_ObjectId int(4) NOT NULL,
    mus_DateAdded datetime(8) NOT NULL,
    mus_AddedBy uniqueidentifier(16) NOT NULL,
    mus_TransactionId uniqueidentifier(16) NOT NULL,
    mus_Action char(1) NOT NULL,
    mus_lks_Muscle int(4) NOT NULL,
    mus_bod_id int(4) NOT NULL
);

CREATE TABLE Muscles (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    MuscleId int(4) NOT NULL,
    Description nvarchar(1000) NOT NULL,
    Units float(8) NOT NULL,
    BotulinumToxinId int(4) NOT NULL,
    PerformedById uniqueidentifier(16),
    MusclePreviouslyOperatedOn bit(1) NOT NULL
);

CREATE TABLE MusclesIsolated (
    gmi_ActivityId uniqueidentifier(16) NOT NULL,
    gmi_lks_Muscle int(4) NOT NULL
);

CREATE TABLE MusclesIsolatedLog (
    gmi_ActivityId int(4) NOT NULL,
    gmi_ObjectId uniqueidentifier(16) NOT NULL,
    gmi_DateAdded datetime(8) NOT NULL,
    gmi_AddedBy uniqueidentifier(16) NOT NULL,
    gmi_Transactionid uniqueidentifier(16) NOT NULL,
    gmi_Action char(1) NOT NULL,
    gmi_lks_Muscle int(4)
);

CREATE TABLE MusclesLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    MuscleId int(4) NOT NULL,
    Units float(8) NOT NULL,
    BotulinumToxinId int(4) NOT NULL,
    PerformedById uniqueidentifier(16),
    MusclePreviouslyOperatedOn bit(1) NOT NULL
);

CREATE TABLE NearLine (
    Id int(4) NOT NULL,
    Description nvarchar(200) NOT NULL
);

CREATE TABLE NitriteData (
    unt_id int(4) NOT NULL,
    unt_available bit(1) NOT NULL
);

CREATE TABLE NumericGraphData (
    Id int(4) NOT NULL,
    PointsCount int(4) NOT NULL,
    NumericGraphTypeId int(4) NOT NULL,
    VisualFieldTestId int(4) NOT NULL
);

CREATE TABLE NumericGraphDataPoint (
    Id int(4) NOT NULL,
    NumericGraphDataId int(4) NOT NULL,
    Value varchar(5) NOT NULL
);

CREATE TABLE NumericGraphType (
    Id int(4) NOT NULL,
    HfaReferenceDescription nvarchar(510) NOT NULL
);

CREATE TABLE NumericResponseDecimalPlaceValue (
    nrd_id int(4) NOT NULL
);

CREATE TABLE NumericResponsePrecisionType (
    nry_Id int(4) NOT NULL,
    nry_EqualityOperator nchar(2) NOT NULL
);

CREATE TABLE NumericResponseQuestionParameters (
    nrp_qui_QuestionId int(4) NOT NULL,
    nrp_nrd_DecimalPlaces int(4) NOT NULL,
    nrp_MinValue float(8) NOT NULL,
    nrp_MaxValue float(8) NOT NULL,
    nrp_nry_NumericResponsePrecisionTypeId int(4) NOT NULL
);

CREATE TABLE NumericResponseQuestionParametersLog (
    nrp_qui_QuestionId int(4) NOT NULL,
    nrp_ObjectId int(4) NOT NULL,
    nrp_DateAdded datetime(8) NOT NULL,
    nrp_AddedBy uniqueidentifier(16) NOT NULL,
    nrp_Transactionid uniqueidentifier(16) NOT NULL,
    nrp_Action char(1) NOT NULL,
    nrp_nrd_DecimalPlaces int(4) NOT NULL,
    nrp_MinValue float(8) NOT NULL,
    nrp_MaxValue float(8) NOT NULL,
    nrp_nry_NumericResponsePrecisionTypeId int(4) NOT NULL
);

CREATE TABLE NumericResponseQuestionVersionParameters (
    nrv_quv_QuestionVersionId int(4) NOT NULL,
    nrv_nrd_DecimalPlaces int(4) NOT NULL,
    nrv_MinValue float(8) NOT NULL,
    nrv_MaxValue float(8) NOT NULL,
    nrv_nry_NumericResponsePrecisionTypeId int(4) NOT NULL
);

CREATE TABLE NumericResponseQuestionVersionParametersLog (
    nrv_quv_QuestionVersionId int(4) NOT NULL,
    nrv_ObjectId int(4) NOT NULL,
    nrv_DateAdded datetime(8) NOT NULL,
    nrv_AddedBy uniqueidentifier(16) NOT NULL,
    nrv_Transactionid uniqueidentifier(16) NOT NULL,
    nrv_Action char(1) NOT NULL,
    nrv_nrd_DecimalPlaces int(4) NOT NULL,
    nrv_MinValue float(8) NOT NULL,
    nrv_MaxValue float(8) NOT NULL,
    nrv_nry_NumericResponsePrecisionTypeId int(4) NOT NULL
);

CREATE TABLE Observation (
    pob_id int(4) NOT NULL,
    pob_Time time(5) NOT NULL,
    pob_Date date(3) NOT NULL
);

CREATE TABLE ObservationComments (
    obc_ActivityId uniqueidentifier(16) NOT NULL,
    obc_Comments nvarchar(8000)
);

CREATE TABLE ObservationCommentsLog (
    obc_ActivityId int(4) NOT NULL,
    obc_ObjectId uniqueidentifier(16) NOT NULL,
    obc_DateAdded datetime(8) NOT NULL,
    obc_AddedBy uniqueidentifier(16) NOT NULL,
    obc_Transactionid uniqueidentifier(16) NOT NULL,
    obc_Action char(1) NOT NULL,
    obc_Comments nvarchar(8000)
);

CREATE TABLE ObservationLog (
    pob_id int(4) NOT NULL,
    pob_ObjectId int(4) NOT NULL,
    pob_DateAdded datetime(8) NOT NULL,
    pob_AddedBy uniqueidentifier(16) NOT NULL,
    pob_Transactionid uniqueidentifier(16) NOT NULL,
    pob_Action char(1) NOT NULL,
    pob_act_id uniqueidentifier(16) NOT NULL,
    pob_Time time(5) NOT NULL,
    pob_Date date(3) NOT NULL
);

CREATE TABLE ObservationReading (
    pom_id int(4) NOT NULL
);

CREATE TABLE ObservationReadingLog (
    pom_id int(4) NOT NULL,
    pom_ObjectId int(4) NOT NULL,
    pom_DateAdded datetime(8) NOT NULL,
    pom_AddedBy uniqueidentifier(16) NOT NULL,
    pom_Transactionid uniqueidentifier(16) NOT NULL,
    pom_Action char(1) NOT NULL,
    pom_pob_id int(4) NOT NULL,
    pom_mlk_id int(4) NOT NULL
);

CREATE TABLE OctopusExamMethod (
    voe_Id int(4) NOT NULL,
    voe_Description nvarchar(200) NOT NULL
);

CREATE TABLE OctopusProgram (
    vop_Id int(4) NOT NULL
);

CREATE TABLE OctopusStimulusMethod (
    vom_Id int(4) NOT NULL,
    vom_Description nvarchar(200) NOT NULL
);

CREATE TABLE OctopusStrategy (
    vos_Id int(4) NOT NULL,
    vos_Description nvarchar(200) NOT NULL
);

CREATE TABLE OctopusTest (
    vfo_Id int(4) NOT NULL,
    vfo_DeviceName nvarchar(200) NOT NULL,
    vfo_DeviceSerialNumber nvarchar(200) NOT NULL,
    vfo_DeviceSoftwareVersion nvarchar(100) NOT NULL,
    vfo_DeviceModuleVersion nvarchar(100) NOT NULL,
    vfo_ExamDate datetime2(6) NOT NULL,
    vfo_bod_BodyPartId int(4) NOT NULL,
    vfo_FixationMethod nvarchar(200),
    vfo_vop_ProgramId int(4),
    vfo_ProgramCodeRaw nvarchar(20),
    vfo_StimulusSize int(4) NOT NULL,
    vfo_StimulusDuration int(4),
    vfo_vom_StimulusMethodId int(4),
    vfo_BackgroundIntensity decimal(5) NOT NULL,
    vfo_vos_StrategyId int(4),
    vfo_voe_ExamMethodId int(4),
    vfo_Stages int(4),
    vfo_TestLocations int(4),
    vfo_Questions int(4),
    vfo_Repetitions int(4),
    vfo_PositiveCatchTrials int(4),
    vfo_PositiveAnswers int(4),
    vfo_NegativeCatchTrials int(4),
    vfo_NegativeAnswers int(4),
    vfo_MeanSensitivity decimal(5),
    vfo_MeanDeviation decimal(5),
    vfo_StandardDeviation decimal(5),
    vfo_CorrectedStandardDeviation decimal(5),
    vfo_ShortTermFluctuation decimal(5),
    vfo_ReliabilityFactor decimal(5),
    vfo_RefractionSphere decimal(5),
    vfo_RefractionCylinder decimal(5),
    vfo_RefractionAxis int(4),
    vfo_VisualAcuity decimal(5),
    vfo_PupilSize decimal(5),
    vfo_IntraocularPressure decimal(5),
    vfo_ExamDurationSeconds int(4) NOT NULL,
    vfo_StimulusMethodRaw nvarchar(20),
    vfo_StrategyRaw nvarchar(20),
    vfo_ExamMethodRaw nvarchar(20),
    vfo_IsReliable bit(1) NOT NULL
);

CREATE TABLE octscan (
    oct_id int(4) NOT NULL
);

CREATE TABLE octscanetdrschart (
    etd_id int(4) NOT NULL,
    etd_averagethickness int(4),
    etd_averagevolume decimal(5),
    etd_etdrschartarea int(4) NOT NULL
);

CREATE TABLE octscanetdrschartlog (
    etd_ObjectId int(4) NOT NULL,
    etd_id int(4) NOT NULL,
    etd_oct_id int(4) NOT NULL,
    etd_averagethickness int(4),
    etd_averagevolume decimal(5),
    etd_etdrschartarea int(4) NOT NULL,
    etd_DateAdded datetime(8) NOT NULL,
    etd_AddedBy uniqueidentifier(16) NOT NULL,
    etd_TransactionId uniqueidentifier(16) NOT NULL,
    etd_Action char(1) NOT NULL
);

CREATE TABLE OctScanFixationTarget (
    oft_id int(4) NOT NULL,
    oft_description nvarchar(200) NOT NULL
);

CREATE TABLE OctScanHeyex (
    och_id int(4) NOT NULL,
    och_studyUid nvarchar(400),
    och_seriesUid nvarchar(400),
    och_progressionUid nvarchar(400),
    och_gridCenterX int(4) NOT NULL,
    och_gridCenterY int(4) NOT NULL,
    och_imageWidth int(4) NOT NULL,
    och_imageHeight int(4) NOT NULL,
    och_scaleX decimal(9),
    och_scaleY decimal(9),
    och_oft_id_fixationTarget int(4) NOT NULL,
    och_ohb_id int(4),
    och_version int(4) NOT NULL,
    och_TrackingUid nvarchar(510),
    och_ReferencedSopInstanceUid nvarchar(510),
    och_ContentDateTime datetime(8),
    och_ReferencedInstanceVersion int(4),
    och_hat_ApplicationTypeId int(4),
    och_ApplicationTypeRaw nvarchar(200),
    och_Operator nvarchar(400),
    och_ScanVersion nvarchar(400),
    och_AuthorOfChange nvarchar(400),
    och_ApsGuid uniqueidentifier(16)
);

CREATE TABLE OctScanHeyexBscan (
    ohb_id int(4) NOT NULL,
    ohb_och_id int(4),
    ohb_blb_ImageBinary uniqueidentifier(16)
);

CREATE TABLE OctScanHeyexBscanLog (
    ohb_ObjectId int(4) NOT NULL,
    ohb_id int(4) NOT NULL,
    ohb_och_id int(4),
    ohb_blb_ImageBinary uniqueidentifier(16),
    ohb_DateAdded datetime(8) NOT NULL,
    ohb_AddedBy uniqueidentifier(16) NOT NULL,
    ohb_Transactionid uniqueidentifier(16) NOT NULL,
    ohb_Action char(1) NOT NULL
);

CREATE TABLE OctScanHeyexLog (
    och_ObjectId int(4) NOT NULL,
    och_id int(4) NOT NULL,
    och_oct_id int(4) NOT NULL,
    och_studyUid nvarchar(400),
    och_seriesUid nvarchar(400),
    och_progressionUid nvarchar(400),
    och_gridCenterX int(4) NOT NULL,
    och_gridCenterY int(4) NOT NULL,
    och_imageWidth int(4) NOT NULL,
    och_imageHeight int(4) NOT NULL,
    och_scaleX decimal(9),
    och_scaleY decimal(9),
    och_DateAdded datetime(8) NOT NULL,
    och_AddedBy uniqueidentifier(16) NOT NULL,
    och_Transactionid uniqueidentifier(16) NOT NULL,
    och_Action char(1) NOT NULL,
    och_oft_id_fixationTarget int(4) NOT NULL,
    och_ohb_id int(4),
    och_version int(4),
    och_TrackingUid nvarchar(510),
    och_ReferencedSopInstanceUid nvarchar(510),
    och_ContentDateTime datetime(8),
    och_ReferencedInstanceVersion int(4),
    och_hat_ApplicationTypeId int(4),
    och_ApplicationTypeRaw nvarchar(200),
    och_Operator nvarchar(400),
    och_ScanVersion nvarchar(400),
    och_AuthorOfChange nvarchar(400),
    och_ApsGuid uniqueidentifier(16)
);

CREATE TABLE octscanlog (
    oct_ObjectId int(4) NOT NULL,
    oct_id int(4) NOT NULL,
    oct_act_id uniqueidentifier(16) NOT NULL,
    oct_bod_id int(4) NOT NULL,
    oct_lks_id_octmachine int(4) NOT NULL,
    oct_centralpointfovealthickness int(4),
    oct_macularvolume decimal(5),
    oct_DateAdded datetime(8) NOT NULL,
    oct_AddedBy uniqueidentifier(16) NOT NULL,
    oct_TransactionId uniqueidentifier(16) NOT NULL,
    oct_Action char(1) NOT NULL,
    oct_include bit(1) NOT NULL,
    oct_marker int(4),
    oct_centralmin int(4),
    oct_centralmax int(4),
    oct_signalstrength int(4)
);

CREATE TABLE OperAnaeTechniqueMapping (
    MedisoftSourceID uniqueidentifier(16),
    MedisoftSourceDesc varchar(255),
    MediSIGHTDestDesc varchar(255),
    MediSIGHTDestId int(4),
    DrugApplicationType varchar(255),
    ant_id int(4)
);

CREATE TABLE operation (
    ope_id int(4) NOT NULL
);

CREATE TABLE Operation (
    opo_ActivityId uniqueidentifier(16) NOT NULL,
    opo_SelectedOperationEncounterId uniqueidentifier(16)
);

CREATE TABLE operation (
    ope_act_id uniqueidentifier(16),
    ope_admissiontype int(4)
);

CREATE TABLE Operation (
    opo_SelectedOther nvarchar(1000),
    opo_LocalAnaesthetic bit(1)
);

CREATE TABLE operation (
    ope_datelisted datetime(8),
    ope_flag bit(1)
);

CREATE TABLE Operation (
    opo_GeneralAnaesthetic bit(1),
    opo_HasSedation bit(1)
);

CREATE TABLE operation (
    ope_ptr_id_gp uniqueidentifier(16),
    ope_lks_id_operationstatus int(4)
);

CREATE TABLE Operation (
    opo_SelectedOperationDescription nvarchar(4000),
    opo_HasSedationPulledFromOperation bit(1),
    opo_HasLeftProcedure bit(1),
    opo_HasRightProcedure bit(1)
);

CREATE TABLE operationanaesthesia (
    oan_id int(4) NOT NULL
);

CREATE TABLE OperationAnaesthesia (
    opa_id int(4) NOT NULL,
    opa_AnaesthesiaType int(4) NOT NULL,
    opa_bod_id int(4),
    opa_RouteDescription nvarchar(510),
    opa_DrugDescription nvarchar(510)
);

CREATE TABLE OperationAnaesthesiaLog (
    opa_id int(4) NOT NULL
);

CREATE TABLE operationanaesthesialog (
    oan_ObjectId int(4) NOT NULL,
    oan_id int(4) NOT NULL
);

CREATE TABLE OperationAnaesthesiaLog (
    opa_ObjectId int(4) NOT NULL,
    opa_DateAdded datetime(8) NOT NULL
);

CREATE TABLE operationanaesthesialog (
    oan_act_id uniqueidentifier(16) NOT NULL,
    oan_bod_id int(4) NOT NULL
);

CREATE TABLE OperationAnaesthesiaLog (
    opa_AddedBy uniqueidentifier(16) NOT NULL,
    opa_TransactionId uniqueidentifier(16) NOT NULL
);

CREATE TABLE operationanaesthesialog (
    oan_lks_id_blockmobility int(4),
    oan_lks_id_blockocularpressure int(4)
);

CREATE TABLE OperationAnaesthesiaLog (
    opa_Action char(1) NOT NULL,
    opa_AnaesthesiaType int(4) NOT NULL
);

CREATE TABLE operationanaesthesialog (
    oan_hyalase bit(1),
    oan_generalanaesthesia bit(1)
);

CREATE TABLE OperationAnaesthesiaLog (
    opa_opo_id uniqueidentifier(16) NOT NULL,
    opa_bod_id int(4)
);

CREATE TABLE operationanaesthesialog (
    oan_DateAdded datetime(8) NOT NULL,
    oan_AddedBy uniqueidentifier(16) NOT NULL
);

CREATE TABLE OperationAnaesthesiaLog (
    opa_RouteDescription nvarchar(510),
    opa_DrugDescription nvarchar(510)
);

CREATE TABLE operationanaesthesialog (
    oan_TransactionId uniqueidentifier(16) NOT NULL,
    oan_Action char(1) NOT NULL,
    oan_deleted bit(1),
    oan_hassedation bit(1)
);

CREATE TABLE operationcategory (
    oct_id int(4) NOT NULL,
    oct_code varchar(10),
    oct_description nvarchar(510),
    oct_order int(4) NOT NULL,
    oct_membership int(4),
    oct_status int(4) NOT NULL,
    oct_hsv_id int(4)
);

CREATE TABLE operationindication (
    eid_id int(4) NOT NULL
);

CREATE TABLE operationindicationlog (
    eid_ObjectId int(4) NOT NULL,
    eid_id int(4) NOT NULL,
    eid_act_id uniqueidentifier(16),
    eid_bod_id int(4),
    eid_cpt_id int(4),
    eid_DateAdded datetime(8) NOT NULL,
    eid_AddedBy uniqueidentifier(16) NOT NULL,
    eid_TransactionId uniqueidentifier(16) NOT NULL,
    eid_Action char(1) NOT NULL
);

CREATE TABLE OperationLog (
    opo_ActivityId int(4) NOT NULL,
    opo_ObjectId uniqueidentifier(16) NOT NULL,
    opo_DateAdded datetime(8) NOT NULL,
    opo_AddedBy uniqueidentifier(16) NOT NULL,
    opo_TransactionId uniqueidentifier(16) NOT NULL,
    opo_Action char(1) NOT NULL,
    opo_SelectedOperationEncounterId uniqueidentifier(16),
    opo_SelectedOther nvarchar(1000),
    opo_LocalAnaesthetic bit(1),
    opo_GeneralAnaesthetic bit(1),
    opo_HasSedation bit(1),
    opo_SelectedOperationDescription nvarchar(4000),
    opo_HasSedationPulledFromOperation bit(1),
    opo_HasLeftProcedure bit(1),
    opo_HasRightProcedure bit(1)
);

CREATE TABLE operationprocedure (
    prl_id int(4) NOT NULL,
    prl_OrderAddedToEncounter int(4)
);

CREATE TABLE operationprocedurelog (
    prl_ObjectId int(4) NOT NULL,
    prl_id int(4) NOT NULL,
    prl_act_id uniqueidentifier(16) NOT NULL,
    prl_pro_id int(4) NOT NULL,
    prl_bod_id int(4) NOT NULL,
    prl_narative nvarchar(510),
    prl_additionalprocedure bit(1),
    prl_DateAdded datetime(8) NOT NULL,
    prl_AddedBy uniqueidentifier(16) NOT NULL,
    prl_TransactionId uniqueidentifier(16) NOT NULL,
    prl_Action char(1) NOT NULL,
    prl_deleted bit(1),
    prl_OrderAddedToEncounter int(4)
);

CREATE TABLE operationprocedurequalifier (
    plq_id int(4) NOT NULL
);

CREATE TABLE operationprocedurequalifierlog (
    plq_ObjectId int(4) NOT NULL,
    plq_id int(4) NOT NULL,
    plq_prl_id int(4) NOT NULL,
    plq_pqt_id int(4),
    plq_pqi_id int(4) NOT NULL,
    plq_order int(4) NOT NULL,
    plq_DateAdded datetime(8) NOT NULL,
    plq_AddedBy uniqueidentifier(16) NOT NULL,
    plq_TransactionId uniqueidentifier(16) NOT NULL,
    plq_Action char(1) NOT NULL
);

CREATE TABLE OphthalmicInsertionState (
    ois_id int(4) NOT NULL
);

CREATE TABLE OpticDiscAdditionalData (
    oda_ect_EncounterId uniqueidentifier(16) NOT NULL,
    oda_bod_BodyPartId int(4) NOT NULL,
    oda_lks_LensLookupId int(4),
    oda_UnadjustedDiscHeight decimal(5),
    oda_EstimatedAdjustedDiscHeight decimal(5),
    oda_SpotMagnificationFactor decimal(5)
);

CREATE TABLE OpticDiscAdditionalDataLog (
    oda_Id int(4) NOT NULL,
    oda_ObjectId uniqueidentifier(16) NOT NULL,
    oda_DateAdded datetime(8) NOT NULL,
    oda_AddedBy uniqueidentifier(16) NOT NULL,
    oda_Transactionid uniqueidentifier(16) NOT NULL,
    oda_Action char(1) NOT NULL,
    oda_bod_BodyPartId int(4) NOT NULL,
    oda_lks_LensLookupId int(4),
    oda_UnadjustedDiscHeight decimal(5),
    oda_EstimatedAdjustedDiscHeight decimal(5),
    oda_SpotMagnificationFactor decimal(5)
);

CREATE TABLE OpticDiscScan (
    Id int(4) NOT NULL,
    OctMachineId int(4) NOT NULL,
    AverageRnflThickness int(4),
    SuperiorHemisphereRnflThickness int(4),
    InferiorHemisphereRnflThickness int(4),
    RnflSymmetry int(4),
    SignalStrength int(4),
    RimArea decimal(5),
    DiscArea decimal(5),
    CupArea decimal(5),
    CupToDiscRatio decimal(5),
    LinearCupToDiscRatio decimal(5),
    VerticalCupToDiscRatio decimal(5),
    CupVolume decimal(5),
    RimVolume decimal(5),
    HorizontalDiscDiameter decimal(5),
    VerticalDiscDiameter decimal(5),
    SuperiorQuadrantRnflThickness int(4),
    InferiorQuadrantRnflThickness int(4),
    TemporalQuadrantRnflThickness int(4),
    NasalQuadrantRnflThickness int(4)
);

CREATE TABLE OpticDiscScanLog (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    BodyPartId int(4) NOT NULL,
    OctMachineId int(4) NOT NULL,
    AverageRnflThickness int(4),
    SuperiorHemisphereRnflThickness int(4),
    InferiorHemisphereRnflThickness int(4),
    RnflSymmetry int(4),
    SignalStrength int(4),
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    RimArea decimal(5),
    DiscArea decimal(5),
    CupArea decimal(5),
    CupToDiscRatio decimal(5),
    LinearCupToDiscRatio decimal(5),
    VerticalCupToDiscRatio decimal(5),
    CupVolume decimal(5),
    RimVolume decimal(5),
    HorizontalDiscDiameter decimal(5),
    VerticalDiscDiameter decimal(5),
    SuperiorQuadrantRnflThickness int(4),
    InferiorQuadrantRnflThickness int(4),
    TemporalQuadrantRnflThickness int(4),
    NasalQuadrantRnflThickness int(4)
);

CREATE TABLE OrientationMark (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL,
    StaticId int(4)
);

CREATE TABLE OrientationMarkLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL,
    StaticId int(4)
);

CREATE TABLE Other (
    Id int(4) NOT NULL,
    TimePostSurgeryHours int(4) NOT NULL,
    TimePostSurgeryMinutes int(4),
    Comments nvarchar(1000)
);

CREATE TABLE OtherLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TimePostSurgeryHours int(4) NOT NULL,
    TimePostSurgeryMinutes int(4),
    Comments nvarchar(1000)
);

CREATE TABLE OutboundMessage (
    hom_Id int(4) NOT NULL,
    hom_DateCreated datetime2(6) NOT NULL,
    hom_MessageContent varbinary(-1),
    hom_ErrorReason nvarchar(2000),
    hom_hpc_ProcedureCodeId int(4),
    hom_hsn_ScanNotificationId int(4),
    hom_hmd_DestinationId int(4),
    hom_use_TriggeredByUser uniqueidentifier(16),
    hom_bod_BodyPartId int(4),
    hom_mcs_CreationSourceId int(4) NOT NULL,
    hom_PatientYearOfBirth int(4),
    hom_lks_PatientGender int(4)
);

CREATE TABLE OutboundMessageCreationSource (
    mcs_Id int(4) NOT NULL,
    mcs_Description nvarchar(100) NOT NULL
);

CREATE TABLE OutboundMessageLog (
    hom_Id int(4) NOT NULL,
    hom_DateCreated datetime2(6) NOT NULL,
    hom_MessageContent varbinary(-1),
    hom_ErrorReason nvarchar(2000),
    hom_hms_MessageStateId int(4) NOT NULL,
    hom_anp_AnonymisedPatientId int(4) NOT NULL,
    hom_hpc_ProcedureCodeId int(4),
    hom_ObjectId int(4) NOT NULL,
    hom_DateAdded datetime(8) NOT NULL,
    hom_AddedBy uniqueidentifier(16) NOT NULL,
    hom_TransactionId uniqueidentifier(16) NOT NULL,
    hom_Action char(1) NOT NULL,
    hom_omt_MessageTypeId int(4) NOT NULL,
    hom_hsn_ScanNotificationId int(4),
    hom_hmd_DestinationId int(4),
    hom_use_TriggeredByUser uniqueidentifier(16),
    hom_bod_BodyPartId int(4),
    hom_mcs_CreationSourceId int(4) NOT NULL,
    hom_PatientYearOfBirth int(4),
    hom_lks_PatientGender int(4),
    hom_IsRegistrationMessage bit(1) NOT NULL
);

CREATE TABLE OutboundMessageType (
    omt_Id int(4) NOT NULL,
    omt_Description nvarchar(200) NOT NULL
);

CREATE TABLE Outcome (
    Id int(4) NOT NULL,
    iro_id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    OutcomeId int(4) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    ReferralToTreatmentId int(4),
    Comments nvarchar(1000),
    Order int(4) NOT NULL,
    PriorityId int(4) NOT NULL,
    PrimarilyReferredForId int(4),
    CarePathwayId int(4)
);

CREATE TABLE OutcomeLog (
    ActivityId int(4) NOT NULL,
    OutcomeId int(4) NOT NULL,
    ReferralToTreatmentId int(4),
    Comments nvarchar(1000),
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE OutgoingInterfaceInclusion (
    PathwayId int(4) NOT NULL
);

CREATE TABLE OverAction (
    Id int(4) NOT NULL,
    ActionDescription nvarchar(60) NOT NULL
);

CREATE TABLE pachymetry (
    pac_id int(4) NOT NULL,
    pac_value int(4),
    pac_correctionfactor float(8),
    pac_stdev float(8),
    pac_lks_id_machine int(4)
);

CREATE TABLE pachymetrylog (
    pac_ObjectId int(4) NOT NULL,
    pac_id int(4) NOT NULL,
    pac_act_id uniqueidentifier(16) NOT NULL,
    pac_bod_id int(4) NOT NULL,
    pac_value int(4),
    pac_correctionfactor float(8),
    pac_stdev float(8),
    pac_lks_id_machine int(4),
    pac_DateAdded datetime(8) NOT NULL,
    pac_AddedBy uniqueidentifier(16) NOT NULL,
    pac_TransactionId uniqueidentifier(16) NOT NULL,
    pac_Action char(1) NOT NULL
);

CREATE TABLE PachymetryReview (
    spa_smt_StudyMonitoringActivityId int(4) NOT NULL,
    spa_bod_BodyPartId int(4) NOT NULL,
    spa_smr_ReviewTypeId int(4) NOT NULL
);

CREATE TABLE PachymetryReviewLog (
    spa_smt_StudyMonitoringActivityId int(4) NOT NULL,
    spa_ObjectId int(4) NOT NULL,
    spa_DateAdded datetime(8) NOT NULL,
    spa_AddedBy uniqueidentifier(16) NOT NULL,
    spa_TransactionId uniqueidentifier(16) NOT NULL,
    spa_Action char(1) NOT NULL,
    spa_bod_BodyPartId int(4) NOT NULL,
    spa_smr_ReviewTypeId int(4) NOT NULL
);

CREATE TABLE Package (
    pkg_Id int(4) NOT NULL,
    pkg_Description nvarchar(500) NOT NULL,
    pkg_PublishedDate datetime(8) NOT NULL,
    pkg_use_PublishedById uniqueidentifier(16) NOT NULL,
    pkg_Package xml(-1) NOT NULL
);

CREATE TABLE PackageArtefact (
    pka_Id int(4) NOT NULL,
    pka_Artefact xml(-1) NOT NULL
);

CREATE TABLE PackagedEncounterTemplateVersion (
    ptv_pkg_PackageId int(4) NOT NULL,
    ptv_etv_EncounterTemplateVersionId int(4) NOT NULL
);

CREATE TABLE PackageType (
    pmt_Id int(4) NOT NULL,
    pmt_Name nvarchar(200) NOT NULL,
    pmt_Description nvarchar(500),
    pmt_SubscriptionDate datetime(8)
);

CREATE TABLE Pane (
    Id int(4) NOT NULL,
    Value int(4) NOT NULL,
    Description varchar(256) NOT NULL
);

CREATE TABLE Paracentesis (
    spd_SurgeonDefaultId int(4) NOT NULL,
    Id int(4) NOT NULL,
    gps_ActivityId uniqueidentifier(16) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    gps_Value int(4) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    spd_Value tinyint(1) NOT NULL,
    spd_bod_id int(4) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE ParacentesisLog (
    gps_ActivityId int(4) NOT NULL,
    Id int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    spd_SurgeonDefaultId int(4) NOT NULL,
    spd_ObjectId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId int(4) NOT NULL,
    gps_ObjectId uniqueidentifier(16) NOT NULL,
    gps_DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    spd_DateAdded datetime(8) NOT NULL,
    spd_AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    gps_AddedBy uniqueidentifier(16) NOT NULL,
    gps_Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    spd_Transactionid uniqueidentifier(16) NOT NULL,
    spd_Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    gps_Action char(1) NOT NULL,
    gps_Value int(4) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    spd_Value int(4),
    spd_bod_id tinyint(1),
    BodyPartId int(4) NOT NULL
);

CREATE TABLE Parity (
    sdp_id int(4) NOT NULL,
    sdp_description nvarchar(200) NOT NULL
);

CREATE TABLE partialdate (
    pdt_id uniqueidentifier(16) NOT NULL,
    pdt_day int(4),
    pdt_month int(4),
    pdt_year int(4),
    pdt_entiredate datetime(8)
);

CREATE TABLE partialdatelog (
    pdt_ObjectId uniqueidentifier(16) NOT NULL,
    pdt_id int(4) NOT NULL,
    pdt_day int(4),
    pdt_month int(4),
    pdt_year int(4),
    pdt_entiredate datetime(8),
    pdt_DateAdded datetime(8) NOT NULL,
    pdt_AddedBy uniqueidentifier(16) NOT NULL,
    pdt_TransactionId uniqueidentifier(16) NOT NULL,
    pdt_Action char(1) NOT NULL
);

CREATE TABLE PartialSave (
    bps_Id int(4) NOT NULL
);

CREATE TABLE Partner (
    Id int(4) NOT NULL,
    IsEnabled bit(1) NOT NULL,
    InterfaceTypeId int(4)
);

CREATE TABLE PartnerProgramme (
    PartnerId int(4) NOT NULL,
    ProgrammeId int(4) NOT NULL
);

CREATE TABLE passwordhistory (
    pwh_id int(4) NOT NULL,
    pwh_use_id uniqueidentifier(16) NOT NULL,
    pwh_password varchar(255) NOT NULL,
    pwh_passwordsalt varchar(255) NOT NULL,
    pwh_datechanged datetime(8) NOT NULL
);

CREATE TABLE PastMedicalHistory (
    med_act_ActivityId uniqueidentifier(16) NOT NULL,
    med_HideNegated bit(1) NOT NULL
);

CREATE TABLE PastMedicalHistoryLog (
    med_act_ActivityId int(4) NOT NULL,
    med_ObjectId uniqueidentifier(16) NOT NULL,
    med_DateAdded datetime(8) NOT NULL,
    med_AddedBy uniqueidentifier(16) NOT NULL,
    med_Transactionid uniqueidentifier(16) NOT NULL,
    med_Action char(1) NOT NULL,
    med_HideNegated bit(1) NOT NULL
);

CREATE TABLE PatchCategory (
    pct_id int(4) NOT NULL,
    pct_description nvarchar(510) NOT NULL
);

CREATE TABLE PatchingAudit (
    PatchAuditId int(4) NOT NULL,
    Messages varchar(-1) NOT NULL,
    InsertDateTime datetime(8) NOT NULL,
    PatchSyntax nvarchar(-1)
);

CREATE TABLE PatchInstallation (
    pns_id int(4) NOT NULL,
    pns_pts_id int(4) NOT NULL,
    pns_versiondisplay nvarchar(400) NOT NULL,
    pns_dateinstalled datetime(8),
    pns_datedatasource datetime(8),
    pns_error nvarchar(-1)
);

CREATE TABLE PatchLocale (
    pce_id int(4) NOT NULL,
    pce_pty_id int(4) NOT NULL,
    pce_locale nvarchar(20) NOT NULL
);

CREATE TABLE PatchState (
    pts_id int(4) NOT NULL,
    pts_description nvarchar(510) NOT NULL
);

CREATE TABLE PatchType (
    pty_id int(4) NOT NULL,
    pty_pct_id int(4) NOT NULL,
    pty_description nvarchar(510) NOT NULL
);

CREATE TABLE Pathway (
    ppw_id int(4) NOT NULL,
    cpw_id int(4) NOT NULL,
    CarePathwayId int(4) NOT NULL,
    IsActive bit(1) NOT NULL,
    cpw_name nvarchar(100),
    cpw_displayname nvarchar(100),
    ForReviewDefaultId int(4) NOT NULL,
    DefaultReviewerUserId uniqueidentifier(16),
    cpw_spe_id_subspecialty int(4) NOT NULL,
    cpw_use_id_leadclinician uniqueidentifier(16),
    DefaultReviewerUserGroupId uniqueidentifier(16),
    ClinicReviewerOverride bit(1) NOT NULL,
    cpw_col_id int(4) NOT NULL,
    cpw_active bit(1)
);

CREATE TABLE PathwayAssessmentType (
    PathwayId int(4) NOT NULL,
    AssessmentTypeId int(4) NOT NULL
);

CREATE TABLE PathwayAssessmentTypeLog (
    PathwayId int(4) NOT NULL,
    AssessmentTypeId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE PathwayLog (
    CarePathwayId int(4) NOT NULL,
    IsActive bit(1) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ForReviewDefaultId int(4) NOT NULL,
    DefaultReviewerUserId uniqueidentifier(16),
    DefaultReviewerUserGroupId uniqueidentifier(16),
    ClinicReviewerOverride bit(1) NOT NULL
);

CREATE TABLE PathwayVersion (
    ppv_id int(4) NOT NULL,
    Id int(4) NOT NULL,
    StratificationSystemVersionId int(4) NOT NULL,
    RiskScorePerEye bit(1) NOT NULL,
    RedFlagsPlusFactors bit(1) NOT NULL,
    GuidanceText nvarchar(-1),
    DateModified datetime(8) NOT NULL,
    Active bit(1) NOT NULL
);

CREATE TABLE PathwayVersionDischargeReason (
    pcd_ppv_id int(4) NOT NULL,
    pcd_cdr_id int(4) NOT NULL
);

CREATE TABLE PathwayVersionLog (
    Id int(4) NOT NULL,
    ppv_id int(4) NOT NULL,
    ppv_ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    ppv_DateAdded datetime(8) NOT NULL,
    ppv_AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    ppv_TransactionId uniqueidentifier(16) NOT NULL,
    ppv_Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    CarePathwayId int(4) NOT NULL,
    ppv_versionEffectiveDate datetime2(8) NOT NULL,
    ppv_ppw_id int(4) NOT NULL,
    StratificationSystemVersionId int(4) NOT NULL,
    RiskScorePerEye bit(1) NOT NULL,
    ppv_cpw_id int(4) NOT NULL,
    ppv_pcs_id int(4) NOT NULL,
    RedFlagsPlusFactors bit(1) NOT NULL,
    GuidanceText nvarchar(-1),
    ppv_use_id_responsible uniqueidentifier(16),
    ppv_comments nvarchar(500),
    DateModified datetime(8) NOT NULL,
    Active bit(1) NOT NULL,
    ppv_startDate datetime(8),
    ppv_dischargeDate datetime(8),
    ppv_dischargeComments nvarchar(500),
    ppv_rolledBack bit(1) NOT NULL,
    ppv_use_id_editedBy uniqueidentifier(16) NOT NULL,
    ppv_ect_id_editedFrom uniqueidentifier(16),
    ppv_ect_id_relatedWith uniqueidentifier(16)
);

CREATE TABLE Patient (
    pcl_id int(4) NOT NULL
);

CREATE TABLE patient (
    pat_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE Patient (
    Id int(4) NOT NULL,
    PatientNumber nvarchar(510) NOT NULL,
    pcl_pat_id uniqueidentifier(16) NOT NULL,
    pcl_pnt_id int(4) NOT NULL
);

CREATE TABLE patient (
    pat_initials nvarchar(510)
);

CREATE TABLE Patient (
    Forename nvarchar(510) NOT NULL,
    Surname nvarchar(510) NOT NULL
);

CREATE TABLE patient (
    pat_forename nvarchar(510)
);

CREATE TABLE Patient (
    pcl_patientNumber varchar(50),
    pcl_dateOfConsent datetime(8)
);

CREATE TABLE patient (
    pat_title nvarchar(510)
);

CREATE TABLE Patient (
    DateOfBirth date(3) NOT NULL
);

CREATE TABLE patient (
    pat_suffix nvarchar(510)
);

CREATE TABLE Patient (
    pcl_csw_id int(4) NOT NULL,
    pcl_bod_id int(4)
);

CREATE TABLE patient (
    pat_previoussurname nvarchar(510),
    pat_requestedname nvarchar(510)
);

CREATE TABLE Patient (
    pcl_comments varchar(2000),
    pcl_endDate datetime(8),
    pcl_lks_id int(4)
);

CREATE TABLE patient (
    pat_dod date(3),
    pat_lks_id_gender int(4),
    pat_lks_id_ethnic int(4),
    pat_lks_id_religion int(4),
    pat_lks_id_language int(4),
    pat_lks_id_marital int(4),
    pat_deceased tinyint(1),
    pat_occupation nvarchar(510),
    pat_lastupdatedfromdemographicstore datetime(8),
    pat_blb_id uniqueidentifier(16),
    pat_lks_id_nationality int(4),
    pat_source int(4) NOT NULL,
    pat_yearOfBirth int(4),
    pat_anonymisedAddedBy uniqueidentifier(16)
);

CREATE TABLE patientaddress (
    pad_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE patientaddresslog (
    pad_ObjectId uniqueidentifier(16) NOT NULL,
    pad_id int(4) NOT NULL,
    pad_pat_id uniqueidentifier(16) NOT NULL,
    pad_address1 nvarchar(510),
    pad_address2 nvarchar(510),
    pad_address3 nvarchar(510),
    pad_address4 nvarchar(510),
    pad_address5 nvarchar(510),
    pad_postcode varchar(255),
    pad_lks_id_type int(4) NOT NULL,
    pad_DateAdded datetime(8) NOT NULL,
    pad_AddedBy uniqueidentifier(16) NOT NULL,
    pad_TransactionId uniqueidentifier(16) NOT NULL,
    pad_Action char(1) NOT NULL
);

CREATE TABLE patientalert (
    plt_id int(4) NOT NULL,
    plt_lks_id_alertcategory int(4) NOT NULL,
    plt_lks_id_alerttype int(4) NOT NULL,
    plt_dategenerated datetime(8) NOT NULL,
    plt_dateclosed datetime(8),
    plt_message varchar(1024),
    plt_bodypart int(4)
);

CREATE TABLE patientalertlog (
    plt_ObjectId int(4) NOT NULL,
    plt_id int(4) NOT NULL,
    plt_pat_id uniqueidentifier(16) NOT NULL,
    plt_ect_id uniqueidentifier(16),
    plt_lks_id_alertcategory int(4) NOT NULL,
    plt_lks_id_alerttype int(4) NOT NULL,
    plt_dategenerated datetime(8) NOT NULL,
    plt_dateclosed datetime(8),
    plt_message varchar(1024),
    plt_bodypart int(4),
    plt_DateAdded datetime(8) NOT NULL,
    plt_AddedBy uniqueidentifier(16) NOT NULL,
    plt_TransactionId uniqueidentifier(16) NOT NULL,
    plt_Action char(1) NOT NULL
);

CREATE TABLE PatientAlertUserAcknowledgement (
    auk_Id int(4) NOT NULL,
    auk_plt_Id int(4) NOT NULL,
    auk_DateTimeAcknowledged datetime(8) NOT NULL
);

CREATE TABLE patientallergy (
    pll_id int(4) NOT NULL,
    pll_pss_id int(4) NOT NULL,
    pll_ect_id uniqueidentifier(16),
    pll_ReasonNotRecorded nvarchar(510),
    pll_StatusConfirmed bit(1),
    pll_StatusCheckedDateTime datetime(8)
);

CREATE TABLE patientallergyitem (
    pal_id int(4) NOT NULL
);

CREATE TABLE PatientAllergyItemDuplicateMedicationRemovalBackup (
    pal_id int(4) NOT NULL,
    pal_pss_id int(4) NOT NULL,
    pal_lks_id_allergytype int(4),
    pal_lks_id_status int(4),
    pal_substance nvarchar(510),
    pal_dmy_id int(4),
    pal_otherreactionsanddetails nvarchar(510),
    pal_dateupdated datetime(8),
    pal_use_id_recordedby uniqueidentifier(16),
    pal_lks_id_substance int(4),
    pal_dfy_id int(4),
    pal_oldpalid int(4)
);

CREATE TABLE patientallergyitemhistory (
    pah_id int(4) NOT NULL,
    pah_lks_id_status int(4) NOT NULL,
    pah_changed nvarchar(510),
    pah_use_id_recordedby uniqueidentifier(16),
    pah_datechanged datetime(8)
);

CREATE TABLE patientallergyitemlog (
    pal_ObjectId int(4) NOT NULL,
    pal_id int(4) NOT NULL,
    pal_pss_id int(4) NOT NULL,
    pal_lks_id_allergytype int(4),
    pal_lks_id_status int(4),
    pal_substance nvarchar(510),
    pal_dmy_id int(4),
    pal_otherreactionsanddetails nvarchar(510),
    pal_dateupdated datetime(8),
    pal_use_id_recordedby uniqueidentifier(16),
    pal_lks_id_substance int(4),
    pal_dfy_id int(4),
    pal_oldpalid int(4),
    pal_DateAdded datetime(8) NOT NULL,
    pal_AddedBy uniqueidentifier(16) NOT NULL,
    pal_TransactionId uniqueidentifier(16) NOT NULL,
    pal_Action char(1) NOT NULL
);

CREATE TABLE patientallergyitemsource (
    pis_id int(4) NOT NULL,
    pis_lks_id_source int(4) NOT NULL,
    pis_othersource nvarchar(510)
);

CREATE TABLE patientallergyitemsourcelog (
    pis_ObjectId int(4) NOT NULL,
    pis_id int(4) NOT NULL,
    pis_pal_id int(4) NOT NULL,
    pis_lks_id_source int(4) NOT NULL,
    pis_othersource nvarchar(510),
    pis_DateAdded datetime(8) NOT NULL,
    pis_AddedBy uniqueidentifier(16) NOT NULL,
    pis_TransactionId uniqueidentifier(16) NOT NULL,
    pis_Action char(1) NOT NULL
);

CREATE TABLE PatientCarePathwayExtractState (
    Id int(4) NOT NULL
);

CREATE TABLE patientclinicalplan (
    pln_id int(4) NOT NULL,
    pln_ect_id_created uniqueidentifier(16),
    pln_actiondate datetime(8),
    pln_expiredate datetime(8),
    pln_ect_id_actioned uniqueidentifier(16),
    pln_act_id_actioned uniqueidentifier(16),
    pln_cou_id int(4),
    pln_comment nvarchar(-1),
    pln_addedasdefault bit(1) NOT NULL
);

CREATE TABLE patientclinicalplan_Backup_Patch508 (
    pln_id int(4) NOT NULL,
    pln_pat_id uniqueidentifier(16) NOT NULL,
    pln_pit_id int(4),
    pln_use_id_added uniqueidentifier(16),
    pln_ect_id_created uniqueidentifier(16),
    pln_actiondate datetime(8),
    pln_expiredate datetime(8),
    pln_ect_id_actioned uniqueidentifier(16),
    pln_act_id_actioned uniqueidentifier(16),
    pln_cou_id int(4),
    pln_status int(4),
    pln_datecreated datetime(8),
    pln_comment nvarchar(4000),
    pln_versionid uniqueidentifier(16),
    pln_oldplnid int(4),
    pln_versiondate datetime(8),
    pln_versionfrom int(4) NOT NULL,
    pln_versionto int(4) NOT NULL,
    pln_addedasdefault bit(1) NOT NULL,
    pln_ect_id_completed uniqueidentifier(16)
);

CREATE TABLE patientclinicalplanhistory (
    plh_id int(4) NOT NULL,
    plh_updatereason varchar(255)
);

CREATE TABLE PatientClinicalPlanHistoryRemovalBackup (
    plh_id int(4) NOT NULL,
    plh_pln_id int(4),
    plh_lks_id_status int(4),
    plh_use_id_updated uniqueidentifier(16),
    plh_dateupdated datetime(8),
    plh_loc_id uniqueidentifier(16),
    plh_updatereason varchar(255),
    plh_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE PatientClinicalPlanRemovalBackup (
    pln_id int(4) NOT NULL,
    pln_use_id_added uniqueidentifier(16),
    pln_ect_id_created uniqueidentifier(16),
    pln_actiondate datetime(8),
    pln_expiredate datetime(8),
    pln_ect_id_actioned uniqueidentifier(16),
    pln_act_id_actioned uniqueidentifier(16),
    pln_cou_id int(4),
    pln_status int(4),
    pln_datecreated datetime(8),
    pln_comment nvarchar(-1),
    pln_versionid uniqueidentifier(16),
    pln_oldplnid int(4),
    pln_versiondate datetime(8) NOT NULL,
    pln_versionfrom int(4) NOT NULL,
    pln_versionto int(4) NOT NULL,
    pln_addedasdefault bit(1) NOT NULL,
    pln_ect_id_completed uniqueidentifier(16),
    pln_ppr_id int(4) NOT NULL,
    pln_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE patientclinicalplanroot (
    ppr_id int(4) NOT NULL
);

CREATE TABLE patientcontact (
    pco_id uniqueidentifier(16) NOT NULL,
    pco_value nvarchar(510),
    pco_lks_id_contact int(4) NOT NULL,
    pco_preferred tinyint(1) NOT NULL
);

CREATE TABLE patientcontactlog (
    pco_ObjectId uniqueidentifier(16) NOT NULL,
    pco_id int(4) NOT NULL,
    pco_pat_id uniqueidentifier(16) NOT NULL,
    pco_value nvarchar(510),
    pco_lks_id_contact int(4) NOT NULL,
    pco_preferred tinyint(1) NOT NULL,
    pco_DateAdded datetime(8) NOT NULL,
    pco_AddedBy uniqueidentifier(16) NOT NULL,
    pco_TransactionId uniqueidentifier(16) NOT NULL,
    pco_Action char(1) NOT NULL
);

CREATE TABLE PatientDeceasedRequest (
    RequestId int(4) NOT NULL,
    IsPatientDeceased bit(1) NOT NULL,
    DateOfDeath date(3)
);

CREATE TABLE PatientDeceasedStatusHistory (
    Id int(4) NOT NULL,
    PatientDemographicStoreId int(4) NOT NULL,
    Deceased bit(1) NOT NULL,
    DateOfDeath date(3),
    Source int(4) NOT NULL,
    UpdatedOn datetime2(6) NOT NULL
);

CREATE TABLE patientdemographicstore (
    pdm_id int(4) NOT NULL,
    pdm_initials nvarchar(510),
    pdm_title nvarchar(510),
    pdm_suffix nvarchar(510),
    pdm_previoussurname nvarchar(510),
    pdm_requestedname nvarchar(510),
    pdm_occupation nvarchar(510),
    pdm_dod date(3),
    pdm_deceased tinyint(1),
    pdm_gender nvarchar(510),
    pdm_ethnic nvarchar(510),
    pdm_religion nvarchar(510),
    pdm_language varchar(255),
    pdm_marital nvarchar(510),
    pdm_address1 nvarchar(510),
    pdm_address2 nvarchar(510),
    pdm_address3 nvarchar(510),
    pdm_address4 nvarchar(510),
    pdm_address5 nvarchar(510),
    pdm_phoneday varchar(255),
    pdm_phoneevening varchar(255),
    pdm_phonemobile varchar(255),
    pdm_email nvarchar(510),
    pdm_blb_id uniqueidentifier(16),
    pdm_nationality nvarchar(510),
    pdm_noksurname nvarchar(510),
    pdm_nokinitials nvarchar(510),
    pdm_nokforename nvarchar(510),
    pdm_noktitle nvarchar(510),
    pdm_nokrelation nvarchar(510),
    pdm_nokaddress1 nvarchar(510),
    pdm_nokaddress2 nvarchar(510),
    pdm_nokaddress3 nvarchar(510),
    pdm_nokaddress4 nvarchar(510),
    pdm_nokaddress5 nvarchar(510),
    pdm_nokpostcode varchar(255),
    pdm_nokphoneday varchar(255),
    pdm_nokphoneevening varchar(255),
    pdm_nokphonemobile varchar(255),
    pdm_source int(4) NOT NULL,
    pdm_nokrelationothertext nvarchar(510),
    pdm_yearOfBirth int(4)
);

CREATE TABLE patientdemographicstore_bak_20200109 (
    pdm_id int(4) NOT NULL,
    pdm_surname nvarchar(510),
    pdm_initials nvarchar(510),
    pdm_forename nvarchar(510),
    pdm_title nvarchar(510),
    pdm_suffix nvarchar(510),
    pdm_previoussurname nvarchar(510),
    pdm_requestedname nvarchar(510),
    pdm_occupation nvarchar(510),
    pdm_dob date(3),
    pdm_dod date(3),
    pdm_deceased tinyint(1),
    pdm_gender nvarchar(510),
    pdm_ethnic nvarchar(510),
    pdm_religion nvarchar(510),
    pdm_language varchar(255),
    pdm_marital nvarchar(510),
    pdm_address1 nvarchar(510),
    pdm_address2 nvarchar(510),
    pdm_address3 nvarchar(510),
    pdm_address4 nvarchar(510),
    pdm_address5 nvarchar(510),
    pdm_postcode nvarchar(510),
    pdm_phoneday varchar(255),
    pdm_phoneevening varchar(255),
    pdm_phonemobile varchar(255),
    pdm_email nvarchar(510),
    pdm_lastupdated datetime(8),
    pdm_pat_id uniqueidentifier(16),
    pdm_blb_id uniqueidentifier(16),
    pdm_nationality nvarchar(510),
    pdm_noksurname nvarchar(510),
    pdm_nokinitials nvarchar(510),
    pdm_nokforename nvarchar(510),
    pdm_noktitle nvarchar(510),
    pdm_nokrelation nvarchar(510),
    pdm_nokaddress1 nvarchar(510),
    pdm_nokaddress2 nvarchar(510),
    pdm_nokaddress3 nvarchar(510),
    pdm_nokaddress4 nvarchar(510),
    pdm_nokaddress5 nvarchar(510),
    pdm_nokpostcode varchar(255),
    pdm_nokphoneday varchar(255),
    pdm_nokphoneevening varchar(255),
    pdm_nokphonemobile varchar(255),
    pdm_source int(4) NOT NULL,
    pdm_isdeleted bit(1) NOT NULL,
    pdm_nokrelationothertext nvarchar(510)
);

CREATE TABLE patientdemographicstorenumber (
    pdn_id int(4) NOT NULL,
    pdn_HospitalNumberSubtypeId int(4)
);

CREATE TABLE PatientDemographicStoreNumber_Backup_183600 (
    pdn_id int(4) NOT NULL,
    pdn_pdm_id int(4),
    pdn_number nvarchar(510),
    pdn_numberstatus varchar(255),
    pdn_pnt_id int(4) NOT NULL,
    pdn_active bit(1) NOT NULL,
    pdn_HospitalNumberSubtypeId int(4),
    InsertDateUtc datetime2(8)
);

CREATE TABLE patientdemographicstorenumber_bak_20200109 (
    pdn_id int(4) NOT NULL,
    pdn_pdm_id int(4),
    pdn_number nvarchar(510),
    pdn_numberstatus varchar(255),
    pdn_pnt_id int(4) NOT NULL,
    pdn_active bit(1) NOT NULL
);

CREATE TABLE patientdemographicstorepractitioner (
    dpr_id int(4) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE patientdiabetic (
    pdi_id int(4) NOT NULL,
    pdi_pss_id int(4) NOT NULL,
    pdi_lks_id_diabetictype int(4),
    pdi_lks_id_diseasestatus int(4),
    pdi_agediagnosed int(4),
    pdi_pdt_id_datediagnosed uniqueidentifier(16),
    pdi_ect_id uniqueidentifier(16),
    pdi_pdt_diseasestatusdate uniqueidentifier(16),
    pdi_duration int(4),
    pdi_source int(4)
);

CREATE TABLE patientdiabeticcontrolled (
    pdc_id int(4) NOT NULL
);

CREATE TABLE patientdischarge (
    pdh_id int(4) NOT NULL,
    pdh_interval int(4),
    pdh_lks_id_intervaltype int(4),
    pdh_openappointment bit(1),
    pdh_comment nvarchar(8000)
);

CREATE TABLE patientdischargereason (
    pdr_id int(4) NOT NULL,
    pdr_pdh_id int(4),
    pdr_lks_id_dischargereason int(4)
);

CREATE TABLE patientdocumentlink (
    dpt_id int(4) NOT NULL
);

CREATE TABLE PatientEncounterExamination (
    dpx_id int(4) NOT NULL
);

CREATE TABLE PatientEncounterExaminationLog (
    dpx_ObjectId int(4) NOT NULL,
    dpx_id int(4) NOT NULL,
    dpx_ect_id uniqueidentifier(16) NOT NULL,
    dpx_dax_id int(4) NOT NULL,
    dpx_DateAdded datetime(8) NOT NULL,
    dpx_AddedBy uniqueidentifier(16) NOT NULL,
    dpx_Transactionid uniqueidentifier(16) NOT NULL,
    dpx_Action char(1) NOT NULL
);

CREATE TABLE PatientEncounterSection (
    dpe_id int(4) NOT NULL
);

CREATE TABLE PatientEncounterSectionLog (
    dpe_ObjectId int(4) NOT NULL,
    dpe_id int(4) NOT NULL,
    dpe_ect_id uniqueidentifier(16) NOT NULL,
    dpe_das_id int(4) NOT NULL,
    dpe_DateAdded datetime(8) NOT NULL,
    dpe_AddedBy uniqueidentifier(16) NOT NULL,
    dpe_Transactionid uniqueidentifier(16) NOT NULL,
    dpe_Action char(1) NOT NULL
);

CREATE TABLE PatientExternalIdentifier (
    pei_id int(4) NOT NULL,
    pei_pet_id int(4) NOT NULL,
    pei_identifier nvarchar(400) NOT NULL
);

CREATE TABLE PatientExternalIdentifierLog (
    pei_ObjectId int(4) NOT NULL,
    pei_id int(4) NOT NULL,
    pei_pat_id uniqueidentifier(16) NOT NULL,
    pei_pet_id int(4) NOT NULL,
    pei_identifier nvarchar(400) NOT NULL,
    pei_DateAdded datetime(8) NOT NULL,
    pei_AddedBy uniqueidentifier(16) NOT NULL,
    pei_Transactionid uniqueidentifier(16) NOT NULL,
    pei_Action char(1) NOT NULL
);

CREATE TABLE PatientExternalIdentifierType (
    pet_id int(4) NOT NULL,
    pet_description nvarchar(200) NOT NULL
);

CREATE TABLE patientfasting (
    pfs_id int(4) NOT NULL,
    pfs_instructionsgiven bit(1),
    pfs_nofoodfromapplicable bit(1),
    pfs_nofoodfrom time(5),
    pfs_nilbymouthapplicable bit(1),
    pfs_nilbymouthfrom time(5)
);

CREATE TABLE patientfastinglog (
    pfs_ObjectId int(4) NOT NULL,
    pfs_id int(4) NOT NULL,
    pfs_act_id uniqueidentifier(16) NOT NULL,
    pfs_instructionsgiven bit(1),
    pfs_nofoodfromapplicable bit(1),
    pfs_nofoodfrom time(5),
    pfs_nilbymouthapplicable bit(1),
    pfs_nilbymouthfrom time(5),
    pfs_DateAdded datetime(8) NOT NULL,
    pfs_AddedBy uniqueidentifier(16) NOT NULL,
    pfs_TransactionId uniqueidentifier(16) NOT NULL,
    pfs_Action char(1) NOT NULL
);

CREATE TABLE patientfinding (
    pfd_id int(4) NOT NULL,
    pfd_bod_id int(4),
    pfd_cpy_id int(4) NOT NULL,
    pfd_notes nvarchar(4096),
    pfd_parsedtext nvarchar(4000),
    pfd_value decimal(9),
    pfd_active bit(1),
    pfd_datefrom datetime(8),
    pfd_dateto datetime(8),
    pfd_daterecorded datetime(8),
    pfd_principal bit(1),
    pfd_derived bit(1),
    pfd_source bit(1),
    pfd_cfd_id int(4),
    pfd_nad bit(1) NOT NULL,
    pfd_comment bit(1) NOT NULL,
    pfd_pdt_approxdate int(4),
    pfd_lks_id_status int(4),
    pfd_use_id_recordedby uniqueidentifier(16),
    pfd_lks_id_certainty int(4),
    pfd_negated bit(1) NOT NULL,
    pfd_bsm_id int(4),
    pfd_eyeproblem bit(1),
    pfd_pfd_id_promotedproblem int(4),
    pfd_pdt_datefrom uniqueidentifier(16),
    pfd_pdt_dateto uniqueidentifier(16),
    pfd_type int(4),
    pfd_lks_id_measurement int(4),
    pfd_lks_id_machine int(4),
    pfd_measure_int int(4),
    pfd_measure_decimal decimal(9),
    pfd_ccp_id int(4)
);

CREATE TABLE patientfindinglog (
    pfd_ObjectId int(4) NOT NULL,
    pfd_id int(4) NOT NULL,
    pfd_bod_id int(4),
    pfd_ect_id uniqueidentifier(16),
    pfd_cpt_id int(4),
    pfd_cpy_id int(4) NOT NULL,
    pfd_notes nvarchar(4096),
    pfd_parsedtext nvarchar(4000),
    pfd_value decimal(9),
    pfd_active bit(1),
    pfd_datefrom datetime(8),
    pfd_dateto datetime(8),
    pfd_daterecorded datetime(8),
    pfd_principal bit(1),
    pfd_derived bit(1),
    pfd_source bit(1),
    pfd_pat_id uniqueidentifier(16) NOT NULL,
    pfd_cfd_id int(4),
    pfd_nad bit(1) NOT NULL,
    pfd_comment bit(1) NOT NULL,
    pfd_pdt_approxdate int(4),
    pfd_lks_id_status int(4),
    pfd_use_id_recordedby uniqueidentifier(16),
    pfd_lks_id_certainty int(4),
    pfd_negated bit(1),
    pfd_bsm_id int(4),
    pfd_eyeproblem bit(1),
    pfd_pfd_id_promotedproblem int(4),
    pfd_pdt_datefrom uniqueidentifier(16),
    pfd_pdt_dateto uniqueidentifier(16),
    pfd_type int(4),
    pfd_lks_id_measurement int(4),
    pfd_lks_id_machine int(4),
    pfd_measure_int int(4),
    pfd_measure_decimal decimal(9),
    pfd_ccp_id int(4),
    pfd_DateAdded datetime(8) NOT NULL,
    pfd_AddedBy uniqueidentifier(16) NOT NULL,
    pfd_TransactionId uniqueidentifier(16) NOT NULL,
    pfd_Action char(1) NOT NULL
);

CREATE TABLE patientfindingqualifier (
    pfq_id int(4) NOT NULL,
    pfq_cql_id int(4),
    pfq_cpt_id int(4),
    pfq_freetext nvarchar(510),
    pfd_number int(4)
);

CREATE TABLE patientfindingqualifierlog (
    pfq_ObjectId int(4) NOT NULL,
    pfq_id int(4) NOT NULL,
    pfq_pfd_id int(4) NOT NULL,
    pfq_cql_id int(4),
    pfq_cpt_id int(4),
    pfq_freetext nvarchar(510),
    pfd_number int(4),
    pfq_DateAdded datetime(8) NOT NULL,
    pfq_AddedBy uniqueidentifier(16) NOT NULL,
    pfq_TransactionId uniqueidentifier(16) NOT NULL,
    pfq_Action char(1) NOT NULL
);

CREATE TABLE PatientFindings (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    BodyPartId int(4) NOT NULL,
    ClinicalConceptId int(4),
    Notes nvarchar(4000),
    ParsedText nvarchar(4000),
    PatientId uniqueidentifier(16) NOT NULL,
    MappedFromFeature bit(1) NOT NULL
);

CREATE TABLE PatientFindingsLog (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    BodyPartId int(4) NOT NULL,
    ClinicalConceptId int(4),
    Notes nvarchar(4000),
    ParsedText nvarchar(4000),
    PatientId uniqueidentifier(16) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    MappedFromFeature bit(1) NOT NULL
);

CREATE TABLE PatientFirstEncounter (
    pfe_ect_id uniqueidentifier(16),
    pfe_pat_id uniqueidentifier(16),
    pfe_ect_date datetime(8)
);

CREATE TABLE PatientHistory (
    pfh_pss_id int(4) NOT NULL,
    pfh_comments nvarchar(5000)
);

CREATE TABLE PatientIdentification (
    clp_id int(4) NOT NULL,
    clp_temporaryIdentifier varchar(255),
    clp_surname nvarchar(510),
    clp_givenName nvarchar(510),
    clp_dateOfBirth date(3)
);

CREATE TABLE PatientIdentificationLog (
    clp_Id int(4) NOT NULL,
    clp_pat_id uniqueidentifier(16),
    clp_temporaryIdentifier varchar(255),
    clp_surname nvarchar(510),
    clp_givenName nvarchar(510),
    clp_dateOfBirth date(3),
    clp_ObjectId int(4) NOT NULL,
    clp_DateAdded datetime(8) NOT NULL,
    clp_AddedBy uniqueidentifier(16) NOT NULL,
    clp_TransactionId uniqueidentifier(16) NOT NULL,
    clp_Action char(1) NOT NULL
);

CREATE TABLE PatientIopTarget (
    pit_Id int(4) NOT NULL,
    pit_pss_Id int(4) NOT NULL,
    pit_Target int(4)
);

CREATE TABLE PatientIopTargetLog (
    pit_Id int(4) NOT NULL,
    pit_ObjectId int(4) NOT NULL,
    pit_DateAdded datetime(8) NOT NULL,
    pit_AddedBy uniqueidentifier(16) NOT NULL,
    pit_TransactionId uniqueidentifier(16) NOT NULL,
    pit_Action char(1) NOT NULL,
    pit_pss_Id int(4) NOT NULL,
    pit_Target int(4)
);

CREATE TABLE patientlens (
    psl_id int(4) NOT NULL
);

CREATE TABLE PatientList (
    plc_id int(4) NOT NULL
);

CREATE TABLE PatientListLog (
    plc_id int(4) NOT NULL,
    plc_DateAdded datetime(8) NOT NULL,
    plc_AddedBy uniqueidentifier(16) NOT NULL,
    plc_Transactionid uniqueidentifier(16) NOT NULL,
    plc_Action char(1) NOT NULL,
    plc_plt_id int(4) NOT NULL,
    plc_loc_id uniqueidentifier(16) NOT NULL,
    plc_date date(3) NOT NULL,
    plc_ObjectId int(4) NOT NULL
);

CREATE TABLE PatientListResponse (
    ppf_id int(4) NOT NULL,
    ppf_responsevalue nvarchar(510) NOT NULL,
    ppf_questiontext nvarchar(510) NOT NULL,
    ppf_answertext nvarchar(510) NOT NULL,
    ppf_isdeleted bit(1) NOT NULL,
    ppf_parsedtext nvarchar(-1),
    ppf_timestamp datetime(8) NOT NULL,
    ppf_use_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE PatientListResponseLog (
    ppf_ObjectId int(4) NOT NULL,
    ppf_id int(4) NOT NULL,
    ppf_lqu_id int(4) NOT NULL,
    ppf_pat_id uniqueidentifier(16) NOT NULL,
    ppf_bod_id int(4) NOT NULL,
    ppf_responsevalue nvarchar(510) NOT NULL,
    ppf_questiontext nvarchar(510) NOT NULL,
    ppf_answertext nvarchar(510) NOT NULL,
    ppf_isdeleted bit(1) NOT NULL,
    ppf_parsedtext nvarchar(-1),
    ppf_timestamp datetime(8) NOT NULL,
    ppf_use_id uniqueidentifier(16) NOT NULL,
    ppf_DateAdded datetime(8) NOT NULL,
    ppf_AddedBy uniqueidentifier(16) NOT NULL,
    ppf_TransactionId uniqueidentifier(16) NOT NULL,
    ppf_Action char(1) NOT NULL
);

CREATE TABLE PatientListType (
    plt_id int(4) NOT NULL,
    plt_name varchar(255) NOT NULL,
    plt_displaybydefault bit(1) NOT NULL
);

CREATE TABLE PatientLog (
    pcl_id int(4) NOT NULL
);

CREATE TABLE patientlog (
    pat_ObjectId uniqueidentifier(16) NOT NULL,
    pat_id int(4) NOT NULL
);

CREATE TABLE PatientLog (
    pcl_ObjectId int(4) NOT NULL,
    pcl_DateAdded datetime(8) NOT NULL
);

CREATE TABLE patientlog (
    pat_surname nvarchar(510),
    pat_initials nvarchar(510)
);

CREATE TABLE PatientLog (
    pcl_AddedBy uniqueidentifier(16) NOT NULL,
    pcl_Transactionid uniqueidentifier(16) NOT NULL
);

CREATE TABLE patientlog (
    pat_forename nvarchar(510),
    pat_title nvarchar(510)
);

CREATE TABLE PatientLog (
    pcl_Action char(1) NOT NULL,
    pcl_pat_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE patientlog (
    pat_suffix nvarchar(510),
    pat_previoussurname nvarchar(510)
);

CREATE TABLE PatientLog (
    pcl_pnt_id int(4) NOT NULL,
    pcl_patientNumber varchar(50)
);

CREATE TABLE patientlog (
    pat_requestedname nvarchar(510),
    pat_dob date(3)
);

CREATE TABLE PatientLog (
    pcl_dateOfConsent datetime(8),
    pcl_csw_id int(4) NOT NULL
);

CREATE TABLE patientlog (
    pat_dod date(3),
    pat_lks_id_gender int(4)
);

CREATE TABLE PatientLog (
    pcl_bod_id int(4),
    pcl_comments varchar(2000)
);

CREATE TABLE patientlog (
    pat_lks_id_ethnic int(4),
    pat_lks_id_religion int(4)
);

CREATE TABLE PatientLog (
    pcl_endDate datetime(8),
    pcl_lks_id int(4)
);

CREATE TABLE patientlog (
    pat_lks_id_language int(4),
    pat_lks_id_marital int(4)
);

CREATE TABLE PatientLog (
    pcl_WorkflowStatusLastUpdated datetime(8)
);

CREATE TABLE patientlog (
    pat_deceased tinyint(1),
    pat_occupation nvarchar(510),
    pat_status int(4),
    pat_lastupdatedfromdemographicstore datetime(8),
    pat_blb_id uniqueidentifier(16),
    pat_lks_id_nationality int(4),
    pat_source int(4) NOT NULL,
    pat_isdeleted bit(1) NOT NULL,
    pat_DateAdded datetime(8) NOT NULL,
    pat_AddedBy uniqueidentifier(16) NOT NULL,
    pat_TransactionId uniqueidentifier(16) NOT NULL,
    pat_Action char(1) NOT NULL,
    pat_yearOfBirth int(4),
    pat_anonymisedAddedBy uniqueidentifier(16),
    pat_pdm_id int(4)
);

CREATE TABLE PatientMatch (
    Id int(4) NOT NULL
);

CREATE TABLE patientmatch (
    ipm_id int(4) NOT NULL
);

CREATE TABLE PatientMatch (
    PatientMatchId int(4) NOT NULL,
    PatientId int(4) NOT NULL
);

CREATE TABLE patientmatch (
    ipm_forename nvarchar(510)
);

CREATE TABLE PatientMatch (
    EmrPatientId uniqueidentifier(16),
    NumberOfAttempts int(4) NOT NULL
);

CREATE TABLE patientmatch (
    ipm_yearofbirth int(4),
    ipm_monthofbirth int(4)
);

CREATE TABLE PatientMatch (
    LatestAttempt datetime(8) NOT NULL
);

CREATE TABLE patientmatch (
    ipm_dayofbirth int(4),
    ipm_lks_id_gender int(4),
    ipm_pml_id int(4),
    ipm_status int(4),
    ipm_resolvedtimestamp datetime(8),
    ipm_use_id_resolvedby uniqueidentifier(16),
    ipm_interfacesubtype int(4)
);

CREATE TABLE PatientMatchLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PatientMatchId int(4) NOT NULL,
    PatientId int(4) NOT NULL,
    EmrPatientId uniqueidentifier(16),
    NumberOfAttempts int(4) NOT NULL,
    LatestAttempt datetime(8) NOT NULL
);

CREATE TABLE patientmatchnumber (
    ipn_id int(4) NOT NULL,
    ipn_number varchar(255) NOT NULL,
    ipn_pnt_id int(4)
);

CREATE TABLE patientmatchpatientid (
    pmi_id int(4) NOT NULL,
    pmi_ipm_id int(4) NOT NULL,
    pmi_pdm_id int(4),
    pmi_pat_id uniqueidentifier(16)
);

CREATE TABLE patientmatchresult (
    pme_id int(4) NOT NULL,
    pme_ipm_id int(4) NOT NULL,
    pme_pdm_id int(4),
    pme_pat_id uniqueidentifier(16),
    pme_exactpatientnumbermatch bit(1),
    pme_exactsurnamematch bit(1),
    pme_exactforenamematch bit(1),
    pme_exactyearofbirthmatch bit(1),
    pme_exactmonthofbirthmatch bit(1),
    pme_exactdayofbirthmatch bit(1),
    pme_transposednamesmatch bit(1),
    pme_transposedforenamesmatch bit(1),
    pme_transposeddaymonthmatch bit(1),
    pme_mispunctuatednamesmatch bit(1),
    pme_displacednamesmatch bit(1),
    pme_abbreviatedforenamematch bit(1),
    pme_partialforenamematch bit(1),
    pme_abbreviatedfamilynamematch bit(1)
);

CREATE TABLE patientmedicationhistory (
    pmh_id int(4) NOT NULL
);

CREATE TABLE patientmedicationmaster (
    pmm_id int(4) NOT NULL,
    pmm_DateModified datetime2(6) NOT NULL
);

CREATE TABLE patientmedicationrecord (
    pmd_id int(4) NOT NULL,
    pmd_MigratedFromMophth bit(1) NOT NULL
);

CREATE TABLE PatientMedicationRecordDuplicateMedicationRemovalBackup (
    pmd_id int(4) NOT NULL,
    pmd_pat_id uniqueidentifier(16),
    pmd_ect_id uniqueidentifier(16),
    pmd_mcn_id int(4),
    pmd_dro_id int(4),
    pmd_dco_id int(4),
    pmd_bod_id int(4),
    pmd_pdt_id_startdate uniqueidentifier(16),
    pmd_pdt_id_stopdate uniqueidentifier(16),
    pmd_daterecorded datetime(8),
    pmd_use_id_recordedby uniqueidentifier(16),
    pmd_use_id_consultant uniqueidentifier(16),
    pmd_addedbyprescription bit(1),
    pmd_medicationstatustype int(4),
    pmd_eyerelated int(4),
    pmd_additionalnotes nvarchar(-1),
    pmd_loc_id uniqueidentifier(16),
    pmd_hos_id uniqueidentifier(16),
    pmd_startdateapprox bit(1),
    pmd_startdateapproxtimeperiod int(4),
    pmd_startdateapproxcontextflag int(4),
    pmd_order int(4),
    pmd_deleted bit(1),
    pmd_suspended bit(1),
    pmd_datelastupdated datetime(8),
    pmd_addedasdefault bit(1) NOT NULL,
    pmd_oldpmdid int(4),
    pmd_versiondate datetime(8),
    pmd_initialstartdate datetime(8),
    pmd_versionfrom int(4) NOT NULL,
    pmd_versionto int(4) NOT NULL,
    pmd_datelastissued datetime(8),
    pmd_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE patientmedicationsideeffect (
    pms_id int(4) NOT NULL,
    pms_lks_id_sideeffect int(4),
    pms_eyerelated bit(1) NOT NULL
);

CREATE TABLE patientmerge (
    pmg_id int(4) NOT NULL
);

CREATE TABLE PatientMerge (
    opm_Id int(4) NOT NULL,
    opm_pat_PrimaryPatientId uniqueidentifier(16) NOT NULL
);

CREATE TABLE patientmerge (
    pmg_EndTime datetime(8),
    pmg_pat_id_primary uniqueidentifier(16) NOT NULL
);

CREATE TABLE PatientMerge (
    opm_pat_SecondaryPatientId uniqueidentifier(16) NOT NULL
);

CREATE TABLE patientmerge (
    pmg_pat_id_secondary uniqueidentifier(16) NOT NULL,
    pmg_pat_id_new uniqueidentifier(16),
    pmg_trigger int(4) NOT NULL
);

CREATE TABLE PatientMerge (
    opm_MergedOphthalSuitePatientId int(4),
    opm_OphthalSuiteMergeError nvarchar(-1)
);

CREATE TABLE patientmerge (
    pmg_exception varchar(-1),
    pmg_StartTime datetime(8)
);

CREATE TABLE PatientMergeLog (
    opm_Id int(4) NOT NULL,
    opm_pat_PrimaryPatientId uniqueidentifier(16) NOT NULL,
    opm_pat_SecondaryPatientId uniqueidentifier(16) NOT NULL,
    opm_pat_MergedPatientId uniqueidentifier(16) NOT NULL,
    opm_DateTimeActioned datetime2(8),
    opm_MergedOphthalSuitePatientId int(4),
    opm_OphthalSuiteMergeError nvarchar(-1),
    opm_ObjectId int(4) NOT NULL,
    opm_DateAdded datetime(8) NOT NULL,
    opm_AddedBy uniqueidentifier(16) NOT NULL,
    opm_TransactionId uniqueidentifier(16) NOT NULL,
    opm_Action char(1) NOT NULL
);

CREATE TABLE patientmrsa (
    pmr_id int(4) NOT NULL,
    pmr_pss_id int(4) NOT NULL,
    pmr_lks_id_result int(4),
    pmr_screened bit(1),
    pmr_screenrequired bit(1),
    pmr_swabtaken bit(1),
    pmr_datescreened datetime(8),
    pmr_comments nvarchar(4000)
);

CREATE TABLE patientmrsaswab (
    psw_id int(4) NOT NULL,
    psw_lks_id_swabarea int(4)
);

CREATE TABLE patientnumber (
    pnm_id uniqueidentifier(16) NOT NULL,
    pnm_HospitalNumberSubtypeId int(4)
);

CREATE TABLE PatientNumber_Backup_183600 (
    pnm_id uniqueidentifier(16) NOT NULL,
    pnm_pat_id uniqueidentifier(16),
    pnm_number varchar(255),
    pnm_lks_id_status int(4),
    pnm_pnt_id int(4) NOT NULL,
    pnm_active bit(1) NOT NULL,
    pnm_HospitalNumberSubtypeId int(4),
    InsertDateUtc datetime2(8)
);

CREATE TABLE patientnumberlog (
    pnm_ObjectId uniqueidentifier(16) NOT NULL,
    pnm_id int(4) NOT NULL,
    pnm_pat_id uniqueidentifier(16),
    pnm_number varchar(255),
    pnm_lks_id_status int(4),
    pnm_pnt_id int(4) NOT NULL,
    pnm_DateAdded datetime(8) NOT NULL,
    pnm_AddedBy uniqueidentifier(16) NOT NULL,
    pnm_TransactionId uniqueidentifier(16) NOT NULL,
    pnm_Action char(1) NOT NULL,
    pnm_active bit(1),
    pnm_HospitalNumberSubtypeId int(4)
);

CREATE TABLE patientnumbertype (
    pnt_id int(4) NOT NULL,
    pnt_code varchar(255) NOT NULL,
    pnt_desc nvarchar(510),
    pnt_regexvalidinput varchar(255) NOT NULL,
    pnt_regexsearchinput varchar(255) NOT NULL,
    pnt_regexsearchoutput varchar(255) NOT NULL,
    pnt_regexdisplayinput varchar(255) NOT NULL,
    pnt_regexdisplayoutput varchar(255) NOT NULL,
    pnt_rank int(4),
    pnt_active bit(1),
    pnt_lkt_id_status int(4),
    pnt_display bit(1) NOT NULL,
    pnt_uniqueacrosspatients bit(1) NOT NULL,
    pnt_allowmultipleperpatient bit(1) NOT NULL,
    pnt_abbreviation nvarchar(510),
    pnt_required bit(1) NOT NULL,
    pnt_partialabbreviation nvarchar(510),
    pnt_pnc_id int(4) NOT NULL
);

CREATE TABLE patientnumbertypecategory (
    pnc_id int(4) NOT NULL,
    pnc_description varchar(50) NOT NULL
);

CREATE TABLE patientoverview (
    pto_id int(4) NOT NULL,
    pto_overview nvarchar(-1),
    pto_refresh_date datetime(8) NOT NULL,
    pto_requires_refresh tinyint(1) NOT NULL,
    pto_last_updated datetime(8) NOT NULL
);

CREATE TABLE patientpinstore (
    ppn_id int(4) NOT NULL,
    ppn_pin varchar(50),
    ppn_pinint int(4),
    ppn_status int(4),
    ppn_startdate datetime(8),
    ppn_stopdate datetime(8),
    ppn_stopreason int(4),
    ppn_flag int(4),
    ppn_scheme int(4),
    ppn_updated datetime(8),
    ppn_ect_id uniqueidentifier(16),
    ppn_ect_id_requested uniqueidentifier(16),
    ppn_cpw_CarePathwayTypeId int(4),
    ppn_ppr_PatientClinicalPlanRootId int(4),
    ppn_AutomaticallyCreated bit(1) NOT NULL
);

CREATE TABLE patientpinstorelog (
    ppn_ObjectId int(4) NOT NULL,
    ppn_id int(4) NOT NULL,
    ppn_pin varchar(50),
    ppn_pinint int(4),
    ppn_pat_id uniqueidentifier(16),
    ppn_status int(4),
    ppn_startdate datetime(8),
    ppn_stopdate datetime(8),
    ppn_stopreason int(4),
    ppn_flag int(4),
    ppn_scheme int(4),
    ppn_updated datetime(8),
    ppn_ect_id uniqueidentifier(16),
    ppn_ect_id_requested uniqueidentifier(16),
    ppn_DateAdded datetime(8) NOT NULL,
    ppn_AddedBy uniqueidentifier(16) NOT NULL,
    ppn_TransactionId uniqueidentifier(16) NOT NULL,
    ppn_Action char(1) NOT NULL,
    ppn_cpw_CarePathwayTypeId int(4),
    ppn_ppr_PatientClinicalPlanRootId int(4),
    ppn_AutomaticallyCreated bit(1) NOT NULL
);

CREATE TABLE patientplanitem (
    ppi_id int(4) NOT NULL
);

CREATE TABLE patientplanitemcomment (
    pan_id int(4) NOT NULL,
    pan_comment nvarchar(-1),
    pan_useonletters bit(1) NOT NULL
);

CREATE TABLE PatientPlanItemCommentLog (
    pan_Id int(4) NOT NULL,
    pan_ObjectId int(4) NOT NULL,
    pan_DateAdded datetime(8) NOT NULL,
    pan_AddedBy uniqueidentifier(16) NOT NULL,
    pan_Transactionid uniqueidentifier(16) NOT NULL,
    pan_Action char(1) NOT NULL,
    pan_ppi_Id int(4) NOT NULL,
    pan_comment nvarchar(-1),
    pan_useonletters bit(1) NOT NULL
);

CREATE TABLE patientplanitemtype (
    pit_id int(4) NOT NULL,
    pit_description varchar(255) NOT NULL,
    pit_parent_id int(4),
    pit_order int(4) NOT NULL
);

CREATE TABLE patientplanmaster (
    ppm_id int(4) NOT NULL,
    ppm_DateModified datetime2(6) NOT NULL
);

CREATE TABLE patientpractitionerlink (
    pap_id int(4) NOT NULL,
    pap_principaloftype bit(1),
    pap_dateassociated datetime(8),
    pap_datedisassociated datetime(8),
    pap_associationcontext int(4),
    pap_manualoverride bit(1)
);

CREATE TABLE patientproblem (
    prb_id int(4) NOT NULL,
    prb_ect_id uniqueidentifier(16),
    prb_cpy_id int(4) NOT NULL,
    prb_notes nvarchar(4096),
    prb_parsedtext nvarchar(4000),
    prb_value decimal(9),
    prb_active bit(1),
    prb_datefrom datetime(8),
    prb_dateto datetime(8),
    prb_daterecorded datetime(8),
    prb_principal bit(1),
    prb_derived bit(1),
    prb_source bit(1),
    prb_cfd_id int(4),
    prb_nad bit(1) NOT NULL,
    prb_comment bit(1) NOT NULL,
    prb_pdt_approxdate int(4),
    prb_use_id_recordedby uniqueidentifier(16),
    prb_lks_id_certainty int(4),
    prb_negated bit(1) NOT NULL,
    prb_bsm_id int(4),
    prb_eyeproblem bit(1),
    prb_prb_id_promotedproblem int(4),
    prb_pdt_datefrom uniqueidentifier(16),
    prb_pdt_dateto uniqueidentifier(16),
    prb_versionid uniqueidentifier(16),
    prb_oldprbid int(4),
    prb_drassessment bit(1)
);

CREATE TABLE patientproblemhistory (
    pph_Id int(4) NOT NULL,
    pph_versiondate datetime(8) NOT NULL
);

CREATE TABLE patientproblemhistorytype (
    pht_id int(4) NOT NULL,
    pht_description varchar(100)
);

CREATE TABLE patientproblemmaster (
    ppb_id int(4) NOT NULL,
    ppb_DateModified datetime2(6) NOT NULL
);

CREATE TABLE patientrelation (
    pre_id uniqueidentifier(16) NOT NULL,
    pre_surname nvarchar(510),
    pre_initials nvarchar(510),
    pre_forename nvarchar(510),
    pre_title nvarchar(510),
    pre_lks_id_relationtype int(4) NOT NULL,
    pre_lks_id_relation int(4),
    pre_add_id uniqueidentifier(16),
    pre_active bit(1),
    pre_relationothertext nvarchar(510)
);

CREATE TABLE patientrelationcontact (
    prc_id uniqueidentifier(16) NOT NULL,
    prc_value nvarchar(510),
    prc_lks_id_contacttype int(4) NOT NULL,
    prc_preferred tinyint(1) NOT NULL
);

CREATE TABLE patientrelationcontactlog (
    prc_ObjectId uniqueidentifier(16) NOT NULL,
    prc_id int(4) NOT NULL,
    prc_pre_id uniqueidentifier(16) NOT NULL,
    prc_value nvarchar(510),
    prc_lks_id_contacttype int(4) NOT NULL,
    prc_preferred tinyint(1) NOT NULL,
    prc_DateAdded datetime(8) NOT NULL,
    prc_AddedBy uniqueidentifier(16) NOT NULL,
    prc_TransactionId uniqueidentifier(16) NOT NULL,
    prc_Action char(1) NOT NULL
);

CREATE TABLE patientrelationlog (
    pre_ObjectId uniqueidentifier(16) NOT NULL,
    pre_id int(4) NOT NULL,
    pre_pat_id uniqueidentifier(16) NOT NULL,
    pre_surname nvarchar(510),
    pre_initials nvarchar(510),
    pre_forename nvarchar(510),
    pre_title nvarchar(510),
    pre_lks_id_relationtype int(4) NOT NULL,
    pre_lks_id_relation int(4),
    pre_add_id uniqueidentifier(16),
    pre_active bit(1),
    pre_relationothertext nvarchar(510),
    pre_DateAdded datetime(8) NOT NULL,
    pre_AddedBy uniqueidentifier(16) NOT NULL,
    pre_TransactionId uniqueidentifier(16) NOT NULL,
    pre_Action char(1) NOT NULL
);

CREATE TABLE patientsearchhistory (
    psh_id int(4) NOT NULL,
    psh_patientnumber varchar(255),
    psh_surname nvarchar(510),
    psh_forename nvarchar(510),
    psh_dob datetime(8),
    psh_postcode varchar(255),
    psh_timetaken time(5),
    psh_searchresults nvarchar(-1)
);

CREATE TABLE patientstatus (
    pss_id int(4) NOT NULL
);

CREATE TABLE PatientStatusExtractState (
    Id int(4) NOT NULL
);

CREATE TABLE patientstatusmaster (
    psm_id int(4) NOT NULL,
    psm_DateModified datetime2(6) NOT NULL
);

CREATE TABLE patientstatustype (
    psp_id int(4) NOT NULL,
    psp_description varchar(50)
);

CREATE TABLE patienttransport (
    ptp_id int(4) NOT NULL,
    ptp_lks_id_transporttype int(4),
    ptp_lks_id_transport int(4),
    ptp_lks_id_transportcategory int(4)
);

CREATE TABLE patienttransportlog (
    ptp_ObjectId int(4) NOT NULL,
    ptp_id int(4) NOT NULL,
    ptp_act_id uniqueidentifier(16) NOT NULL,
    ptp_lks_id_transporttype int(4),
    ptp_lks_id_transport int(4),
    ptp_lks_id_transportcategory int(4),
    ptp_DateAdded datetime(8) NOT NULL,
    ptp_AddedBy uniqueidentifier(16) NOT NULL,
    ptp_TransactionId uniqueidentifier(16) NOT NULL,
    ptp_Action char(1) NOT NULL
);

CREATE TABLE patientupdatehistory (
    puh_id int(4) NOT NULL,
    puh_lks_id_areaupdated int(4) NOT NULL,
    puh_use_id uniqueidentifier(16) NOT NULL,
    puh_datetimeupdate datetime(8) NOT NULL
);

CREATE TABLE patientviewedhistory (
    pvh_id int(4) NOT NULL
);

CREATE TABLE PendingPackage (
    epp_Id int(4) NOT NULL,
    epp_MinimumSupportedReleaseVersion int(4) NOT NULL,
    epp_PackageArtefactDefinitionPayload nvarchar(-1) NOT NULL
);

CREATE TABLE PendingPackageLog (
    epp_Id int(4) NOT NULL,
    epp_ObjectId int(4) NOT NULL,
    epp_DateAdded datetime(8) NOT NULL,
    epp_AddedBy uniqueidentifier(16) NOT NULL,
    epp_Transactionid uniqueidentifier(16) NOT NULL,
    epp_Action char(1) NOT NULL,
    epp_UniqueKey uniqueidentifier(16) NOT NULL,
    epp_MinimumSupportedReleaseVersion int(4) NOT NULL,
    epp_PackageArtefactDefinitionPayload nvarchar(-1) NOT NULL
);

CREATE TABLE PeripheralIridectomy (
    ActivityId uniqueidentifier(16) NOT NULL,
    Id int(4) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE PeripheralIridectomyLog (
    ActivityId int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    ClockHourValue int(4) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE Peritomy (
    Id int(4) NOT NULL,
    PeritomyId int(4) NOT NULL
);

CREATE TABLE PeritomyLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PreparationId int(4) NOT NULL,
    PeritomyId int(4) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE permission (
    per_id int(4) NOT NULL
);

CREATE TABLE Permission (
    etp_Id int(4) NOT NULL,
    etp_Description nvarchar(200) NOT NULL,
    etp_Enabled bit(1) NOT NULL,
    etp_Identifier uniqueidentifier(16)
);

CREATE TABLE permission (
    per_description nvarchar(510),
    per_active bit(1),
    per_isdefault bit(1) NOT NULL
);

CREATE TABLE permissionarea (
    par_id int(4) NOT NULL,
    par_description varchar(255),
    par_per_id int(4)
);

CREATE TABLE PermittedDynamicActivitySection (
    tps_das_Id int(4) NOT NULL
);

CREATE TABLE personneltype (
    acp_id int(4) NOT NULL,
    acp_desc nvarchar(200)
);

CREATE TABLE PhData (
    uph_id int(4) NOT NULL,
    uph_available bit(1) NOT NULL
);

CREATE TABLE Plan (
    spp_id int(4) NOT NULL,
    ipl_id int(4) NOT NULL,
    ipl_activedate datetime(8) NOT NULL,
    ipl_inactivedate datetime(8)
);

CREATE TABLE PlanLog (
    ipl_id int(4) NOT NULL,
    spp_ObjectId int(4) NOT NULL,
    spp_id int(4) NOT NULL,
    ipl_pat_id uniqueidentifier(16),
    ipl_bod_id int(4),
    spp_act_id uniqueidentifier(16) NOT NULL,
    spp_pln_id int(4),
    ipl_ObjectId int(4) NOT NULL,
    ipl_DateAdded datetime(8) NOT NULL,
    spp_risksbenefitsdiscussed bit(1) NOT NULL,
    spp_consentformgiven bit(1) NOT NULL,
    ipl_AddedBy uniqueidentifier(16) NOT NULL,
    ipl_TransactionId uniqueidentifier(16) NOT NULL,
    spp_patientconsented bit(1) NOT NULL,
    spp_comments nvarchar(1000),
    ipl_Action char(1) NOT NULL,
    ipl_activedate datetime(8),
    spp_DateAdded datetime(8) NOT NULL,
    spp_AddedBy uniqueidentifier(16) NOT NULL,
    ipl_inactivedate datetime(8),
    spp_TransactionId uniqueidentifier(16) NOT NULL,
    spp_Action char(1) NOT NULL
);

CREATE TABLE planneddischarge (
    pld_id int(4) NOT NULL,
    pld_pln_id int(4) NOT NULL,
    pld_interval int(4),
    pld_lks_id_intervaltype int(4),
    pld_openappointment bit(1)
);

CREATE TABLE planneddischargereason (
    pdr_id int(4) NOT NULL,
    pdr_lks_id_dischargereason int(4)
);

CREATE TABLE PlannedEvent (
    Id int(4) NOT NULL,
    PlanId int(4) NOT NULL,
    ActionType int(4) NOT NULL,
    EventType int(4) NOT NULL,
    DateStaged datetime2(8) NOT NULL,
    IsDeleted bit(1) NOT NULL,
    LocationCreatedAt nvarchar(510),
    LinkedClinicAppointment int(4),
    UserAddedBy uniqueidentifier(16) NOT NULL,
    DateCreated datetime2(8) NOT NULL,
    EventTimeframe int(4),
    VisitTimeframeType int(4),
    EventDate datetime2(8),
    Priority nvarchar(510),
    Location nvarchar(510),
    LocationType nvarchar(510),
    HospitalLocation nvarchar(510),
    Clinic nvarchar(510),
    ResponsibleUser uniqueidentifier(16),
    BookingComments nvarchar(4000),
    CompletionStatus int(4) NOT NULL,
    SeenBy nvarchar(200)
);

CREATE TABLE PlannedEventExtractState (
    Id int(4) NOT NULL,
    IsDeletedEvent bit(1) NOT NULL
);

CREATE TABLE PlannedOperation (
    plo_act_id uniqueidentifier(16) NOT NULL,
    apo_ActivityId uniqueidentifier(16) NOT NULL,
    apo_ppr_id int(4) NOT NULL,
    plo_ppr_id int(4) NOT NULL
);

CREATE TABLE plannedoperation (
    pop_pln_id int(4) NOT NULL
);

CREATE TABLE PlannedOperation (
    plo_lks_id_AnaesthesiaType int(4),
    apo_GeneralAnaesthetic bit(1) NOT NULL,
    apo_LocalAnaesthetic bit(1) NOT NULL
);

CREATE TABLE plannedoperation (
    pop_lks_id_intervaltype int(4),
    pop_interval int(4)
);

CREATE TABLE PlannedOperation (
    apo_HasSedation bit(1) NOT NULL
);

CREATE TABLE plannedoperation (
    pop_lks_id_visittype int(4),
    pop_lks_id_anaesthesiatype int(4),
    pop_use_id_enterby uniqueidentifier(16),
    pop_sedation bit(1),
    pop_lks_id_priority int(4),
    pop_op_admission_date datetime(8),
    pop_op_admission_time time(5),
    pop_arrivaltime time(5),
    pop_starttime time(5),
    pop_dayspreop int(4),
    pop_op_loc_id uniqueidentifier(16),
    pop_comments nvarchar(-1),
    pop_pc_location_id uniqueidentifier(16),
    pop_pc_date datetime(8),
    pop_pc_use_id_consultant uniqueidentifier(16),
    pop_lks_id_asagrade int(4),
    pop_op_time varchar(5),
    pop_op_weeks int(4),
    pop_op_admit_lead int(4),
    pop_op_use_id_consultant uniqueidentifier(16),
    pop_op_daycase bit(1),
    pop_op_waitlistinitiative bit(1),
    pop_op_privatepatient bit(1),
    pop_op_directbooking bit(1),
    pop_unplanned bit(1),
    pop_duration int(4),
    pop_lks_id_suitable int(4),
    pop_cancelled bit(1),
    pop_theatretime int(4)
);

CREATE TABLE plannedoperationanaesthesiatype (
    poa_id int(4) NOT NULL
);

CREATE TABLE plannedoperationanaesthesiatypelog (
    poa_ObjectId int(4) NOT NULL,
    poa_id int(4) NOT NULL,
    poa_pln_id int(4),
    poa_lks_id_anaesthesiatype int(4),
    poa_DateAdded datetime(8) NOT NULL,
    poa_AddedBy uniqueidentifier(16) NOT NULL,
    poa_TransactionId uniqueidentifier(16) NOT NULL,
    poa_Action char(1) NOT NULL
);

CREATE TABLE PlannedOperationAnaesthesiaTypeRemovalBackup (
    poa_id int(4) NOT NULL,
    poa_pln_id int(4),
    poa_lks_id_anaesthesiatype int(4),
    poa_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE plannedoperationindication (
    pli_id int(4) NOT NULL
);

CREATE TABLE plannedoperationindicationlog (
    pli_ObjectId int(4) NOT NULL,
    pli_id int(4) NOT NULL,
    pli_pln_id int(4),
    pli_bod_id int(4),
    pli_cpt_id int(4),
    pli_DateAdded datetime(8) NOT NULL,
    pli_AddedBy uniqueidentifier(16) NOT NULL,
    pli_TransactionId uniqueidentifier(16) NOT NULL,
    pli_Action char(1) NOT NULL
);

CREATE TABLE PlannedOperationIndicationRemovalBackup (
    pli_id int(4) NOT NULL,
    pli_pln_id int(4),
    pli_bod_id int(4),
    pli_cpt_id int(4),
    pli_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE PlannedOperationLocalAnaestheticRoute (
    par_LocalAnaestheticRouteId int(4) NOT NULL,
    par_PlannedOperationActivityId uniqueidentifier(16) NOT NULL
);

CREATE TABLE PlannedOperationLocalAnaestheticRouteLog (
    par_PlannedOperationActivityId int(4) NOT NULL,
    par_ObjectId uniqueidentifier(16) NOT NULL,
    par_DateAdded datetime(8) NOT NULL,
    par_AddedBy uniqueidentifier(16) NOT NULL,
    par_Transactionid uniqueidentifier(16) NOT NULL,
    par_Action char(1) NOT NULL,
    par_LocalAnaestheticRouteId int(4) NOT NULL
);

CREATE TABLE PlannedOperationLog (
    plo_act_id int(4) NOT NULL,
    apo_ActivityId int(4) NOT NULL,
    apo_ObjectId uniqueidentifier(16) NOT NULL,
    plo_ObjectId uniqueidentifier(16) NOT NULL,
    plo_DateAdded datetime(8) NOT NULL,
    apo_DateAdded datetime(8) NOT NULL,
    apo_AddedBy uniqueidentifier(16) NOT NULL,
    plo_AddedBy uniqueidentifier(16) NOT NULL,
    plo_Transactionid uniqueidentifier(16) NOT NULL,
    apo_Transactionid uniqueidentifier(16) NOT NULL,
    apo_Action char(1) NOT NULL,
    plo_Action char(1) NOT NULL,
    plo_ppr_id int(4) NOT NULL,
    apo_ppr_id int(4) NOT NULL,
    apo_GeneralAnaesthetic bit(1) NOT NULL,
    plo_lks_id_AnaesthesiaType int(4),
    apo_LocalAnaesthetic bit(1) NOT NULL,
    apo_HasSedation bit(1) NOT NULL
);

CREATE TABLE plannedoperationprocedure (
    plp_id int(4) NOT NULL
);

CREATE TABLE PlannedOperationProcedure (
    Id int(4) NOT NULL,
    ProcedureId int(4) NOT NULL,
    QualifierId int(4),
    ProcedureDescription nvarchar(510),
    ProcedureOpcsCode nvarchar(510),
    QualifierDescription nvarchar(510),
    QualifierOpcsCode nvarchar(510),
    Laterality int(4)
);

CREATE TABLE plannedoperationproceduredefault (
    ppd_id int(4) NOT NULL,
    ppd_pro_id int(4),
    ppd_ant_id int(4),
    ppd_lks_id_anaesthesiatype int(4)
);

CREATE TABLE plannedoperationprocedurelog (
    plp_ObjectId int(4) NOT NULL,
    plp_id int(4) NOT NULL,
    plp_pln_id int(4) NOT NULL,
    plp_pro_id int(4) NOT NULL,
    plp_bod_id int(4) NOT NULL,
    plp_narative nvarchar(510),
    plp_DateAdded datetime(8) NOT NULL,
    plp_AddedBy uniqueidentifier(16) NOT NULL,
    plp_TransactionId uniqueidentifier(16) NOT NULL,
    plp_Action char(1) NOT NULL
);

CREATE TABLE plannedoperationprocedurequalifier (
    pnq_id int(4) NOT NULL,
    pnq_pqt_id int(4),
    pnq_order int(4) NOT NULL
);

CREATE TABLE plannedoperationprocedurequalifierlog (
    pnq_ObjectId int(4) NOT NULL,
    pnq_id int(4) NOT NULL,
    pnq_plp_id int(4) NOT NULL,
    pnq_pqt_id int(4),
    pnq_pqi_id int(4),
    pnq_order int(4) NOT NULL,
    pnq_DateAdded datetime(8) NOT NULL,
    pnq_AddedBy uniqueidentifier(16) NOT NULL,
    pnq_TransactionId uniqueidentifier(16) NOT NULL,
    pnq_Action char(1) NOT NULL
);

CREATE TABLE PlannedOperationProcedureQualifierRemovalBackup (
    pnq_id int(4) NOT NULL,
    pnq_plp_id int(4) NOT NULL,
    pnq_pqt_id int(4),
    pnq_pqi_id int(4),
    pnq_order int(4) NOT NULL,
    pnq_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE PlannedOperationProcedureRemovalBackup (
    plp_id int(4) NOT NULL,
    plp_pln_id int(4) NOT NULL,
    plp_pro_id int(4) NOT NULL,
    plp_bod_id int(4) NOT NULL,
    plp_narative nvarchar(510),
    plp_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE PlannedOperationRemovalBackup (
    pop_id int(4) NOT NULL,
    pop_pln_id int(4) NOT NULL,
    pop_date_listed datetime(8) NOT NULL,
    pop_lks_id_intervaltype int(4),
    pop_interval int(4),
    pop_op_date datetime(8),
    pop_lks_id_visittype int(4),
    pop_lks_id_anaesthesiatype int(4),
    pop_use_id_enterby uniqueidentifier(16),
    pop_sedation bit(1),
    pop_lks_id_priority int(4),
    pop_op_admission_date datetime(8),
    pop_op_admission_time time(5),
    pop_arrivaltime time(5),
    pop_starttime time(5),
    pop_dayspreop int(4),
    pop_op_loc_id uniqueidentifier(16),
    pop_comments nvarchar(-1),
    pop_pc_location_id uniqueidentifier(16),
    pop_pc_date datetime(8),
    pop_pc_use_id_consultant uniqueidentifier(16),
    pop_lks_id_asagrade int(4),
    pop_op_time varchar(5),
    pop_op_weeks int(4),
    pop_op_admit_lead int(4),
    pop_op_use_id_consultant uniqueidentifier(16),
    pop_op_daycase bit(1),
    pop_op_waitlistinitiative bit(1),
    pop_op_privatepatient bit(1),
    pop_op_directbooking bit(1),
    pop_unplanned bit(1),
    pop_duration int(4),
    pop_lks_id_suitable bit(1),
    pop_cancelled bit(1),
    pop_theatretime int(4),
    pop_cpw_id int(4),
    pop_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE PlannedProcedureMedication (
    dpm_id int(4) NOT NULL
);

CREATE TABLE PlannedProcedureMedicationItem (
    dmi_id int(4) NOT NULL,
    dmi_dpm_id int(4) NOT NULL,
    dmi_bod_id int(4),
    dmi_mcn_id int(4) NOT NULL,
    dmi_dro_id int(4) NOT NULL,
    dmi_dco_id int(4) NOT NULL,
    dmi_use_id_PrescribedBy uniqueidentifier(16) NOT NULL,
    dmi_PrescribedDate datetime(8) NOT NULL,
    dmi_AdditionalNotes nvarchar(500),
    dmi_StartDateDayAfterSurgery bit(1) NOT NULL
);

CREATE TABLE PlannedProcedureMedicationItemLog (
    dmi_id int(4) NOT NULL,
    dmi_ObjectId int(4) NOT NULL,
    dmi_DateAdded datetime(8) NOT NULL,
    dmi_AddedBy uniqueidentifier(16) NOT NULL,
    dmi_Transactionid uniqueidentifier(16) NOT NULL,
    dmi_Action char(1) NOT NULL,
    dmi_dpm_id int(4) NOT NULL,
    dmi_bod_id int(4),
    dmi_mcn_id int(4) NOT NULL,
    dmi_dro_id int(4) NOT NULL,
    dmi_dco_id int(4) NOT NULL,
    dmi_use_id_PrescribedBy uniqueidentifier(16) NOT NULL,
    dmi_PrescribedDate datetime(8) NOT NULL,
    dmi_AdditionalNotes nvarchar(500),
    dmi_StartDateDayAfterSurgery bit(1) NOT NULL
);

CREATE TABLE PlannedProcedureMedicationLog (
    dpm_id int(4) NOT NULL,
    dpm_ObjectId int(4) NOT NULL,
    dpm_DateAdded datetime(8) NOT NULL,
    dpm_AddedBy uniqueidentifier(16) NOT NULL,
    dpm_Transactionid uniqueidentifier(16) NOT NULL,
    dpm_Action char(1) NOT NULL,
    dpm_pln_id int(4) NOT NULL,
    dpm_dsc_id int(4) NOT NULL,
    dpm_NotRequired bit(1) NOT NULL
);

CREATE TABLE plannedvisit (
    nvi_id int(4) NOT NULL,
    nvi_loc_id uniqueidentifier(16),
    nvi_visittime time(5),
    nvi_lks_id_followupby int(4),
    nvi_use_id_followupby uniqueidentifier(16),
    nvi_lks_id_visitstatus int(4),
    nvi_lks_id_intervaltype int(4),
    nvi_lks_id_visittype int(4),
    nvi_interval int(4),
    nvi_urgency smallint(2),
    nvi_repeatprocedure bit(1),
    nvi_clt_id int(4),
    nvi_flagvisit int(4),
    nvi_Instructions varchar(2000),
    nvi_clt_ClinicListClinicId int(4),
    nvi_csc_PlannedInClinicId int(4),
    nvi_IsSharedCare bit(1) NOT NULL,
    nvi_SharedCarePortalSharingConsent bit(1)
);

CREATE TABLE PlannedVisitInstructions (
    PatientClinicalPlanId int(4) NOT NULL,
    InstructionsLookupDataId int(4) NOT NULL
);

CREATE TABLE planpersonnel (
    ppl_id int(4) NOT NULL,
    ppl_lks_id_personnel uniqueidentifier(16) NOT NULL
);

CREATE TABLE PlanPersonnelRemovalBackup (
    ppl_id int(4) NOT NULL,
    ppl_pln_id int(4) NOT NULL,
    ppl_use_id uniqueidentifier(16) NOT NULL,
    ppl_lks_id_personnel uniqueidentifier(16) NOT NULL,
    ppl_acp_id int(4) NOT NULL,
    ppl_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE PlatePosition (
    pos_SurgeonDefaultId int(4) NOT NULL,
    pos_lqu_Position int(4) NOT NULL,
    pos_bod_id int(4) NOT NULL
);

CREATE TABLE PlatePositionLog (
    pos_SurgeonDefaultId int(4) NOT NULL,
    pos_ObjectId int(4) NOT NULL,
    pos_DateAdded datetime(8) NOT NULL,
    pos_AddedBy uniqueidentifier(16) NOT NULL,
    pos_TransactionId uniqueidentifier(16) NOT NULL,
    pos_Action char(1) NOT NULL,
    pos_lqu_Position int(4) NOT NULL,
    pos_bod_id int(4) NOT NULL
);

CREATE TABLE Plication (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    SutureId int(4),
    AmountOfSurgery float(8) NOT NULL,
    SutureId int(4)
);

CREATE TABLE PlicationLog (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    SutureId int(4),
    AmountOfSurgery float(8) NOT NULL,
    SutureId int(4)
);

CREATE TABLE Positioning (
    acp_act_ActivityId uniqueidentifier(16) NOT NULL,
    acp_Comments nvarchar(4000)
);

CREATE TABLE PositioningLog (
    acp_act_ActivityId int(4) NOT NULL,
    acp_ObjectId uniqueidentifier(16) NOT NULL,
    acp_DateAdded datetime(8) NOT NULL,
    acp_AddedBy uniqueidentifier(16) NOT NULL,
    acp_Transactionid uniqueidentifier(16) NOT NULL,
    acp_Action char(1) NOT NULL,
    acp_Comments nvarchar(4000)
);

CREATE TABLE PositioningOptionItem (
    aps_acp_ActivityId uniqueidentifier(16) NOT NULL,
    aps_lqu_Positioning int(4) NOT NULL
);

CREATE TABLE PositioningOptionItemLog (
    aps_acp_ActivityId int(4) NOT NULL,
    aps_ObjectId uniqueidentifier(16) NOT NULL,
    aps_DateAdded datetime(8) NOT NULL,
    aps_AddedBy uniqueidentifier(16) NOT NULL,
    aps_Transactionid uniqueidentifier(16) NOT NULL,
    aps_Action char(1) NOT NULL,
    aps_lqu_Positioning int(4) NOT NULL
);

CREATE TABLE PositionOfGaze (
    Id int(4) NOT NULL,
    PositionOfGaze nvarchar(120) NOT NULL
);

CREATE TABLE PostAdjustment (
    Id int(4) NOT NULL,
    DiplopiaPostAdjustment bit(1) NOT NULL,
    DistanceHorizontalDeviationId int(4),
    NearHorizontalDeviationId int(4),
    DistanceVerticalDeviationId int(4),
    NearVerticalDeviationId int(4)
);

CREATE TABLE PostAdjustmentLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    DiplopiaPostAdjustment bit(1) NOT NULL,
    DistanceHorizontalDeviationId int(4),
    NearHorizontalDeviationId int(4),
    DistanceVerticalDeviationId int(4),
    NearVerticalDeviationId int(4)
);

CREATE TABLE PostHorizontalDeviation (
    Id int(4) NOT NULL,
    HorizontalPostAdjustmentId int(4),
    PostAdjustmentDistanceId int(4),
    Deviation int(4)
);

CREATE TABLE PostHorizontalDeviationLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    HorizontalPostAdjustmentId int(4),
    PostAdjustmentDistanceId int(4),
    Deviation int(4)
);

CREATE TABLE PostOpSutureAdjustment (
    ActivityId uniqueidentifier(16) NOT NULL,
    PreAdjustmentId int(4) NOT NULL,
    OtherId int(4) NOT NULL,
    AdjustmentId int(4) NOT NULL,
    PostAdjustmentId int(4),
    SurgicalCompletionId int(4)
);

CREATE TABLE PostOpSutureAdjustmentLog (
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PreAdjustmentId int(4) NOT NULL,
    OtherId int(4) NOT NULL,
    AdjustmentId int(4) NOT NULL,
    PostAdjustmentId int(4),
    SurgicalCompletionId int(4)
);

CREATE TABLE Posture (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE PostureAtHome (
    Id int(4) NOT NULL,
    PosturesId int(4) NOT NULL,
    PostureId int(4),
    Hours int(4),
    TimeOfDay int(4),
    Days int(4)
);

CREATE TABLE PostureAtHomeLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PostureId int(4),
    Hours int(4),
    TimeOfDay int(4),
    Days int(4),
    PosturesId int(4) NOT NULL
);

CREATE TABLE PostureItem (
    Id int(4) NOT NULL,
    PosturesId int(4) NOT NULL,
    PostureId int(4) NOT NULL,
    Duration int(4),
    TimeOfDay_LookupId int(4),
    Days int(4),
    DurationUnitId int(4)
);

CREATE TABLE PostureItemLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PosturesId int(4) NOT NULL,
    PostureId int(4) NOT NULL,
    Duration int(4),
    TimeOfDay_LookupId int(4),
    Days int(4),
    DurationUnitId int(4)
);

CREATE TABLE PostureOnWard (
    Id int(4) NOT NULL,
    PosturesId int(4) NOT NULL,
    PostureId int(4),
    Duration int(4),
    DurationUnitId int(4)
);

CREATE TABLE PostureOnWardLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PostureId int(4),
    Duration int(4),
    DurationUnitId int(4),
    PosturesId int(4) NOT NULL
);

CREATE TABLE Postures (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    OnWardComments varchar(256),
    AtHomeComments varchar(256),
    Comments nvarchar(512)
);

CREATE TABLE PostureSetting (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL
);

CREATE TABLE PosturesLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    OnWardComments varchar(256),
    ActivityId uniqueidentifier(16) NOT NULL,
    PostureSettingId int(4) NOT NULL,
    AtHomeComments varchar(256),
    Comments nvarchar(512)
);

CREATE TABLE PostVerticalDeviation (
    Id int(4) NOT NULL,
    VerticalPostAdjustmentId int(4),
    PostAdjustmentDistanceId int(4),
    Deviation int(4)
);

CREATE TABLE PostVerticalDeviationLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    VerticalPostAdjustmentId int(4),
    PostAdjustmentDistanceId int(4),
    Deviation int(4)
);

CREATE TABLE practice (
    pra_id uniqueidentifier(16) NOT NULL,
    pra_name nvarchar(510),
    pra_type int(4),
    pra_OpenDate datetime(8),
    pra_CloseDate datetime(8),
    pra_UpdateDateTime datetime(8) NOT NULL,
    pra_prd_PractitionerDataSourceId int(4),
    pra_Active bit(1) NOT NULL,
    pra_LocalCode nvarchar(510),
    pra_CcgCode nvarchar(510),
    pra_Region nvarchar(510)
);

CREATE TABLE practiceaddresslink (
    pak_id int(4) NOT NULL,
    pak_addressno tinyint(1) NOT NULL,
    pak_main bit(1) NOT NULL
);

CREATE TABLE PracticeAddressLinkBackup (
    pak_id int(4) NOT NULL,
    pak_add_id uniqueidentifier(16) NOT NULL,
    pak_pra_id uniqueidentifier(16) NOT NULL,
    pak_addressno tinyint(1) NOT NULL,
    pak_main bit(1) NOT NULL,
    InsertDateTime datetime(8)
);

CREATE TABLE practiceaddresslinklog (
    pak_ObjectId int(4) NOT NULL,
    pak_id int(4) NOT NULL,
    pak_add_id uniqueidentifier(16) NOT NULL,
    pak_pra_id uniqueidentifier(16) NOT NULL,
    pak_addressno tinyint(1) NOT NULL,
    pak_main bit(1) NOT NULL,
    pak_DateAdded datetime(8) NOT NULL,
    pak_AddedBy uniqueidentifier(16) NOT NULL,
    pak_TransactionId uniqueidentifier(16) NOT NULL,
    pak_Action char(1) NOT NULL
);

CREATE TABLE PracticeBackup (
    pra_id uniqueidentifier(16) NOT NULL,
    pra_code varchar(255) NOT NULL,
    pra_name varchar(255) NOT NULL,
    pra_type int(4),
    pra_OpenDate datetime(8),
    pra_CloseDate datetime(8),
    pra_UpdateDateTime datetime(8) NOT NULL,
    insertDateTime datetime(8)
);

CREATE TABLE PracticeLink (
    PracticeId uniqueidentifier(16) NOT NULL,
    LinkedPracticeId uniqueidentifier(16) NOT NULL
);

CREATE TABLE PracticeLinkImportHistory (
    Id int(4) NOT NULL,
    FileName nvarchar(510) NOT NULL,
    ImportSuccessful bit(1) NOT NULL,
    DateImported datetime2(6) NOT NULL,
    ImportResults nvarchar(-1)
);

CREATE TABLE practicelog (
    pra_ObjectId uniqueidentifier(16) NOT NULL,
    pra_id int(4) NOT NULL,
    pra_code varchar(255) NOT NULL,
    pra_name nvarchar(510),
    pra_type int(4),
    pra_DateAdded datetime(8) NOT NULL,
    pra_AddedBy uniqueidentifier(16) NOT NULL,
    pra_TransactionId uniqueidentifier(16) NOT NULL,
    pra_Action char(1) NOT NULL,
    pra_OpenDate datetime(8),
    pra_CloseDate datetime(8),
    pra_UpdateDateTime datetime(8),
    pra_prd_PractitionerDataSourceId int(4),
    pra_Active bit(1),
    pra_LocalCode nvarchar(510),
    pra_CcgCode nvarchar(510),
    pra_Region nvarchar(510)
);

CREATE TABLE PracticeRegion (
    prn_id smallint(2) NOT NULL,
    prn_description nvarchar(510) NOT NULL
);

CREATE TABLE practicestopractitioners (
    practice_id uniqueidentifier(16) NOT NULL,
    practitioner_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE PracticeType (
    pra_type int(4) NOT NULL
);

CREATE TABLE practitioner (
    ptr_id uniqueidentifier(16) NOT NULL,
    ptr_title nvarchar(510),
    ptr_jobtitle nvarchar(510),
    ptr_pasid int(4),
    ptr_lks_id_specialty int(4),
    ptr_forename nvarchar(510),
    ptr_lks_id_gender int(4),
    ptr_prn_RegionId smallint(2),
    ptr_SpecialtyFreeText nvarchar(-1),
    ptr_prd_PractitionerDataSourceId int(4),
    ptr_Active bit(1) NOT NULL
);

CREATE TABLE practitionercontact (
    ptc_id uniqueidentifier(16) NOT NULL,
    ptc_ptr_id uniqueidentifier(16) NOT NULL,
    ptc_value nvarchar(510),
    ptc_lks_id_contact int(4) NOT NULL,
    ptc_preferred bit(1) NOT NULL
);

CREATE TABLE practitionercontactlog (
    ptc_ObjectId uniqueidentifier(16) NOT NULL,
    ptc_id int(4) NOT NULL,
    ptc_ptr_id uniqueidentifier(16) NOT NULL,
    ptc_value nvarchar(510),
    ptc_lks_id_contact int(4) NOT NULL,
    ptc_preferred bit(1) NOT NULL,
    ptc_DateAdded datetime(8) NOT NULL,
    ptc_AddedBy uniqueidentifier(16) NOT NULL,
    ptc_TransactionId uniqueidentifier(16) NOT NULL,
    ptc_Action char(1) NOT NULL
);

CREATE TABLE PractitionerDataSource (
    prd_id int(4) NOT NULL,
    prd_description varchar(255) NOT NULL
);

CREATE TABLE practitionerlog (
    ptr_ObjectId uniqueidentifier(16) NOT NULL,
    ptr_id int(4) NOT NULL,
    ptr_code varchar(255) NOT NULL,
    ptr_title nvarchar(510),
    ptr_surname nvarchar(510),
    ptr_jobtitle nvarchar(510),
    ptr_pasid int(4),
    ptr_typemembership int(4),
    ptr_lks_id_specialty int(4),
    ptr_forename nvarchar(510),
    ptr_lks_id_gender int(4),
    ptr_DateAdded datetime(8) NOT NULL,
    ptr_AddedBy uniqueidentifier(16) NOT NULL,
    ptr_TransactionId uniqueidentifier(16) NOT NULL,
    ptr_Action char(1) NOT NULL,
    ptr_prn_RegionId smallint(2),
    ptr_SpecialtyFreeText nvarchar(-1),
    ptr_prd_PractitionerDataSourceId int(4),
    ptr_Active bit(1)
);

CREATE TABLE PractitionerPatchType (
    prp_id int(4) NOT NULL,
    prp_pty_id int(4) NOT NULL,
    prp_prd_id int(4) NOT NULL,
    prp_ptt_id int(4) NOT NULL,
    prp_autoupdate bit(1) NOT NULL,
    prp_datelastautoupdated datetime(8)
);

CREATE TABLE PractitionerPracticeTypeMismatch (
    Id int(4) NOT NULL,
    EventDate datetime2(6) NOT NULL,
    PatientDemographicStorePractitionerId int(4) NOT NULL,
    PatientId uniqueidentifier(16),
    PractitionerCode varchar(255) NOT NULL,
    PractitionerType int(4) NOT NULL,
    PracticeCode varchar(255) NOT NULL,
    PracticeType int(4) NOT NULL
);

CREATE TABLE PractitionersWithoutCode_BackUp_20191115 (
    dpr_id int(4),
    dpr_pdm_id int(4),
    dpr_practitionercode nvarchar(510),
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4),
    dpr_email nvarchar(510),
    dpr_mobilephonenumber nvarchar(510),
    dpr_faxnumber nvarchar(510),
    dpr_specialtyfreetext nvarchar(510)
);

CREATE TABLE PractitionersWithoutCode_BackUp_20191115143957 (
    dpr_id int(4),
    dpr_pdm_id int(4),
    dpr_practitionercode nvarchar(510),
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4),
    dpr_email nvarchar(510),
    dpr_mobilephonenumber nvarchar(510),
    dpr_faxnumber nvarchar(510),
    dpr_specialtyfreetext nvarchar(510)
);

CREATE TABLE practitionertype (
    ptt_id int(4) NOT NULL,
    ptt_description nvarchar(510),
    ptt_displayorder int(4),
    ptt_helpmessage nvarchar(2048),
    ptt_available bit(1) NOT NULL
);

CREATE TABLE PreAdjustment (
    Id int(4) NOT NULL,
    DiplopiaPreAdjustmentId int(4) NOT NULL,
    Comments nvarchar(1000),
    DistanceHorizontalDeviationId int(4),
    NearHorizontalDeviationId int(4),
    DistanceVerticalDeviationId int(4),
    NearVerticalDeviationId int(4)
);

CREATE TABLE PreAdjustmentDistance (
    Id int(4) NOT NULL
);

CREATE TABLE PreAdjustmentLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    DiplopiaPreAdjustmentId int(4) NOT NULL,
    Comments nvarchar(1000),
    DistanceHorizontalDeviationId int(4),
    NearHorizontalDeviationId int(4),
    DistanceVerticalDeviationId int(4),
    NearVerticalDeviationId int(4)
);

CREATE TABLE PreConfiguration (
    epc_Id int(4) NOT NULL,
    epc_Name nvarchar(510) NOT NULL,
    epc_Label nvarchar(50) NOT NULL,
    epc_IconTooltip nvarchar(2000) NOT NULL,
    epc_CleanUpTimeSecondsReadOnly bit(1) NOT NULL,
    epc_set_SettingId int(4)
);

CREATE TABLE PreHorizontalDeviation (
    Id int(4) NOT NULL,
    HorizontalPreAdjustmentId int(4),
    PreAdjustmentDistanceId int(4),
    Deviation int(4)
);

CREATE TABLE PreHorizontalDeviationLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    HorizontalPreAdjustmentId int(4),
    PreAdjustmentDistanceId int(4),
    Deviation int(4)
);

CREATE TABLE Preparation (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    HorizontalTargetId int(4),
    HorizontalTargetId int(4),
    VerticalTargetId int(4),
    VerticalTargetId int(4),
    CycloTargetId int(4),
    CycloTargetId int(4),
    TargetConditionId int(4),
    TargetConditionId int(4),
    TargetConditionCorrectionId int(4),
    TargetConditionCorrectionId int(4),
    StaySutureId int(4),
    VasoconstrictiveAgentId int(4),
    FDT nvarchar(1000),
    StaySutureId int(4),
    PeritomyId int(4)
);

CREATE TABLE PreparationLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    HorizontalTargetId int(4),
    HorizontalTargetId int(4),
    VerticalTargetId int(4),
    VerticalTargetId int(4),
    CycloTargetId int(4),
    CycloTargetId int(4),
    TargetConditionId int(4),
    TargetConditionId int(4),
    TargetConditionCorrectionId int(4),
    TargetConditionCorrectionId int(4),
    StaySutureId int(4),
    VasoconstrictiveAgentId int(4),
    FDT nvarchar(1000),
    StaySutureId int(4),
    PeritomyId int(4)
);

CREATE TABLE PreVerticalDeviation (
    Id int(4) NOT NULL,
    VerticalPreAdjustmentId int(4),
    PreAdjustmentDistanceId int(4),
    Deviation int(4)
);

CREATE TABLE PreVerticalDeviationLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    VerticalPreAdjustmentId int(4),
    PreAdjustmentDistanceId int(4),
    Deviation int(4)
);

CREATE TABLE PrimaryIndication (
    pri_id int(4) NOT NULL,
    pri_description nvarchar(160) NOT NULL,
    pri_order int(4) NOT NULL,
    pri_available bit(1) NOT NULL,
    pri_cpt_id_defaultconcept int(4)
);

CREATE TABLE PrimaryIndicationDrugLink (
    pdl_id int(4) NOT NULL
);

CREATE TABLE PrismVergence (
    prv_Id int(4) NOT NULL,
    prv_ActivityId uniqueidentifier(16) NOT NULL,
    prv_PrismLookupDataId int(4),
    prv_Correction int(4),
    prv_ResultLookupDataId int(4),
    prv_RecoveryLookupDataId int(4),
    prv_Comments nvarchar(5000)
);

CREATE TABLE PrismVergenceLog (
    prv_Id int(4) NOT NULL,
    prv_ObjectId int(4) NOT NULL,
    prv_DateAdded datetime(8) NOT NULL,
    prv_AddedBy uniqueidentifier(16) NOT NULL,
    prv_Transactionid uniqueidentifier(16) NOT NULL,
    prv_Action char(1) NOT NULL,
    prv_ActivityId uniqueidentifier(16) NOT NULL,
    prv_PrismLookupDataId int(4),
    prv_Correction int(4),
    prv_ResultLookupDataId int(4),
    prv_RecoveryLookupDataId int(4),
    prv_Comments nvarchar(5000)
);

CREATE TABLE ProblemsWithInstillation (
    Id int(4) NOT NULL,
    ProblemsWithInstillation_LookupDataId int(4) NOT NULL,
    DropsComplianceActivityId uniqueidentifier(16) NOT NULL
);

CREATE TABLE ProblemsWithInstillationLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ProblemsWithInstillation_LookupDataId int(4) NOT NULL,
    DropsComplianceActivityId uniqueidentifier(16)
);

CREATE TABLE Procedure (
    apr_Id int(4) NOT NULL,
    apr_ProcedureId int(4) NOT NULL
);

CREATE TABLE procedureactivityrules (
    pru_id int(4) NOT NULL,
    pru_aty_id int(4) NOT NULL,
    pru_useabbreviation bit(1) NOT NULL,
    pru_ApplyOrdering bit(1) NOT NULL
);

CREATE TABLE procedureactivitytypegroup (
    pag_id int(4) NOT NULL,
    pag_description varchar(200)
);

CREATE TABLE procedureactivitytypegroupitem (
    ati_id int(4) NOT NULL,
    ati_pag_id int(4) NOT NULL,
    ati_pro_id int(4) NOT NULL,
    ati_aty_id int(4) NOT NULL
);

CREATE TABLE ProcedureActivityTypeQualifierItem (
    paq_Id int(4) NOT NULL
);

CREATE TABLE procedureadditionalprocedures (
    pdp_id int(4) NOT NULL,
    pdp_pas_id int(4) NOT NULL,
    pdp_pro_id int(4) NOT NULL,
    pdp_order int(4) NOT NULL,
    pdp_available bit(1) NOT NULL,
    pdp_pqi_id int(4)
);

CREATE TABLE procedureadditionalprocedureset (
    pas_id int(4) NOT NULL,
    pas_description varchar(255) NOT NULL,
    pas_pro_id int(4) NOT NULL,
    pas_categorywide bit(1) NOT NULL
);

CREATE TABLE ProcedureCode (
    hpc_hmm_ModalityId int(4),
    hpc_Code nvarchar(200) NOT NULL,
    hpc_Description nvarchar(510) NOT NULL,
    hpc_CodingSystem nvarchar(200) NOT NULL,
    hpc_ScheduledTimeInMinutes int(4) NOT NULL,
    hpc_Id int(4) NOT NULL
);

CREATE TABLE ProcedureCodeClinicalStudyLink (
    psl_std_ClinicalStudyId int(4) NOT NULL,
    psl_hpc_ProcedureCodeId int(4) NOT NULL
);

CREATE TABLE ProcedureFactorsIncreasingSurgicalDifficulty (
    osd_ListQuestionId int(4) NOT NULL,
    osd_ProcedureId int(4) NOT NULL,
    osd_Available bit(1) NOT NULL
);

CREATE TABLE procedureindicationlimit (
    oin_id int(4) NOT NULL,
    oin_combination int(4) NOT NULL,
    oin_oct_id int(4) NOT NULL,
    oin_combinationlimit int(4) NOT NULL
);

CREATE TABLE procedurelink (
    pkp_id int(4) NOT NULL,
    pkp_pro_id_linked int(4) NOT NULL,
    pkp_pkt_id int(4) NOT NULL
);

CREATE TABLE procedurelinktype (
    pkt_id int(4) NOT NULL,
    pkt_desc varchar(100) NOT NULL
);

CREATE TABLE procedureoptions (
    prq_id int(4) NOT NULL
);

CREATE TABLE procedureoptionslog (
    prq_ObjectId int(4) NOT NULL,
    prq_id int(4) NOT NULL,
    prq_pro_id int(4) NOT NULL,
    prq_lks_id_option int(4),
    prq_answer tinyint(1) NOT NULL,
    prq_DateAdded datetime(8) NOT NULL,
    prq_AddedBy uniqueidentifier(16) NOT NULL,
    prq_TransactionId uniqueidentifier(16) NOT NULL,
    prq_Action char(1) NOT NULL
);

CREATE TABLE procedurepostopprescription (
    ppp_id int(4) NOT NULL,
    ppp_pro_id int(4),
    ppp_oct_id int(4),
    ppp_drs_id int(4) NOT NULL,
    ppp_contextflag int(4),
    ppp_cfd_id int(4),
    ppp_pqi_id int(4),
    ppp_anyqualifier bit(1) NOT NULL
);

CREATE TABLE procedureproblemresolution (
    ppc_id int(4) NOT NULL,
    ppc_cfd_id int(4),
    ppc_cpt_id int(4),
    ppc_action tinyint(1) NOT NULL
);

CREATE TABLE procedurequalifier (
    pql_id int(4) NOT NULL,
    pql_pro_id int(4) NOT NULL,
    pql_pqt_id int(4),
    pql_flag int(4) NOT NULL
);

CREATE TABLE procedurequalifiergroup (
    pqg_id int(4) NOT NULL
);

CREATE TABLE ProcedureQualifierGroupChartConfiguration (
    Id int(4) NOT NULL,
    ProcedureQualifierGroupId int(4) NOT NULL,
    ChartAxisDescription nvarchar(512),
    ChartColor varchar(256)
);

CREATE TABLE procedurequalifiergroupitem (
    pgi_id int(4) NOT NULL
);

CREATE TABLE ProcedureQualifierGroupIVITypeMapping (
    Id int(4) NOT NULL,
    ProcedureQualifierGroupId int(4) NOT NULL,
    IVITypeId int(4) NOT NULL
);

CREATE TABLE procedurequalifieritem (
    pqi_id int(4) NOT NULL,
    pqi_pqt_id int(4) NOT NULL,
    pqi_description nvarchar(510),
    pqi_code varchar(30),
    pqi_abbreviation nvarchar(510),
    pqi_descriptionex nvarchar(510),
    pqi_order int(4) NOT NULL,
    pqi_flag int(4) NOT NULL,
    pqi_available bit(1),
    pqi_procedurecodeoverride varchar(255),
    pqi_snomed bigint(8)
);

CREATE TABLE procedurequalifieritemdrug (
    pqd_id int(4) NOT NULL,
    pqd_dosenumericvalue float(8) NOT NULL,
    pqd_ddt_id int(4),
    pqd_dfm_id int(4),
    pqd_displaydose bit(1),
    pqd_opcscode varchar(255),
    pqd_trial bit(1),
    pqd_notes nvarchar(510)
);

CREATE TABLE ProcedureQualifierItemDrugDuplicateMedicationRemovalBackup (
    pqd_id int(4) NOT NULL,
    pqd_pqi_id int(4) NOT NULL,
    pqd_dmy_id int(4),
    pqd_dbr_id int(4),
    pqd_dosenumericvalue float(8),
    pqd_ddt_id int(4),
    pqd_dfm_id int(4),
    pqd_displaydose bit(1),
    pqd_opcscode varchar(255),
    pqd_trial bit(1),
    pqd_lks_id_category int(4),
    pqd_notes nvarchar(510),
    pqd_moietydescriptionoverride nvarchar(510),
    pqd_branddescriptionoverride nvarchar(510)
);

CREATE TABLE procedurequalifieritemexclusion (
    pqx_id int(4) NOT NULL,
    pqx_pqi_id int(4) NOT NULL,
    pqx_availableinsearch bit(1) NOT NULL,
    pqx_fallback_pqi_id int(4)
);

CREATE TABLE procedurequalifiertype (
    pqt_id int(4) NOT NULL,
    pqt_description nvarchar(510),
    pqt_lkt_id_list int(4),
    pqt_flag int(4) NOT NULL,
    pqt_procedurequalifierseparator nvarchar(200),
    pqt_qualifierconcatenationtype int(4) NOT NULL,
    pqt_abbreviationqualifieronly bit(1) NOT NULL,
    pqt_procedurequalifierabbreviationseparator nvarchar(200)
);

CREATE TABLE procedurequestionmapping (
    pqm_id int(4) NOT NULL,
    pqm_pqi_id int(4),
    pqm_lkt_id int(4),
    pqm_lks_id int(4),
    pqm_lqs_id int(4),
    pqm_lqu_id int(4),
    pqm_mappingdirection int(4) NOT NULL,
    pqm_active bit(1) NOT NULL,
    pqm_aty_id int(4)
);

CREATE TABLE procedures (
    pro_id int(4) NOT NULL,
    pro_abbreviation nvarchar(510),
    pro_description nvarchar(510),
    pro_snomedcode varchar(255),
    pro_readcode varchar(255),
    pro_opcscode varchar(255),
    pro_hrgcode varchar(255),
    pro_defaultduration tinyint(1),
    pro_oct_id int(4),
    pro_order int(4),
    pro_cpt_defaultindication int(4),
    pro_available bit(1),
    pro_flag int(4),
    pro_legacy bit(1),
    pro_lks_id_lensstatus int(4),
    pro_requiresqualifiers bit(1),
    pro_clinic bit(1),
    pro_theatre bit(1),
    pro_DisplayOrder int(4)
);

CREATE TABLE procedureset (
    pst_id int(4) NOT NULL,
    pst_abbreviation varchar(255),
    pst_description nvarchar(510),
    pst_members int(4),
    pst_maxindications int(4)
);

CREATE TABLE proceduresetitem (
    psi_id int(4) NOT NULL
);

CREATE TABLE ProceduresGUID (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE ProcedureSubSection (
    Id int(4) NOT NULL
);

CREATE TABLE proceduresynonym (
    psy_id int(4) NOT NULL
);

CREATE TABLE Programme (
    Id int(4) NOT NULL,
    IsActive bit(1) NOT NULL
);

CREATE TABLE ProgrammeExtractDefinition (
    Id int(4) NOT NULL,
    ProgrammeId int(4) NOT NULL,
    Name nvarchar(200) NOT NULL
);

CREATE TABLE ProteinData (
    upo_id int(4) NOT NULL,
    upo_available bit(1) NOT NULL
);

CREATE TABLE Protocol (
    ipp_id int(4) NOT NULL,
    ipp_protocol nvarchar(160) NOT NULL,
    ipp_available bit(1) NOT NULL
);

CREATE TABLE QuadrantType (
    Id int(4) NOT NULL,
    HfaReferenceDescription nvarchar(510) NOT NULL
);

CREATE TABLE Qualifier (
    pqs_Id int(4) NOT NULL,
    pqs_AntimetaboliteProcedureId int(4) NOT NULL,
    pqs_ProcedureQualifierItemId int(4) NOT NULL
);

CREATE TABLE QualifierStrength (
    pqa_Id int(4) NOT NULL
);

CREATE TABLE QualifierType (
    bqt_id int(4) NOT NULL,
    bqt_description nvarchar(510)
);

CREATE TABLE Query (
    squ_Id int(4) NOT NULL,
    squ_OriginalValue nvarchar(4000),
    squ_sqs_StatusId int(4) NOT NULL,
    squ_lks_TypeId int(4),
    squ_Text nvarchar(500) NOT NULL,
    squ_use_LastUpdatedUserId uniqueidentifier(16) NOT NULL,
    squ_LastUpdatedDate datetime(8) NOT NULL
);

CREATE TABLE QueryLog (
    squ_Id int(4) NOT NULL,
    squ_ObjectId int(4) NOT NULL,
    squ_DateAdded datetime(8) NOT NULL,
    squ_AddedBy uniqueidentifier(16) NOT NULL,
    squ_Transactionid uniqueidentifier(16) NOT NULL,
    squ_Action char(1) NOT NULL,
    squ_OriginalValue nvarchar(4000),
    squ_sqs_StatusId int(4) NOT NULL,
    squ_lks_TypeId int(4),
    squ_Text nvarchar(500) NOT NULL,
    squ_use_LastUpdatedUserId uniqueidentifier(16) NOT NULL,
    squ_LastUpdatedDate datetime(8) NOT NULL
);

CREATE TABLE QueryResponse (
    sqr_Id int(4) NOT NULL,
    sqr_squ_QueryId int(4) NOT NULL,
    sqr_use_LastUpdatedUserId uniqueidentifier(16) NOT NULL,
    sqr_LastUpdatedDate datetime(8) NOT NULL,
    sqr_Comment nvarchar(500) NOT NULL,
    sqr_IsAdditionalComment bit(1) NOT NULL
);

CREATE TABLE QueryResponseLog (
    sqr_Id int(4) NOT NULL,
    sqr_ObjectId int(4) NOT NULL,
    sqr_DateAdded datetime(8) NOT NULL,
    sqr_AddedBy uniqueidentifier(16) NOT NULL,
    sqr_Transactionid uniqueidentifier(16) NOT NULL,
    sqr_Action char(1) NOT NULL,
    sqr_squ_QueryId int(4) NOT NULL,
    sqr_use_LastUpdatedUserId uniqueidentifier(16) NOT NULL,
    sqr_LastUpdatedDate datetime(8) NOT NULL,
    sqr_Comment nvarchar(500) NOT NULL,
    sqr_IsAdditionalComment bit(1) NOT NULL
);

CREATE TABLE QueryStatus (
    sqs_Id int(4) NOT NULL,
    sqs_Description nvarchar(500) NOT NULL
);

CREATE TABLE Question (
    qui_Id int(4) NOT NULL,
    qui_Description nvarchar(510) NOT NULL,
    qui_eci_ItemTypeId int(4) NOT NULL
);

CREATE TABLE QuestionCheckList (
    dsq_lqu_id int(4) NOT NULL,
    dsq_lks_id int(4) NOT NULL
);

CREATE TABLE QuestionCheckListLog (
    dsq_lqu_id int(4) NOT NULL,
    dsq_ObjectId int(4) NOT NULL,
    dsq_DateAdded datetime(8) NOT NULL,
    dsq_AddedBy uniqueidentifier(16) NOT NULL,
    dsq_Transactionid uniqueidentifier(16) NOT NULL,
    dsq_Action char(1) NOT NULL,
    dsq_lks_id int(4) NOT NULL
);

CREATE TABLE QuestionLog (
    qui_Id int(4) NOT NULL,
    qui_ObjectId int(4) NOT NULL,
    qui_DateAdded datetime(8) NOT NULL,
    qui_AddedBy uniqueidentifier(16) NOT NULL,
    qui_Transactionid uniqueidentifier(16) NOT NULL,
    qui_Action char(1) NOT NULL,
    qui_Description nvarchar(510) NOT NULL,
    qui_eci_ItemTypeId int(4) NOT NULL,
    qui_UniqueKey uniqueidentifier(16)
);

CREATE TABLE Questionnaire (
    cpq_Id int(4) NOT NULL,
    cpq_Pin char(13) NOT NULL,
    cpq_CreatedOn datetime(8) NOT NULL,
    cpq_LastModifiedOn datetime(8) NOT NULL,
    cpq_RawScore int(4) NOT NULL,
    cpq_RaschMeasure decimal(5)
);

CREATE TABLE QuestionnaireAnswer (
    cpa_Id int(4) NOT NULL,
    cpa_QuestionScore int(4) NOT NULL
);

CREATE TABLE QuestionResponse (
    aqr_id int(4) NOT NULL,
    etq_Id int(4) NOT NULL,
    aqr_Description nvarchar(400) NOT NULL,
    aqr_IsDeleted bit(1) NOT NULL,
    aqr_Order int(4) NOT NULL,
    etq_FreeTextResponse nvarchar(1000),
    etq_NumericResponse float(8),
    etq_DateResponse datetime(8),
    etq_DatePrecisionTypeId int(4),
    etq_DecimalPlacesEntered int(4)
);

CREATE TABLE QuestionResponseLog (
    aqr_id int(4) NOT NULL,
    etq_Id int(4) NOT NULL,
    etq_ObjectId int(4) NOT NULL,
    aqr_ObjectId int(4) NOT NULL,
    aqr_DateAdded datetime(8) NOT NULL,
    etq_DateAdded datetime(8) NOT NULL,
    etq_AddedBy uniqueidentifier(16) NOT NULL,
    aqr_AddedBy uniqueidentifier(16) NOT NULL,
    aqr_Transactionid uniqueidentifier(16) NOT NULL,
    etq_Transactionid uniqueidentifier(16) NOT NULL,
    etq_Action char(1) NOT NULL,
    aqr_Action char(1) NOT NULL,
    aqr_Description nvarchar(400) NOT NULL,
    etq_ets_SectionId int(4) NOT NULL,
    etq_quv_QuestionVersionId int(4) NOT NULL,
    aqr_IsDeleted bit(1) NOT NULL,
    aqr_Order int(4) NOT NULL,
    etq_qrv_ResponseVersionId int(4),
    etq_bod_BodyPartId int(4) NOT NULL,
    aqr_UniqueKey uniqueidentifier(16),
    etq_FreeTextResponse nvarchar(1000),
    etq_NumericResponse float(8),
    etq_DateResponse datetime(8),
    etq_DatePrecisionTypeId int(4),
    etq_DecimalPlacesEntered int(4)
);

CREATE TABLE QuestionResponseVersion (
    qrv_id int(4) NOT NULL,
    erv_Id int(4) NOT NULL,
    erv_etq_QuestionResponseId int(4) NOT NULL,
    qrv_aqr_QuestionResponseId int(4) NOT NULL,
    qrv_Version int(4),
    erv_qrv_ResponseVersionId int(4) NOT NULL,
    qrv_Value nvarchar(400) NOT NULL,
    qrv_Order int(4) NOT NULL
);

CREATE TABLE QuestionResponseVersionLog (
    erv_Id int(4) NOT NULL,
    qrv_id int(4) NOT NULL,
    qrv_ObjectId int(4) NOT NULL,
    erv_ObjectId int(4) NOT NULL,
    erv_DateAdded datetime(8) NOT NULL,
    qrv_DateAdded datetime(8) NOT NULL,
    qrv_AddedBy uniqueidentifier(16) NOT NULL,
    erv_AddedBy uniqueidentifier(16) NOT NULL,
    erv_Transactionid uniqueidentifier(16) NOT NULL,
    qrv_TransactionId uniqueidentifier(16) NOT NULL,
    qrv_Action char(1) NOT NULL,
    erv_Action char(1) NOT NULL,
    erv_etq_QuestionResponseId int(4) NOT NULL,
    qrv_aqr_QuestionResponseId int(4) NOT NULL,
    qrv_Version int(4),
    erv_qrv_ResponseVersionId int(4) NOT NULL,
    qrv_Value nvarchar(400) NOT NULL,
    qrv_Order int(4) NOT NULL,
    qrv_UniqueKey uniqueidentifier(16) NOT NULL
);

CREATE TABLE QuestionsResponse (
    qqr_qui_QuestionId int(4) NOT NULL,
    qqr_aqr_QuestionResponseId int(4) NOT NULL
);

CREATE TABLE QuestionsResponseVersion (
    qqr_quv_QuestionVersionId int(4) NOT NULL,
    qqr_qrv_QuestionResponseVersionId int(4) NOT NULL
);

CREATE TABLE QuestionVersion (
    quv_eiv_ItemVersionId int(4) NOT NULL,
    quv_qui_QuestionId int(4) NOT NULL,
    quv_Mandatory bit(1) NOT NULL,
    quv_qrv_TriggerQuestionResponseVersionId int(4),
    quv_qrv_DefaultQuestionResponseVersionId int(4),
    quv_DefaultNumeric float(8),
    quv_DefaultNumericDecimalPlaces int(4),
    quv_DefaultCurrentDate bit(1),
    quv_DefaultFreeText nvarchar(510)
);

CREATE TABLE QuestionVersionLog (
    quv_eiv_ItemVersionId int(4) NOT NULL,
    quv_ObjectId int(4) NOT NULL,
    quv_DateAdded datetime(8) NOT NULL,
    quv_AddedBy uniqueidentifier(16) NOT NULL,
    quv_TransactionId uniqueidentifier(16) NOT NULL,
    quv_Action char(1) NOT NULL,
    quv_qui_QuestionId int(4) NOT NULL,
    quv_Mandatory bit(1) NOT NULL,
    quv_qrv_TriggerQuestionResponseVersionId int(4),
    quv_qrv_DefaultQuestionResponseVersionId int(4),
    quv_DefaultNumeric float(8),
    quv_DefaultNumericDecimalPlaces int(4),
    quv_DefaultCurrentDate bit(1),
    quv_DefaultFreeText nvarchar(510)
);

CREATE TABLE Queue (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    QueuedTime datetime2(8) NOT NULL,
    PriorityId int(4) NOT NULL,
    StatusId int(4) NOT NULL,
    StatusId int(4) NOT NULL,
    StatusChangedTime datetime2(8) NOT NULL,
    DateCreated datetime(8) NOT NULL,
    LastModified datetime(8) NOT NULL,
    QueueProcessorId int(4),
    AttemptedRetries int(4)
);

CREATE TABLE QueueAudit (
    Id int(4) NOT NULL,
    QueueId int(4) NOT NULL,
    ProcessingStartTime datetime2(8) NOT NULL,
    ProcessingEndTime datetime2(8) NOT NULL,
    QueueProcessorId int(4) NOT NULL,
    FailureReason varchar(-1),
    ErrorGroupId int(4)
);

CREATE TABLE QueueLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PriorityId int(4) NOT NULL,
    StatusId int(4) NOT NULL,
    DateCreated datetime(8) NOT NULL,
    LastModified datetime(8) NOT NULL,
    AttemptedRetries int(4),
    HumphreyTestId int(4) NOT NULL
);

CREATE TABLE QueuePatientNumber (
    Id int(4) NOT NULL,
    QueueId int(4) NOT NULL,
    PatientNumber varchar(255) NOT NULL,
    IsPrimary bit(1) NOT NULL
);

CREATE TABLE QueuePatientNumberAudit (
    Id int(4) NOT NULL,
    QueueAuditId int(4) NOT NULL,
    PatientNumber varchar(255) NOT NULL,
    IsPrimary bit(1) NOT NULL
);

CREATE TABLE QueuePriority (
    Id int(4) NOT NULL,
    Description nvarchar(100) NOT NULL
);

CREATE TABLE QueueProcessor (
    Id int(4) NOT NULL,
    Active bit(1) NOT NULL,
    LastSeen datetime(8) NOT NULL
);

CREATE TABLE QueueStatus (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    Description nvarchar(100) NOT NULL,
    Name varchar(20)
);

CREATE TABLE ReasonsConfigurationItem (
    usi_id int(4) NOT NULL
);

CREATE TABLE ReceivedPackage (
    rpk_Id int(4) NOT NULL,
    rpk_Description nvarchar(500) NOT NULL,
    rpk_ReceivedDate datetime(8) NOT NULL,
    rpk_PublishedDate datetime(8) NOT NULL,
    rpk_PublishedBy nvarchar(200) NOT NULL,
    rpk_PayloadHash varchar(64) NOT NULL
);

CREATE TABLE ReceivedPackageArtefact (
    rpa_Id int(4) NOT NULL,
    rpa_Identifier uniqueidentifier(16) NOT NULL,
    rpk_PayloadHash varchar(64) NOT NULL,
    rpk_Installed bit(1) NOT NULL
);

CREATE TABLE Recession (
    SubSectionId int(4) NOT NULL,
    PseudotendonExcised float(8),
    MuscleFoundAt float(8) NOT NULL,
    AmountOfSurgery float(8) NOT NULL,
    TechniqueId int(4),
    SutureId int(4)
);

CREATE TABLE RecessionLog (
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PseudotendonExcised float(8),
    MuscleFoundAt float(8) NOT NULL,
    AmountOfSurgery float(8) NOT NULL,
    TechniqueId int(4),
    SutureId int(4)
);

CREATE TABLE RecessionResection (
    SubSectionId int(4) NOT NULL,
    SutureId int(4),
    TechniqueId int(4)
);

CREATE TABLE RecessionResectionLog (
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    SutureId int(4),
    TechniqueId int(4)
);

CREATE TABLE RecessionTechnique (
    Id int(4) NOT NULL
);

CREATE TABLE RecipientExplanatorySentence (
    DocumentRecipientId int(4) NOT NULL,
    PrimaryRecipient nvarchar(1000) NOT NULL,
    Sender nvarchar(1000) NOT NULL,
    CopyFor nvarchar(1000) NOT NULL
);

CREATE TABLE RecipientExplanatorySentenceLog (
    DocumentRecipientId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PrimaryRecipient nvarchar(1000) NOT NULL,
    Sender nvarchar(1000) NOT NULL,
    CopyFor nvarchar(1000) NOT NULL
);

CREATE TABLE RecordedValues (
    urv_id int(4) NOT NULL,
    urv_ubl_id int(4),
    urv_ubd_id int(4),
    urv_ugl_id int(4),
    urv_ukt_id int(4),
    urv_uly_id int(4),
    urv_unt_id int(4),
    urv_uph_id int(4),
    urv_upo_id int(4),
    urv_usg_id int(4),
    urv_uub_id int(4),
    urv_utb_id int(4),
    urv_uco_id int(4)
);

CREATE TABLE RecordedValuesLog (
    urv_id int(4) NOT NULL,
    urv_act_id uniqueidentifier(16) NOT NULL,
    urv_ubl_id int(4),
    urv_ubd_id int(4),
    urv_ugl_id int(4),
    urv_ukt_id int(4),
    urv_uly_id int(4),
    urv_unt_id int(4),
    urv_uph_id int(4),
    urv_upo_id int(4),
    urv_usg_id int(4),
    urv_uub_id int(4),
    urv_utb_id int(4),
    urv_uco_id int(4),
    urv_DateAdded datetime(8) NOT NULL,
    urv_AddedBy uniqueidentifier(16) NOT NULL,
    urv_TransactionId uniqueidentifier(16) NOT NULL,
    urv_Action char(1) NOT NULL
);

CREATE TABLE RecoveryOptions (
    Id int(4) NOT NULL,
    RecoveryName nvarchar(50) NOT NULL
);

CREATE TABLE Reference (
    brf_Id int(4) NOT NULL
);

CREATE TABLE ReferenceDataVersion (
    PackageTypeId int(4) NOT NULL,
    Name nvarchar(512) NOT NULL,
    Version nvarchar(100) NOT NULL,
    DateVersionReported datetime(8) NOT NULL
);

CREATE TABLE ReferenceLog (
    brf_Id int(4) NOT NULL,
    brf_pat_id uniqueidentifier(16),
    brf_PatientNumber nvarchar(60) NOT NULL,
    brf_BillingReference nvarchar(60) NOT NULL,
    brf_CaseNumber nvarchar(60),
    brf_EventDate datetime2(6) NOT NULL,
    brf_VisitCategory nvarchar(100),
    brf_Class nvarchar(60),
    brf_Service nvarchar(100),
    brf_Location nvarchar(100),
    brf_ObjectId int(4) NOT NULL,
    brf_DateAdded datetime(8) NOT NULL,
    brf_AddedBy uniqueidentifier(16) NOT NULL,
    brf_TransactionId uniqueidentifier(16) NOT NULL,
    brf_Action char(1) NOT NULL,
    brf_pdm_PatientDemographicStoreId int(4),
    brf_Deleted bit(1),
    brf_LocationSegment nvarchar(100),
    brf_Movement nvarchar(398),
    brf_AdmissionDate datetime2(6),
    brf_DischargeDate datetime2(6)
);

CREATE TABLE referral (
    rfl_id int(4) NOT NULL
);

CREATE TABLE ReferralGUID (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE referrallog (
    rfl_ObjectId int(4) NOT NULL,
    rfl_act_id uniqueidentifier(16) NOT NULL,
    rfl_dateofreferral datetime(8) NOT NULL,
    rfl_datereceived datetime(8),
    rfl_priority int(4) NOT NULL,
    rfl_prf_id int(4),
    rfl_id int(4) NOT NULL,
    rfl_DateAdded datetime(8) NOT NULL,
    rfl_AddedBy uniqueidentifier(16) NOT NULL,
    rfl_TransactionId uniqueidentifier(16) NOT NULL,
    rfl_Action char(1) NOT NULL
);

CREATE TABLE referralprimarilyreferredfortype (
    prf_description nvarchar(1000),
    prf_order int(4) NOT NULL,
    prf_parent int(4),
    prf_available bit(1) NOT NULL,
    prf_id int(4) NOT NULL
);

CREATE TABLE ReferralPriority (
    Id int(4) NOT NULL,
    Description nvarchar(40) NOT NULL
);

CREATE TABLE ReferralRequest (
    RequestId int(4) NOT NULL,
    DateOfReferral date(3) NOT NULL,
    PriorityId int(4) NOT NULL,
    SourceOfReferralId int(4)
);

CREATE TABLE ReferralSource (
    Id int(4) NOT NULL,
    Description nvarchar(100) NOT NULL
);

CREATE TABLE referralsource (
    rfs_rft_id int(4) NOT NULL,
    rfs_ptr_id uniqueidentifier(16),
    rfs_id int(4) NOT NULL,
    rfs_deleted bit(1) NOT NULL
);

CREATE TABLE referralsourcelog (
    rfs_ObjectId int(4) NOT NULL,
    rfs_rfl_id int(4) NOT NULL,
    rfs_rft_id int(4) NOT NULL,
    rfs_ptr_id uniqueidentifier(16),
    rfs_id int(4) NOT NULL,
    rfs_deleted bit(1) NOT NULL,
    rfs_DateAdded datetime(8) NOT NULL,
    rfs_AddedBy uniqueidentifier(16) NOT NULL,
    rfs_TransactionId uniqueidentifier(16) NOT NULL,
    rfs_Action char(1) NOT NULL
);

CREATE TABLE referralsourcetype (
    rft_id int(4) NOT NULL,
    rft_description nvarchar(1000),
    rft_order int(4) NOT NULL,
    rft_parent int(4),
    rft_ptt_id int(4)
);

CREATE TABLE referralsourcetypespecialty (
    sts_id int(4) NOT NULL,
    sts_rft_id int(4) NOT NULL,
    sts_lks_specialty int(4) NOT NULL,
    sts_include bit(1) NOT NULL
);

CREATE TABLE refraction (
    ref_id int(4) NOT NULL,
    ref_bod_id int(4),
    ref_sphere float(8),
    ref_cylinder float(8),
    ref_axis float(8),
    ref_add float(8),
    ref_addat int(4),
    ref_pd float(8),
    ref_ipd float(8),
    ref_pdt_historicdate uniqueidentifier(16),
    ref_prismrange1 decimal(5),
    ref_prismrange2 decimal(5),
    ref_lks_id_prismbase1 int(4),
    ref_lks_id_prismbase2 int(4),
    ref_cycloplegiate bit(1),
    ref_lks_id_type int(4),
    ref_lks_id_glasses int(4),
    ref_lks_id_reflexclarity int(4),
    ref_lks_id_reflexshape int(4),
    ref_lks_id_orthophoric int(4),
    ref_wd int(4),
    ref_distancetype int(4),
    ref_maddoxhorizontal decimal(5),
    ref_maddoxvertical decimal(5),
    ref_bvd int(4),
    ref_binocularbalance varchar(5),
    ref_lks_id_wdincluded int(4),
    ref_lks_id_workingdistance int(4),
    ref_meridian1 decimal(5),
    ref_meridian2 decimal(5),
    ref_power1 float(8),
    ref_power2 float(8),
    ref_lks_id_wdcorrection int(4),
    ref_balance int(4),
    ref_deleted bit(1) NOT NULL,
    ref_sphericalequivalent float(8)
);

CREATE TABLE refractionlog (
    ref_ObjectId int(4) NOT NULL,
    ref_id int(4) NOT NULL,
    ref_act_id uniqueidentifier(16),
    ref_bod_id int(4),
    ref_sphere float(8),
    ref_cylinder float(8),
    ref_axis float(8),
    ref_add float(8),
    ref_addat int(4),
    ref_pd float(8),
    ref_ipd float(8),
    ref_pdt_historicdate uniqueidentifier(16),
    ref_prismrange1 decimal(5),
    ref_prismrange2 decimal(5),
    ref_lks_id_prismbase1 int(4),
    ref_lks_id_prismbase2 int(4),
    ref_cycloplegiate bit(1),
    ref_lks_id_type int(4),
    ref_lks_id_glasses int(4),
    ref_lks_id_reflexclarity int(4),
    ref_lks_id_reflexshape int(4),
    ref_lks_id_orthophoric int(4),
    ref_wd int(4),
    ref_distancetype int(4),
    ref_maddoxhorizontal decimal(5),
    ref_maddoxvertical decimal(5),
    ref_bvd int(4),
    ref_binocularbalance varchar(5),
    ref_lks_id_wdincluded int(4),
    ref_lks_id_workingdistance int(4),
    ref_meridian1 decimal(5),
    ref_meridian2 decimal(5),
    ref_power1 float(8),
    ref_power2 float(8),
    ref_lks_id_wdcorrection int(4),
    ref_balance int(4),
    ref_DateAdded datetime(8) NOT NULL,
    ref_AddedBy uniqueidentifier(16) NOT NULL,
    ref_TransactionId uniqueidentifier(16) NOT NULL,
    ref_Action char(1) NOT NULL,
    ref_sphericalequivalent float(8),
    ref_deleted bit(1)
);

CREATE TABLE RegressionLineSplit (
    rls_Id int(4) NOT NULL,
    rls_pmd_MedicationId int(4),
    rls_prl_OperationProcedureId int(4),
    rls_bod_BodyPartId int(4) NOT NULL,
    rls_SplitDate datetime2(6) NOT NULL,
    rls_NotRecordedOnEmrReason nvarchar(400)
);

CREATE TABLE RegressionLineSplitLog (
    rls_Id int(4) NOT NULL,
    rls_pat_PatientId uniqueidentifier(16) NOT NULL,
    rls_use_UserRecordedBy uniqueidentifier(16) NOT NULL,
    rls_pmd_MedicationId int(4),
    rls_prl_OperationProcedureId int(4),
    rls_bod_BodyPartId int(4) NOT NULL,
    rls_SplitDate datetime2(6) NOT NULL,
    rls_NotRecordedOnEmrReason nvarchar(400),
    rls_DateRecorded datetime2(7) NOT NULL,
    rls_ObjectId int(4) NOT NULL,
    rls_DateAdded datetime(8) NOT NULL,
    rls_AddedBy uniqueidentifier(16) NOT NULL,
    rls_Transactionid uniqueidentifier(16) NOT NULL,
    rls_Action char(1) NOT NULL,
    rls_Deleted bit(1) NOT NULL,
    rls_DateDeleted datetime2(7),
    rls_use_UserDeletedBy uniqueidentifier(16)
);

CREATE TABLE Relative (
    fhr_id int(4) NOT NULL,
    fhr_description nvarchar(100),
    fhr_frg_id int(4) NOT NULL,
    fhr_order int(4) NOT NULL,
    fhr_available bit(1) NOT NULL
);

CREATE TABLE RelativeGroup (
    frg_id int(4) NOT NULL,
    frg_description nvarchar(100)
);

CREATE TABLE ReleaseVersion (
    etr_Id int(4) NOT NULL
);

CREATE TABLE ReliabilityThreshold (
    rlt_Id int(4) NOT NULL,
    rlt_Description nvarchar(510) NOT NULL,
    rlt_Threshold int(4)
);

CREATE TABLE ReliabilityThresholdLog (
    rlt_ObjectId int(4) NOT NULL,
    rlt_Id int(4) NOT NULL,
    rlt_Description nvarchar(510) NOT NULL,
    rlt_Threshold int(4),
    rlt_DateAdded datetime(8) NOT NULL,
    rlt_AddedBy uniqueidentifier(16) NOT NULL,
    rlt_TransactionId uniqueidentifier(16) NOT NULL,
    rlt_Action char(1) NOT NULL
);

CREATE TABLE Request (
    Id int(4) NOT NULL,
    Json nvarchar(-1),
    PatientId int(4),
    DateTimeReceived datetime2(6) NOT NULL,
    EncounterId uniqueidentifier(16),
    PartnerId int(4)
);

CREATE TABLE RequestExternalPatient (
    RequestId int(4) NOT NULL,
    ExternalPatientId nvarchar(510),
    ExternalPatientIdDataTypeId int(4),
    ExternalPartnerCode nvarchar(510)
);

CREATE TABLE RequestLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Json nvarchar(-1),
    EndpointId int(4) NOT NULL,
    StatusId int(4) NOT NULL,
    PatientMatchId int(4),
    PatientId int(4),
    DateTimeReceived datetime2(6) NOT NULL,
    EncounterId uniqueidentifier(16),
    PartnerId int(4)
);

CREATE TABLE RequestProcessFailure (
    RequestId int(4) NOT NULL,
    FailureReason nvarchar(-1),
    StackTrace varchar(-1)
);

CREATE TABLE RequestProcessWarning (
    RequestId int(4) NOT NULL,
    Warning nvarchar(-1) NOT NULL
);

CREATE TABLE RequestResponseAudit (
    Id int(4) NOT NULL,
    RequestBody nvarchar(-1) NOT NULL,
    RequestDateTime datetime2(6) NOT NULL,
    Payload nvarchar(-1),
    PayloadDataType varchar(100),
    ErrorResponse nvarchar(-1),
    PartnerKey uniqueidentifier(16)
);

CREATE TABLE RequestStatus (
    Id int(4) NOT NULL,
    RequestStatus nvarchar(200)
);

CREATE TABLE Resource (
    rso_id int(4) NOT NULL,
    rso_description nvarchar(2000) NOT NULL,
    rso_available bit(1) NOT NULL
);

CREATE TABLE ResourceLog (
    rso_Id int(4) NOT NULL,
    rso_description nvarchar(2000) NOT NULL,
    rso_available bit(1) NOT NULL,
    rso_ObjectId int(4) NOT NULL,
    rso_DateAdded datetime(8) NOT NULL,
    rso_AddedBy uniqueidentifier(16) NOT NULL,
    rso_TransactionId uniqueidentifier(16) NOT NULL,
    rso_Action char(1) NOT NULL
);

CREATE TABLE ResourceUser (
    clu_id int(4) NOT NULL,
    clu_use_id uniqueidentifier(16) NOT NULL,
    clu_rso_id int(4) NOT NULL,
    clu_active bit(1) NOT NULL
);

CREATE TABLE ResourceUserLog (
    clu_Id int(4) NOT NULL,
    clu_use_id uniqueidentifier(16) NOT NULL,
    clu_rso_id int(4) NOT NULL,
    clu_active bit(1) NOT NULL,
    clu_ObjectId int(4) NOT NULL,
    clu_DateAdded datetime(8) NOT NULL,
    clu_AddedBy uniqueidentifier(16) NOT NULL,
    clu_TransactionId uniqueidentifier(16) NOT NULL,
    clu_Action char(1) NOT NULL
);

CREATE TABLE Response (
    Id int(4) NOT NULL,
    Description nvarchar(200) NOT NULL
);

CREATE TABLE Result (
    pre_Id int(4) NOT NULL,
    pre_PcrProbabilityPercentage decimal(5) NOT NULL,
    pre_RiskMultiple decimal(5) NOT NULL
);

CREATE TABLE ReviewOfPatientHistory (
    rph_act_id uniqueidentifier(16) NOT NULL,
    rph_PatientMedicalRecordChecked bit(1) NOT NULL,
    rph_Comments nvarchar(4000),
    rph_HistoryChangeAcknowledged bit(1)
);

CREATE TABLE ReviewOfPatientHistoryLog (
    rph_act_id int(4) NOT NULL,
    rph_ObjectId uniqueidentifier(16) NOT NULL,
    rph_DateAdded datetime(8) NOT NULL,
    rph_AddedBy uniqueidentifier(16) NOT NULL,
    rph_Transactionid uniqueidentifier(16) NOT NULL,
    rph_Action char(1) NOT NULL,
    rph_PatientMedicalRecordChecked bit(1) NOT NULL,
    rph_Comments nvarchar(4000),
    rph_HistoryChangeAcknowledged bit(1)
);

CREATE TABLE ReviewOfSystems (
    ros_id int(4) NOT NULL,
    ros_act_id uniqueidentifier(16) NOT NULL,
    ros_noRelevantFindings bit(1) NOT NULL,
    ros_comments nvarchar(-1)
);

CREATE TABLE ReviewOfSystemsLog (
    ros_ObjectId int(4) NOT NULL,
    ros_id int(4) NOT NULL,
    ros_act_id uniqueidentifier(16) NOT NULL,
    ros_noRelevantFindings bit(1) NOT NULL,
    ros_comments nvarchar(-1),
    ros_DateAdded datetime(8) NOT NULL,
    ros_AddedBy uniqueidentifier(16) NOT NULL,
    ros_TransactionId uniqueidentifier(16) NOT NULL,
    ros_Action char(1) NOT NULL
);

CREATE TABLE ReviewType (
    smr_Id int(4) NOT NULL,
    smr_Description nvarchar(200) NOT NULL
);

CREATE TABLE Riboflavin (
    ActivityId uniqueidentifier(16) NOT NULL,
    Id int(4) NOT NULL,
    TotalSoakTime int(4),
    TotalSoakTime int(4),
    Frequency int(4),
    Frequency int(4),
    FrequencyUnitId int(4),
    FrequencyUnitId int(4),
    IontophoresisUsed bit(1) NOT NULL,
    IontophoresisUsed bit(1),
    IontophoresisCurrent decimal(5),
    IontophoresisCurrent decimal(5),
    IontophoresisDuration int(4),
    IontophoresisDuration int(4)
);

CREATE TABLE RiboflavinFrequencyUnit (
    Id int(4) NOT NULL
);

CREATE TABLE RiboflavinLog (
    ActivityId int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    TotalSoakTime int(4),
    TotalSoakTime int(4),
    Frequency int(4),
    Frequency int(4),
    FrequencyUnitId int(4),
    FrequencyUnitId int(4),
    IontophoresisUsed bit(1),
    IontophoresisUsed bit(1) NOT NULL,
    IontophoresisCurrent decimal(5),
    IontophoresisCurrent decimal(5),
    IontophoresisDuration int(4),
    IontophoresisDuration int(4)
);

CREATE TABLE RiboflavinPreparation (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL
);

CREATE TABLE RiboflavinPreparationLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL,
    StaticId int(4)
);

CREATE TABLE RiboflavinPreparations (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    PreparationId int(4) NOT NULL,
    PreparationId int(4) NOT NULL
);

CREATE TABLE RiboflavinPreparationsLog (
    Id int(4) NOT NULL,
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    PreparationId int(4) NOT NULL,
    PreparationId int(4) NOT NULL
);

CREATE TABLE RiskFactorCoPathology (
    prc_Id int(4) NOT NULL
);

CREATE TABLE RiskFactorCoPathologyRiskGroup (
    prg_Id int(4) NOT NULL
);

CREATE TABLE RiskFactors (
    prf_Id int(4) NOT NULL,
    prf_Age int(4),
    prf_lks_GenderId int(4),
    prf_PostCode nvarchar(40),
    prf_AbleToLieFlat bit(1),
    prf_AlphaBlockers bit(1)
);

CREATE TABLE RiskLevel (
    Id int(4) NOT NULL,
    Description nvarchar(60) NOT NULL,
    IsHighRisk bit(1) NOT NULL
);

CREATE TABLE RiskLevelLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Description nvarchar(60) NOT NULL,
    IsHighRisk bit(1) NOT NULL
);

CREATE TABLE RiskScoreActivity (
    ActivityId uniqueidentifier(16) NOT NULL,
    PathwayVersionId int(4) NOT NULL,
    PathwayRiskScoreId int(4),
    RedFlags bit(1) NOT NULL,
    PlusFactors bit(1) NOT NULL,
    Comments nvarchar(4000)
);

CREATE TABLE RiskScoreActivityLog (
    ActivityId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PathwayVersionId int(4) NOT NULL,
    PathwayRiskScoreId int(4),
    RedFlags bit(1) NOT NULL,
    PlusFactors bit(1) NOT NULL,
    Comments nvarchar(4000)
);

CREATE TABLE SavedExam (
    ose_ExamId int(4) NOT NULL,
    ose_LogId int(4) NOT NULL,
    ose_ExamTypeId int(4) NOT NULL,
    ose_bod_BodyPartId int(4) NOT NULL,
    ose_StudyDateTime datetime2(7) NOT NULL,
    ose_DeviceName nvarchar(200),
    ose_DeviceSerialNumber nvarchar(200),
    ose_StudyTitle nvarchar(200),
    ose_Id int(4) NOT NULL
);

CREATE TABLE SavedExamLog (
    ose_Id int(4) NOT NULL,
    ose_LogId int(4) NOT NULL,
    ose_pei_PatientExternalIdentifierId int(4) NOT NULL,
    ose_ect_EncounterId uniqueidentifier(16) NOT NULL,
    ose_ExamTypeId int(4) NOT NULL,
    ose_bod_BodyPartId int(4) NOT NULL,
    ose_StudyDateTime datetime2(7) NOT NULL,
    ose_DeviceName nvarchar(200),
    ose_DeviceSerialNumber nvarchar(200),
    ose_StudyTitle nvarchar(200),
    ose_ObjectId int(4) NOT NULL,
    ose_DateAdded datetime(8) NOT NULL,
    ose_AddedBy uniqueidentifier(16) NOT NULL,
    ose_Transactionid uniqueidentifier(16) NOT NULL,
    ose_Action char(1) NOT NULL,
    ose_ExamId int(4) NOT NULL
);

CREATE TABLE ScanNotification (
    hsn_Id int(4) NOT NULL,
    hsn_Device nvarchar(80),
    hsn_SeriesType nvarchar(400) NOT NULL,
    hsn_SeriesDescription nvarchar(400),
    hsn_DateTimeOfScan datetime2(7) NOT NULL,
    hsn_bod_BodyPartId int(4) NOT NULL,
    hsn_SubjectId nvarchar(50) NOT NULL,
    hsn_AccessionNumber nvarchar(44) NOT NULL,
    hsn_StudyInstanceUid nvarchar(400) NOT NULL,
    hsn_ClusterId uniqueidentifier(16),
    hsn_ClusterDateTime datetime2(7),
    hsn_sns_ScanNotificationSourceId int(4) NOT NULL,
    hsn_hst_ScanTypeId int(4) NOT NULL
);

CREATE TABLE ScanNotificationSource (
    sns_Id int(4) NOT NULL,
    sns_Description nvarchar(200) NOT NULL
);

CREATE TABLE ScanPattern (
    esp_id int(4) NOT NULL,
    esp_Description nvarchar(500) NOT NULL
);

CREATE TABLE ScanType (
    hst_Id int(4) NOT NULL
);

CREATE TABLE Schedule (
    csc_id int(4) NOT NULL,
    csc_newpatient bit(1),
    csc_manual bit(1),
    csc_appointmentid varchar(255),
    csc_dateAdded datetime(8) NOT NULL,
    csc_rso_id int(4),
    csc_clp_id int(4) NOT NULL,
    csc_use_AddedManuallyByUser uniqueidentifier(16),
    csc_lastupdated datetime(8)
);

CREATE TABLE ScheduleLog (
    csc_Id int(4) NOT NULL,
    csc_clt_id int(4),
    csc_clinicdatetime datetime(8),
    csc_newpatient bit(1),
    csc_manual bit(1),
    csc_appointmentid varchar(255),
    csc_rso_id int(4),
    csc_clp_id int(4) NOT NULL,
    csc_use_AddedManuallyByUser uniqueidentifier(16),
    csc_lastupdated datetime(8),
    csc_ObjectId int(4) NOT NULL,
    csc_DateAdded datetime(8) NOT NULL,
    csc_dateDeleted datetime(8),
    csc_AddedBy uniqueidentifier(16) NOT NULL,
    csc_TransactionId uniqueidentifier(16) NOT NULL,
    csc_Action char(1) NOT NULL
);

CREATE TABLE Schema (
    SchemaVersion int(4) NOT NULL
);

CREATE TABLE Sclerostomy (
    sld_sft_id int(4) NOT NULL,
    sld_lks_Technique int(4),
    sld_Width float(8),
    sld_Height float(8)
);

CREATE TABLE SclerostomyLog (
    sld_sft_id int(4) NOT NULL,
    sld_ObjectId int(4) NOT NULL,
    sld_DateAdded datetime(8) NOT NULL,
    sld_AddedBy uniqueidentifier(16) NOT NULL,
    sld_Transactionid uniqueidentifier(16) NOT NULL,
    sld_Action char(1) NOT NULL,
    sld_lks_Technique int(4),
    sld_Width float(8),
    sld_Height float(8)
);

CREATE TABLE Screening (
    ActivityId uniqueidentifier(16) NOT NULL,
    DateOfScreening date(3) NOT NULL,
    DateOfNotification date(3),
    DiabeticEyeScreeningPathwayId int(4) NOT NULL,
    NoteForOphthalmologist nvarchar(4000),
    Comments nvarchar(4000)
);

CREATE TABLE ScreeningEye (
    ActivityId uniqueidentifier(16) NOT NULL,
    BodyPartId int(4) NOT NULL,
    Retinopathy int(4) NOT NULL,
    Maculopathy int(4) NOT NULL,
    Photocoagulation int(4),
    Ungradable bit(1) NOT NULL,
    ImageQuality int(4)
);

CREATE TABLE ScreeningEyeLog (
    ActivityId int(4) NOT NULL,
    BodyPartId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Retinopathy int(4) NOT NULL,
    Maculopathy int(4) NOT NULL,
    Photocoagulation int(4),
    Ungradable bit(1) NOT NULL,
    ImageQuality int(4)
);

CREATE TABLE ScreeningLog (
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    DateOfScreening date(3) NOT NULL,
    DateOfNotification date(3),
    DiabeticEyeScreeningPathwayId int(4) NOT NULL,
    NoteForOphthalmologist nvarchar(4000),
    Comments nvarchar(4000),
    ActivityId int(4) NOT NULL
);

CREATE TABLE Section (
    das_id int(4) NOT NULL,
    ets_Id int(4) NOT NULL,
    abs_id int(4) NOT NULL,
    abs_Name nvarchar(200) NOT NULL,
    ets_eta_ActivityId uniqueidentifier(16) NOT NULL,
    das_DisplayName nvarchar(200),
    das_Description nvarchar(1000),
    ets_svr_SectionVersionId int(4) NOT NULL,
    abs_Lateralised bit(1) NOT NULL,
    abs_InvestigationsEnabled bit(1) NOT NULL,
    ets_eip_InvestigationItemId int(4),
    ets_IsDeleted bit(1) NOT NULL
);

CREATE TABLE SectionComment (
    etc_ets_SectionId int(4) NOT NULL,
    etc_bod_BodyPartId int(4) NOT NULL,
    etc_Comment nvarchar(4000) NOT NULL
);

CREATE TABLE SectionCommentLog (
    etc_ets_SectionId int(4) NOT NULL,
    etc_ObjectId int(4) NOT NULL,
    etc_DateAdded datetime(8) NOT NULL,
    etc_AddedBy uniqueidentifier(16) NOT NULL,
    etc_Transactionid uniqueidentifier(16) NOT NULL,
    etc_Action char(1) NOT NULL,
    etc_bod_BodyPartId int(4) NOT NULL,
    etc_Comment nvarchar(4000) NOT NULL
);

CREATE TABLE SectionItemVersion (
    sqv_svr_SectionVersionId int(4) NOT NULL,
    sqv_eiv_ItemVersionId int(4) NOT NULL
);

CREATE TABLE SectionLog (
    ets_Id int(4) NOT NULL,
    abs_id int(4) NOT NULL,
    abs_ObjectId int(4) NOT NULL,
    ets_ObjectId int(4) NOT NULL,
    ets_DateAdded datetime(8) NOT NULL,
    abs_DateAdded datetime(8) NOT NULL,
    abs_AddedBy uniqueidentifier(16) NOT NULL,
    ets_AddedBy uniqueidentifier(16) NOT NULL,
    ets_Transactionid uniqueidentifier(16) NOT NULL,
    abs_Transactionid uniqueidentifier(16) NOT NULL,
    abs_Action char(1) NOT NULL,
    ets_Action char(1) NOT NULL,
    ets_eta_ActivityId uniqueidentifier(16) NOT NULL,
    abs_Name nvarchar(200) NOT NULL,
    abs_Lateralised bit(1) NOT NULL,
    ets_svr_SectionVersionId int(4) NOT NULL,
    abs_UniqueKey uniqueidentifier(16),
    abs_InvestigationsEnabled bit(1) NOT NULL,
    ets_eip_InvestigationItemId int(4),
    ets_IsDeleted bit(1) NOT NULL
);

CREATE TABLE SectionVersion (
    svr_id int(4) NOT NULL,
    svr_Name nvarchar(200) NOT NULL,
    svr_PreviousSectionId int(4),
    svr_CommentsEnabled bit(1) NOT NULL,
    svr_Repeatable bit(1) NOT NULL
);

CREATE TABLE SectionVersionLog (
    svr_id int(4) NOT NULL,
    svr_ObjectId int(4) NOT NULL,
    svr_DateAdded datetime(8) NOT NULL,
    svr_AddedBy uniqueidentifier(16) NOT NULL,
    svr_TransactionId uniqueidentifier(16) NOT NULL,
    svr_Action char(1) NOT NULL,
    svr_abs_SectionId int(4) NOT NULL,
    svr_Name nvarchar(200),
    svr_Version int(4),
    svr_PreviousSectionId int(4),
    svr_CommentsEnabled bit(1) NOT NULL,
    svr_Repeatable bit(1) NOT NULL
);

CREATE TABLE SelectedActivityOrder (
    sao_Id int(4) NOT NULL
);

CREATE TABLE SelectedLocationForDevice (
    sld_dev_id uniqueidentifier(16) NOT NULL,
    sld_loc_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE SelectedLocationForDeviceLog (
    sld_dev_id int(4) NOT NULL,
    sld_ObjectId uniqueidentifier(16) NOT NULL,
    sld_DateAdded datetime(8) NOT NULL,
    sld_AddedBy uniqueidentifier(16) NOT NULL,
    sld_Transactionid uniqueidentifier(16) NOT NULL,
    sld_Action char(1) NOT NULL,
    sld_loc_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE SelectiveLaserTrabeculoplasty (
    sld_sdf_id int(4) NOT NULL,
    slt_ActivityId uniqueidentifier(16) NOT NULL,
    slt_SpotSize int(4),
    sld_SpotSize int(4),
    sld_EnergyPerPulse real(4),
    slt_Variable int(4) NOT NULL,
    slt_MinimumEnergyPerPulse decimal(5),
    slt_MaximumEnergyPerPulse decimal(5),
    slt_TotalEnergy decimal(5)
);

CREATE TABLE SelectiveLaserTrabeculoplastyLog (
    slt_ActivityId int(4) NOT NULL,
    sld_sdf_id int(4) NOT NULL,
    sld_ObjectId int(4) NOT NULL,
    slt_ObjectId uniqueidentifier(16) NOT NULL,
    slt_DateAdded datetime(8) NOT NULL,
    sld_DateAdded datetime(8) NOT NULL,
    sld_AddedBy uniqueidentifier(16) NOT NULL,
    slt_AddedBy uniqueidentifier(16) NOT NULL,
    slt_Transactionid uniqueidentifier(16) NOT NULL,
    sld_Transactionid uniqueidentifier(16) NOT NULL,
    sld_Action char(1) NOT NULL,
    slt_Action char(1) NOT NULL,
    slt_SpotSize int(4),
    sld_SpotSize int(4),
    sld_EnergyPerPulse real(4),
    slt_Variable int(4) NOT NULL,
    slt_MinimumEnergyPerPulse decimal(5),
    slt_MaximumEnergyPerPulse decimal(5),
    slt_TotalEnergy decimal(5)
);

CREATE TABLE Sentence (
    cus_id int(4) NOT NULL,
    cus_description nvarchar(-1) NOT NULL,
    cus_sentence nvarchar(-1) NOT NULL,
    cus_use_id_editedBy uniqueidentifier(16) NOT NULL,
    cus_editedDate datetime2(6) NOT NULL,
    cus_lastUsedDate datetime2(6)
);

CREATE TABLE ServiceVersion (
    vsv_Id int(4) NOT NULL,
    vsv_Version nvarchar(100) NOT NULL,
    vsv_DateVersionReported datetime2(6) NOT NULL
);

CREATE TABLE sessiondefaults (
    sni_id int(4) NOT NULL,
    sni_use_id uniqueidentifier(16),
    sni_spe_id int(4) NOT NULL,
    sni_use_id_consultant uniqueidentifier(16)
);

CREATE TABLE Setting (
    set_id int(4) NOT NULL,
    set_value nvarchar(4000),
    set_description nvarchar(2000),
    set_context int(4),
    set_per_id int(4),
    set_sdt_id int(4),
    set_lookup varchar(50),
    set_defaultable int(4),
    set_public bit(1),
    set_valuenumeric decimal(9),
    set_linkedsetting int(4),
    set_name nvarchar(510),
    set_snr_id int(4),
    set_valuetext varchar(255),
    set_blb_id uniqueidentifier(16),
    set_InitialisationVector varbinary(32)
);

CREATE TABLE SettingDataType (
    sdt_id int(4) NOT NULL
);

CREATE TABLE SettingGroup (
    sgr_id int(4) NOT NULL,
    sgr_description nvarchar(510) NOT NULL
);

CREATE TABLE SettingInterval (
    bst_id int(4) NOT NULL,
    bst_type tinyint(1) NOT NULL,
    bst_intervalno tinyint(1) NOT NULL,
    bst_from float(8),
    bst_to float(8),
    bst_value float(8)
);

CREATE TABLE SettingIntervalLog (
    bst_ObjectId int(4) NOT NULL,
    bst_id int(4) NOT NULL,
    bst_type tinyint(1) NOT NULL,
    bst_intervalno tinyint(1) NOT NULL,
    bst_from float(8),
    bst_to float(8),
    bst_value float(8),
    bst_DateAdded datetime(8) NOT NULL,
    bst_AddedBy uniqueidentifier(16) NOT NULL,
    bst_TransactionId uniqueidentifier(16) NOT NULL,
    bst_Action char(1) NOT NULL
);

CREATE TABLE settinglog (
    set_ObjectId int(4) NOT NULL,
    set_id int(4) NOT NULL,
    set_value nvarchar(4000),
    set_description nvarchar(2000),
    set_context int(4),
    set_per_id int(4),
    set_displaygroup nvarchar(510),
    set_lookup varchar(50),
    set_defaultable int(4),
    set_public bit(1),
    set_valuenumeric decimal(9),
    set_linkedsetting int(4),
    set_name nvarchar(510),
    set_DateAdded datetime(8) NOT NULL,
    set_AddedBy uniqueidentifier(16) NOT NULL,
    set_TransactionId uniqueidentifier(16) NOT NULL,
    set_Action char(1) NOT NULL,
    set_valuetext varchar(255),
    set_blb_id uniqueidentifier(16),
    set_sdt_id int(4),
    set_snr_id int(4),
    set_sgr_id int(4),
    set_InitialisationVector varbinary(32)
);

CREATE TABLE SettingNumericRange (
    snr_id int(4) NOT NULL,
    snr_min float(8) NOT NULL,
    snr_max float(8) NOT NULL
);

CREATE TABLE settings_backup (
    set_id int(4) NOT NULL,
    set_value varchar(255),
    set_description varchar(1000),
    set_context int(4),
    set_per_id int(4),
    set_displaygroup varchar(255),
    set_datatype int(4),
    set_lookup varchar(50),
    set_defaultable int(4),
    set_public bit(1),
    set_valuenumeric decimal(9),
    set_linkedsetting int(4),
    set_name varchar(255)
);

CREATE TABLE Severity (
    pfs_Id int(4) NOT NULL,
    pfs_Name nvarchar(100) NOT NULL,
    pfs_Order int(4) NOT NULL
);

CREATE TABLE SeverityLevel (
    dcl_Id int(4) NOT NULL,
    dcl_Severity nvarchar(512) NOT NULL
);

CREATE TABLE ShadingGraph (
    Id int(4) NOT NULL,
    Errors float(8),
    ShadingGraphTypeId int(4) NOT NULL,
    VisualFieldTestId int(4) NOT NULL
);

CREATE TABLE ShadingGraphData (
    Id int(4) NOT NULL,
    QuadrantWidth int(4) NOT NULL,
    QuadrantHeight int(4) NOT NULL,
    QuadrantTypeId int(4) NOT NULL,
    ShadingGraphId int(4) NOT NULL
);

CREATE TABLE ShadingGraphDataPoint (
    Id int(4) NOT NULL,
    ShadingGraphDataId int(4) NOT NULL,
    Value int(4) NOT NULL
);

CREATE TABLE ShadingGraphType (
    Id int(4) NOT NULL,
    HfaReferenceDescription nvarchar(510) NOT NULL
);

CREATE TABLE ShortcutGroup (
    Id int(4) NOT NULL,
    Name nvarchar(80) NOT NULL,
    ShownOnWebUI bit(1) NOT NULL,
    PreviousGroupId int(4),
    IsFavourite bit(1) NOT NULL
);

CREATE TABLE ShortcutGroupClinicalConcept (
    ShortcutGroupId int(4) NOT NULL,
    ClinicalConceptId int(4) NOT NULL
);

CREATE TABLE ShortcutGroupClinicalConceptLog (
    ShortcutGroupId int(4) NOT NULL,
    ClinicalConceptId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE ShortcutGroupLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Name nvarchar(80) NOT NULL,
    ShownOnWebUI bit(1) NOT NULL,
    PreviousGroupId int(4),
    IsFavourite bit(1)
);

CREATE TABLE ShortcutUserFavourite (
    ShortcutGroupId int(4) NOT NULL,
    UserId uniqueidentifier(16) NOT NULL,
    IsFavourite bit(1) NOT NULL
);

CREATE TABLE ShortcutUserFavouriteLog (
    ShortcutGroupId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    UserId uniqueidentifier(16) NOT NULL,
    IsFavourite bit(1) NOT NULL
);

CREATE TABLE SiteConfiguration (
    daf_id int(4) NOT NULL,
    Id int(4) NOT NULL,
    SiteId uniqueidentifier(16) NOT NULL,
    CarePathwayId int(4) NOT NULL
);

CREATE TABLE SiteConfigurationItem (
    dae_id int(4) NOT NULL
);

CREATE TABLE SiteConfigurationItemLog (
    dae_ObjectId int(4) NOT NULL,
    dae_id int(4) NOT NULL,
    dae_daf_id int(4) NOT NULL,
    dae_ety_id int(4) NOT NULL,
    dae_das_id int(4) NOT NULL,
    dae_DateAdded datetime(8) NOT NULL,
    dae_AddedBy uniqueidentifier(16) NOT NULL,
    dae_Transactionid uniqueidentifier(16) NOT NULL,
    dae_Action char(1) NOT NULL
);

CREATE TABLE SiteConfigurationLog (
    daf_ObjectId int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    daf_id int(4) NOT NULL,
    daf_sit_id uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    daf_cpw_id int(4) NOT NULL,
    daf_DateAdded datetime(8) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    daf_AddedBy uniqueidentifier(16) NOT NULL,
    daf_Transactionid uniqueidentifier(16) NOT NULL,
    SiteId uniqueidentifier(16) NOT NULL,
    CarePathwayId int(4) NOT NULL,
    daf_Action char(1) NOT NULL
);

CREATE TABLE SiteDefault (
    ipd_id int(4) NOT NULL,
    ipd_ipp_id int(4) NOT NULL
);

CREATE TABLE sitedefaultdrugoptionslink (
    sdg_id int(4) NOT NULL,
    sdg_source int(4),
    sdg_order int(4),
    sdg_required int(4) NOT NULL,
    sdg_dsc_id int(4),
    sdg_drs_id int(4),
    sdg_StartDateDayAfterSurgery bit(1) NOT NULL
);

CREATE TABLE sitedefaultdrugoptionslinklog (
    sdg_ObjectId int(4) NOT NULL,
    sdg_id int(4) NOT NULL,
    sdg_sit_id uniqueidentifier(16),
    sdg_ddo_id int(4),
    sdg_source int(4),
    sdg_order int(4),
    sdg_DateAdded datetime(8) NOT NULL,
    sdg_AddedBy uniqueidentifier(16) NOT NULL,
    sdg_TransactionId uniqueidentifier(16) NOT NULL,
    sdg_Action char(1) NOT NULL,
    sdg_required int(4),
    sdg_dsc_id int(4),
    sdg_drs_id int(4),
    sdg_StartDateDayAfterSurgery bit(1) NOT NULL
);

CREATE TABLE SiteDefaultLog (
    ipd_ObjectId int(4) NOT NULL,
    ipd_id int(4) NOT NULL,
    ipd_sit_id uniqueidentifier(16) NOT NULL,
    ipd_pri_id int(4) NOT NULL,
    ipd_pqi_drugqualifierid int(4) NOT NULL,
    ipd_numberofvisits int(4) NOT NULL,
    ipd_interval int(4),
    ipd_DateAdded datetime(8) NOT NULL,
    ipd_AddedBy uniqueidentifier(16) NOT NULL,
    ipd_TransactionId uniqueidentifier(16) NOT NULL,
    ipd_Action char(1) NOT NULL,
    ipd_ipp_id int(4) NOT NULL
);

CREATE TABLE SitePathway (
    ssp_id int(4) NOT NULL
);

CREATE TABLE SiteStep (
    stp_id int(4) NOT NULL,
    stp_description nvarchar(510),
    stp_abbreviation nvarchar(20) NOT NULL,
    stp_ety_id int(4),
    stp_aet_EncounterTemplateId int(4)
);

CREATE TABLE SiteStepLog (
    stp_Id int(4) NOT NULL,
    stp_description nvarchar(510),
    stp_abbreviation nvarchar(20) NOT NULL,
    stp_ety_id int(4),
    stp_aet_EncounterTemplateId int(4),
    stp_ObjectId int(4) NOT NULL,
    stp_DateAdded datetime(8) NOT NULL,
    stp_AddedBy uniqueidentifier(16) NOT NULL,
    stp_TransactionId uniqueidentifier(16) NOT NULL,
    stp_Action char(1) NOT NULL
);

CREATE TABLE sitetemplates (
    ste_id int(4) NOT NULL,
    ste_dte_id int(4) NOT NULL,
    ste_sit_id uniqueidentifier(16) NOT NULL,
    ste_ety_id int(4) NOT NULL,
    ste_spe_id int(4),
    ste_printer nvarchar(510),
    ste_copies int(4) NOT NULL,
    ste_batchcopies int(4) NOT NULL,
    ste_ecopy int(4) NOT NULL,
    ste_isfollowup bit(1),
    ste_esigningrequired bit(1) NOT NULL,
    ste_othercopiesbatch int(4),
    ste_othercopieslocal int(4),
    ste_printersbatch varchar(255),
    ste_defaulttemplate bit(1),
    ste_cpw_id int(4) NOT NULL,
    ste_aet_TemplateId int(4),
    ste_AutoGenerate bit(1) NOT NULL,
    ste_Order int(4) NOT NULL
);

CREATE TABLE sitetemplateslog (
    ste_ObjectId int(4) NOT NULL,
    ste_id int(4) NOT NULL,
    ste_dte_id int(4) NOT NULL,
    ste_sit_id uniqueidentifier(16) NOT NULL,
    ste_ety_id int(4) NOT NULL,
    ste_spe_id int(4),
    ste_printer nvarchar(510),
    ste_copies int(4),
    ste_batchcopies int(4),
    ste_ecopy int(4),
    ste_isfollowup bit(1),
    ste_esigningrequired bit(1),
    ste_othercopiesbatch int(4),
    ste_othercopieslocal int(4),
    ste_printersbatch varchar(255),
    ste_defaulttemplate bit(1),
    ste_DateAdded datetime(8) NOT NULL,
    ste_AddedBy uniqueidentifier(16) NOT NULL,
    ste_TransactionId uniqueidentifier(16) NOT NULL,
    ste_Action char(1) NOT NULL,
    ste_cpw_id int(4),
    ste_aet_TemplateId int(4),
    ste_AutoGenerate bit(1),
    ste_Order int(4)
);

CREATE TABLE Smoking (
    psk_pss_id int(4) NOT NULL,
    psk_lks_status int(4) NOT NULL,
    psk_durationyears int(4),
    psk_stoppedyears int(4),
    psk_perday int(4),
    psk_comments nvarchar(-1)
);

CREATE TABLE SocialServices (
    sss_pss_id int(4) NOT NULL,
    sss_lks_social_service int(4) NOT NULL
);

CREATE TABLE SocialServicesStatus (
    ssv_pss_id int(4) NOT NULL,
    ssv_comments nvarchar(-1)
);

CREATE TABLE specialty (
    spe_id int(4) NOT NULL,
    spe_name nvarchar(256),
    spe_order int(4),
    spe_licenseflag int(4) NOT NULL,
    spe_available bit(1) NOT NULL,
    spe_set_id_licensing int(4)
);

CREATE TABLE SpecificGravityData (
    usg_id int(4) NOT NULL,
    usg_available bit(1) NOT NULL
);

CREATE TABLE SpectralisInvestigationVersion (
    esv_iiv_InvestigationItemVersionId int(4) NOT NULL,
    esv_esp_ScanPatternId int(4) NOT NULL,
    esv_etg_GranularityId int(4) NOT NULL
);

CREATE TABLE SpectralisInvestigationVersionLog (
    esv_iiv_InvestigationItemVersionId int(4) NOT NULL,
    esv_esp_ScanPatternId int(4) NOT NULL,
    esv_etg_GranularityId int(4) NOT NULL,
    esv_ObjectId int(4) NOT NULL,
    esv_DateAdded datetime(8) NOT NULL,
    esv_AddedBy uniqueidentifier(16) NOT NULL,
    esv_Transactionid uniqueidentifier(16) NOT NULL,
    esv_Action char(1) NOT NULL
);

CREATE TABLE Stain (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL
);

CREATE TABLE StainLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL,
    StaticId int(4)
);

CREATE TABLE State (
    sds_id int(4) NOT NULL,
    sds_description nvarchar(200) NOT NULL
);

CREATE TABLE Status (
    pcs_id int(4) NOT NULL
);

CREATE TABLE StepDefault (
    hcs_id int(4) NOT NULL,
    hcs_description nvarchar(510) NOT NULL,
    hcs_clt_id int(4) NOT NULL,
    hcs_stp_id int(4) NOT NULL,
    hcs_order int(4) NOT NULL,
    hcs_status int(4) NOT NULL,
    hcs_csw_ClinicalStudyWorkflowStatusId int(4),
    hcs_IsPreArrival bit(1) NOT NULL
);

CREATE TABLE StepDefaultLog (
    hcs_Id int(4) NOT NULL,
    hcs_description nvarchar(510) NOT NULL,
    hcs_clt_id int(4) NOT NULL,
    hcs_stp_id int(4) NOT NULL,
    hcs_order int(4) NOT NULL,
    hcs_status int(4) NOT NULL,
    hcs_ObjectId int(4) NOT NULL,
    hcs_DateAdded datetime(8) NOT NULL,
    hcs_AddedBy uniqueidentifier(16) NOT NULL,
    hcs_TransactionId uniqueidentifier(16) NOT NULL,
    hcs_Action char(1) NOT NULL,
    hcs_csw_ClinicalStudyWorkflowStatusId int(4),
    hcs_IsPreArrival bit(1)
);

CREATE TABLE StepStatus (
    sps_id int(4) NOT NULL,
    sps_description nvarchar(40)
);

CREATE TABLE StepType (
    sst_id int(4) NOT NULL,
    sst_description nvarchar(40)
);

CREATE TABLE Stereopsis (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    Comments nvarchar(5000),
    MethodLookupId int(4),
    Correction int(4),
    AngleCorrected bit(1),
    Result int(4),
    Inconclusive bit(1),
    Negative bit(1)
);

CREATE TABLE StereopsisLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    Comments nvarchar(5000),
    MethodLookupId int(4),
    Correction int(4),
    AngleCorrected bit(1),
    Result int(4),
    Inconclusive bit(1),
    Negative bit(1)
);

CREATE TABLE StopBits (
    ssb_id int(4) NOT NULL,
    ssb_description nvarchar(200) NOT NULL
);

CREATE TABLE Strabismus (
    Id int(4) NOT NULL,
    PreparationId int(4),
    SutureId int(4),
    SurgicalCompletionId int(4)
);

CREATE TABLE StrabismusLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PreparationId int(4),
    SutureId int(4),
    SurgicalCompletionId int(4)
);

CREATE TABLE StratificationSystem (
    Id int(4) NOT NULL,
    Description nvarchar(100) NOT NULL,
    IsSystem bit(1) NOT NULL
);

CREATE TABLE StratificationSystemLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Description nvarchar(100) NOT NULL,
    IsSystem bit(1) NOT NULL
);

CREATE TABLE StratificationSystemVersion (
    Id int(4) NOT NULL,
    DateModified datetime(8) NOT NULL,
    Active bit(1) NOT NULL
);

CREATE TABLE StratificationSystemVersionLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    StratificationSystemId int(4) NOT NULL,
    DateModified datetime(8) NOT NULL,
    Active bit(1) NOT NULL
);

CREATE TABLE StratificationSystemVersionRiskLevel (
    Id int(4) NOT NULL
);

CREATE TABLE Study (
    std_id int(4) NOT NULL,
    std_Name varchar(500) NOT NULL,
    std_Code nvarchar(20),
    std_IdName nvarchar(510),
    std_StartDate datetime(8) NOT NULL,
    std_EndDate datetime(8),
    std_IdFormat nvarchar(60),
    std_flg_id int(4) NOT NULL,
    std_use_PrincipalInvestigatorId uniqueidentifier(16),
    std_SubjectIdRequired bit(1) NOT NULL,
    std_IsDateOfConsentRequired bit(1) NOT NULL,
    std_GenderRequired bit(1) NOT NULL
);

CREATE TABLE StudyAvailableGenders (
    sag_lks_id int(4) NOT NULL,
    sag_std_id int(4) NOT NULL
);

CREATE TABLE StudyLog (
    std_id int(4) NOT NULL,
    std_ObjectId int(4) NOT NULL,
    std_DateAdded datetime(8) NOT NULL,
    std_AddedBy uniqueidentifier(16) NOT NULL,
    std_Transactionid uniqueidentifier(16) NOT NULL,
    std_Action char(1) NOT NULL,
    std_Name varchar(500) NOT NULL,
    std_Code nvarchar(20),
    std_IdName nvarchar(510),
    std_StartDate datetime(8) NOT NULL,
    std_EndDate datetime(8),
    std_IdFormat nvarchar(60),
    std_pnt_id int(4) NOT NULL,
    std_flg_id int(4) NOT NULL,
    std_use_PrincipalInvestigatorId uniqueidentifier(16),
    std_SubjectIdRequired bit(1),
    std_IsDateOfConsentRequired bit(1) NOT NULL,
    std_GenderRequired bit(1) NOT NULL
);

CREATE TABLE SubjectiveChange (
    Id int(4) NOT NULL,
    Description nvarchar(20) NOT NULL
);

CREATE TABLE SubscribedPublisherIdentifier (
    Identifier uniqueidentifier(16) NOT NULL,
    PackageTypeId int(4) NOT NULL
);

CREATE TABLE SubSection (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ProcedureSubSectionId int(4) NOT NULL,
    BodyPartId int(4) NOT NULL,
    PerformedById uniqueidentifier(16) NOT NULL,
    StrabismusDefaultId int(4) NOT NULL,
    ProcedureSubSectionId int(4) NOT NULL,
    MusclePreviouslyOperatedOn bit(1) NOT NULL,
    Comments nvarchar(1000),
    ActivityId uniqueidentifier(16) NOT NULL
);

CREATE TABLE SubSectionLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    BodyPartId int(4) NOT NULL,
    StrabismusDefaultId int(4) NOT NULL,
    ProcedureSubSectionId int(4) NOT NULL,
    PerformedById uniqueidentifier(16) NOT NULL,
    ProcedureSubSectionId int(4) NOT NULL,
    MusclePreviouslyOperatedOn bit(1) NOT NULL,
    Comments nvarchar(1000),
    ActivityId uniqueidentifier(16) NOT NULL
);

CREATE TABLE SubSectionType (
    Id int(4) NOT NULL
);

CREATE TABLE SubstanceUse (
    ssu_pss_id int(4) NOT NULL,
    ssu_lks_status int(4) NOT NULL,
    ssu_comments nvarchar(-1)
);

CREATE TABLE Subtype (
    Id int(4) NOT NULL,
    Active bit(1) NOT NULL,
    LongDescription nvarchar(510) NOT NULL,
    ShortDescription nvarchar(60) NOT NULL,
    Abbreviation nvarchar(10) NOT NULL,
    AssigningAuthority nvarchar(20) NOT NULL,
    IdentifierTypeCode nvarchar(20) NOT NULL
);

CREATE TABLE SubtypeCustomerSite (
    CustomerSiteId uniqueidentifier(16) NOT NULL,
    SubtypeId int(4) NOT NULL
);

CREATE TABLE surgeondefault (
    sdf_id int(4) NOT NULL
);

CREATE TABLE surgeondefaultanaesthesia (
    san_id int(4) NOT NULL,
    san_use_id_anaesthetist uniqueidentifier(16),
    san_lks_id_blockmobility int(4),
    san_lks_id_blockocularpressure int(4),
    san_hyalase bit(1),
    san_generalanaesthesia bit(1),
    san_pro_code varchar(4),
    san_hassedations bit(1) NOT NULL
);

CREATE TABLE surgeondefaultanaesthesiadrug (
    sad_id int(4) NOT NULL,
    sad_none bit(1) NOT NULL,
    sad_mcn_id int(4),
    sad_dro_id int(4),
    sad_ant_id int(4),
    sad_order int(4),
    sad_sourceset int(4),
    sad_lks_id_type int(4)
);

CREATE TABLE SurgeonDefaultAnaesthesiaDrugDuplicateMedicationRemovalBackup (
    sad_id int(4) NOT NULL,
    sad_san_id int(4),
    sad_adc_id int(4) NOT NULL,
    sad_none bit(1) NOT NULL,
    sad_mcn_id int(4),
    sad_dro_id int(4),
    sad_ant_id int(4),
    sad_order int(4),
    sad_sourceset int(4),
    sad_lks_id_type int(4),
    sad_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE surgeondefaultanaesthesiadruglog (
    sad_ObjectId int(4) NOT NULL,
    sad_id int(4) NOT NULL,
    sad_san_id int(4),
    sad_adc_id int(4) NOT NULL,
    sad_none bit(1) NOT NULL,
    sad_mcn_id int(4),
    sad_dro_id int(4),
    sad_ant_id int(4),
    sad_order int(4),
    sad_sourceset int(4),
    sad_lks_id_type int(4),
    sad_DateAdded datetime(8) NOT NULL,
    sad_AddedBy uniqueidentifier(16) NOT NULL,
    sad_TransactionId uniqueidentifier(16) NOT NULL,
    sad_Action char(1) NOT NULL
);

CREATE TABLE surgeondefaultanaesthesialog (
    san_ObjectId int(4) NOT NULL,
    san_id int(4) NOT NULL,
    san_sdf_id int(4),
    san_use_id_anaesthetist uniqueidentifier(16),
    san_lks_id_blockmobility int(4),
    san_lks_id_blockocularpressure int(4),
    san_hyalase bit(1),
    san_generalanaesthesia bit(1),
    san_pro_code varchar(4),
    san_DateAdded datetime(8) NOT NULL,
    san_AddedBy uniqueidentifier(16) NOT NULL,
    san_TransactionId uniqueidentifier(16) NOT NULL,
    san_Action char(1) NOT NULL,
    san_hassedations bit(1)
);

CREATE TABLE surgeondefaultcataract (
    sud_id int(4) NOT NULL,
    sud_lks_id_iolposition int(4),
    sud_iollensinserted bit(1),
    sud_lks_id_corticalclearance int(4),
    sud_lks_id_nucleusdelivery int(4),
    sud_lks_id_capsulotomy int(4),
    sud_lks_id_woundclosure int(4),
    sud_lks_id_incisionsite int(4),
    sud_incisionlength float(8),
    sud_incisionmeridian int(4),
    sud_phacominutes tinyint(1),
    sud_phacoseconds tinyint(1),
    sud_phacopower tinyint(1),
    sud_lks_id_phacomachine int(4),
    sud_miochol bit(1),
    sud_predpostref float(8),
    sud_predpostrefcylinder float(8),
    sud_predpostrefaxis float(8),
    sud_nosutures tinyint(1),
    sud_lks_id_pupilsize int(4),
    sud_phacoeffectivetime bit(1) NOT NULL,
    sud_viscoelasticremoved bit(1),
    sud_icdilation bit(1),
    sud_visionblue bit(1),
    sud_hydrodelamination bit(1),
    sud_hydrodissection bit(1),
    sud_lks_id_biometrynotusedreason int(4),
    sud_sideportsright int(4),
    sud_fillmeridian int(4),
    sud_fillmeridiandeltak float(8),
    sud_incisionmeridianright float(8),
    sud_incisionmeridianleft float(8),
    sud_lks_id_incisionplane int(4),
    sud_sideportsleft int(4),
    sud_lks_id_surgeonpositionleft int(4),
    sud_lks_id_surgeonpositionright int(4)
);

CREATE TABLE SurgeonDefaultCataractDrugDuplicateMedicationRemovalBackup (
    sdd_id int(4) NOT NULL,
    sdd_sud_id int(4) NOT NULL,
    sdd_drs_id int(4),
    sdd_adc_id int(4) NOT NULL,
    sdd_mcn_id int(4),
    sdd_none bit(1),
    sdd_dro_id int(4),
    sdd_sourceset int(4),
    sdd_lks_id_type int(4),
    sdd_order int(4),
    sdd_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE surgeondefaultcataractlist (
    scl_id int(4) NOT NULL,
    scl_lqu_id int(4) NOT NULL,
    scl_responsevalue int(4) NOT NULL
);

CREATE TABLE surgeondefaultcataractlist_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    scl_id int(4) NOT NULL,
    scl_sud_id int(4) NOT NULL,
    scl_lqu_id int(4) NOT NULL,
    scl_responsevalue int(4) NOT NULL
);

CREATE TABLE surgeondefaultcataractlog (
    sud_ObjectId int(4) NOT NULL,
    sud_id int(4) NOT NULL,
    sud_sdf_id int(4),
    sud_lks_id_iolposition int(4),
    sud_iollensinserted bit(1),
    sud_lks_id_corticalclearance int(4),
    sud_lks_id_nucleusdelivery int(4),
    sud_lks_id_capsulotomy int(4),
    sud_lks_id_woundclosure int(4),
    sud_lks_id_incisionsite int(4),
    sud_incisionlength float(8),
    sud_incisionmeridian int(4),
    sud_phacominutes tinyint(1),
    sud_phacoseconds tinyint(1),
    sud_phacopower tinyint(1),
    sud_lks_id_phacomachine int(4),
    sud_miochol bit(1),
    sud_predpostref float(8),
    sud_predpostrefcylinder float(8),
    sud_predpostrefaxis float(8),
    sud_nosutures tinyint(1),
    sud_lks_id_pupilsize int(4),
    sud_phacoeffectivetime bit(1) NOT NULL,
    sud_viscoelasticremoved bit(1),
    sud_icdilation bit(1),
    sud_visionblue bit(1),
    sud_hydrodelamination bit(1),
    sud_hydrodissection bit(1),
    sud_lks_id_biometrynotusedreason int(4),
    sud_sideportsright int(4),
    sud_fillmeridian int(4),
    sud_fillmeridiandeltak float(8),
    sud_incisionmeridianright float(8),
    sud_incisionmeridianleft float(8),
    sud_lks_id_incisionplane int(4),
    sud_sideportsleft int(4),
    sud_lks_id_surgeonpositionleft int(4),
    sud_lks_id_surgeonpositionright int(4),
    sud_DateAdded datetime(8) NOT NULL,
    sud_AddedBy uniqueidentifier(16) NOT NULL,
    sud_TransactionId uniqueidentifier(16) NOT NULL,
    sud_Action char(1) NOT NULL
);

CREATE TABLE surgeondefaultdrug (
    sdd_id int(4) NOT NULL,
    sdd_drs_id int(4),
    sdd_adc_id int(4) NOT NULL,
    sdd_mcn_id int(4),
    sdd_none bit(1),
    sdd_dro_id int(4),
    sdd_sourceset int(4),
    sdd_lks_id_type int(4),
    sdd_order int(4)
);

CREATE TABLE SurgeonDefaultDrugDuplicateMedicationRemovalBackup (
    sdd_id int(4) NOT NULL,
    sdd_sdf_id int(4) NOT NULL,
    sdd_drs_id int(4),
    sdd_adc_id int(4) NOT NULL,
    sdd_mcn_id int(4),
    sdd_none bit(1),
    sdd_dro_id int(4),
    sdd_sourceset int(4),
    sdd_lks_id_type int(4),
    sdd_order int(4),
    sdd_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE surgeondefaultdruglog (
    sdd_ObjectId int(4) NOT NULL,
    sdd_id int(4) NOT NULL,
    sdd_sdf_id int(4) NOT NULL,
    sdd_drs_id int(4),
    sdd_adc_id int(4) NOT NULL,
    sdd_mcn_id int(4),
    sdd_none bit(1),
    sdd_dro_id int(4),
    sdd_sourceset int(4),
    sdd_lks_id_type int(4),
    sdd_order int(4),
    sdd_DateAdded datetime(8) NOT NULL,
    sdd_AddedBy uniqueidentifier(16) NOT NULL,
    sdd_TransactionId uniqueidentifier(16) NOT NULL,
    sdd_Action char(1) NOT NULL
);

CREATE TABLE surgeondefaultfollowupvisit (
    spv_id int(4) NOT NULL,
    spv_sdf_id int(4) NOT NULL,
    spv_order int(4) NOT NULL,
    spv_loc_id uniqueidentifier(16),
    spv_lks_id_followupby int(4),
    spv_use_id_followupby uniqueidentifier(16),
    spv_lks_id_intervaltype int(4),
    spv_lks_id_visittype int(4),
    spv_interval int(4)
);

CREATE TABLE surgeondefaultfollowupvisitlog (
    spv_ObjectId int(4) NOT NULL,
    spv_id int(4) NOT NULL,
    spv_sdf_id int(4) NOT NULL,
    spv_order int(4) NOT NULL,
    spv_loc_id uniqueidentifier(16),
    spv_lks_id_followupby int(4),
    spv_use_id_followupby uniqueidentifier(16),
    spv_lks_id_intervaltype int(4),
    spv_lks_id_visittype int(4),
    spv_interval int(4),
    spv_DateAdded datetime(8) NOT NULL,
    spv_AddedBy uniqueidentifier(16) NOT NULL,
    spv_TransactionId uniqueidentifier(16) NOT NULL,
    spv_Action char(1) NOT NULL
);

CREATE TABLE surgeondefaultinjection (
    sjp_id int(4) NOT NULL,
    sjp_lks_id_injectionlocationleft int(4),
    sjp_lks_id_injectionlocationright int(4),
    sjp_lks_id_preparationmethod int(4),
    sjp_conjunctivadisplaced bit(1) NOT NULL,
    sjp_entryfromlimbusphakic decimal(5),
    sjp_entryfromlimbuspseudophakic decimal(5),
    sjp_lks_id_needleangle int(4),
    sjp_actap bit(1),
    sjp_craperfused bit(1),
    sjp_abletocf bit(1),
    sjp_entryfromlimbusunknownlensstatus decimal(5)
);

CREATE TABLE surgeondefaultinjectionlog (
    sjp_ObjectId int(4) NOT NULL,
    sjp_id int(4) NOT NULL,
    sjp_sdf_id int(4) NOT NULL,
    sjp_lks_id_injectionlocationleft int(4),
    sjp_lks_id_injectionlocationright int(4),
    sjp_lks_id_preparationmethod int(4),
    sjp_conjunctivadisplaced bit(1) NOT NULL,
    sjp_entryfromlimbusphakic decimal(5),
    sjp_entryfromlimbuspseudophakic decimal(5),
    sjp_lks_id_needleangle int(4),
    sjp_actap bit(1),
    sjp_craperfused bit(1),
    sjp_abletocf bit(1),
    sjp_DateAdded datetime(8) NOT NULL,
    sjp_AddedBy uniqueidentifier(16) NOT NULL,
    sjp_TransactionId uniqueidentifier(16) NOT NULL,
    sjp_Action char(1) NOT NULL,
    sjp_entryfromlimbusunknownlensstatus decimal(5)
);

CREATE TABLE surgeondefaultlasersurgery (
    sdl_id int(4) NOT NULL,
    sdl_sdf_id int(4) NOT NULL,
    sdl_lat_id int(4) NOT NULL,
    sdl_lks_id_instrument int(4),
    sdl_lks_id_color int(4),
    sdl_lks_id_lens int(4),
    sdl_wavelength int(4),
    sdl_power int(4),
    sdl_duration int(4),
    sdl_beamdiameter int(4)
);

CREATE TABLE surgeondefaultlasersurgerylog (
    sdl_ObjectId int(4) NOT NULL,
    sdl_sdf_id int(4) NOT NULL,
    sdl_lat_id int(4) NOT NULL,
    sdl_lks_id_instrument int(4),
    sdl_lks_id_color int(4),
    sdl_lks_id_lens int(4),
    sdl_wavelength int(4),
    sdl_power int(4),
    sdl_duration int(4),
    sdl_beamdiameter int(4),
    sdl_DateAdded datetime(8) NOT NULL,
    sdl_AddedBy uniqueidentifier(16) NOT NULL,
    sdl_TransactionId uniqueidentifier(16) NOT NULL,
    sdl_Action char(1) NOT NULL,
    sdl_id int(4) NOT NULL
);

CREATE TABLE surgeondefaultlist (
    scl_id int(4) NOT NULL,
    scl_lqu_id int(4) NOT NULL,
    scl_responsevalue int(4) NOT NULL,
    scl_bod_id int(4)
);

CREATE TABLE surgeondefaultlistlog (
    scl_ObjectId int(4) NOT NULL,
    scl_id int(4) NOT NULL,
    scl_sdf_id int(4) NOT NULL,
    scl_lqu_id int(4) NOT NULL,
    scl_responsevalue int(4) NOT NULL,
    scl_bod_id int(4),
    scl_DateAdded datetime(8) NOT NULL,
    scl_AddedBy uniqueidentifier(16) NOT NULL,
    scl_TransactionId uniqueidentifier(16) NOT NULL,
    scl_Action char(1) NOT NULL
);

CREATE TABLE surgeondefaultlog (
    sdf_ObjectId int(4) NOT NULL,
    sdf_id int(4) NOT NULL,
    sdf_type int(4) NOT NULL,
    sdf_use_id uniqueidentifier(16) NOT NULL,
    sdf_DateAdded datetime(8) NOT NULL,
    sdf_AddedBy uniqueidentifier(16) NOT NULL,
    sdf_TransactionId uniqueidentifier(16) NOT NULL,
    sdf_Action char(1) NOT NULL
);

CREATE TABLE surgeondefaultproceduretype (
    sdt_id int(4) NOT NULL,
    sdt_description nvarchar(400),
    sdt_displayname nvarchar(400),
    sdt_isdefault bit(1) NOT NULL,
    sdt_cfd_id int(4),
    sdt_sdg_id int(4) NOT NULL
);

CREATE TABLE surgeondefaultproceduretypegroup (
    sdg_id int(4) NOT NULL,
    sdg_description varchar(200) NOT NULL
);

CREATE TABLE surgeondefaultrank (
    sdr_id int(4) NOT NULL,
    sdr_procedurecode varchar(255) NOT NULL,
    sdr_cfd_id int(4),
    sdr_proceduretype int(4) NOT NULL,
    sdr_rankanaesthesia int(4) NOT NULL,
    sdr_rankfollowup int(4) NOT NULL
);

CREATE TABLE surgeondefaultvitreoretinal (
    sdv_id int(4) NOT NULL,
    sdv_cfd_id int(4) NOT NULL,
    sdv_lks_id_conjincision int(4),
    sdv_chandelierat_left int(4),
    sdv_chandelierat_right int(4),
    sdv_lks_id_posthyaloidstatus int(4),
    sdv_sclerostomywidened bit(1),
    sdv_maxcutrate int(4),
    sdv_lks_id_heavyliquid int(4),
    sdv_retinectomyat int(4),
    sdv_lks_id_drainageofsrfmethod int(4),
    sdv_drainageofsrfat int(4),
    sdv_drainageofsrfcompletion int(4),
    sdv_residualfluidat int(4),
    sdv_irishooksat int(4),
    sdv_peripheraliridectomyat int(4),
    sdv_ividrugqualifierid int(4),
    sdv_lks_tamponadingagent int(4),
    sdv_tamponadeconcentration int(4),
    sdv_tamponadevolume float(8),
    sdv_tamponadefill int(4),
    sdv_acparacentesisat int(4),
    sdv_lks_id_cra int(4),
    sdv_numberofsclerostomysutures int(4),
    sdv_lks_id_sclerostomysuturematerial int(4),
    sdv_numberofconjunctivalsutures int(4),
    sdv_lks_id_conjunctivalsuturematerial int(4),
    sdv_patientpostures bit(1),
    sdv_posturesonwardcomment nvarchar(510),
    sdv_posturesathomecomment nvarchar(510)
);

CREATE TABLE surgeondefaultvitreoretinallog (
    sdv_ObjectId int(4) NOT NULL,
    sdv_id int(4) NOT NULL,
    sdv_sdf_id int(4) NOT NULL,
    sdv_cfd_id int(4) NOT NULL,
    sdv_lks_id_conjincision int(4),
    sdv_chandelierat_left int(4),
    sdv_chandelierat_right int(4),
    sdv_lks_id_posthyaloidstatus int(4),
    sdv_sclerostomywidened bit(1),
    sdv_maxcutrate int(4),
    sdv_lks_id_heavyliquid int(4),
    sdv_retinectomyat int(4),
    sdv_lks_id_drainageofsrfmethod int(4),
    sdv_drainageofsrfat int(4),
    sdv_drainageofsrfcompletion int(4),
    sdv_residualfluidat int(4),
    sdv_irishooksat int(4),
    sdv_peripheraliridectomyat int(4),
    sdv_ividrugqualifierid int(4),
    sdv_lks_tamponadingagent int(4),
    sdv_tamponadeconcentration int(4),
    sdv_tamponadevolume float(8),
    sdv_tamponadefill int(4),
    sdv_acparacentesisat int(4),
    sdv_lks_id_cra int(4),
    sdv_numberofsclerostomysutures int(4),
    sdv_lks_id_sclerostomysuturematerial int(4),
    sdv_numberofconjunctivalsutures int(4),
    sdv_lks_id_conjunctivalsuturematerial int(4),
    sdv_patientpostures bit(1),
    sdv_posturesonwardcomment nvarchar(510),
    sdv_posturesathomecomment nvarchar(510),
    sdv_DateAdded datetime(8) NOT NULL,
    sdv_AddedBy uniqueidentifier(16) NOT NULL,
    sdv_TransactionId uniqueidentifier(16) NOT NULL,
    sdv_Action char(1) NOT NULL
);

CREATE TABLE surgeondefaultvitreoretinalposture (
    sdp_id int(4) NOT NULL,
    sdp_displayorder int(4),
    sdp_posturesetting int(4),
    sdp_lks_id_posture int(4),
    sdp_duration int(4),
    sdp_lks_id_timeofday int(4),
    sdp_timeofdaydays int(4),
    sdp_isdeleted bit(1),
    sdp_durationunit int(4),
    sdp_comment nvarchar(510),
    sdp_sdf_id int(4) NOT NULL
);

CREATE TABLE surgeondefaultvitreoretinalposturelog (
    sdp_ObjectId int(4) NOT NULL,
    sdp_id int(4) NOT NULL,
    sdp_displayorder int(4),
    sdp_posturesetting int(4),
    sdp_lks_id_posture int(4),
    sdp_duration int(4),
    sdp_lks_id_timeofday int(4),
    sdp_timeofdaydays int(4),
    sdp_isdeleted bit(1),
    sdp_durationunit int(4),
    sdp_comment nvarchar(510),
    sdp_sdf_id int(4) NOT NULL,
    sdp_DateAdded datetime(8) NOT NULL,
    sdp_AddedBy uniqueidentifier(16) NOT NULL,
    sdp_TransactionId uniqueidentifier(16) NOT NULL,
    sdp_Action char(1) NOT NULL
);

CREATE TABLE surgeondefaultvitreoretinalsclerostomy (
    ssc_id int(4) NOT NULL,
    ssc_displayorder int(4),
    ssc_lks_id_gauge int(4),
    ssc_mmfromlimbus_phakic decimal(5),
    ssc_mmfromlimbus_aphakic decimal(5),
    ssc_sclerostomiesat_left int(4),
    ssc_sclerostomiesat_right int(4),
    ssc_isdeleted bit(1),
    ssc_lks_id_type int(4),
    ssc_sdf_id int(4) NOT NULL
);

CREATE TABLE surgeondefaultvitreoretinalsclerostomylog (
    ssc_ObjectId int(4) NOT NULL,
    ssc_id int(4) NOT NULL,
    ssc_displayorder int(4),
    ssc_lks_id_gauge int(4),
    ssc_mmfromlimbus_phakic decimal(5),
    ssc_mmfromlimbus_aphakic decimal(5),
    ssc_sclerostomiesat_left int(4),
    ssc_sclerostomiesat_right int(4),
    ssc_isdeleted bit(1),
    ssc_lks_id_type int(4),
    ssc_sdf_id int(4) NOT NULL,
    ssc_DateAdded datetime(8) NOT NULL,
    ssc_AddedBy uniqueidentifier(16) NOT NULL,
    ssc_TransactionId uniqueidentifier(16) NOT NULL,
    ssc_Action char(1) NOT NULL
);

CREATE TABLE SurgeonGrade (
    psg_Id int(4) NOT NULL,
    psg_Description nvarchar(200)
);

CREATE TABLE SurgicalCompletion (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ConjunctiveClosureId int(4),
    ConjunctiveClosureId int(4),
    DeviationAfterSurgeryId int(4)
);

CREATE TABLE SurgicalCompletionDrugs (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    TypeId int(4),
    TypeId int(4) NOT NULL,
    RouteId int(4) NOT NULL,
    RouteId int(4),
    NameId int(4),
    NameId int(4) NOT NULL,
    SurgicalCompletionId int(4) NOT NULL
);

CREATE TABLE SurgicalCompletionDrugsLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    TypeId int(4),
    TypeId int(4) NOT NULL,
    RouteId int(4) NOT NULL,
    RouteId int(4),
    NameId int(4),
    NameId int(4) NOT NULL,
    SurgicalCompletionId int(4) NOT NULL
);

CREATE TABLE SurgicalCompletionLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    ConjunctiveClosureId int(4),
    ConjunctiveClosureId int(4),
    DeviationAfterSurgeryId int(4)
);

CREATE TABLE SurgicalCompletionSuture (
    scd_sft_id int(4) NOT NULL,
    scs_ActivityId uniqueidentifier(16) NOT NULL,
    scs_sct_id int(4) NOT NULL,
    scd_sct_id int(4) NOT NULL,
    scd_Number int(4) NOT NULL,
    scs_lks_SutureMaterial int(4),
    scs_Number int(4) NOT NULL,
    scd_lks_Material int(4)
);

CREATE TABLE SurgicalCompletionSutureLog (
    scd_sft_id int(4) NOT NULL,
    scs_ActivityId uniqueidentifier(16) NOT NULL,
    scs_ObjectId uniqueidentifier(16) NOT NULL,
    scd_ObjectId int(4) NOT NULL,
    scd_DateAdded datetime(8) NOT NULL,
    scs_DateAdded datetime(8) NOT NULL,
    scs_AddedBy uniqueidentifier(16) NOT NULL,
    scd_AddedBy uniqueidentifier(16) NOT NULL,
    scd_Transactionid uniqueidentifier(16) NOT NULL,
    scs_Transactionid uniqueidentifier(16) NOT NULL,
    scs_Action char(1) NOT NULL,
    scd_Action char(1) NOT NULL,
    scd_sct_id int(4) NOT NULL,
    scs_sct_id int(4) NOT NULL,
    scs_lks_SutureMaterial int(4),
    scd_Number int(4) NOT NULL,
    scd_lks_Material int(4),
    scs_Number int(4) NOT NULL,
    scs_Id int(4) NOT NULL
);

CREATE TABLE SurgicalCompletionSutureType (
    sct_id int(4) NOT NULL,
    sct_SingularDescription nvarchar(200) NOT NULL,
    sct_PluralDescription nvarchar(200) NOT NULL
);

CREATE TABLE SurgicalPlanningCataractPlanRemovalBackup (
    spc_id int(4) NOT NULL,
    spc_spp_id int(4) NOT NULL,
    spc_bod_id int(4) NOT NULL,
    spc_firsteye bit(1) NOT NULL,
    spc_planforsecondeye_lks_id int(4),
    spc_iol_id uniqueidentifier(16),
    spc_targetrefraction float(8),
    spc_comments nvarchar(1000),
    spc_isdeleted bit(1) NOT NULL,
    spc_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE SurgicalPlanningPlanRemovalBackup (
    spp_id int(4) NOT NULL,
    spp_act_id uniqueidentifier(16) NOT NULL,
    spp_pln_id int(4),
    spp_risksbenefitsdiscussed bit(1) NOT NULL,
    spp_consentformgiven bit(1) NOT NULL,
    spp_patientconsented bit(1) NOT NULL,
    spp_comments nvarchar(1000),
    spp_PatchVersion varchar(256) NOT NULL
);

CREATE TABLE SutureAdjustmentSurgicalCompletion (
    Id int(4) NOT NULL,
    ConjunctiveClosureId int(4)
);

CREATE TABLE SutureAdjustmentSurgicalCompletionLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    ConjunctiveClosureId int(4)
);

CREATE TABLE Sutures (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL
);

CREATE TABLE SuturesLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL,
    StaticId int(4)
);

CREATE TABLE sysdiagrams (
    diagram_id int(4) NOT NULL,
    version int(4),
    definition varbinary(-1)
);

CREATE TABLE SystemActivity (
    aac_Id int(4) NOT NULL,
    aac_DisplayName nvarchar(400) NOT NULL,
    aac_Description nvarchar(1000) NOT NULL
);

CREATE TABLE SystemActivityEncounterType (
    sae_SystemActivityId int(4) NOT NULL,
    sae_EncounterTypeId int(4) NOT NULL
);

CREATE TABLE SystemActivitySection (
    aas_Id int(4) NOT NULL,
    aas_systemActivityId int(4) NOT NULL,
    aas_DisplayName nvarchar(1000),
    aas_QuestionSetId int(4) NOT NULL,
    aas_Lateralised bit(1) NOT NULL,
    aas_CanAddQuestions bit(1) NOT NULL
);

CREATE TABLE systemdatamaparea (
    dme_id int(4) NOT NULL,
    dme_name nvarchar(510) NOT NULL
);

CREATE TABLE systemdatamapdefinition (
    smd_id int(4) NOT NULL,
    smd_cpt_id int(4),
    smd_lks_id int(4),
    smd_numeric float(8),
    smd_boolean bit(1),
    smd_smi_id int(4) NOT NULL,
    smd_bidirectional bit(1) NOT NULL,
    smd_cfd_id int(4)
);

CREATE TABLE systemdatamapitem (
    smi_id int(4) NOT NULL,
    smi_name nvarchar(510) NOT NULL,
    smi_aty_id int(4) NOT NULL,
    smi_targetname nvarchar(510) NOT NULL
);

CREATE TABLE systemdatamaps (
    dmp_id int(4) NOT NULL,
    dmp_mpe_sourcetype int(4) NOT NULL,
    dmp_sourceid int(4) NOT NULL,
    dmp_mpe_targettype int(4) NOT NULL,
    dmp_targetid int(4) NOT NULL,
    dmp_bidirectional bit(1),
    dmp_smi_id int(4),
    dmp_target_detailid int(4)
);

CREATE TABLE systemdocument (
    doc_id uniqueidentifier(16) NOT NULL,
    doc_dateadded datetime(8) NOT NULL,
    doc_requiresapproval bit(1) NOT NULL,
    doc_description nvarchar(510),
    doc_dte_id int(4),
    doc_printedlocally bit(1) NOT NULL,
    doc_skipdocumentgeneration bit(1) NOT NULL,
    doc_cpw_id_templatePathway int(4),
    doc_externalidentifier nvarchar(510),
    doc_IsScanned bit(1),
    doc_DocumentReconstructed bit(1)
);

CREATE TABLE systemdocumentlog (
    doc_ObjectId uniqueidentifier(16) NOT NULL,
    doc_id int(4) NOT NULL,
    doc_status int(4) NOT NULL,
    doc_currentversion int(4) NOT NULL,
    doc_dcs_id int(4) NOT NULL,
    doc_requiresapproval bit(1) NOT NULL,
    doc_dtp_id int(4),
    doc_description nvarchar(510),
    doc_dte_id int(4),
    doc_responsibleclinician_id uniqueidentifier(16),
    doc_printedlocally bit(1) NOT NULL,
    doc_printedinbatch bit(1) NOT NULL,
    doc_available bit(1) NOT NULL,
    doc_skipdocumentgeneration bit(1) NOT NULL,
    doc_DateAdded datetime(8) NOT NULL,
    doc_AddedBy uniqueidentifier(16) NOT NULL,
    doc_TransactionId uniqueidentifier(16) NOT NULL,
    doc_Action char(1) NOT NULL,
    doc_datemodified datetime(8),
    doc_actioned bit(1),
    doc_cpw_id_templatePathway int(4),
    doc_deleted bit(1),
    doc_externalidentifier nvarchar(510),
    doc_IsScanned bit(1),
    doc_DocumentReconstructed bit(1)
);

CREATE TABLE SystemEncounterLicenseSetting (
    ael_EncounterTypeId int(4) NOT NULL,
    ael_LicenseSettingId int(4) NOT NULL
);

CREATE TABLE systemid (
    MasterID uniqueidentifier(16) NOT NULL,
    SourceTableName varchar(255)
);

CREATE TABLE systemid_Backup (
    InsertDateTime datetime(8),
    ProcessIdentifier uniqueidentifier(16),
    MasterID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    SourceTypeId uniqueidentifier(16),
    SourceTableName varchar(255)
);

CREATE TABLE TargetCondition (
    Id int(4) NOT NULL
);

CREATE TABLE TargetConditionCorrection (
    Id int(4) NOT NULL
);

CREATE TABLE tempdataneil (
    itq_id int(4) NOT NULL,
    itq_interfacetype int(4) NOT NULL,
    itq_datecreated datetime(8),
    itq_status int(4),
    itq_lastupdated datetime(8),
    itq_use_id uniqueidentifier(16),
    itq_loc_id uniqueidentifier(16),
    itq_ect_id uniqueidentifier(16),
    itq_ipm_id int(4),
    itq_encountervalidationresult varchar(2000),
    itq_devicename varchar(255),
    itd_id int(4) NOT NULL,
    itd_itq_id int(4) NOT NULL,
    itd_mim_id int(4) NOT NULL,
    itd_data varbinary(-1),
    ect_id uniqueidentifier(16) NOT NULL,
    ect_pat_id uniqueidentifier(16),
    ect_loc_id uniqueidentifier(16),
    ect_date datetime(8),
    ect_daterecorded datetime(8),
    ect_datesaved datetime(8),
    ect_ety_id int(4),
    ect_mode int(4) NOT NULL,
    ect_csc_id int(4),
    ect_private bit(1),
    ect_status int(4),
    ect_lks_id_visitreason int(4),
    ect_interpreter bit(1),
    ect_lks_id_language int(4),
    ect_lks_id_transport int(4),
    ect_title nvarchar(400),
    ect_source int(4),
    ect_visittype int(4),
    ect_remotelocationid uniqueidentifier(16),
    ect_remotelocation varchar(255),
    ect_readonly bit(1),
    ect_lks_id_communicationtype int(4),
    ect_plannedoperation int(4),
    ect_operation uniqueidentifier(16),
    ect_containsprescription bit(1) NOT NULL,
    ect_isdeleted bit(1),
    ect_datedeleted datetime(8),
    ect_use_id_lastsaved uniqueidentifier(16),
    ect_pdh_id int(4),
    pnm_id uniqueidentifier(16) NOT NULL,
    pnm_pat_id uniqueidentifier(16),
    pnm_number varchar(255) NOT NULL,
    pnm_lks_id_status int(4),
    pnm_pnt_id int(4) NOT NULL
);

CREATE TABLE Template (
    dte_id int(4) NOT NULL,
    drt_Id int(4) NOT NULL,
    dte_dts_id tinyint(1) NOT NULL,
    dte_dtp_id int(4) NOT NULL,
    drt_DisplayName nvarchar(400),
    dte_available bit(1) NOT NULL,
    dte_guid uniqueidentifier(16),
    drt_Deleted bit(1) NOT NULL,
    drt_bod_BodyPartId int(4) NOT NULL,
    drt_ParsPlanaRadius decimal(5),
    dte_ForceAddExplanatorySentence bit(1) NOT NULL,
    drt_OraSerrataRadius decimal(5),
    drt_EquatorRadius decimal(5),
    drt_CenterX decimal(5),
    drt_CenterY decimal(5),
    drt_ArcadesPolygon varchar(1000),
    drt_Radius decimal(5),
    drt_dtt_TemplateTypeId int(4) NOT NULL,
    drt_InnerRadius decimal(5)
);

CREATE TABLE templateblock (
    tbk_id int(4) NOT NULL,
    tbk_name nvarchar(1024) NOT NULL,
    tbk_contents varbinary(-1) NOT NULL,
    tbk_tfm_id int(4) NOT NULL,
    tbk_tbt_id int(4) NOT NULL
);

CREATE TABLE templateblockinclude (
    tbi_id int(4) NOT NULL,
    tbi_tbk_id_parent int(4) NOT NULL,
    tbi_tbk_id_child int(4) NOT NULL,
    tbi_orderingkey int(4) NOT NULL,
    tbi_tit_id int(4) NOT NULL
);

CREATE TABLE templateBlockParameter (
    tbp_id int(4) NOT NULL,
    tbp_tbk_id int(4) NOT NULL,
    tbp_tpt_id int(4) NOT NULL,
    tbp_intValue int(4),
    tbp_stringValue nvarchar(510)
);

CREATE TABLE templateblocktype (
    tbt_id int(4) NOT NULL,
    tbt_name nvarchar(510) NOT NULL
);

CREATE TABLE templatedatafield (
    tdf_id int(4) NOT NULL,
    tdf_name nvarchar(510) NOT NULL,
    tdf_providerName nvarchar(510) NOT NULL,
    tdf_dataAddress varchar(2048) NOT NULL,
    tdf_tfm_id int(4) NOT NULL
);

CREATE TABLE templateformat (
    tfm_id int(4) NOT NULL,
    tfm_name nvarchar(510) NOT NULL
);

CREATE TABLE templateIncludeParameter (
    tip_id int(4) NOT NULL,
    tip_tpt_id int(4) NOT NULL,
    tip_intValue int(4),
    tip_tbi_id int(4) NOT NULL,
    tip_stringValue nvarchar(510)
);

CREATE TABLE templateIncludeParameterType (
    tpt_id int(4) NOT NULL,
    tpt_name varchar(255)
);

CREATE TABLE templateincludetype (
    tit_id int(4) NOT NULL,
    tit_name nvarchar(510) NOT NULL
);

CREATE TABLE TemplateLanguage (
    tla_dte_id int(4) NOT NULL,
    tla_languageCodeId int(4) NOT NULL
);

CREATE TABLE templaterecipienttypes (
    trt_id int(4) NOT NULL
);

CREATE TABLE TemplateSource (
    dts_id tinyint(1) NOT NULL,
    dts_description nvarchar(200) NOT NULL
);

CREATE TABLE TemplateType (
    dtt_Id int(4) NOT NULL
);

CREATE TABLE templatevalidcontents (
    tvc_tfm_id_owner int(4) NOT NULL,
    tvc_tfm_id_validcontent int(4) NOT NULL
);

CREATE TABLE TemplateVersion (
    dtv_id int(4) NOT NULL,
    dtv_use_id_createdBy uniqueidentifier(16) NOT NULL
);

CREATE TABLE TemplateVersionData (
    tvd_dtv_id int(4) NOT NULL,
    tvd_dtd_id int(4) NOT NULL,
    tvd_dtl_id tinyint(1) NOT NULL
);

CREATE TABLE Tenotomy (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    Tenotomy int(4),
    Tenotomy int(4) NOT NULL
);

CREATE TABLE TenotomyLog (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    Tenotomy int(4) NOT NULL,
    Tenotomy int(4)
);

CREATE TABLE Term (
    rst_id int(4) NOT NULL,
    rst_cpt_id int(4) NOT NULL,
    rst_parsedText nvarchar(4000) NOT NULL,
    rst_negated bit(1) NOT NULL,
    rst_comments nvarchar(-1),
    rst_order tinyint(1)
);

CREATE TABLE TermLog (
    rst_ObjectId int(4) NOT NULL,
    rst_id int(4) NOT NULL,
    rst_ros_id int(4) NOT NULL,
    rst_cpt_id int(4) NOT NULL,
    rst_parsedText nvarchar(4000) NOT NULL,
    rst_negated bit(1) NOT NULL,
    rst_comments nvarchar(-1),
    rst_order tinyint(1),
    rst_DateAdded datetime(8) NOT NULL,
    rst_AddedBy uniqueidentifier(16) NOT NULL,
    rst_TransactionId uniqueidentifier(16) NOT NULL,
    rst_Action char(1) NOT NULL
);

CREATE TABLE Test (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    TestActivityId uniqueidentifier(16) NOT NULL,
    TestConditionsId int(4) NOT NULL,
    TestName nvarchar(60),
    ApplicableTestTypeId int(4) NOT NULL,
    TestNumber int(4) NOT NULL,
    IncludeOnChart bit(1) NOT NULL,
    TestMethodId int(4) NOT NULL,
    DistanceId int(4),
    TestTypeId int(4) NOT NULL,
    DistanceValue float(8),
    CorrectionId int(4),
    AddLensId int(4),
    EyeTargetId int(4),
    FixingEyeId int(4),
    DiagnosticOcclusion bit(1)
);

CREATE TABLE TestActivity (
    ActivityId uniqueidentifier(16) NOT NULL,
    ChartContent varbinary(-1)
);

CREATE TABLE TestActivityLog (
    ActivityId int(4) NOT NULL,
    ChartContent varbinary(-1),
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE TestConditions (
    Id int(4) NOT NULL,
    DiagnosticOcclusion bit(1),
    TestMethodId int(4),
    DistanceId int(4),
    DistanceValue float(8),
    CorrectionId int(4),
    PrismIncorporated bit(1),
    AddLensId int(4),
    RightFresnelPrismValue int(4),
    RightFresnelPrismHorizontalBaseId int(4),
    RightFresnelPrismVerticalBaseId int(4),
    LeftFresnelPrismValue int(4),
    LeftFresnelPrismHorizontalBaseId int(4),
    LeftFresnelPrismVerticalBaseId int(4),
    EyeTargetId int(4),
    FixingEyeId int(4),
    HeadPostureStatusId int(4),
    ChinPostureSeverityId int(4),
    ChinPostureDirectionId int(4),
    ChinPostureDegrees int(4),
    FacePostureSeverityId int(4),
    FacePostureDirectionId int(4),
    FacePostureDegrees int(4),
    HeadPostureSeverityId int(4),
    HeadPostureDirectionId int(4),
    HeadPostureDegrees int(4),
    Comments nvarchar(2000)
);

CREATE TABLE TestConditionsLog (
    Id int(4) NOT NULL,
    DiagnosticOcclusion bit(1),
    TestMethodId int(4),
    ExcursionId int(4),
    DistanceId int(4),
    DistanceValue float(8),
    CorrectionId int(4),
    PrismIncorporated bit(1),
    AddLensId int(4),
    RightFresnelPrismValue int(4),
    RightFresnelPrismHorizontalBaseId int(4),
    RightFresnelPrismVerticalBaseId int(4),
    LeftFresnelPrismValue int(4),
    LeftFresnelPrismHorizontalBaseId int(4),
    LeftFresnelPrismVerticalBaseId int(4),
    EyeTargetId int(4),
    FixingEyeId int(4),
    HeadPostureStatusId int(4),
    ChinPostureSeverityId int(4),
    ChinPostureDirectionId int(4),
    ChinPostureDegrees int(4),
    FacePostureSeverityId int(4),
    FacePostureDirectionId int(4),
    FacePostureDegrees int(4),
    HeadPostureSeverityId int(4),
    HeadPostureDirectionId int(4),
    HeadPostureDegrees int(4),
    Comments nvarchar(2000),
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE TestEntry (
    TestActivityId uniqueidentifier(16) NOT NULL,
    AlphabetOverlayPatternId int(4),
    AppearsGrosslyFull bit(1),
    AlphabetPatternCalculated bit(1) NOT NULL
);

CREATE TABLE TestEntryEye (
    Id int(4) NOT NULL,
    TestActivityId uniqueidentifier(16) NOT NULL,
    Eye int(4) NOT NULL,
    Comments nvarchar(2000),
    TopLeftDuctionId int(4),
    BottomLeftDuctionId int(4),
    MiddleLeftDuctionId int(4),
    TopRightDuctionId int(4),
    BottomRightDuctionId int(4),
    MiddleRightDuctionId int(4),
    TopLeftVersionId int(4),
    BottomLeftVersionId int(4),
    MiddleLeftVersionId int(4),
    TopRightVersionId int(4),
    BottomRightVersionId int(4),
    MiddleRightVersionId int(4),
    BottomLeftOverActionId int(4),
    BottomRightOverActionId int(4),
    TopLeftOverActionId int(4),
    TopRightOverActionId int(4)
);

CREATE TABLE TestEntryEyeLog (
    Id int(4) NOT NULL,
    TestActivityId uniqueidentifier(16) NOT NULL,
    Eye int(4) NOT NULL,
    Comments nvarchar(2000),
    TopLeftDuctionId int(4),
    BottomLeftDuctionId int(4),
    MiddleLeftDuctionId int(4),
    TopRightDuctionId int(4),
    BottomRightDuctionId int(4),
    MiddleRightDuctionId int(4),
    TopLeftVersionId int(4),
    BottomLeftVersionId int(4),
    MiddleLeftVersionId int(4),
    TopRightVersionId int(4),
    BottomRightVersionId int(4),
    MiddleRightVersionId int(4),
    BottomLeftOverActionId int(4),
    BottomRightOverActionId int(4),
    TopLeftOverActionId int(4),
    TopRightOverActionId int(4),
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE TestEntryLog (
    TestActivityId int(4) NOT NULL,
    AlphabetOverlayPatternId int(4),
    AppearsGrosslyFull bit(1),
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    AlphabetPatternCalculated bit(1) NOT NULL
);

CREATE TABLE TestLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    TestActivityId uniqueidentifier(16) NOT NULL,
    TestConditionsId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TestNumber int(4) NOT NULL,
    IncludeOnChart bit(1) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TestTypeId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    TestNumber int(4) NOT NULL,
    TestName nvarchar(60),
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    ApplicableTestTypeId int(4) NOT NULL,
    TestMethodId int(4) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    DistanceId int(4),
    DistanceValue float(8),
    CorrectionId int(4),
    AddLensId int(4),
    EyeTargetId int(4),
    FixingEyeId int(4),
    DiagnosticOcclusion bit(1)
);

CREATE TABLE TestType (
    Id int(4) NOT NULL,
    Name nvarchar(200) NOT NULL
);

CREATE TABLE Thumbnail (
    ebt_doc_SystemDocumentId uniqueidentifier(16) NOT NULL,
    ebt_Binary varbinary(-1),
    ebt_FailedGeneration bit(1) NOT NULL
);

CREATE TABLE ticket#195840_DupPathwayLog_bak (
    DUP_ID int(4) NOT NULL,
    ppv_versionEffectiveDate datetime2(8) NOT NULL,
    ppv_ppw_id int(4) NOT NULL,
    ppv_id int(4) NOT NULL
);

CREATE TABLE ticket#195840_pwayBAK (
    ppv_id int(4) NOT NULL,
    ppv_versionEffectiveDate datetime2(8) NOT NULL,
    ppv_ppw_id int(4) NOT NULL,
    ppv_cpw_id int(4) NOT NULL,
    ppv_pcs_id int(4) NOT NULL,
    ppv_use_id_responsible uniqueidentifier(16),
    ppv_comments nvarchar(500),
    ppv_startDate datetime(8),
    ppv_dischargeDate datetime(8),
    ppv_dischargeComments nvarchar(500),
    ppv_rolledBack bit(1) NOT NULL,
    ppv_use_id_editedBy uniqueidentifier(16) NOT NULL,
    ppv_ect_id_editedFrom uniqueidentifier(16),
    ppv_ect_id_relatedWith uniqueidentifier(16)
);

CREATE TABLE ticket#205077_dprBAK1 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#205077_dprBAK2 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBAK10 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBAK11 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBak12 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBak13 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBAK3 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBAK4 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBAK5 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBAK6 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBAK7 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBAK8 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_dprBAK9 (
    dpr_id int(4) NOT NULL,
    dpr_pdm_id int(4) NOT NULL,
    dpr_practitionercode nvarchar(510) NOT NULL,
    dpr_title nvarchar(510),
    dpr_forename nvarchar(510),
    dpr_surname nvarchar(510),
    dpr_practicecode nvarchar(510),
    dpr_address1 nvarchar(510),
    dpr_address2 nvarchar(510),
    dpr_address3 nvarchar(510),
    dpr_address4 nvarchar(510),
    dpr_address5 nvarchar(510),
    dpr_postcode nvarchar(510),
    dpr_landlinephonenumber nvarchar(510),
    dpr_practicename nvarchar(510),
    dpr_addresscode nvarchar(510),
    dpr_addressname nvarchar(510),
    dpr_gender nvarchar(510),
    dpr_specialty int(4),
    dpr_ptt_id int(4) NOT NULL,
    dpr_email varchar(255),
    dpr_mobilephonenumber varchar(255),
    dpr_faxnumber varchar(255),
    dpr_specialtyfreetext varchar(255),
    dpr_prd_PractitionerDataSourceId int(4)
);

CREATE TABLE ticket#206213_pakBAK (
    pak_id int(4) NOT NULL,
    pak_add_id uniqueidentifier(16) NOT NULL,
    pak_pra_id uniqueidentifier(16) NOT NULL,
    pak_addressno tinyint(1) NOT NULL,
    pak_main bit(1) NOT NULL
);

CREATE TABLE Ticket194284_encounter (
    ect_id uniqueidentifier(16) NOT NULL,
    ect_pat_id uniqueidentifier(16),
    ect_loc_id uniqueidentifier(16),
    ect_date datetime(8),
    ect_daterecorded datetime(8),
    ect_datesaved datetime(8) NOT NULL,
    ect_ety_id int(4) NOT NULL,
    ect_mode int(4) NOT NULL,
    ect_csc_id int(4),
    ect_private bit(1),
    ect_status int(4),
    ect_lks_id_visitreason int(4),
    ect_interpreter bit(1),
    ect_lks_id_language int(4),
    ect_lks_id_transport int(4),
    ect_title nvarchar(400),
    ect_lastsavedsource int(4),
    ect_visittype int(4),
    ect_remotelocationid uniqueidentifier(16),
    ect_remotelocation varchar(255),
    ect_readonly bit(1),
    ect_lks_id_communicationtype int(4),
    ect_plannedoperation int(4),
    ect_operation uniqueidentifier(16),
    ect_containsprescription bit(1) NOT NULL,
    ect_isdeleted bit(1) NOT NULL,
    ect_datedeleted datetime(8),
    ect_use_id_lastsaved uniqueidentifier(16),
    ect_pdh_id int(4),
    ect_skiplettergeneration bit(1) NOT NULL,
    ect_ity_InterfaceTypeId_CreatedBy int(4),
    ect_etv_EncounterTemplateVersionId int(4),
    ect_HasApplicableBillingReference bit(1),
    ect_brf_BillingReferenceId int(4),
    ect_EncounterTime time(4)
);

CREATE TABLE Ticket194284_encounter20 (
    ect_id uniqueidentifier(16) NOT NULL,
    ect_pat_id uniqueidentifier(16),
    ect_loc_id uniqueidentifier(16),
    ect_date datetime(8),
    ect_daterecorded datetime(8),
    ect_datesaved datetime(8) NOT NULL,
    ect_ety_id int(4) NOT NULL,
    ect_mode int(4) NOT NULL,
    ect_csc_id int(4),
    ect_private bit(1),
    ect_status int(4),
    ect_lks_id_visitreason int(4),
    ect_interpreter bit(1),
    ect_lks_id_language int(4),
    ect_lks_id_transport int(4),
    ect_title nvarchar(400),
    ect_lastsavedsource int(4),
    ect_visittype int(4),
    ect_remotelocationid uniqueidentifier(16),
    ect_remotelocation varchar(255),
    ect_readonly bit(1),
    ect_lks_id_communicationtype int(4),
    ect_plannedoperation int(4),
    ect_operation uniqueidentifier(16),
    ect_containsprescription bit(1) NOT NULL,
    ect_isdeleted bit(1) NOT NULL,
    ect_datedeleted datetime(8),
    ect_use_id_lastsaved uniqueidentifier(16),
    ect_pdh_id int(4),
    ect_skiplettergeneration bit(1) NOT NULL,
    ect_ity_InterfaceTypeId_CreatedBy int(4),
    ect_etv_EncounterTemplateVersionId int(4),
    ect_HasApplicableBillingReference bit(1),
    ect_brf_BillingReferenceId int(4),
    ect_EncounterTime time(4)
);

CREATE TABLE Ticket211996_documentrecipient (
    dor_id int(4) NOT NULL,
    dor_doc_id uniqueidentifier(16) NOT NULL,
    dor_version int(4) NOT NULL,
    dor_lks_id_recipient int(4) NOT NULL,
    dor_address1 nvarchar(510),
    dor_address2 nvarchar(510),
    dor_address3 nvarchar(510),
    dor_address4 nvarchar(510),
    dor_postcode varchar(255),
    dor_initials nvarchar(510),
    dor_surname nvarchar(510),
    dor_title nvarchar(510),
    dor_firstname nvarchar(510),
    dor_source int(4) NOT NULL,
    dor_copies int(4) NOT NULL,
    dor_signoff varchar(255),
    dor_includeaddresspage bit(1) NOT NULL,
    dor_batchcopies int(4) NOT NULL,
    dor_localcopies int(4) NOT NULL,
    dor_edoc bit(1) NOT NULL,
    dor_lks_id_recipienttype int(4),
    dor_organisation nvarchar(510),
    dor_includeaddresspagebatch bit(1),
    dor_jobtitle nvarchar(510),
    dor_recipient_id uniqueidentifier(16),
    dor_address5 nvarchar(510),
    dor_addressname nvarchar(510),
    dor_forename nvarchar(510),
    dor_lks_id_gender int(4),
    dor_drg_GroupId int(4) NOT NULL,
    dor_includeInAllFutureCorrespondence bit(1),
    dor_add_AddressId uniqueidentifier(16),
    dor_LargePrint bit(1) NOT NULL,
    dor_UniqueDocumentRecipientKey uniqueidentifier(16) NOT NULL
);

CREATE TABLE Time (
    tim_act_ActivityId uniqueidentifier(16) NOT NULL,
    tim_Time time(5) NOT NULL
);

CREATE TABLE TimeLog (
    tim_act_ActivityId int(4) NOT NULL,
    tim_ObjectId uniqueidentifier(16) NOT NULL,
    tim_DateAdded datetime(8) NOT NULL,
    tim_AddedBy uniqueidentifier(16) NOT NULL,
    tim_TransactionId uniqueidentifier(16) NOT NULL,
    tim_Action char(1) NOT NULL,
    tim_Time time(5) NOT NULL
);

CREATE TABLE TorsionDeviation (
    Id int(4) NOT NULL,
    TorsionDeviationName nvarchar(100) NOT NULL
);

CREATE TABLE TorsionTestFindings (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    TorsionDeviationId int(4),
    MeasurementStartValue float(8),
    MeasurementEndValue float(8),
    MeasurementRange bit(1),
    Comments nvarchar(1000),
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE TorsionTestFindingsLog (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    TorsionDeviationId int(4),
    MeasurementStartValue float(8),
    MeasurementEndValue float(8),
    MeasurementRange bit(1),
    Comments nvarchar(1000),
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE Trabeculectomy (
    trb_act_id uniqueidentifier(16) NOT NULL,
    sft_sdf_id int(4) NOT NULL,
    sft_PositionRight int(4),
    trb_BodyPartId int(4) NOT NULL,
    trb_NumberOfPreviousTrabs int(4) NOT NULL,
    sft_PositionLeft int(4),
    sft_ScleralFlapSizeX float(8),
    sft_ScleralFlapSizeY float(8),
    trb_Position int(4) NOT NULL,
    trb_lks_ConjunctivalFlap int(4) NOT NULL,
    sft_ScleralFlapShape int(4),
    sft_ScleralFlapThickness int(4),
    trb_ScleralFlapSizeX float(8),
    trb_ScleralFlapSizeY float(8),
    sft_PeripheralIridectomyPerformed bit(1),
    sft_lks_ConjunctivalFlap int(4),
    trb_ScleralFlapShape int(4) NOT NULL,
    trb_ScleralFlapThickness int(4),
    sft_ViscoelasticLeftInSitu_LookupDataId int(4),
    sft_ACMaintainerUsed bit(1),
    trb_ScleralFlapShapeOtherText nvarchar(1000),
    trb_ScleralFlapThicknessComments nvarchar(1000),
    sft_CollagenMatrixImplant bit(1),
    trb_ParacentesisNone bit(1) NOT NULL,
    trb_ViscoelasticLeftInSitu_LookupDataId int(4),
    trb_ACMaintainerUsed bit(1) NOT NULL,
    trb_SclerostomyTechnique int(4) NOT NULL,
    trb_SclerostomyTechniqueOther nvarchar(1000),
    trb_SclerostomyHeight decimal(5),
    trb_SclerostomyWidth decimal(5),
    trb_PeripheralIridectomyPerformed bit(1) NOT NULL,
    trb_CollagenMatrixImplant bit(1) NOT NULL
);

CREATE TABLE TrabeculectomyLog (
    sft_sdf_id int(4) NOT NULL,
    trb_act_id int(4) NOT NULL,
    trb_ObjectId uniqueidentifier(16) NOT NULL,
    sft_ObjectId int(4) NOT NULL,
    sft_DateAdded datetime(8) NOT NULL,
    trb_DateAdded datetime(8) NOT NULL,
    trb_AddedBy uniqueidentifier(16) NOT NULL,
    sft_AddedBy uniqueidentifier(16) NOT NULL,
    sft_Transactionid uniqueidentifier(16) NOT NULL,
    trb_Transactionid uniqueidentifier(16) NOT NULL,
    trb_Action char(1) NOT NULL,
    sft_Action char(1) NOT NULL,
    sft_PositionRight int(4),
    trb_BodyPartId int(4) NOT NULL,
    trb_NumberOfPreviousTrabs int(4) NOT NULL,
    sft_PositionLeft int(4),
    sft_ScleralFlapSizeX float(8),
    trb_tss_TractionSuture int(4),
    trb_Position int(4) NOT NULL,
    sft_ScleralFlapSizeY float(8),
    sft_ScleralFlapShape int(4),
    trb_lks_ConjunctivalFlap int(4) NOT NULL,
    trb_ScleralFlapSizeX float(8),
    sft_ScleralFlapThickness int(4),
    sft_PeripheralIridectomyPerformed bit(1),
    trb_ScleralFlapSizeY float(8),
    trb_ScleralFlapShape int(4) NOT NULL,
    sft_lks_ConjunctivalFlap int(4),
    sft_ViscoelasticLeftInSitu_LookupDataId int(4),
    trb_ScleralFlapThickness int(4),
    trb_ScleralFlapShapeOtherText nvarchar(1000),
    sft_ACMaintainerUsed bit(1),
    sft_CollagenMatrixImplant bit(1),
    trb_ScleralFlapThicknessComments nvarchar(1000),
    trb_ParacentesisNone bit(1) NOT NULL,
    trb_ViscoelasticLeftInSitu_LookupDataId int(4),
    trb_ACMaintainerUsed bit(1) NOT NULL,
    trb_SclerostomyTechnique int(4),
    trb_SclerostomyTechniqueOther nvarchar(1000),
    trb_SclerostomyHeight decimal(5),
    trb_SclerostomyWidth decimal(5),
    trb_PeripheralIridectomyPerformed bit(1) NOT NULL,
    trb_CollagenMatrixImplant bit(1) NOT NULL
);

CREATE TABLE TrabeculectomyOther (
    tdo_SurgeonDefaultId int(4) NOT NULL,
    tbo_ActivityId uniqueidentifier(16) NOT NULL,
    tbo_lks_Value int(4) NOT NULL,
    tdo_lks_Value int(4) NOT NULL
);

CREATE TABLE TrabeculectomyOtherLog (
    tdo_SurgeonDefaultId int(4) NOT NULL,
    tbo_ActivityId int(4) NOT NULL,
    tbo_ObjectId uniqueidentifier(16) NOT NULL,
    tdo_ObjectId int(4) NOT NULL,
    tdo_DateAdded datetime(8) NOT NULL,
    tbo_DateAdded datetime(8) NOT NULL,
    tbo_AddedBy uniqueidentifier(16) NOT NULL,
    tdo_AddedBy uniqueidentifier(16) NOT NULL,
    tdo_Transactionid uniqueidentifier(16) NOT NULL,
    tbo_Transactionid uniqueidentifier(16) NOT NULL,
    tbo_Action char(1) NOT NULL,
    tdo_Action char(1) NOT NULL,
    tdo_lks_Value int(4) NOT NULL,
    tbo_lks_Value int(4) NOT NULL
);

CREATE TABLE TractionSuture (
    tsd_sft_id int(4) NOT NULL,
    tss_act_ActivityId uniqueidentifier(16) NOT NULL,
    tss_lks_SutureType int(4),
    tsd_lks_Position int(4) NOT NULL,
    tsd_lks_Material int(4),
    tss_lks_SutureMaterial int(4),
    tss_other nvarchar(500)
);

CREATE TABLE TractionSutureLog (
    tss_act_ActivityId int(4) NOT NULL,
    tsd_sft_id int(4) NOT NULL,
    tsd_ObjectId int(4) NOT NULL,
    tsd_DateAdded datetime(8) NOT NULL,
    tss_lks_SutureType int(4),
    tss_lks_SutureMaterial int(4),
    tsd_AddedBy uniqueidentifier(16) NOT NULL,
    tsd_Transactionid uniqueidentifier(16) NOT NULL,
    tss_other nvarchar(500),
    tss_DateAdded datetime(8) NOT NULL,
    tsd_Action char(1) NOT NULL,
    tsd_lks_Position int(4) NOT NULL,
    tss_AddedBy uniqueidentifier(16) NOT NULL,
    tss_Transactionid uniqueidentifier(16) NOT NULL,
    tsd_lks_Material int(4),
    tss_Action char(1) NOT NULL,
    tss_ObjectId uniqueidentifier(16) NOT NULL
);

CREATE TABLE TransferRequestIdentifier (
    tri_Identifier uniqueidentifier(16) NOT NULL,
    tri_hom_MessageId int(4) NOT NULL
);

CREATE TABLE TransferResponseLink (
    trl_Id int(4) NOT NULL,
    trl_trs_TransferResponseStatusId int(4),
    trl_IsVoid bit(1) NOT NULL
);

CREATE TABLE TransferResponseStatus (
    trs_Id int(4) NOT NULL,
    trs_Description nvarchar(200) NOT NULL
);

CREATE TABLE Transposed (
    Id int(4) NOT NULL
);

CREATE TABLE Transposition (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    TechniqueId int(4),
    TechniqueId int(4) NOT NULL,
    TransposedId int(4),
    SutureId int(4),
    AmountId int(4),
    SutureId int(4)
);

CREATE TABLE TranspositionAmount (
    Id int(4) NOT NULL
);

CREATE TABLE TranspositionLog (
    SubSectionId int(4) NOT NULL,
    SubSectionId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    TechniqueId int(4) NOT NULL,
    TechniqueId int(4),
    SutureId int(4),
    TransposedId int(4),
    AmountId int(4),
    SutureId int(4)
);

CREATE TABLE TranspositionTechnique (
    Id int(4) NOT NULL
);

CREATE TABLE TransScleralCyclodiode (
    tsc_act_ActivityId uniqueidentifier(16) NOT NULL,
    tsc_sdf_id int(4) NOT NULL,
    tsc_PowerOfLaser int(4),
    tsc_Variable bit(1) NOT NULL,
    tsc_MinimumPowerOflaser int(4) NOT NULL,
    tsc_Duration int(4),
    tsc_MaximumPowerOflaser int(4),
    tsc_MinimumDuration int(4) NOT NULL,
    tsc_MaximumDuration int(4),
    tsc_TotalEnergy decimal(5),
    tsc_AudiblePops bit(1),
    tsc_TransScleralRetinalDiode bit(1) NOT NULL,
    tsc_TotalEnergyCalculated bit(1)
);

CREATE TABLE TransScleralCyclodiodeLog (
    tsc_act_ActivityId int(4) NOT NULL,
    tsc_sdf_id int(4) NOT NULL,
    tsc_ObjectId int(4) NOT NULL,
    tsc_Variable bit(1),
    tsc_MinimumPowerOflaser int(4),
    tsc_DateAdded datetime(8) NOT NULL,
    tsc_AddedBy uniqueidentifier(16) NOT NULL,
    tsc_MaximumPowerOflaser int(4),
    tsc_MinimumDuration int(4),
    tsc_Transactionid uniqueidentifier(16) NOT NULL,
    tsc_Action char(1) NOT NULL,
    tsc_MaximumDuration int(4),
    tsc_TotalEnergy decimal(5),
    tsc_PowerOfLaser int(4),
    tsc_Duration int(4),
    tsc_ObjectId uniqueidentifier(16) NOT NULL,
    tsc_DateAdded datetime(8) NOT NULL,
    tsc_AddedBy uniqueidentifier(16) NOT NULL,
    tsc_Transactionid uniqueidentifier(16) NOT NULL,
    tsc_Action char(1) NOT NULL,
    tsc_AudiblePops bit(1),
    tsc_TransScleralRetinalDiode bit(1) NOT NULL,
    tsc_TotalEnergyCalculated bit(1)
);

CREATE TABLE TransScleralMicropulseCyclodiode (
    tsm_sdf_id int(4) NOT NULL,
    tsm_act_ActivityId uniqueidentifier(16) NOT NULL,
    tsm_MinimumPowerOfLaser int(4) NOT NULL,
    tsm_PowerOfLaser int(4),
    tsm_Duration int(4),
    tsm_MaximumPowerOfLaser int(4),
    tsm_MinimumDuration int(4),
    tsm_Continuous bit(1),
    tsm_TotalDuration int(4),
    tsm_MaximumDuration int(4),
    tsm_Continuous bit(1) NOT NULL,
    tsm_DutyCycle decimal(5),
    tsm_Variable bit(1) NOT NULL,
    tsm_DutyCycle decimal(5),
    tsm_TotalEnergy decimal(5),
    tsm_TotalDuration int(4),
    tsm_TotalEnergyCalculated bit(1)
);

CREATE TABLE TransScleralMicropulseCyclodiodeLog (
    tsm_act_ActivityId int(4) NOT NULL,
    tsm_sdf_id int(4) NOT NULL,
    tsm_ObjectId int(4) NOT NULL,
    tsm_ObjectId uniqueidentifier(16) NOT NULL,
    tsm_DateAdded datetime(8) NOT NULL,
    tsm_DateAdded datetime(8) NOT NULL,
    tsm_AddedBy uniqueidentifier(16) NOT NULL,
    tsm_AddedBy uniqueidentifier(16) NOT NULL,
    tsm_Transactionid uniqueidentifier(16) NOT NULL,
    tsm_Transactionid uniqueidentifier(16) NOT NULL,
    tsm_Action char(1) NOT NULL,
    tsm_Action char(1) NOT NULL,
    tsm_MinimumPowerOfLaser int(4),
    tsm_PowerOfLaser int(4),
    tsm_Duration int(4),
    tsm_MaximumPowerOfLaser int(4),
    tsm_MinimumDuration int(4),
    tsm_Continuous bit(1),
    tsm_TotalDuration int(4),
    tsm_MaximumDuration int(4),
    tsm_Continuous bit(1) NOT NULL,
    tsm_DutyCycle decimal(5),
    tsm_Variable bit(1) NOT NULL,
    tsm_DutyCycle decimal(5),
    tsm_TotalEnergy decimal(5),
    tsm_TotalDuration int(4),
    tsm_TotalEnergyCalculated bit(1)
);

CREATE TABLE TreatmentPlan (
    itp_id int(4) NOT NULL,
    itp_activedate datetime(8) NOT NULL,
    itp_inactivedate datetime(8),
    itp_pri_id int(4) NOT NULL,
    itp_pro_id int(4) NOT NULL,
    itp_pqi_id int(4),
    itp_cpw_id int(4),
    itp_planstartdate datetime(8),
    itp_planstartinterval int(4),
    itp_planstartscope int(4) NOT NULL,
    itp_lks_id_planstartintervaltype int(4)
);

CREATE TABLE TreatmentPlanLog (
    itp_ObjectId int(4) NOT NULL,
    itp_id int(4) NOT NULL,
    itp_status int(4) NOT NULL,
    itp_activedate datetime(8) NOT NULL,
    itp_inactivedate datetime(8),
    itp_pri_id int(4) NOT NULL,
    itp_pro_id int(4) NOT NULL,
    itp_pqi_id int(4),
    itp_cpw_id int(4),
    itp_DateAdded datetime(8) NOT NULL,
    itp_AddedBy uniqueidentifier(16) NOT NULL,
    itp_TransactionId uniqueidentifier(16) NOT NULL,
    itp_Action char(1) NOT NULL,
    itp_planstartdate datetime(8),
    itp_planstartinterval int(4),
    itp_planstartscope int(4),
    itp_lks_id_planstartintervaltype int(4),
    itp_ipl_id int(4)
);

CREATE TABLE TreatmentPlanProtocol (
    tpp_id int(4) NOT NULL,
    tpp_ipp_id int(4) NOT NULL,
    tpp_protocolnumber int(4) NOT NULL,
    tpp_numberofvisits int(4) NOT NULL,
    tpp_intervalweeks int(4) NOT NULL
);

CREATE TABLE TreatmentPlanProtocolLog (
    tpp_ObjectId int(4) NOT NULL,
    tpp_id int(4) NOT NULL,
    tpp_itp_id int(4) NOT NULL,
    tpp_ipp_id int(4) NOT NULL,
    tpp_protocolnumber int(4) NOT NULL,
    tpp_numberofvisits int(4) NOT NULL,
    tpp_intervalweeks int(4) NOT NULL,
    tpp_DateAdded datetime(8) NOT NULL,
    tpp_AddedBy uniqueidentifier(16) NOT NULL,
    tpp_TransactionId uniqueidentifier(16) NOT NULL,
    tpp_Action char(1) NOT NULL
);

CREATE TABLE Tube (
    tub_act_id uniqueidentifier(16) NOT NULL,
    tub_BodyPartId int(4) NOT NULL,
    tub_lks_TubeName int(4) NOT NULL,
    tub_ConjunctivalIncision nvarchar(500),
    tub_DistanceFromLimbus int(4),
    tub_ParacentesisNone bit(1) NOT NULL,
    tub_ACMaintainerUsed bit(1) NOT NULL,
    tub_TubeEntryDegrees int(4) NOT NULL,
    tub_TubeEntryGauge int(4),
    tub_ScleralFlap bit(1) NOT NULL,
    tub_lks_DonorMaterialType int(4),
    tub_DonorMaterialTypeOther nvarchar(500),
    tub_TubePosition int(4),
    tub_TubeSlits bit(1),
    tub_PeripheralIridectomyPerformed bit(1),
    tub_SurgicalIridotomyPerformed bit(1),
    tub_OtherDetails nvarchar(4000),
    tub_FibrinGlueApplied bit(1)
);

CREATE TABLE TubeImplant (
    tft_sdf_id int(4) NOT NULL,
    tft_TractionSuturePosition int(4),
    tft_TractionSutureMaterial int(4),
    tft_ConjunctivalIncision nvarchar(500),
    tft_AcMaintainerUsed bit(1),
    tft_TubeEntryRDegrees int(4),
    tft_TubeEntryLDegrees int(4),
    tft_TubeEntryGauge int(4),
    tft_TubeAnchorSutureNumber int(4),
    tft_TubeAnchorSutureMaterial int(4),
    tft_ScleralFlap bit(1),
    tft_DonorMaterial int(4),
    tft_PeripheralIridectomy bit(1),
    tft_SurgicalIridotomy bit(1),
    tft_OtherDetails nvarchar(4000),
    tft_PlateAnchorSutureNumber int(4),
    tft_PlateAnchorSutureMaterial int(4),
    tft_DistanceFromLimbus int(4),
    tft_Position int(4),
    tft_TubeSlits bit(1),
    tft_FibrinGlue bit(1)
);

CREATE TABLE TubeImplantLog (
    tft_sdf_id int(4) NOT NULL,
    tft_ObjectId int(4) NOT NULL,
    tft_DateAdded datetime(8) NOT NULL,
    tft_AddedBy uniqueidentifier(16) NOT NULL,
    tft_Transactionid uniqueidentifier(16) NOT NULL,
    tft_Action char(1) NOT NULL,
    tft_TractionSuturePosition int(4),
    tft_TractionSutureMaterial int(4),
    tft_ConjunctivalIncision nvarchar(500),
    tft_AcMaintainerUsed bit(1),
    tft_TubeEntryRDegrees int(4),
    tft_TubeEntryLDegrees int(4),
    tft_TubeEntryGauge int(4),
    tft_TubeAnchorSutureNumber int(4),
    tft_TubeAnchorSutureMaterial int(4),
    tft_ScleralFlap bit(1),
    tft_DonorMaterial int(4),
    tft_PeripheralIridectomy bit(1),
    tft_SurgicalIridotomy bit(1),
    tft_OtherDetails nvarchar(4000),
    tft_PlateAnchorSutureNumber int(4),
    tft_PlateAnchorSutureMaterial int(4),
    tft_DistanceFromLimbus int(4),
    tft_Position int(4),
    tft_TubeSlits bit(1),
    tft_FibrinGlue bit(1)
);

CREATE TABLE TubeLog (
    tub_act_id int(4) NOT NULL,
    tub_BodyPartId int(4) NOT NULL,
    tub_ObjectId uniqueidentifier(16) NOT NULL,
    tub_DateAdded datetime(8) NOT NULL,
    tub_AddedBy uniqueidentifier(16) NOT NULL,
    tub_Transactionid uniqueidentifier(16) NOT NULL,
    tub_Action char(1) NOT NULL,
    tub_lks_TubeName int(4) NOT NULL,
    tub_ConjunctivalIncision nvarchar(500),
    tub_DistanceFromLimbus int(4),
    tub_ParacentesisNone bit(1) NOT NULL,
    tub_ACMaintainerUsed bit(1) NOT NULL,
    tub_TubeEntryDegrees int(4) NOT NULL,
    tub_TubeEntryGauge int(4),
    tub_ScleralFlap bit(1) NOT NULL,
    tub_lks_DonorMaterialType int(4),
    tub_DonorMaterialTypeOther nvarchar(500),
    tub_TubePosition int(4),
    tub_TubeSlits bit(1),
    tub_PeripheralIridectomyPerformed bit(1),
    tub_SurgicalIridotomyPerformed bit(1),
    tub_OtherDetails nvarchar(4000),
    tub_FibrinGlueApplied bit(1)
);

CREATE TABLE TubeOcclusion (
    sdo_SurgeonDefaultId int(4) NOT NULL,
    toc_act_ActivityId uniqueidentifier(16) NOT NULL,
    toc_lks_Type int(4) NOT NULL,
    sdo_TypeId int(4) NOT NULL,
    sdo_Number int(4),
    toc_number int(4),
    toc_lks_Material int(4),
    sdo_MaterialId int(4),
    sdo_ExtentId int(4),
    toc_lks_Extent int(4)
);

CREATE TABLE TubeOcclusionLog (
    sdo_SurgeonDefaultId int(4) NOT NULL,
    toc_act_ActivityId int(4) NOT NULL,
    toc_ObjectId uniqueidentifier(16) NOT NULL,
    sdo_ObjectId int(4) NOT NULL,
    sdo_DateAdded datetime(8) NOT NULL,
    toc_DateAdded datetime(8) NOT NULL,
    toc_AddedBy uniqueidentifier(16) NOT NULL,
    sdo_AddedBy uniqueidentifier(16) NOT NULL,
    sdo_Transactionid uniqueidentifier(16) NOT NULL,
    toc_Transactionid uniqueidentifier(16) NOT NULL,
    toc_Action char(1) NOT NULL,
    sdo_Action char(1) NOT NULL,
    sdo_TypeId int(4),
    toc_lks_Type int(4),
    toc_number int(4),
    sdo_Number int(4),
    sdo_MaterialId int(4),
    toc_lks_Material int(4),
    toc_lks_Extent int(4),
    sdo_ExtentId int(4)
);

CREATE TABLE TubeProcedureSutures (
    tpa_act_ActivityId uniqueidentifier(16) NOT NULL,
    tpa_number int(4) NOT NULL,
    tpa_lks_SutureMaterial int(4),
    tpa_TubeProcedureSutureType int(4) NOT NULL
);

CREATE TABLE TubeProcedureSuturesLog (
    tpa_act_ActivityId int(4) NOT NULL,
    tpa_ObjectId uniqueidentifier(16) NOT NULL,
    tpa_DateAdded datetime(8) NOT NULL,
    tpa_AddedBy uniqueidentifier(16) NOT NULL,
    tpa_Transactionid uniqueidentifier(16) NOT NULL,
    tpa_Action char(1) NOT NULL,
    tpa_number int(4),
    tpa_lks_SutureMaterial int(4),
    tpa_TubeProcedureSutureType int(4)
);

CREATE TABLE TubeProcedureSutureType (
    tps_id int(4) NOT NULL,
    tps_SingularDescription nvarchar(200) NOT NULL,
    tps_PlauralDescription nvarchar(200) NOT NULL
);

CREATE TABLE TubeSurgicalCompletionSuture (
    scs_ActivityId uniqueidentifier(16) NOT NULL,
    sut_id int(4) NOT NULL,
    sut_SurgeonDefaultId int(4) NOT NULL,
    scs_sct_id int(4) NOT NULL,
    scs_lks_SutureMaterial int(4),
    sut_sct_SutureType int(4) NOT NULL,
    sut_Number int(4),
    scs_Number int(4) NOT NULL,
    scs_id int(4) NOT NULL,
    sut_lks_SutureMaterial int(4)
);

CREATE TABLE TubeSurgicalCompletionSutureLog (
    sut_id int(4) NOT NULL,
    scs_ActivityId uniqueidentifier(16) NOT NULL,
    sut_ObjectId int(4) NOT NULL,
    sut_DateAdded datetime(8) NOT NULL,
    scs_DateAdded datetime(8) NOT NULL,
    scs_AddedBy uniqueidentifier(16) NOT NULL,
    sut_AddedBy uniqueidentifier(16) NOT NULL,
    sut_TransactionId uniqueidentifier(16) NOT NULL,
    scs_Transactionid uniqueidentifier(16) NOT NULL,
    scs_Action char(1) NOT NULL,
    sut_Action char(1) NOT NULL,
    sut_SurgeonDefaultId int(4) NOT NULL,
    scs_sct_id int(4) NOT NULL,
    scs_lks_SutureMaterial int(4),
    sut_sct_SutureType int(4) NOT NULL,
    sut_Number int(4),
    scs_Number int(4) NOT NULL,
    scs_id int(4) NOT NULL,
    sut_lks_SutureMaterial int(4),
    scs_ObjectId int(4)
);

CREATE TABLE TurbidityData (
    utb_id int(4) NOT NULL,
    utb_available bit(1) NOT NULL
);

CREATE TABLE Type (
    Id int(4) NOT NULL,
    pft_Id int(4) NOT NULL,
    pft_Name nvarchar(200) NOT NULL,
    Description nvarchar(510) NOT NULL,
    pft_IsCustomisable bit(1) NOT NULL
);

CREATE TABLE unknownpatients (
    pdm_id int(4) NOT NULL,
    pdm_gender nvarchar(510),
    pdm_lastupdated datetime(8)
);

CREATE TABLE UrobilinogenData (
    uub_id int(4) NOT NULL,
    uub_available bit(1) NOT NULL
);

CREATE TABLE User (
    use_id uniqueidentifier(16) NOT NULL,
    use_domainsid int(4),
    use_prefix nvarchar(510),
    use_givenname nvarchar(510),
    use_middlename nvarchar(510),
    use_familyname nvarchar(510),
    use_suffix nvarchar(510),
    use_passwordsalt varchar(255) NOT NULL,
    use_password nvarchar(510),
    use_secretquestion nvarchar(510),
    use_secretresponse nvarchar(510),
    use_initials nvarchar(20),
    use_fullname nvarchar(510),
    use_qualifications nvarchar(510),
    use_email nvarchar(510),
    use_telephone varchar(255),
    use_description nvarchar(510),
    use_ust_id int(4) NOT NULL,
    use_use_id_secretary uniqueidentifier(16),
    use_emplyomentstatus tinyint(1),
    use_status tinyint(1),
    use_passwordlastupdated datetime(8) NOT NULL,
    use_failedlogincount tinyint(1),
    use_gra_id int(4),
    use_blb_id_signature uniqueidentifier(16),
    use_signoff varchar(255),
    use_fax varchar(255),
    use_nationalcode varchar(255),
    use_ntncode varchar(255),
    use_passwordstatus int(4),
    use_lks_id_gender int(4) NOT NULL,
    use_changepasswordonnextlogin bit(1) NOT NULL,
    use_uas_id int(4) NOT NULL,
    use_BillingCode nvarchar(40),
    use_InformationSystemsUsername nvarchar(200),
    use_NumberOfChangePasswordAttemptsSinceLastLogin int(4) NOT NULL
);

CREATE TABLE UserAccountStatus (
    uas_id int(4) NOT NULL,
    uas_description nvarchar(40) NOT NULL
);

CREATE TABLE userdefaultdrugoptionslink (
    udd_id int(4) NOT NULL,
    udd_source int(4),
    udd_order int(4),
    udd_required int(4) NOT NULL,
    udd_dsc_id int(4),
    udd_drs_id int(4),
    udd_StartDateDayAfterSurgery bit(1) NOT NULL
);

CREATE TABLE userdefaultdrugoptionslinklog (
    udd_ObjectId int(4) NOT NULL,
    udd_id int(4) NOT NULL,
    udd_use_id uniqueidentifier(16),
    udd_ddo_id int(4),
    udd_source int(4),
    udd_order int(4),
    udd_DateAdded datetime(8) NOT NULL,
    udd_AddedBy uniqueidentifier(16) NOT NULL,
    udd_TransactionId uniqueidentifier(16) NOT NULL,
    udd_Action char(1) NOT NULL,
    udd_required int(4),
    udd_dsc_id int(4),
    udd_drs_id int(4),
    udd_StartDateDayAfterSurgery bit(1) NOT NULL
);

CREATE TABLE userdefaultgroups (
    udg_id int(4) NOT NULL,
    udg_ust_id int(4) NOT NULL,
    udg_gra_id int(4),
    udg_grp_id uniqueidentifier(16) NOT NULL
);

CREATE TABLE usergradehistory (
    ugh_id int(4) NOT NULL,
    ugh_use_id uniqueidentifier(16) NOT NULL,
    ugh_gra_id int(4) NOT NULL,
    ugh_datefrom datetime(8) NOT NULL,
    ugh_dateto datetime(8)
);

CREATE TABLE UserGroup (
    rug_Id uniqueidentifier(16) NOT NULL,
    Id uniqueidentifier(16) NOT NULL,
    GroupName nvarchar(100) NOT NULL,
    rug_GroupName nvarchar(100) NOT NULL,
    rug_Available bit(1) NOT NULL,
    Available bit(1) NOT NULL
);

CREATE TABLE UserGroupLog (
    Id int(4) NOT NULL,
    rug_Id int(4) NOT NULL,
    rug_ObjectId uniqueidentifier(16) NOT NULL,
    GroupName nvarchar(100) NOT NULL,
    Available bit(1) NOT NULL,
    rug_DateAdded datetime(8) NOT NULL,
    rug_AddedBy uniqueidentifier(16) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    rug_TransactionId uniqueidentifier(16) NOT NULL,
    rug_Action char(1) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    rug_GroupName nvarchar(100) NOT NULL,
    rug_Available bit(1) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE UserGroupUser (
    GroupId uniqueidentifier(16) NOT NULL,
    ugu_rug_Id uniqueidentifier(16) NOT NULL,
    ugu_use_Id uniqueidentifier(16) NOT NULL,
    UserId uniqueidentifier(16) NOT NULL
);

CREATE TABLE UserGroupUserLog (
    GroupId int(4) NOT NULL,
    UserId uniqueidentifier(16) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL
);

CREATE TABLE userlog (
    use_ObjectId uniqueidentifier(16) NOT NULL,
    use_id int(4) NOT NULL,
    use_username nvarchar(510),
    use_domainuser nvarchar(510),
    use_domainsid int(4),
    use_prefix nvarchar(510),
    use_givenname nvarchar(510),
    use_middlename nvarchar(510),
    use_familyname nvarchar(510),
    use_suffix nvarchar(510),
    use_passwordsalt varchar(255) NOT NULL,
    use_password nvarchar(510),
    use_secretquestion nvarchar(510),
    use_secretresponse nvarchar(510),
    use_initials nvarchar(20),
    use_fullname nvarchar(510),
    use_qualifications nvarchar(510),
    use_email nvarchar(510),
    use_telephone varchar(255),
    use_description nvarchar(510),
    use_ust_id int(4) NOT NULL,
    use_use_id_secretary uniqueidentifier(16),
    use_emplyomentstatus tinyint(1),
    use_status tinyint(1),
    use_failedlogincount tinyint(1),
    use_adnativeguid uniqueidentifier(16),
    use_gra_id int(4),
    use_blb_id_signature uniqueidentifier(16),
    use_signoff varchar(255),
    use_fax varchar(255),
    use_nationalcode varchar(255),
    use_ntncode varchar(255),
    use_passwordstatus int(4),
    use_DateAdded datetime(8) NOT NULL,
    use_AddedBy uniqueidentifier(16) NOT NULL,
    use_TransactionId uniqueidentifier(16) NOT NULL,
    use_Action char(1) NOT NULL,
    use_passwordlastupdated datetime(8),
    use_lks_id_gender int(4),
    use_changepasswordonnextlogin bit(1),
    use_uas_id int(4) NOT NULL,
    use_BillingCode nvarchar(40),
    use_InformationSystemsUsername nvarchar(200),
    use_NumberOfChangePasswordAttemptsSinceLastLogin int(4)
);

CREATE TABLE UserMappings (
    SourceID uniqueidentifier(16) NOT NULL,
    DestinationID uniqueidentifier(16) NOT NULL,
    DestinationIDInt int(4),
    IsStaticEnum bit(1) NOT NULL,
    MedisoftMigrationTypeId int(4) NOT NULL
);

CREATE TABLE UserPathway (
    sup_id int(4) NOT NULL
);

CREATE TABLE userpermission (
    upe_id uniqueidentifier(16) NOT NULL,
    upe_deny bit(1) NOT NULL,
    upe_active bit(1)
);

CREATE TABLE userpermissionlog (
    upe_ObjectId uniqueidentifier(16) NOT NULL,
    upe_id int(4) NOT NULL,
    upe_use_id uniqueidentifier(16) NOT NULL,
    upe_per_id int(4) NOT NULL,
    upe_deny bit(1) NOT NULL,
    upe_active bit(1),
    upe_DateAdded datetime(8) NOT NULL,
    upe_AddedBy uniqueidentifier(16) NOT NULL,
    upe_TransactionId uniqueidentifier(16) NOT NULL,
    upe_Action char(1) NOT NULL
);

CREATE TABLE UserSectionFavourite (
    dau_id int(4) NOT NULL,
    dau_use_id uniqueidentifier(16) NOT NULL,
    dau_sit_id uniqueidentifier(16) NOT NULL,
    dau_ety_id int(4) NOT NULL,
    dau_cpw_id int(4) NOT NULL,
    dau_das_id int(4) NOT NULL
);

CREATE TABLE UserSectionFavouriteLog (
    dau_ObjectId int(4) NOT NULL,
    dau_id int(4) NOT NULL,
    dau_use_id uniqueidentifier(16) NOT NULL,
    dau_sit_id uniqueidentifier(16) NOT NULL,
    dau_ety_id int(4) NOT NULL,
    dau_cpw_id int(4) NOT NULL,
    dau_das_id int(4) NOT NULL,
    dau_DateAdded datetime(8) NOT NULL,
    dau_AddedBy uniqueidentifier(16) NOT NULL,
    dau_Transactionid uniqueidentifier(16) NOT NULL,
    dau_Action char(1) NOT NULL
);

CREATE TABLE userspecialty (
    usp_id uniqueidentifier(16) NOT NULL,
    usp_use_id uniqueidentifier(16) NOT NULL,
    usp_spe_id int(4) NOT NULL
);

CREATE TABLE userspecialtylog (
    usp_ObjectId uniqueidentifier(16) NOT NULL,
    usp_id int(4) NOT NULL,
    usp_use_id uniqueidentifier(16) NOT NULL,
    usp_spe_id int(4) NOT NULL,
    usp_DateAdded datetime(8) NOT NULL,
    usp_AddedBy uniqueidentifier(16) NOT NULL,
    usp_TransactionId uniqueidentifier(16) NOT NULL,
    usp_Action char(1) NOT NULL
);

CREATE TABLE usertype (
    ust_id int(4) NOT NULL,
    ust_desc nvarchar(510),
    ust_valid bit(1),
    ust_showonwebui bit(1) NOT NULL,
    ust_FeminineDescription nvarchar(450)
);

CREATE TABLE UserWarning (
    euw_Id int(4) NOT NULL,
    euw_use_UserId uniqueidentifier(16) NOT NULL,
    euw_eaa_ApplicationId int(4) NOT NULL,
    euw_TimesShown int(4) NOT NULL,
    euw_DoNotShowAgain bit(1) NOT NULL
);

CREATE TABLE UVDetails (
    Id int(4) NOT NULL,
    ActivityId uniqueidentifier(16) NOT NULL,
    DeviceId int(4),
    DeviceId int(4),
    UVPower int(4),
    UVPower int(4) NOT NULL,
    Duration int(4),
    Duration int(4),
    ExposureId int(4),
    ExposureId int(4),
    ExposureSeconds decimal(5),
    ExposureSeconds decimal(5),
    TopographyGuided bit(1),
    TopographyGuided bit(1),
    UVTotalEnergy decimal(5) NOT NULL,
    UVTotalEnergy decimal(5),
    OtherDetails nvarchar(4000)
);

CREATE TABLE UVDetailsLog (
    ActivityId int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId uniqueidentifier(16) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    DeviceId int(4),
    DeviceId int(4),
    UVPower int(4),
    UVPower int(4) NOT NULL,
    Duration int(4),
    Duration int(4),
    ExposureId int(4),
    ExposureId int(4),
    ExposureSeconds decimal(5),
    ExposureSeconds decimal(5),
    TopographyGuided bit(1),
    TopographyGuided bit(1),
    UVTotalEnergy decimal(5) NOT NULL,
    UVTotalEnergy decimal(5),
    OtherDetails nvarchar(4000)
);

CREATE TABLE UVDevice (
    Id int(4) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL
);

CREATE TABLE UVDeviceLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Description nvarchar(510) NOT NULL,
    Available bit(1) NOT NULL,
    Order int(4) NOT NULL,
    StaticId int(4)
);

CREATE TABLE ValidationResult (
    ecv_id int(4) NOT NULL,
    ecv_validationtarget_id uniqueidentifier(16),
    ecv_isvalid bit(1) NOT NULL,
    ecv_validationtype int(4) NOT NULL,
    ecv_datevalidation datetime(8) NOT NULL
);

CREATE TABLE ValidationResultItem (
    vri_id int(4) NOT NULL,
    vri_ecv_id int(4) NOT NULL,
    vri_validationkey varchar(1000),
    vri_validationmessage varchar(4000)
);

CREATE TABLE VasoconstrictiveAgent (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    VasoconstrictiveAgentId int(4) NOT NULL
);

CREATE TABLE VasoconstrictiveAgentLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    PreparationId int(4) NOT NULL,
    VasoconstrictiveAgentId int(4) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE VasoconstrictiveAgentOther (
    Id int(4) NOT NULL,
    OtherId int(4) NOT NULL,
    VasoconstrictiveAgentId int(4) NOT NULL,
    BodyPartId int(4) NOT NULL
);

CREATE TABLE VasoconstrictiveAgentOtherLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    BodyPartId int(4) NOT NULL,
    VasoconstrictiveAgentId int(4) NOT NULL,
    OtherId int(4) NOT NULL
);

CREATE TABLE version (
    ver_id int(4) NOT NULL
);

CREATE TABLE versiondb (
    vdb_id int(4) NOT NULL,
    vdb_versiondb varchar(20) NOT NULL,
    vdb_major int(4) NOT NULL,
    vdb_minor int(4) NOT NULL,
    vdb_build int(4) NOT NULL,
    vdb_versionapi varchar(255)
);

CREATE TABLE versionfile (
    fil_id int(4) NOT NULL,
    fil_filename varchar(100) NOT NULL,
    fil_filepath varchar(250) NOT NULL,
    fil_filehash varchar(50) NOT NULL
);

CREATE TABLE VersionOptions (
    VersionValue float(8) NOT NULL,
    VersionDescription nvarchar(8) NOT NULL,
    VersionId int(4) NOT NULL
);

CREATE TABLE versionstofiles (
    version_id int(4) NOT NULL,
    versionfile_id int(4) NOT NULL
);

CREATE TABLE versionworkstation (
    wks_id int(4) NOT NULL,
    wks_friendlyid varchar(255) NOT NULL,
    wks_ver_id_latest int(4),
    wks_ver_id_current int(4)
);

CREATE TABLE VerticalDeviation (
    Id int(4) NOT NULL,
    VerticalDeviationName nvarchar(100) NOT NULL
);

CREATE TABLE VerticalPreAdjustment (
    Id int(4) NOT NULL
);

CREATE TABLE VerticalTarget (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    VerticalTargetId int(4),
    VerticalTargetId int(4) NOT NULL,
    RangeFrom tinyint(1),
    RangeFrom tinyint(1),
    RangeTo tinyint(1),
    RangeTo tinyint(1)
);

CREATE TABLE VerticalTargetLog (
    Id int(4) NOT NULL,
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    VerticalTargetId int(4) NOT NULL,
    VerticalTargetId int(4),
    RangeFrom tinyint(1),
    RangeFrom tinyint(1),
    RangeTo tinyint(1),
    RangeTo tinyint(1)
);

CREATE TABLE VerticalTestFindings (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    VerticalDeviationId int(4),
    MeasurementStartValue float(8),
    MeasurementEndValue float(8),
    MeasurementRange bit(1),
    MeasurementUnitId int(4) NOT NULL,
    Comments nvarchar(1000),
    FresnelPrismBaseVerticalDirectionId int(4),
    NoDeviation bit(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE VerticalTestFindingsLog (
    Id int(4) NOT NULL,
    FindingEyeId int(4),
    VerticalDeviationId int(4),
    MeasurementStartValue float(8),
    MeasurementEndValue float(8),
    MeasurementRange bit(1),
    MeasurementUnitId int(4) NOT NULL,
    Comments nvarchar(1000),
    FresnelPrismBaseVerticalDirectionId int(4),
    NoDeviation bit(1) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TestId int(4) NOT NULL,
    PositionOfGazeId int(4) NOT NULL
);

CREATE TABLE Viscoelastic (
    Id int(4) NOT NULL,
    svd_SurgeonDefaultId int(4) NOT NULL,
    svd_lqu_id int(4) NOT NULL,
    ListQuestionId int(4) NOT NULL
);

CREATE TABLE ViscoelasticLog (
    Id int(4) NOT NULL,
    svd_SurgeonDefaultId int(4) NOT NULL,
    svd_ObjectId int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    svd_DateAdded datetime(8) NOT NULL,
    svd_AddedBy uniqueidentifier(16) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    Transactionid uniqueidentifier(16) NOT NULL,
    svd_Transactionid uniqueidentifier(16) NOT NULL,
    svd_Action char(1) NOT NULL,
    Action char(1) NOT NULL,
    ListQuestionId int(4) NOT NULL,
    svd_lqu_id int(4)
);

CREATE TABLE Visit (
    clv_id int(4) NOT NULL,
    clv_18week varchar(5),
    clv_18weekpas varchar(5),
    clv_pasupdated varchar(500),
    clv_pasupdatedtime datetime(8),
    clv_autoupdate bit(1) NOT NULL
);

CREATE TABLE VisitLog (
    clv_Id int(4) NOT NULL,
    clv_csc_id int(4),
    clv_arrivaldatetime datetime(8),
    clv_flags int(4) NOT NULL,
    clv_18week varchar(5),
    clv_lks_id_transport int(4),
    clv_comment nvarchar(1000),
    clv_18weekpas varchar(5),
    clv_pasupdated varchar(500),
    clv_pasupdatedtime datetime(8),
    clv_updateddatetime datetime(8),
    clv_autoupdate bit(1),
    clv_lks_id_dnareason int(4),
    clv_dnacomment nvarchar(1000),
    clv_changeNumber int(4) NOT NULL,
    clv_departuretime datetime(8),
    clv_ObjectId int(4) NOT NULL,
    clv_DateAdded datetime(8) NOT NULL,
    clv_AddedBy uniqueidentifier(16) NOT NULL,
    clv_TransactionId uniqueidentifier(16) NOT NULL,
    clv_Action char(1) NOT NULL
);

CREATE TABLE VisitNumber (
    dvn_Id int(4) NOT NULL
);

CREATE TABLE VisitNumberLog (
    dvn_Id int(4) NOT NULL,
    dvn_ObjectId int(4) NOT NULL,
    dvn_DateAdded datetime(8) NOT NULL,
    dvn_AddedBy uniqueidentifier(16) NOT NULL,
    dvn_TransactionId uniqueidentifier(16) NOT NULL,
    dvn_Action char(1) NOT NULL,
    dvn_doc_DocumentId uniqueidentifier(16) NOT NULL,
    dvn_Date date(3) NOT NULL,
    dvn_Value nvarchar(40) NOT NULL
);

CREATE TABLE VisitStep (
    cst_id int(4) NOT NULL,
    cst_stopclockcolor int(4),
    cst_IsPreArrival bit(1) NOT NULL
);

CREATE TABLE VisitStepHistory (
    csh_id int(4) NOT NULL,
    csh_step_id int(4) NOT NULL,
    csh_status_id int(4) NOT NULL,
    csh_user_id uniqueidentifier(16) NOT NULL,
    csh_update_timestamp datetime(8) NOT NULL
);

CREATE TABLE VisitStepHistoryLog (
    csh_Id int(4) NOT NULL,
    csh_step_id int(4) NOT NULL,
    csh_status_id int(4) NOT NULL,
    csh_user_id uniqueidentifier(16) NOT NULL,
    csh_update_timestamp datetime(8) NOT NULL,
    csh_ObjectId int(4) NOT NULL,
    csh_DateAdded datetime(8) NOT NULL,
    csh_AddedBy uniqueidentifier(16) NOT NULL,
    csh_TransactionId uniqueidentifier(16) NOT NULL,
    csh_Action char(1) NOT NULL
);

CREATE TABLE VisitStepLog (
    cst_Id int(4) NOT NULL,
    cst_clv_id int(4) NOT NULL,
    cst_hcs_id int(4),
    cst_use_id uniqueidentifier(16),
    cst_order int(4) NOT NULL,
    cst_status int(4) NOT NULL,
    cst_stopclockcolor int(4),
    cst_timestamp datetime(8),
    cst_updated datetime(8),
    cst_stp_manual_id int(4),
    cst_deleted bit(1) NOT NULL,
    cst_changeNumber int(4) NOT NULL,
    cst_stepName nvarchar(510),
    cst_ObjectId int(4) NOT NULL,
    cst_DateAdded datetime(8) NOT NULL,
    cst_AddedBy uniqueidentifier(16) NOT NULL,
    cst_TransactionId uniqueidentifier(16) NOT NULL,
    cst_Action char(1) NOT NULL,
    cst_IsPreArrival bit(1)
);

CREATE TABLE VisualAcuity (
    Id int(4) NOT NULL
);

CREATE TABLE visualacuity (
    evl_id int(4) NOT NULL
);

CREATE TABLE VisualAcuity (
    ReferralRequestId int(4) NOT NULL,
    Date date(3) NOT NULL
);

CREATE TABLE visualacuity (
    evl_RecordedOn date(3)
);

CREATE TABLE VisualAcuityCorrection (
    Id int(4) NOT NULL,
    Description nvarchar(60) NOT NULL
);

CREATE TABLE visualacuitylog (
    evl_ObjectId int(4) NOT NULL,
    evl_id int(4) NOT NULL,
    evl_act_id uniqueidentifier(16) NOT NULL,
    evl_bod_id int(4),
    evl_vav_id int(4),
    evl_lks_id_correction int(4),
    evl_lks_id_type int(4),
    evl_prosthesis bit(1),
    evl_source int(4),
    evl_lks_id_notation int(4),
    evl_lks_id_measurementtype int(4),
    evl_measurementdistance int(4),
    evl_status int(4),
    evl_displayset int(4),
    evl_DateAdded datetime(8) NOT NULL,
    evl_AddedBy uniqueidentifier(16) NOT NULL,
    evl_TransactionId uniqueidentifier(16) NOT NULL,
    evl_Action char(1) NOT NULL,
    evl_deleted bit(1),
    evl_RecordedOn date(3)
);

CREATE TABLE VisualAcuityMapping (
    Id int(4) NOT NULL,
    sva_id int(4) NOT NULL,
    VisualAcuityId int(4) NOT NULL,
    sva_vav_id_mappedValue int(4) NOT NULL
);

CREATE TABLE VisualAcuityNotation (
    Id int(4) NOT NULL,
    Description nvarchar(60) NOT NULL
);

CREATE TABLE visualacuitytest (
    vat_id int(4) NOT NULL,
    vat_test varchar(255) NOT NULL,
    vat_use_id uniqueidentifier(16) NOT NULL,
    vat_lks_id_correction int(4) NOT NULL,
    vat_score int(4) NOT NULL,
    vat_lks_id_chart int(4) NOT NULL,
    vat_lks_id_distance int(4) NOT NULL,
    vat_lks_id_chartsize int(4)
);

CREATE TABLE VisualAcuityUnit (
    svu_id int(4) NOT NULL,
    svu_name nvarchar(200) NOT NULL,
    svu_enabled bit(1) NOT NULL
);

CREATE TABLE visualacuityvalue (
    vav_id int(4) NOT NULL,
    vav_value nvarchar(510),
    vav_lks_id_format int(4) NOT NULL,
    vav_lks_id_type int(4) NOT NULL,
    vav_rank int(4) NOT NULL,
    vav_overallrank float(8)
);

CREATE TABLE visualacuityvalueconversion (
    vvc_id int(4) NOT NULL,
    vvc_exact bit(1)
);

CREATE TABLE visualacuityValueConversiontest (
    vvc_id int(4) NOT NULL,
    vvc_vav_id_from int(4) NOT NULL,
    vvc_vav_id_to int(4) NOT NULL
);

CREATE TABLE VisualFieldTest (
    Id int(4) NOT NULL,
    TestDuration time(3) NOT NULL,
    FoveaStatus varchar(255) NOT NULL,
    FoveaValue nvarchar(510),
    BackgroundIllumination nvarchar(510) NOT NULL
);

CREATE TABLE VisualFieldTestLog (
    Id int(4) NOT NULL,
    ObjectId int(4) NOT NULL,
    DateAdded datetime(8) NOT NULL,
    AddedBy uniqueidentifier(16) NOT NULL,
    TransactionId uniqueidentifier(16) NOT NULL,
    Action char(1) NOT NULL,
    TestDuration time(3) NOT NULL,
    FoveaStatus varchar(255) NOT NULL,
    FoveaValue nvarchar(510),
    BackgroundIllumination nvarchar(510) NOT NULL,
    HumphreyTestId int(4) NOT NULL
);

CREATE TABLE vitreoretinal (
    vit_id int(4) NOT NULL,
    vit_bod_id int(4) NOT NULL,
    vit_lks_id_conjincision int(4),
    vit_chandelierat int(4),
    vit_lks_id_posthyaloidstatus int(4),
    vit_sclerostomywidened bit(1) NOT NULL,
    vit_maxcutrate int(4),
    vit_lks_id_heavyliquid int(4),
    vit_retinectomyat int(4),
    vit_lks_id_drainageofsrfmethod int(4),
    vit_drainageofsrfat int(4),
    vit_drainageofsrfcompletion int(4),
    vit_residualfluidat int(4),
    vit_irishooksat int(4),
    vit_peripheraliridectomyat int(4),
    vit_ividrugqualifierid int(4),
    vit_scleralbuckle bit(1) NOT NULL,
    vit_lks_tamponadingagent int(4),
    vit_tamponadeconcentration int(4),
    vit_tamponadevolume float(8),
    vit_tamponadefill int(4),
    vit_acparacentesisat int(4),
    vit_lks_id_cra int(4),
    vit_numberofsclerostomysutures int(4),
    vit_lks_id_sclerostomysuturematerial int(4),
    vit_numberofconjunctivalsutures int(4),
    vit_lks_id_conjunctivalsuturematerial int(4),
    vit_patientpostures bit(1) NOT NULL
);

CREATE TABLE vitreoretinallog (
    vit_ObjectId int(4) NOT NULL,
    vit_id int(4) NOT NULL,
    vit_act_id uniqueidentifier(16) NOT NULL,
    vit_bod_id int(4) NOT NULL,
    vit_lks_id_conjincision int(4),
    vit_chandelierat int(4),
    vit_lks_id_posthyaloidstatus int(4),
    vit_sclerostomywidened bit(1) NOT NULL,
    vit_maxcutrate int(4),
    vit_lks_id_heavyliquid int(4),
    vit_retinectomyat int(4),
    vit_lks_id_drainageofsrfmethod int(4),
    vit_drainageofsrfat int(4),
    vit_drainageofsrfcompletion int(4),
    vit_residualfluidat int(4),
    vit_irishooksat int(4),
    vit_peripheraliridectomyat int(4),
    vit_ividrugqualifierid int(4),
    vit_scleralbuckle bit(1) NOT NULL,
    vit_lks_tamponadingagent int(4),
    vit_tamponadeconcentration int(4),
    vit_tamponadevolume float(8),
    vit_tamponadefill int(4),
    vit_acparacentesisat int(4),
    vit_lks_id_cra int(4),
    vit_numberofsclerostomysutures int(4),
    vit_lks_id_sclerostomysuturematerial int(4),
    vit_numberofconjunctivalsutures int(4),
    vit_lks_id_conjunctivalsuturematerial int(4),
    vit_patientpostures bit(1) NOT NULL,
    vit_DateAdded datetime(8) NOT NULL,
    vit_AddedBy uniqueidentifier(16) NOT NULL,
    vit_TransactionId uniqueidentifier(16) NOT NULL,
    vit_Action char(1) NOT NULL
);

CREATE TABLE vitreoretinalposture (
    vtp_id int(4) NOT NULL,
    vtp_displayorder int(4) NOT NULL,
    vtp_posturesetting int(4) NOT NULL,
    vtp_lks_id_posture int(4),
    vtp_duration int(4),
    vtp_lks_id_timeofday int(4),
    vtp_timeofdaydays int(4),
    vtp_isdeleted bit(1) NOT NULL,
    vtp_durationunit int(4)
);

CREATE TABLE vitreoretinalposturelog (
    vtp_ObjectId int(4) NOT NULL,
    vtp_id int(4) NOT NULL,
    vtp_vit_id int(4) NOT NULL,
    vtp_displayorder int(4) NOT NULL,
    vtp_posturesetting int(4) NOT NULL,
    vtp_lks_id_posture int(4),
    vtp_duration int(4),
    vtp_lks_id_timeofday int(4),
    vtp_timeofdaydays int(4),
    vtp_isdeleted bit(1) NOT NULL,
    vtp_durationunit int(4),
    vtp_DateAdded datetime(8) NOT NULL,
    vtp_AddedBy uniqueidentifier(16) NOT NULL,
    vtp_TransactionId uniqueidentifier(16) NOT NULL,
    vtp_Action char(1) NOT NULL
);

CREATE TABLE vitreoretinalscleralbuckle (
    vsb_id int(4) NOT NULL,
    vsb_displayorder int(4) NOT NULL,
    vsb_lks_id_type int(4),
    vsb_lks_id_size int(4),
    vsb_at int(4),
    vsb_lks_id_indent int(4),
    vsb_numberofsutures int(4),
    vsb_lks_id_suturematerial int(4),
    vsb_isdeleted bit(1) NOT NULL
);

CREATE TABLE vitreoretinalscleralbucklelog (
    vsb_ObjectId int(4) NOT NULL,
    vsb_id int(4) NOT NULL,
    vsb_vit_id int(4) NOT NULL,
    vsb_displayorder int(4) NOT NULL,
    vsb_lks_id_type int(4),
    vsb_lks_id_size int(4),
    vsb_at int(4),
    vsb_lks_id_indent int(4),
    vsb_numberofsutures int(4),
    vsb_lks_id_suturematerial int(4),
    vsb_isdeleted bit(1) NOT NULL,
    vsb_DateAdded datetime(8) NOT NULL,
    vsb_AddedBy uniqueidentifier(16) NOT NULL,
    vsb_TransactionId uniqueidentifier(16) NOT NULL,
    vsb_Action char(1) NOT NULL
);

CREATE TABLE vitreoretinalsclerostomy (
    vts_id int(4) NOT NULL,
    vts_displayorder int(4) NOT NULL,
    vts_lks_id_gauge int(4),
    vts_mmfromlimbus decimal(5),
    vts_sclerostomiesat int(4),
    vts_isdeleted bit(1) NOT NULL,
    vts_lks_id_type int(4)
);

CREATE TABLE vitreoretinalsclerostomylog (
    vts_ObjectId int(4) NOT NULL,
    vts_id int(4) NOT NULL,
    vts_vit_id int(4) NOT NULL,
    vts_displayorder int(4) NOT NULL,
    vts_lks_id_gauge int(4),
    vts_mmfromlimbus decimal(5),
    vts_sclerostomiesat int(4),
    vts_isdeleted bit(1) NOT NULL,
    vts_lks_id_type int(4),
    vts_DateAdded datetime(8) NOT NULL,
    vts_AddedBy uniqueidentifier(16) NOT NULL,
    vts_TransactionId uniqueidentifier(16) NOT NULL,
    vts_Action char(1) NOT NULL
);

CREATE TABLE vitreoretinalsclerostomywidened (
    vsw_id int(4) NOT NULL,
    vsw_sclerostomyat int(4),
    vsw_from time(5),
    vsw_to time(5),
    vsw_isdeleted bit(1) NOT NULL
);

CREATE TABLE vitreoretinalsclerostomywidenedlog (
    vsw_ObjectId int(4) NOT NULL,
    vsw_id int(4) NOT NULL,
    vsw_vit_id int(4) NOT NULL,
    vsw_sclerostomyat int(4),
    vsw_from time(5),
    vsw_to time(5),
    vsw_isdeleted bit(1) NOT NULL,
    vsw_DateAdded datetime(8) NOT NULL,
    vsw_AddedBy uniqueidentifier(16) NOT NULL,
    vsw_TransactionId uniqueidentifier(16) NOT NULL,
    vsw_Action char(1) NOT NULL
);

CREATE TABLE WorkflowStatus (
    csw_Id int(4) NOT NULL,
    csw_std_Id int(4) NOT NULL,
    csw_Status nvarchar(100) NOT NULL,
    csw_Order int(4) NOT NULL,
    csw_FinalStepTransferData bit(1) NOT NULL,
    csw_IsReadonly bit(1) NOT NULL,
    csw_StaticId int(4),
    csw_IsDeletable int(4) NOT NULL,
    csw_TriggerEncounterLock bit(1),
    csw_dcs_DataCompletenessCheckId int(4)
);

CREATE TABLE WorkflowStatusLog (
    csw_id int(4) NOT NULL,
    csw_ObjectId int(4) NOT NULL,
    csw_DateAdded datetime(8) NOT NULL,
    csw_AddedBy uniqueidentifier(16) NOT NULL,
    csw_Transactionid uniqueidentifier(16) NOT NULL,
    csw_Action char(1) NOT NULL,
    csw_std_Id int(4),
    csw_Status nvarchar(100),
    csw_Order int(4),
    csw_FinalStepTransferData bit(1) NOT NULL,
    csw_IsReadonly bit(1) NOT NULL,
    csw_StaticId int(4),
    csw_IsDeletable int(4) NOT NULL,
    csw_TriggerEncounterLock bit(1),
    csw_dcs_DataCompletenessCheckId int(4)
);

CREATE TABLE x_correctedconcepts (
    cpt_id float(8),
    cpt_description nvarchar(510),
    cpt_cpy_id float(8),
    cpt_snomedid nvarchar(510),
    cpt_searchable float(8),
    cpt_status float(8),
    cpt_action float(8),
    cpt_mustqualify float(8),
    cpt_clinicfinding float(8),
    cpt_diagnosis float(8),
    cpt_history float(8),
    cpt_investigation float(8),
    cpt_flag float(8),
    cpt_bsm_id float(8),
    cpt_negated float(8),
    cpt_negationcomment nvarchar(510),
    cpt_cpt_idpositive nvarchar(510),
    cpt_eyerelated float(8),
    cpt_ccy_id float(8),
    cpt_icd10 nvarchar(510)
);

CREATE TABLE x_diagnosisactual (
    cpt_id float(8),
    cpt_description nvarchar(510),
    cpt_diagnosis float(8)
);

CREATE TABLE x_duplicates (
    cpt_keep float(8),
    cpt_id float(8),
    cpt_description nvarchar(510)
);

CREATE TABLE x_logmarmapping (
    lks_descshort nvarchar(510),
    vavIDFrom nvarchar(510),
    vav_value nvarchar(510),
    lks_descshort1 nvarchar(510),
    vavIDTo nvarchar(510),
    vav_value1 nvarchar(510),
    CorrectID nvarchar(510),
    Correct value nvarchar(510)
);

CREATE TABLE x_Mergeconcepts (
    ParentID float(8),
    ParentName nvarchar(510),
    ChildID float(8),
    ChildName nvarchar(510)
);

CREATE TABLE x_MergeConcepts2 (
    ParentID float(8),
    ParentName nvarchar(510),
    ChildID float(8),
    ChildName nvarchar(510)
);

CREATE TABLE x_MergeConcepts3 (
    ParentID float(8),
    ParentName nvarchar(510),
    ChildID float(8) NOT NULL,
    ChildName nvarchar(510)
);

CREATE TABLE x_Misspelledduplicates (
    ParentID float(8),
    ParentName nvarchar(510),
    ChildID float(8),
    ChildName nvarchar(510)
);

CREATE TABLE x_settings (
    set_id float(8),
    set_value float(8),
    set_description nvarchar(510),
    set_context float(8),
    set_per_id float(8),
    set_displaygroup nvarchar(510),
    set_datatype float(8),
    set_lookup nvarchar(510),
    set_defaultable float(8),
    set_public float(8),
    set_valuenumeric nvarchar(510),
    set_linkedsetting nvarchar(510),
    set_name nvarchar(510)
);

CREATE TABLE x_snellenmapping (
    lks_descshort nvarchar(510),
    vavIDFrom nvarchar(510),
    vav_value nvarchar(510),
    lks_descshort1 nvarchar(510),
    vavIDTo nvarchar(510),
    vav_value1 nvarchar(510),
    CorrectID nvarchar(510),
    Correct value nvarchar(510)
);

CREATE TABLE x_usergrades (
    UserType float(8),
    grade nvarchar(510),
    Long description nvarchar(510),
    gradeid float(8)
);

CREATE TABLE x_VaMappingInexact (
    lks_descshort nvarchar(510),
    vavIDFrom nvarchar(510),
    vav_value nvarchar(510),
    lks_descshort1 nvarchar(510),
    vavIDTo nvarchar(510),
    vav_value1 nvarchar(510),
    vvc_exact nvarchar(510)
);

CREATE TABLE XMLStore (
    XMLStoreId int(4) NOT NULL,
    XMLValue xml(-1) NOT NULL
);
