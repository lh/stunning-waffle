CREATE TABLE [AccessionNumber] (
    [han_Id] int NOT NULL PRIMARY KEY,
    [han_hpc_ProcedureCodeId] int,
    [han_IsFromRegistration] bit NOT NULL
);

CREATE TABLE [AccessionNumberEncounterLink] (
    [hel_ect_EncounterId] uniqueidentifier NOT NULL PRIMARY KEY,
    [hel_StudyInstanceUid] nvarchar(400)
);

CREATE TABLE [AccessToken] (
    [Id] int NOT NULL PRIMARY KEY,
    [PatientId] uniqueidentifier NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    [DeviceId] uniqueidentifier NOT NULL,
    [ClaimedAt] datetime2 NOT NULL,
    [ReleasedAt] datetime2,
    [ExpiresAt] datetime2 NOT NULL
);

CREATE TABLE [AccessTokenSetting] (
    [Id] int NOT NULL PRIMARY KEY,
    [Name] varchar(50) NOT NULL,
    [Description] varchar(100) NOT NULL,
    [Value] int NOT NULL
);

CREATE TABLE [Accommodation] (
    [psa_pss_id] int NOT NULL PRIMARY KEY,
    [psa_lks_accomodation] int NOT NULL,
    [psa_comments] nvarchar(MAX)
);

CREATE TABLE [AccommodationAssessment] (
    [Id] int NOT NULL PRIMARY KEY,
    [CorrectionId] int,
    [Comments] nvarchar(2000),
    [MeasurementUnit] int NOT NULL
);

CREATE TABLE [AccommodationAssessmentLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL,
    [CorrectionId] int,
    [Comments] nvarchar(2000),
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [MeasurementUnit] int NOT NULL
);

CREATE TABLE [AccommodationMeasurement] (
    [Id] int NOT NULL PRIMARY KEY,
    [NearLineId] int,
    [NearPointValue] int,
    [AmplitudeValue] decimal(18, 2)
);

CREATE TABLE [AccommodationMeasurementLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [AccommodationAssessmentId] int NOT NULL,
    [BodyPartId] int NOT NULL,
    [NearLineId] int,
    [NearPointValue] int,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Order] int NOT NULL,
    [AmplitudeValue] decimal(18, 2)
);

CREATE TABLE [AcFill] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [AcMaintainer] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ClockHourValue] int NOT NULL PRIMARY KEY,
    [ClockHourValue] int NOT NULL PRIMARY KEY,
    [BodyPartId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [AcMaintainerLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [ClockHourValue] int NOT NULL,
    [ClockHourValue] int NOT NULL,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [ActionType] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(40) NOT NULL,
    [Code] nvarchar(4) NOT NULL
);

CREATE TABLE [Activity] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [eta_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [smt_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [activity] (
    [act_id] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [Activity] (
    [aba_Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ira_id] int NOT NULL PRIMARY KEY,
    [ira_act_id] uniqueidentifier NOT NULL,
    [PreparationId] int NOT NULL,
    [aba_Description] nvarchar(500) NOT NULL,
    [smt_ect_EncounterId] uniqueidentifier NOT NULL,
    [PrescriptionIssued] bit,
    [eta_abv_VersionId] int NOT NULL,
    [UnderstandsConditionResponseId] int,
    [ComplianceToDrops_LookupDataId] int,
    [KnowsHowToAdminister_LookupDataId] int,
    [UnderstandsDiagnosisResponseId] int,
    [MonthsPrescriptionValidFor] int,
    [aba_Name] nvarchar(500) NOT NULL,
    [SurgicalCompletionId] int,
    [VoucherIssued] bit,
    [UnderstandsEyeAffectedResponseId] int,
    [Comments] nvarchar(2000),
    [KnowsSignsAndSymptomsResponseId] int,
    [smt_das_SectionId] int NOT NULL,
    [smt_smr_ReviewTypeId] int,
    [Comments] nvarchar(2000),
    [smt_smr_HasHiddenQueries] bit NOT NULL,
    [smt_ShowRemovedSectionWarning] bit NOT NULL
);

CREATE TABLE [activity] (
    [act_parent_id] uniqueidentifier
);

CREATE TABLE [activitybinary] (
    [abn_id] int NOT NULL PRIMARY KEY,
    [abn_bod_id] int NOT NULL,
    [abn_abt_TypeId] int NOT NULL,
    [abn_mim_id] int NOT NULL,
    [abn_blb_id] uniqueidentifier NOT NULL,
    [abn_editablestate] nvarchar(MAX) NOT NULL,
    [abn_description] nvarchar(4000),
    [abn_creationdate] datetime,
    [abn_deleted] bit,
    [abn_template_id] int,
    [abn_templatetype] int,
    [abn_initialstate] varchar(MAX),
    [abn_drawingcreationoption] int,
    [abn_thumbnail_blb_id] uniqueidentifier,
    [abn_autopopulatelock] bit NOT NULL
);

CREATE TABLE [ActivityBinaryType] (
    [abt_id] int NOT NULL PRIMARY KEY,
    [abt_description] nvarchar(60) NOT NULL
);

CREATE TABLE [activitycomment] (
    [acm_id] int NOT NULL PRIMARY KEY,
    [acm_comment] nvarchar(MAX)
);

CREATE TABLE [activitycommentlog] (
    [acm_ObjectId] int NOT NULL,
    [acm_id] int NOT NULL PRIMARY KEY,
    [acm_act_id] uniqueidentifier NOT NULL,
    [acm_bod_id] int NOT NULL,
    [acm_comment] nvarchar(MAX),
    [acm_cty_id] int,
    [acm_DateAdded] datetime NOT NULL,
    [acm_AddedBy] uniqueidentifier NOT NULL,
    [acm_TransactionId] uniqueidentifier NOT NULL,
    [acm_Action] char(1) NOT NULL
);

CREATE TABLE [activitydocumentlink] (
    [dac_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [activitydrug] (
    [adr_id] int NOT NULL PRIMARY KEY,
    [adr_drs_id] int,
    [adr_none] bit NOT NULL,
    [adr_mcn_id] int,
    [adr_dos_id] int,
    [adr_dro_id] int,
    [adr_dfr_id] int,
    [adr_ddu_id] int,
    [adr_ant_id] int,
    [adr_time] time(5),
    [adr_order] int,
    [adr_sourceset] int,
    [adr_lks_id_type] int,
    [adr_pdt_expired] uniqueidentifier,
    [adr_batchnumber] varchar(255),
    [adr_deleted] bit
);

CREATE TABLE [activitydrugconcept] (
    [adc_id] int NOT NULL PRIMARY KEY,
    [adc_concept] varchar(255) NOT NULL
);

CREATE TABLE [ActivityDrugDuplicateMedicationRemovalBackup] (
    [adr_id] int NOT NULL PRIMARY KEY,
    [adr_act_id] uniqueidentifier NOT NULL,
    [adr_bod_id] int,
    [adr_drs_id] int,
    [adr_adc_id] int NOT NULL,
    [adr_none] bit NOT NULL,
    [adr_mcn_id] int,
    [adr_dos_id] int,
    [adr_dro_id] int,
    [adr_dfr_id] int,
    [adr_ddu_id] int,
    [adr_ant_id] int,
    [adr_time] time(5),
    [adr_order] int,
    [adr_sourceset] int,
    [adr_lks_id_type] int,
    [adr_pdt_expired] uniqueidentifier,
    [adr_batchnumber] varchar(255),
    [adr_deleted] bit,
    [adr_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [activitydruglog] (
    [adr_ObjectId] int NOT NULL,
    [adr_id] int NOT NULL PRIMARY KEY,
    [adr_act_id] uniqueidentifier NOT NULL,
    [adr_bod_id] int,
    [adr_drs_id] int,
    [adr_adc_id] int NOT NULL,
    [adr_none] bit NOT NULL,
    [adr_dos_id] int,
    [adr_dro_id] int,
    [adr_dfr_id] int,
    [adr_ddu_id] int,
    [adr_ant_id] int,
    [adr_time] time(5),
    [adr_order] int,
    [adr_sourceset] int,
    [adr_lks_id_type] int,
    [adr_DateAdded] datetime NOT NULL,
    [adr_AddedBy] uniqueidentifier NOT NULL,
    [adr_TransactionId] uniqueidentifier NOT NULL,
    [adr_Action] char(1) NOT NULL,
    [adr_mcn_id] int,
    [adr_pdt_expired] uniqueidentifier,
    [adr_batchnumber] varchar(255),
    [adr_deleted] bit
);

CREATE TABLE [activitygroup] (
    [acg_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [activitygroupitem] (
    [agi_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ActivityIOPGUID] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ActivityItem] (
    [irm_id] int NOT NULL PRIMARY KEY,
    [irm_lks_Id_Device] int,
    [irm_iro_id_LeftEyeOutcome] int,
    [irm_LeftEyeComments] nvarchar(4000),
    [irm_iro_id_RightEyeOutcome] int,
    [irm_RightEyeComments] nvarchar(4000),
    [irm_Deleted] bit NOT NULL
);

CREATE TABLE [ActivityItemInvestigation] (
    [irv_Id] int NOT NULL PRIMARY KEY,
    [irv_irm_id] int NOT NULL,
    [irv_iri_id] int NOT NULL,
    [irv_Deleted] bit NOT NULL
);

CREATE TABLE [ActivityItemInvestigationLog] (
    [irv_ObjectId] int NOT NULL,
    [irv_Id] int NOT NULL PRIMARY KEY,
    [irv_irm_id] int NOT NULL,
    [irv_iri_id] int NOT NULL,
    [irv_Deleted] bit NOT NULL,
    [irv_DateAdded] datetime NOT NULL,
    [irv_AddedBy] uniqueidentifier NOT NULL,
    [irv_Transactionid] uniqueidentifier NOT NULL,
    [irv_Action] char(1) NOT NULL
);

CREATE TABLE [ActivityItemLog] (
    [irm_ObjectId] int NOT NULL,
    [irm_id] int NOT NULL PRIMARY KEY,
    [irm_ira_id] int NOT NULL,
    [irm_lks_Id_Device] int,
    [irm_iro_id_LeftEyeOutcome] int,
    [irm_LeftEyeComments] nvarchar(4000),
    [irm_iro_id_RightEyeOutcome] int,
    [irm_RightEyeComments] nvarchar(4000),
    [irm_DateAdded] datetime NOT NULL,
    [irm_AddedBy] uniqueidentifier NOT NULL,
    [irm_Transactionid] uniqueidentifier NOT NULL,
    [irm_Action] char(1) NOT NULL,
    [irm_Deleted] bit NOT NULL
);

CREATE TABLE [ActivityLaterality] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL,
    [BodyPartId] int NOT NULL,
    [TypeId] int NOT NULL,
    [Sphere] float(8),
    [Cylinder] float(8),
    [Axis] float(8),
    [SphericalEquivalent] float(8),
    [Add] float(8),
    [VisualAcuityId] int,
    [Bvd] int,
    [PrismRange1] decimal(18, 2),
    [PrismRange2] decimal(18, 2),
    [PrismBase1LookupDataId] int,
    [PrismBase2LookupDataId] int,
    [BalanceLens] bit
);

CREATE TABLE [ActivityLateralityLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ActivityId] uniqueidentifier NOT NULL,
    [VisualAcuityId] int,
    [BodyPartId] int NOT NULL,
    [TypeId] int NOT NULL,
    [Sphere] float(8),
    [Cylinder] float(8),
    [Axis] float(8),
    [SphericalEquivalent] float(8),
    [Add] float(8),
    [Bvd] int,
    [PrismRange1] decimal(18, 2),
    [PrismRange2] decimal(18, 2),
    [PrismBase1LookupDataId] int,
    [PrismBase2LookupDataId] int,
    [BalanceLens] bit
);

CREATE TABLE [ActivityLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [eta_act_ActivityId] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL
);

CREATE TABLE [activitylog] (
    [act_ObjectId] uniqueidentifier NOT NULL
);

CREATE TABLE [ActivityLog] (
    [smt_Id] int NOT NULL PRIMARY KEY,
    [ira_ObjectId] int NOT NULL,
    [aba_Id] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [aba_ObjectId] int NOT NULL,
    [ira_id] int NOT NULL PRIMARY KEY,
    [smt_ObjectId] int NOT NULL
);

CREATE TABLE [activitylog] (
    [act_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ActivityLog] (
    [ObjectId] uniqueidentifier NOT NULL,
    [eta_ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [eta_DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL
);

CREATE TABLE [activitylog] (
    [act_ect_id] uniqueidentifier
);

CREATE TABLE [ActivityLog] (
    [smt_DateAdded] datetime NOT NULL,
    [ira_act_id] uniqueidentifier NOT NULL,
    [aba_DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [aba_AddedBy] uniqueidentifier NOT NULL,
    [ira_DateAdded] datetime NOT NULL,
    [smt_AddedBy] uniqueidentifier NOT NULL
);

CREATE TABLE [activitylog] (
    [act_aty_id] int
);

CREATE TABLE [ActivityLog] (
    [AddedBy] uniqueidentifier NOT NULL,
    [eta_AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [eta_Transactionid] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL
);

CREATE TABLE [activitylog] (
    [act_loc_id] uniqueidentifier
);

CREATE TABLE [ActivityLog] (
    [smt_Transactionid] uniqueidentifier NOT NULL,
    [ira_AddedBy] uniqueidentifier NOT NULL,
    [aba_Transactionid] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [aba_Action] char(1) NOT NULL,
    [ira_Transactionid] uniqueidentifier NOT NULL,
    [smt_Action] char(1) NOT NULL
);

CREATE TABLE [activitylog] (
    [act_daterecorded] datetime
);

CREATE TABLE [ActivityLog] (
    [Action] char(1) NOT NULL,
    [eta_Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [UnderstandsConditionResponseId] int,
    [eta_abv_VersionId] int NOT NULL,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [activitylog] (
    [act_datesaved] datetime
);

CREATE TABLE [ActivityLog] (
    [smt_ect_EncounterId] uniqueidentifier NOT NULL,
    [ira_Action] char(1) NOT NULL,
    [aba_Description] nvarchar(500) NOT NULL,
    [PreparationId] int NOT NULL,
    [ComplianceToDrops_LookupDataId] int,
    [KnowsHowToAdminister_LookupDataId] int,
    [SurgicalCompletionId] int,
    [aba_Name] nvarchar(500) NOT NULL,
    [smt_act_ActivityId] uniqueidentifier
);

CREATE TABLE [activitylog] (
    [act_mode] int NOT NULL
);

CREATE TABLE [ActivityLog] (
    [PrescriptionIssued] bit,
    [UnderstandsDiagnosisResponseId] int,
    [UnderstandsEyeAffectedResponseId] int,
    [MonthsPrescriptionValidFor] int
);

CREATE TABLE [activitylog] (
    [act_status] int
);

CREATE TABLE [ActivityLog] (
    [aba_UniqueKey] uniqueidentifier,
    [Comments] nvarchar(2000)
);

CREATE TABLE [activitylog] (
    [act_displayset] int
);

CREATE TABLE [ActivityLog] (
    [smt_das_SectionId] int NOT NULL,
    [VoucherIssued] bit,
    [KnowsSignsAndSymptomsResponseId] int,
    [Comments] nvarchar(2000),
    [smt_smr_ReviewTypeId] int
);

CREATE TABLE [activitylog] (
    [act_parent_id] uniqueidentifier,
    [act_DateAdded] datetime NOT NULL
);

CREATE TABLE [ActivityLog] (
    [smt_smr_HasHiddenQueries] bit NOT NULL,
    [smt_ShowRemovedSectionWarning] bit NOT NULL
);

CREATE TABLE [activitylog] (
    [act_AddedBy] uniqueidentifier NOT NULL,
    [act_TransactionId] uniqueidentifier NOT NULL,
    [act_Action] char(1) NOT NULL
);

CREATE TABLE [ActivityNurseClinicGUID] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ActivityOperationIndicationGUID] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [activitypatientcontactdetails] (
    [apc_id] int NOT NULL PRIMARY KEY,
    [apc_patientphoneday] nvarchar(510),
    [apc_patientphoneevening] nvarchar(510),
    [apc_patientphonemobile] nvarchar(510),
    [apc_nextofkinsurname] nvarchar(510),
    [apc_nextofkinforename] nvarchar(510),
    [apc_nextofkintitle] nvarchar(510),
    [apc_lks_id_nextofkinrelation] int,
    [apc_nextofkinrelationothertext] nvarchar(510),
    [apc_nextofkinaddress1] nvarchar(510),
    [apc_nextofkinaddress2] nvarchar(510),
    [apc_nextofkinaddress3] nvarchar(510),
    [apc_nextofkinaddress4] nvarchar(510),
    [apc_nextofkinaddress5] nvarchar(510),
    [apc_nextofkinpostcode] nvarchar(510),
    [apc_nextofkinphoneday] nvarchar(510),
    [apc_nextofkinphoneevening] nvarchar(510),
    [apc_nextofkinphonemobile] nvarchar(510)
);

CREATE TABLE [activitypatientcontactdetailslog] (
    [apc_objectId] int NOT NULL,
    [apc_id] int NOT NULL PRIMARY KEY,
    [apc_act_id] uniqueidentifier NOT NULL,
    [apc_patientphoneday] nvarchar(510),
    [apc_patientphoneevening] nvarchar(510),
    [apc_patientphonemobile] nvarchar(510),
    [apc_nextofkinsurname] nvarchar(510),
    [apc_nextofkinforename] nvarchar(510),
    [apc_nextofkintitle] nvarchar(510),
    [apc_lks_id_nextofkinrelation] int,
    [apc_nextofkinrelationothertext] nvarchar(510),
    [apc_nextofkinaddress1] nvarchar(510),
    [apc_nextofkinaddress2] nvarchar(510),
    [apc_nextofkinaddress3] nvarchar(510),
    [apc_nextofkinaddress4] nvarchar(510),
    [apc_nextofkinaddress5] nvarchar(510),
    [apc_nextofkinpostcode] nvarchar(510),
    [apc_nextofkinphoneday] nvarchar(510),
    [apc_nextofkinphoneevening] nvarchar(510),
    [apc_nextofkinphonemobile] nvarchar(510),
    [apc_dateadded] datetime NOT NULL,
    [apc_addedby] uniqueidentifier NOT NULL,
    [apc_transactionid] uniqueidentifier NOT NULL,
    [apc_action] char(1) NOT NULL
);

CREATE TABLE [activitypersonnel] (
    [eap_id] int NOT NULL PRIMARY KEY,
    [eap_use_id] uniqueidentifier NOT NULL,
    [eap_acp_id] int NOT NULL,
    [eap_bod_id] int NOT NULL
);

CREATE TABLE [activitypersonnellog] (
    [eap_ObjectId] int NOT NULL,
    [eap_id] int NOT NULL PRIMARY KEY,
    [eap_act_id] uniqueidentifier NOT NULL,
    [eap_use_id] uniqueidentifier NOT NULL,
    [eap_acp_id] int NOT NULL,
    [eap_bod_id] int NOT NULL,
    [eap_DateAdded] datetime NOT NULL,
    [eap_AddedBy] uniqueidentifier NOT NULL,
    [eap_TransactionId] uniqueidentifier NOT NULL,
    [eap_Action] char(1) NOT NULL
);

CREATE TABLE [ActivityQuery] (
    [aaq_squ_QueryId] int NOT NULL PRIMARY KEY,
    [aaq_smt_StudyMonitoringActivityId] int NOT NULL
);

CREATE TABLE [ActivityReview] (
    [sar_smt_StudyMonitoringActivityId] int NOT NULL PRIMARY KEY,
    [sar_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [sar_bod_BodyPartId] int NOT NULL PRIMARY KEY,
    [sar_smr_ReviewTypeId] int NOT NULL
);

CREATE TABLE [ActivityReviewLog] (
    [sar_smt_StudyMonitoringActivityId] int NOT NULL PRIMARY KEY,
    [sar_ObjectId] int NOT NULL,
    [sar_DateAdded] datetime NOT NULL,
    [sar_AddedBy] uniqueidentifier NOT NULL,
    [sar_Transactionid] uniqueidentifier NOT NULL,
    [sar_Action] char(1) NOT NULL,
    [sar_act_ActivityId] uniqueidentifier NOT NULL,
    [sar_bod_BodyPartId] int NOT NULL,
    [sar_smr_ReviewTypeId] int NOT NULL
);

CREATE TABLE [ActivitySectionVersion] (
    [asv_abv_ActivityVersionId] int NOT NULL PRIMARY KEY,
    [asv_svr_SectionVersionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [activitytype] (
    [aty_id] int NOT NULL PRIMARY KEY,
    [aty_desc] varchar(100) NOT NULL,
    [aty_title] varchar(100) NOT NULL
);

CREATE TABLE [ActivityVersion] (
    [abv_Id] int NOT NULL PRIMARY KEY,
    [abv_Name] nvarchar(200) NOT NULL,
    [abv_Description] nvarchar(500) NOT NULL
);

CREATE TABLE [ActivityVersionLog] (
    [abv_id] int NOT NULL PRIMARY KEY,
    [abv_ObjectId] int NOT NULL,
    [abv_DateAdded] datetime NOT NULL,
    [abv_AddedBy] uniqueidentifier NOT NULL,
    [abv_TransactionId] uniqueidentifier NOT NULL,
    [abv_Action] char(1) NOT NULL,
    [abv_aba_ActivityId] int NOT NULL,
    [abv_Name] nvarchar(200),
    [abv_Description] nvarchar(500),
    [abv_Version] int
);

CREATE TABLE [AdditionalData] (
    [fad_id] int NOT NULL PRIMARY KEY,
    [fad_fdt_id] int NOT NULL,
    [fad_lks_id] int NOT NULL
);

CREATE TABLE [AdditionalDataLog] (
    [fad_ObjectId] int NOT NULL,
    [fad_id] int NOT NULL PRIMARY KEY,
    [fad_fdt_id] int NOT NULL,
    [fad_pfd_id] int NOT NULL,
    [fad_lks_id] int NOT NULL,
    [fad_DateAdded] datetime NOT NULL,
    [fad_AddedBy] uniqueidentifier NOT NULL,
    [fad_TransactionId] uniqueidentifier NOT NULL,
    [fad_Action] char(1) NOT NULL
);

CREATE TABLE [AdditionalDataType] (
    [fdt_id] int NOT NULL PRIMARY KEY,
    [fdt_description] nvarchar(510) NOT NULL,
    [fdt_formatString] nvarchar(510) NOT NULL,
    [fdt_separator] nvarchar(20) NOT NULL,
    [fdt_finalSeparator] nvarchar(20),
    [fdt_priority] int NOT NULL
);

CREATE TABLE [AdditionalDisplayOption] (
    [ado_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [AddLens] (
    [Id] int NOT NULL PRIMARY KEY,
    [AddLensValue] float(8) NOT NULL
);

CREATE TABLE [address] (
    [add_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [add_name] nvarchar(510),
    [add_address1] nvarchar(510),
    [add_address2] nvarchar(510),
    [add_address3] nvarchar(510),
    [add_address4] nvarchar(510),
    [add_address5] nvarchar(510),
    [add_postcode] varchar(255),
    [add_prd_PractitionerDataSourceId] int,
    [add_Active] bit NOT NULL
);

CREATE TABLE [AddressBackup] (
    [add_id] uniqueidentifier NOT NULL,
    [add_name] nvarchar(510),
    [add_address1] nvarchar(510),
    [add_address2] nvarchar(510),
    [add_address3] nvarchar(510),
    [add_address4] nvarchar(510),
    [add_address5] nvarchar(510),
    [add_postcode] varchar(255),
    [add_code] varchar(255),
    [add_CrossDatabaseIdentifier] uniqueidentifier,
    [InsertDateTime] datetime
);

CREATE TABLE [addresscontact] (
    [aco_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [aco_value] varchar(255) NOT NULL,
    [aco_lks_id_contact] int NOT NULL,
    [aco_preferred] tinyint(1) NOT NULL
);

CREATE TABLE [addresscontactlog] (
    [aco_objectid] uniqueidentifier NOT NULL,
    [aco_id] int NOT NULL PRIMARY KEY,
    [aco_add_id] uniqueidentifier NOT NULL,
    [aco_value] varchar(255) NOT NULL,
    [aco_lks_id_contact] int NOT NULL,
    [aco_preferred] tinyint(1) NOT NULL,
    [aco_dateadded] datetime NOT NULL,
    [aco_addedby] uniqueidentifier NOT NULL,
    [aco_transactionid] uniqueidentifier NOT NULL,
    [aco_action] char(1) NOT NULL
);

CREATE TABLE [addresslog] (
    [add_objectid] uniqueidentifier NOT NULL,
    [add_id] int NOT NULL PRIMARY KEY,
    [add_name] nvarchar(510),
    [add_code] varchar(255),
    [add_address1] nvarchar(510),
    [add_address2] nvarchar(510),
    [add_address3] nvarchar(510),
    [add_address4] nvarchar(510),
    [add_address5] nvarchar(510),
    [add_postcode] varchar(255),
    [add_dateadded] datetime NOT NULL,
    [add_addedby] uniqueidentifier NOT NULL,
    [add_transactionid] uniqueidentifier NOT NULL,
    [add_action] char(1) NOT NULL,
    [add_CrossDatabaseIdentifier] uniqueidentifier,
    [add_prd_PractitionerDataSourceId] int,
    [add_Active] bit
);

CREATE TABLE [AdHocSeriesRequest] (
    [asr_Id] int NOT NULL PRIMARY KEY,
    [asr_SeriesInstanceUid] nvarchar(400) NOT NULL,
    [asr_StudyInstanceUid] nvarchar(400) NOT NULL,
    [asr_SubjectId] nvarchar(50) NOT NULL,
    [asr_SubjectYearOfBirth] int NOT NULL,
    [asr_DestinationCloudPartnerName] nvarchar(200) NOT NULL,
    [asr_tri_PreviousRequestIdentifier] uniqueidentifier NOT NULL,
    [asr_Processed] bit NOT NULL,
    [asr_ErrorReason] nvarchar(2000)
);

CREATE TABLE [Adjustment] (
    [Id] int NOT NULL PRIMARY KEY,
    [RightAdjustmentPerformed] bit,
    [LeftAdjustmentPerformed] bit
);

CREATE TABLE [AdjustmentLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [RightAdjustmentPerformed] bit,
    [LeftAdjustmentPerformed] bit
);

CREATE TABLE [Advancement] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [PseudotendonExcised] float(8),
    [SutureId] int,
    [MuscleFoundAt] float(8) NOT NULL,
    [AmountOfAdvancement] float(8) NOT NULL,
    [AdditionalResection] float(8),
    [SutureId] int
);

CREATE TABLE [AdvancementLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [SutureId] int,
    [PseudotendonExcised] float(8),
    [MuscleFoundAt] float(8) NOT NULL,
    [AmountOfAdvancement] float(8) NOT NULL,
    [AdditionalResection] float(8),
    [SutureId] int
);

CREATE TABLE [AimsOfSurgery] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [PreparationId] int NOT NULL,
    [PreparationId] int NOT NULL,
    [AimsOfSurgeryId] int NOT NULL,
    [AimsOfSurgeryId] int NOT NULL
);

CREATE TABLE [AimsOfSurgeryLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [PreparationId] int NOT NULL,
    [PreparationId] int NOT NULL,
    [AimsOfSurgeryId] int NOT NULL,
    [AimsOfSurgeryId] int NOT NULL
);

CREATE TABLE [AlphabetOverlayPattern] (
    [Id] int NOT NULL PRIMARY KEY,
    [PatternDescription] nvarchar(6) NOT NULL
);

CREATE TABLE [anaesthesiatechnique] (
    [ant_id] int NOT NULL PRIMARY KEY,
    [ant_desc] nvarchar(510),
    [ant_drs_id] int,
    [ant_dro_id] int
);

CREATE TABLE [AnonymisedPatient] (
    [anp_Id] int NOT NULL PRIMARY KEY,
    [anp_MessagesQueued] datetime,
    [anp_DataTransferMessagesQueued] datetime,
    [anp_EdcDataTransferred] bit NOT NULL,
    [anp_SuccessfullyTransferredRequests] bit NOT NULL
);

CREATE TABLE [AnterionInvestigationVersion] (
    [eav_iiv_InvestigationItemVersionId] int NOT NULL PRIMARY KEY,
    [eav_eat_ApplicationTypeId] int NOT NULL
);

CREATE TABLE [AnterionInvestigationVersionLog] (
    [eav_iiv_InvestigationItemVersionId] int NOT NULL PRIMARY KEY,
    [eav_eat_ApplicationTypeId] int NOT NULL,
    [eav_ObjectId] int NOT NULL,
    [eav_DateAdded] datetime NOT NULL,
    [eav_AddedBy] uniqueidentifier NOT NULL,
    [eav_Transactionid] uniqueidentifier NOT NULL,
    [eav_Action] char(1) NOT NULL
);

CREATE TABLE [Antimetabolite] (
    [gan_Id] int NOT NULL PRIMARY KEY,
    [gda_id] int NOT NULL PRIMARY KEY,
    [gda_sft_id] int NOT NULL,
    [gan_ActivityId] uniqueidentifier NOT NULL,
    [gan_AntimetaboliteQualifierStrengthId] int NOT NULL,
    [gda_DrugId] int,
    [gda_RouteId] int,
    [gda_Dose] decimal(18, 2),
    [gda_Minutes] int,
    [gda_Seconds] int,
    [gda_pqa_id] int
);

CREATE TABLE [AntimetaboliteDrugStrengthUnitRecording] (
    [gad_Id] int NOT NULL PRIMARY KEY,
    [gad_Value] decimal(18, 2)
);

CREATE TABLE [AntimetaboliteDrugStrengthUnitRecordingLog] (
    [gad_Id] int NOT NULL PRIMARY KEY,
    [gad_ObjectId] int NOT NULL,
    [gad_AntimetaboliteId] int NOT NULL,
    [gad_DrugUnitOfMeasureId] int NOT NULL,
    [gad_Value] decimal(18, 2),
    [gad_DateAdded] datetime NOT NULL,
    [gad_AddedBy] uniqueidentifier NOT NULL,
    [gad_Transactionid] uniqueidentifier NOT NULL,
    [gad_Action] char(1) NOT NULL
);

CREATE TABLE [AntimetaboliteLog] (
    [gan_Id] int NOT NULL PRIMARY KEY,
    [gda_id] int NOT NULL PRIMARY KEY,
    [gda_ObjectId] int NOT NULL,
    [gan_ObjectId] int NOT NULL,
    [gan_ActivityId] uniqueidentifier NOT NULL,
    [gda_DateAdded] datetime NOT NULL,
    [gda_AddedBy] uniqueidentifier NOT NULL,
    [gan_AntimetaboliteQualifierStrengthId] int NOT NULL,
    [gan_DateAdded] datetime NOT NULL,
    [gda_Transactionid] uniqueidentifier NOT NULL,
    [gda_Action] char(1) NOT NULL,
    [gan_AddedBy] uniqueidentifier NOT NULL,
    [gan_Transactionid] uniqueidentifier NOT NULL,
    [gda_sft_id] int NOT NULL,
    [gda_DrugId] int,
    [gan_Action] char(1) NOT NULL,
    [gda_RouteId] int,
    [gda_Dose] decimal(18, 2),
    [gda_Minutes] int,
    [gda_Seconds] int,
    [gda_pqa_id] int
);

CREATE TABLE [apicachemanager] (
    [amr_methodhash] varchar(255) NOT NULL,
    [amr_filehash] varchar(255) NOT NULL
);

CREATE TABLE [ApplicableTestType] (
    [Id] int NOT NULL PRIMARY KEY,
    [Name] nvarchar(200) NOT NULL
);

CREATE TABLE [Application] (
    [eaa_Id] int NOT NULL PRIMARY KEY,
    [eaa_Name] nvarchar(510) NOT NULL,
    [eaa_eat_ApplicationTypeId] int NOT NULL,
    [eaa_eam_ApplicationMethodId] int NOT NULL,
    [eaa_Enabled] bit NOT NULL,
    [eaa_TextBasedFile] bit,
    [eaa_blb_Id_IconBinary] uniqueidentifier,
    [eaa_GenderMaleIdentifier] nvarchar(510),
    [eaa_GenderFemaleIdentifier] nvarchar(510),
    [eaa_GenderNotKnownIdentifier] nvarchar(510),
    [eaa_GenderNotSpecifiedIdentifier] nvarchar(510),
    [eaa_IconTooltip] nvarchar(2000) NOT NULL,
    [eaa_ForceClose] bit,
    [eaa_ClosePatientCommand] nvarchar(510),
    [eaa_CloseApplicationCommand] nvarchar(510),
    [eaa_ShowOnApplicationsScreen] bit NOT NULL,
    [eaa_ShowOnEncounter] bit NOT NULL,
    [eaa_ButtonText] nvarchar(50),
    [eaa_Label] nvarchar(50),
    [eaa_epc_PreConfigurationId] int
);

CREATE TABLE [ApplicationExeDetail] (
    [aed_Id] int NOT NULL PRIMARY KEY,
    [aed_eaa_ApplicationId] int NOT NULL,
    [aed_Filepath] nvarchar(2000) NOT NULL,
    [aed_Parameters] nvarchar(2000),
    [aed_TextBasedFileType] nvarchar(20),
    [aed_TextBasedFileName] nvarchar(510),
    [aed_TextBasedFileContent] nvarchar(1000),
    [aed_TextBasedFilePath] nvarchar(1000),
    [aed_CleanUpTimeSeconds] int,
    [aed_RelaunchIfAlreadyOpen] bit NOT NULL,
    [aed_TextBasedEncodingCode] int
);

CREATE TABLE [ApplicationExeDetailLog] (
    [aed_ObjectId] int NOT NULL,
    [aed_Id] int NOT NULL PRIMARY KEY,
    [aed_eaa_ApplicationId] int NOT NULL,
    [aed_Filepath] nvarchar(2000) NOT NULL,
    [aed_Parameters] nvarchar(2000),
    [aed_DateAdded] datetime NOT NULL,
    [aed_AddedBy] uniqueidentifier NOT NULL,
    [aed_Transactionid] uniqueidentifier NOT NULL,
    [aed_Action] char(1) NOT NULL,
    [aed_TextBasedFileType] nvarchar(20),
    [aed_TextBasedFileName] nvarchar(510),
    [aed_TextBasedFileContent] nvarchar(1000),
    [aed_TextBasedFilePath] nvarchar(1000),
    [aed_CleanUpTimeSeconds] int,
    [aed_RelaunchIfAlreadyOpen] bit,
    [aed_TextBasedEncodingCode] int
);

CREATE TABLE [ApplicationGroup] (
    [eag_Id] int NOT NULL PRIMARY KEY,
    [eag_grp_Id] uniqueidentifier NOT NULL,
    [eag_eaa_Id] int NOT NULL
);

CREATE TABLE [ApplicationGroupLog] (
    [eag_ObjectId] int NOT NULL,
    [eag_Id] int NOT NULL PRIMARY KEY,
    [eag_grp_Id] uniqueidentifier,
    [eag_eaa_Id] int,
    [eag_DateAdded] datetime NOT NULL,
    [eag_AddedBy] uniqueidentifier NOT NULL,
    [eag_Transactionid] uniqueidentifier NOT NULL,
    [eag_Action] char(1) NOT NULL
);

CREATE TABLE [ApplicationInterfaceType] (
    [ait_Id] int NOT NULL PRIMARY KEY,
    [ait_eaa_ApplicationId] int NOT NULL
);

CREATE TABLE [ApplicationInterfaceTypeLog] (
    [ait_id] int NOT NULL,
    [ait_ObjectId] int NOT NULL,
    [ait_DateAdded] datetime NOT NULL,
    [ait_AddedBy] uniqueidentifier NOT NULL,
    [ait_TransactionId] uniqueidentifier NOT NULL,
    [ait_Action] char(1) NOT NULL,
    [ait_eaa_ApplicationId] int NOT NULL,
    [ait_ity_InterfaceTypeId] int NOT NULL
);

CREATE TABLE [ApplicationLog] (
    [eaa_ObjectId] int NOT NULL,
    [eaa_Id] int NOT NULL PRIMARY KEY,
    [eaa_Name] nvarchar(510) NOT NULL,
    [eaa_eat_ApplicationTypeId] int NOT NULL,
    [eaa_eam_ApplicationMethodId] int NOT NULL,
    [eaa_Enabled] bit NOT NULL,
    [eaa_TextBasedFile] bit,
    [eaa_blb_Id_IconBinary] uniqueidentifier,
    [eaa_DateAdded] datetime NOT NULL,
    [eaa_AddedBy] uniqueidentifier NOT NULL,
    [eaa_Transactionid] uniqueidentifier NOT NULL,
    [eaa_Action] char(1) NOT NULL,
    [eaa_GenderMaleIdentifier] nvarchar(510),
    [eaa_GenderFemaleIdentifier] nvarchar(510),
    [eaa_GenderNotKnownIdentifier] nvarchar(510),
    [eaa_GenderNotSpecifiedIdentifier] nvarchar(510),
    [eaa_IconTooltip] nvarchar(2000),
    [eaa_ForceClose] bit,
    [eaa_ClosePatientCommand] nvarchar(510),
    [eaa_CloseApplicationCommand] nvarchar(510),
    [eaa_ShowOnApplicationsScreen] bit,
    [eaa_ShowOnEncounter] bit,
    [eaa_ButtonText] nvarchar(50),
    [eaa_Label] nvarchar(50),
    [eaa_epc_PreConfigurationId] int
);

CREATE TABLE [ApplicationMethod] (
    [eam_Id] int NOT NULL PRIMARY KEY,
    [eam_Description] nvarchar(510) NOT NULL
);

CREATE TABLE [applicationstring] (
    [ast_id] int NOT NULL PRIMARY KEY,
    [ast_string] nvarchar(MAX),
    [ast_htmlstring] nvarchar(8000)
);

CREATE TABLE [ApplicationType] (
    [hat_Id] int NOT NULL PRIMARY KEY,
    [eat_Id] int NOT NULL PRIMARY KEY,
    [eat_Id] int NOT NULL PRIMARY KEY,
    [eat_Description] nvarchar(500) NOT NULL,
    [eat_Description] nvarchar(510) NOT NULL
);

CREATE TABLE [ApplicationUrlDetail] (
    [aud_Id] int NOT NULL PRIMARY KEY,
    [aud_eaa_ApplicationId] int NOT NULL,
    [aud_ebt_BrowserTypeId] int NOT NULL,
    [aud_Url] nvarchar(1000) NOT NULL
);

CREATE TABLE [ApplicationUrlDetailLog] (
    [aud_Id] int NOT NULL PRIMARY KEY,
    [aud_ObjectId] int NOT NULL,
    [aud_eaa_ApplicationId] int NOT NULL,
    [aud_ebt_BrowserTypeId] int NOT NULL,
    [aud_Url] nvarchar(1000) NOT NULL,
    [aud_DateAdded] datetime NOT NULL,
    [aud_AddedBy] uniqueidentifier NOT NULL,
    [aud_Transactionid] uniqueidentifier NOT NULL,
    [aud_Action] char(1) NOT NULL
);

CREATE TABLE [Appointment] (
    [app_ect_id] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [AppointmentIdentifier] (
    [aid_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [AppointmentIdentifierLog] (
    [aid_Id] int NOT NULL PRIMARY KEY,
    [aid_csc_id] int NOT NULL,
    [aid_idt_TypeId] int NOT NULL,
    [aid_value] nvarchar(40),
    [aid_TypeOther] nvarchar(100),
    [aid_ObjectId] int NOT NULL,
    [aid_DateAdded] datetime NOT NULL,
    [aid_AddedBy] uniqueidentifier NOT NULL,
    [aid_TransactionId] uniqueidentifier NOT NULL,
    [aid_Action] char(1) NOT NULL
);

CREATE TABLE [AppointmentLog] (
    [app_ect_id] int NOT NULL PRIMARY KEY,
    [app_ObjectId] uniqueidentifier NOT NULL,
    [app_DateAdded] datetime NOT NULL,
    [app_AddedBy] uniqueidentifier NOT NULL,
    [app_Transactionid] uniqueidentifier NOT NULL,
    [app_Action] char(1) NOT NULL,
    [app_ppr_id] int NOT NULL,
    [app_pat_id] uniqueidentifier NOT NULL,
    [app_plc_id] int NOT NULL,
    [app_act_ArrivalId] uniqueidentifier,
    [app_IsDeleted] bit NOT NULL,
    [app_use_LockedByUser] uniqueidentifier
);

CREATE TABLE [AppointmentStepStatus] (
    [ass_app_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [ass_sst_id] int NOT NULL PRIMARY KEY,
    [ass_sps_id] int NOT NULL,
    [ass_use_InProgressWith] uniqueidentifier
);

CREATE TABLE [AppointmentStepStatusLog] (
    [ass_app_id] int NOT NULL PRIMARY KEY,
    [ass_ObjectId] uniqueidentifier NOT NULL,
    [ass_DateAdded] datetime NOT NULL,
    [ass_AddedBy] uniqueidentifier NOT NULL,
    [ass_Transactionid] uniqueidentifier NOT NULL,
    [ass_Action] char(1) NOT NULL,
    [ass_sst_id] int NOT NULL,
    [ass_sps_id] int NOT NULL,
    [ass_use_InProgressWith] uniqueidentifier
);

CREATE TABLE [AppointmentType] (
    [apy_id] int NOT NULL PRIMARY KEY,
    [apy_description] nvarchar(2000) NOT NULL,
    [apy_available] bit NOT NULL
);

CREATE TABLE [AppointmentTypeLog] (
    [apy_Id] int NOT NULL PRIMARY KEY,
    [apy_description] nvarchar(2000) NOT NULL,
    [apy_available] bit NOT NULL,
    [apy_ObjectId] int NOT NULL,
    [apy_DateAdded] datetime NOT NULL,
    [apy_AddedBy] uniqueidentifier NOT NULL,
    [apy_TransactionId] uniqueidentifier NOT NULL,
    [apy_Action] char(1) NOT NULL
);

CREATE TABLE [ArgonLaserTrabeculoplasty] (
    [ald_sdf_id] int NOT NULL PRIMARY KEY,
    [alt_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [alt_SpotSize] int,
    [ald_SpotSize] int,
    [ald_PowerOfLaser] int,
    [alt_Variable] bit NOT NULL,
    [alt_MinimumPowerOflaser] int NOT NULL,
    [ald_Duration] int,
    [alt_MaximumPowerOflaser] int,
    [alt_MinimumDuration] int NOT NULL,
    [alt_MaximumDuration] int,
    [alt_TotalEnergy] decimal(18, 2)
);

CREATE TABLE [ArgonLaserTrabeculoplastyLog] (
    [alt_ActivityId] int NOT NULL,
    [ald_sdf_id] int NOT NULL PRIMARY KEY,
    [ald_ObjectId] int NOT NULL,
    [alt_ObjectId] uniqueidentifier NOT NULL,
    [alt_DateAdded] datetime NOT NULL,
    [ald_DateAdded] datetime NOT NULL,
    [ald_AddedBy] uniqueidentifier NOT NULL,
    [alt_AddedBy] uniqueidentifier NOT NULL,
    [alt_Transactionid] uniqueidentifier NOT NULL,
    [ald_Transactionid] uniqueidentifier NOT NULL,
    [ald_Action] char(1) NOT NULL,
    [alt_Action] char(1) NOT NULL,
    [alt_SpotSize] int,
    [ald_SpotSize] int,
    [ald_PowerOfLaser] int,
    [alt_Variable] bit NOT NULL,
    [alt_MinimumPowerOflaser] int NOT NULL,
    [ald_Duration] int,
    [alt_MaximumPowerOflaser] int,
    [alt_MinimumDuration] int NOT NULL,
    [alt_MaximumDuration] int,
    [alt_TotalEnergy] decimal(18, 2)
);

CREATE TABLE [ArrivalAndFinishTime] (
    [arr_act_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [arr_ArrivalTime] time(5),
    [arr_IsDidNotAttend] bit NOT NULL,
    [arr_lks_DidNotAttendReasonId] int,
    [arr_DidNotAttendAdditionalText] nvarchar(1000),
    [arr_FinishTime] time(5)
);

CREATE TABLE [ArrivalAndFinishTimeLog] (
    [arr_act_id] int NOT NULL PRIMARY KEY,
    [arr_ObjectId] uniqueidentifier NOT NULL,
    [arr_DateAdded] datetime NOT NULL,
    [arr_AddedBy] uniqueidentifier NOT NULL,
    [arr_Transactionid] uniqueidentifier NOT NULL,
    [arr_Action] char(1) NOT NULL,
    [arr_ArrivalTime] time(5),
    [arr_FinishTime] time(5),
    [arr_IsDidNotAttend] bit NOT NULL,
    [arr_lks_DidNotAttendReasonId] int,
    [arr_DidNotAttendAdditionalText] nvarchar(1000)
);

CREATE TABLE [ascan] (
    [asc_id] int NOT NULL PRIMARY KEY,
    [asc_bod_id] int NOT NULL,
    [asc_lks_id_machine] int,
    [asc_axiallength] float(8),
    [asc_acdepth] float(8),
    [asc_lensthickness] float(8),
    [asc_snr] float(8),
    [asc_lks_id_lensstatus] int
);

CREATE TABLE [ascanlog] (
    [asc_ObjectId] int NOT NULL,
    [asc_id] int NOT NULL PRIMARY KEY,
    [asc_act_id] uniqueidentifier NOT NULL,
    [asc_bod_id] int NOT NULL,
    [asc_lks_id_machine] int,
    [asc_axiallength] float(8),
    [asc_acdepth] float(8),
    [asc_lensthickness] float(8),
    [asc_snr] float(8),
    [asc_DateAdded] datetime NOT NULL,
    [asc_AddedBy] uniqueidentifier NOT NULL,
    [asc_TransactionId] uniqueidentifier NOT NULL,
    [asc_Action] char(1) NOT NULL,
    [asc_lks_id_lensstatus] int
);

CREATE TABLE [AssessmentType] (
    [cat_Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [cat_Name] nvarchar(510) NOT NULL,
    [ClinicTypeId] int,
    [IsActive] bit NOT NULL,
    [Order] int NOT NULL
);

CREATE TABLE [AssessmentTypeLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Name] nvarchar(100) NOT NULL,
    [ClinicTypeId] int,
    [IsActive] bit NOT NULL,
    [Order] int NOT NULL,
    [StaticId] int
);

CREATE TABLE [AttachmentReview] (
    [smh_doc_SystemDocumentId] uniqueidentifier NOT NULL PRIMARY KEY,
    [smh_smt_StudyMonitoringActivityId] int NOT NULL,
    [smh_smr_ReviewTypeId] int NOT NULL
);

CREATE TABLE [AttachmentReviewLog] (
    [smh_doc_SystemDocumentId] int NOT NULL PRIMARY KEY,
    [smh_ObjectId] uniqueidentifier NOT NULL,
    [smh_DateAdded] datetime NOT NULL,
    [smh_AddedBy] uniqueidentifier NOT NULL,
    [smh_TransactionId] uniqueidentifier NOT NULL,
    [smh_Action] char(1) NOT NULL,
    [smh_smt_StudyMonitoringActivityId] int NOT NULL,
    [smh_smr_ReviewTypeId] int NOT NULL
);

CREATE TABLE [Audit] (
    [AuditId] int NOT NULL PRIMARY KEY,
    [AuditOverviewId] int NOT NULL PRIMARY KEY,
    [InsertDateTime] datetime NOT NULL,
    [ErrorOutputId] int,
    [AuditStatusId] tinyint(1) NOT NULL
);

CREATE TABLE [AuditFile] (
    [AuditFileId] int NOT NULL PRIMARY KEY,
    [PatchSyntax] varchar(MAX)
);

CREATE TABLE [AuditOverview] (
    [AuditOverviewId] int NOT NULL PRIMARY KEY,
    [ReleaseVersion] varchar(30),
    [StartedOn] datetime NOT NULL,
    [CompletedOn] datetime,
    [PatchRunStatusId] tinyint(1) NOT NULL
);

CREATE TABLE [AuditStatus] (
    [AuditStatusId] tinyint(1) NOT NULL PRIMARY KEY
);

CREATE TABLE [audittrailtables] (
    [att_id] int NOT NULL,
    [att_name] varchar(255),
    [att_prefix] varchar(3),
    [att_flag] int
);

CREATE TABLE [BandageContactLens] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL
);

CREATE TABLE [BandageContactLensLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL,
    [StaticId] int
);

CREATE TABLE [BaudRate] (
    [sbr_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [beavrsmacularhole] (
    [bmh_id] int NOT NULL PRIMARY KEY,
    [bmh_idiopathic] bit NOT NULL,
    [bmh_lks_id_stage] int NOT NULL,
    [bmh_bod_id] int NOT NULL,
    [bmh_bhd_id] int
);

CREATE TABLE [beavrsmacularholedetails] (
    [bhd_id] int NOT NULL PRIMARY KEY,
    [bhd_lks_id_vitreofovealattachment] int NOT NULL,
    [bhd_internalholediameter] int NOT NULL,
    [bhd_basalholediameter] int,
    [bhd_lks_id_vitreous] int NOT NULL,
    [bhd_lks_id_ilmpeel] int NOT NULL,
    [bhd_symptomonsetdate] datetime,
    [bhd_attachedretinabreaks] int,
    [bhd_retinalbreaksat] int,
    [bhd_largestretinalbreaksize] decimal(18, 2),
    [bhd_nosymptoms] bit
);

CREATE TABLE [beavrsmacularholedetailslog] (
    [bhd_ObjectId] int NOT NULL,
    [bhd_id] int NOT NULL PRIMARY KEY,
    [bhd_lks_id_vitreofovealattachment] int NOT NULL,
    [bhd_internalholediameter] int NOT NULL,
    [bhd_basalholediameter] int,
    [bhd_lks_id_vitreous] int NOT NULL,
    [bhd_lks_id_ilmpeel] int NOT NULL,
    [bhd_symptomonsetdate] datetime,
    [bhd_attachedretinabreaks] int,
    [bhd_retinalbreaksat] int,
    [bhd_largestretinalbreaksize] decimal(18, 2),
    [bhd_nosymptoms] bit,
    [bhd_DateAdded] datetime NOT NULL,
    [bhd_AddedBy] uniqueidentifier NOT NULL,
    [bhd_TransactionId] uniqueidentifier NOT NULL,
    [bhd_Action] char(1) NOT NULL
);

CREATE TABLE [beavrsmacularholelog] (
    [bmh_ObjectId] int NOT NULL,
    [bmh_id] int NOT NULL PRIMARY KEY,
    [bmh_idiopathic] bit NOT NULL,
    [bmh_lks_id_stage] int NOT NULL,
    [bmh_act_id] uniqueidentifier NOT NULL,
    [bmh_bod_id] int NOT NULL,
    [bmh_bhd_id] int,
    [bmh_DateAdded] datetime NOT NULL,
    [bmh_AddedBy] uniqueidentifier NOT NULL,
    [bmh_TransactionId] uniqueidentifier NOT NULL,
    [bmh_Action] char(1) NOT NULL
);

CREATE TABLE [beavrsretinaldetachment] (
    [brd_id] int NOT NULL PRIMARY KEY,
    [brd_primaryretinaldetachment] bit NOT NULL,
    [brd_bod_id] int NOT NULL,
    [brd_bdd_id] int
);

CREATE TABLE [beavrsretinaldetachmentdetails] (
    [bdd_id] int NOT NULL PRIMARY KEY,
    [bdd_retinaldetachmentat] int NOT NULL,
    [bdd_lks_id_fovealattachment] int NOT NULL,
    [bdd_chronic] bit NOT NULL,
    [bdd_lks_id_pvrgrade] int NOT NULL,
    [bdd_pvranterior] int,
    [bdd_pvrposterior] int,
    [bdd_lks_id_vitreous] int,
    [bdd_lks_id_vitreoushaemorrhage] int NOT NULL,
    [bdd_choroidaleffusion] bit NOT NULL,
    [bdd_pathologicalmyopia] bit,
    [bdd_latticedegeneration] bit,
    [bdd_latticedegenerationat] int,
    [bdd_priorretinaldetachmentsurgery] bit NOT NULL,
    [bdd_initialsurgerydate] datetime,
    [bdd_lks_id_causeoffailure] int,
    [bdd_symptomonsetdate] date(3),
    [bdd_centralvisionlossonsetdate] date(3),
    [bdd_lks_id_systemiccondition] int,
    [bdd_detachedretinabreaks] int NOT NULL,
    [bdd_attachedretinabreaks] int NOT NULL,
    [bdd_retinalbreaksat] int,
    [bdd_lks_id_largestretinalbreaktype] int,
    [bdd_largestretinalbreaksize] decimal(18, 2),
    [bdd_subretinalbands] int,
    [bdd_nocentralvisionloss] bit,
    [bdd_nosymptoms] bit
);

CREATE TABLE [beavrsretinaldetachmentdetailslog] (
    [bdd_ObjectId] int NOT NULL,
    [bdd_id] int NOT NULL PRIMARY KEY,
    [bdd_retinaldetachmentat] int NOT NULL,
    [bdd_lks_id_fovealattachment] int NOT NULL,
    [bdd_chronic] bit NOT NULL,
    [bdd_lks_id_pvrgrade] int NOT NULL,
    [bdd_pvranterior] int,
    [bdd_pvrposterior] int,
    [bdd_lks_id_vitreous] int,
    [bdd_lks_id_vitreoushaemorrhage] int NOT NULL,
    [bdd_choroidaleffusion] bit NOT NULL,
    [bdd_pathologicalmyopia] bit,
    [bdd_latticedegeneration] bit,
    [bdd_latticedegenerationat] int,
    [bdd_priorretinaldetachmentsurgery] bit NOT NULL,
    [bdd_initialsurgerydate] datetime,
    [bdd_lks_id_causeoffailure] int,
    [bdd_symptomonsetdate] date(3),
    [bdd_centralvisionlossonsetdate] date(3),
    [bdd_lks_id_systemiccondition] int,
    [bdd_detachedretinabreaks] int NOT NULL,
    [bdd_attachedretinabreaks] int NOT NULL,
    [bdd_retinalbreaksat] int,
    [bdd_lks_id_largestretinalbreaktype] int,
    [bdd_largestretinalbreaksize] decimal(18, 2),
    [bdd_subretinalbands] int,
    [bdd_nocentralvisionloss] bit,
    [bdd_nosymptoms] bit,
    [bdd_DateAdded] datetime NOT NULL,
    [bdd_AddedBy] uniqueidentifier NOT NULL,
    [bdd_TransactionId] uniqueidentifier NOT NULL,
    [bdd_Action] char(1) NOT NULL
);

CREATE TABLE [beavrsretinaldetachmentlog] (
    [brd_ObjectId] int NOT NULL,
    [brd_id] int NOT NULL PRIMARY KEY,
    [brd_primaryretinaldetachment] bit NOT NULL,
    [brd_act_id] uniqueidentifier NOT NULL,
    [brd_bod_id] int NOT NULL,
    [brd_bdd_id] int,
    [brd_DateAdded] datetime NOT NULL,
    [brd_AddedBy] uniqueidentifier NOT NULL,
    [brd_TransactionId] uniqueidentifier NOT NULL,
    [brd_Action] char(1) NOT NULL
);

CREATE TABLE [Bifoveal] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL,
    [Comments] nvarchar(5000),
    [Prism] int,
    [PrismDirection] int,
    [Correction] int,
    [Result] int
);

CREATE TABLE [BifovealLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ActivityId] uniqueidentifier NOT NULL,
    [Comments] nvarchar(5000),
    [Prism] int,
    [PrismDirection] int,
    [Correction] int,
    [Result] int
);

CREATE TABLE [BilirubinData] (
    [ubl_id] int NOT NULL PRIMARY KEY,
    [ubl_available] bit NOT NULL
);

CREATE TABLE [BillingChargeMappingDrugDuplicateMedicationRemovalBackup] (
    [bmd_Id] int NOT NULL PRIMARY KEY,
    [bmd_bic_ChargeId] int NOT NULL,
    [bmd_mcn_MedicationElementId] int NOT NULL,
    [bmd_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [BinaryDocument] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [binarydocument] (
    [bdc_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [BinaryDocument] (
    [SystemDocumentId] uniqueidentifier NOT NULL,
    [Content] varbinary(-1) NOT NULL
);

CREATE TABLE [binarydocument] (
    [bdc_mim_id] int NOT NULL
);

CREATE TABLE [BinaryDocument] (
    [MimeTypeId] int NOT NULL,
    [PageNumber] int NOT NULL,
    [DateCreated] datetime2 NOT NULL
);

CREATE TABLE [binarydocument] (
    [bdc_renamedto] varchar(255),
    [bdc_filedatetime] datetime,
    [bdc_dtp_id] int,
    [bdc_LegacyFileSystemStorage] bit NOT NULL,
    [bdc_LegacyFileAvailableForMigration] bit NOT NULL
);

CREATE TABLE [binarydocumentlog] (
    [bdc_objectId] int NOT NULL,
    [bdc_id] int NOT NULL PRIMARY KEY,
    [bdc_doc_id] uniqueidentifier NOT NULL,
    [bdc_version] int NOT NULL,
    [bdc_mim_id] int NOT NULL,
    [bdc_bod_id] int,
    [bdc_blb_id] uniqueidentifier NOT NULL,
    [bdc_renamedto] varchar(255),
    [bdc_originalpath] varchar(255),
    [bdc_filedatetime] datetime,
    [bdc_dtp_id] int,
    [bdc_blb_readonlyid] uniqueidentifier,
    [bdc_dateadded] datetime NOT NULL,
    [bdc_addedby] uniqueidentifier NOT NULL,
    [bdc_transactionid] uniqueidentifier NOT NULL,
    [bdc_action] char(1) NOT NULL,
    [bdc_publicversion] int,
    [bdc_LegacyFileSystemStorage] bit NOT NULL,
    [bdc_LegacyFileAvailableForMigration] bit NOT NULL
);

CREATE TABLE [BinaryDocumentRecipientCopy] (
    [BinaryDocumentId] int NOT NULL PRIMARY KEY,
    [DocumentRecipientId] int NOT NULL PRIMARY KEY,
    [BlobId] uniqueidentifier NOT NULL,
    [ReadonlyBlobId] uniqueidentifier
);

CREATE TABLE [BinaryDocumentRecipientCopyLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [DocumentRecipientId] int NOT NULL,
    [BlobId] uniqueidentifier NOT NULL,
    [ReadonlyBlobId] uniqueidentifier
);

CREATE TABLE [blobrepository] (
    [blb_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [blb_image] varbinary(-1),
    [blb_mim_id] int
);

CREATE TABLE [BloodData] (
    [ubd_id] int NOT NULL PRIMARY KEY,
    [ubd_available] bit NOT NULL
);

CREATE TABLE [bodypart] (
    [bod_id] int NOT NULL PRIMARY KEY,
    [bod_code] varchar(255) NOT NULL,
    [bod_desc] nvarchar(510),
    [bod_number] int NOT NULL,
    [bod_dro_id] int,
    [bod_cpt_id] int,
    [bod_available] bit NOT NULL
);

CREATE TABLE [BodySystem] (
    [rbs_id] int NOT NULL PRIMARY KEY,
    [rbs_bsm_id] int NOT NULL,
    [rbs_comments] nvarchar(MAX),
    [rbs_order] tinyint(1)
);

CREATE TABLE [BodySystemLog] (
    [rbs_ObjectId] int NOT NULL,
    [rbs_id] int NOT NULL PRIMARY KEY,
    [rbs_ros_id] int NOT NULL,
    [rbs_bsm_id] int NOT NULL,
    [rbs_comments] nvarchar(MAX),
    [rbs_order] tinyint(1),
    [rbs_DateAdded] datetime NOT NULL,
    [rbs_AddedBy] uniqueidentifier NOT NULL,
    [rbs_TransactionId] uniqueidentifier NOT NULL,
    [rbs_Action] char(1) NOT NULL
);

CREATE TABLE [BotulinumToxin] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [BodyPartId] int NOT NULL,
    [Units] float(8),
    [TechniqueId] int,
    [TechniqueId] int NOT NULL,
    [DrugId] int NOT NULL,
    [DrugId] int,
    [ActivityId] uniqueidentifier NOT NULL,
    [Comments] nvarchar(1000)
);

CREATE TABLE [BotulinumToxinDrug] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(1000) NOT NULL
);

CREATE TABLE [BotulinumToxinLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [BodyPartId] int NOT NULL,
    [Units] float(8),
    [TechniqueId] int,
    [TechniqueId] int NOT NULL,
    [DrugId] int NOT NULL,
    [DrugId] int,
    [ActivityId] uniqueidentifier NOT NULL,
    [Comments] nvarchar(1000)
);

CREATE TABLE [BotulinumToxinTechnique] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(1000) NOT NULL
);

CREATE TABLE [BrowserType] (
    [ebt_Id] int NOT NULL PRIMARY KEY,
    [ebt_Name] nvarchar(200) NOT NULL,
    [ebt_Available] bit NOT NULL
);

CREATE TABLE [bulkpatientload] (
    [PatientNo] varchar(50),
    [NhsNo] varchar(50),
    [NHSNumberStatusCode] varchar(50),
    [Title] varchar(50),
    [Surname] varchar(50),
    [Forenames] varchar(50),
    [MaritalStatus] varchar(50),
    [Sex] varchar(50),
    [Dob] varchar(50),
    [Address1] varchar(800),
    [Address2] varchar(800),
    [Address3] varchar(200),
    [Address4] varchar(200),
    [Address5] varchar(200),
    [PostCode] varchar(50),
    [HomeTelephone] varchar(50),
    [WorkTelephone] varchar(50),
    [MobileTelephone] varchar(50),
    [DeathDate] varchar(50),
    [Deceased] varchar(50),
    [GPCode] varchar(50),
    [GPPracticeCode] varchar(50),
    [GPPracticeName] varchar(50),
    [GPName] varchar(50),
    [GPTitle] varchar(50),
    [GPInitials] varchar(50),
    [GPSurname] varchar(50),
    [GPAddress1] varchar(50),
    [GPAddress2] varchar(50),
    [GPAddress3] varchar(50),
    [GPAddress4] varchar(50),
    [GPAddress5] varchar(50),
    [GPPostCode] varchar(50),
    [GPTelephone1] varchar(50),
    [GPTelephone2] varchar(50),
    [Religion] varchar(50),
    [EthnicOrigin] varchar(50),
    [OptedOut] varchar(50),
    [Merged] varchar(50),
    [MergedTo] varchar(50)
);

CREATE TABLE [Calculation] (
    [rpc_Id] int NOT NULL PRIMARY KEY,
    [rpc_use_UserId] uniqueidentifier NOT NULL,
    [rpc_DateTime] datetime2 NOT NULL,
    [rpc_ect_EncounterId] uniqueidentifier,
    [rpc_pln_PatientClinicalPlanId] int
);

CREATE TABLE [CalculationLog] (
    [rpc_Id] int NOT NULL PRIMARY KEY,
    [rpc_ObjectId] int NOT NULL,
    [rpc_pat_PatientId] uniqueidentifier NOT NULL,
    [rpc_use_UserId] uniqueidentifier NOT NULL,
    [rpc_DateTime] datetime2 NOT NULL,
    [rpc_ect_EncounterId] uniqueidentifier,
    [rpc_ppr_PatientClinicalPlanRootId] int,
    [rpc_pln_PatientClinicalPlanId] int,
    [rpc_DateAdded] datetime NOT NULL,
    [rpc_AddedBy] uniqueidentifier NOT NULL,
    [rpc_Transactionid] uniqueidentifier NOT NULL,
    [rpc_Action] char(1) NOT NULL
);

CREATE TABLE [CarePathwayDefaultStep] (
    [pds_id] int NOT NULL PRIMARY KEY,
    [pds_description] nvarchar(510) NOT NULL,
    [pds_cpw_id] int NOT NULL,
    [pds_stp_id] int NOT NULL,
    [pds_order] int NOT NULL,
    [pds_active] bit NOT NULL,
    [pds_IsPreArrival] bit NOT NULL
);

CREATE TABLE [CarePathwayDefaultStepLog] (
    [pds_Id] int NOT NULL PRIMARY KEY,
    [pds_description] nvarchar(510),
    [pds_cpw_id] int NOT NULL,
    [pds_stp_id] int NOT NULL,
    [pds_order] int NOT NULL,
    [pds_active] bit NOT NULL,
    [pds_ObjectId] int NOT NULL,
    [pds_DateAdded] datetime NOT NULL,
    [pds_AddedBy] uniqueidentifier NOT NULL,
    [pds_TransactionId] uniqueidentifier NOT NULL,
    [pds_Action] char(1) NOT NULL,
    [pds_IsPreArrival] bit
);

CREATE TABLE [cataract] (
    [cat_id] int NOT NULL PRIMARY KEY,
    [cat_eyeopnumber] int,
    [cat_lks_id_iolposition] int,
    [cat_iollensinserted] bit,
    [cat_lks_id_corticalclearance] int,
    [cat_lks_id_nucleusdelivery] int,
    [cat_lks_id_capsulotomy] int,
    [cat_lks_id_woundclosure] int,
    [cat_lks_id_incisionsite] int,
    [cat_incisionlength] float(8),
    [cat_incisionmeridian] int,
    [cat_lks_id_phacomachine] int,
    [cat_phacotime] time(5),
    [cat_phacopower] tinyint(1),
    [cat_effectivephacotime] time(5),
    [cat_miochol] bit,
    [cat_predpostrefcylinder] float(8),
    [cat_predpostrefaxis] float(8),
    [cat_nosutures] tinyint(1),
    [cat_lks_id_pupilsize] int,
    [cat_viscoelasticremoved] bit,
    [cat_lks_id_surgeonposition] int,
    [cat_icdilation] bit,
    [cat_visionblue] bit,
    [cat_hydrodelamination] bit,
    [cat_hydrodissection] bit,
    [cat_lks_id_biometrynotusedreason] int,
    [cat_sideports] int,
    [cat_lks_id_viscoelastic] int,
    [cat_lks_id_viscoelastic2] int,
    [cat_noacpara] tinyint(1),
    [cat_angcaptear] int,
    [cat_lks_id_incisionplane] int,
    [cat_phacominutes] tinyint(1),
    [cat_phacoseconds] tinyint(1),
    [cat_phacoeffectivetime] bit NOT NULL
);

CREATE TABLE [cataractiol] (
    [cil_id] int NOT NULL PRIMARY KEY,
    [cil_power] float(8),
    [cil_order] tinyint(1),
    [cil_powercylinder] float(8),
    [cil_poweraxis] float(8),
    [cil_poweradd] float(8)
);

CREATE TABLE [cataractiollog] (
    [cil_ObjectId] int NOT NULL,
    [cil_id] int NOT NULL PRIMARY KEY,
    [cil_cat_id] int,
    [cil_iol_id] uniqueidentifier,
    [cil_power] float(8),
    [cil_order] tinyint(1),
    [cil_powercylinder] float(8),
    [cil_poweraxis] float(8),
    [cil_poweradd] float(8),
    [cil_DateAdded] datetime NOT NULL,
    [cil_AddedBy] uniqueidentifier NOT NULL,
    [cil_TransactionId] uniqueidentifier NOT NULL,
    [cil_Action] char(1) NOT NULL
);

CREATE TABLE [cataractlog] (
    [cat_ObjectId] int NOT NULL,
    [cat_id] int NOT NULL PRIMARY KEY,
    [cat_act_id] uniqueidentifier NOT NULL,
    [cat_bod_id] int NOT NULL,
    [cat_eyeopnumber] int,
    [cat_lks_id_iolposition] int,
    [cat_iollensinserted] bit,
    [cat_lks_id_corticalclearance] int,
    [cat_lks_id_nucleusdelivery] int,
    [cat_lks_id_capsulotomy] int,
    [cat_lks_id_woundclosure] int,
    [cat_lks_id_incisionsite] int,
    [cat_incisionlength] float(8),
    [cat_incisionmeridian] int,
    [cat_lks_id_phacomachine] int,
    [cat_phacotime] time(5),
    [cat_phacopower] tinyint(1),
    [cat_effectivephacotime] time(5),
    [cat_miochol] bit,
    [cat_predpostref] float(8),
    [cat_predpostrefcylinder] float(8),
    [cat_predpostrefaxis] float(8),
    [cat_nosutures] tinyint(1),
    [cat_lks_id_pupilsize] int,
    [cat_viscoelasticremoved] bit,
    [cat_lks_id_surgeonposition] int,
    [cat_icdilation] bit,
    [cat_visionblue] bit,
    [cat_hydrodelamination] bit,
    [cat_hydrodissection] bit,
    [cat_lks_id_biometrynotusedreason] int,
    [cat_sideports] int,
    [cat_lks_id_viscoelastic] int,
    [cat_lks_id_viscoelastic2] int,
    [cat_noacpara] tinyint(1),
    [cat_angcaptear] int,
    [cat_lks_id_incisionplane] int,
    [cat_phacominutes] tinyint(1),
    [cat_phacoseconds] tinyint(1),
    [cat_phacoeffectivetime] bit,
    [cat_DateAdded] datetime NOT NULL,
    [cat_AddedBy] uniqueidentifier NOT NULL,
    [cat_TransactionId] uniqueidentifier NOT NULL,
    [cat_Action] char(1) NOT NULL
);

CREATE TABLE [CataractPlan] (
    [spc_id] int NOT NULL PRIMARY KEY,
    [spc_bod_id] int NOT NULL,
    [spc_firsteye] bit NOT NULL,
    [spc_planforsecondeye_lks_id] int,
    [spc_iol_id] uniqueidentifier,
    [spc_targetrefraction] float(8),
    [spc_comments] nvarchar(1000)
);

CREATE TABLE [CataractPlanLog] (
    [spc_ObjectId] int NOT NULL,
    [spc_id] int NOT NULL PRIMARY KEY,
    [spc_spp_id] int NOT NULL,
    [spc_bod_id] int NOT NULL,
    [spc_firsteye] bit NOT NULL,
    [spc_planforsecondeye_lks_id] int,
    [spc_iol_id] uniqueidentifier,
    [spc_targetrefraction] float(8),
    [spc_comments] nvarchar(1000),
    [spc_isdeleted] bit NOT NULL,
    [spc_DateAdded] datetime NOT NULL,
    [spc_AddedBy] uniqueidentifier NOT NULL,
    [spc_TransactionId] uniqueidentifier NOT NULL,
    [spc_Action] char(1) NOT NULL
);

CREATE TABLE [Cct] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [WithEpitheliumOn] int,
    [WithEpitheliumOff] int,
    [PreUv] int,
    [PostUv] int
);

CREATE TABLE [CctLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [WithEpitheliumOn] int,
    [WithEpitheliumOff] int,
    [PreUv] int,
    [PostUv] int
);

CREATE TABLE [CertificateOfVisionImpairment] (
    [cvi_pss_id] int NOT NULL PRIMARY KEY,
    [cvi_lks_certified_blind] int NOT NULL,
    [cvi_pdt_date_of_certification_blind] uniqueidentifier,
    [cvi_cpt_certified_blind_main_cause] int,
    [cvi_lks_certified_partially_sighted] int NOT NULL,
    [cvi_pdt_date_of_certification_partially_sighted] uniqueidentifier,
    [cvi_cpt_certified_partially_sighted_main_cause] int,
    [cvi_comments] nvarchar(MAX)
);

CREATE TABLE [Charge] (
    [bic_id] int NOT NULL PRIMARY KEY,
    [bsc_Id] int NOT NULL PRIMARY KEY,
    [bic_description] nvarchar(800) NOT NULL,
    [bic_medisightdescription] nvarchar(200) NOT NULL,
    [bic_requireslaterality] bit NOT NULL,
    [bsc_IsDeleted] bit NOT NULL,
    [bsc_Description] nvarchar(800) NOT NULL,
    [bic_available] bit NOT NULL,
    [bic_QualifierFreeText] nvarchar(510),
    [bsc_MedisightDescription] nvarchar(200) NOT NULL,
    [bsc_QualifierValue] nvarchar(510),
    [bic_HelpText] nvarchar(500),
    [bic_CodeLaterality] int,
    [bsc_QualifierTypeDescription] nvarchar(510),
    [bsc_bic_ChargeId] int,
    [bsc_use_ResponsibleUserId] uniqueidentifier,
    [bsc_CodeLaterality] int,
    [bsc_pro_ProcedureId] int,
    [bsc_pqi_ProcedureQualifierId] int,
    [bsc_QualifierName] nvarchar(510),
    [bsc_QualifierCode] nvarchar(510)
);

CREATE TABLE [ChargeActivity] (
    [bac_id] int NOT NULL PRIMARY KEY,
    [bac_bic_ChargeId] int,
    [bac_QualifierFreeText] nvarchar(510),
    [bac_AddedBySearch] bit NOT NULL,
    [bac_pro_ProcedureId] int,
    [bac_pqi_ProcedureQualifierId] int
);

CREATE TABLE [ChargeActivityLog] (
    [bac_ObjectId] int NOT NULL,
    [bac_id] int NOT NULL PRIMARY KEY,
    [bac_act_id] uniqueidentifier NOT NULL,
    [bac_bic_ChargeId] int,
    [bac_QualifierFreeText] nvarchar(510),
    [bac_AddedBySearch] bit NOT NULL,
    [bac_DateAdded] datetime NOT NULL,
    [bac_AddedBy] uniqueidentifier NOT NULL,
    [bac_TransactionId] uniqueidentifier NOT NULL,
    [bac_Action] char(1) NOT NULL,
    [bac_pro_ProcedureId] int,
    [bac_pqi_ProcedureQualifierId] int
);

CREATE TABLE [ChargeActivitySelection] (
    [cas_Id] int NOT NULL PRIMARY KEY,
    [cas_bod_BodyPartId] int NOT NULL,
    [cas_Selected] bit NOT NULL,
    [cas_use_SelectedUserId] uniqueidentifier
);

CREATE TABLE [ChargeActivitySelectionLog] (
    [cas_ObjectId] int NOT NULL,
    [cas_Id] int NOT NULL PRIMARY KEY,
    [cas_bac_ChargeActivityId] int NOT NULL,
    [cas_bod_BodyPartId] int NOT NULL,
    [cas_Selected] bit NOT NULL,
    [cas_use_SelectedUserId] uniqueidentifier,
    [cas_DateAdded] datetime NOT NULL,
    [cas_AddedBy] uniqueidentifier NOT NULL,
    [cas_TransactionId] uniqueidentifier NOT NULL,
    [cas_Action] char(1) NOT NULL
);

CREATE TABLE [ChargeIdentifier] (
    [sci_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ChargeInstanceIdentifier] (
    [cii_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ChargeLog] (
    [bic_ObjectId] int NOT NULL,
    [bic_id] int NOT NULL PRIMARY KEY,
    [bic_code] nvarchar(20) NOT NULL,
    [bic_description] nvarchar(800) NOT NULL,
    [bic_medisightdescription] nvarchar(200) NOT NULL,
    [bic_bct_id] int NOT NULL,
    [bic_bqt_id] int NOT NULL,
    [bic_requireslaterality] bit NOT NULL,
    [bic_available] bit NOT NULL,
    [bic_DateAdded] datetime NOT NULL,
    [bic_AddedBy] uniqueidentifier NOT NULL,
    [bic_TransactionId] uniqueidentifier NOT NULL,
    [bic_Action] char(1) NOT NULL,
    [bic_QualifierFreeText] nvarchar(510),
    [bic_HelpText] nvarchar(500),
    [bic_CodeLaterality] int
);

CREATE TABLE [ChargeMappingDrug] (
    [bmd_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ChargeMappingDrugLog] (
    [bmd_Id] int NOT NULL PRIMARY KEY,
    [bmd_bic_ChargeId] int NOT NULL,
    [bmd_mcn_MedicationElementId] int NOT NULL,
    [bmd_ObjectId] int NOT NULL,
    [bmd_DateAdded] datetime NOT NULL,
    [bmd_AddedBy] uniqueidentifier NOT NULL,
    [bmd_TransactionId] uniqueidentifier NOT NULL,
    [bmd_Action] char(1) NOT NULL
);

CREATE TABLE [ChargeMappingEncounter] (
    [bme_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ChargeMappingEncounterLog] (
    [bme_Id] int NOT NULL PRIMARY KEY,
    [bme_bic_ChargeId] int NOT NULL,
    [bme_ety_EncounterTypeId] int NOT NULL,
    [bme_ObjectId] int NOT NULL,
    [bme_DateAdded] datetime NOT NULL,
    [bme_AddedBy] uniqueidentifier NOT NULL,
    [bme_TransactionId] uniqueidentifier NOT NULL,
    [bme_Action] char(1) NOT NULL,
    [bme_cpw_Id] int
);

CREATE TABLE [ChargeMappingProcedure] (
    [bmp_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ChargeMappingProcedureLog] (
    [bmp_Id] int NOT NULL PRIMARY KEY,
    [bmp_bic_ChargeId] int NOT NULL,
    [bmp_pro_ProcedureId] int NOT NULL,
    [bmp_pqi_ProcedureQualifierId] int,
    [bmp_ObjectId] int NOT NULL,
    [bmp_DateAdded] datetime NOT NULL,
    [bmp_AddedBy] uniqueidentifier NOT NULL,
    [bmp_TransactionId] uniqueidentifier NOT NULL,
    [bmp_Action] char(1) NOT NULL
);

CREATE TABLE [ChargeType] (
    [bct_id] int NOT NULL PRIMARY KEY,
    [bct_description] nvarchar(510),
    [bct_Active] bit NOT NULL
);

CREATE TABLE [Checklist] (
    [chk_act_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [chk_Comments] nvarchar(MAX)
);

CREATE TABLE [ChecklistLog] (
    [chk_act_id] int NOT NULL PRIMARY KEY,
    [chk_ObjectId] uniqueidentifier NOT NULL,
    [chk_DateAdded] datetime NOT NULL,
    [chk_AddedBy] uniqueidentifier NOT NULL,
    [chk_Transactionid] uniqueidentifier NOT NULL,
    [chk_Action] char(1) NOT NULL,
    [chk_Comments] nvarchar(MAX)
);

CREATE TABLE [Clinic] (
    [clt_id] int NOT NULL PRIMARY KEY,
    [clt_desc] nvarchar(510),
    [clt_loc_id] uniqueidentifier,
    [clt_loc_id_reception] uniqueidentifier,
    [clt_code] nvarchar(40),
    [clt_use_id_consultant] uniqueidentifier,
    [clt_active] bit,
    [clt_apy_id] int,
    [clt_new] bit,
    [clt_followup] bit,
    [clt_cpw_id] int,
    [clt_AllowMultipleStepsInProgress] bit NOT NULL,
    [clt_ForReview] bit
);

CREATE TABLE [clinicalbodysystem] (
    [bsm_id] int NOT NULL PRIMARY KEY,
    [bsm_shortdesc] nvarchar(510),
    [bsm_longdesc] nvarchar(510)
);

CREATE TABLE [clinicalconceptalias] (
    [cpa_id] int NOT NULL PRIMARY KEY,
    [cqa_lks_id_aliastype] int NOT NULL,
    [cpa_cpt_id_alias] int,
    [cpa_description] nvarchar(510),
    [cpa_cql_id] int
);

CREATE TABLE [clinicalconceptcategory] (
    [cfd_id] int NOT NULL PRIMARY KEY,
    [cfd_description] nvarchar(510),
    [cfd_ccc_id] int NOT NULL
);

CREATE TABLE [clinicalconceptcategoryitem] (
    [cci_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [clinicalconceptcategorytype] (
    [ccc_id] int NOT NULL PRIMARY KEY,
    [ccc_description] varchar(255) NOT NULL
);

CREATE TABLE [clinicalconceptcommonitems] (
    [coi_id] int NOT NULL PRIMARY KEY,
    [coi_cot_id] int NOT NULL,
    [coi_cpt_id] int NOT NULL,
    [coi_order] int
);

CREATE TABLE [clinicalconceptcommontypes] (
    [cot_id] int NOT NULL PRIMARY KEY,
    [cot_name] varchar(255) NOT NULL
);

CREATE TABLE [clinicalconceptconditiontype] (
    [ccy_id] int NOT NULL PRIMARY KEY,
    [ccy_description] nvarchar(510)
);

CREATE TABLE [ClinicalConceptDefaultPanel] (
    [cdp_id] int NOT NULL PRIMARY KEY,
    [cdp_ccp_id] int NOT NULL
);

CREATE TABLE [ClinicalConceptFeature] (
    [ccf_id] int NOT NULL PRIMARY KEY,
    [ccf_ftr_id] int NOT NULL,
    [ccf_cpt_id] int NOT NULL,
    [ccf_orderId] int NOT NULL
);

CREATE TABLE [ClinicalConceptFeatureExclusionCriteria] (
    [cle_id] int NOT NULL PRIMARY KEY,
    [cle_ccf_ClinicalConceptFeatureId] int NOT NULL,
    [cle_ftr_ExclusionFeatureId] int NOT NULL,
    [cle_flk_ExclusionFeatureLookupId] int NOT NULL
);

CREATE TABLE [ClinicalConceptFeatureLookup] (
    [ccl_ccf_id] int NOT NULL PRIMARY KEY,
    [ccl_flk_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [clinicalconceptgroup] (
    [ccg_id] int NOT NULL PRIMARY KEY,
    [ccg_title] nvarchar(510),
    [ccg_exclusive] bit NOT NULL,
    [ccg_separator] varchar(10),
    [ccg_finalSeparator] varchar(10),
    [ccg_ccg_id_parent] int,
    [ccg_order] int,
    [ccg_excludeGroupIfEmpty] bit NOT NULL,
    [ccg_formatString] nvarchar(MAX) NOT NULL,
    [ccg_AllowIndividualFindingInteraction] bit NOT NULL
);

CREATE TABLE [clinicalconceptgroupitem] (
    [cgi_id] int NOT NULL PRIMARY KEY,
    [cgi_ccg_id] int NOT NULL,
    [cgi_cpt_id] int NOT NULL,
    [cgi_narrativetext] nvarchar(510) NOT NULL,
    [cgi_useConceptTerm] bit NOT NULL,
    [cgi_subGroupNumber] int
);

CREATE TABLE [clinicalconceptmenu] (
    [cmn_id] int NOT NULL PRIMARY KEY,
    [cmn_description] nvarchar(510),
    [cmn_itemsexclusive] bit NOT NULL
);

CREATE TABLE [clinicalconceptmenuitems] (
    [cmi_id] int NOT NULL PRIMARY KEY,
    [cmi_ast_id] int NOT NULL,
    [cmi_child] int,
    [cmi_ccp_id] int,
    [cmi_ccg_id] int,
    [cmi_negated] bit NOT NULL,
    [cmi_lks_id_measurementtype] int
);

CREATE TABLE [clinicalconceptpanel] (
    [ccp_id] int NOT NULL PRIMARY KEY,
    [ccp_name] nvarchar(510)
);

CREATE TABLE [clinicalconceptpanelgroup] (
    [cgr_id] int NOT NULL PRIMARY KEY,
    [cgr_name] nvarchar(510)
);

CREATE TABLE [clinicalconceptpanelitem] (
    [cpi_id] int NOT NULL PRIMARY KEY,
    [cpi_ccp_id] int NOT NULL,
    [cpi_type] int NOT NULL,
    [cpi_cpt_id] int,
    [cpi_cgr_id] int,
    [cpi_lks_id_measuretypeid] int,
    [cpi_order] int NOT NULL,
    [cpi_displaytext] nvarchar(510),
    [cpi_exclusive] bit,
    [cpi_helptext] nvarchar(510),
    [cpi_negated] bit NOT NULL
);

CREATE TABLE [clinicalconceptparsegroup] (
    [cpg_id] int NOT NULL PRIMARY KEY,
    [cpg_desc] nvarchar(510),
    [cpg_prependQualifier] bit NOT NULL,
    [cpg_preappend] nvarchar(510),
    [cpg_append] varchar(255)
);

CREATE TABLE [clinicalconceptparsingrules] (
    [cop_id] int NOT NULL PRIMARY KEY,
    [cop_prepend] nvarchar(510),
    [cop_append] nvarchar(510)
);

CREATE TABLE [clinicalconceptqualified] (
    [ccq_id] int NOT NULL PRIMARY KEY,
    [ccq_cpt_id_qualified] int NOT NULL
);

CREATE TABLE [clinicalconceptqualifier] (
    [cql_id] int NOT NULL PRIMARY KEY,
    [cql_description] nvarchar(510),
    [cql_qualifiertype] int NOT NULL,
    [cql_cqm_id] int
);

CREATE TABLE [clinicalconceptqualifiergroup] (
    [cqg_id] int NOT NULL PRIMARY KEY,
    [cqg_cql_id] int NOT NULL,
    [cqg_title] nvarchar(510),
    [cqg_parsemember] bit NOT NULL
);

CREATE TABLE [clinicalconceptqualifieritem] (
    [cqm_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ClinicalConceptQualifierMenu] (
    [cqm_id] int NOT NULL PRIMARY KEY,
    [cqm_text] nvarchar(510) NOT NULL,
    [cqm_cpt_id] int
);

CREATE TABLE [clinicalconcepts] (
    [cpt_id] int NOT NULL PRIMARY KEY,
    [cpt_snomedid] varchar(50),
    [cpt_searchable] bit NOT NULL,
    [cpt_status] tinyint(1),
    [cpt_action] int,
    [cpt_mustqualify] bit,
    [cpt_clinicfinding] bit NOT NULL,
    [cpt_diagnosis] bit NOT NULL,
    [cpt_history] bit NOT NULL,
    [cpt_investigation] bit NOT NULL,
    [cpt_flag] int,
    [cpt_bsm_id] int NOT NULL,
    [cpt_negated] bit NOT NULL,
    [cpt_negationcomment] nvarchar(100),
    [cpt_cpt_idpositive] int,
    [cpt_eyerelated] bit NOT NULL,
    [cpt_icd10] varchar(20),
    [cpt_readcode] varchar(10),
    [cpt_version] int NOT NULL,
    [cpt_abbreviated] nvarchar(510),
    [cpt_preventAddingFromPreviousFinding] bit NOT NULL
);

CREATE TABLE [clinicalconceptsbackup] (
    [cpt_id] int NOT NULL,
    [cpt_description] varchar(255) NOT NULL,
    [cpt_cpy_id] int NOT NULL,
    [cpt_snomedid] varchar(50),
    [cpt_searchable] bit,
    [cpt_status] tinyint(1),
    [cpt_action] int,
    [cpt_mustqualify] bit,
    [cpt_flag] int
);

CREATE TABLE [clinicalconceptsmap] (
    [cmp_id] int NOT NULL PRIMARY KEY,
    [cmp_description] varchar(255) NOT NULL,
    [cmp_cpt_id] int NOT NULL,
    [cmp_cpy_id] int NOT NULL,
    [cmp_cpy_id_unique] int
);

CREATE TABLE [clinicalconceptspromotion] (
    [cpr_id] int NOT NULL PRIMARY KEY,
    [cpr_cpt_id_promoted] int NOT NULL
);

CREATE TABLE [clinicalconceptsretired] (
    [cpt_id] int NOT NULL PRIMARY KEY,
    [cpt_description] varchar(255) NOT NULL,
    [cpt_cpy_id] int NOT NULL,
    [cpt_id_mapped] int,
    [cpt_description_mapped] varchar(255),
    [cpt_cpy_id_mapped] int
);

CREATE TABLE [clinicalconcepttype] (
    [cpy_id] int NOT NULL PRIMARY KEY,
    [cpy_description] varchar(255) NOT NULL,
    [cpy_tempid] uniqueidentifier NOT NULL
);

CREATE TABLE [clinicaldatahistory] (
    [cdh_id] int NOT NULL PRIMARY KEY,
    [cdh_subject] varchar(255) NOT NULL,
    [cdh_update] varchar(255),
    [cdh_updatedate] datetime
);

CREATE TABLE [clinicaloutcome] (
    [cou_id] int NOT NULL PRIMARY KEY,
    [cou_desclong] varchar(50),
    [cou_descshort] varchar(50),
    [cou_ety_id] int,
    [cou_aty_id] int,
    [cou_future] bit
);

CREATE TABLE [ClinicLog] (
    [clt_Id] int NOT NULL PRIMARY KEY,
    [clt_desc] nvarchar(510),
    [clt_loc_id] uniqueidentifier,
    [clt_loc_id_reception] uniqueidentifier,
    [clt_code] nvarchar(40),
    [clt_lks_id_mode] int,
    [clt_use_id_consultant] uniqueidentifier,
    [clt_active] bit,
    [clt_clerksteps] int,
    [clt_id_guid] uniqueidentifier,
    [clt_apy_id] int,
    [clt_new] bit,
    [clt_followup] bit,
    [clt_cpw_id] int,
    [clt_ObjectId] int NOT NULL,
    [clt_DateAdded] datetime NOT NULL,
    [clt_AddedBy] uniqueidentifier NOT NULL,
    [clt_TransactionId] uniqueidentifier NOT NULL,
    [clt_Action] char(1) NOT NULL,
    [clt_std_ClinicalStudyId] int,
    [clt_AllowMultipleStepsInProgress] bit,
    [clt_ForReview] bit
);

CREATE TABLE [ClinicType] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Colour] (
    [col_id] int NOT NULL PRIMARY KEY,
    [col_description] varchar(50) NOT NULL,
    [col_hex] char(7) NOT NULL
);

CREATE TABLE [ColourData] (
    [uco_id] int NOT NULL PRIMARY KEY,
    [uco_available] bit NOT NULL
);

CREATE TABLE [Comment] (
    [psc_pss_id] int NOT NULL PRIMARY KEY,
    [psc_comments] nvarchar(MAX)
);

CREATE TABLE [CommentFindings] (
    [Id] int NOT NULL PRIMARY KEY,
    [Comments] nvarchar(4000)
);

CREATE TABLE [CommentFindingsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL,
    [Comments] nvarchar(4000),
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [commenttype] (
    [cty_id] int NOT NULL PRIMARY KEY,
    [cty_code] nvarchar(510),
    [cty_desc] nvarchar(510)
);

CREATE TABLE [commonlyprescribedmedication] (
    [cpm_id] int NOT NULL PRIMARY KEY,
    [cpm_dmy_id] int NOT NULL,
    [cpm_dbr_id] int,
    [cpm_order] tinyint(1) NOT NULL,
    [cpm_contextflag] int NOT NULL
);

CREATE TABLE [CommonlyPrescribedMedicationDuplicateMedicationRemovalBackup] (
    [cpm_id] int NOT NULL PRIMARY KEY,
    [cpm_dmy_id] int NOT NULL,
    [cpm_dbr_id] int,
    [cpm_order] tinyint(1) NOT NULL,
    [cpm_contextflag] int NOT NULL
);

CREATE TABLE [commonlyprescribedmedicationlog] (
    [cpm_objectId] int NOT NULL,
    [cpm_id] int NOT NULL PRIMARY KEY,
    [cpm_dmy_id] int NOT NULL,
    [cpm_dbr_id] int,
    [cpm_order] tinyint(1) NOT NULL,
    [cpm_contextflag] int NOT NULL,
    [cpm_dateadded] datetime NOT NULL,
    [cpm_addedby] uniqueidentifier NOT NULL,
    [cpm_transactionid] uniqueidentifier NOT NULL,
    [cpm_action] char(1) NOT NULL
);

CREATE TABLE [CommunicationRule] (
    [sdr_id] int NOT NULL PRIMARY KEY,
    [sdr_rulename] nvarchar(510) NOT NULL
);

CREATE TABLE [CommunityFollowUpOutcomes] (
    [cfo_Id] int NOT NULL PRIMARY KEY,
    [cfo_act_ActivityId] uniqueidentifier NOT NULL,
    [cfo_NoFurtherActionSelected] bit NOT NULL,
    [cfo_RefractiveAim] nvarchar(4000),
    [cfo_ListForSecondEyeSelected] bit NOT NULL,
    [cfo_HospitalReviewRoutineSelected] bit NOT NULL,
    [cfo_HospitalReviewUrgentSelected] bit NOT NULL,
    [cfo_CommunityFollowUpSelected] bit,
    [cfo_HospitalMustViewSelected] bit
);

CREATE TABLE [CommunityFollowUpOutcomesLog] (
    [cfo_Id] int NOT NULL PRIMARY KEY,
    [cfo_ObjectId] int NOT NULL,
    [cfo_DateAdded] datetime NOT NULL,
    [cfo_AddedBy] uniqueidentifier NOT NULL,
    [cfo_TransactionId] uniqueidentifier NOT NULL,
    [cfo_Action] char(1) NOT NULL,
    [cfo_act_ActivityId] uniqueidentifier NOT NULL,
    [cfo_NoFurtherActionSelected] bit NOT NULL,
    [cfo_RefractiveAim] nvarchar(4000),
    [cfo_ListForSecondEyeSelected] bit NOT NULL,
    [cfo_HospitalReviewRoutineSelected] bit NOT NULL,
    [cfo_HospitalReviewUrgentSelected] bit NOT NULL,
    [cfo_CommunityFollowUpSelected] bit,
    [cfo_HospitalMustViewSelected] bit
);

CREATE TABLE [CompletionStatus] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(200) NOT NULL
);

CREATE TABLE [ConfiguredSource] (
    [hcs_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ConvergenceAssessment] (
    [Id] int NOT NULL PRIMARY KEY,
    [MethodId] int,
    [CorrectionId] int,
    [ToNose] bit NOT NULL,
    [NilConvergence] bit NOT NULL,
    [NearConvergencePoint1] int,
    [NearConvergencePoint2] int,
    [NearConvergencePoint3] int,
    [Recovery1] int,
    [Recovery2] int,
    [Recovery3] int,
    [Comments] nvarchar(2000)
);

CREATE TABLE [ConvergenceAssessmentLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL,
    [MethodId] int,
    [CorrectionId] int,
    [ToNose] bit NOT NULL,
    [NilConvergence] bit NOT NULL,
    [NearConvergencePoint1] int,
    [NearConvergencePoint2] int,
    [NearConvergencePoint3] int,
    [Recovery1] int,
    [Recovery2] int,
    [Recovery3] int,
    [Comments] nvarchar(2000),
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [ConvergenceAssessmentObservations] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ConvergenceAssessmentObservationsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObservationId] int NOT NULL,
    [AssessmentId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [ConvergenceObservation] (
    [Id] int NOT NULL PRIMARY KEY,
    [Order] int NOT NULL,
    [IsActive] bit NOT NULL,
    [StaticId] int
);

CREATE TABLE [ConvergenceObservationLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Name] nvarchar(40) NOT NULL,
    [Order] int NOT NULL,
    [IsActive] bit NOT NULL,
    [StaticId] int
);

CREATE TABLE [CoPathologyRiskGroup] (
    [crg_Id] int NOT NULL PRIMARY KEY,
    [crg_Description] nvarchar(200)
);

CREATE TABLE [Correction] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [CorrectionName] nvarchar(120) NOT NULL,
    [Name] nvarchar(200) NOT NULL
);

CREATE TABLE [Correspondence] (
    [crl_Id] int NOT NULL PRIMARY KEY,
    [crl_ActivityId] uniqueidentifier NOT NULL,
    [crl_MethodLookupDataId] int,
    [crl_Correction] int,
    [crl_AngleCorrected] bit,
    [crl_Distance] int,
    [crl_ResultLookupDataId] int,
    [crl_Comments] nvarchar(5000)
);

CREATE TABLE [CorrespondenceLog] (
    [crl_Id] int NOT NULL PRIMARY KEY,
    [crl_ObjectId] int NOT NULL,
    [crl_DateAdded] datetime NOT NULL,
    [crl_AddedBy] uniqueidentifier NOT NULL,
    [crl_Transactionid] uniqueidentifier NOT NULL,
    [crl_Action] char(1) NOT NULL,
    [crl_ActivityId] uniqueidentifier NOT NULL,
    [crl_MethodLookupDataId] int,
    [crl_Correction] int,
    [crl_AngleCorrected] bit,
    [crl_Distance] int,
    [crl_ResultLookupDataId] int,
    [crl_Comments] nvarchar(5000)
);

CREATE TABLE [CoverTestHorizontalTestFindings] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [HorizontalDeviationId] int,
    [SeverityId] int,
    [DiplopiaId] int,
    [RecoveryId] int,
    [NoDeviation] bit NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [CoverTestHorizontalTestFindingsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [HorizontalDeviationId] int,
    [SeverityId] int,
    [DiplopiaId] int,
    [RecoveryId] int,
    [NoDeviation] bit NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [CoverTestTorsionTestFindings] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [TorsionDeviationId] int,
    [SeverityId] int,
    [DiplopiaId] int,
    [RecoveryId] int,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [CoverTestTorsionTestFindingsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [TorsionDeviationId] int,
    [SeverityId] int,
    [DiplopiaId] int,
    [RecoveryId] int,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [CoverTestVerticalTestFindings] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [VerticalDeviationId] int,
    [SeverityId] int,
    [DiplopiaId] int,
    [RecoveryId] int,
    [NoDeviation] bit NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [CoverTestVerticalTestFindingsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [VerticalDeviationId] int,
    [SeverityId] int,
    [DiplopiaId] int,
    [RecoveryId] int,
    [NoDeviation] bit NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [customersite] (
    [sit_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [sit_code] varchar(255) NOT NULL,
    [sit_abbreviation] varchar(255),
    [sit_trustname] varchar(255) NOT NULL,
    [sit_trustsub] varchar(255) NOT NULL,
    [sit_name] nvarchar(510),
    [sit_add_id] uniqueidentifier NOT NULL,
    [sit_type] int,
    [sit_sharedcarescheme] varchar(255),
    [sit_available] bit,
    [sit_attributes] int,
    [sit_webaddress] nvarchar(510),
    [sit_trustcode] varchar(255),
    [sit_blb_id_letterheadimage] uniqueidentifier,
    [sit_envelopetop] int,
    [sit_envelopeleft] int,
    [sit_lks_id_letterheadtype] int,
    [sit_letterheadimageleftindent] int,
    [sit_OptoMizeHospitalCode] nvarchar(50)
);

CREATE TABLE [customersitecontact] (
    [ccn_id] int NOT NULL PRIMARY KEY,
    [ccn_value] varchar(255) NOT NULL,
    [ccn_lks_id_contact] int NOT NULL
);

CREATE TABLE [customersitecontactlog] (
    [ccn_objectId] int NOT NULL,
    [ccn_id] int NOT NULL PRIMARY KEY,
    [ccn_sit_id] uniqueidentifier NOT NULL,
    [ccn_value] varchar(255) NOT NULL,
    [ccn_lks_id_contact] int NOT NULL,
    [ccn_dateadded] datetime NOT NULL,
    [ccn_addedby] uniqueidentifier NOT NULL,
    [ccn_transactionid] uniqueidentifier NOT NULL,
    [ccn_action] char(1) NOT NULL
);

CREATE TABLE [customersitelog] (
    [sit_objectId] uniqueidentifier NOT NULL,
    [sit_id] int NOT NULL PRIMARY KEY,
    [sit_code] varchar(255) NOT NULL,
    [sit_trustname] varchar(255) NOT NULL,
    [sit_trustsub] varchar(255) NOT NULL,
    [sit_name] nvarchar(510),
    [sit_add_id] uniqueidentifier NOT NULL,
    [sit_type] int,
    [sit_sharedcarescheme] varchar(255),
    [sit_available] bit,
    [sit_attributes] int,
    [sit_webaddress] nvarchar(510),
    [sit_abbreviation] varchar(255),
    [sit_trustcode] varchar(255),
    [sit_blb_id_letterheadimage] uniqueidentifier,
    [sit_envelopetop] int,
    [sit_envelopeleft] int,
    [sit_lks_id_letterheadtype] int,
    [sit_dateadded] datetime NOT NULL,
    [sit_addedby] uniqueidentifier NOT NULL,
    [sit_transactionid] uniqueidentifier NOT NULL,
    [sit_action] char(1) NOT NULL,
    [sit_letterheadimageleftindent] int,
    [sit_OptoMizeHospitalCode] nvarchar(50)
);

CREATE TABLE [CxlActivity] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [CxlActivityLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [CxlCornealSurgery] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [CxlCornealSurgeryLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [CxlPreparation] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [EpithelialStatusId] int NOT NULL,
    [EpithelialStatusId] int,
    [MethodOfRemovalId] int,
    [MethodOfRemovalId] int,
    [EpithelialDebridement] int,
    [EpithelialDebridement] int
);

CREATE TABLE [CxlPreparationLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [EpithelialStatusId] int,
    [EpithelialStatusId] int NOT NULL,
    [MethodOfRemovalId] int,
    [MethodOfRemovalId] int,
    [EpithelialDebridement] int,
    [EpithelialDebridement] int
);

CREATE TABLE [CxlSurgicalCompletion] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [BandageContactLens] bit,
    [BandageContactLens] bit,
    [BandageTypeId] int,
    [TypeId] int
);

CREATE TABLE [CxlSurgicalCompletionDrugs] (
    [Id] int NOT NULL PRIMARY KEY,
    [TypeId] int NOT NULL PRIMARY KEY,
    [RouteId] int NOT NULL PRIMARY KEY,
    [NameId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [CxlSurgicalCompletionDrugsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TypeId] int NOT NULL,
    [RouteId] int NOT NULL,
    [NameId] int NOT NULL
);

CREATE TABLE [CxlSurgicalCompletionLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [BandageContactLens] bit,
    [BandageContactLens] bit,
    [TypeId] int,
    [BandageTypeId] int
);

CREATE TABLE [Cyclodiode] (
    [cyc_sdf_id] int NOT NULL PRIMARY KEY,
    [cyc_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [cyc_bod_BodyPartId] int NOT NULL,
    [cyc_lks_InstrumentId] int,
    [cyc_RightEyeDegreesTreated] int,
    [cyc_lks_InstrumentId] int NOT NULL,
    [cyc_DegreesTreated] int NOT NULL,
    [cyc_RightEyePositionFrom] int,
    [cyc_RightEyePositionTo] int,
    [cyc_FromPosition] int,
    [cyc_ToPosition] int,
    [cyc_RightEyeSparing] bit NOT NULL,
    [cyc_LeftEyeDegreesTreated] int,
    [cyc_Sparing] bit NOT NULL,
    [cyc_NumberOfLaserSpots] int,
    [cyc_LeftEyePositionFrom] int,
    [cyc_LeftEyePositionTo] int,
    [cyc_LeftEyeSparing] bit NOT NULL
);

CREATE TABLE [CyclodiodeLog] (
    [cyc_act_ActivityId] int NOT NULL PRIMARY KEY,
    [cyc_sdf_id] int NOT NULL PRIMARY KEY,
    [cyc_ObjectId] int NOT NULL,
    [cyc_bod_BodyPartId] int NOT NULL,
    [cyc_lks_InstrumentId] int NOT NULL,
    [cyc_DateAdded] datetime NOT NULL,
    [cyc_AddedBy] uniqueidentifier NOT NULL,
    [cyc_ObjectId] uniqueidentifier NOT NULL,
    [cyc_DateAdded] datetime NOT NULL,
    [cyc_Transactionid] uniqueidentifier NOT NULL,
    [cyc_Action] char(1) NOT NULL,
    [cyc_AddedBy] uniqueidentifier NOT NULL,
    [cyc_Transactionid] uniqueidentifier NOT NULL,
    [cyc_lks_InstrumentId] int,
    [cyc_RightEyeDegreesTreated] int,
    [cyc_Action] char(1) NOT NULL,
    [cyc_DegreesTreated] int NOT NULL,
    [cyc_RightEyePositionFrom] int,
    [cyc_RightEyePositionTo] int,
    [cyc_FromPosition] int,
    [cyc_ToPosition] int,
    [cyc_RightEyeSparing] bit NOT NULL,
    [cyc_LeftEyeDegreesTreated] int,
    [cyc_Sparing] bit NOT NULL,
    [cyc_NumberOfLaserSpots] int,
    [cyc_LeftEyePositionFrom] int,
    [cyc_LeftEyePositionTo] int,
    [cyc_LeftEyeSparing] bit NOT NULL
);

CREATE TABLE [CyclodiodeMedications] (
    [sdm_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [sdm_lks_id] int NOT NULL PRIMARY KEY,
    [sdm_dro_id] int NOT NULL PRIMARY KEY,
    [sdm_mcn_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [CyclodiodeMedicationsLog] (
    [sdm_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [sdm_ObjectId] int NOT NULL,
    [sdm_DateAdded] datetime NOT NULL,
    [sdm_AddedBy] uniqueidentifier NOT NULL,
    [sdm_Transactionid] uniqueidentifier NOT NULL,
    [sdm_Action] char(1) NOT NULL,
    [sdm_lks_id] int,
    [sdm_dro_id] int,
    [sdm_mcn_id] int
);

CREATE TABLE [CycloTarget] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [CycloTargetId] int,
    [CycloTargetId] int NOT NULL,
    [RangeFrom] tinyint(1),
    [RangeFrom] tinyint(1),
    [RangeTo] tinyint(1),
    [RangeTo] tinyint(1)
);

CREATE TABLE [CycloTargetLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [CycloTargetId] int NOT NULL,
    [CycloTargetId] int,
    [RangeFrom] tinyint(1),
    [RangeFrom] tinyint(1),
    [RangeTo] tinyint(1),
    [RangeTo] tinyint(1)
);

CREATE TABLE [Data] (
    [sdd_id] int NOT NULL PRIMARY KEY,
    [dtd_id] int NOT NULL PRIMARY KEY,
    [dtd_data] varbinary(-1) NOT NULL,
    [sdd_data] varbinary(-1) NOT NULL,
    [sdd_mappedData] nvarchar(MAX),
    [sdd_humanReadableData] nvarchar(MAX),
    [sdd_sid_id] int NOT NULL,
    [sdd_dateOfTransfer] datetime2 NOT NULL,
    [sdd_dateOfInsertion] datetime2,
    [sdd_ect_id] uniqueidentifier,
    [sdd_ipm_id] int,
    [sdd_use_id] uniqueidentifier NOT NULL,
    [sdd_use_id_seenBy] uniqueidentifier,
    [sdd_cpw_id] int,
    [sdd_ety_id_encounterTypeToCreate] int,
    [sdd_ety_id_encounterTypeBeingLinked] int,
    [sdd_loc_LocationId] uniqueidentifier
);

CREATE TABLE [DataActivityImport] (
    [sdi_Id] int NOT NULL PRIMARY KEY,
    [sdi_aty_ActivityTypeId] int NOT NULL,
    [sdi_ActivitySubTypeId] int,
    [sdi_Imported] bit NOT NULL
);

CREATE TABLE [DataActivityImportLog] (
    [sdi_Id] int NOT NULL PRIMARY KEY,
    [sdi_ObjectId] int NOT NULL,
    [sdi_sdd_DataId] int NOT NULL,
    [sdi_aty_ActivityTypeId] int NOT NULL,
    [sdi_ActivitySubTypeId] int,
    [sdi_Imported] bit NOT NULL,
    [sdi_DateAdded] datetime NOT NULL,
    [sdi_AddedBy] uniqueidentifier NOT NULL,
    [sdi_Transactionid] uniqueidentifier NOT NULL,
    [sdi_Action] char(1) NOT NULL
);

CREATE TABLE [DataBits] (
    [sdb_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DataChecks] (
    [dcs_Id] int NOT NULL PRIMARY KEY,
    [dcs_StoredProcedureName] varchar(255) NOT NULL,
    [dcs_IsDeleted] bit NOT NULL
);

CREATE TABLE [DataImportMethod] (
    [dim_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DataLog] (
    [sdd_objectId] int NOT NULL,
    [sdd_id] int NOT NULL PRIMARY KEY,
    [sdd_data] varbinary(-1) NOT NULL,
    [sdd_mappedData] nvarchar(MAX),
    [sdd_humanReadableData] nvarchar(MAX),
    [sdd_sds_id] int NOT NULL,
    [sdd_sid_id] int NOT NULL,
    [sdd_dateOfTransfer] datetime2 NOT NULL,
    [sdd_dateOfInsertion] datetime2,
    [sdd_ect_id] uniqueidentifier,
    [sdd_pat_id] uniqueidentifier NOT NULL,
    [sdd_dateAdded] datetime NOT NULL,
    [sdd_addedBy] uniqueidentifier NOT NULL,
    [sdd_transactionid] uniqueidentifier NOT NULL,
    [sdd_action] char(1) NOT NULL,
    [sdd_ipm_id] int,
    [sdd_use_id] uniqueidentifier,
    [sdd_use_id_seenBy] uniqueidentifier,
    [sdd_cpw_id] int,
    [sdd_ety_id_encounterTypeToCreate] int,
    [sdd_ety_id_encounterTypeBeingLinked] int,
    [sdd_loc_LocationId] uniqueidentifier
);

CREATE TABLE [DataRunCheckLogging] (
    [dcc_Id] int NOT NULL PRIMARY KEY,
    [dcc_DataCompletenessCheckId] int NOT NULL,
    [dcc_PatientId] uniqueidentifier NOT NULL,
    [dcc_RunDate] datetime NOT NULL,
    [dcc_ElapsedTimeInMilliSeconds] int NOT NULL,
    [dcc_CheckPassed] bit NOT NULL,
    [dcc_FailureMessages] varchar(MAX)
);

CREATE TABLE [dataupdatetoken] (
    [dut_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [dut_use_id] uniqueidentifier,
    [dut_device] varchar(255),
    [dut_documentrelated] bit NOT NULL,
    [dut_eps_id] uniqueidentifier
);

CREATE TABLE [dataupdatetoken_bak_patch90620190802] (
    [dut_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [dut_use_id] uniqueidentifier,
    [dut_ety_id] int,
    [dut_pat_id] uniqueidentifier,
    [dut_ect_id] uniqueidentifier,
    [dut_device] varchar(255),
    [dut_datetaken] datetime NOT NULL,
    [dut_status] int,
    [dut_documentrelated] bit NOT NULL,
    [dut_eps_id] uniqueidentifier
);

CREATE TABLE [DataUpdateTokenLog] (
    [dut_id] int NOT NULL PRIMARY KEY,
    [dut_ObjectId] uniqueidentifier NOT NULL,
    [dut_DateAdded] datetime NOT NULL,
    [dut_AddedBy] uniqueidentifier NOT NULL,
    [dut_Transactionid] uniqueidentifier NOT NULL,
    [dut_Action] char(1) NOT NULL,
    [dut_use_id] uniqueidentifier,
    [dut_ety_id] int,
    [dut_pat_id] uniqueidentifier,
    [dut_ect_id] uniqueidentifier,
    [dut_device] varchar(255),
    [dut_datetaken] datetime NOT NULL,
    [dut_status] int NOT NULL,
    [dut_documentrelated] bit NOT NULL,
    [dut_eps_id] uniqueidentifier,
    [dut_ExpirationDate] datetime,
    [dut_aet_EncounterTemplateId] int
);

CREATE TABLE [DataUploadHistory] (
    [cpu_Id] int NOT NULL PRIMARY KEY,
    [cpu_OperationDate] datetime NOT NULL,
    [cpu_UploadSuccessful] bit NOT NULL,
    [cpu_UploadMessage] nvarchar(510) NOT NULL
);

CREATE TABLE [DatePrecisionType] (
    [dpy_id] int NOT NULL PRIMARY KEY,
    [dpy_Description] nvarchar(60),
    [dpy_DisplayFormat] nvarchar(40)
);

CREATE TABLE [DateQuestion] (
    [dqp_qui_QuestionId] int NOT NULL PRIMARY KEY,
    [dqp_dpy_DatePrecisionTypeId] int NOT NULL,
    [dqp_PreventPrecisionChanges] bit NOT NULL
);

CREATE TABLE [DateQuestionLog] (
    [dqp_qui_QuestionId] int NOT NULL PRIMARY KEY,
    [dqp_dpy_DatePrecisionTypeId] int NOT NULL,
    [dqp_PreventPrecisionChanges] bit NOT NULL,
    [dqp_ObjectId] int NOT NULL,
    [dqp_DateAdded] datetime NOT NULL,
    [dqp_AddedBy] uniqueidentifier NOT NULL,
    [dqp_TransactionId] uniqueidentifier NOT NULL,
    [dqp_Action] char(1) NOT NULL
);

CREATE TABLE [DateQuestionVersion] (
    [dqv_quv_QuestionVersionId] int NOT NULL PRIMARY KEY,
    [dqv_dpy_DatePrecisionTypeId] int NOT NULL,
    [dqv_PreventPrecisionChanges] bit NOT NULL
);

CREATE TABLE [DateQuestionVersionLog] (
    [dqv_quv_QuestionVersionId] int NOT NULL PRIMARY KEY,
    [dqv_dpy_DatePrecisionTypeId] int NOT NULL,
    [dqv_PreventPrecisionChanges] bit NOT NULL,
    [dqv_ObjectId] int NOT NULL,
    [dqv_DateAdded] datetime NOT NULL,
    [dqv_AddedBy] uniqueidentifier NOT NULL,
    [dqv_TransactionId] uniqueidentifier NOT NULL,
    [dqv_Action] char(1) NOT NULL
);

CREATE TABLE [DayOfSurgeryChecksDropsAndMedicationItemDuplicateMedicationRemovalBackup] (
    [pde_id] int NOT NULL PRIMARY KEY,
    [pde_act_id] uniqueidentifier NOT NULL,
    [pde_bod_id] int,
    [pde_mcn_id] int NOT NULL,
    [pde_dro_id] int NOT NULL,
    [pde_dco_id] int NOT NULL,
    [pde_use_id_PrescribedBy] uniqueidentifier NOT NULL,
    [pde_PrescribedDate] datetime NOT NULL,
    [pde_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [DayOfSurgeryChecksPlannedProcedureMedicationItemDuplicateMedicationRemovalBackup] (
    [dmi_id] int NOT NULL PRIMARY KEY,
    [dmi_dpm_id] int NOT NULL,
    [dmi_bod_id] int,
    [dmi_mcn_id] int NOT NULL,
    [dmi_dro_id] int NOT NULL,
    [dmi_dco_id] int NOT NULL,
    [dmi_use_id_PrescribedBy] uniqueidentifier NOT NULL,
    [dmi_PrescribedDate] datetime NOT NULL,
    [dmi_AdditionalNotes] nvarchar(500),
    [dmi_StartDateDayAfterSurgery] bit,
    [dmi_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [DayOfSurgeryChecksPlannedProcedureMedicationRemovalBackup] (
    [dpm_id] int NOT NULL PRIMARY KEY,
    [dpm_pln_id] int NOT NULL,
    [dpm_dsc_id] int NOT NULL,
    [dpm_NotRequired] bit NOT NULL,
    [dpm_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [DBVersion] (
    [DBVersionId] int NOT NULL,
    [InsertedOn] datetime NOT NULL,
    [Comments] nvarchar(400)
);

CREATE TABLE [Default] (
    [Id] int NOT NULL PRIMARY KEY,
    [DeviceId] int,
    [EncounterTypeId] int NOT NULL
);

CREATE TABLE [defaultdrugoptions] (
    [ddo_id] int NOT NULL PRIMARY KEY,
    [ddo_mcn_id] int,
    [ddo_dro_id] int,
    [ddo_dco_id] int,
    [ddo_order] int,
    [ddo_additionalNotes] nvarchar(500)
);

CREATE TABLE [DefaultDrugOptionsDuplicateMedicationRemovalBackup] (
    [ddo_id] int NOT NULL PRIMARY KEY,
    [ddo_mcn_id] int,
    [ddo_drs_id] int,
    [ddo_dro_id] int,
    [ddo_dco_id] int,
    [ddo_order] int,
    [ddo_additionalNotes] nvarchar(500),
    [ddo_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [defaultdrugoptionslog] (
    [ddo_objectId] int NOT NULL,
    [ddo_id] int NOT NULL PRIMARY KEY,
    [ddo_mcn_id] int,
    [ddo_drs_id] int,
    [ddo_dro_id] int,
    [ddo_dco_id] int,
    [ddo_order] int,
    [ddo_dateadded] datetime NOT NULL,
    [ddo_addedby] uniqueidentifier NOT NULL,
    [ddo_transactionid] uniqueidentifier NOT NULL,
    [ddo_action] char(1) NOT NULL,
    [ddo_additionalNotes] nvarchar(500)
);

CREATE TABLE [DefaultDrugs] (
    [sdd_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [sdd_lks_id] int NOT NULL PRIMARY KEY,
    [sdd_dro_id] int NOT NULL PRIMARY KEY,
    [sdd_mcn_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DefaultDrugsLog] (
    [sdd_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [sdd_ObjectId] int NOT NULL,
    [sdd_DateAdded] datetime NOT NULL,
    [sdd_AddedBy] uniqueidentifier NOT NULL,
    [sdd_Transactionid] uniqueidentifier NOT NULL,
    [sdd_Action] char(1) NOT NULL,
    [sdd_lks_id] int,
    [sdd_dro_id] int,
    [sdd_mcn_id] int
);

CREATE TABLE [DefaultExpiration] (
    [pfe_Id] int NOT NULL PRIMARY KEY,
    [pfe_Name] nvarchar(100)
);

CREATE TABLE [DefaultLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [DeviceId] int,
    [EncounterTypeId] int NOT NULL
);

CREATE TABLE [DefaultQuestionResponse] (
    [QuestionVersionId] int NOT NULL PRIMARY KEY,
    [QuestionResponseVersionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [defaults] (
    [def_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [defaultslog] (
    [def_objectId] int NOT NULL,
    [def_id] int NOT NULL PRIMARY KEY,
    [def_use_id] uniqueidentifier,
    [def_loc_id] uniqueidentifier,
    [def_host] varchar(255),
    [def_set_id] int NOT NULL,
    [def_value] varchar(255),
    [def_valuenumeric] decimal(18, 2),
    [def_dateadded] datetime NOT NULL,
    [def_addedby] uniqueidentifier NOT NULL,
    [def_transactionid] uniqueidentifier NOT NULL,
    [def_action] char(1) NOT NULL
);

CREATE TABLE [Dependency] (
    [vde_Id] int NOT NULL PRIMARY KEY,
    [vde_Description] varchar(500),
    [vde_Executed] bit
);

CREATE TABLE [DependencyIolPowerCalculation] (
    [dpc_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DependencyLog] (
    [vde_Id] int NOT NULL PRIMARY KEY,
    [vde_ObjectId] int NOT NULL,
    [vde_DateAdded] datetime NOT NULL,
    [vde_AddedBy] uniqueidentifier NOT NULL,
    [vde_Transactionid] uniqueidentifier NOT NULL,
    [vde_Action] char(1) NOT NULL,
    [vde_Description] varchar(500),
    [vde_Executed] bit
);

CREATE TABLE [deploymentlog] (
    [dpl_major] int,
    [dpl_minor] int,
    [dpl_build] int,
    [dpl_revision] int,
    [dpl_script] int,
    [dpl_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DeploymentLogDateTime] (
    [DeploymentLogDateTimeId] int NOT NULL,
    [DeploymentLogId] int NOT NULL PRIMARY KEY,
    [DeploymentLogVersion] varchar(200) NOT NULL,
    [InsertDateTime] datetime NOT NULL
);

CREATE TABLE [DeploymentLogDeletionioneAudit] (
    [DeploymentLog] varchar(200),
    [InsertDateTime] datetime NOT NULL,
    [DeletionioneAuditId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Destination] (
    [hmd_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DestinationScanType] (
    [dst_hmd_DestinationId] int NOT NULL PRIMARY KEY,
    [dst_hst_ScanTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [devdefaultiolmodels] (
    [rowid] int NOT NULL PRIMARY KEY,
    [IOL model Id] uniqueidentifier,
    [Name*] varchar(255),
    [Short name] varchar(255),
    [Description] varchar(255),
    [Manufacturer's A constant*] varchar(255),
    [Optical (IOL Master) A] varchar(255),
    [Optical (IOL Master) pACD] varchar(255),
    [Optical (IOL Master) SF] varchar(255),
    [Optical (IOL Master) a0] varchar(255),
    [Optical (IOL Master) a1] varchar(255),
    [Optical (IOL Master) a2] varchar(255),
    [Lens type] varchar(255),
    [Phakic] varchar(255),
    [Premium lens] varchar(255),
    [Aspheric] varchar(255),
    [Blue blocking] varchar(255),
    [Ref index] varchar(255),
    [Optic material] varchar(255),
    [Haptic material] varchar(255),
    [Optic size width] varchar(255),
    [Optic size height] varchar(255),
    [Length] varchar(255),
    [Haptic angle] varchar(255),
    [Optic style] varchar(255),
    [Haptic style] varchar(255),
    [Pieces] varchar(255),
    [Range 1 From] varchar(255),
    [Range 1 To] varchar(255),
    [Range 1 Incr] varchar(255),
    [Range 2 From] varchar(255),
    [Range 2 To] varchar(255),
    [Range 2 Incr] varchar(255),
    [Range 3 From] varchar(255),
    [Range 3 To] varchar(255),
    [Range 3 Incr] varchar(255),
    [Range 4 From] varchar(255),
    [Range 4 To] varchar(255),
    [Range 4 Incr] varchar(255),
    [Range 5 From] varchar(255),
    [Range 5 To] varchar(255),
    [Range 5 Incr] varchar(255),
    [version] decimal(18, 2),
    [processed] bit,
    [Optical (IOL Master) LF] varchar(255),
    [Design Factor] varchar(255)
);

CREATE TABLE [DeviationAfterSurgery] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [device] (
    [dev_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [dev_deviceid] varchar(32),
    [dev_name] varchar(32),
    [dev_macaddress] varchar(17),
    [dev_os] varchar(255),
    [dev_lastlogin] datetime NOT NULL,
    [dev_loc_id] uniqueidentifier,
    [dev_use_id] uniqueidentifier,
    [dev_lastlogout] datetime,
    [dev_TotalPhysicalMemoryInBytes] bigint(8)
);

CREATE TABLE [devicelog] (
    [dev_objectId] uniqueidentifier NOT NULL,
    [dev_id] int NOT NULL PRIMARY KEY,
    [dev_deviceid] varchar(32),
    [dev_name] varchar(32),
    [dev_macaddress] varchar(17),
    [dev_os] varchar(255),
    [dev_lastlogin] datetime,
    [dev_loc_id] uniqueidentifier,
    [dev_use_id] uniqueidentifier,
    [dev_dateadded] datetime NOT NULL,
    [dev_addedby] uniqueidentifier NOT NULL,
    [dev_transactionid] uniqueidentifier NOT NULL,
    [dev_action] char(1) NOT NULL,
    [dev_lastlogout] datetime,
    [dev_TotalPhysicalMemoryInBytes] bigint(8)
);

CREATE TABLE [DeviceScreen] (
    [dsc_Id] int NOT NULL PRIMARY KEY,
    [dsc_dev_DeviceId] uniqueidentifier NOT NULL,
    [dsc_XResolution] int NOT NULL,
    [dsc_YResolution] int NOT NULL,
    [dsc_XDpiScale] decimal(18, 2) NOT NULL,
    [dsc_YDpiScale] decimal(18, 2) NOT NULL
);

CREATE TABLE [DeviceType] (
    [ird_Id] int NOT NULL PRIMARY KEY,
    [ird_lkt_DeviceLookupType] int NOT NULL,
    [ird_OmitWhenInGroup] bit NOT NULL
);

CREATE TABLE [devindexlistmaster] (
    [TableName] sysname(256) NOT NULL,
    [TableID] int NOT NULL,
    [IndexName] sysname(256),
    [IndexID] int NOT NULL,
    [IndexType] nvarchar(120),
    [FillFactor] tinyint(1) NOT NULL,
    [IsPadded] bit,
    [ColumnName] sysname(256),
    [IndexColumnOrdinal] tinyint(1) NOT NULL,
    [IsPrimaryKey] bit,
    [IsIncludedColumn] bit,
    [DateAdded] datetime NOT NULL,
    [ColumnList] varchar(8000)
);

CREATE TABLE [DevMergeConceptsSchema] (
    [ParentID] float(8),
    [ParentName] nvarchar(510),
    [ChildID] float(8),
    [ChildName] nvarchar(510)
);

CREATE TABLE [DevVR1to1Mappings] (
    [RowId] int NOT NULL,
    [Section] nvarchar(510),
    [Field] nvarchar(510),
    [Type] nvarchar(510),
    [Value] nvarchar(510),
    [Procedure] nvarchar(510),
    [MappingDirection] nvarchar(510),
    [Processed] bit
);

CREATE TABLE [devwarningcheckstatus] (
    [dws_id] int NOT NULL PRIMARY KEY,
    [dws_name] varchar(255),
    [dws_clusteredindexcheck] bit,
    [dws_multipleindexcheck] bit,
    [dws_extendedpropertycheck] bit
);

CREATE TABLE [DiabeticControlMethod] (
    [Id] int NOT NULL PRIMARY KEY,
    [Control] nvarchar(200)
);

CREATE TABLE [DiabeticEyeScreeningFeature] (
    [Id] int NOT NULL PRIMARY KEY,
    [Feature] nvarchar(510)
);

CREATE TABLE [DiabeticEyeScreeningFeatureMapping] (
    [Id] int NOT NULL PRIMARY KEY,
    [FeatureId] int NOT NULL,
    [ClinicalConceptId] int,
    [FreeText] nvarchar(400)
);

CREATE TABLE [DiabeticEyeScreeningOtherCondition] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510)
);

CREATE TABLE [DiabeticEyeScreeningOtherConditionMapping] (
    [Id] int NOT NULL PRIMARY KEY,
    [OtherConditionId] int NOT NULL,
    [ClinicalConceptId] int,
    [FreeText] nvarchar(400)
);

CREATE TABLE [DiabeticEyeScreeningPathway] (
    [Id] int NOT NULL PRIMARY KEY,
    [Pathway] varchar(255) NOT NULL
);

CREATE TABLE [DiabeticEyeScreeningProcedure] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DiabeticEyeScreeningProcedureMapping] (
    [Id] int NOT NULL PRIMARY KEY,
    [DiabeticEyeScreeningProcedureId] int NOT NULL
);

CREATE TABLE [DiabeticEyeScreeningReferral] (
    [ReferralRequestId] int NOT NULL PRIMARY KEY,
    [DateOfScreening] date(3) NOT NULL,
    [DateOfNotification] date(3),
    [ReferredFromPathway] int NOT NULL,
    [DiabeticEyeScreeningOutcome] int NOT NULL,
    [ScreeningComments] varchar(2000),
    [NotesForOphthalmologist] varchar(2000),
    [DiabeticEyeScreeningProgrammeCode] nvarchar(510) NOT NULL
);

CREATE TABLE [DiabeticStatusRequest] (
    [DiabeticType] int,
    [RequestId] int NOT NULL PRIMARY KEY,
    [IsDiabetic] bit NOT NULL,
    [OnsetOfDiabetesYear] int,
    [OnsetOfDiabetesMonth] int,
    [OnsetOfDiabetesDay] int,
    [DiabeticEyeScreeningProgrammeCode] nvarchar(510)
);

CREATE TABLE [DiabeticStatusRequestControlMethod] (
    [Id] int NOT NULL PRIMARY KEY,
    [DiabeticRequestId] int NOT NULL,
    [ControlMethodId] int NOT NULL
);

CREATE TABLE [DiabeticType] (
    [Id] int NOT NULL PRIMARY KEY,
    [Type] nvarchar(200)
);

CREATE TABLE [Diplopia] (
    [Id] int NOT NULL PRIMARY KEY,
    [DiplopiaName] nvarchar(6) NOT NULL
);

CREATE TABLE [DiplopiaPreAdjustment] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Direction] (
    [Id] int NOT NULL PRIMARY KEY,
    [DirectionName] nvarchar(10) NOT NULL
);

CREATE TABLE [DischargePlanningComments] (
    [dpc_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [dpc_Comments] nvarchar(8000)
);

CREATE TABLE [DischargePlanningCommentsLog] (
    [dpc_ActivityId] int NOT NULL,
    [dpc_ObjectId] uniqueidentifier NOT NULL,
    [dpc_DateAdded] datetime NOT NULL,
    [dpc_AddedBy] uniqueidentifier NOT NULL,
    [dpc_Transactionid] uniqueidentifier NOT NULL,
    [dpc_Action] char(1) NOT NULL,
    [dpc_Comments] nvarchar(8000)
);

CREATE TABLE [DischargeReasons] (
    [cdr_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Distance] (
    [Id] int NOT NULL PRIMARY KEY,
    [DistanceName] nvarchar(20) NOT NULL
);

CREATE TABLE [documentcategory] (
    [dcy_id] int NOT NULL PRIMARY KEY,
    [dcy_dcs_id] int NOT NULL,
    [dcy_name] nvarchar(510) NOT NULL
);

CREATE TABLE [DocumentClass] (
    [dcs_id] int NOT NULL PRIMARY KEY,
    [dcs_name] nvarchar(510) NOT NULL,
    [dcs_batchprintable] bit
);

CREATE TABLE [documentexport] (
    [dex_id] int NOT NULL PRIMARY KEY,
    [dex_versiontoexport] int NOT NULL,
    [dex_isdeleted] bit NOT NULL,
    [dex_exportattempts] int NOT NULL,
    [dex_nextexportattempt] datetime,
    [dex_deg_GroupId] int NOT NULL,
    [dex_IsCancelMessage] bit NOT NULL,
    [dex_ExportedFileName] nvarchar(2000),
    [dex_CaseNumber] nvarchar(60),
    [dex_BillingReference] nvarchar(60)
);

CREATE TABLE [documentexportendpoint] (
    [dee_id] int NOT NULL PRIMARY KEY,
    [dee_name] varchar(255) NOT NULL,
    [dee_active] bit NOT NULL
);

CREATE TABLE [DocumentExportLog] (
    [dex_Id] int NOT NULL,
    [dex_ObjectId] int NOT NULL,
    [dex_DateAdded] datetime NOT NULL,
    [dex_AddedBy] uniqueidentifier NOT NULL,
    [dex_TransactionId] uniqueidentifier NOT NULL,
    [dex_Action] char(1) NOT NULL,
    [dex_doc_id] uniqueidentifier,
    [dex_versiontoexport] int NOT NULL,
    [dex_dee_id] int NOT NULL,
    [dex_dor_id] int NOT NULL,
    [dex_isdeleted] bit NOT NULL,
    [dex_exportattempts] int NOT NULL,
    [dex_nextexportattempt] datetime,
    [dex_deg_GroupId] int NOT NULL,
    [dex_IsCancelMessage] bit NOT NULL,
    [dex_ExportedFileName] nvarchar(2000),
    [dex_CaseNumber] nvarchar(60),
    [dex_BillingReference] nvarchar(60)
);

CREATE TABLE [documentexportstatus] (
    [des_id] int NOT NULL PRIMARY KEY,
    [des_validationresult] nvarchar(MAX)
);

CREATE TABLE [documenthistory] (
    [dhy_id] int NOT NULL PRIMARY KEY,
    [dhy_processsubject] int,
    [dhy_detail] varchar(255)
);

CREATE TABLE [documentprocessstage] (
    [dps_id] int NOT NULL PRIMARY KEY,
    [dps_name] nvarchar(510) NOT NULL,
    [dps_description] nvarchar(510) NOT NULL
);

CREATE TABLE [documentrecipient] (
    [dor_id] int NOT NULL PRIMARY KEY,
    [dor_addressname] nvarchar(510),
    [dor_forename] nvarchar(510),
    [dor_lks_id_gender] int,
    [dor_drg_GroupId] int NOT NULL,
    [dor_includeInAllFutureCorrespondence] bit,
    [dor_add_AddressId] uniqueidentifier,
    [dor_LargePrint] bit NOT NULL,
    [dor_UniqueDocumentRecipientKey] uniqueidentifier NOT NULL
);

CREATE TABLE [DocumentRecipientGroup] (
    [drg_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [documentrecipientlog] (
    [dor_objectId] int NOT NULL,
    [dor_id] int NOT NULL PRIMARY KEY,
    [dor_doc_id] uniqueidentifier NOT NULL,
    [dor_version] int NOT NULL,
    [dor_lks_id_recipient] int NOT NULL,
    [dor_address1] nvarchar(510),
    [dor_address2] nvarchar(510),
    [dor_address3] nvarchar(510),
    [dor_address4] nvarchar(510),
    [dor_postcode] varchar(255),
    [dor_initials] nvarchar(510),
    [dor_surname] nvarchar(510),
    [dor_title] nvarchar(510),
    [dor_firstname] nvarchar(510),
    [dor_source] int NOT NULL,
    [dor_signoff] varchar(255),
    [dor_includeaddresspage] bit NOT NULL,
    [dor_batchcopies] int NOT NULL,
    [dor_localcopies] int NOT NULL,
    [dor_edoc] bit NOT NULL,
    [dor_lks_id_recipienttype] int,
    [dor_organisation] nvarchar(510),
    [dor_includeaddresspagebatch] bit,
    [dor_jobtitle] nvarchar(510),
    [dor_recipient_id] uniqueidentifier,
    [dor_address5] nvarchar(510),
    [dor_addressname] nvarchar(510),
    [dor_forename] nvarchar(510),
    [dor_dateadded] datetime NOT NULL,
    [dor_addedby] uniqueidentifier NOT NULL,
    [dor_transactionid] uniqueidentifier NOT NULL,
    [dor_action] char(1) NOT NULL,
    [dor_copies] int,
    [dor_lks_id_gender] int,
    [dor_drg_GroupId] int,
    [dor_includeInAllFutureCorrespondence] bit,
    [dor_add_AddressId] uniqueidentifier,
    [dor_LargePrint] bit,
    [dor_UniqueDocumentRecipientKey] uniqueidentifier
);

CREATE TABLE [documentrecipientoverride] (
    [dov_id] int NOT NULL PRIMARY KEY,
    [dov_include] bit NOT NULL,
    [dov_lks_id_recipient] int NOT NULL,
    [dov_address1] nvarchar(510),
    [dov_address2] nvarchar(510),
    [dov_address3] nvarchar(510),
    [dov_address4] nvarchar(510),
    [dov_postcode] varchar(255),
    [dov_initials] nvarchar(510),
    [dov_surname] nvarchar(510),
    [dov_title] nvarchar(510),
    [dov_firstname] nvarchar(510),
    [dov_source] int NOT NULL,
    [dov_copies] int NOT NULL,
    [dov_signoff] varchar(255),
    [dov_includeaddresspage] bit NOT NULL,
    [dov_batchcopies] int NOT NULL,
    [dov_localcopies] int NOT NULL,
    [dov_edoc] bit NOT NULL,
    [dov_lks_id_recipienttype] int,
    [dov_organisation] nvarchar(510),
    [dov_includeaddresspagebatch] bit,
    [dov_jobtitle] nvarchar(510),
    [dov_recipient_id] uniqueidentifier,
    [dov_address5] nvarchar(510),
    [dov_addressname] nvarchar(510),
    [dov_forename] nvarchar(510),
    [dov_lks_id_gender] int,
    [dov_LargePrint] bit NOT NULL
);

CREATE TABLE [documentrecipientoverridelog] (
    [dov_objectId] int NOT NULL,
    [dov_id] int NOT NULL PRIMARY KEY,
    [dov_dtp_id] int NOT NULL,
    [dov_pat_id] uniqueidentifier NOT NULL,
    [dov_datecreated] datetime NOT NULL,
    [dov_include] bit NOT NULL,
    [dov_lks_id_recipient] int NOT NULL,
    [dov_address1] nvarchar(510),
    [dov_address2] nvarchar(510),
    [dov_address3] nvarchar(510),
    [dov_address4] nvarchar(510),
    [dov_postcode] varchar(255),
    [dov_initials] nvarchar(510),
    [dov_surname] nvarchar(510),
    [dov_title] nvarchar(510),
    [dov_firstname] nvarchar(510),
    [dov_source] int NOT NULL,
    [dov_copies] int NOT NULL,
    [dov_signoff] varchar(255),
    [dov_includeaddresspage] bit NOT NULL,
    [dov_batchcopies] int NOT NULL,
    [dov_localcopies] int NOT NULL,
    [dov_edoc] bit NOT NULL,
    [dov_lks_id_recipienttype] int,
    [dov_organisation] nvarchar(510),
    [dov_includeaddresspagebatch] bit,
    [dov_jobtitle] nvarchar(510),
    [dov_recipient_id] uniqueidentifier,
    [dov_address5] nvarchar(510),
    [dov_addressname] nvarchar(510),
    [dov_forename] nvarchar(510),
    [dov_dateadded] datetime NOT NULL,
    [dov_addedby] uniqueidentifier NOT NULL,
    [dov_transactionid] uniqueidentifier NOT NULL,
    [dov_action] char(1) NOT NULL,
    [dov_lks_id_gender] int,
    [dov_LargePrint] bit
);

CREATE TABLE [documentrecipienttype] (
    [dre_id] int NOT NULL PRIMARY KEY,
    [dre_dtp_id] int NOT NULL,
    [dre_lks_id_recipient] int NOT NULL
);

CREATE TABLE [DocumentStaging] (
    [mds_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [mds_source_epi_id] uniqueidentifier NOT NULL,
    [mds_target_epi_id] uniqueidentifier,
    [mds_blob] varbinary(-1),
    [mds_datecreated] datetime,
    [mds_contenttype] int,
    [mds_let_id] uniqueidentifier NOT NULL,
    [mds_dtp_id] int NOT NULL,
    [mds_let_printed] bit NOT NULL,
    [mds_let_esigned] bit NOT NULL,
    [mds_ismain] bit NOT NULL,
    [mds_version] int,
    [mds_documentcreatedate] datetime,
    [mds_storedonfilesystem] bit
);

CREATE TABLE [documentstatus] (
    [dst_id] int NOT NULL PRIMARY KEY,
    [dst_name] nvarchar(510) NOT NULL,
    [dst_isaction] bit NOT NULL
);

CREATE TABLE [documentTemplate_bak] (
    [dtm_id] int NOT NULL,
    [dtm_name] nvarchar(1024) NOT NULL,
    [dtm_dtp_id] int NOT NULL,
    [dtm_tbk_id_rootBlock] int NOT NULL,
    [dtm_displayName] nvarchar(1024)
);

CREATE TABLE [documenttype] (
    [dtp_id] int NOT NULL PRIMARY KEY,
    [dtp_type] tinyint(1),
    [dtp_name] nvarchar(510),
    [dtp_available] bit,
    [dtp_code] nvarchar(510),
    [dtp_edit] int,
    [dtp_orientation] int,
    [dtp_flag] int,
    [dtp_dcy_id] int,
    [dtp_defaultNote] bit,
    [dtp_isencounterletter] bit NOT NULL
);

CREATE TABLE [DonorInsertion] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [StainId] int,
    [LeftInSitu] int NOT NULL,
    [StainId] int,
    [DonorInsertion_LookupDataId] int NOT NULL,
    [GasBubbleId] int NOT NULL,
    [DonorInsertionId] int,
    [GasBubbleConcentration] int,
    [HighPressureTime] int,
    [GasBubbleId] int,
    [Concentration] int,
    [LeftInSitu] int,
    [SizeReducedTo] int,
    [HighPressureTime] int,
    [SizeReducedTo] int
);

CREATE TABLE [DonorInsertionLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [LeftInSitu] int NOT NULL,
    [StainId] int,
    [DonorInsertion_LookupDataId] int NOT NULL,
    [StainId] int,
    [DonorInsertionId] int,
    [GasBubbleId] int NOT NULL,
    [GasBubbleConcentration] int,
    [HighPressureTime] int,
    [GasBubbleId] int,
    [Concentration] int,
    [LeftInSitu] int,
    [SizeReducedTo] int,
    [HighPressureTime] int,
    [SizeReducedTo] int
);

CREATE TABLE [DonorPositioning] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [DonorPreparation] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [OrientationMarkId] int,
    [TransplantNumber] nvarchar(60) NOT NULL,
    [Precut] bit NOT NULL,
    [Precut] bit NOT NULL,
    [MethodId] int,
    [MethodId] int,
    [InstrumentId] int,
    [InstrumentId] int,
    [ThicknessOfDonor] int,
    [DiameterOfDonor] decimal(18, 2) NOT NULL,
    [ThicknessOfDonor] int,
    [AdditionalThinningPerformed] bit NOT NULL,
    [AdditionalThinningPerformed] bit NOT NULL,
    [EndothelialCellCount] int,
    [OrientationMarkId] int,
    [AgeOfDonor] int
);

CREATE TABLE [DonorPreparationLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [TransplantNumber] nvarchar(60) NOT NULL,
    [OrientationMarkId] int,
    [Precut] bit NOT NULL,
    [Precut] bit NOT NULL,
    [MethodId] int,
    [MethodId] int,
    [InstrumentId] int,
    [InstrumentId] int,
    [DiameterOfDonor] decimal(18, 2) NOT NULL,
    [ThicknessOfDonor] int,
    [AdditionalThinningPerformed] bit NOT NULL,
    [ThicknessOfDonor] int,
    [AdditionalThinningPerformed] bit NOT NULL,
    [EndothelialCellCount] int,
    [OrientationMarkId] int,
    [AgeOfDonor] int
);

CREATE TABLE [Drinking] (
    [pdk_pss_id] int NOT NULL PRIMARY KEY,
    [pdk_lks_status] int NOT NULL,
    [pdk_unitsperweek] int,
    [pdk_comments] nvarchar(MAX)
);

CREATE TABLE [Driving] (
    [psd_pss_id] int NOT NULL PRIMARY KEY,
    [psd_lks_status] int NOT NULL,
    [psd_comments] nvarchar(MAX)
);

CREATE TABLE [DrivingVehicle] (
    [psv_pss_id] int NOT NULL PRIMARY KEY,
    [psv_lks_vehicle] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DropsAndMedicationAdministeredItem] (
    [pda_id] int NOT NULL PRIMARY KEY,
    [pda_pde_id] int NOT NULL,
    [pda_TimeGiven] time(5) NOT NULL,
    [pda_pdt_Expired] uniqueidentifier,
    [pda_BatchNumber] varchar(255),
    [pda_ois_id] int,
    [pda_Deleted] bit NOT NULL,
    [pda_bod_id] int,
    [pda_use_id_AdministeredBy] uniqueidentifier NOT NULL
);

CREATE TABLE [DropsAndMedicationAdministeredItemLog] (
    [pda_id] int NOT NULL PRIMARY KEY,
    [pda_ObjectId] int NOT NULL,
    [pda_DateAdded] datetime NOT NULL,
    [pda_AddedBy] uniqueidentifier NOT NULL,
    [pda_Transactionid] uniqueidentifier NOT NULL,
    [pda_Action] char(1) NOT NULL,
    [pda_pde_id] int NOT NULL,
    [pda_TimeGiven] time(5) NOT NULL,
    [pda_pdt_Expired] uniqueidentifier,
    [pda_BatchNumber] varchar(255),
    [pda_ois_id] int,
    [pda_Deleted] bit NOT NULL,
    [pda_bod_id] int,
    [pda_use_id_AdministeredBy] uniqueidentifier NOT NULL
);

CREATE TABLE [DropsAndMedicationItem] (
    [pde_id] int NOT NULL PRIMARY KEY,
    [pde_bod_id] int,
    [pde_mcn_id] int NOT NULL,
    [pde_dro_id] int NOT NULL,
    [pde_dco_id] int NOT NULL,
    [pde_use_id_PrescribedBy] uniqueidentifier NOT NULL,
    [pde_PrescribedDate] datetime NOT NULL
);

CREATE TABLE [DropsAndMedicationItemLog] (
    [pde_id] int NOT NULL PRIMARY KEY,
    [pde_ObjectId] int NOT NULL,
    [pde_DateAdded] datetime NOT NULL,
    [pde_AddedBy] uniqueidentifier NOT NULL,
    [pde_Transactionid] uniqueidentifier NOT NULL,
    [pde_Action] char(1) NOT NULL,
    [pde_act_id] uniqueidentifier NOT NULL,
    [pde_bod_id] int,
    [pde_mcn_id] int NOT NULL,
    [pde_dro_id] int NOT NULL,
    [pde_dco_id] int NOT NULL,
    [pde_use_id_PrescribedBy] uniqueidentifier NOT NULL,
    [pde_PrescribedDate] datetime NOT NULL
);

CREATE TABLE [drugactualproduct] (
    [dap_id] int NOT NULL PRIMARY KEY,
    [dap_strength] nvarchar(510),
    [dap_strengthandform] nvarchar(510),
    [dap_dfm_id] int,
    [dap_preservativefree] bit NOT NULL,
    [dap_modifiedrelease] bit NOT NULL,
    [dap_description] nvarchar(4000),
    [dap_descriptionshort] nvarchar(4000),
    [dap_dcl_id] int,
    [dap_ampid] bigint(8),
    [dap_available] bit,
    [dap_atc] nvarchar(510),
    [dap_generic] bit NOT NULL,
    [dap_invalid] bit NOT NULL,
    [dap_mdd_id] int
);

CREATE TABLE [DrugActualProductDuplicate] (
    [dad_id] int NOT NULL PRIMARY KEY,
    [dad_dap_id_duplicate] int,
    [dad_dap_description_duplicate] nvarchar(8000),
    [dad_dap_ampid_duplicate] bigint(8),
    [dad_dap_id_master] int,
    [dad_dap_description_master] nvarchar(8000),
    [dad_dap_ampid_master] bigint(8)
);

CREATE TABLE [DrugActualProductDuplicateMedicationRemovalBackup] (
    [dap_id] int NOT NULL PRIMARY KEY,
    [dap_dvp_id] int,
    [dap_dbr_id] int,
    [dap_strength] nvarchar(510),
    [dap_strengthandform] nvarchar(510),
    [dap_dfm_id] int,
    [dap_preservativefree] bit NOT NULL,
    [dap_modifiedrelease] bit NOT NULL,
    [dap_description] nvarchar(510),
    [dap_descriptionshort] nvarchar(510),
    [dap_descriptionshortforsearch] nvarchar(510),
    [dap_dcl_id] int,
    [dap_ampid] bigint(8),
    [dap_available] bit,
    [dap_atc] nvarchar(510),
    [dap_generic] bit NOT NULL,
    [dap_invalid] bit NOT NULL
);

CREATE TABLE [DrugActualProductPatchHistory] (
    [dap_id] int NOT NULL PRIMARY KEY,
    [dap_dvp_id] int,
    [dap_dbr_id] int,
    [dap_strength] nvarchar(510),
    [dap_strengthandform] nvarchar(510),
    [dap_dfm_id] int,
    [dap_preservativefree] bit NOT NULL,
    [dap_modifiedrelease] bit NOT NULL,
    [dap_description] nvarchar(4000),
    [dap_descriptionshort] nvarchar(4000),
    [dap_descriptionshortforsearch] nvarchar(4000),
    [dap_dcl_id] int,
    [dap_ampid] bigint(8),
    [dap_available] bit,
    [dap_atc] nvarchar(510),
    [dap_generic] bit NOT NULL,
    [dap_invalid] bit NOT NULL,
    [dap_mdd_id] int NOT NULL,
    [dap_pns_id] int NOT NULL PRIMARY KEY,
    [dap_identifier] uniqueidentifier
);

CREATE TABLE [DrugActualProductVersionHistory] (
    [dap_id] int NOT NULL PRIMARY KEY,
    [dap_dvp_id] int,
    [dap_dbr_id] int,
    [dap_strength] nvarchar(510),
    [dap_strengthandform] nvarchar(510),
    [dap_dfm_id] int,
    [dap_preservativefree] bit NOT NULL,
    [dap_modifiedrelease] bit NOT NULL,
    [dap_description] nvarchar(4000),
    [dap_descriptionshort] nvarchar(4000),
    [dap_descriptionshortforsearch] nvarchar(4000),
    [dap_dcl_id] int,
    [dap_ampid] bigint(8),
    [dap_available] bit,
    [dap_atc] nvarchar(510),
    [dap_generic] bit NOT NULL,
    [dap_invalid] bit NOT NULL,
    [dap_mdd_id] int,
    [dap_identifier] uniqueidentifier,
    [PackageVersion] int NOT NULL PRIMARY KEY
);

CREATE TABLE [drugbrand] (
    [dbr_id] int NOT NULL PRIMARY KEY,
    [dbr_description] nvarchar(4000),
    [dbr_concept_id] bigint(8),
    [dbr_available] bit,
    [dbr_custom] bit,
    [dbr_mdd_id] int
);

CREATE TABLE [DrugBrandDuplicate] (
    [dbd_id] int NOT NULL PRIMARY KEY,
    [dbd_dbr_id_duplicate] int,
    [dbd_dbr_description_duplicate] nvarchar(8000),
    [dbd_dbr_concept_id_duplicate] bigint(8),
    [dbd_dbr_id_master] int,
    [dbd_dbr_description_master] nvarchar(8000),
    [dbd_dbr_concept_id_master] bigint(8)
);

CREATE TABLE [DrugBrandDuplicateMedicationRemovalBackup] (
    [dbr_id] int NOT NULL PRIMARY KEY,
    [dbr_description] nvarchar(510),
    [dbr_concept_id] bigint(8),
    [dbr_available] bit,
    [dbr_custom] bit
);

CREATE TABLE [DrugBrandPatchHistory] (
    [dbr_id] int NOT NULL PRIMARY KEY,
    [dbr_description] nvarchar(4000),
    [dbr_concept_id] bigint(8),
    [dbr_available] bit,
    [dbr_custom] bit,
    [dbr_mdd_id] int NOT NULL,
    [dbr_pns_id] int NOT NULL PRIMARY KEY,
    [dbr_identifier] uniqueidentifier
);

CREATE TABLE [DrugBrandVersionHistory] (
    [dbr_id] int NOT NULL PRIMARY KEY,
    [dbr_description] nvarchar(4000),
    [dbr_concept_id] bigint(8),
    [dbr_available] bit,
    [dbr_custom] bit,
    [dbr_identifier] uniqueidentifier,
    [dbr_mdd_id] int,
    [PackageVersion] int NOT NULL PRIMARY KEY
);

CREATE TABLE [drugcategory] (
    [dca_id] int NOT NULL PRIMARY KEY,
    [dca_desclong] nvarchar(510),
    [dca_descshort] nvarchar(510),
    [dca_order] int
);

CREATE TABLE [drugclass] (
    [dcl_id] int NOT NULL PRIMARY KEY,
    [dcl_desclong] nvarchar(510),
    [dcl_descshort] nvarchar(510),
    [dcl_dca_id] int NOT NULL,
    [dcl_order] int
);

CREATE TABLE [drugcontainer] (
    [drv_id] int NOT NULL PRIMARY KEY,
    [drv_description] nvarchar(510),
    [drv_mdd_id] int
);

CREATE TABLE [drugcourse] (
    [dco_id] int NOT NULL PRIMARY KEY,
    [dco_taperingcourse] bit NOT NULL,
    [dco_totaldurationintervalnumber] int,
    [dco_totaldurationcontextflag] int,
    [dco_coursedescription] varchar(255)
);

CREATE TABLE [drugcourseitem] (
    [dci_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DrugDatabase] (
    [ddb_id] int NOT NULL PRIMARY KEY,
    [ddb_description] nvarchar(510) NOT NULL
);

CREATE TABLE [drugdose] (
    [dos_id] int NOT NULL PRIMARY KEY,
    [dos_code] varchar(255),
    [dos_desc] nvarchar(510),
    [dos_order] int NOT NULL,
    [dos_flexible] bit,
    [dos_descex] nvarchar(510),
    [dos_ddt_id] int,
    [dos_numericvalue] float(8),
    [dos_textvalue] nvarchar(510)
);

CREATE TABLE [drugdoseunit] (
    [ddt_id] int NOT NULL PRIMARY KEY,
    [ddt_description] nvarchar(510),
    [ddt_descriptionextended] nvarchar(510),
    [ddt_singular] nvarchar(510)
);

CREATE TABLE [drugduration] (
    [ddu_id] int NOT NULL PRIMARY KEY,
    [ddu_code] varchar(255) NOT NULL,
    [ddu_desc] nvarchar(510),
    [ddu_order] int NOT NULL,
    [ddu_intervalno] int,
    [ddu_promotedstatus] int,
    [ddu_ddc_id] int,
    [ddu_intervaltype] varchar(2),
    [ddu_descex] nvarchar(510)
);

CREATE TABLE [DrugDurationContext] (
    [ddc_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [drugfamily] (
    [dfy_id] int NOT NULL PRIMARY KEY,
    [dfy_desclong] nvarchar(510),
    [dfy_descshort] nvarchar(510),
    [dfy_dcl_id] int,
    [dfy_order] int
);

CREATE TABLE [drugform] (
    [dfm_id] int NOT NULL PRIMARY KEY,
    [dfm_description] nvarchar(510),
    [dfm_ddt_id] int,
    [dfm_concept_id] bigint(8),
    [dfm_mdd_id] int
);

CREATE TABLE [drugfrequency] (
    [dfr_id] int NOT NULL PRIMARY KEY,
    [dfr_code] varchar(255) NOT NULL,
    [dfr_desc] nvarchar(510),
    [dfr_order] int NOT NULL,
    [dfr_descex] nvarchar(510),
    [dfr_promotedstatus] int,
    [dfr_dfc_id] int
);

CREATE TABLE [DrugFrequencyContext] (
    [dfc_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DrugMigration] (
    [MedisoftID] int,
    [MedisoftIDOld] uniqueidentifier NOT NULL PRIMARY KEY,
    [MedisoftDrug] nvarchar(510),
    [DMDBrand] nvarchar(510),
    [MedisoftBrandId] bigint(8),
    [exactBrand] int,
    [DMDMoiety] nvarchar(510),
    [MedisoftMoietyId] bigint(8),
    [exactMoiety] int,
    [VMP] nvarchar(510),
    [MedisoftVPid] bigint(8),
    [exactVMP] int,
    [AMP] nvarchar(510),
    [MedisoftApid] bigint(8),
    [exactAMP] int,
    [dru_dcl_id] uniqueidentifier,
    [mcn_id] int,
    [RowNumber] int NOT NULL PRIMARY KEY,
    [DateMigrated] datetime,
    [MigrationSource] varchar(1000),
    [Autofixed] int NOT NULL
);

CREATE TABLE [DrugMigrationFinal] (
    [MedisoftID] int,
    [MedisoftIDOld] uniqueidentifier,
    [MedisoftDrug] nvarchar(510),
    [DMDBrand] varchar(255),
    [MedisoftBrandId] bigint(8),
    [exactBrand] int,
    [DMDMoiety] varchar(255),
    [MedisoftMoietyId] bigint(8),
    [exactMoiety] int,
    [VMP] nvarchar(510),
    [MedisoftVPid] bigint(8),
    [exactVMP] int,
    [AMP] nvarchar(510),
    [MedisoftApid] int,
    [exactAMP] int
);

CREATE TABLE [DrugMigrationNewDrugStaging] (
    [ID] uniqueidentifier NOT NULL PRIMARY KEY,
    [Bug ID] float(8),
    [Desc] nvarchar(510),
    [Version] nvarchar(4000),
    [Dru_desc] nvarchar(510),
    [VTM] nvarchar(510),
    [VTMID] nvarchar(510),
    [dmy_id] int,
    [VP] nvarchar(510),
    [VPID] nvarchar(510),
    [dvp_id] int,
    [AP] nvarchar(510),
    [APID] nvarchar(510),
    [dap_id] int,
    [mcn_key] varchar(100),
    [DateMigrated] datetime NOT NULL,
    [Duplicate] bit NOT NULL,
    [Validated] bit NOT NULL,
    [Autofixed] bit NOT NULL,
    [DMDBrand] nvarchar(510),
    [MedisoftBrandId] int,
    [MedisoftID] int,
    [exactVMP] int,
    [exactAMP] int,
    [MedisoftIDOld] varchar(100),
    [MigrationSource] varchar(1000)
);

CREATE TABLE [drugmoiety] (
    [dmy_id] int NOT NULL PRIMARY KEY,
    [dmy_description] nvarchar(4000),
    [dmy_dmd_id] bigint(8),
    [dmy_invalid] bit,
    [dmy_descriptionshort] nvarchar(4000),
    [dmy_mdd_id] int
);

CREATE TABLE [DrugMoietyDuplicate] (
    [dmd_id] int NOT NULL PRIMARY KEY,
    [dmd_dmy_id_duplicate] int,
    [dmd_dmy_description_duplicate] nvarchar(8000),
    [dmd_dmy_dmd_id_duplicate] bigint(8),
    [dmd_dmy_id_master] int,
    [dmd_dmy_description_master] nvarchar(8000),
    [dmd_dmy_dmd_id_master] bigint(8)
);

CREATE TABLE [DrugMoietyDuplicateMedicationRemovalBackup] (
    [dmy_id] int NOT NULL PRIMARY KEY,
    [dmy_description] nvarchar(4000),
    [dmy_dmd_id] bigint(8),
    [dmy_invalid] bit,
    [dmy_descriptionshort] nvarchar(510)
);

CREATE TABLE [DrugMoietyPatchHistory] (
    [dmy_id] int NOT NULL PRIMARY KEY,
    [dmy_description] nvarchar(4000),
    [dmy_dmd_id] bigint(8),
    [dmy_invalid] bit,
    [dmy_descriptionshort] nvarchar(4000),
    [dmy_mdd_id] int NOT NULL,
    [dmy_pns_id] int NOT NULL PRIMARY KEY,
    [dmy_identifier] uniqueidentifier
);

CREATE TABLE [DrugMoietyVersionHistory] (
    [dmy_id] int NOT NULL PRIMARY KEY,
    [dmy_description] nvarchar(4000),
    [dmy_descriptionshort] nvarchar(4000),
    [dmy_dmd_id] bigint(8),
    [dmy_invalid] bit,
    [dmy_identifier] uniqueidentifier,
    [dmy_mdd_id] int,
    [PackageVersion] int NOT NULL PRIMARY KEY
);

CREATE TABLE [drugroute] (
    [dro_id] int NOT NULL PRIMARY KEY,
    [dro_code] varchar(255) NOT NULL,
    [dro_desc] nvarchar(510),
    [dro_order] int NOT NULL,
    [dro_flexible] bit,
    [dro_descex] nvarchar(510),
    [dro_desclong] nvarchar(510),
    [dro_contextflag] int,
    [dro_dmd_id] bigint(8),
    [dro_mdd_id] int
);

CREATE TABLE [drugset] (
    [drs_id] int NOT NULL PRIMARY KEY,
    [drs_code] varchar(255),
    [drs_desc] nvarchar(510),
    [drs_abbreviation] nvarchar(100),
    [drs_minimumrequirement] int,
    [drs_available] bit
);

CREATE TABLE [drugsetcategory] (
    [dsc_id] int NOT NULL PRIMARY KEY,
    [dsc_description] nvarchar(510),
    [dsc_contextflag] int NOT NULL
);

CREATE TABLE [drugsetdruglink] (
    [ddl_id] int NOT NULL PRIMARY KEY,
    [ddl_dru_source] int,
    [ddl_dro_DrugRouteId] int
);

CREATE TABLE [DrugsetDrugLinkDuplicateMedicationRemovalBackup] (
    [ddl_id] int NOT NULL PRIMARY KEY,
    [ddl_mcn_id] int NOT NULL,
    [ddl_drs_id] int NOT NULL,
    [ddl_order] int,
    [ddl_available] bit NOT NULL,
    [ddl_dru_source] int,
    [ddl_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [drugsetdruglinkstatic] (
    [dsm_id] int NOT NULL PRIMARY KEY,
    [dsm_mcn_id] int,
    [dsm_drs_id] int NOT NULL,
    [dsm_order] int,
    [dsm_available] bit NOT NULL,
    [dsm_dru_source] int,
    [dsm_mcn_key] varchar(255)
);

CREATE TABLE [DrugsetDrugLinkStaticDuplicateMedicationRemovalBackup] (
    [dsm_id] int NOT NULL PRIMARY KEY,
    [dsm_mcn_id] int,
    [dsm_drs_id] int NOT NULL,
    [dsm_order] int,
    [dsm_available] bit NOT NULL,
    [dsm_dru_source] int,
    [dsm_mcn_key] varchar(255),
    [dsm_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [drugsetdrugsetcategorylink] (
    [drl_id] int NOT NULL PRIMARY KEY,
    [drl_drs_id] int NOT NULL,
    [drl_dsc_id] int NOT NULL
);

CREATE TABLE [drugstandardorder] (
    [dso_id] int NOT NULL PRIMARY KEY,
    [dso_mcn_id] int,
    [dso_dro_id] int,
    [dso_dco_id] int,
    [dso_order] int,
    [dso_additionalNotes] nvarchar(500)
);

CREATE TABLE [DrugStandardOrderDuplicateMedicationRemovalBackup] (
    [dso_id] int NOT NULL PRIMARY KEY,
    [dso_mcn_id] int,
    [dso_dro_id] int,
    [dso_dco_id] int,
    [dso_order] int,
    [dso_additionalNotes] nvarchar(500),
    [dso_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [DrugStrengthUnit] (
    [dsu_AntimetaboliteProcedureId] int NOT NULL PRIMARY KEY,
    [dsu_DrugUnitOfMeasureId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [drugtyperouteset] (
    [dtr_id] int NOT NULL PRIMARY KEY,
    [dtr_lks_id] int NOT NULL,
    [dtr_dro_id] int NOT NULL,
    [dtr_drs_id] int NOT NULL,
    [dtr_pro_code] varchar(4)
);

CREATE TABLE [drugunit] (
    [drn_id] int NOT NULL PRIMARY KEY,
    [drn_code] varchar(255) NOT NULL,
    [drn_description] nvarchar(510),
    [drn_order] int NOT NULL
);

CREATE TABLE [DrugUnitOfMeasure] (
    [dum_Id] int NOT NULL PRIMARY KEY,
    [dum_Description] nvarchar(40)
);

CREATE TABLE [drugvirtualproduct] (
    [dvp_id] int NOT NULL PRIMARY KEY,
    [dvp_strength] nvarchar(510),
    [dvp_strengthandform] nvarchar(510),
    [dvp_dfm_id] int,
    [dvp_preservativefree] bit NOT NULL,
    [dvp_modifiedrelease] bit NOT NULL,
    [dvp_description] nvarchar(4000),
    [dvp_descriptionshort] nvarchar(4000),
    [dvp_dcl_id] int,
    [dvp_vmpid] bigint(8),
    [dvp_available] bit,
    [dvp_prescribable] bit,
    [dvp_sugarfree] bit,
    [dvp_cfcfree] bit,
    [dvp_drv_id] int,
    [dvp_atc] nvarchar(510),
    [dvp_invalid] bit NOT NULL,
    [dvp_mdd_id] int
);

CREATE TABLE [DrugVirtualProductDuplicate] (
    [dvd_id] int NOT NULL PRIMARY KEY,
    [dvd_dvp_id_duplicate] int,
    [dvd_dvp_description_duplicate] nvarchar(8000),
    [dvd_dvp_vmpid_duplicate] bigint(8),
    [dvd_dvp_id_master] int,
    [dvd_dvp_description_master] nvarchar(8000),
    [dvd_dvp_vmpid_master] bigint(8)
);

CREATE TABLE [DrugVirtualProductDuplicateMedicationRemovalBackup] (
    [dvp_id] int NOT NULL PRIMARY KEY,
    [dvp_dmy_id] int,
    [dvp_strength] nvarchar(510),
    [dvp_strengthandform] nvarchar(510),
    [dvp_dfm_id] int,
    [dvp_preservativefree] bit NOT NULL,
    [dvp_modifiedrelease] bit NOT NULL,
    [dvp_description] nvarchar(510),
    [dvp_descriptionshort] nvarchar(510),
    [dvp_descriptionshortforsearch] nvarchar(510),
    [dvp_dcl_id] int,
    [dvp_vmpid] bigint(8),
    [dvp_available] bit,
    [dvp_prescribable] bit,
    [dvp_sugarfree] bit,
    [dvp_cfcfree] bit,
    [dvp_drv_id] int,
    [dvp_atc] nvarchar(510),
    [dvp_invalid] bit NOT NULL
);

CREATE TABLE [drugvirtualproductduration] (
    [vpd_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DrugVirtualProductDurationDuplicateMedicationRemovalBackup] (
    [vpd_id] int NOT NULL PRIMARY KEY,
    [vpd_dvp_id] int NOT NULL,
    [vpd_ddu_id] int NOT NULL
);

CREATE TABLE [DrugVirtualProductPatchHistory] (
    [dvp_id] int NOT NULL PRIMARY KEY,
    [dvp_dmy_id] int,
    [dvp_strength] nvarchar(510),
    [dvp_strengthandform] nvarchar(510),
    [dvp_dfm_id] int,
    [dvp_preservativefree] bit NOT NULL,
    [dvp_modifiedrelease] bit NOT NULL,
    [dvp_description] nvarchar(4000),
    [dvp_descriptionshort] nvarchar(4000),
    [dvp_descriptionshortforsearch] nvarchar(4000),
    [dvp_dcl_id] int,
    [dvp_vmpid] bigint(8),
    [dvp_available] bit,
    [dvp_prescribable] bit,
    [dvp_sugarfree] bit,
    [dvp_cfcfree] bit,
    [dvp_drv_id] int,
    [dvp_atc] nvarchar(510),
    [dvp_invalid] bit NOT NULL,
    [dvp_mdd_id] int NOT NULL,
    [dvp_pns_id] int NOT NULL PRIMARY KEY,
    [dvp_identifier] uniqueidentifier
);

CREATE TABLE [drugvirtualproductroute] (
    [vpr_id] int NOT NULL PRIMARY KEY,
    [vpr_mdd_id] int
);

CREATE TABLE [DrugVirtualProductRouteDuplicateMedicationRemovalBackup] (
    [vpr_id] int NOT NULL PRIMARY KEY,
    [vpr_dvp_id] int NOT NULL,
    [vpr_dro_id] int NOT NULL,
    [vpr_mdd_id] int
);

CREATE TABLE [DrugVirtualProductRoutePatchHistory] (
    [vpr_id] int NOT NULL PRIMARY KEY,
    [vpr_dvp_id] int NOT NULL,
    [vpr_dro_id] int NOT NULL,
    [vpr_mdd_id] int NOT NULL,
    [vpr_pns_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DrugVirtualProductRouteVersionHistory] (
    [vpr_id] int NOT NULL PRIMARY KEY,
    [vpr_dvp_id] int NOT NULL,
    [vpr_dro_id] int NOT NULL,
    [vpr_mdd_id] int,
    [PackageVersion] int NOT NULL PRIMARY KEY,
    [ActionType] char(1)
);

CREATE TABLE [DrugVirtualProductVersionHistory] (
    [dvp_id] int NOT NULL PRIMARY KEY,
    [dvp_dmy_id] int,
    [dvp_strength] nvarchar(510),
    [dvp_strengthandform] nvarchar(510),
    [dvp_dfm_id] int,
    [dvp_preservativefree] bit NOT NULL,
    [dvp_modifiedrelease] bit NOT NULL,
    [dvp_description] nvarchar(4000),
    [dvp_descriptionshort] nvarchar(4000),
    [dvp_descriptionshortforsearch] nvarchar(4000),
    [dvp_dcl_id] int,
    [dvp_vmpid] bigint(8),
    [dvp_available] bit,
    [dvp_prescribable] bit,
    [dvp_sugarfree] bit,
    [dvp_cfcfree] bit,
    [dvp_drv_id] int,
    [dvp_atc] nvarchar(510),
    [dvp_invalid] bit NOT NULL,
    [dvp_mdd_id] int,
    [dvp_identifier] uniqueidentifier,
    [PackageVersion] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DuctionOptions] (
    [DuctionValue] float(8) NOT NULL,
    [DuctionDescription] nvarchar(8) NOT NULL,
    [DuctionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [DuplicateLastPathWaystoUpdateBackup_20240201_1551] (
    [ppv_id] int NOT NULL,
    [ppv_pcs_id] int NOT NULL,
    [ppv_startDate] datetime,
    [ppv_versionEffectiveDate] datetime2 NOT NULL,
    [ppv_use_id_editedBy] uniqueidentifier NOT NULL,
    [ppv_ect_id_editedFrom] uniqueidentifier,
    [ppv_ect_id_relatedWith] uniqueidentifier
);

CREATE TABLE [DuplicateLastPathWaystoUpdateBackup_20240226_1705] (
    [ppv_id] int NOT NULL,
    [ppv_pcs_id] int NOT NULL,
    [ppv_startDate] datetime,
    [ppv_versionEffectiveDate] datetime2 NOT NULL,
    [ppv_use_id_editedBy] uniqueidentifier NOT NULL,
    [ppv_ect_id_editedFrom] uniqueidentifier,
    [ppv_ect_id_relatedWith] uniqueidentifier
);

CREATE TABLE [DuplicateLastPathWaystoUpdateBackup_20240509_1249] (
    [ppv_id] int NOT NULL,
    [ppv_pcs_id] int NOT NULL,
    [ppv_startDate] datetime,
    [ppv_versionEffectiveDate] datetime2 NOT NULL,
    [ppv_use_id_editedBy] uniqueidentifier NOT NULL,
    [ppv_ect_id_editedFrom] uniqueidentifier,
    [ppv_ect_id_relatedWith] uniqueidentifier
);

CREATE TABLE [DuplicateLastPathWaystoUpdateBackup_20240610_1053] (
    [ppv_id] int NOT NULL,
    [ppv_pcs_id] int NOT NULL,
    [ppv_startDate] datetime,
    [ppv_versionEffectiveDate] datetime2 NOT NULL,
    [ppv_use_id_editedBy] uniqueidentifier NOT NULL,
    [ppv_ect_id_editedFrom] uniqueidentifier,
    [ppv_ect_id_relatedWith] uniqueidentifier
);

CREATE TABLE [DuplicateLastPathWaystoUpdateBackup_20240923_1204] (
    [ppv_id] int NOT NULL,
    [ppv_pcs_id] int NOT NULL,
    [ppv_startDate] datetime,
    [ppv_versionEffectiveDate] datetime2 NOT NULL,
    [ppv_use_id_editedBy] uniqueidentifier NOT NULL,
    [ppv_ect_id_editedFrom] uniqueidentifier,
    [ppv_ect_id_relatedWith] uniqueidentifier
);

CREATE TABLE [DuplicateLastPathWaystoUpdateBackup_20240923_1711] (
    [ppv_id] int NOT NULL,
    [ppv_pcs_id] int NOT NULL,
    [ppv_startDate] datetime,
    [ppv_versionEffectiveDate] datetime2 NOT NULL,
    [ppv_use_id_editedBy] uniqueidentifier NOT NULL,
    [ppv_ect_id_editedFrom] uniqueidentifier,
    [ppv_ect_id_relatedWith] uniqueidentifier
);

CREATE TABLE [DurationUnit] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [EkActivity] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [EkActivityLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [EKCornealSurgery] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EKCornealSurgeryLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [EkOther] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [Comments] nvarchar(4000)
);

CREATE TABLE [EkOtherDetails] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EkOtherDetailsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [EkOtherLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Comments] nvarchar(4000)
);

CREATE TABLE [EkSurgicalCompletion] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [SutureNumber] int,
    [Number] int NOT NULL,
    [MaterialId] int,
    [SutureMaterialId] int
);

CREATE TABLE [EkSurgicalCompletionLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [SutureNumber] int,
    [Number] int NOT NULL,
    [MaterialId] int,
    [SutureMaterialId] int
);

CREATE TABLE [EmploymentStatus] (
    [pes_pss_id] int NOT NULL PRIMARY KEY,
    [pes_lks_employment_status] int NOT NULL,
    [pes_occupation] nvarchar(500),
    [pes_comments] nvarchar(MAX)
);

CREATE TABLE [EmrReport] (
    [fer_ect_EncounterId] uniqueidentifier NOT NULL PRIMARY KEY,
    [fer_bod_BodyPartId] int NOT NULL,
    [fer_StudyInstanceUid] nvarchar(510) NOT NULL,
    [fer_SeriesInstanceUid] nvarchar(510) NOT NULL,
    [fer_SopInstanceUid] nvarchar(510) NOT NULL,
    [fer_AccessionNumber] nvarchar(510) NOT NULL,
    [fer_Manufacturer] nvarchar(510) NOT NULL,
    [fer_ManufacturerModelName] nvarchar(510),
    [fer_InstanceNumber] nvarchar(510) NOT NULL,
    [fer_ContentDate] datetime NOT NULL,
    [fer_DocumentTitle] nvarchar(510),
    [fer_Angle] decimal(18, 2),
    [fer_Modality] nvarchar(20) NOT NULL,
    [fer_StudyDate] datetime NOT NULL,
    [fer_AcquisitionDate] datetime
);

CREATE TABLE [Encounter] (
    [bec_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [encounter] (
    [ect_id] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [Encounter] (
    [EncounterId] uniqueidentifier NOT NULL PRIMARY KEY,
    [cpe_Id] int NOT NULL PRIMARY KEY,
    [bse_Id] int NOT NULL PRIMARY KEY,
    [eae_Id] int NOT NULL PRIMARY KEY,
    [ufe_ect_EncounterId] uniqueidentifier NOT NULL PRIMARY KEY,
    [cpe_ect_EncounterId] uniqueidentifier NOT NULL,
    [dna_ect_EncounterId] uniqueidentifier NOT NULL PRIMARY KEY,
    [dna_lks_EpisodeTypeId] int NOT NULL,
    [cpe_cat_AssessmentTypeId] int,
    [IsDeleted] bit NOT NULL,
    [ufe_lkt_ReasonTypeId] int NOT NULL,
    [ufe_Comments] nvarchar(4000),
    [bse_IsDeleted] bit NOT NULL,
    [dna_lks_ReasonId] int NOT NULL,
    [bec_csc_ClinicId] int,
    [bec_lks_NewFollowUpAppointmentType] int,
    [dna_clt_ClinicId] int,
    [bse_pat_PatientId] uniqueidentifier NOT NULL,
    [bse_PatientNumber] nvarchar(510) NOT NULL,
    [bse_VisitDate] date(3) NOT NULL,
    [bse_use_ResponsibleUserId] uniqueidentifier
);

CREATE TABLE [encounter] (
    [ect_mode] int NOT NULL
);

CREATE TABLE [Encounter] (
    [bse_BillingReference] nvarchar(60),
    [bse_CaseNumber] nvarchar(60)
);

CREATE TABLE [encounter] (
    [ect_private] bit
);

CREATE TABLE [Encounter] (
    [bse_VisitClass] nvarchar(60),
    [bse_VisitCategory] nvarchar(100)
);

CREATE TABLE [encounter] (
    [ect_lks_id_visitreason] int,
    [ect_interpreter] bit
);

CREATE TABLE [Encounter] (
    [bse_Service] nvarchar(100),
    [bse_Location] nvarchar(100)
);

CREATE TABLE [encounter] (
    [ect_lks_id_language] int,
    [ect_lks_id_transport] int
);

CREATE TABLE [Encounter] (
    [bse_cpw_CarePathwayId] int NOT NULL,
    [bse_ppw_PatientCarePathwayId] int NOT NULL,
    [bse_DateEncounterSaved] datetime2 NOT NULL,
    [bse_EventDate] datetime2
);

CREATE TABLE [encounter] (
    [ect_visittype] int,
    [ect_remotelocationid] uniqueidentifier
);

CREATE TABLE [Encounter] (
    [bse_LocationSegment] nvarchar(100),
    [bse_OutcomeCode] nvarchar(20)
);

CREATE TABLE [encounter] (
    [ect_remotelocation] varchar(255)
);

CREATE TABLE [Encounter] (
    [bse_ReferralToTreatmentCode] nvarchar(20),
    [bse_csc_ClinicId] int
);

CREATE TABLE [encounter] (
    [ect_lks_id_communicationtype] int,
    [ect_plannedoperation] int
);

CREATE TABLE [Encounter] (
    [bse_ClinicVisitNumber] nvarchar(40),
    [bse_ClinicLocationHospital] nvarchar(510)
);

CREATE TABLE [encounter] (
    [ect_operation] uniqueidentifier
);

CREATE TABLE [Encounter] (
    [bse_ClinicArrivalDate] datetime2,
    [bse_PatientNationalNumber] nvarchar(510),
    [bse_ExternalAppointmentId] nvarchar(510)
);

CREATE TABLE [encounter] (
    [ect_pdh_id] int,
    [ect_HasApplicableBillingReference] bit,
    [ect_brf_BillingReferenceId] int,
    [ect_EncounterTime] time(4)
);

CREATE TABLE [encounteractivitytypes] (
    [etx_id] int NOT NULL PRIMARY KEY,
    [etx_mandatory] bit
);

CREATE TABLE [encountercomment] (
    [cmt_id] int NOT NULL PRIMARY KEY,
    [cmt_comment] nvarchar(MAX)
);

CREATE TABLE [encountercommentlog] (
    [cmt_ObjectId] int NOT NULL,
    [cmt_id] int NOT NULL PRIMARY KEY,
    [cmt_ect_id] uniqueidentifier NOT NULL,
    [cmt_comment] nvarchar(MAX),
    [cmt_cty_id] int,
    [cmt_DateAdded] datetime NOT NULL,
    [cmt_AddedBy] uniqueidentifier NOT NULL,
    [cmt_TransactionId] uniqueidentifier NOT NULL,
    [cmt_Action] char(1) NOT NULL
);

CREATE TABLE [EncounterCompletionState] (
    [bes_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EncounterCompletionStateLog] (
    [bes_Id] int NOT NULL PRIMARY KEY,
    [bes_ObjectId] int NOT NULL,
    [bes_DateAdded] datetime NOT NULL,
    [bes_AddedBy] uniqueidentifier NOT NULL,
    [bes_Transactionid] uniqueidentifier NOT NULL,
    [bes_Action] char(1) NOT NULL,
    [bes_ect_EncounterId] uniqueidentifier NOT NULL,
    [bes_Completed] bit NOT NULL,
    [bes_DateTimeUpdated] datetime2 NOT NULL
);

CREATE TABLE [EncounterConsultationReview] (
    [erv_ect_EncounterIdToReview] uniqueidentifier NOT NULL PRIMARY KEY,
    [erv_ApprovedDateTime] datetime,
    [erv_use_SeenByUserId] uniqueidentifier NOT NULL,
    [erv_use_ReviewerUserGroupId] uniqueidentifier,
    [erv_use_ApprovedByUserId] uniqueidentifier,
    [erv_IsDeleted] bit
);

CREATE TABLE [EncounterConsultationReviewLog] (
    [erv_ObjectId] uniqueidentifier,
    [erv_ect_EditedEncounterId] uniqueidentifier,
    [erv_use_ReviewerUserId] uniqueidentifier,
    [erv_Approved] bit NOT NULL,
    [erv_ApprovedDateTime] datetime,
    [erv_DateAdded] datetime NOT NULL,
    [erv_AddedBy] uniqueidentifier NOT NULL,
    [erv_TransactionId] uniqueidentifier NOT NULL,
    [erv_Action] char(1) NOT NULL,
    [erv_use_SeenByUserId] uniqueidentifier,
    [erv_ect_EncounterIdToReview] int NOT NULL PRIMARY KEY,
    [erv_use_ReviewerUserGroupId] uniqueidentifier,
    [erv_use_ApprovedByUserId] uniqueidentifier,
    [erv_IsDeleted] bit
);

CREATE TABLE [encounterdocumentlink] (
    [den_id] int NOT NULL PRIMARY KEY,
    [den_ppr_PatientClinicalPlanRootId] int
);

CREATE TABLE [encounterdocumentlinklog] (
    [den_objectId] int NOT NULL,
    [den_id] int NOT NULL PRIMARY KEY,
    [den_ect_id] uniqueidentifier,
    [den_doc_id] uniqueidentifier,
    [den_flag] int,
    [den_dateadded] datetime NOT NULL,
    [den_addedby] uniqueidentifier NOT NULL,
    [den_transactionid] uniqueidentifier NOT NULL,
    [den_action] char(1) NOT NULL,
    [den_ppr_PatientClinicalPlanRootId] int
);

CREATE TABLE [encounterdocumenttypes] (
    [edt_id] int NOT NULL PRIMARY KEY,
    [edt_dtp_id] int,
    [edt_ety_id] int
);

CREATE TABLE [EncounterExtractState] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EncounterForReview] (
    [EncounterId] uniqueidentifier NOT NULL PRIMARY KEY,
    [AssessmentTypeId] int
);

CREATE TABLE [EncounterForReviewLog] (
    [EncounterId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [AssessmentTypeId] int
);

CREATE TABLE [EncounterGradingResult] (
    [res_Id] uniqueidentifier NOT NULL PRIMARY KEY,
    [res_State] int NOT NULL,
    [res_RightEyeDiagnosticsComments] varchar(256),
    [res_LeftEyeDiagnosticsComments] varchar(256)
);

CREATE TABLE [EncounterGradingResultLog] (
    [res_Id] int NOT NULL,
    [res_ObjectId] uniqueidentifier NOT NULL,
    [res_DateAdded] datetime NOT NULL,
    [res_AddedBy] uniqueidentifier NOT NULL,
    [res_Transactionid] uniqueidentifier NOT NULL,
    [res_Action] char(1) NOT NULL,
    [res_ect_EncounterId] uniqueidentifier,
    [res_State] int NOT NULL,
    [res_RightEyeDiagnosticsComments] varchar(256),
    [res_LeftEyeDiagnosticsComments] varchar(256)
);

CREATE TABLE [EncounterIdentifier] (
    [eid_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EncounterIdentifierType] (
    [eit_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EncounterLink] (
    [bel_AssociatedEncounterId] uniqueidentifier NOT NULL PRIMARY KEY,
    [bel_BillingEncounterId] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [encounterlistitem] (
    [eli_id] int NOT NULL PRIMARY KEY,
    [eli_displayset] int
);

CREATE TABLE [encounterlistitemlog] (
    [eli_ObjectId] int NOT NULL,
    [eli_id] int NOT NULL PRIMARY KEY,
    [eli_ect_id] uniqueidentifier NOT NULL,
    [eli_lks_id] int NOT NULL,
    [eli_status] int NOT NULL,
    [eli_displayset] int,
    [eli_DateAdded] datetime NOT NULL,
    [eli_AddedBy] uniqueidentifier NOT NULL,
    [eli_TransactionId] uniqueidentifier NOT NULL,
    [eli_Action] char(1) NOT NULL
);

CREATE TABLE [encounterlocationtypes] (
    [lte_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EncounterLog] (
    [ufe_ect_EncounterId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [encounterlog] (
    [ect_ObjectId] uniqueidentifier NOT NULL
);

CREATE TABLE [EncounterLog] (
    [EncounterId] int NOT NULL PRIMARY KEY,
    [eae_Id] int NOT NULL PRIMARY KEY,
    [eae_ObjectId] int NOT NULL,
    [EncounterForReviewId] uniqueidentifier NOT NULL
);

CREATE TABLE [encounterlog] (
    [ect_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EncounterLog] (
    [ufe_lkt_ReasonTypeId] int NOT NULL,
    [ufe_Comments] nvarchar(4000)
);

CREATE TABLE [encounterlog] (
    [ect_pat_id] uniqueidentifier
);

CREATE TABLE [EncounterLog] (
    [ObjectId] uniqueidentifier NOT NULL,
    [eae_DateAdded] datetime NOT NULL,
    [eae_AddedBy] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL
);

CREATE TABLE [encounterlog] (
    [ect_loc_id] uniqueidentifier,
    [ect_date] datetime
);

CREATE TABLE [EncounterLog] (
    [AddedBy] uniqueidentifier NOT NULL,
    [ufe_DateAdded] datetime NOT NULL,
    [eae_Transactionid] uniqueidentifier NOT NULL,
    [eae_Action] char(1) NOT NULL,
    [ufe_AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL
);

CREATE TABLE [encounterlog] (
    [ect_daterecorded] datetime,
    [ect_datesaved] datetime
);

CREATE TABLE [EncounterLog] (
    [Action] char(1) NOT NULL,
    [ufe_TransactionId] uniqueidentifier NOT NULL,
    [eae_ect_EncounterId] uniqueidentifier NOT NULL,
    [eae_ApplyPreviousFindings] bit NOT NULL,
    [ufe_Action] char(1) NOT NULL,
    [IsDeleted] bit NOT NULL
);

CREATE TABLE [encounterlog] (
    [ect_ety_id] int,
    [ect_mode] int NOT NULL,
    [ect_csc_id] int,
    [ect_private] bit,
    [ect_status] int,
    [ect_lks_id_visitreason] int,
    [ect_interpreter] bit,
    [ect_lks_id_language] int,
    [ect_lks_id_transport] int,
    [ect_title] nvarchar(400),
    [ect_visittype] int,
    [ect_remotelocationid] uniqueidentifier,
    [ect_remotelocation] varchar(255),
    [ect_readonly] bit,
    [ect_DateAdded] datetime NOT NULL,
    [ect_AddedBy] uniqueidentifier NOT NULL,
    [ect_TransactionId] uniqueidentifier NOT NULL,
    [ect_Action] char(1) NOT NULL,
    [ect_lks_id_communicationtype] int,
    [ect_plannedoperation] int,
    [ect_operation] uniqueidentifier,
    [ect_containsprescription] bit,
    [ect_datedeleted] datetime,
    [ect_isdeleted] bit,
    [ect_use_id_lastsaved] uniqueidentifier,
    [ect_pdh_id] int,
    [ect_lastsavedsource] int,
    [ect_skiplettergeneration] bit,
    [ect_ity_InterfaceTypeId_CreatedBy] int,
    [ect_etv_EncounterTemplateVersionId] int,
    [ect_HasApplicableBillingReference] bit,
    [ect_brf_BillingReferenceId] int,
    [ect_EncounterTime] time(4)
);

CREATE TABLE [encounteroutcome] (
    [eou_id] int NOT NULL PRIMARY KEY,
    [eou_cou_id] int NOT NULL
);

CREATE TABLE [encounterpartialsave] (
    [eps_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [eps_created_use_id] uniqueidentifier NOT NULL,
    [eps_encounterdto] nvarchar(MAX),
    [eps_encounterdate] datetime NOT NULL,
    [eps_diabetic_version] int NOT NULL,
    [eps_allergy_version] int NOT NULL,
    [eps_mrsa_version] int NOT NULL,
    [eps_smoking_version] int NOT NULL,
    [eps_drinking_version] int NOT NULL,
    [eps_medication_version] int,
    [eps_plannedvisit_version] int,
    [eps_plannedoperation_version] int,
    [eps_planneddischarge_version] int,
    [eps_problems_version] int,
    [eps_lens_left_version] int,
    [eps_lens_right_version] int,
    [eps_substance_use_version] int,
    [eps_driving_version] int,
    [eps_mobility_version] int,
    [eps_patientfamilyhistory_version] int,
    [eps_accommodation_version] int,
    [eps_social_services_version] int,
    [eps_marital_status_version] int,
    [eps_employment_status_version] int,
    [eps_social_status_comment_version] int,
    [eps_certificate_of_vision_impairment] int,
    [eps_etv_EncounterTemplateVersionId] int,
    [eps_iop_target_left_eye_version] int,
    [eps_iop_target_right_eye_version] int
);

CREATE TABLE [encounterpartialsavelinkeduser] (
    [elu_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [elu_eps_id] uniqueidentifier NOT NULL,
    [elu_use_id] uniqueidentifier NOT NULL
);

CREATE TABLE [encounterpartialsavelog] (
    [eps_ObjectId] uniqueidentifier NOT NULL,
    [eps_id] int NOT NULL PRIMARY KEY,
    [eps_ect_id] uniqueidentifier,
    [eps_pat_id] uniqueidentifier NOT NULL,
    [eps_created_use_id] uniqueidentifier NOT NULL,
    [eps_lastsaved_use_id] uniqueidentifier NOT NULL,
    [eps_ety_id] int NOT NULL,
    [eps_encounterdto] nvarchar(MAX),
    [eps_encounterdate] datetime NOT NULL,
    [eps_datecreated] datetime NOT NULL,
    [eps_datesaved] datetime NOT NULL,
    [eps_isdeleted] bit NOT NULL,
    [eps_datedeleted] datetime,
    [eps_diabetic_version] int NOT NULL,
    [eps_allergy_version] int NOT NULL,
    [eps_mrsa_version] int NOT NULL,
    [eps_smoking_version] int NOT NULL,
    [eps_drinking_version] int NOT NULL,
    [eps_medication_version] int,
    [eps_plannedvisit_version] int,
    [eps_plannedoperation_version] int,
    [eps_planneddischarge_version] int,
    [eps_problems_version] int,
    [eps_lens_left_version] int,
    [eps_lens_right_version] int,
    [eps_DateAdded] datetime NOT NULL,
    [eps_AddedBy] uniqueidentifier NOT NULL,
    [eps_TransactionId] uniqueidentifier NOT NULL,
    [eps_Action] char(1) NOT NULL,
    [eps_permanentlyexpired] bit NOT NULL,
    [eps_undeleteddate] datetime,
    [eps_substance_use_version] int,
    [eps_driving_version] int,
    [eps_mobility_version] int,
    [eps_patientfamilyhistory_version] int,
    [eps_accommodation_version] int,
    [eps_social_services_version] int,
    [eps_marital_status_version] int,
    [eps_employment_status_version] int,
    [eps_social_status_comment_version] int,
    [eps_certificate_of_vision_impairment] int,
    [eps_etv_EncounterTemplateVersionId] int,
    [eps_iop_target_left_eye_version] int,
    [eps_iop_target_right_eye_version] int
);

CREATE TABLE [encounterpersonnel] (
    [enp_id] int NOT NULL PRIMARY KEY,
    [enp_displayset] int,
    [enp_gra_id] int,
    [enp_rug_ConsultationReviewUserGroupId] uniqueidentifier,
    [enp_VirtualReviewUserGroupId] uniqueidentifier
);

CREATE TABLE [encounterpersonnel_backup] (
    [enp_id] int NOT NULL,
    [enp_ect_id] uniqueidentifier NOT NULL,
    [enp_use_id] uniqueidentifier NOT NULL,
    [enp_acp_id] int NOT NULL,
    [enp_displayset] int,
    [enp_gra_id] int
);

CREATE TABLE [encounterpersonnellog] (
    [enp_ObjectId] int NOT NULL,
    [enp_id] int NOT NULL PRIMARY KEY,
    [enp_ect_id] uniqueidentifier NOT NULL,
    [enp_use_id] uniqueidentifier,
    [enp_acp_id] int NOT NULL,
    [enp_displayset] int,
    [enp_gra_id] int,
    [enp_DateAdded] datetime NOT NULL,
    [enp_AddedBy] uniqueidentifier NOT NULL,
    [enp_TransactionId] uniqueidentifier NOT NULL,
    [enp_Action] char(1) NOT NULL,
    [enp_rug_ConsultationReviewUserGroupId] uniqueidentifier,
    [enp_VirtualReviewUserGroupId] uniqueidentifier
);

CREATE TABLE [EncounterReason] (
    [uer_Id] int NOT NULL PRIMARY KEY,
    [uer_lks_ReasonId] int NOT NULL,
    [uer_ufe_EncounterId] uniqueidentifier NOT NULL
);

CREATE TABLE [encounterrollbackhistory] (
    [erb_id] int NOT NULL PRIMARY KEY,
    [erb_dut_id] uniqueidentifier NOT NULL,
    [erb_rollbackdatetime] datetime NOT NULL,
    [erb_log] varchar(MAX) NOT NULL
);

CREATE TABLE [EncounterSectionConfiguration] (
    [dae_id] int NOT NULL PRIMARY KEY,
    [dae_ety_id] int NOT NULL,
    [dae_das_id] int NOT NULL,
    [dae_dat_id] int NOT NULL,
    [dae_Order] int
);

CREATE TABLE [EncounterSectionStatus] (
    [dat_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [encountersource] (
    [esr_id] int NOT NULL PRIMARY KEY,
    [esr_generatenotefromeventlist] bit NOT NULL
);

CREATE TABLE [encountersourcehistory] (
    [esh_id] int NOT NULL PRIMARY KEY,
    [esh_datechanged] datetime NOT NULL
);

CREATE TABLE [encounterstore] (
    [ecs_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [ecs_dut_id] uniqueidentifier NOT NULL,
    [ecs_datestored] datetime NOT NULL,
    [ecs_objecttype] int,
    [ecs_state] int,
    [ecs_ety_id] int,
    [ecs_dtoimage] varbinary(-1),
    [ecs_use_id] uniqueidentifier
);

CREATE TABLE [EncounterTemplate] (
    [aet_id] int NOT NULL PRIMARY KEY,
    [aet_Name] nvarchar(70),
    [aet_Description] nvarchar(500),
    [aet_Icon] varbinary(-1) NOT NULL,
    [aet_RequiresStudyMonitoring] bit NOT NULL
);

CREATE TABLE [EncounterTemplateActivity] (
    [sma_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [sma_ect_EncounterId] uniqueidentifier NOT NULL,
    [sma_ShowRemovedSectionWarning] bit NOT NULL,
    [sma_smr_ReviewTypeId] int
);

CREATE TABLE [EncounterTemplateActivityLog] (
    [sma_act_ActivityId] int NOT NULL PRIMARY KEY,
    [sma_ObjectId] uniqueidentifier NOT NULL,
    [sma_DateAdded] datetime NOT NULL,
    [sma_AddedBy] uniqueidentifier NOT NULL,
    [sma_Transactionid] uniqueidentifier NOT NULL,
    [sma_Action] char(1) NOT NULL,
    [sma_ect_encounterId] uniqueidentifier NOT NULL,
    [sma_Queried] bit,
    [sma_ShowRemovedSectionWarning] bit NOT NULL,
    [sma_smr_ReviewTypeId] int
);

CREATE TABLE [EncounterTemplateActivityQuery] (
    [eaq_squ_QueryId] int NOT NULL PRIMARY KEY,
    [eaq_sma_ActivityId] uniqueidentifier NOT NULL
);

CREATE TABLE [EncounterTemplateActivityVersion] (
    [eav_etv_EncounterTemplateVersionId] int NOT NULL PRIMARY KEY,
    [eav_abv_ActivityVersionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EncounterTemplateDynamicActivitySection] (
    [eds_etv_TemplateVersionId] int NOT NULL PRIMARY KEY,
    [eds_tps_ActivitySectionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EncounterTemplatePermittedActivity] (
    [eta_aet_EncounterTemplateId] int NOT NULL PRIMARY KEY,
    [eta_aba_ActivityId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EncounterTemplateQuestion] (
    [smq_Id] int NOT NULL PRIMARY KEY,
    [smq_sms_SectionId] int NOT NULL,
    [smq_qty_QuestionVersionId] int NOT NULL,
    [smq_bod_BodyPartId] int NOT NULL,
    [smq_smr_ReviewTypeId] int
);

CREATE TABLE [EncounterTemplateQuestionLog] (
    [smq_Id] int NOT NULL PRIMARY KEY,
    [smq_ObjectId] int NOT NULL,
    [smq_DateAdded] datetime NOT NULL,
    [smq_AddedBy] uniqueidentifier NOT NULL,
    [smq_Transactionid] uniqueidentifier NOT NULL,
    [smq_Action] char(1) NOT NULL,
    [smq_sms_SectionId] int NOT NULL,
    [smq_qty_QuestionVersionId] int NOT NULL,
    [smq_bod_BodyPartId] int NOT NULL,
    [smq_smr_ReviewTypeId] int
);

CREATE TABLE [EncounterTemplateQuestionQuery] (
    [aqu_squ_QueryId] int NOT NULL PRIMARY KEY,
    [aqu_smq_QuestionId] int NOT NULL
);

CREATE TABLE [EncounterTemplateSection] (
    [sms_ets_SectionId] int NOT NULL PRIMARY KEY,
    [sms_sma_ActivityId] uniqueidentifier NOT NULL
);

CREATE TABLE [EncounterTemplateSectionComment] (
    [smc_Id] int NOT NULL PRIMARY KEY,
    [smc_smr_ReviewTypeId] int
);

CREATE TABLE [EncounterTemplateSectionCommentLog] (
    [smc_Id] int NOT NULL PRIMARY KEY,
    [smc_ObjectId] int NOT NULL,
    [smc_DateAdded] datetime NOT NULL,
    [smc_AddedBy] uniqueidentifier NOT NULL,
    [smc_TransactionId] uniqueidentifier NOT NULL,
    [smc_Action] char(1) NOT NULL,
    [smc_sms_SectionId] int NOT NULL,
    [smc_bod_BodyPartId] int NOT NULL,
    [smc_smr_ReviewTypeId] int
);

CREATE TABLE [EncounterTemplateSectionCommentQuery] (
    [cqu_squ_QueryId] int NOT NULL PRIMARY KEY,
    [cqu_smc_SectionCommentId] int NOT NULL
);

CREATE TABLE [EncounterTemplateSectionLog] (
    [sms_ets_SectionId] int NOT NULL PRIMARY KEY,
    [sms_ObjectId] int NOT NULL,
    [sms_DateAdded] datetime NOT NULL,
    [sms_AddedBy] uniqueidentifier NOT NULL,
    [sms_Transactionid] uniqueidentifier NOT NULL,
    [sms_Action] char(1) NOT NULL,
    [sms_sma_ActivityId] uniqueidentifier NOT NULL
);

CREATE TABLE [EncounterTemplateSettings] (
    [etm_aet_EncounterTemplateId] int NOT NULL PRIMARY KEY,
    [etm_Enabled] bit NOT NULL,
    [etm_AutomaticUpgrades] bit NOT NULL,
    [etm_LastUpgrade] datetime,
    [etm_LatestVersionNumber] int NOT NULL,
    [etm_LatestVersionDescription] nvarchar(500) NOT NULL,
    [etm_PendingUpgradeVersionNumber] int
);

CREATE TABLE [EncounterTemplateSettingsLog] (
    [etm_aet_EncounterTemplateId] int NOT NULL PRIMARY KEY,
    [etm_Enabled] bit NOT NULL,
    [etm_AutomaticUpgrades] bit NOT NULL,
    [etm_LastUpgrade] datetime,
    [etm_ObjectId] int NOT NULL,
    [etm_DateAdded] datetime NOT NULL,
    [etm_AddedBy] uniqueidentifier NOT NULL,
    [etm_TransactionId] uniqueidentifier NOT NULL,
    [etm_Action] char(1) NOT NULL,
    [etm_LatestVersionNumber] int,
    [etm_LatestVersionDescription] nvarchar(500),
    [etm_PendingUpgradeVersionNumber] int
);

CREATE TABLE [EncounterTemplateVersion] (
    [etv_id] int NOT NULL PRIMARY KEY,
    [etv_LastModified] datetime2,
    [etv_use_LastModifiedBy] uniqueidentifier,
    [etv_Description] nvarchar(500) NOT NULL,
    [etv_RequiresStudyMonitoring] bit NOT NULL
);

CREATE TABLE [EncounterTemplateVersionLog] (
    [etv_id] int NOT NULL PRIMARY KEY,
    [etv_ObjectId] int NOT NULL,
    [etv_DateAdded] datetime NOT NULL,
    [etv_AddedBy] uniqueidentifier NOT NULL,
    [etv_TransactionId] uniqueidentifier NOT NULL,
    [etv_Action] char(1) NOT NULL,
    [etv_aet_EncounterTemplateId] int NOT NULL,
    [etv_Version] int,
    [etv_LastModified] datetime2,
    [etv_use_LastModifiedBy] uniqueidentifier,
    [etv_IsCurrentVersion] bit NOT NULL,
    [etv_Description] nvarchar(500) NOT NULL,
    [etv_RequiresStudyMonitoring] bit
);

CREATE TABLE [EncounterType] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [encountertype] (
    [ety_id] int NOT NULL PRIMARY KEY,
    [ety_code] varchar(255) NOT NULL
);

CREATE TABLE [EncounterType] (
    [EncounterTypeId] int NOT NULL,
    [SiteConfigurationId] int NOT NULL
);

CREATE TABLE [encountertype] (
    [ety_order] int,
    [ety_active] bit NOT NULL,
    [ety_optionflags] int,
    [ety_per_id] int NOT NULL,
    [ety_lockingenabled] bit NOT NULL,
    [ety_fullname] nvarchar(510) NOT NULL,
    [ety_shortname] nvarchar(510) NOT NULL,
    [ety_mandatorypathway] bit NOT NULL,
    [ety_MandatoryToken] bit NOT NULL
);

CREATE TABLE [encountertypefollowupgroup] (
    [efg_id] int NOT NULL PRIMARY KEY,
    [efg_lks_id_followupby] int NOT NULL
);

CREATE TABLE [EncounterTypeLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [EncounterTypeId] int NOT NULL,
    [SiteConfigurationId] int NOT NULL
);

CREATE TABLE [EncounterUnlock] (
    [Id] int NOT NULL PRIMARY KEY,
    [EncounterId] uniqueidentifier NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    [UnlockDateTime] datetime NOT NULL
);

CREATE TABLE [encounterversion] (
    [evr_id] int NOT NULL PRIMARY KEY,
    [evr_diabetic_version] int NOT NULL,
    [evr_allergy_version] int NOT NULL,
    [evr_mrsa_version] int NOT NULL,
    [evr_smoking_version] int NOT NULL,
    [evr_drinking_version] int NOT NULL,
    [evr_medication_version] int,
    [evr_plannedvisit_version] int,
    [evr_plannedoperation_version] int,
    [evr_planneddischarge_version] int,
    [evr_problems_version] int,
    [evr_lens_left_version] int,
    [evr_lens_right_version] int,
    [evr_substance_use_version] int,
    [evr_driving_version] int,
    [evr_mobility_version] int,
    [evr_patientfamilyhistory_version] int,
    [evr_accommodation_version] int,
    [evr_social_services_version] int,
    [evr_marital_status_version] int,
    [evr_employment_status_version] int,
    [evr_social_status_comment_version] int,
    [evr_certificate_of_vision_impairment] int,
    [evr_iop_target_left_eye_version] int,
    [evr_iop_target_right_eye_version] int
);

CREATE TABLE [Endocyclophotocoagulation] (
    [ecp_sdf_id] int NOT NULL PRIMARY KEY,
    [ecp_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ecp_MinimumPowerOfLaser] int NOT NULL,
    [ecp_PowerOfLaser] int,
    [ecp_Duration] int,
    [ecp_MaximumPowerOfLaser] int,
    [ecp_MinimumDuration] int,
    [ecp_Continuous] bit NOT NULL,
    [ecp_MaximumDuration] int,
    [ecp_Continuous] bit NOT NULL,
    [ecp_Variable] bit NOT NULL,
    [ecp_TotalEnergy] decimal(18, 2)
);

CREATE TABLE [EndocyclophotocoagulationLog] (
    [ecp_act_ActivityId] int NOT NULL PRIMARY KEY,
    [ecp_sdf_id] int NOT NULL PRIMARY KEY,
    [ecp_ObjectId] int NOT NULL,
    [ecp_ObjectId] uniqueidentifier NOT NULL,
    [ecp_DateAdded] datetime NOT NULL,
    [ecp_DateAdded] datetime NOT NULL,
    [ecp_AddedBy] uniqueidentifier NOT NULL,
    [ecp_AddedBy] uniqueidentifier NOT NULL,
    [ecp_Transactionid] uniqueidentifier NOT NULL,
    [ecp_Transactionid] uniqueidentifier NOT NULL,
    [ecp_Action] char(1) NOT NULL,
    [ecp_Action] char(1) NOT NULL,
    [ecp_MinimumPowerOfLaser] int,
    [ecp_PowerOfLaser] int,
    [ecp_Duration] int,
    [ecp_MaximumPowerOfLaser] int,
    [ecp_MinimumDuration] int,
    [ecp_Continuous] bit,
    [ecp_MaximumDuration] int,
    [ecp_Continuous] bit NOT NULL,
    [ecp_Variable] bit NOT NULL,
    [ecp_TotalEnergy] decimal(18, 2)
);

CREATE TABLE [Endpoint] (
    [Id] int NOT NULL PRIMARY KEY,
    [Endpoint] nvarchar(200),
    [MaximumRetryTicks] bigint(8) NOT NULL
);

CREATE TABLE [EpisodeDates] (
    [edt_ect_id] uniqueidentifier,
    [edt_ect_date] datetime
);

CREATE TABLE [EpisodeGUID] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [EpisodeLastModifiedBy] (
    [ect_id] uniqueidentifier,
    [ect_use_id_lastsaved] uniqueidentifier
);

CREATE TABLE [EpithelialStatus] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [erroridentifier] (
    [eri_id] int NOT NULL PRIMARY KEY,
    [eri_erl_id] int NOT NULL
);

CREATE TABLE [errorlog] (
    [erl_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ErrorLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [LogDateTime] datetime NOT NULL,
    [QueueId] int,
    [Order] int NOT NULL
);

CREATE TABLE [errorlog] (
    [erl_order] tinyint(1) NOT NULL
);

CREATE TABLE [ErrorLog] (
    [LogDateTime] datetime2 NOT NULL,
    [Message] varchar(MAX) NOT NULL,
    [ExceptionType] varchar(510) NOT NULL,
    [Message] varchar(MAX) NOT NULL
);

CREATE TABLE [errorlog] (
    [erl_message] varchar(MAX) NOT NULL,
    [erl_exceptiontype] varchar(MAX) NOT NULL
);

CREATE TABLE [ErrorLog] (
    [ExceptionType] varchar(200) NOT NULL,
    [StackTrace] varchar(MAX),
    [Source] varchar(200) NOT NULL
);

CREATE TABLE [errorlog] (
    [erl_source] varchar(MAX) NOT NULL,
    [erl_stacktrace] varchar(MAX) NOT NULL
);

CREATE TABLE [ErrorLog] (
    [StackTrace] varchar(MAX) NOT NULL
);

CREATE TABLE [errorlog] (
    [erl_traceeventtype] tinyint(1) NOT NULL,
    [erl_machinename] varchar(255),
    [erl_osarchitecture] varchar(255),
    [erl_requestqueryurl] varchar(MAX),
    [erl_requestbody] varchar(MAX),
    [erl_requesttype] varchar(100),
    [erl_ErrorSourceId] int NOT NULL,
    [erl_LogMessage] varchar(MAX)
);

CREATE TABLE [errorlogentry] (
    [err_id] int NOT NULL PRIMARY KEY,
    [err_date] datetime NOT NULL,
    [err_thread] varchar(255) NOT NULL,
    [err_level] varchar(50) NOT NULL,
    [err_logger] varchar(255) NOT NULL,
    [err_message] varchar(4000) NOT NULL,
    [err_exception] varchar(2000)
);

CREATE TABLE [ErrorLogGroup] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ErrorOutput] (
    [ErrorOutputId] int NOT NULL PRIMARY KEY,
    [Message] varchar(MAX) NOT NULL
);

CREATE TABLE [ErrorSource] (
    [Id] int NOT NULL PRIMARY KEY,
    [Name] varchar(50) NOT NULL
);

CREATE TABLE [eventlogentry] (
    [evt_id] int NOT NULL PRIMARY KEY,
    [evt_lks_id_type] int NOT NULL,
    [evt_pat_id] uniqueidentifier,
    [evt_source] varchar(50),
    [evt_data] varchar(8000),
    [evt_exception] bit
);

CREATE TABLE [EventType] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(30) NOT NULL
);

CREATE TABLE [ExaminationSiteConfiguration] (
    [dam_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ExaminationSiteConfigurationLog] (
    [dam_ObjectId] int NOT NULL,
    [dam_id] int NOT NULL PRIMARY KEY,
    [dam_dae_id] int NOT NULL,
    [dam_dax_id] int NOT NULL,
    [dam_DateAdded] datetime NOT NULL,
    [dam_AddedBy] uniqueidentifier NOT NULL,
    [dam_Transactionid] uniqueidentifier NOT NULL,
    [dam_Action] char(1) NOT NULL
);

CREATE TABLE [ExaminationSubsection] (
    [dax_id] int NOT NULL PRIMARY KEY,
    [dax_Order] int
);

CREATE TABLE [Excursion] (
    [Id] int NOT NULL PRIMARY KEY,
    [ExcursionName] nvarchar(40) NOT NULL
);

CREATE TABLE [Exposure] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [ExternalIdDataType] (
    [Id] int NOT NULL PRIMARY KEY,
    [DataType] nvarchar(510)
);

CREATE TABLE [ExternalPatientLink] (
    [Id] int NOT NULL PRIMARY KEY,
    [ExternalPatientId] nvarchar(510) NOT NULL,
    [ExternalPatientIdDataTypeId] int NOT NULL,
    [ExternalPartnerCode] nvarchar(510) NOT NULL
);

CREATE TABLE [ExternalPatientLinkLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [EmrPatientId] uniqueidentifier NOT NULL,
    [ExternalPatientId] nvarchar(510) NOT NULL,
    [ExternalPatientIdDataTypeId] int NOT NULL,
    [ExternalPartnerCode] nvarchar(510) NOT NULL,
    [PartnerId] int NOT NULL
);

CREATE TABLE [Extract] (
    [Id] int NOT NULL PRIMARY KEY,
    [ProgrammeExtractDefinitionId] int NOT NULL,
    [Payload] nvarchar(MAX),
    [PayloadDataType] varchar(100),
    [DateCreated] datetime2 NOT NULL
);

CREATE TABLE [ExtractDefinition] (
    [Id] int NOT NULL PRIMARY KEY,
    [ProgrammeExtractDefinitionId] int NOT NULL,
    [Key] varchar(50) NOT NULL
);

CREATE TABLE [ExtractorType] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [ExtractState] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(40)
);

CREATE TABLE [ExtractToken] (
    [Id] int NOT NULL PRIMARY KEY,
    [ExtractId] int NOT NULL,
    [Key] varchar(50) NOT NULL,
    [Value] varchar(100) NOT NULL
);

CREATE TABLE [EyeTarget] (
    [Id] int NOT NULL PRIMARY KEY,
    [EyeTargetName] nvarchar(30) NOT NULL
);

CREATE TABLE [Faden] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [Location] float(8) NOT NULL,
    [LocationFromId] int,
    [SutureId] int,
    [LocationFromId] int NOT NULL,
    [SutureId] int
);

CREATE TABLE [FadenLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [LocationFromId] int,
    [Location] float(8) NOT NULL,
    [LocationFromId] int NOT NULL,
    [SutureId] int,
    [SutureId] int
);

CREATE TABLE [FDT] (
    [Id] int NOT NULL PRIMARY KEY,
    [ResultsText] nvarchar(1000)
);

CREATE TABLE [FDTLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PreparationId] int NOT NULL,
    [ResultsText] nvarchar(1000),
    [BodyPartId] int NOT NULL
);

CREATE TABLE [Feature] (
    [ftr_id] int NOT NULL PRIMARY KEY,
    [ftr_set_FeatureSetId] int NOT NULL,
    [ftr_grd_GradingTypeId] int NOT NULL,
    [ftr_Name] nvarchar(200) NOT NULL,
    [ftr_Description] nvarchar(500)
);

CREATE TABLE [FeatureLookup] (
    [flk_id] int NOT NULL PRIMARY KEY,
    [flk_Name] nvarchar(500) NOT NULL,
    [flk_Description] nvarchar(500),
    [flk_OutcomeLookupId] int
);

CREATE TABLE [FeatureLookupSet] (
    [fls_set_FeatureSetId] int NOT NULL PRIMARY KEY,
    [fls_flk_FeatureLookupId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [FeatureResponse] (
    [fsp_Id] int NOT NULL PRIMARY KEY,
    [fsp_flk_FeatureLookupId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [FeatureResult] (
    [frs_Id] int NOT NULL PRIMARY KEY,
    [frs_res_EncounterGradingResultId] uniqueidentifier NOT NULL,
    [frs_ftr_FeatureId] int NOT NULL,
    [frs_bod_BodyPartId] int NOT NULL
);

CREATE TABLE [FeatureResultLog] (
    [frs_Id] int NOT NULL,
    [frs_ObjectId] int NOT NULL,
    [frs_DateAdded] datetime NOT NULL,
    [frs_AddedBy] uniqueidentifier NOT NULL,
    [frs_Transactionid] uniqueidentifier NOT NULL,
    [frs_Action] char(1) NOT NULL,
    [frs_res_EncounterGradingResultId] uniqueidentifier NOT NULL,
    [frs_ftr_FeatureId] int NOT NULL,
    [frs_bod_BodyPartId] int NOT NULL
);

CREATE TABLE [FeatureSet] (
    [set_id] int NOT NULL PRIMARY KEY,
    [set_Name] nvarchar(200) NOT NULL,
    [set_Description] nvarchar(500)
);

CREATE TABLE [femalepatients] (
    [pdm_id] int NOT NULL,
    [pdm_gender] nvarchar(510),
    [pdm_lastupdated] datetime
);

CREATE TABLE [FindingEye] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeName] nvarchar(100) NOT NULL
);

CREATE TABLE [FindingsConditions] (
    [ExcursionId] int,
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [FindingsConditionsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL,
    [ExcursionId] int,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [FixingEye] (
    [Id] int NOT NULL PRIMARY KEY,
    [FixingEyeName] nvarchar(50) NOT NULL
);

CREATE TABLE [Flag] (
    [flg_Id] int NOT NULL PRIMARY KEY,
    [flg_Description] nvarchar(510) NOT NULL,
    [flg_TypeId] int NOT NULL,
    [flg_StartDate] datetime NOT NULL,
    [flg_EndDate] datetime,
    [flg_SeverityId] int,
    [flg_DefaultExpirationId] int,
    [flg_Icon_blobRepositoryId] uniqueidentifier,
    [flg_Active] bit
);

CREATE TABLE [FlagAdditionalDisplayOption] (
    [fdo_flg_FlagId] int NOT NULL PRIMARY KEY,
    [fdo_ado_AdditionalDisplayOptionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [FlagAdditionalDisplayOptionLog] (
    [fdo_flg_FlagId] int NOT NULL PRIMARY KEY,
    [fdo_ObjectId] int NOT NULL,
    [fdo_DateAdded] datetime NOT NULL,
    [fdo_AddedBy] uniqueidentifier NOT NULL,
    [fdo_TransactionId] uniqueidentifier NOT NULL,
    [fdo_Action] char(1) NOT NULL,
    [fdo_ado_AdditionalDisplayOptionId] int NOT NULL
);

CREATE TABLE [FlagItem] (
    [pfi_Id] int NOT NULL PRIMARY KEY,
    [pfi_pat_id] uniqueidentifier,
    [pfi_flg_id] int NOT NULL,
    [pfi_FlagAddedDate] datetime NOT NULL,
    [pfi_Comments] nvarchar(500),
    [pfi_ExpirationId] int,
    [pfi_FlagRemovedDate] datetime,
    [pfi_ExpirationDate] datetime
);

CREATE TABLE [FlagItemLog] (
    [pfi_Id] int NOT NULL,
    [pfi_pat_id] uniqueidentifier,
    [pfi_flg_id] int NOT NULL,
    [pfi_FlagAddedDate] datetime NOT NULL,
    [pfi_ObjectId] int NOT NULL,
    [pfi_DateAdded] datetime NOT NULL,
    [pfi_AddedBy] uniqueidentifier NOT NULL,
    [pfi_TransactionId] uniqueidentifier NOT NULL,
    [pfi_Action] char(1) NOT NULL,
    [pfi_Comments] nvarchar(500),
    [pfi_ExpirationId] int,
    [pfi_FlagRemovedDate] datetime,
    [pfi_ExpirationDate] datetime
);

CREATE TABLE [FlagLog] (
    [flg_Id] int NOT NULL PRIMARY KEY,
    [flg_ObjectId] int NOT NULL,
    [flg_DateAdded] datetime NOT NULL,
    [flg_AddedBy] uniqueidentifier NOT NULL,
    [flg_TransactionId] uniqueidentifier NOT NULL,
    [flg_Action] char(1) NOT NULL,
    [flg_Description] nvarchar(510) NOT NULL,
    [flg_TypeId] int NOT NULL,
    [flg_StartDate] datetime NOT NULL,
    [flg_EndDate] datetime,
    [flg_SeverityId] int,
    [flg_DefaultExpirationId] int,
    [flg_Icon_blobRepositoryId] uniqueidentifier,
    [flg_Active] bit,
    [flg_StaticId] int
);

CREATE TABLE [FollowUpPathways] (
    [PathwayId] int NOT NULL PRIMARY KEY,
    [IsEnabled] bit NOT NULL,
    [ShouldAutoCreateSharedCareFollowUps] bit NOT NULL,
    [FollowUpIntervalInWeeks] int,
    [MaximumTimeInCommunityInMonths] int
);

CREATE TABLE [FormConfiguration] (
    [bfc_id] int NOT NULL PRIMARY KEY,
    [bfc_Available] bit NOT NULL
);

CREATE TABLE [FormConfigurationCharge] (
    [bsc_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [FormConfigurationChargeLog] (
    [bsc_Id] int NOT NULL PRIMARY KEY,
    [bsc_bic_Id] int NOT NULL,
    [bsc_ObjectId] int NOT NULL,
    [bsc_DateAdded] datetime NOT NULL,
    [bsc_AddedBy] uniqueidentifier NOT NULL,
    [bsc_TransactionId] uniqueidentifier NOT NULL,
    [bsc_Action] char(1) NOT NULL,
    [bsc_bfc_Id] int NOT NULL
);

CREATE TABLE [FormConfigurationLog] (
    [bfc_ObjectId] int NOT NULL,
    [bfc_id] int NOT NULL PRIMARY KEY,
    [bfc_cpw_id] int NOT NULL,
    [bfc_Available] bit NOT NULL,
    [bfc_DateAdded] datetime NOT NULL,
    [bfc_AddedBy] uniqueidentifier NOT NULL,
    [bfc_Transactionid] uniqueidentifier NOT NULL,
    [bfc_Action] char(1) NOT NULL,
    [bfc_bft_FormTypeId] int NOT NULL
);

CREATE TABLE [FormType] (
    [bft_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ForReviewDefault] (
    [Id] int NOT NULL PRIMARY KEY,
    [Name] nvarchar(200) NOT NULL,
    [DisplayOrder] int NOT NULL
);

CREATE TABLE [FresnelPrismBaseHorizontalDirection] (
    [Id] int NOT NULL PRIMARY KEY,
    [DirectionName] nvarchar(4) NOT NULL
);

CREATE TABLE [FresnelPrismBaseVerticalDirection] (
    [Id] int NOT NULL PRIMARY KEY,
    [DirectionName] nvarchar(4) NOT NULL
);

CREATE TABLE [FusionRange] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL,
    [Comments] nvarchar(5000),
    [Correction] int,
    [Distance] int,
    [AngleCorrected] bit,
    [EyeId] int,
    [FromPrismDirectionId] int,
    [FromPrismDirectionValue] int,
    [ToPrismDirectionId] int,
    [ToPrismDirectionValue] int
);

CREATE TABLE [FusionRangeLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ActivityId] uniqueidentifier NOT NULL,
    [Comments] nvarchar(5000),
    [Correction] int,
    [Distance] int,
    [AngleCorrected] bit,
    [EyeId] int,
    [FromPrismDirectionId] int,
    [FromPrismDirectionValue] int,
    [ToPrismDirectionId] int,
    [ToPrismDirectionValue] int
);

CREATE TABLE [GasBubble] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [General] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SutureId] int,
    [SutureId] int
);

CREATE TABLE [generalclinicactivity] (
    [ecl_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [ecl_act_id] uniqueidentifier NOT NULL,
    [ecl_flag] int,
    [ecl_datereviewed] datetime,
    [ecl_reviewapproval] int,
    [ecl_bod_id_eyedilated] int,
    [ecl_time] varchar(255),
    [ecl_lku_id_hfamachine] uniqueidentifier,
    [ecl_pairsofglasses] int
);

CREATE TABLE [GeneralLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [SutureId] int,
    [SutureId] int
);

CREATE TABLE [GenericFollowUp] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [CommunityPinId] int NOT NULL,
    [PatientConsented] bit NOT NULL,
    [RightEyeSubjectiveChange] int,
    [LeftEyeSubjectiveChange] int,
    [Findings] nvarchar(2400),
    [RemoteLocationId] uniqueidentifier,
    [RemoteLocation] nvarchar(510)
);

CREATE TABLE [GlaucomaDefaultsCyclodiodeMedicationsDuplicateMedicationRemovalBackup] (
    [sdm_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [sdm_lks_id] int NOT NULL PRIMARY KEY,
    [sdm_dro_id] int NOT NULL PRIMARY KEY,
    [sdm_mcn_id] int NOT NULL PRIMARY KEY,
    [sdm_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [GlaucomaDefaultsDefaultDrugsDuplicateMedicationRemovalBackup] (
    [sdd_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [sdd_lks_id] int NOT NULL PRIMARY KEY,
    [sdd_dro_id] int NOT NULL PRIMARY KEY,
    [sdd_mcn_id] int NOT NULL PRIMARY KEY,
    [sdd_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [GlaucomaDefaultsLTMedicationsDuplicateMedicationRemovalBackup] (
    [sdm_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [sdm_lks_id] int NOT NULL PRIMARY KEY,
    [sdm_dro_id] int NOT NULL PRIMARY KEY,
    [sdm_mcn_id] int NOT NULL PRIMARY KEY,
    [sdm_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [GlucoseData] (
    [ugl_id] int NOT NULL PRIMARY KEY,
    [ugl_available] bit NOT NULL
);

CREATE TABLE [grade] (
    [gra_id] int NOT NULL PRIMARY KEY,
    [gra_desc] nvarchar(510),
    [gra_seniorityorder] tinyint(1),
    [gra_listorder] tinyint(1),
    [gra_current] bit,
    [gra_desclong] nvarchar(510),
    [gra_showonwebui] bit NOT NULL,
    [gra_FeminineDescription] nvarchar(450)
);

CREATE TABLE [gradeexact] (
    [gxt_id] int NOT NULL,
    [gxt_gra_id] int NOT NULL,
    [gxt_ust_id] int NOT NULL,
    [gxt_desc] nvarchar(510)
);

CREATE TABLE [gradestousertypes] (
    [grade_id] int NOT NULL PRIMARY KEY,
    [usertype_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Grading] (
    [Id] int NOT NULL PRIMARY KEY,
    [grd_id] int NOT NULL PRIMARY KEY,
    [grd_drg_GradingSchemeId] int NOT NULL,
    [GradingType] int NOT NULL,
    [Available] bit NOT NULL,
    [grd_Name] varchar(100) NOT NULL,
    [grd_Description] varchar(250),
    [DisplayOrder] int NOT NULL
);

CREATE TABLE [GradingClinicalConcept] (
    [cpt_id] int NOT NULL PRIMARY KEY,
    [grd_id] int NOT NULL PRIMARY KEY,
    [typ_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [GradingOutputResult] (
    [gor_Id] int NOT NULL PRIMARY KEY,
    [gor_res_EncounterGradingResultId] uniqueidentifier NOT NULL,
    [gor_grd_GradingId] int NOT NULL,
    [gor_rnk_GradingRankId] int,
    [gor_bod_EyePartId] int NOT NULL,
    [gor_typ_GradingTypeId] int NOT NULL
);

CREATE TABLE [GradingOutputResultLog] (
    [gor_Id] int NOT NULL,
    [gor_ObjectId] int NOT NULL,
    [gor_DateAdded] datetime NOT NULL,
    [gor_AddedBy] uniqueidentifier NOT NULL,
    [gor_Transactionid] uniqueidentifier NOT NULL,
    [gor_Action] char(1) NOT NULL,
    [gor_res_EncounterGradingResultId] uniqueidentifier NOT NULL,
    [gor_grd_GradingId] int NOT NULL,
    [gor_rnk_GradingRankId] int,
    [gor_bod_EyePartId] int NOT NULL,
    [gor_typ_GradingTypeId] int NOT NULL
);

CREATE TABLE [GradingRank] (
    [rnk_id] int NOT NULL PRIMARY KEY,
    [rnk_Name] nvarchar(100) NOT NULL,
    [rnk_Description] nvarchar(200)
);

CREATE TABLE [GradingScheme] (
    [drg_Id] int NOT NULL PRIMARY KEY,
    [drg_Name] nvarchar(100) NOT NULL,
    [drg_Description] nvarchar(200),
    [drg_Available] bit NOT NULL,
    [drg_Default] bit NOT NULL
);

CREATE TABLE [GradingSchemeFeatures] (
    [gsf_drg_GradingSchemeId] int NOT NULL PRIMARY KEY,
    [gsf_ftr_FeatureId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [GradingSchemeResult] (
    [gsr_res_Id] uniqueidentifier NOT NULL PRIMARY KEY,
    [gsr_drg_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [GradingSchemeResultLog] (
    [gsr_res_Id] int NOT NULL PRIMARY KEY,
    [gsr_ObjectId] uniqueidentifier NOT NULL,
    [gsr_DateAdded] datetime NOT NULL,
    [gsr_AddedBy] uniqueidentifier NOT NULL,
    [gsr_Transactionid] uniqueidentifier NOT NULL,
    [gsr_Action] char(1) NOT NULL,
    [gsr_drg_Id] int NOT NULL
);

CREATE TABLE [GradingType] (
    [typ_id] int NOT NULL PRIMARY KEY,
    [typ_Name] nvarchar(200) NOT NULL
);

CREATE TABLE [Granularity] (
    [etg_id] int NOT NULL PRIMARY KEY,
    [etg_Description] nvarchar(500) NOT NULL
);

CREATE TABLE [Group] (
    [deg_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [groups] (
    [grp_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [grp_name] nvarchar(510) NOT NULL,
    [grp_active] bit,
    [grp_description] nvarchar(510)
);

CREATE TABLE [groupstopermissions] (
    [groups_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [permission_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [groupstousers] (
    [user_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [groups_id] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [Handshake] (
    [sdh_id] int NOT NULL PRIMARY KEY,
    [sdh_description] nvarchar(200) NOT NULL
);

CREATE TABLE [HaradaIto] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [AnteriorTendonTransposed] int NOT NULL,
    [AnteriorTendonTransposed] int,
    [Positioned] float(8),
    [Positioned] float(8) NOT NULL,
    [SutureId] int,
    [SutureId] int
);

CREATE TABLE [HaradaItoLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [AnteriorTendonTransposed] int NOT NULL,
    [AnteriorTendonTransposed] int,
    [Positioned] float(8),
    [Positioned] float(8) NOT NULL,
    [SutureId] int,
    [SutureId] int
);

CREATE TABLE [Hba1c] (
    [hba_Id] int NOT NULL PRIMARY KEY,
    [hba_Value] decimal(18, 2) NOT NULL,
    [hba_ValueUnitId] int NOT NULL,
    [hba_Date] datetime NOT NULL,
    [hba_DateUnitId] int NOT NULL,
    [hba_SourceId] int NOT NULL,
    [hba_IsDeleted] bit,
    [hba_ConvertedValue] decimal(18, 2),
    [hba_ConvertedValueUnitId] int,
    [hba_Precision] int NOT NULL
);

CREATE TABLE [Hba1cActivityPatientLink] (
    [hbl_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Hba1cDateUnit] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(20) NOT NULL
);

CREATE TABLE [Hba1cLog] (
    [hba_ObjectId] int NOT NULL,
    [hba_DateAdded] datetime NOT NULL,
    [hba_AddedBy] uniqueidentifier NOT NULL,
    [hba_Transactionid] uniqueidentifier NOT NULL,
    [hba_Action] char(1) NOT NULL,
    [hba_Id] int NOT NULL PRIMARY KEY,
    [hba_Value] decimal(18, 2) NOT NULL,
    [hba_ValueUnitId] int NOT NULL,
    [hba_Date] datetime NOT NULL,
    [hba_DateUnitId] int NOT NULL,
    [hba_SourceId] int NOT NULL,
    [hba_IsDeleted] bit,
    [hba_ConvertedValue] decimal(18, 2),
    [hba_ConvertedValueUnitId] int,
    [hba_Precision] int NOT NULL
);

CREATE TABLE [Hba1cLookup] (
    [hbl_Id] int NOT NULL PRIMARY KEY,
    [hbl_Description] nvarchar(400) NOT NULL,
    [hbl_Visible] bit NOT NULL,
    [hbl_hlt_Id] int NOT NULL
);

CREATE TABLE [Hba1cLookupType] (
    [hlt_Id] int NOT NULL PRIMARY KEY,
    [hlt_Description] nvarchar(400) NOT NULL
);

CREATE TABLE [Hba1cRequest] (
    [Id] int NOT NULL PRIMARY KEY,
    [Value] decimal(18, 2) NOT NULL,
    [Precision] int NOT NULL,
    [Unit] int NOT NULL,
    [Date] date(3) NOT NULL,
    [Source] int NOT NULL,
    [DateUnit] int NOT NULL
);

CREATE TABLE [Hba1cSource] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(400) NOT NULL
);

CREATE TABLE [Hba1cUnit] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(20) NOT NULL
);

CREATE TABLE [HeadPostureSeverity] (
    [Id] int NOT NULL PRIMARY KEY,
    [HeadPostureSeverityName] nvarchar(20) NOT NULL,
    [IsEnabled] bit NOT NULL
);

CREATE TABLE [HeadPostureStatus] (
    [Id] int NOT NULL PRIMARY KEY,
    [HeadPostureStatusName] nvarchar(20) NOT NULL
);

CREATE TABLE [healthcareservice] (
    [hsv_id] int NOT NULL PRIMARY KEY,
    [hsv_code] varchar(10),
    [hsv_description] varchar(255) NOT NULL
);

CREATE TABLE [HeartbeatSession] (
    [hss_Id] int NOT NULL PRIMARY KEY,
    [hss_hbs_SourceId] int NOT NULL,
    [hss_use_UserId] uniqueidentifier NOT NULL,
    [hss_dev_DeviceId] uniqueidentifier NOT NULL
);

CREATE TABLE [HeartbeatSignal] (
    [hsg_Id] int NOT NULL PRIMARY KEY,
    [hsg_hss_SessionId] int NOT NULL,
    [hsg_DateTime] datetime,
    [hsg_CurrentAvailablePhysicalMemoryInBytes] bigint(8),
    [hsg_CurrentPhysicalMemoryInUseByProcessInBytes] bigint(8)
);

CREATE TABLE [HeartbeatSource] (
    [hbs_Id] int NOT NULL PRIMARY KEY,
    [hbs_Value] varchar(50) NOT NULL
);

CREATE TABLE [HeyexScanNotificationInvestigationItem] (
    [esn_eip_InvestigationItemId] int NOT NULL PRIMARY KEY,
    [esn_hsn_SeriesInstanceUid] nvarchar(400),
    [esn_hsn_ClusterId] uniqueidentifier
);

CREATE TABLE [HeyexScanNotificationInvestigationItemLog] (
    [esn_eip_InvestigationItemId] int NOT NULL PRIMARY KEY,
    [esn_hsn_SeriesInstanceUid] nvarchar(400),
    [esn_ObjectId] int NOT NULL,
    [esn_DateAdded] datetime NOT NULL,
    [esn_AddedBy] uniqueidentifier NOT NULL,
    [esn_Transactionid] uniqueidentifier NOT NULL,
    [esn_Action] char(1) NOT NULL,
    [esn_hsn_ClusterId] uniqueidentifier
);

CREATE TABLE [HfaBinaryDocument] (
    [hbd_bdc_BinaryDocumentId] int NOT NULL PRIMARY KEY,
    [hbd_vtp_TestPatternId] int NOT NULL
);

CREATE TABLE [HfaBinaryDocumentLog] (
    [hbd_bdc_BinaryDocumentId] int NOT NULL PRIMARY KEY,
    [hbd_ObjectId] int NOT NULL,
    [hbd_DateAdded] datetime NOT NULL,
    [hbd_AddedBy] uniqueidentifier NOT NULL,
    [hbd_TransactionId] uniqueidentifier NOT NULL,
    [hbd_Action] char(1) NOT NULL,
    [hbd_vtp_TestPatternId] int NOT NULL
);

CREATE TABLE [HfaInvestigationItem] (
    [ehf_eip_InvestigationItemId] int NOT NULL PRIMARY KEY,
    [ehf_vfh_SeriesInstanceUid] nvarchar(200),
    [ehf_doc_DocumentId] uniqueidentifier NOT NULL,
    [ehf_DocumentVersion] int NOT NULL
);

CREATE TABLE [HfaInvestigationItemLog] (
    [ehf_eip_InvestigationItemId] int NOT NULL PRIMARY KEY,
    [ehf_vfh_SeriesInstanceUid] nvarchar(200),
    [ehf_ObjectId] int NOT NULL,
    [ehf_DateAdded] datetime NOT NULL,
    [ehf_AddedBy] uniqueidentifier NOT NULL,
    [ehf_Transactionid] uniqueidentifier NOT NULL,
    [ehf_Action] char(1) NOT NULL,
    [ehf_doc_DocumentId] uniqueidentifier,
    [ehf_DocumentVersion] int NOT NULL
);

CREATE TABLE [HfaInvestigationVersion] (
    [hiv_iiv_InvestigationItemVersionId] int NOT NULL PRIMARY KEY,
    [hiv_vtp_TestPatternId] int NOT NULL,
    [hiv_dim_DataImportMethodId] int NOT NULL
);

CREATE TABLE [HfaInvestigationVersionLog] (
    [hiv_iiv_InvestigationItemVersionId] int NOT NULL PRIMARY KEY,
    [hiv_dim_DataImportMethodId] int NOT NULL,
    [hiv_vtp_TestPatternId] int NOT NULL,
    [hiv_ObjectId] int NOT NULL,
    [hiv_DateAdded] datetime NOT NULL,
    [hiv_AddedBy] uniqueidentifier NOT NULL,
    [hiv_Transactionid] uniqueidentifier NOT NULL,
    [hiv_Action] char(1) NOT NULL
);

CREATE TABLE [History] (
    [pah_id] int NOT NULL PRIMARY KEY,
    [pah_act_id] uniqueidentifier NOT NULL,
    [pah_comments] nvarchar(4000)
);

CREATE TABLE [HistoryItem] (
    [phi_id] int NOT NULL PRIMARY KEY,
    [fhi_id] int NOT NULL PRIMARY KEY,
    [phi_cpt_id] int NOT NULL,
    [phi_parsedText] nvarchar(4000) NOT NULL,
    [phi_bod_id] int,
    [phi_negated] bit NOT NULL,
    [phi_freeText] nvarchar(500)
);

CREATE TABLE [HistoryItemLog] (
    [phi_ObjectId] int NOT NULL,
    [phi_id] int NOT NULL PRIMARY KEY,
    [phi_pah_id] int NOT NULL,
    [phi_cpt_id] int NOT NULL,
    [phi_parsedText] nvarchar(4000) NOT NULL,
    [phi_bod_id] int,
    [phi_negated] bit NOT NULL,
    [phi_freeText] nvarchar(500),
    [phi_DateAdded] datetime NOT NULL,
    [phi_AddedBy] uniqueidentifier NOT NULL,
    [phi_TransactionId] uniqueidentifier NOT NULL,
    [phi_Action] char(1) NOT NULL
);

CREATE TABLE [HistoryItemQualifier] (
    [phq_id] int NOT NULL PRIMARY KEY,
    [phq_cql_id] int NOT NULL,
    [phq_cpt_id] int NOT NULL
);

CREATE TABLE [HistoryItemQualifierLog] (
    [phq_ObjectId] int NOT NULL,
    [phq_id] int NOT NULL PRIMARY KEY,
    [phq_phi_id] int NOT NULL,
    [phq_cql_id] int NOT NULL,
    [phq_cpt_id] int NOT NULL,
    [phq_DateAdded] datetime NOT NULL,
    [phq_AddedBy] uniqueidentifier NOT NULL,
    [phq_TransactionId] uniqueidentifier NOT NULL,
    [phq_Action] char(1) NOT NULL
);

CREATE TABLE [HistoryLog] (
    [pah_ObjectId] int NOT NULL,
    [pah_id] int NOT NULL PRIMARY KEY,
    [pah_act_id] uniqueidentifier NOT NULL,
    [pah_comments] nvarchar(4000),
    [pah_DateAdded] datetime NOT NULL,
    [pah_AddedBy] uniqueidentifier NOT NULL,
    [pah_TransactionId] uniqueidentifier NOT NULL,
    [pah_Action] char(1) NOT NULL
);

CREATE TABLE [hl7component] (
    [com_id] int NOT NULL PRIMARY KEY,
    [com_name] varchar(255),
    [com_variable] varchar(255),
    [com_seg_id] int,
    [com_xpath] varchar(2000),
    [com_attribute] int,
    [com_apisupport] bit,
    [com_pnt_id] int,
    [com_statusattribute] int,
    [com_lkt_id] int,
    [com_SearchText] nvarchar(510),
    [com_ReplaceText] nvarchar(510),
    [com_HospitalNumberSubtypeId] int
);

CREATE TABLE [hl7datatype] (
    [dty_id] int NOT NULL PRIMARY KEY,
    [dty_category] varchar(255),
    [dty_datatypecode] varchar(255) NOT NULL,
    [dty_datatypename] varchar(255),
    [dty_hl7reference] varchar(255),
    [dty_notes] nvarchar(510),
    [dty_format] varchar(2000)
);

CREATE TABLE [hl7element] (
    [ele_id] int NOT NULL PRIMARY KEY,
    [ele_item] int NOT NULL,
    [ele_description] varchar(255) NOT NULL,
    [ele_seg_id] int,
    [ele_sequence] int NOT NULL,
    [ele_length] int,
    [ele_dty_id] int,
    [ele_repeat] varchar(255),
    [ele_table] varchar(255)
);

CREATE TABLE [hl7event] (
    [evn_id] int NOT NULL PRIMARY KEY,
    [evn_eventcode] varchar(10) NOT NULL,
    [evn_description] varchar(255),
    [evn_procedure] varchar(255),
    [evn_procedureactive] bit
);

CREATE TABLE [hl7eventsegment] (
    [evs_id] int NOT NULL PRIMARY KEY,
    [evs_evn_id] int,
    [evs_seg_id] int
);

CREATE TABLE [hl7interfacesettings] (
    [hls_id] int NOT NULL PRIMARY KEY,
    [hls_setting] int NOT NULL,
    [hls_int] int,
    [hls_string] varchar(MAX)
);

CREATE TABLE [Hl7Mapping] (
    [bhm_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Hl7MappingDataType] (
    [bhd_Id] int NOT NULL PRIMARY KEY,
    [bhd_Description] nvarchar(60) NOT NULL
);

CREATE TABLE [Hl7MappingLog] (
    [bhm_Id] int NOT NULL PRIMARY KEY,
    [bhm_hmt_Hl7MappableTypeId] int NOT NULL,
    [bhm_Code] nvarchar(30) NOT NULL,
    [bhm_Value] nvarchar(100) NOT NULL,
    [bhm_ObjectId] int NOT NULL,
    [bhm_DateAdded] datetime NOT NULL,
    [bhm_AddedBy] uniqueidentifier NOT NULL,
    [bhm_TransactionId] uniqueidentifier NOT NULL,
    [bhm_Action] char(1) NOT NULL
);

CREATE TABLE [Hl7MappingType] (
    [hmt_Id] int NOT NULL PRIMARY KEY,
    [hmt_Description] nvarchar(100) NOT NULL,
    [hmt_IsSystem] bit NOT NULL,
    [hmt_bhd_Hl7MappingDataTypeId] int NOT NULL
);

CREATE TABLE [hl7message] (
    [hlm_id] int NOT NULL PRIMARY KEY,
    [hlm_hl7] varchar(MAX),
    [hlm_xml] varchar(MAX),
    [hlm_ack] varchar(MAX),
    [hlm_acksent] bit,
    [hlm_processed] int,
    [hlm_messagetype] varchar(255),
    [hlm_triggerevent] varchar(255),
    [hlm_ErrorMessage] nvarchar(2000)
);

CREATE TABLE [hl7messagequeue] (
    [hmq_id] int NOT NULL PRIMARY KEY,
    [hmq_messagecontrolid] varchar(20) NOT NULL,
    [hmq_triggerevent] varchar(20) NOT NULL,
    [hmq_datetimecreated] datetime NOT NULL,
    [hmq_messagedirection] int NOT NULL,
    [hmq_status] int NOT NULL,
    [hmq_message] varchar(MAX) NOT NULL,
    [hmq_ack] varchar(MAX) NOT NULL,
    [hmq_exception] varchar(MAX) NOT NULL
);

CREATE TABLE [hl7messagetype] (
    [mtp_id] int NOT NULL PRIMARY KEY,
    [mtp_messagecode] varchar(3) NOT NULL,
    [mtp_description] varchar(255) NOT NULL,
    [mtp_chapter] int NOT NULL,
    [mtp_supported] bit
);

CREATE TABLE [hl7practitionermap] (
    [hpm_id] int NOT NULL PRIMARY KEY,
    [hpm_include] bit NOT NULL
);

CREATE TABLE [hl7segment] (
    [seg_id] int NOT NULL PRIMARY KEY,
    [seg_segmentcode] varchar(3) NOT NULL,
    [seg_description] varchar(255) NOT NULL,
    [seg_chapter] varchar(255)
);

CREATE TABLE [HorizontalDeviation] (
    [Id] int NOT NULL PRIMARY KEY,
    [HorizontalDeviationName] nvarchar(100) NOT NULL
);

CREATE TABLE [HorizontalPreAdjustment] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [HorizontalTarget] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [HorizontalTargetId] int,
    [HorizontalTargetId] int NOT NULL,
    [RangeFrom] tinyint(1),
    [RangeFrom] tinyint(1),
    [RangeTo] tinyint(1),
    [RangeTo] tinyint(1)
);

CREATE TABLE [HorizontalTargetLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [HorizontalTargetId] int,
    [HorizontalTargetId] int NOT NULL,
    [RangeFrom] tinyint(1),
    [RangeFrom] tinyint(1),
    [RangeTo] tinyint(1),
    [RangeTo] tinyint(1)
);

CREATE TABLE [HorizontalTestFindings] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [HorizontalDeviationId] int,
    [MeasurementStartValue] float(8),
    [MeasurementEndValue] float(8),
    [MeasurementRange] bit,
    [MeasurementUnitId] int NOT NULL,
    [Comments] nvarchar(1000),
    [FresnelPrismBaseHorizontalDirectionId] int,
    [NoDeviation] bit NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [HorizontalTestFindingsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [HorizontalDeviationId] int,
    [MeasurementStartValue] float(8),
    [MeasurementEndValue] float(8),
    [MeasurementRange] bit,
    [MeasurementUnitId] int NOT NULL,
    [Comments] nvarchar(1000),
    [FresnelPrismBaseHorizontalDirectionId] int,
    [NoDeviation] bit NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [HostPreparation] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [InicisionId] int,
    [InicisionId] int NOT NULL,
    [IncisionSize] decimal(18, 2) NOT NULL,
    [IncisionSize] decimal(18, 2),
    [LeftIncisionDegrees] int,
    [IncisionDegrees] int NOT NULL,
    [StrippingMethod_LookupId] int NOT NULL,
    [RightIncisionDegrees] int,
    [StrippingMethodId] int,
    [AcFillId] int,
    [DiameterStripped] decimal(18, 2),
    [AcFillId] int
);

CREATE TABLE [HostPreparationLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [InicisionId] int NOT NULL,
    [InicisionId] int,
    [IncisionSize] decimal(18, 2),
    [IncisionSize] decimal(18, 2) NOT NULL,
    [IncisionDegrees] int NOT NULL,
    [LeftIncisionDegrees] int,
    [RightIncisionDegrees] int,
    [StrippingMethod_LookupId] int NOT NULL,
    [AcFillId] int,
    [StrippingMethodId] int,
    [AcFillId] int,
    [DiameterStripped] decimal(18, 2)
);

CREATE TABLE [HumphreyHemifieldTest] (
    [hht_Id] int NOT NULL PRIMARY KEY,
    [hht_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [HumphreyHemifieldTestDescription] (
    [htd_Id] int NOT NULL PRIMARY KEY,
    [htd_htt_HemifieldTestId] int NOT NULL
);

CREATE TABLE [HumphreyProbability] (
    [vhp_Id] int NOT NULL PRIMARY KEY,
    [vhp_Description] nvarchar(200)
);

CREATE TABLE [HumphreyProbabilityDescription] (
    [hpd_Id] int NOT NULL PRIMARY KEY,
    [hpd_vhp_HumphreyProbabilityId] int NOT NULL
);

CREATE TABLE [HumphreyTest] (
    [vfh_bod_Id] int NOT NULL,
    [vfh_ManufacturerModel] nvarchar(200),
    [vfh_TestDateTime] datetime NOT NULL,
    [vfh_vts_TestStrategyId] int NOT NULL,
    [vfh_vtp_TestPatternId] int NOT NULL,
    [vfh_hht_HemifieldTestId] int,
    [vfh_PupilDiameter] decimal(18, 2),
    [vfh_StudyInstanceUid] nvarchar(200),
    [vfh_SeriesInstanceUid] nvarchar(200),
    [vfh_DeviceSerialNumber] nvarchar(100),
    [vfh_SoftwareVersions] nvarchar(200),
    [vfh_SopInstanceUid] nvarchar(200),
    [vfh_StimulusSize] nvarchar(200),
    [vfh_StimulusColor] nvarchar(200),
    [vfh_BackgroundState] nvarchar(200),
    [vfh_FovealResult] nvarchar(200),
    [vfh_ScreeningMode] nvarchar(200),
    [vfh_VisualAcuity] nvarchar(200),
    [vfh_FixationMonitor] nvarchar(200),
    [vfh_FixationTarget] nvarchar(200),
    [vfh_FixationTrials] int,
    [vfh_FixationErrors] int,
    [vfh_FalsePositiveTrials] int,
    [vfh_FalsePositiveErrors] int,
    [vfh_FalsePositivePercent] int,
    [vfh_FalseNegativeTrials] int,
    [vfh_FalseNegativeErrors] int,
    [vfh_FalseNegativePercent] int,
    [vfh_TrialRxSphere] decimal(18, 2),
    [vfh_TrialRxCylinder] decimal(18, 2),
    [vfh_TrialRxAxis] int,
    [vfh_MeanDeviation] decimal(18, 2),
    [vfh_vhp_MeanDeviationProbability] int,
    [vfh_PatternStandardDeviation] decimal(18, 2),
    [vfh_vhp_PatternStandardDeviationProbability] int,
    [vfh_ShortTermFluctuation] decimal(18, 2),
    [vfh_vhp_ShortTermFluctuationProbability] int,
    [vfh_CorrectedPatternStandardDeviation] decimal(18, 2),
    [vfh_vhp_CorrectedPatternStandardDeviationProbability] int,
    [vfh_VisualFieldIndex] int,
    [vfh_DerivationDescription] nvarchar(200),
    [vfh_FileReference] nvarchar(400),
    [vfh_Id] int NOT NULL PRIMARY KEY,
    [vfh_TestName] nvarchar(200),
    [vfh_TestStrategyText] nvarchar(200),
    [vfh_TestPatternText] nvarchar(200),
    [vfh_HemifieldTestText] nvarchar(200),
    [vfh_MeanDeviationProbabilityText] nvarchar(200),
    [vfh_PatternStandardDeviationProbabilityText] nvarchar(200),
    [vfh_ShortTermFluctuationProbabilityText] nvarchar(200),
    [vfh_CorrectedPatternStandardDeviationProbabilityText] nvarchar(200),
    [vfh_IsReliable] bit NOT NULL
);

CREATE TABLE [HumphreyTestPattern] (
    [vtp_Id] int NOT NULL PRIMARY KEY,
    [vtp_Description] nvarchar(100) NOT NULL
);

CREATE TABLE [HumphreyTestPatternDescription] (
    [tpd_Id] int NOT NULL PRIMARY KEY,
    [tpd_vtp_TestPatternId] int NOT NULL
);

CREATE TABLE [HumphreyTestStrategy] (
    [vts_Id] int NOT NULL PRIMARY KEY,
    [vts_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [HumphreyTestStrategyDescription] (
    [tsd_Id] int NOT NULL PRIMARY KEY,
    [tsd_vts_TestStrategyId] int NOT NULL
);

CREATE TABLE [IdentifierType] (
    [idt_id] int NOT NULL PRIMARY KEY,
    [idt_description] nvarchar(100),
    [idt_HintText] nvarchar(400)
);

CREATE TABLE [Image] (
    [Id] int NOT NULL PRIMARY KEY,
    [Name] varchar(255) NOT NULL,
    [Data] varbinary(-1) NOT NULL
);

CREATE TABLE [ImageQuality] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(50) NOT NULL
);

CREATE TABLE [ImageType] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL,
    [MimeTypeId] int NOT NULL
);

CREATE TABLE [Incision] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [indicationprocedurelist] (
    [ipi_id] int NOT NULL PRIMARY KEY,
    [ipi_cfd_id] int NOT NULL,
    [ipi_order] int NOT NULL
);

CREATE TABLE [indicationprocedurelistitem] (
    [ili_id] int NOT NULL PRIMARY KEY,
    [ili_ipi_id] int NOT NULL,
    [ili_pqi_id] int,
    [ili_order] int NOT NULL
);

CREATE TABLE [indicationprocedurelistitemlog] (
    [ili_objectId] int NOT NULL,
    [ili_id] int NOT NULL PRIMARY KEY,
    [ili_ipi_id] int NOT NULL,
    [ili_pro_id] int NOT NULL,
    [ili_pqi_id] int,
    [ili_order] int NOT NULL,
    [ili_dateadded] datetime NOT NULL,
    [ili_addedby] uniqueidentifier NOT NULL,
    [ili_transactionid] uniqueidentifier NOT NULL,
    [ili_action] char(1) NOT NULL
);

CREATE TABLE [indicationprocedurelistlog] (
    [ipi_objectId] int NOT NULL,
    [ipi_id] int NOT NULL PRIMARY KEY,
    [ipi_cfd_id] int NOT NULL,
    [ipi_order] int,
    [ipi_dateadded] datetime NOT NULL,
    [ipi_addedby] uniqueidentifier NOT NULL,
    [ipi_transactionid] uniqueidentifier NOT NULL,
    [ipi_action] char(1) NOT NULL
);

CREATE TABLE [injection] (
    [ijp_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [injectionlog] (
    [ijp_ObjectId] int NOT NULL,
    [ijp_id] int NOT NULL PRIMARY KEY,
    [ijp_act_id] uniqueidentifier NOT NULL,
    [ijp_bod_id] int NOT NULL,
    [ijp_lks_id_preparationmethod] int,
    [ijp_conjunctivadisplaced] bit NOT NULL,
    [ijp_entryfromlimbus] decimal(18, 2),
    [ijp_lks_id_needleangle] int,
    [ijp_actap] bit NOT NULL,
    [ijp_craperfused] bit NOT NULL,
    [ijp_abletocf] bit NOT NULL,
    [ijp_clockhours] varchar(255),
    [ijp_lks_id_injectioncategory] int,
    [ijp_previousnumberofinjections] int,
    [ijp_previousnumberofinjectionsunknown] bit,
    [ijp_previousnumberofinjectionscalculated] int,
    [ijp_DateAdded] datetime NOT NULL,
    [ijp_AddedBy] uniqueidentifier NOT NULL,
    [ijp_TransactionId] uniqueidentifier NOT NULL,
    [ijp_Action] char(1) NOT NULL,
    [ijp_batchnumber] varchar(20),
    [ijp_expirydate] uniqueidentifier
);

CREATE TABLE [injectionnumberingcategorydetail] (
    [icd_id] int NOT NULL PRIMARY KEY,
    [icd_previousnumberofinjectionsunknown] bit NOT NULL,
    [icd_previousnumberofinjectionstotal] int,
    [icd_previousnumberofinjectionscalculated] int NOT NULL
);

CREATE TABLE [injectionnumberingcategorydetaillog] (
    [icd_ObjectId] int NOT NULL,
    [icd_id] int NOT NULL PRIMARY KEY,
    [icd_ijp_id] int,
    [icd_lks_id_injectioncategory] int,
    [icd_previousnumberofinjectionsunknown] bit NOT NULL,
    [icd_previousnumberofinjectionstotal] int,
    [icd_previousnumberofinjectionscalculated] int NOT NULL,
    [icd_DateAdded] datetime NOT NULL,
    [icd_AddedBy] uniqueidentifier NOT NULL,
    [icd_TransactionId] uniqueidentifier NOT NULL,
    [icd_Action] char(1) NOT NULL
);

CREATE TABLE [injectionnumberingdetail] (
    [pin_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [injectionnumberingdetaillog] (
    [pin_ObjectId] int NOT NULL,
    [pin_id] int NOT NULL PRIMARY KEY,
    [pin_ijp_id] int NOT NULL,
    [pin_pqg_id] int NOT NULL,
    [pin_previousnumberunknown] bit NOT NULL,
    [pin_previousnumber] int,
    [pin_displayorder] int NOT NULL,
    [pin_calculated] bit,
    [pin_DateAdded] datetime NOT NULL,
    [pin_AddedBy] uniqueidentifier NOT NULL,
    [pin_TransactionId] uniqueidentifier NOT NULL,
    [pin_Action] char(1) NOT NULL
);

CREATE TABLE [InjectionPlanningActivity] (
    [ipa_id] int NOT NULL PRIMARY KEY,
    [ipa_IsReview] bit NOT NULL
);

CREATE TABLE [InjectionPlanningActivityLog] (
    [ipa_ObjectId] int NOT NULL,
    [ipa_id] int NOT NULL PRIMARY KEY,
    [ipa_act_id] uniqueidentifier NOT NULL,
    [ipa_bod_id] int NOT NULL,
    [ipa_scenario] int NOT NULL,
    [ipa_itp_id] int NOT NULL,
    [ipa_injecttoday] int,
    [ipa_injectprotocoldrug] int,
    [ipa_continueasplanned] int,
    [ipa_continueprotocol] int,
    [ipa_donotinjecttodayreason] int,
    [ipa_plandeferscope] int,
    [ipa_lks_id_plandeferintervaltype] int,
    [ipa_plandeferinterval] int,
    [ipa_plandeferdate] datetime,
    [ipa_plandeferapplytoallinjections] bit NOT NULL,
    [ipa_continuewithprotocolintervaltype] int,
    [ipa_continuewithprotocolinterval] int,
    [ipa_DateAdded] datetime NOT NULL,
    [ipa_AddedBy] uniqueidentifier NOT NULL,
    [ipa_TransactionId] uniqueidentifier NOT NULL,
    [ipa_Action] char(1) NOT NULL,
    [ipa_ongoingplandisplaytext] nvarchar(510),
    [ipa_currentinjectiondisplaytext] nvarchar(510),
    [ipa_intendedintervaldisplaytext] nvarchar(510),
    [ipa_timeelapseddisplaytext] nvarchar(510),
    [ipa_lpe_id] int,
    [ipa_timeelapsed] bit,
    [ipa_intendedinterval] int,
    [ipa_IsReview] bit NOT NULL
);

CREATE TABLE [InsertionDonorPositioning] (
    [DonorInsertionId] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [DonorPositioningId] int NOT NULL PRIMARY KEY,
    [DonorPositioningId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [InsertionDonorPositioningLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [DonorPositioningId] int,
    [DonorPositioningId] int NOT NULL
);

CREATE TABLE [InstallationHistory] (
    [Id] int NOT NULL PRIMARY KEY,
    [PackageTypeId] int,
    [Description] nvarchar(500),
    [Version] int,
    [PublishedDate] datetime,
    [PublishedBy] nvarchar(200),
    [StartDateTime] datetime NOT NULL,
    [EndDateTime] datetime NOT NULL,
    [Success] bit NOT NULL,
    [Message] nvarchar(8000)
);

CREATE TABLE [interfacedata] (
    [itd_id] int NOT NULL PRIMARY KEY,
    [itd_mim_id] int NOT NULL,
    [itd_data] varbinary(-1)
);

CREATE TABLE [InterfaceDevice] (
    [sid_id] int NOT NULL PRIMARY KEY,
    [sid_deviceName] nvarchar(510) NOT NULL,
    [sid_active] bit NOT NULL,
    [sid_baudRate] int NOT NULL,
    [sid_dataBits] int NOT NULL,
    [sid_parity] int NOT NULL,
    [sid_stopBits] int NOT NULL,
    [sid_handshake] int NOT NULL,
    [sid_comPortSetting] int NOT NULL,
    [sid_svu_id] int,
    [sid_validateChecksum] bit NOT NULL,
    [sid_DtrEnable] bit NOT NULL,
    [sid_requiresVisualAcuityUnit] bit NOT NULL,
    [sid_ShouldImportSubjectiveIfZero] bit,
    [sid_ShouldImportSubjectiveIfEqualToAutoRefraction] bit,
    [sid_ShouldImportSubjectiveIfEqualToFocimetry] bit,
    [sid_lks_KeratometerId] int,
    [sid_RtsEnable] bit NOT NULL,
    [sid_RtsEnableSimple] bit NOT NULL,
    [sid_NidekHandshakeEnable] bit NOT NULL
);

CREATE TABLE [InterfaceDeviceCommunicationRule] (
    [dcr_id] int NOT NULL PRIMARY KEY,
    [dcr_sdr_id] int NOT NULL,
    [dcr_ruleactive] bit NOT NULL,
    [dcr_rulevalue] int
);

CREATE TABLE [interfacedevicemetadata] (
    [idm_id] int NOT NULL PRIMARY KEY,
    [idm_ity_id] int NOT NULL,
    [idm_deviceserialnumber] nvarchar(510),
    [idm_loc_id] uniqueidentifier
);

CREATE TABLE [interfacedevicemetadatalog] (
    [idm_ObjectId] int NOT NULL,
    [idm_id] int NOT NULL PRIMARY KEY,
    [idm_ity_id] int NOT NULL,
    [idm_deviceserialnumber] nvarchar(510),
    [idm_loc_id] uniqueidentifier,
    [idm_DateAdded] datetime NOT NULL,
    [idm_AddedBy] uniqueidentifier NOT NULL,
    [idm_TransactionId] uniqueidentifier NOT NULL,
    [idm_Action] char(1) NOT NULL
);

CREATE TABLE [interfaceevent] (
    [iel_id] int NOT NULL PRIMARY KEY,
    [iel_ity_id] int,
    [iel_use_id] uniqueidentifier,
    [iel_host] nvarchar(510),
    [iel_loc_id] uniqueidentifier,
    [iel_message] nvarchar(MAX)
);

CREATE TABLE [interfacepatientmatchcategory] (
    [pmc_id] int NOT NULL PRIMARY KEY,
    [pmc_description] varchar(255)
);

CREATE TABLE [interfacepatientmatchrule] (
    [pml_id] int NOT NULL PRIMARY KEY,
    [pml_description] varchar(500),
    [pml_apiclass] varchar(255),
    [pml_rulesucceededmessage] nvarchar(510) NOT NULL,
    [pml_rulefailedmessage] nvarchar(510) NOT NULL
);

CREATE TABLE [interfacequeue] (
    [itq_id] int NOT NULL PRIMARY KEY,
    [itq_lastupdated] datetime,
    [itq_use_id] uniqueidentifier,
    [itq_loc_id] uniqueidentifier,
    [itq_ipm_id] int,
    [itq_encountervalidationresult] varchar(2000),
    [itq_devicename] varchar(255),
    [itq_filepath] varchar(500)
);

CREATE TABLE [interfacequeue_topcon_statuschanged_PJB_20201111] (
    [itq_id] int NOT NULL
);

CREATE TABLE [interfacequeuelink] (
    [iql_id] int NOT NULL PRIMARY KEY,
    [iql_itq_id_parent] int NOT NULL,
    [iql_itq_id_child] int,
    [iql_filenameparent] varchar(255),
    [iql_filenamechild] varchar(255)
);

CREATE TABLE [interfacequeuelog] (
    [itq_ObjectId] int NOT NULL,
    [itq_id] int NOT NULL PRIMARY KEY,
    [itq_datecreated] datetime,
    [itq_status] int,
    [itq_lastupdated] datetime,
    [itq_use_id] uniqueidentifier,
    [itq_loc_id] uniqueidentifier,
    [itq_ect_id] uniqueidentifier,
    [itq_ipm_id] int,
    [itq_encountervalidationresult] varchar(2000),
    [itq_devicename] varchar(255),
    [itq_DateAdded] datetime NOT NULL,
    [itq_AddedBy] uniqueidentifier NOT NULL,
    [itq_TransactionId] uniqueidentifier NOT NULL,
    [itq_Action] char(1) NOT NULL,
    [itq_ity_id] int,
    [itq_filepath] varchar(500),
    [itq_SourceUniqueIdentifier] nvarchar(510)
);

CREATE TABLE [InterfaceQueueOctopusFileMatching] (
    [iqo_Id] int NOT NULL PRIMARY KEY,
    [iqo_Identifier] nvarchar(400) NOT NULL,
    [iqo_pat_PatientId] uniqueidentifier NOT NULL
);

CREATE TABLE [interfacetype] (
    [ity_id] int NOT NULL PRIMARY KEY,
    [ity_name] varchar(255) NOT NULL,
    [ity_queueprocesspriority] int NOT NULL,
    [ity_initialqueuestatus] int NOT NULL,
    [ity_parentInterfaceType] int
);

CREATE TABLE [interfacetypepatientmatchrule] (
    [ipr_id] int NOT NULL PRIMARY KEY,
    [ipr_ity_id] int NOT NULL,
    [ipr_pml_id] int NOT NULL,
    [ipr_pmc_id] int NOT NULL,
    [ipr_categoryorder] int NOT NULL,
    [ipr_status] int NOT NULL,
    [ipr_active] bit NOT NULL,
    [ipr_interfacesubtype] int
);

CREATE TABLE [interfaceworklist] (
    [iwl_id] int NOT NULL PRIMARY KEY,
    [iwl_timestamp] datetime NOT NULL,
    [iwl_pat_id] uniqueidentifier NOT NULL,
    [iwl_ity_id] int,
    [iwl_processedfromqueue] bit
);

CREATE TABLE [Investigation] (
    [inv_id] int NOT NULL PRIMARY KEY,
    [iri_Id] int NOT NULL PRIMARY KEY,
    [pin_act_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [pin_inr_value] decimal(18, 2),
    [iri_OmitAllDevicesWhenInGroup] bit NOT NULL,
    [pin_Hcg_Id] int NOT NULL,
    [pin_uar_id] int NOT NULL,
    [inv_loc_id] uniqueidentifier NOT NULL,
    [inv_investigationstatus] int NOT NULL,
    [pin_Comments] nvarchar(1000),
    [inv_daterequested] date(3) NOT NULL,
    [inv_bod_id] int NOT NULL,
    [inv_icp_id] int NOT NULL,
    [inv_orderedby] uniqueidentifier NOT NULL
);

CREATE TABLE [InvestigationConcept] (
    [icp_id] int NOT NULL PRIMARY KEY,
    [icp_description] varchar(200),
    [icp_abbreviated] varchar(200),
    [icp_searchable] bit,
    [icp_eyerelated] bit,
    [icp_snomedid] varchar(100)
);

CREATE TABLE [InvestigationDeviceLink] (
    [irg_Id] int NOT NULL PRIMARY KEY,
    [irg_iri_id] int NOT NULL,
    [irg_ird_DeviceType] int NOT NULL
);

CREATE TABLE [InvestigationHcgResultType] (
    [Hcg_Id] int NOT NULL PRIMARY KEY,
    [hcg_Description] varchar(100) NOT NULL
);

CREATE TABLE [InvestigationItem] (
    [eip_Id] int NOT NULL PRIMARY KEY,
    [eii_eti_ItemId] int NOT NULL PRIMARY KEY,
    [eii_eit_InvestigationTypeId] int NOT NULL,
    [eip_iiv_InvestigationVersionId] int NOT NULL
);

CREATE TABLE [InvestigationItemLog] (
    [eip_Id] int NOT NULL PRIMARY KEY,
    [eii_eti_ItemId] int NOT NULL PRIMARY KEY,
    [eii_eit_InvestigationTypeId] int NOT NULL,
    [eip_ObjectId] int NOT NULL,
    [eip_DateAdded] datetime NOT NULL,
    [eip_AddedBy] uniqueidentifier NOT NULL,
    [eii_ObjectId] int NOT NULL,
    [eii_DateAdded] datetime NOT NULL,
    [eip_TransactionId] uniqueidentifier NOT NULL,
    [eip_Action] char(1) NOT NULL,
    [eii_AddedBy] uniqueidentifier NOT NULL,
    [eii_Transactionid] uniqueidentifier NOT NULL,
    [eip_iiv_InvestigationVersionId] int NOT NULL,
    [eii_Action] char(1) NOT NULL
);

CREATE TABLE [InvestigationItemVersion] (
    [iiv_eiv_ItemVersionId] int NOT NULL PRIMARY KEY,
    [iiv_eii_InvestigationItemId] int NOT NULL,
    [iiv_bod_BodyPartId] int NOT NULL
);

CREATE TABLE [InvestigationItemVersionLog] (
    [iiv_eiv_ItemVersionId] int NOT NULL PRIMARY KEY,
    [iiv_eii_InvestigationItemId] int NOT NULL,
    [iiv_bod_BodyPartId] int NOT NULL,
    [iiv_ObjectId] int NOT NULL,
    [iiv_DateAdded] datetime NOT NULL,
    [iiv_AddedBy] uniqueidentifier NOT NULL,
    [iiv_Transactionid] uniqueidentifier NOT NULL,
    [iiv_Action] char(1) NOT NULL
);

CREATE TABLE [InvestigationLog] (
    [inv_ObjectId] int NOT NULL,
    [pin_act_id] int NOT NULL PRIMARY KEY,
    [pin_ObjectId] uniqueidentifier,
    [pin_DateAdded] datetime NOT NULL,
    [inv_ect_id] uniqueidentifier,
    [inv_bod_id] int NOT NULL,
    [pin_AddedBy] uniqueidentifier NOT NULL,
    [pin_Transactionid] uniqueidentifier NOT NULL,
    [inv_icp_id] int NOT NULL,
    [pin_Action] char(1) NOT NULL,
    [inv_DateAdded] datetime NOT NULL,
    [inv_AddedBy] uniqueidentifier NOT NULL,
    [pin_inr_value] decimal(18, 2),
    [pin_Hcg_Id] int NOT NULL,
    [inv_TransactionId] uniqueidentifier NOT NULL,
    [inv_Action] char(1) NOT NULL,
    [pin_uar_id] int NOT NULL,
    [pin_Comments] nvarchar(1000),
    [inv_id] int NOT NULL PRIMARY KEY,
    [inv_identifier] varchar(100),
    [inv_pat_id] uniqueidentifier,
    [inv_loc_id] uniqueidentifier,
    [inv_investigationstatus] int,
    [inv_daterequested] date(3),
    [inv_orderedby] uniqueidentifier
);

CREATE TABLE [Investigations] (
    [Id] int NOT NULL PRIMARY KEY,
    [InvestigationId] int NOT NULL,
    [DefaultId] int NOT NULL
);

CREATE TABLE [InvestigationsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [InvestigationId] int NOT NULL,
    [DefaultId] int NOT NULL
);

CREATE TABLE [InvestigationStatus] (
    [ins_id] int NOT NULL PRIMARY KEY,
    [ins_description] varchar(200) NOT NULL
);

CREATE TABLE [InvestigationType] (
    [eit_id] int NOT NULL PRIMARY KEY,
    [eit_Description] nvarchar(500) NOT NULL
);

CREATE TABLE [InvestigationUrineAnalysisResultType] (
    [uar_id] int NOT NULL PRIMARY KEY,
    [uar_description] varchar(100) NOT NULL
);

CREATE TABLE [IolGUID] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [IolMasterReport] (
    [fir_ect_EncounterId] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [iolmodel] (
    [iol_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [iol_name] varchar(255) NOT NULL,
    [iol_description] varchar(255),
    [iol_available] bit NOT NULL,
    [iol_multiplerange] bit NOT NULL,
    [iol_stockitem] bit NOT NULL,
    [iol_stockpowerlow] decimal(18, 2),
    [iol_stockpowerhigh] decimal(18, 2),
    [iol_lks_id_lenstype] int,
    [iol_phakic] bit NOT NULL,
    [iol_lks_id_premiumlens] int,
    [iol_aspheric] bit NOT NULL,
    [iol_blueblocking] bit NOT NULL,
    [iol_lks_id_opticmaterial] int,
    [iol_lks_id_hapticmaterial] int,
    [iol_opticsizewidth] decimal(18, 2),
    [iol_opticsizeheight] decimal(18, 2),
    [iol_length] decimal(18, 2),
    [iol_hapticangle] decimal(18, 2),
    [iol_lks_id_opticstyle] int,
    [iol_lks_id_hapticstyle] int,
    [iol_pieces] tinyint(1),
    [iol_refractiveindex] decimal(18, 2),
    [iol_notes] nvarchar(510),
    [iol_DesignFactor] decimal(18, 2)
);

CREATE TABLE [iolmodelconstant] (
    [imc_id] int NOT NULL PRIMARY KEY,
    [imc_iol_id] uniqueidentifier NOT NULL,
    [imc_lks_id_constanttype] int NOT NULL,
    [imc_use_id] uniqueidentifier,
    [imc_aconstant] decimal(18, 2),
    [imc_sf] decimal(18, 2),
    [imc_pacd] decimal(18, 2),
    [imc_a0] decimal(18, 2),
    [imc_a1] decimal(18, 2),
    [imc_a2] decimal(18, 2),
    [imc_LensFactor] decimal(18, 2)
);

CREATE TABLE [iolmodelconstantlog] (
    [imc_ObjectId] int NOT NULL,
    [imc_id] int NOT NULL PRIMARY KEY,
    [imc_iol_id] uniqueidentifier NOT NULL,
    [imc_lks_id_constanttype] int NOT NULL,
    [imc_use_id] uniqueidentifier,
    [imc_aconstant] decimal(18, 2),
    [imc_sf] decimal(18, 2),
    [imc_pacd] decimal(18, 2),
    [imc_a0] decimal(18, 2),
    [imc_a1] decimal(18, 2),
    [imc_a2] decimal(18, 2),
    [imc_DateAdded] datetime NOT NULL,
    [imc_AddedBy] uniqueidentifier NOT NULL,
    [imc_TransactionId] uniqueidentifier NOT NULL,
    [imc_Action] char(1) NOT NULL,
    [imc_LensFactor] decimal(18, 2)
);

CREATE TABLE [iolmodellog] (
    [iol_ObjectId] uniqueidentifier NOT NULL,
    [iol_id] int NOT NULL PRIMARY KEY,
    [iol_name] varchar(255) NOT NULL,
    [iol_description] varchar(255),
    [iol_available] bit NOT NULL,
    [iol_multiplerange] bit NOT NULL,
    [iol_stockitem] bit NOT NULL,
    [iol_stockpowerlow] decimal(18, 2),
    [iol_stockpowerhigh] decimal(18, 2),
    [iol_lks_id_lenstype] int,
    [iol_phakic] bit NOT NULL,
    [iol_lks_id_premiumlens] int,
    [iol_aspheric] bit NOT NULL,
    [iol_blueblocking] bit NOT NULL,
    [iol_lks_id_opticmaterial] int,
    [iol_lks_id_hapticmaterial] int,
    [iol_opticsizewidth] decimal(18, 2),
    [iol_opticsizeheight] decimal(18, 2),
    [iol_length] decimal(18, 2),
    [iol_hapticangle] decimal(18, 2),
    [iol_lks_id_opticstyle] int,
    [iol_lks_id_hapticstyle] int,
    [iol_pieces] tinyint(1),
    [iol_refractiveindex] decimal(18, 2),
    [iol_notes] nvarchar(510),
    [iol_DateAdded] datetime NOT NULL,
    [iol_AddedBy] uniqueidentifier NOT NULL,
    [iol_TransactionId] uniqueidentifier NOT NULL,
    [iol_Action] char(1) NOT NULL,
    [iol_DesignFactor] decimal(18, 2)
);

CREATE TABLE [iolmodelrange] (
    [ilr_id] int NOT NULL PRIMARY KEY,
    [ilr_iol_id] uniqueidentifier NOT NULL,
    [ilr_range_low] decimal(18, 2) NOT NULL,
    [ilr_range_high] decimal(18, 2) NOT NULL,
    [ilr_increment] decimal(18, 2) NOT NULL
);

CREATE TABLE [iolmodelrangelog] (
    [ilr_ObjectId] int NOT NULL,
    [ilr_id] int NOT NULL PRIMARY KEY,
    [ilr_iol_id] uniqueidentifier NOT NULL,
    [ilr_range_low] decimal(18, 2) NOT NULL,
    [ilr_range_high] decimal(18, 2) NOT NULL,
    [ilr_increment] decimal(18, 2) NOT NULL,
    [ilr_DateAdded] datetime NOT NULL,
    [ilr_AddedBy] uniqueidentifier NOT NULL,
    [ilr_TransactionId] uniqueidentifier NOT NULL,
    [ilr_Action] char(1) NOT NULL
);

CREATE TABLE [iolmodelselection] (
    [ims_id] int NOT NULL PRIMARY KEY,
    [ims_bod_id] int NOT NULL,
    [ims_choseniolpower] float(8),
    [ims_iol_id] uniqueidentifier,
    [ims_lks_id_iolformula] int,
    [ims_imc_id] int,
    [ims_lks_id_constanttype] int,
    [ims_aconstant] decimal(18, 2),
    [ims_sf] decimal(18, 2),
    [ims_pacd] decimal(18, 2),
    [ims_a0] decimal(18, 2),
    [ims_a1] decimal(18, 2),
    [ims_a2] decimal(18, 2),
    [ims_targetrefraction] float(8),
    [ims_predpostopref] float(8),
    [ims_choseniolpowerdatetime] datetime,
    [ims_ExactIolPower] float(8),
    [ims_ExactIolPowerText] varchar(10),
    [ims_CalculatorVersion] varchar(20),
    [ims_ChosenIolPowerText] varchar(10),
    [ims_ChosenRefractionText] varchar(10),
    [ims_LensFactor] decimal(18, 2),
    [ims_DesignFactor] decimal(18, 2),
    [ims_ErrorDuringCalculation] bit,
    [ims_InputParametersOutOfRange] bit
);

CREATE TABLE [iolmodelselectionhistory] (
    [ish_id] int NOT NULL PRIMARY KEY,
    [ish_bod_id] int,
    [ish_choseniolpower] float(8),
    [ish_dateselected] datetime,
    [ish_use_id_selectedby] uniqueidentifier,
    [ish_iol_id] uniqueidentifier,
    [ish_predictedrefraction] float(8),
    [ish_ChosenIolPowerText] varchar(10),
    [ish_ChosenRefractionText] varchar(10),
    [ish_CalculatorVersion] varchar(20)
);

CREATE TABLE [iolmodelselectionlog] (
    [ims_ObjectId] int NOT NULL,
    [ims_id] int NOT NULL PRIMARY KEY,
    [ims_act_id] uniqueidentifier NOT NULL,
    [ims_bod_id] int NOT NULL,
    [ims_choseniolpower] float(8),
    [ims_iol_id] uniqueidentifier,
    [ims_lks_id_iolformula] int,
    [ims_imc_id] int,
    [ims_lks_id_constanttype] int,
    [ims_aconstant] decimal(18, 2),
    [ims_sf] decimal(18, 2),
    [ims_pacd] decimal(18, 2),
    [ims_a0] decimal(18, 2),
    [ims_a1] decimal(18, 2),
    [ims_a2] decimal(18, 2),
    [ims_targetrefraction] float(8),
    [ims_predpostopref] float(8),
    [ims_DateAdded] datetime NOT NULL,
    [ims_AddedBy] uniqueidentifier NOT NULL,
    [ims_TransactionId] uniqueidentifier NOT NULL,
    [ims_Action] char(1) NOT NULL,
    [ims_choseniolpowerdatetime] datetime,
    [ims_ExactIolPower] float(8),
    [ims_ExactIolPowerText] varchar(10),
    [ims_CalculatorVersion] varchar(20),
    [ims_ChosenIolPowerText] varchar(10),
    [ims_ChosenRefractionText] varchar(10),
    [ims_LensFactor] decimal(18, 2),
    [ims_DesignFactor] decimal(18, 2),
    [ims_ErrorDuringCalculation] bit,
    [ims_InputParametersOutOfRange] bit
);

CREATE TABLE [IolPowerCalculation] (
    [ipc_id] int NOT NULL PRIMARY KEY,
    [ipc_IolPower] float(8) NOT NULL,
    [ipc_IolPowerText] varchar(10) NOT NULL,
    [ipc_Refraction] float(8) NOT NULL,
    [ipc_RefractionText] varchar(10) NOT NULL,
    [ipc_ClosestToTarget] bit NOT NULL
);

CREATE TABLE [IolPowerCalculationLog] (
    [ipc_ObjectId] int NOT NULL,
    [ipc_id] int NOT NULL PRIMARY KEY,
    [ipc_ims_id] int NOT NULL,
    [ipc_IolPower] float(8) NOT NULL,
    [ipc_IolPowerText] varchar(10) NOT NULL,
    [ipc_Refraction] float(8) NOT NULL,
    [ipc_RefractionText] varchar(10) NOT NULL,
    [ipc_ClosestToTarget] bit NOT NULL,
    [ipc_DateAdded] datetime NOT NULL,
    [ipc_AddedBy] uniqueidentifier NOT NULL,
    [ipc_TransactionId] uniqueidentifier NOT NULL,
    [ipc_Action] char(1) NOT NULL
);

CREATE TABLE [IopTarget] (
    [iot_id] int NOT NULL PRIMARY KEY,
    [iot_pat_id] uniqueidentifier NOT NULL,
    [iot_bod_id] int NOT NULL,
    [iot_value] decimal(18, 2),
    [iot_valuetype] int,
    [iot_current] bit NOT NULL,
    [iot_daterecorded] datetime
);

CREATE TABLE [iopvalue] (
    [iop_id] int NOT NULL PRIMARY KEY,
    [iop_bod_id] int NOT NULL,
    [iop_value] decimal(18, 2),
    [iop_valuetype] int,
    [iop_lks_id_reliability] int,
    [iop_lks_id_method] int,
    [iop_pdt_historicdate] uniqueidentifier,
    [iop_time] time(5),
    [iop_mode] int,
    [iop_lks_id_medicationstatus] int,
    [iop_lks_id_status] int,
    [iop_deleted] bit
);

CREATE TABLE [iopvaluelog] (
    [iop_ObjectId] int NOT NULL,
    [iop_id] int NOT NULL PRIMARY KEY,
    [iop_act_id] uniqueidentifier NOT NULL,
    [iop_bod_id] int NOT NULL,
    [iop_value] decimal(18, 2),
    [iop_valuetype] int,
    [iop_lks_id_reliability] int,
    [iop_lks_id_method] int,
    [iop_pdt_historicdate] uniqueidentifier,
    [iop_time] time(5),
    [iop_mode] int,
    [iop_lks_id_medicationstatus] int,
    [iop_lks_id_status] int,
    [iop_DateAdded] datetime NOT NULL,
    [iop_AddedBy] uniqueidentifier NOT NULL,
    [iop_TransactionId] uniqueidentifier NOT NULL,
    [iop_Action] char(1) NOT NULL,
    [iop_deleted] bit
);

CREATE TABLE [IORecession] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [LocationRecessedToColumn] int,
    [SutureId] int,
    [LocationRecessedToRow] int,
    [SutureId] int
);

CREATE TABLE [IORecessionLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [SutureId] int,
    [LocationRecessedToColumn] int,
    [LocationRecessedToRow] int,
    [SutureId] int
);

CREATE TABLE [Item] (
    [eti_id] int NOT NULL PRIMARY KEY,
    [eti_Description] nvarchar(2000) NOT NULL,
    [eti_eci_ItemTypeId] int NOT NULL,
    [eti_UniqueKey] uniqueidentifier NOT NULL
);

CREATE TABLE [ItemLog] (
    [eti_id] int NOT NULL PRIMARY KEY,
    [eti_ObjectId] int NOT NULL,
    [eti_DateAdded] datetime NOT NULL,
    [eti_AddedBy] uniqueidentifier NOT NULL,
    [eti_TransactionId] uniqueidentifier NOT NULL,
    [eti_Action] char(1) NOT NULL,
    [eti_Description] nvarchar(2000) NOT NULL,
    [eti_eci_ItemTypeId] int NOT NULL,
    [eti_UniqueKey] uniqueidentifier
);

CREATE TABLE [ItemRelative] (
    [hir_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ItemType] (
    [eci_id] int NOT NULL PRIMARY KEY,
    [eci_Description] nvarchar(200) NOT NULL,
    [eci_IsQuestion] bit NOT NULL
);

CREATE TABLE [ItemTypeResponse] (
    [atr_eci_ItemTypeId] int NOT NULL PRIMARY KEY,
    [atr_aqr_QuestionResponseId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ItemVersion] (
    [eiv_id] int NOT NULL PRIMARY KEY,
    [eiv_Description] nvarchar(2000) NOT NULL,
    [eiv_eci_ItemTypeId] int NOT NULL,
    [eiv_eti_PreviousItemId] int,
    [eiv_eti_ParentItemId] int
);

CREATE TABLE [ItemVersionLog] (
    [eiv_id] int NOT NULL PRIMARY KEY,
    [eiv_ObjectId] int NOT NULL,
    [eiv_DateAdded] datetime NOT NULL,
    [eiv_AddedBy] uniqueidentifier NOT NULL,
    [eiv_TransactionId] uniqueidentifier NOT NULL,
    [eiv_Action] char(1) NOT NULL,
    [eiv_eti_ItemId] int NOT NULL,
    [eiv_Description] nvarchar(2000) NOT NULL,
    [eiv_eci_ItemTypeId] int NOT NULL,
    [eiv_Version] int,
    [eiv_eti_PreviousItemId] int,
    [eiv_eti_ParentItemId] int
);

CREATE TABLE [IVIType] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(512) NOT NULL
);

CREATE TABLE [IVITypeChartConfiguration] (
    [Id] int NOT NULL PRIMARY KEY,
    [IVITypeId] int NOT NULL,
    [AddChart] bit NOT NULL,
    [ChartLabelDescription] nvarchar(512),
    [ChartColor] varchar(256)
);

CREATE TABLE [IVITypeChartSeriesDataConfiguration] (
    [Id] int NOT NULL PRIMARY KEY,
    [IVITypeId] int NOT NULL,
    [PaneId] int NOT NULL,
    [ChartSeriesPointValue] decimal(18, 2),
    [ChartSeriesColor] varchar(256)
);

CREATE TABLE [keratometry] (
    [kty_id] int NOT NULL PRIMARY KEY,
    [kty_bod_id] int NOT NULL,
    [kty_lks_id_keratometer] int,
    [kty_k1mm] float(8),
    [kty_k1dioptres] float(8),
    [kty_k1meridian] float(8),
    [kty_k2mm] float(8),
    [kty_k2dioptres] float(8),
    [kty_k2meridian] float(8),
    [kty_meankdioptres] float(8),
    [kty_meankmm] float(8),
    [kty_wtwcornealdiameter] float(8),
    [kty_keratometricindex] float(8),
    [kty_originalnotation] int
);

CREATE TABLE [keratometrylog] (
    [kty_ObjectId] int NOT NULL,
    [kty_id] int NOT NULL PRIMARY KEY,
    [kty_act_id] uniqueidentifier NOT NULL,
    [kty_bod_id] int NOT NULL,
    [kty_lks_id_keratometer] int,
    [kty_k1mm] float(8),
    [kty_k1dioptres] float(8),
    [kty_k1meridian] float(8),
    [kty_k2mm] float(8),
    [kty_k2dioptres] float(8),
    [kty_k2meridian] float(8),
    [kty_meankdioptres] float(8),
    [kty_meankmm] float(8),
    [kty_wtwcornealdiameter] float(8),
    [kty_keratometricindex] float(8),
    [kty_DateAdded] datetime NOT NULL,
    [kty_AddedBy] uniqueidentifier NOT NULL,
    [kty_TransactionId] uniqueidentifier NOT NULL,
    [kty_Action] char(1) NOT NULL,
    [kty_originalnotation] int
);

CREATE TABLE [KetoneData] (
    [ukt_id] int NOT NULL PRIMARY KEY,
    [ukt_available] bit NOT NULL
);

CREATE TABLE [LanguageCode] (
    [LanguageCodeId] int NOT NULL PRIMARY KEY,
    [DecimalSeparatorOverride] nvarchar(10)
);

CREATE TABLE [languages] (
    [Code] varchar(50),
    [Interpreter language] varchar(255)
);

CREATE TABLE [laser] (
    [las_id] int NOT NULL PRIMARY KEY,
    [las_act_id] uniqueidentifier,
    [las_bod_id] int,
    [las_lks_id_instrument] int,
    [las_wavelength] int,
    [las_variable] bit,
    [las_powermin] int,
    [las_powermax] int,
    [las_durationmin] int,
    [las_durationmax] int,
    [las_lks_id_burnintensity] int,
    [las_lat_id] int,
    [las_lks_id_colour] int,
    [las_firstprp] int,
    [las_othercomments] nvarchar(4000),
    [las_iscontinuous] bit NOT NULL,
    [las_areatreatedfull] bit,
    [las_areatreatedpartialclockhours] int,
    [las_areatreatedcomments] nvarchar(4000)
);

CREATE TABLE [laserdelivery] (
    [lsd_id] int NOT NULL PRIMARY KEY,
    [lsd_las_id] int NOT NULL,
    [lsd_lks_id_lens] int,
    [lsd_spotsize] int,
    [lsd_burns] int,
    [lsd_order] int NOT NULL,
    [lsd_isdeleted] bit NOT NULL
);

CREATE TABLE [laserdeliverylog] (
    [lsd_ObjectId] int NOT NULL,
    [lsd_id] int NOT NULL PRIMARY KEY,
    [lsd_las_id] int NOT NULL,
    [lsd_lks_id_lens] int,
    [lsd_burns] int,
    [lsd_order] int NOT NULL,
    [lsd_isdeleted] bit NOT NULL,
    [lsd_DateAdded] datetime NOT NULL,
    [lsd_AddedBy] uniqueidentifier NOT NULL,
    [lsd_TransactionId] uniqueidentifier NOT NULL,
    [lsd_Action] char(1) NOT NULL,
    [lsd_spotsize] int
);

CREATE TABLE [laserlog] (
    [las_ObjectId] int NOT NULL,
    [las_id] int NOT NULL PRIMARY KEY,
    [las_act_id] uniqueidentifier,
    [las_bod_id] int,
    [las_lks_id_instrument] int,
    [las_wavelength] int,
    [las_variable] bit,
    [las_powermin] int,
    [las_powermax] int,
    [las_durationmin] int,
    [las_durationmax] int,
    [las_lks_id_burnintensity] int,
    [las_lat_id] int,
    [las_firstprp] int,
    [las_DateAdded] datetime NOT NULL,
    [las_AddedBy] uniqueidentifier NOT NULL,
    [las_TransactionId] uniqueidentifier NOT NULL,
    [las_Action] char(1) NOT NULL,
    [las_lks_id_colour] int,
    [las_othercomments] nvarchar(4000),
    [las_iscontinuous] bit,
    [las_areatreatedfull] bit,
    [las_areatreatedpartialclockhours] int,
    [las_areatreatedcomments] nvarchar(4000)
);

CREATE TABLE [lasersurgerytype] (
    [lat_id] int NOT NULL PRIMARY KEY,
    [lat_description] varchar(255) NOT NULL
);

CREATE TABLE [lasersurgerytypelog] (
    [lat_ObjectId] int NOT NULL,
    [lat_id] int NOT NULL PRIMARY KEY,
    [lat_description] varchar(255) NOT NULL,
    [lat_DateAdded] datetime NOT NULL,
    [lat_AddedBy] uniqueidentifier NOT NULL,
    [lat_TransactionId] uniqueidentifier NOT NULL,
    [lat_Action] char(1) NOT NULL
);

CREATE TABLE [lasersurgerytypeprocedures] (
    [lap_id] int NOT NULL PRIMARY KEY,
    [lap_lat_id] int NOT NULL,
    [lap_pro_id] int NOT NULL,
    [lap_pqi_id] int
);

CREATE TABLE [lasersurgerytypeprocedureslog] (
    [lap_ObjectId] int NOT NULL,
    [lap_id] int NOT NULL PRIMARY KEY,
    [lap_lat_id] int NOT NULL,
    [lap_pro_id] int NOT NULL,
    [lap_pqi_id] int,
    [lap_DateAdded] datetime NOT NULL,
    [lap_AddedBy] uniqueidentifier NOT NULL,
    [lap_TransactionId] uniqueidentifier NOT NULL,
    [lap_Action] char(1) NOT NULL
);

CREATE TABLE [LaserTrabeculoplasty] (
    [dlt_sdf_id] int NOT NULL PRIMARY KEY,
    [glt_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [glt_ProcedureType_LookupDataId] int NOT NULL,
    [dlt_Instrument_LookupDataId] int,
    [dlt_GonioLens_LookupDataId] int,
    [glt_Instrument_LookupDataId] int NOT NULL,
    [glt_GonioLens_LookupDataId] int,
    [dlt_RightEyeDegreesTreated] int,
    [dlt_RightEyePositionFrom] int,
    [glt_BodyPartId] int NOT NULL,
    [glt_Sparing] bit NOT NULL,
    [dlt_RightEyePositionTo] int,
    [dlt_RightEyeSparing] bit NOT NULL,
    [glt_NumberOfLaserSpots] int,
    [glt_TissueReactionObserved] bit,
    [dlt_LeftEyeDegreesTreated] int,
    [dlt_LeftEyePositionFrom] int,
    [glt_DegreesTreated] int,
    [glt_FromPosition] int,
    [dlt_LeftEyePositionTo] int,
    [dlt_LeftEyeSparing] bit NOT NULL,
    [glt_ToPosition] int,
    [glt_TissueReactionObservedComments] nvarchar(500)
);

CREATE TABLE [LaserTrabeculoplastyLog] (
    [glt_ActivityId] int NOT NULL PRIMARY KEY,
    [dlt_sdf_id] int NOT NULL PRIMARY KEY,
    [dlt_ObjectId] int NOT NULL,
    [glt_ObjectId] uniqueidentifier NOT NULL,
    [glt_DateAdded] datetime NOT NULL,
    [dlt_DateAdded] datetime NOT NULL,
    [dlt_AddedBy] uniqueidentifier NOT NULL,
    [glt_AddedBy] uniqueidentifier NOT NULL,
    [glt_Transactionid] uniqueidentifier NOT NULL,
    [dlt_Transactionid] uniqueidentifier NOT NULL,
    [dlt_Action] char(1) NOT NULL,
    [glt_Action] char(1) NOT NULL,
    [glt_ProcedureType_LookupDataId] int NOT NULL,
    [dlt_Instrument_LookupDataId] int,
    [dlt_GonioLens_LookupDataId] int,
    [glt_Instrument_LookupDataId] int NOT NULL,
    [glt_GonioLens_LookupDataId] int,
    [dlt_RightEyeDegreesTreated] int,
    [dlt_RightEyePositionFrom] int,
    [glt_BodyPartId] int NOT NULL,
    [glt_Sparing] bit NOT NULL,
    [dlt_RightEyePositionTo] int,
    [dlt_RightEyeSparing] bit NOT NULL,
    [glt_NumberOfLaserSpots] int,
    [glt_TissueReactionObserved] bit,
    [dlt_LeftEyeDegreesTreated] int,
    [dlt_LeftEyePositionFrom] int,
    [glt_DegreesTreated] int,
    [glt_FromPosition] int,
    [dlt_LeftEyePositionTo] int,
    [dlt_LeftEyeSparing] bit NOT NULL,
    [glt_ToPosition] int,
    [glt_TissueReactionObservedComments] nvarchar(500)
);

CREATE TABLE [LateralisedDiabeticEyeScreening] (
    [Id] int NOT NULL PRIMARY KEY,
    [BodyPartId] int NOT NULL,
    [RetinopathyGrade] int,
    [MaculopathyGrade] int,
    [PhotocoagulationGrade] int,
    [ImageQuality] int,
    [Ungradable] bit NOT NULL
);

CREATE TABLE [LateralisedDiabeticEyeScreeningFeature] (
    [Id] int NOT NULL PRIMARY KEY,
    [FeatureId] int NOT NULL
);

CREATE TABLE [LateralisedDiabeticEyeScreeningOtherCondition] (
    [Id] int NOT NULL PRIMARY KEY,
    [Code] int,
    [Condition] nvarchar(MAX)
);

CREATE TABLE [LateralisedRiskFactors] (
    [plf_Id] int NOT NULL PRIMARY KEY,
    [plf_IsFirstEye] bit,
    [plf_lks_PupilSizeId] int,
    [plf_ect_PreviousSurgeryEncounterId] uniqueidentifier,
    [plf_PreviousSurgeryProceduresDescription] nvarchar(MAX),
    [plf_PreviousSurgeryOperativeComplicationsDescription] nvarchar(MAX)
);

CREATE TABLE [LateralisedVisualAcuity] (
    [Id] int NOT NULL PRIMARY KEY,
    [Value] nvarchar(510) NOT NULL,
    [CorrectionId] int NOT NULL,
    [NotationId] int NOT NULL
);

CREATE TABLE [LateralizedRiskScore] (
    [Id] int NOT NULL PRIMARY KEY,
    [RiskScoreId] int,
    [Comments] nvarchar(1000)
);

CREATE TABLE [LateralizedRiskScoreLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ActivityId] uniqueidentifier NOT NULL,
    [BodyPartId] int NOT NULL,
    [RiskScoreId] int,
    [Comments] nvarchar(1000)
);

CREATE TABLE [LatestObservation] (
    [dob_id] int NOT NULL PRIMARY KEY,
    [dob_act_id] uniqueidentifier NOT NULL,
    [dob_DateRecorded] datetime NOT NULL,
    [dob_EncounterTypeId] int NOT NULL,
    [dob_TimeRecorded] time(5)
);

CREATE TABLE [LatestObservationLog] (
    [dob_id] int NOT NULL PRIMARY KEY,
    [dob_ObjectId] int NOT NULL,
    [dob_DateAdded] datetime NOT NULL,
    [dob_AddedBy] uniqueidentifier NOT NULL,
    [dob_Transactionid] uniqueidentifier NOT NULL,
    [dob_Action] char(1) NOT NULL,
    [dob_act_id] uniqueidentifier NOT NULL,
    [dob_DateRecorded] datetime NOT NULL,
    [dob_EncounterTypeId] int NOT NULL,
    [dob_TimeRecorded] time(5)
);

CREATE TABLE [LatestObservationReading] (
    [dom_id] int NOT NULL PRIMARY KEY,
    [dom_dob_id] int NOT NULL,
    [dom_mlk_id] int NOT NULL
);

CREATE TABLE [LatestObservationReadingLog] (
    [dom_id] int NOT NULL PRIMARY KEY,
    [dom_ObjectId] int NOT NULL,
    [dom_DateAdded] datetime NOT NULL,
    [dom_AddedBy] uniqueidentifier NOT NULL,
    [dom_Transactionid] uniqueidentifier NOT NULL,
    [dom_Action] char(1) NOT NULL,
    [dom_dob_id] int NOT NULL,
    [dom_mlk_id] int NOT NULL
);

CREATE TABLE [Layout] (
    [dtl_id] tinyint(1) NOT NULL PRIMARY KEY,
    [dtl_description] nvarchar(100) NOT NULL
);

CREATE TABLE [LeucocytesData] (
    [uly_id] int NOT NULL PRIMARY KEY,
    [uly_available] bit NOT NULL
);

CREATE TABLE [LinkedPlannedEvent] (
    [lpe_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [LinkedPlannedEventLog] (
    [lpe_ObjectId] int NOT NULL,
    [lpe_id] int NOT NULL PRIMARY KEY,
    [lpe_eventnumber] int NOT NULL,
    [lpe_planneddate] datetime,
    [lpe_pes_id] int NOT NULL,
    [lpe_DateAdded] datetime NOT NULL,
    [lpe_AddedBy] uniqueidentifier NOT NULL,
    [lpe_TransactionId] uniqueidentifier NOT NULL,
    [lpe_Action] char(1) NOT NULL,
    [lpe_ppr_id] int NOT NULL,
    [lpe_tpp_id] int,
    [lpe_ActionedDate] datetime,
    [lpe_ppr_id_associatedevent] int,
    [lpe_createddate] datetime,
    [lpe_associatedeventdateoverride] datetime,
    [lpe_originalplanneddatetime] datetime
);

CREATE TABLE [LinkedPlannedEventStatus] (
    [pes_id] int NOT NULL PRIMARY KEY,
    [pes_description] nvarchar(400)
);

CREATE TABLE [listactivity] (
    [lac_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [listactivitylog] (
    [lac_ObjectId] int NOT NULL,
    [lac_id] int NOT NULL PRIMARY KEY,
    [lac_act_id] uniqueidentifier NOT NULL,
    [lac_lqs_id] int NOT NULL,
    [lac_pdt_id] uniqueidentifier NOT NULL,
    [lac_ect_id_operation] uniqueidentifier,
    [lac_DateAdded] datetime NOT NULL,
    [lac_AddedBy] uniqueidentifier NOT NULL,
    [lac_TransactionId] uniqueidentifier NOT NULL,
    [lac_Action] char(1) NOT NULL
);

CREATE TABLE [ListAdvancedResponseBooleanValue] (
    [nbv_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ListAdvancedResponseBooleanValueLog] (
    [nbv_Id] int NOT NULL,
    [nbv_ObjectId] int NOT NULL,
    [nbv_DateAdded] datetime NOT NULL,
    [nbv_AddedBy] uniqueidentifier NOT NULL,
    [nbv_TransactionId] uniqueidentifier NOT NULL,
    [nbv_Action] char(1) NOT NULL,
    [nbv_AdvancedResponseQuestionItemId] int NOT NULL,
    [nbv_ListResponseId] int NOT NULL,
    [nbv_Value] bit
);

CREATE TABLE [ListAdvancedResponseDataType] (
    [art_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ListAdvancedResponseQuestion] (
    [arq_id] int NOT NULL PRIMARY KEY,
    [arq_HideDefaultResponses] bit NOT NULL,
    [arq_DefaultResponseId] int,
    [arq_lks_TriggerResponseId] int
);

CREATE TABLE [ListAdvancedResponseQuestionItem] (
    [aqi_id] int NOT NULL PRIMARY KEY,
    [aqi_Label] nvarchar(400) NOT NULL,
    [aqi_art_id_DataType] int NOT NULL,
    [aqi_order] int NOT NULL
);

CREATE TABLE [ListAdvancedResponseSingleSelectComboBoxValue] (
    [scv_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ListAdvancedResponseSingleSelectComboBoxValueLog] (
    [scv_Id] int NOT NULL PRIMARY KEY,
    [scv_ObjectId] int NOT NULL,
    [scv_DateAdded] datetime NOT NULL,
    [scv_AddedBy] uniqueidentifier NOT NULL,
    [scv_TransactionId] uniqueidentifier NOT NULL,
    [scv_Action] char(1) NOT NULL,
    [scv_AdvancedResponseQuestionItemId] int NOT NULL,
    [scv_ListResponseId] int NOT NULL
);

CREATE TABLE [ListAdvancedResponseTimeSpanValue] (
    [ard_id] int NOT NULL PRIMARY KEY,
    [ard_Value] time(5) NOT NULL
);

CREATE TABLE [ListAdvancedResponseTimeSpanValueLog] (
    [ard_id] int NOT NULL PRIMARY KEY,
    [ard_ObjectId] int NOT NULL,
    [ard_DateAdded] datetime NOT NULL,
    [ard_AddedBy] uniqueidentifier NOT NULL,
    [ard_Transactionid] uniqueidentifier NOT NULL,
    [ard_Action] char(1) NOT NULL,
    [ard_aqi_id] int NOT NULL,
    [ard_lrp_id] int NOT NULL,
    [ard_Value] time(5) NOT NULL
);

CREATE TABLE [listclinicalconceptquestion] (
    [lcq_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [listclinicalconceptquestion_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [lcq_id] int NOT NULL,
    [lcq_lqu_id] int NOT NULL,
    [lcq_cpt_id] int NOT NULL
);

CREATE TABLE [listdrugfamilyquestion] (
    [ldf_id] int NOT NULL PRIMARY KEY,
    [ldf_dfy_id] int NOT NULL
);

CREATE TABLE [listdrugfamilyquestion_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [ldf_id] int NOT NULL,
    [ldf_lqu_id] int NOT NULL,
    [ldf_dfy_id] int NOT NULL
);

CREATE TABLE [listdrugsetquestion] (
    [ldq_id] int NOT NULL PRIMARY KEY,
    [ldq_drs_id] int NOT NULL
);

CREATE TABLE [listdrugsetquestion_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [ldq_id] int NOT NULL,
    [ldq_lqu_id] int NOT NULL,
    [ldq_drs_id] int NOT NULL
);

CREATE TABLE [listlookupquestion] (
    [llq_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [listlookupquestion_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [llq_id] int NOT NULL,
    [llq_lqu_id] int NOT NULL,
    [llq_lks_id] int NOT NULL
);

CREATE TABLE [ListLookupQuestion_Backup_Patch702] (
    [llq_id] int NOT NULL,
    [llq_lqu_id] int NOT NULL,
    [llq_lks_id] int NOT NULL
);

CREATE TABLE [listmedicationquestion] (
    [lmq_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [listmedicationquestion_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [lmq_id] int NOT NULL,
    [lmq_lqu_id] int NOT NULL,
    [lmq_dmy_id] int NOT NULL
);

CREATE TABLE [ListMedicationQuestionDuplicateMedicationRemovalBackup] (
    [lmq_id] int NOT NULL PRIMARY KEY,
    [lmq_lqu_id] int NOT NULL,
    [lmq_dmy_id] int NOT NULL
);

CREATE TABLE [ListPatient] (
    [lpc_id] int NOT NULL PRIMARY KEY,
    [lpc_arrival_time] time(5),
    [lpc_ppr_id] int
);

CREATE TABLE [ListPatientLog] (
    [lpc_id] int NOT NULL PRIMARY KEY,
    [lpc_ObjectId] int NOT NULL,
    [lpc_DateAdded] datetime NOT NULL,
    [lpc_AddedBy] uniqueidentifier NOT NULL,
    [lpc_Transactionid] uniqueidentifier NOT NULL,
    [lpc_Action] char(1) NOT NULL,
    [lpc_pat_id] uniqueidentifier NOT NULL,
    [lpc_plc_id] int NOT NULL,
    [lpc_arrival_time] time(5),
    [lpc_ppr_id] int
);

CREATE TABLE [listquestion] (
    [lqu_id] int NOT NULL PRIMARY KEY,
    [lqu_lkt_answeroptions] int NOT NULL,
    [lqu_tooltiptext] nvarchar(510),
    [lqu_order] int NOT NULL,
    [lqu_mandatory] bit NOT NULL,
    [lqu_structural] int,
    [lqu_exclusive] bit,
    [lqu_other] bit,
    [lqu_noneoption] bit,
    [lqu_lks_id_highlight] int,
    [lqu_pullthrough] bit,
    [lqu_currenttag] bit,
    [lqu_legacy] bit,
    [lqu_membership] int,
    [lqu_lks_id_pullthrough_onresponse] int,
    [lqu_displaytype] int NOT NULL,
    [lqu_CustomQuestionText] nvarchar(510)
);

CREATE TABLE [listquestion_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [lqu_id] int NOT NULL,
    [lqu_lqs_id] int NOT NULL,
    [lqu_lkt_answeroptions] int NOT NULL,
    [lqu_questiontext] varchar(255),
    [lqu_tooltiptext] varchar(255),
    [lqu_order] int NOT NULL,
    [lqu_mandatory] bit NOT NULL,
    [lqu_structural] int,
    [lqu_exclusive] bit,
    [lqu_other] bit,
    [lqu_noneoption] bit,
    [lqu_lookupkey] varchar(20),
    [lqu_domain] int,
    [lqu_lks_id_highlight] int,
    [lqu_available] bit,
    [lqu_pullthrough] bit,
    [lqu_currenttag] bit,
    [lqu_legacy] bit,
    [lqu_membership] int,
    [lqu_lks_id_pullthrough_onresponse] int,
    [lqu_displaytype] int NOT NULL
);

CREATE TABLE [listquestionalert] (
    [lal_id] int NOT NULL PRIMARY KEY,
    [lal_alerttext] nvarchar(MAX),
    [lal_alertonvalue] int
);

CREATE TABLE [listquestionalert_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [lal_id] int NOT NULL,
    [lal_lqu_id] nchar(20) NOT NULL,
    [lal_alerttext] varchar(MAX) NOT NULL,
    [lal_order] int NOT NULL,
    [lal_alertonvalue] int
);

CREATE TABLE [listquestioncascade] (
    [lqc_id] int NOT NULL PRIMARY KEY,
    [lqc_cascadeonvalue] int NOT NULL
);

CREATE TABLE [listquestioncascade_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [lqc_id] int NOT NULL,
    [lqc_lqu_parent] int NOT NULL,
    [lqc_lqu_child] int NOT NULL,
    [lqc_cascadeonvalue] int NOT NULL
);

CREATE TABLE [listquestionconceptmapping] (
    [lcm_id] int NOT NULL PRIMARY KEY,
    [lcm_mappingtype] int NOT NULL,
    [lcm_lqs_id] int NOT NULL,
    [lcm_lqu_id] int NOT NULL,
    [lcm_cpt_id] int,
    [lcm_cfd_id] int,
    [lcm_pro_id] int,
    [lcm_customrule] int,
    [lcm_excludeifindication] bit
);

CREATE TABLE [listquestionlog] (
    [lqu_ObjectId] int NOT NULL,
    [lqu_id] int NOT NULL PRIMARY KEY,
    [lqu_lqs_id] int NOT NULL,
    [lqu_lkt_answeroptions] int NOT NULL,
    [lqu_questiontext] nvarchar(510),
    [lqu_tooltiptext] nvarchar(510),
    [lqu_order] int NOT NULL,
    [lqu_mandatory] bit NOT NULL,
    [lqu_structural] int,
    [lqu_exclusive] bit,
    [lqu_other] bit,
    [lqu_noneoption] bit,
    [lqu_lookupkey] varchar(20),
    [lqu_domain] int,
    [lqu_lks_id_highlight] int,
    [lqu_available] bit,
    [lqu_pullthrough] bit,
    [lqu_currenttag] bit,
    [lqu_legacy] bit,
    [lqu_membership] int,
    [lqu_lks_id_pullthrough_onresponse] int,
    [lqu_displaytype] int NOT NULL,
    [lqu_DateAdded] datetime NOT NULL,
    [lqu_AddedBy] uniqueidentifier NOT NULL,
    [lqu_TransactionId] uniqueidentifier NOT NULL,
    [lqu_Action] char(1) NOT NULL,
    [lqu_unique_identifier] uniqueidentifier,
    [lqu_CustomQuestionText] nvarchar(510)
);

CREATE TABLE [ListQuestionMasterList] (
    [lqu_id] int NOT NULL,
    [lqu_lkt_answeroptions] int NOT NULL,
    [lqu_tooltiptext] nvarchar(510),
    [lqu_order] int NOT NULL,
    [lqu_mandatory] bit NOT NULL,
    [lqu_structural] int,
    [lqu_exclusive] bit,
    [lqu_other] bit,
    [lqu_noneoption] bit,
    [lqu_lookupkey] varchar(20),
    [lqu_domain] int,
    [lqu_lks_id_highlight] int,
    [lqu_available] bit,
    [lqu_pullthrough] bit,
    [lqu_currenttag] bit,
    [lqu_legacy] bit,
    [lqu_membership] int,
    [lqu_lks_id_pullthrough_onresponse] int,
    [lqu_displaytype] int
);

CREATE TABLE [listquestionset] (
    [lqs_id] int NOT NULL PRIMARY KEY,
    [lqs_bilateral] bit NOT NULL,
    [lqs_title] nvarchar(400),
    [lqs_lookupkey] nvarchar(20),
    [lqs_questiondomains] int,
    [lqs_bsm_id] int,
    [lqs_displaytype] int,
    [lqs_lkc_id] int,
    [lqs_CanAddItemsInWebUi] bit NOT NULL,
    [lqs_AvailableInWebUi] bit NOT NULL
);

CREATE TABLE [listresponse] (
    [lrp_id] int NOT NULL PRIMARY KEY,
    [lrp_responsevalue] int NOT NULL,
    [lrp_questiontext] nvarchar(510),
    [lrp_answertext] nvarchar(510),
    [lrp_key] varchar(50),
    [lrp_isdeleted] bit NOT NULL,
    [lrp_answernumber] float(8),
    [lrp_parsedtext] nvarchar(MAX),
    [lrp_freetext] nvarchar(MAX)
);

CREATE TABLE [listresponse_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [lrp_id] int NOT NULL,
    [lrp_lqu_id] int NOT NULL,
    [lrp_lac_id] int,
    [lrp_bod_id] int NOT NULL,
    [lrp_responsevalue] int NOT NULL,
    [lrp_questiontext] varchar(255) NOT NULL,
    [lrp_answertext] varchar(255) NOT NULL,
    [lrp_key] varchar(50),
    [lrp_isdeleted] bit NOT NULL,
    [lrp_answernumber] float(8),
    [lrp_parsedtext] nvarchar(MAX)
);

CREATE TABLE [listresponselog] (
    [lrp_ObjectId] int NOT NULL,
    [lrp_id] int NOT NULL PRIMARY KEY,
    [lrp_lqu_id] int NOT NULL,
    [lrp_lac_id] int,
    [lrp_bod_id] int NOT NULL,
    [lrp_responsevalue] int NOT NULL,
    [lrp_questiontext] nvarchar(510),
    [lrp_answertext] nvarchar(510),
    [lrp_key] varchar(50),
    [lrp_isdeleted] bit NOT NULL,
    [lrp_DateAdded] datetime NOT NULL,
    [lrp_AddedBy] uniqueidentifier NOT NULL,
    [lrp_TransactionId] uniqueidentifier NOT NULL,
    [lrp_Action] char(1) NOT NULL,
    [lrp_parsedtext] nvarchar(MAX),
    [lrp_answernumber] float(8),
    [lrp_freetext] nvarchar(MAX)
);

CREATE TABLE [LocalAnaestheticRoute] (
    [lar_Id] int NOT NULL PRIMARY KEY,
    [lar_Description] nvarchar(60) NOT NULL
);

CREATE TABLE [location] (
    [loc_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [loc_sit_id] uniqueidentifier NOT NULL,
    [loc_desc] nvarchar(510),
    [loc_order] int NOT NULL,
    [loc_available] bit NOT NULL,
    [loc_flag] int
);

CREATE TABLE [LocationFrom] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [LocationGUID] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [locationlog] (
    [loc_ObjectId] uniqueidentifier NOT NULL,
    [loc_id] int NOT NULL PRIMARY KEY,
    [loc_sit_id] uniqueidentifier NOT NULL,
    [loc_desc] nvarchar(510),
    [loc_order] int NOT NULL,
    [loc_available] bit NOT NULL,
    [loc_flag] int,
    [loc_DateAdded] datetime NOT NULL,
    [loc_AddedBy] uniqueidentifier NOT NULL,
    [loc_TransactionId] uniqueidentifier NOT NULL,
    [loc_Action] char(1) NOT NULL
);

CREATE TABLE [locationstolocationtype] (
    [location_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [locationtype_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [locationtype] (
    [lot_id] int NOT NULL PRIMARY KEY,
    [lot_desc] nvarchar(510),
    [lot_code] varchar(4),
    [lot_flag] int,
    [lot_defaultvisittype] int NOT NULL
);

CREATE TABLE [Lookup] (
    [csl_Id] int NOT NULL PRIMARY KEY,
    [csl_Description] nvarchar(60) NOT NULL
);

CREATE TABLE [lookupcacheresult] (
    [lcr_id] int NOT NULL PRIMARY KEY,
    [lcr_guid] uniqueidentifier NOT NULL,
    [lcr_lkt_id] int NOT NULL,
    [lcr_cache_type_id] int NOT NULL
);

CREATE TABLE [lookupcategory] (
    [lkc_id] int NOT NULL PRIMARY KEY,
    [lkc_desc] nvarchar(100),
    [lkc_image] tinyint(1)
);

CREATE TABLE [lookupcategorylog] (
    [lkc_ObjectId] int NOT NULL,
    [lkc_id] int NOT NULL PRIMARY KEY,
    [lkc_desc] nvarchar(100),
    [lkc_image] tinyint(1),
    [lkc_DateAdded] datetime NOT NULL,
    [lkc_AddedBy] uniqueidentifier NOT NULL,
    [lkc_TransactionId] uniqueidentifier NOT NULL,
    [lkc_Action] char(1) NOT NULL
);

CREATE TABLE [lookupdata] (
    [lks_id] int NOT NULL PRIMARY KEY,
    [lks_desclong] nvarchar(2000),
    [lks_descextra] nvarchar(510),
    [lks_number1] int,
    [lks_number2] int,
    [lks_number3] int,
    [lks_number4] int,
    [lks_number5] int,
    [lks_float] float(8),
    [lks_order] int NOT NULL,
    [lks_available] bit,
    [lks_fixed] int,
    [lks_interfacelookup1] nvarchar(100),
    [lks_interfacelookup2] nvarchar(100),
    [lks_interfacelookup3] varchar(50),
    [lks_membershipnumber] int,
    [lks_cpt_id] int,
    [lks_mophth_rft_id] uniqueidentifier,
    [lks_showonwebui] bit NOT NULL
);

CREATE TABLE [LookupData_Backup_Patch702] (
    [lks_id] int NOT NULL,
    [lks_code] varchar(255) NOT NULL,
    [lks_descshort] varchar(255) NOT NULL,
    [lks_desclong] varchar(1000),
    [lks_descextra] varchar(255),
    [lks_number1] int,
    [lks_number2] int,
    [lks_number3] int,
    [lks_number4] int,
    [lks_number5] int,
    [lks_float] float(8),
    [lks_order] int NOT NULL,
    [lks_available] bit,
    [lks_lkt_id] int NOT NULL,
    [lks_fixed] int,
    [lks_interfacelookup1] int,
    [lks_interfacelookup2] int,
    [lks_interfacelookup3] varchar(50),
    [lks_membershipnumber] int,
    [lks_cpt_id] int,
    [lks_guid] uniqueidentifier,
    [lks_mophth_rft_id] uniqueidentifier,
    [lks_lastupdated] datetime NOT NULL
);

CREATE TABLE [LookupData_Backup_Patch727] (
    [lqu_id] int NOT NULL,
    [lqu_lqs_id] int NOT NULL,
    [lqu_lkt_answeroptions] int NOT NULL,
    [lqu_questiontext] nvarchar(510),
    [lqu_tooltiptext] nvarchar(510),
    [lqu_order] int NOT NULL,
    [lqu_mandatory] bit NOT NULL,
    [lqu_structural] int,
    [lqu_exclusive] bit,
    [lqu_other] bit,
    [lqu_noneoption] bit,
    [lqu_lookupkey] varchar(20),
    [lqu_domain] int,
    [lqu_lks_id_highlight] int,
    [lqu_available] bit,
    [lqu_pullthrough] bit,
    [lqu_currenttag] bit,
    [lqu_legacy] bit,
    [lqu_membership] int,
    [lqu_lks_id_pullthrough_onresponse] int,
    [lqu_displaytype] int NOT NULL,
    [lqu_unique_identifier] uniqueidentifier
);

CREATE TABLE [LookUpDataActivity] (
    [lda_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [LookUpDataActivityLog] (
    [lda_ObjectId] int NOT NULL,
    [lda_id] int NOT NULL PRIMARY KEY,
    [lda_act_id] uniqueidentifier NOT NULL,
    [lda_lkt_id] int NOT NULL,
    [lda_lks_id] int NOT NULL,
    [lda_DateAdded] datetime NOT NULL,
    [lda_AddedBy] uniqueidentifier NOT NULL,
    [lda_TransactionId] uniqueidentifier NOT NULL,
    [lda_Action] char(1) NOT NULL
);

CREATE TABLE [lookupdatacodemap] (
    [lkp_id] int NOT NULL PRIMARY KEY,
    [lkp_lks_id] int NOT NULL,
    [lkp_active] bit NOT NULL
);

CREATE TABLE [lookupdataextension] (
    [lkx_id] int NOT NULL PRIMARY KEY,
    [lkx_lxt_id] int,
    [lkx_valuefloat] float(8),
    [lkx_valuetext] varchar(255),
    [lkx_lkt_id_list] int
);

CREATE TABLE [lookupdataextensiontype] (
    [lxt_id] int NOT NULL PRIMARY KEY,
    [lxt_descshort] nvarchar(510),
    [lxt_extensiontype] int,
    [lxt_lkt_id_owner] int,
    [lxt_lkt_id_member] int,
    [lxt_lks_DefaultOptionId] int,
    [lxt_IsOptional] bit NOT NULL,
    [lxt_IsSettingExtensionType] bit NOT NULL
);

CREATE TABLE [lookupdatalog] (
    [lks_ObjectId] int NOT NULL,
    [lks_id] int NOT NULL PRIMARY KEY,
    [lks_code] varchar(255) NOT NULL,
    [lks_descshort] nvarchar(510),
    [lks_desclong] nvarchar(2000),
    [lks_descextra] nvarchar(510),
    [lks_number1] int,
    [lks_number2] int,
    [lks_number3] int,
    [lks_number4] int,
    [lks_number5] int,
    [lks_float] float(8),
    [lks_order] int NOT NULL,
    [lks_available] bit,
    [lks_lkt_id] int NOT NULL,
    [lks_fixed] int,
    [lks_interfacelookup1] nvarchar(100),
    [lks_interfacelookup2] nvarchar(100),
    [lks_interfacelookup3] varchar(50),
    [lks_membershipnumber] int,
    [lks_cpt_id] int,
    [lks_guid] uniqueidentifier,
    [lks_mophth_rft_id] uniqueidentifier,
    [lks_lastupdated] datetime NOT NULL,
    [lks_DateAdded] datetime NOT NULL,
    [lks_AddedBy] uniqueidentifier NOT NULL,
    [lks_TransactionId] uniqueidentifier NOT NULL,
    [lks_Action] char(1) NOT NULL,
    [lks_showonwebui] bit
);

CREATE TABLE [lookupdatamembership] (
    [lkm_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [lookupdatamembershipitem] (
    [lki_id] int NOT NULL PRIMARY KEY,
    [lki_lkm_id] int,
    [lki_membershipnumber] int,
    [lki_membershipdesc] varchar(50)
);

CREATE TABLE [lookupdatamembershipitemlog] (
    [lki_ObjectId] int NOT NULL,
    [lki_id] int NOT NULL PRIMARY KEY,
    [lki_lkm_id] int,
    [lki_membershipnumber] int,
    [lki_membershipdesc] varchar(50),
    [lki_DateAdded] datetime NOT NULL,
    [lki_AddedBy] uniqueidentifier NOT NULL,
    [lki_TransactionId] uniqueidentifier NOT NULL,
    [lki_Action] char(1) NOT NULL
);

CREATE TABLE [lookupdatamigrationtemp] (
    [lks_id] int NOT NULL PRIMARY KEY,
    [lks_code] varchar(255) NOT NULL,
    [lks_descshort] varchar(255) NOT NULL,
    [lks_desclong] varchar(1000),
    [lks_descextra] varchar(255),
    [lks_number1] int,
    [lks_number2] int,
    [lks_number3] int,
    [lks_number4] int,
    [lks_number5] int,
    [lks_float] float(8),
    [lks_order] int NOT NULL,
    [lks_available] bit,
    [lks_lkt_id] int NOT NULL,
    [lks_fixed] int,
    [lks_interfacelookup1] int,
    [lks_interfacelookup2] int,
    [lks_interfacelookup3] varchar(50),
    [lks_membershipnumber] int,
    [lks_cpt_id] int,
    [lks_guid] uniqueidentifier
);

CREATE TABLE [LookupDataResponse] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [LookupDataId] int NOT NULL PRIMARY KEY,
    [LookupTypeId] int NOT NULL
);

CREATE TABLE [LookupDataResponseLog] (
    [Id] int NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [LookupDataId] int NOT NULL PRIMARY KEY,
    [LookupTypeId] int NOT NULL
);

CREATE TABLE [LookUps] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [lookuptype] (
    [lkt_id] int NOT NULL PRIMARY KEY,
    [lkt_desc] nvarchar(510),
    [lkt_order] int NOT NULL,
    [lkt_available] bit NOT NULL,
    [lkt_category_no] int,
    [lkt_notavailable_reason] varchar(255),
    [lkt_CanAddItemsInWebUi] bit NOT NULL,
    [lkt_HintText] nvarchar(2000),
    [lkt_AvailableInWebUi] bit NOT NULL,
    [lkt_OrderAlphabetically] bit NOT NULL,
    [lkt_CanEditDescriptionInWebUi] bit NOT NULL
);

CREATE TABLE [LTMedications] (
    [sdm_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [sdm_lks_id] int NOT NULL PRIMARY KEY,
    [sdm_dro_id] int NOT NULL PRIMARY KEY,
    [sdm_mcn_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [LTMedicationsLog] (
    [sdm_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [sdm_ObjectId] int NOT NULL,
    [sdm_DateAdded] datetime NOT NULL,
    [sdm_AddedBy] uniqueidentifier NOT NULL,
    [sdm_Transactionid] uniqueidentifier NOT NULL,
    [sdm_Action] char(1) NOT NULL,
    [sdm_lks_id] int,
    [sdm_dro_id] int,
    [sdm_mcn_id] int
);

CREATE TABLE [malepatients] (
    [pdm_id] int NOT NULL,
    [pdm_gender] nvarchar(510),
    [pdm_lastupdated] datetime
);

CREATE TABLE [managedlistactivity] (
    [mla_id] int NOT NULL PRIMARY KEY,
    [mla_mli_id] int NOT NULL,
    [mla_ety_id] int NOT NULL,
    [mla_aty_id] int NOT NULL
);

CREATE TABLE [managedlists] (
    [mli_id] int NOT NULL PRIMARY KEY,
    [mli_name] varchar(255),
    [mli_bod_id] int NOT NULL
);

CREATE TABLE [MandatoryGradingFeature] (
    [mdt_Id] int NOT NULL PRIMARY KEY,
    [mdt_ftr_FeatureId] int NOT NULL,
    [mdt_grd_GradingId] int NOT NULL,
    [mdt_rnk_GradingRankId] int
);

CREATE TABLE [MandatoryGradingFeatureExclusion] (
    [exc_Id] int NOT NULL PRIMARY KEY,
    [exc_GroupingId] int NOT NULL PRIMARY KEY,
    [exc_ftr_ExcludingCriteriaFeatureId] int NOT NULL PRIMARY KEY,
    [exc_flk_ExcludingCriteriaFeatureLookupId] int
);

CREATE TABLE [MappingType] (
    [bmt_id] int NOT NULL PRIMARY KEY,
    [bmt_description] nvarchar(510)
);

CREATE TABLE [MaritalStatus] (
    [ssm_pss_id] int NOT NULL PRIMARY KEY,
    [ssm_lks_marital_status] int NOT NULL,
    [ssm_comments] nvarchar(MAX)
);

CREATE TABLE [Measurement] (
    [Id] int NOT NULL PRIMARY KEY,
    [Name] nvarchar(200) NOT NULL
);

CREATE TABLE [MeasurementUnit] (
    [Id] int NOT NULL PRIMARY KEY,
    [MeasurementUnitName] nvarchar(20) NOT NULL
);

CREATE TABLE [MedicalReadingActivityLink] (
    [mra_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [MedicalReadingActivityLinkLog] (
    [mra_id] int NOT NULL PRIMARY KEY,
    [mra_ObjectId] int NOT NULL,
    [mra_DateAdded] datetime NOT NULL,
    [mra_AddedBy] uniqueidentifier NOT NULL,
    [mra_Transactionid] uniqueidentifier NOT NULL,
    [mra_Action] char(1) NOT NULL,
    [mra_act_id] uniqueidentifier NOT NULL,
    [mra_mlk_id] int NOT NULL
);

CREATE TABLE [medicalreadings] (
    [mlk_id] int NOT NULL PRIMARY KEY,
    [mlk_med_id] int,
    [mlk_value] float(8),
    [mlk_time] time(5),
    [mlk_measure] int
);

CREATE TABLE [medicalreadingslog] (
    [mlk_ObjectId] int NOT NULL,
    [mlk_id] int NOT NULL PRIMARY KEY,
    [mlk_med_id] int,
    [mlk_value] float(8),
    [mlk_time] time(5),
    [mlk_measure] int,
    [mlk_DateAdded] datetime NOT NULL,
    [mlk_AddedBy] uniqueidentifier NOT NULL,
    [mlk_TransactionId] uniqueidentifier NOT NULL,
    [mlk_Action] char(1) NOT NULL
);

CREATE TABLE [medicalreadingtype] (
    [med_id] int NOT NULL PRIMARY KEY,
    [med_code] varchar(255) NOT NULL,
    [med_desc] varchar(255) NOT NULL,
    [med_warn_min] float(8),
    [med_warn_max] float(8),
    [med_unit] varchar(8),
    [med_id_guid] uniqueidentifier NOT NULL
);

CREATE TABLE [MedicationDataSource] (
    [mdd_id] int NOT NULL PRIMARY KEY,
    [mdd_description] nvarchar(4000)
);

CREATE TABLE [medicationelements] (
    [mcn_id] int NOT NULL PRIMARY KEY,
    [mcn_context] int
);

CREATE TABLE [MedicationElementsDuplicate] (
    [med_id] int NOT NULL PRIMARY KEY,
    [med_mcn_id_duplicate] int,
    [med_mcn_key_duplicate] nvarchar(8000),
    [med_mcn_id_master] int,
    [med_mcn_key_master] nvarchar(8000),
    [med_PatchVersion] varchar(256),
    [med_pns_PatchInstallationId] int
);

CREATE TABLE [MedicationElementsDuplicateMedicationRemovalBackup] (
    [mcn_id] int NOT NULL PRIMARY KEY,
    [mcn_dmy_id] int,
    [mcn_dbr_id] int,
    [mcn_dvp_id] int,
    [mcn_dap_id] int,
    [mcn_context] int,
    [mcn_key] varchar(255),
    [mcn_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [MedicationElementsVersionDuplicate] (
    [Id] int NOT NULL PRIMARY KEY,
    [MedicationElementIdDuplicate] int,
    [MedicationElementKeyDuplicate] nvarchar(8000),
    [MedicationElementIdMaster] int,
    [MedicationElementKeyMaster] nvarchar(8000),
    [PackageVersion] int
);

CREATE TABLE [MedisoftIdMigration] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [medisoftmigrationlog] (
    [mml_id] int NOT NULL,
    [mml_procedure] varchar(255),
    [mml_type] varchar(255),
    [mml_tablesfrom] varchar(255),
    [mml_rowsfrom] int,
    [mml_tablesto] varchar(255),
    [mml_rowsto] int,
    [mml_log] varchar(MAX),
    [mml_timestamp] datetime,
    [mml_hostname] varchar(255),
    [mml_username] varchar(255)
);

CREATE TABLE [MedisoftMigrationType] (
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY,
    [SourceObjectName] varchar(256) NOT NULL PRIMARY KEY,
    [Description] varchar(255),
    [IsStaticEnum] bit NOT NULL,
    [SourceObjectId] int,
    [DestinationObjectName] varchar(256),
    [DestinationObjectId] int
);

CREATE TABLE [medisoftscriptstore] (
    [scriptclause] varchar(MAX) NOT NULL
);

CREATE TABLE [medisoftsequentialguidstore] (
    [sgs_sequentialguid] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [MedisoftStaticID] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationIDInt] int NOT NULL PRIMARY KEY
);

CREATE TABLE [medisoftsupportencounteraudit] (
    [sea_ect_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [sea_ety_id] int NOT NULL,
    [sea_datestored] datetime NOT NULL,
    [sea_pat_id] uniqueidentifier NOT NULL,
    [sea_actiontype_id] int NOT NULL,
    [sea_ticketId] int NOT NULL,
    [sea_reason] varchar(MAX) NOT NULL
);

CREATE TABLE [medisoftsupportstaff] (
    [mss_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [mss_name] varchar(255),
    [mss_active] bit
);

CREATE TABLE [medisoftupdatetoken] (
    [tok_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [tok_tablename] varchar(255) NOT NULL,
    [tok_mss_id] uniqueidentifier NOT NULL,
    [tok_supportreason] varchar(MAX) NOT NULL,
    [tok_datetaken] datetime NOT NULL,
    [tok_expired] bit NOT NULL
);

CREATE TABLE [MergedEncounterHistory] (
    [Id] int NOT NULL PRIMARY KEY,
    [PreviousEncounterId] uniqueidentifier NOT NULL,
    [NewEncounterId] uniqueidentifier NOT NULL
);

CREATE TABLE [MergeField] (
    [smf_id] int NOT NULL PRIMARY KEY,
    [smf_name] nvarchar(200) NOT NULL,
    [smf_available] bit NOT NULL,
    [smf_DocumentComponentDescription] nvarchar(MAX) NOT NULL,
    [smf_FullFriendlyName] nvarchar(MAX)
);

CREATE TABLE [MergeFieldGroup] (
    [smg_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Message] (
    [mes_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [bmg_Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [clm_Id] int NOT NULL PRIMARY KEY,
    [clm_mgn_ChainId] int NOT NULL,
    [pcm_act_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [mes_Content] nvarchar(8000) NOT NULL,
    [mes_met_MessageDestinationId] int NOT NULL PRIMARY KEY,
    [pcm_content] nvarchar(5000),
    [bmg_bms_MessageStateId] int NOT NULL,
    [clm_MessageType] varchar(5) NOT NULL,
    [clm_TriggerEvent] varchar(5) NOT NULL,
    [bmg_DateCreated] datetime2 NOT NULL,
    [OutputLocation] nvarchar(2000),
    [mes_mdt_MessageSourceId] int NOT NULL PRIMARY KEY,
    [DateCreated] datetime2 NOT NULL,
    [bmg_OutputLocation] nvarchar(2000),
    [bmg_MessageContent] varbinary(-1),
    [MessageContent] varbinary(-1),
    [ErrorReason] nvarchar(2000),
    [bmg_ErrorReason] nvarchar(2000),
    [clm_ErrorReason] varchar(255),
    [clm_MessageVersion] varchar(255),
    [clm_ctt_TaskTypeId] int NOT NULL,
    [clm_MessageDateTime] datetime,
    [clm_MessageReceivedDateTime] datetime,
    [clm_SuccessfullyProcessed] bit NOT NULL,
    [clm_SuccessfullyResolved] bit,
    [clm_MessageControlId] varchar(20),
    [clm_ExcludeFromReprocessing] bit NOT NULL
);

CREATE TABLE [MessageAppointment] (
    [msa_Id] int NOT NULL PRIMARY KEY,
    [msa_AppointmentTime] datetime,
    [msa_AppointmentArrivalTime] datetime,
    [msa_ResourceName] nvarchar(510),
    [msa_ClinicCode] nvarchar(510),
    [msa_LocationName] nvarchar(510),
    [msa_AppointmentType] nvarchar(510),
    [msa_New] bit,
    [msa_FollowUp] bit,
    [msa_SiteIdentifier] nvarchar(510)
);

CREATE TABLE [MessageAppointmentIdentifier] (
    [mid_id] int NOT NULL PRIMARY KEY,
    [mid_value] nvarchar(40),
    [mid_TypeOther] nvarchar(100)
);

CREATE TABLE [MessageChain] (
    [mgn_Id] int NOT NULL PRIMARY KEY,
    [mgn_TemporaryIdentifier] varchar(255),
    [mgn_IsArchived] bit NOT NULL
);

CREATE TABLE [MessageCharge] (
    [bmc_Id] int NOT NULL PRIMARY KEY,
    [bmc_cat_ActionTypeId] int NOT NULL
);

CREATE TABLE [MessageChargeActionType] (
    [cat_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [MessageChargeLog] (
    [bmc_Id] int NOT NULL PRIMARY KEY,
    [bmc_ObjectId] int NOT NULL,
    [bmc_DateAdded] datetime NOT NULL,
    [bmc_AddedBy] uniqueidentifier NOT NULL,
    [bmc_Transactionid] uniqueidentifier NOT NULL,
    [bmc_Action] char(1) NOT NULL,
    [bmc_bsc_StagingChargeId] int NOT NULL,
    [bmc_bmg_MessageId] int NOT NULL,
    [bmc_cat_ActionTypeId] int
);

CREATE TABLE [MessageDestination] (
    [met_Id] int NOT NULL PRIMARY KEY,
    [met_Description] nvarchar(500) NOT NULL
);

CREATE TABLE [MessageEncounter] (
    [bme_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [MessageEncounterLog] (
    [bme_Id] int NOT NULL PRIMARY KEY,
    [bme_ObjectId] int NOT NULL,
    [bme_DateAdded] datetime NOT NULL,
    [bme_AddedBy] uniqueidentifier NOT NULL,
    [bme_Transactionid] uniqueidentifier NOT NULL,
    [bme_Action] char(1) NOT NULL,
    [bme_bse_StagingEncounterId] int NOT NULL,
    [bme_bmg_MessageId] int NOT NULL
);

CREATE TABLE [MessageId] (
    [vfm_id] int NOT NULL PRIMARY KEY,
    [vfm_nextMessageId] int NOT NULL
);

CREATE TABLE [MessageLog] (
    [pcm_act_id] int NOT NULL,
    [bmg_Id] int NOT NULL PRIMARY KEY,
    [mes_act_ActivityId] int NOT NULL PRIMARY KEY,
    [mes_ObjectId] uniqueidentifier NOT NULL,
    [bmg_ObjectId] int NOT NULL,
    [pcm_ObjectId] uniqueidentifier NOT NULL,
    [pcm_DateAdded] datetime NOT NULL,
    [bmg_DateAdded] datetime NOT NULL,
    [mes_DateAdded] datetime NOT NULL,
    [mes_AddedBy] uniqueidentifier NOT NULL,
    [bmg_AddedBy] uniqueidentifier NOT NULL,
    [pcm_AddedBy] uniqueidentifier NOT NULL,
    [pcm_Transactionid] uniqueidentifier NOT NULL,
    [bmg_Transactionid] uniqueidentifier NOT NULL,
    [mes_Transactionid] uniqueidentifier NOT NULL,
    [mes_Action] char(1) NOT NULL,
    [bmg_Action] char(1) NOT NULL,
    [pcm_Action] char(1) NOT NULL,
    [pcm_content] nvarchar(5000),
    [mes_Content] nvarchar(8000) NOT NULL,
    [mes_met_MessageDestinationId] int NOT NULL,
    [bmg_bms_MessageStateId] int NOT NULL,
    [bmg_DateCreated] datetime2 NOT NULL,
    [mes_mdt_MessageSourceId] int,
    [bmg_OutputLocation] nvarchar(2000),
    [bmg_MessageContent] varbinary(-1),
    [bmg_ErrorReason] nvarchar(2000),
    [bmg_MessageType] int NOT NULL
);

CREATE TABLE [MessagePatient] (
    [msp_Id] int NOT NULL PRIMARY KEY,
    [msp_DateOfBirth] datetime,
    [msp_Surname] nvarchar(510),
    [msp_GivenName] nvarchar(510),
    [msp_Gender] varchar(255),
    [msp_Title] nvarchar(510),
    [msp_AddressLine1] nvarchar(510),
    [msp_AddressLine2] nvarchar(510),
    [msp_AddressLine3] nvarchar(510),
    [msp_AddressLine4] nvarchar(510),
    [msp_AddressLine5] nvarchar(510),
    [msp_Postcode] varchar(255),
    [msp_HomeNumber] varchar(255),
    [msp_WorkNumber] varchar(255),
    [msp_HospitalNumber] varchar(255)
);

CREATE TABLE [Messages_0] (
    [PayloadId] bigint(8) NOT NULL PRIMARY KEY,
    [Payload] varbinary(-1) NOT NULL,
    [InsertedOn] datetime NOT NULL
);

CREATE TABLE [Messages_0_Id] (
    [PayloadId] bigint(8) NOT NULL PRIMARY KEY
);

CREATE TABLE [MessageSource] (
    [mdt_Id] int NOT NULL PRIMARY KEY,
    [mdt_Description] nvarchar(500) NOT NULL
);

CREATE TABLE [MessageState] (
    [bms_Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [hms_Id] int NOT NULL PRIMARY KEY,
    [hms_Description] nvarchar(200) NOT NULL,
    [Description] nvarchar(200) NOT NULL,
    [bms_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [MessageTaskType] (
    [ctt_Id] int NOT NULL PRIMARY KEY,
    [ctt_Description] varchar(255) NOT NULL
);

CREATE TABLE [MessageToReviewer] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ForUrgentReview] bit,
    [Comments] nvarchar(4000)
);

CREATE TABLE [MessageToReviewerLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ForUrgentReview] bit,
    [Comments] nvarchar(4000)
);

CREATE TABLE [MessageType] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(100) NOT NULL
);

CREATE TABLE [Method] (
    [Id] int NOT NULL PRIMARY KEY,
    [Name] nvarchar(200) NOT NULL
);

CREATE TABLE [MethodOfRemoval] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [MicropulseDiodeLaserTrabeculoplasty] (
    [mld_sdf_id] int NOT NULL PRIMARY KEY,
    [mdt_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [mdt_SpotSize] int,
    [mld_SpotSize] int,
    [mld_PowerOfLaser] int,
    [mdt_Variable] bit NOT NULL,
    [mdt_MinimumPowerOfLaser] int NOT NULL,
    [mld_Duration] int,
    [mld_DutyCycle] int,
    [mdt_MaximumPowerOfLaser] int,
    [mdt_MinimumDuration] int NOT NULL,
    [mdt_MaximumDuration] int,
    [mdt_DutyCycle] int,
    [mdt_TotalEnergy] decimal(18, 2)
);

CREATE TABLE [MicropulseDiodeLaserTrabeculoplastyLog] (
    [mdt_ActivityId] int NOT NULL PRIMARY KEY,
    [mld_sdf_id] int NOT NULL PRIMARY KEY,
    [mld_ObjectId] int NOT NULL,
    [mdt_ObjectId] uniqueidentifier NOT NULL,
    [mdt_DateAdded] datetime NOT NULL,
    [mld_DateAdded] datetime NOT NULL,
    [mld_AddedBy] uniqueidentifier NOT NULL,
    [mdt_AddedBy] uniqueidentifier NOT NULL,
    [mdt_Transactionid] uniqueidentifier NOT NULL,
    [mld_Transactionid] uniqueidentifier NOT NULL,
    [mld_Action] char(1) NOT NULL,
    [mdt_Action] char(1) NOT NULL,
    [mdt_SpotSize] int,
    [mld_SpotSize] int,
    [mld_PowerOfLaser] int,
    [mdt_Variable] bit,
    [mdt_MinimumPowerOfLaser] int,
    [mld_Duration] int,
    [mld_DutyCycle] int,
    [mdt_MaximumPowerOfLaser] int,
    [mdt_MinimumDuration] int,
    [mdt_MaximumDuration] int,
    [mdt_DutyCycle] int,
    [mdt_TotalEnergy] decimal(18, 2)
);

CREATE TABLE [MigrationMapper] (
    [old_rft_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [mapping] varchar(255),
    [description] varchar(255),
    [new_id] int
);

CREATE TABLE [MigrationPatients] (
    [mgp_pat_id_mophth] uniqueidentifier NOT NULL PRIMARY KEY,
    [mpg_pat_id] uniqueidentifier
);

CREATE TABLE [MigrationState] (
    [mgs_id] int NOT NULL PRIMARY KEY,
    [mgs_state] int NOT NULL,
    [mgs_step] int NOT NULL
);

CREATE TABLE [MigrationStaticEnums] (
    [mse_id] int NOT NULL PRIMARY KEY,
    [mse_enum_type] varchar(255) NOT NULL,
    [mse_enum_heading] varchar(255) NOT NULL,
    [mse_migrate_enum] bit NOT NULL,
    [mse_enum_text] varchar(255) NOT NULL,
    [mse_enum_friendly_desc] varchar(255),
    [mse_enum] int NOT NULL,
    [mse_mophth_static_id] uniqueidentifier,
    [mse_code] varchar(255),
    [mse_code_parent] varchar(255)
);

CREATE TABLE [mimetypes] (
    [mim_id] int NOT NULL PRIMARY KEY,
    [mim_description] nvarchar(510),
    [mim_name] nvarchar(510),
    [mim_extension] nvarchar(510),
    [mim_uploadsupported] bit
);

CREATE TABLE [MinorProcedures] (
    [mip_id] int NOT NULL PRIMARY KEY,
    [mip_act_id] uniqueidentifier NOT NULL
);

CREATE TABLE [MinorProceduresItem] (
    [mii_id] int NOT NULL PRIMARY KEY,
    [mii_mip_id] int NOT NULL,
    [mii_pro_id] int NOT NULL,
    [mii_bod_id] int NOT NULL,
    [mii_comments] nvarchar(500),
    [mii_deleted] bit NOT NULL,
    [mii_pqi_id] int
);

CREATE TABLE [MinorProceduresItemLog] (
    [mii_ObjectId] int NOT NULL,
    [mii_id] int NOT NULL PRIMARY KEY,
    [mii_mip_id] int NOT NULL,
    [mii_pro_id] int NOT NULL,
    [mii_bod_id] int NOT NULL,
    [mii_comments] nvarchar(500),
    [mii_deleted] bit NOT NULL,
    [mii_DateAdded] datetime NOT NULL,
    [mii_AddedBy] uniqueidentifier NOT NULL,
    [mii_Transactionid] uniqueidentifier NOT NULL,
    [mii_Action] char(1) NOT NULL,
    [mii_pqi_id] int
);

CREATE TABLE [MinorProceduresLog] (
    [mip_ObjectId] int NOT NULL,
    [mip_id] int NOT NULL PRIMARY KEY,
    [mip_act_id] uniqueidentifier NOT NULL,
    [mip_DateAdded] datetime NOT NULL,
    [mip_AddedBy] uniqueidentifier NOT NULL,
    [mip_Transactionid] uniqueidentifier NOT NULL,
    [mip_Action] char(1) NOT NULL
);

CREATE TABLE [Mobility] (
    [pmb_pss_id] int NOT NULL PRIMARY KEY,
    [pmb_mobility_problems] int NOT NULL,
    [pmb_patient_immobile] int NOT NULL,
    [pmb_weight_bearing] int NOT NULL,
    [pmb_comments] nvarchar(MAX)
);

CREATE TABLE [MobilityAids] (
    [pma_pss_id] int NOT NULL PRIMARY KEY,
    [pma_lqu_mobility_aid] int NOT NULL PRIMARY KEY
);

CREATE TABLE [MobilityAssistanceRequired] (
    [mar_pss_id] int NOT NULL PRIMARY KEY,
    [mar_lqu_assistance_required] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Modality] (
    [hmm_Id] int NOT NULL PRIMARY KEY,
    [hmm_Name] nvarchar(510) NOT NULL,
    [hmm_ScheduledStation] nvarchar(200) NOT NULL,
    [hmm_Code] nvarchar(200) NOT NULL
);

CREATE TABLE [MophthDrugClassMap] (
    [dcm_Id] int NOT NULL PRIMARY KEY,
    [dcm_mcn_MedicationElementsId] int NOT NULL,
    [dcm_dcl_DrugClassId] int NOT NULL,
    [dcm_dcl_MOphthDrugId] uniqueidentifier NOT NULL,
    [dcm_dcl_MOphthDrugClassId] uniqueidentifier NOT NULL
);

CREATE TABLE [MophthDrugClassMapDuplicateMedicationRemovalBackup] (
    [dcm_Id] int NOT NULL PRIMARY KEY,
    [dcm_mcn_MedicationElementsId] int NOT NULL,
    [dcm_dcl_DrugClassId] int NOT NULL,
    [dcm_dcl_MOphthDrugId] uniqueidentifier NOT NULL,
    [dcm_dcl_MOphthDrugClassId] uniqueidentifier NOT NULL,
    [dcm_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [MuscleAdjustment] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [AdjustmentId] int NOT NULL,
    [MuscleId] int NOT NULL,
    [MuscleAdjustmentId] int NOT NULL,
    [Amount] float(8) NOT NULL,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [MuscleAdjustmentLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [AdjustmentId] int NOT NULL,
    [MuscleId] int NOT NULL,
    [MuscleAdjustmentId] int NOT NULL,
    [Amount] float(8) NOT NULL,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [MuscleIsolated] (
    [mus_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [mus_lks_Muscle] int NOT NULL PRIMARY KEY,
    [mus_bod_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [MuscleIsolatedLog] (
    [mus_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [mus_ObjectId] int NOT NULL,
    [mus_DateAdded] datetime NOT NULL,
    [mus_AddedBy] uniqueidentifier NOT NULL,
    [mus_TransactionId] uniqueidentifier NOT NULL,
    [mus_Action] char(1) NOT NULL,
    [mus_lks_Muscle] int NOT NULL,
    [mus_bod_id] int NOT NULL
);

CREATE TABLE [Muscles] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [MuscleId] int NOT NULL,
    [Description] nvarchar(1000) NOT NULL,
    [Units] float(8) NOT NULL,
    [BotulinumToxinId] int NOT NULL,
    [PerformedById] uniqueidentifier,
    [MusclePreviouslyOperatedOn] bit NOT NULL
);

CREATE TABLE [MusclesIsolated] (
    [gmi_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [gmi_lks_Muscle] int NOT NULL PRIMARY KEY
);

CREATE TABLE [MusclesIsolatedLog] (
    [gmi_ActivityId] int NOT NULL PRIMARY KEY,
    [gmi_ObjectId] uniqueidentifier NOT NULL,
    [gmi_DateAdded] datetime NOT NULL,
    [gmi_AddedBy] uniqueidentifier NOT NULL,
    [gmi_Transactionid] uniqueidentifier NOT NULL,
    [gmi_Action] char(1) NOT NULL,
    [gmi_lks_Muscle] int
);

CREATE TABLE [MusclesLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [MuscleId] int NOT NULL,
    [Units] float(8) NOT NULL,
    [BotulinumToxinId] int NOT NULL,
    [PerformedById] uniqueidentifier,
    [MusclePreviouslyOperatedOn] bit NOT NULL
);

CREATE TABLE [NearLine] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(200) NOT NULL
);

CREATE TABLE [NitriteData] (
    [unt_id] int NOT NULL PRIMARY KEY,
    [unt_available] bit NOT NULL
);

CREATE TABLE [NumericGraphData] (
    [Id] int NOT NULL PRIMARY KEY,
    [PointsCount] int NOT NULL,
    [NumericGraphTypeId] int NOT NULL,
    [VisualFieldTestId] int NOT NULL
);

CREATE TABLE [NumericGraphDataPoint] (
    [Id] int NOT NULL PRIMARY KEY,
    [NumericGraphDataId] int NOT NULL,
    [Value] varchar(5) NOT NULL
);

CREATE TABLE [NumericGraphType] (
    [Id] int NOT NULL PRIMARY KEY,
    [HfaReferenceDescription] nvarchar(510) NOT NULL
);

CREATE TABLE [NumericResponseDecimalPlaceValue] (
    [nrd_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [NumericResponsePrecisionType] (
    [nry_Id] int NOT NULL PRIMARY KEY,
    [nry_EqualityOperator] nchar(2) NOT NULL
);

CREATE TABLE [NumericResponseQuestionParameters] (
    [nrp_qui_QuestionId] int NOT NULL PRIMARY KEY,
    [nrp_nrd_DecimalPlaces] int NOT NULL,
    [nrp_MinValue] float(8) NOT NULL,
    [nrp_MaxValue] float(8) NOT NULL,
    [nrp_nry_NumericResponsePrecisionTypeId] int NOT NULL
);

CREATE TABLE [NumericResponseQuestionParametersLog] (
    [nrp_qui_QuestionId] int NOT NULL,
    [nrp_ObjectId] int NOT NULL,
    [nrp_DateAdded] datetime NOT NULL,
    [nrp_AddedBy] uniqueidentifier NOT NULL,
    [nrp_Transactionid] uniqueidentifier NOT NULL,
    [nrp_Action] char(1) NOT NULL,
    [nrp_nrd_DecimalPlaces] int NOT NULL,
    [nrp_MinValue] float(8) NOT NULL,
    [nrp_MaxValue] float(8) NOT NULL,
    [nrp_nry_NumericResponsePrecisionTypeId] int NOT NULL
);

CREATE TABLE [NumericResponseQuestionVersionParameters] (
    [nrv_quv_QuestionVersionId] int NOT NULL PRIMARY KEY,
    [nrv_nrd_DecimalPlaces] int NOT NULL,
    [nrv_MinValue] float(8) NOT NULL,
    [nrv_MaxValue] float(8) NOT NULL,
    [nrv_nry_NumericResponsePrecisionTypeId] int NOT NULL
);

CREATE TABLE [NumericResponseQuestionVersionParametersLog] (
    [nrv_quv_QuestionVersionId] int NOT NULL,
    [nrv_ObjectId] int NOT NULL,
    [nrv_DateAdded] datetime NOT NULL,
    [nrv_AddedBy] uniqueidentifier NOT NULL,
    [nrv_Transactionid] uniqueidentifier NOT NULL,
    [nrv_Action] char(1) NOT NULL,
    [nrv_nrd_DecimalPlaces] int NOT NULL,
    [nrv_MinValue] float(8) NOT NULL,
    [nrv_MaxValue] float(8) NOT NULL,
    [nrv_nry_NumericResponsePrecisionTypeId] int NOT NULL
);

CREATE TABLE [Observation] (
    [pob_id] int NOT NULL PRIMARY KEY,
    [pob_Time] time(5) NOT NULL,
    [pob_Date] date(3) NOT NULL
);

CREATE TABLE [ObservationComments] (
    [obc_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [obc_Comments] nvarchar(8000)
);

CREATE TABLE [ObservationCommentsLog] (
    [obc_ActivityId] int NOT NULL,
    [obc_ObjectId] uniqueidentifier NOT NULL,
    [obc_DateAdded] datetime NOT NULL,
    [obc_AddedBy] uniqueidentifier NOT NULL,
    [obc_Transactionid] uniqueidentifier NOT NULL,
    [obc_Action] char(1) NOT NULL,
    [obc_Comments] nvarchar(8000)
);

CREATE TABLE [ObservationLog] (
    [pob_id] int NOT NULL PRIMARY KEY,
    [pob_ObjectId] int NOT NULL,
    [pob_DateAdded] datetime NOT NULL,
    [pob_AddedBy] uniqueidentifier NOT NULL,
    [pob_Transactionid] uniqueidentifier NOT NULL,
    [pob_Action] char(1) NOT NULL,
    [pob_act_id] uniqueidentifier NOT NULL,
    [pob_Time] time(5) NOT NULL,
    [pob_Date] date(3) NOT NULL
);

CREATE TABLE [ObservationReading] (
    [pom_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ObservationReadingLog] (
    [pom_id] int NOT NULL PRIMARY KEY,
    [pom_ObjectId] int NOT NULL,
    [pom_DateAdded] datetime NOT NULL,
    [pom_AddedBy] uniqueidentifier NOT NULL,
    [pom_Transactionid] uniqueidentifier NOT NULL,
    [pom_Action] char(1) NOT NULL,
    [pom_pob_id] int NOT NULL,
    [pom_mlk_id] int NOT NULL
);

CREATE TABLE [OctopusExamMethod] (
    [voe_Id] int NOT NULL PRIMARY KEY,
    [voe_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [OctopusProgram] (
    [vop_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [OctopusStimulusMethod] (
    [vom_Id] int NOT NULL PRIMARY KEY,
    [vom_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [OctopusStrategy] (
    [vos_Id] int NOT NULL PRIMARY KEY,
    [vos_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [OctopusTest] (
    [vfo_Id] int NOT NULL PRIMARY KEY,
    [vfo_DeviceName] nvarchar(200) NOT NULL,
    [vfo_DeviceSerialNumber] nvarchar(200) NOT NULL,
    [vfo_DeviceSoftwareVersion] nvarchar(100) NOT NULL,
    [vfo_DeviceModuleVersion] nvarchar(100) NOT NULL,
    [vfo_ExamDate] datetime2 NOT NULL,
    [vfo_bod_BodyPartId] int NOT NULL,
    [vfo_FixationMethod] nvarchar(200),
    [vfo_vop_ProgramId] int,
    [vfo_ProgramCodeRaw] nvarchar(20),
    [vfo_StimulusSize] int NOT NULL,
    [vfo_StimulusDuration] int,
    [vfo_vom_StimulusMethodId] int,
    [vfo_BackgroundIntensity] decimal(18, 2) NOT NULL,
    [vfo_vos_StrategyId] int,
    [vfo_voe_ExamMethodId] int,
    [vfo_Stages] int,
    [vfo_TestLocations] int,
    [vfo_Questions] int,
    [vfo_Repetitions] int,
    [vfo_PositiveCatchTrials] int,
    [vfo_PositiveAnswers] int,
    [vfo_NegativeCatchTrials] int,
    [vfo_NegativeAnswers] int,
    [vfo_MeanSensitivity] decimal(18, 2),
    [vfo_MeanDeviation] decimal(18, 2),
    [vfo_StandardDeviation] decimal(18, 2),
    [vfo_CorrectedStandardDeviation] decimal(18, 2),
    [vfo_ShortTermFluctuation] decimal(18, 2),
    [vfo_ReliabilityFactor] decimal(18, 2),
    [vfo_RefractionSphere] decimal(18, 2),
    [vfo_RefractionCylinder] decimal(18, 2),
    [vfo_RefractionAxis] int,
    [vfo_VisualAcuity] decimal(18, 2),
    [vfo_PupilSize] decimal(18, 2),
    [vfo_IntraocularPressure] decimal(18, 2),
    [vfo_ExamDurationSeconds] int NOT NULL,
    [vfo_StimulusMethodRaw] nvarchar(20),
    [vfo_StrategyRaw] nvarchar(20),
    [vfo_ExamMethodRaw] nvarchar(20),
    [vfo_IsReliable] bit NOT NULL
);

CREATE TABLE [octscan] (
    [oct_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [octscanetdrschart] (
    [etd_id] int NOT NULL PRIMARY KEY,
    [etd_averagethickness] int,
    [etd_averagevolume] decimal(18, 2),
    [etd_etdrschartarea] int NOT NULL
);

CREATE TABLE [octscanetdrschartlog] (
    [etd_ObjectId] int NOT NULL,
    [etd_id] int NOT NULL PRIMARY KEY,
    [etd_oct_id] int NOT NULL,
    [etd_averagethickness] int,
    [etd_averagevolume] decimal(18, 2),
    [etd_etdrschartarea] int NOT NULL,
    [etd_DateAdded] datetime NOT NULL,
    [etd_AddedBy] uniqueidentifier NOT NULL,
    [etd_TransactionId] uniqueidentifier NOT NULL,
    [etd_Action] char(1) NOT NULL
);

CREATE TABLE [OctScanFixationTarget] (
    [oft_id] int NOT NULL PRIMARY KEY,
    [oft_description] nvarchar(200) NOT NULL
);

CREATE TABLE [OctScanHeyex] (
    [och_id] int NOT NULL PRIMARY KEY,
    [och_studyUid] nvarchar(400),
    [och_seriesUid] nvarchar(400),
    [och_progressionUid] nvarchar(400),
    [och_gridCenterX] int NOT NULL,
    [och_gridCenterY] int NOT NULL,
    [och_imageWidth] int NOT NULL,
    [och_imageHeight] int NOT NULL,
    [och_scaleX] decimal(18, 2),
    [och_scaleY] decimal(18, 2),
    [och_oft_id_fixationTarget] int NOT NULL,
    [och_ohb_id] int,
    [och_version] int NOT NULL,
    [och_TrackingUid] nvarchar(510),
    [och_ReferencedSopInstanceUid] nvarchar(510),
    [och_ContentDateTime] datetime,
    [och_ReferencedInstanceVersion] int,
    [och_hat_ApplicationTypeId] int,
    [och_ApplicationTypeRaw] nvarchar(200),
    [och_Operator] nvarchar(400),
    [och_ScanVersion] nvarchar(400),
    [och_AuthorOfChange] nvarchar(400),
    [och_ApsGuid] uniqueidentifier
);

CREATE TABLE [OctScanHeyexBscan] (
    [ohb_id] int NOT NULL PRIMARY KEY,
    [ohb_och_id] int,
    [ohb_blb_ImageBinary] uniqueidentifier
);

CREATE TABLE [OctScanHeyexBscanLog] (
    [ohb_ObjectId] int NOT NULL,
    [ohb_id] int NOT NULL PRIMARY KEY,
    [ohb_och_id] int,
    [ohb_blb_ImageBinary] uniqueidentifier,
    [ohb_DateAdded] datetime NOT NULL,
    [ohb_AddedBy] uniqueidentifier NOT NULL,
    [ohb_Transactionid] uniqueidentifier NOT NULL,
    [ohb_Action] char(1) NOT NULL
);

CREATE TABLE [OctScanHeyexLog] (
    [och_ObjectId] int NOT NULL,
    [och_id] int NOT NULL PRIMARY KEY,
    [och_oct_id] int NOT NULL,
    [och_studyUid] nvarchar(400),
    [och_seriesUid] nvarchar(400),
    [och_progressionUid] nvarchar(400),
    [och_gridCenterX] int NOT NULL,
    [och_gridCenterY] int NOT NULL,
    [och_imageWidth] int NOT NULL,
    [och_imageHeight] int NOT NULL,
    [och_scaleX] decimal(18, 2),
    [och_scaleY] decimal(18, 2),
    [och_DateAdded] datetime NOT NULL,
    [och_AddedBy] uniqueidentifier NOT NULL,
    [och_Transactionid] uniqueidentifier NOT NULL,
    [och_Action] char(1) NOT NULL,
    [och_oft_id_fixationTarget] int NOT NULL,
    [och_ohb_id] int,
    [och_version] int,
    [och_TrackingUid] nvarchar(510),
    [och_ReferencedSopInstanceUid] nvarchar(510),
    [och_ContentDateTime] datetime,
    [och_ReferencedInstanceVersion] int,
    [och_hat_ApplicationTypeId] int,
    [och_ApplicationTypeRaw] nvarchar(200),
    [och_Operator] nvarchar(400),
    [och_ScanVersion] nvarchar(400),
    [och_AuthorOfChange] nvarchar(400),
    [och_ApsGuid] uniqueidentifier
);

CREATE TABLE [octscanlog] (
    [oct_ObjectId] int NOT NULL,
    [oct_id] int NOT NULL PRIMARY KEY,
    [oct_act_id] uniqueidentifier NOT NULL,
    [oct_bod_id] int NOT NULL,
    [oct_lks_id_octmachine] int NOT NULL,
    [oct_centralpointfovealthickness] int,
    [oct_macularvolume] decimal(18, 2),
    [oct_DateAdded] datetime NOT NULL,
    [oct_AddedBy] uniqueidentifier NOT NULL,
    [oct_TransactionId] uniqueidentifier NOT NULL,
    [oct_Action] char(1) NOT NULL,
    [oct_include] bit NOT NULL,
    [oct_marker] int,
    [oct_centralmin] int,
    [oct_centralmax] int,
    [oct_signalstrength] int
);

CREATE TABLE [OperAnaeTechniqueMapping] (
    [MedisoftSourceID] uniqueidentifier,
    [MedisoftSourceDesc] varchar(255),
    [MediSIGHTDestDesc] varchar(255),
    [MediSIGHTDestId] int,
    [DrugApplicationType] varchar(255),
    [ant_id] int
);

CREATE TABLE [operation] (
    [ope_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Operation] (
    [opo_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [opo_SelectedOperationEncounterId] uniqueidentifier
);

CREATE TABLE [operation] (
    [ope_act_id] uniqueidentifier,
    [ope_admissiontype] int
);

CREATE TABLE [Operation] (
    [opo_SelectedOther] nvarchar(1000),
    [opo_LocalAnaesthetic] bit
);

CREATE TABLE [operation] (
    [ope_datelisted] datetime,
    [ope_flag] bit
);

CREATE TABLE [Operation] (
    [opo_GeneralAnaesthetic] bit,
    [opo_HasSedation] bit
);

CREATE TABLE [operation] (
    [ope_ptr_id_gp] uniqueidentifier,
    [ope_lks_id_operationstatus] int
);

CREATE TABLE [Operation] (
    [opo_SelectedOperationDescription] nvarchar(4000),
    [opo_HasSedationPulledFromOperation] bit,
    [opo_HasLeftProcedure] bit,
    [opo_HasRightProcedure] bit
);

CREATE TABLE [operationanaesthesia] (
    [oan_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [OperationAnaesthesia] (
    [opa_id] int NOT NULL PRIMARY KEY,
    [opa_AnaesthesiaType] int NOT NULL,
    [opa_bod_id] int,
    [opa_RouteDescription] nvarchar(510),
    [opa_DrugDescription] nvarchar(510)
);

CREATE TABLE [OperationAnaesthesiaLog] (
    [opa_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [operationanaesthesialog] (
    [oan_ObjectId] int NOT NULL,
    [oan_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [OperationAnaesthesiaLog] (
    [opa_ObjectId] int NOT NULL,
    [opa_DateAdded] datetime NOT NULL
);

CREATE TABLE [operationanaesthesialog] (
    [oan_act_id] uniqueidentifier NOT NULL,
    [oan_bod_id] int NOT NULL
);

CREATE TABLE [OperationAnaesthesiaLog] (
    [opa_AddedBy] uniqueidentifier NOT NULL,
    [opa_TransactionId] uniqueidentifier NOT NULL
);

CREATE TABLE [operationanaesthesialog] (
    [oan_lks_id_blockmobility] int,
    [oan_lks_id_blockocularpressure] int
);

CREATE TABLE [OperationAnaesthesiaLog] (
    [opa_Action] char(1) NOT NULL,
    [opa_AnaesthesiaType] int NOT NULL
);

CREATE TABLE [operationanaesthesialog] (
    [oan_hyalase] bit,
    [oan_generalanaesthesia] bit
);

CREATE TABLE [OperationAnaesthesiaLog] (
    [opa_opo_id] uniqueidentifier NOT NULL,
    [opa_bod_id] int
);

CREATE TABLE [operationanaesthesialog] (
    [oan_DateAdded] datetime NOT NULL,
    [oan_AddedBy] uniqueidentifier NOT NULL
);

CREATE TABLE [OperationAnaesthesiaLog] (
    [opa_RouteDescription] nvarchar(510),
    [opa_DrugDescription] nvarchar(510)
);

CREATE TABLE [operationanaesthesialog] (
    [oan_TransactionId] uniqueidentifier NOT NULL,
    [oan_Action] char(1) NOT NULL,
    [oan_deleted] bit,
    [oan_hassedation] bit
);

CREATE TABLE [operationcategory] (
    [oct_id] int NOT NULL PRIMARY KEY,
    [oct_code] varchar(10),
    [oct_description] nvarchar(510),
    [oct_order] int NOT NULL,
    [oct_membership] int,
    [oct_status] int NOT NULL,
    [oct_hsv_id] int
);

CREATE TABLE [operationindication] (
    [eid_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [operationindicationlog] (
    [eid_ObjectId] int NOT NULL,
    [eid_id] int NOT NULL PRIMARY KEY,
    [eid_act_id] uniqueidentifier,
    [eid_bod_id] int,
    [eid_cpt_id] int,
    [eid_DateAdded] datetime NOT NULL,
    [eid_AddedBy] uniqueidentifier NOT NULL,
    [eid_TransactionId] uniqueidentifier NOT NULL,
    [eid_Action] char(1) NOT NULL
);

CREATE TABLE [OperationLog] (
    [opo_ActivityId] int NOT NULL,
    [opo_ObjectId] uniqueidentifier NOT NULL,
    [opo_DateAdded] datetime NOT NULL,
    [opo_AddedBy] uniqueidentifier NOT NULL,
    [opo_TransactionId] uniqueidentifier NOT NULL,
    [opo_Action] char(1) NOT NULL,
    [opo_SelectedOperationEncounterId] uniqueidentifier,
    [opo_SelectedOther] nvarchar(1000),
    [opo_LocalAnaesthetic] bit,
    [opo_GeneralAnaesthetic] bit,
    [opo_HasSedation] bit,
    [opo_SelectedOperationDescription] nvarchar(4000),
    [opo_HasSedationPulledFromOperation] bit,
    [opo_HasLeftProcedure] bit,
    [opo_HasRightProcedure] bit
);

CREATE TABLE [operationprocedure] (
    [prl_id] int NOT NULL PRIMARY KEY,
    [prl_OrderAddedToEncounter] int
);

CREATE TABLE [operationprocedurelog] (
    [prl_ObjectId] int NOT NULL,
    [prl_id] int NOT NULL PRIMARY KEY,
    [prl_act_id] uniqueidentifier NOT NULL,
    [prl_pro_id] int NOT NULL,
    [prl_bod_id] int NOT NULL,
    [prl_narative] nvarchar(510),
    [prl_additionalprocedure] bit,
    [prl_DateAdded] datetime NOT NULL,
    [prl_AddedBy] uniqueidentifier NOT NULL,
    [prl_TransactionId] uniqueidentifier NOT NULL,
    [prl_Action] char(1) NOT NULL,
    [prl_deleted] bit,
    [prl_OrderAddedToEncounter] int
);

CREATE TABLE [operationprocedurequalifier] (
    [plq_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [operationprocedurequalifierlog] (
    [plq_ObjectId] int NOT NULL,
    [plq_id] int NOT NULL PRIMARY KEY,
    [plq_prl_id] int NOT NULL,
    [plq_pqt_id] int,
    [plq_pqi_id] int NOT NULL,
    [plq_order] int NOT NULL,
    [plq_DateAdded] datetime NOT NULL,
    [plq_AddedBy] uniqueidentifier NOT NULL,
    [plq_TransactionId] uniqueidentifier NOT NULL,
    [plq_Action] char(1) NOT NULL
);

CREATE TABLE [OphthalmicInsertionState] (
    [ois_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [OpticDiscAdditionalData] (
    [oda_ect_EncounterId] uniqueidentifier NOT NULL PRIMARY KEY,
    [oda_bod_BodyPartId] int NOT NULL PRIMARY KEY,
    [oda_lks_LensLookupId] int,
    [oda_UnadjustedDiscHeight] decimal(18, 2),
    [oda_EstimatedAdjustedDiscHeight] decimal(18, 2),
    [oda_SpotMagnificationFactor] decimal(18, 2)
);

CREATE TABLE [OpticDiscAdditionalDataLog] (
    [oda_Id] int NOT NULL PRIMARY KEY,
    [oda_ObjectId] uniqueidentifier NOT NULL,
    [oda_DateAdded] datetime NOT NULL,
    [oda_AddedBy] uniqueidentifier NOT NULL,
    [oda_Transactionid] uniqueidentifier NOT NULL,
    [oda_Action] char(1) NOT NULL,
    [oda_bod_BodyPartId] int NOT NULL,
    [oda_lks_LensLookupId] int,
    [oda_UnadjustedDiscHeight] decimal(18, 2),
    [oda_EstimatedAdjustedDiscHeight] decimal(18, 2),
    [oda_SpotMagnificationFactor] decimal(18, 2)
);

CREATE TABLE [OpticDiscScan] (
    [Id] int NOT NULL PRIMARY KEY,
    [OctMachineId] int NOT NULL,
    [AverageRnflThickness] int,
    [SuperiorHemisphereRnflThickness] int,
    [InferiorHemisphereRnflThickness] int,
    [RnflSymmetry] int,
    [SignalStrength] int,
    [RimArea] decimal(18, 2),
    [DiscArea] decimal(18, 2),
    [CupArea] decimal(18, 2),
    [CupToDiscRatio] decimal(18, 2),
    [LinearCupToDiscRatio] decimal(18, 2),
    [VerticalCupToDiscRatio] decimal(18, 2),
    [CupVolume] decimal(18, 2),
    [RimVolume] decimal(18, 2),
    [HorizontalDiscDiameter] decimal(18, 2),
    [VerticalDiscDiameter] decimal(18, 2),
    [SuperiorQuadrantRnflThickness] int,
    [InferiorQuadrantRnflThickness] int,
    [TemporalQuadrantRnflThickness] int,
    [NasalQuadrantRnflThickness] int
);

CREATE TABLE [OpticDiscScanLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL,
    [BodyPartId] int NOT NULL,
    [OctMachineId] int NOT NULL,
    [AverageRnflThickness] int,
    [SuperiorHemisphereRnflThickness] int,
    [InferiorHemisphereRnflThickness] int,
    [RnflSymmetry] int,
    [SignalStrength] int,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [RimArea] decimal(18, 2),
    [DiscArea] decimal(18, 2),
    [CupArea] decimal(18, 2),
    [CupToDiscRatio] decimal(18, 2),
    [LinearCupToDiscRatio] decimal(18, 2),
    [VerticalCupToDiscRatio] decimal(18, 2),
    [CupVolume] decimal(18, 2),
    [RimVolume] decimal(18, 2),
    [HorizontalDiscDiameter] decimal(18, 2),
    [VerticalDiscDiameter] decimal(18, 2),
    [SuperiorQuadrantRnflThickness] int,
    [InferiorQuadrantRnflThickness] int,
    [TemporalQuadrantRnflThickness] int,
    [NasalQuadrantRnflThickness] int
);

CREATE TABLE [OrientationMark] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL,
    [StaticId] int
);

CREATE TABLE [OrientationMarkLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL,
    [StaticId] int
);

CREATE TABLE [Other] (
    [Id] int NOT NULL PRIMARY KEY,
    [TimePostSurgeryHours] int NOT NULL,
    [TimePostSurgeryMinutes] int,
    [Comments] nvarchar(1000)
);

CREATE TABLE [OtherLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TimePostSurgeryHours] int NOT NULL,
    [TimePostSurgeryMinutes] int,
    [Comments] nvarchar(1000)
);

CREATE TABLE [OutboundMessage] (
    [hom_Id] int NOT NULL PRIMARY KEY,
    [hom_DateCreated] datetime2 NOT NULL,
    [hom_MessageContent] varbinary(-1),
    [hom_ErrorReason] nvarchar(2000),
    [hom_hpc_ProcedureCodeId] int,
    [hom_hsn_ScanNotificationId] int,
    [hom_hmd_DestinationId] int,
    [hom_use_TriggeredByUser] uniqueidentifier,
    [hom_bod_BodyPartId] int,
    [hom_mcs_CreationSourceId] int NOT NULL,
    [hom_PatientYearOfBirth] int,
    [hom_lks_PatientGender] int
);

CREATE TABLE [OutboundMessageCreationSource] (
    [mcs_Id] int NOT NULL PRIMARY KEY,
    [mcs_Description] nvarchar(100) NOT NULL
);

CREATE TABLE [OutboundMessageLog] (
    [hom_Id] int NOT NULL PRIMARY KEY,
    [hom_DateCreated] datetime2 NOT NULL,
    [hom_MessageContent] varbinary(-1),
    [hom_ErrorReason] nvarchar(2000),
    [hom_hms_MessageStateId] int NOT NULL,
    [hom_anp_AnonymisedPatientId] int NOT NULL,
    [hom_hpc_ProcedureCodeId] int,
    [hom_ObjectId] int NOT NULL,
    [hom_DateAdded] datetime NOT NULL,
    [hom_AddedBy] uniqueidentifier NOT NULL,
    [hom_TransactionId] uniqueidentifier NOT NULL,
    [hom_Action] char(1) NOT NULL,
    [hom_omt_MessageTypeId] int NOT NULL,
    [hom_hsn_ScanNotificationId] int,
    [hom_hmd_DestinationId] int,
    [hom_use_TriggeredByUser] uniqueidentifier,
    [hom_bod_BodyPartId] int,
    [hom_mcs_CreationSourceId] int NOT NULL,
    [hom_PatientYearOfBirth] int,
    [hom_lks_PatientGender] int,
    [hom_IsRegistrationMessage] bit NOT NULL
);

CREATE TABLE [OutboundMessageType] (
    [omt_Id] int NOT NULL PRIMARY KEY,
    [omt_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [Outcome] (
    [Id] int NOT NULL PRIMARY KEY,
    [iro_id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [OutcomeId] int NOT NULL,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [ReferralToTreatmentId] int,
    [Comments] nvarchar(1000),
    [Order] int NOT NULL,
    [PriorityId] int NOT NULL,
    [PrimarilyReferredForId] int,
    [CarePathwayId] int
);

CREATE TABLE [OutcomeLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [OutcomeId] int NOT NULL,
    [ReferralToTreatmentId] int,
    [Comments] nvarchar(1000),
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [OutgoingInterfaceInclusion] (
    [PathwayId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [OverAction] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActionDescription] nvarchar(60) NOT NULL
);

CREATE TABLE [pachymetry] (
    [pac_id] int NOT NULL PRIMARY KEY,
    [pac_value] int,
    [pac_correctionfactor] float(8),
    [pac_stdev] float(8),
    [pac_lks_id_machine] int
);

CREATE TABLE [pachymetrylog] (
    [pac_ObjectId] int NOT NULL,
    [pac_id] int NOT NULL PRIMARY KEY,
    [pac_act_id] uniqueidentifier NOT NULL,
    [pac_bod_id] int NOT NULL,
    [pac_value] int,
    [pac_correctionfactor] float(8),
    [pac_stdev] float(8),
    [pac_lks_id_machine] int,
    [pac_DateAdded] datetime NOT NULL,
    [pac_AddedBy] uniqueidentifier NOT NULL,
    [pac_TransactionId] uniqueidentifier NOT NULL,
    [pac_Action] char(1) NOT NULL
);

CREATE TABLE [PachymetryReview] (
    [spa_smt_StudyMonitoringActivityId] int NOT NULL PRIMARY KEY,
    [spa_bod_BodyPartId] int NOT NULL PRIMARY KEY,
    [spa_smr_ReviewTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PachymetryReviewLog] (
    [spa_smt_StudyMonitoringActivityId] int NOT NULL PRIMARY KEY,
    [spa_ObjectId] int NOT NULL,
    [spa_DateAdded] datetime NOT NULL,
    [spa_AddedBy] uniqueidentifier NOT NULL,
    [spa_TransactionId] uniqueidentifier NOT NULL,
    [spa_Action] char(1) NOT NULL,
    [spa_bod_BodyPartId] int NOT NULL,
    [spa_smr_ReviewTypeId] int NOT NULL
);

CREATE TABLE [Package] (
    [pkg_Id] int NOT NULL PRIMARY KEY,
    [pkg_Description] nvarchar(500) NOT NULL,
    [pkg_PublishedDate] datetime NOT NULL,
    [pkg_use_PublishedById] uniqueidentifier NOT NULL,
    [pkg_Package] xml(-1) NOT NULL
);

CREATE TABLE [PackageArtefact] (
    [pka_Id] int NOT NULL PRIMARY KEY,
    [pka_Artefact] xml(-1) NOT NULL
);

CREATE TABLE [PackagedEncounterTemplateVersion] (
    [ptv_pkg_PackageId] int NOT NULL PRIMARY KEY,
    [ptv_etv_EncounterTemplateVersionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PackageType] (
    [pmt_Id] int NOT NULL PRIMARY KEY,
    [pmt_Name] nvarchar(200) NOT NULL,
    [pmt_Description] nvarchar(500),
    [pmt_SubscriptionDate] datetime
);

CREATE TABLE [Pane] (
    [Id] int NOT NULL PRIMARY KEY,
    [Value] int NOT NULL,
    [Description] varchar(256) NOT NULL
);

CREATE TABLE [Paracentesis] (
    [spd_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [gps_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ClockHourValue] int NOT NULL PRIMARY KEY,
    [gps_Value] int NOT NULL PRIMARY KEY,
    [ClockHourValue] int NOT NULL PRIMARY KEY,
    [spd_Value] tinyint(1) NOT NULL PRIMARY KEY,
    [spd_bod_id] int NOT NULL PRIMARY KEY,
    [BodyPartId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ParacentesisLog] (
    [gps_ActivityId] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [spd_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [spd_ObjectId] int NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] int NOT NULL,
    [gps_ObjectId] uniqueidentifier NOT NULL,
    [gps_DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [spd_DateAdded] datetime NOT NULL,
    [spd_AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [gps_AddedBy] uniqueidentifier NOT NULL,
    [gps_Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [spd_Transactionid] uniqueidentifier NOT NULL,
    [spd_Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [gps_Action] char(1) NOT NULL,
    [gps_Value] int NOT NULL,
    [ClockHourValue] int NOT NULL,
    [ClockHourValue] int NOT NULL,
    [spd_Value] int,
    [spd_bod_id] tinyint(1),
    [BodyPartId] int NOT NULL
);

CREATE TABLE [Parity] (
    [sdp_id] int NOT NULL PRIMARY KEY,
    [sdp_description] nvarchar(200) NOT NULL
);

CREATE TABLE [partialdate] (
    [pdt_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [pdt_day] int,
    [pdt_month] int,
    [pdt_year] int,
    [pdt_entiredate] datetime
);

CREATE TABLE [partialdatelog] (
    [pdt_ObjectId] uniqueidentifier NOT NULL,
    [pdt_id] int NOT NULL PRIMARY KEY,
    [pdt_day] int,
    [pdt_month] int,
    [pdt_year] int,
    [pdt_entiredate] datetime,
    [pdt_DateAdded] datetime NOT NULL,
    [pdt_AddedBy] uniqueidentifier NOT NULL,
    [pdt_TransactionId] uniqueidentifier NOT NULL,
    [pdt_Action] char(1) NOT NULL
);

CREATE TABLE [PartialSave] (
    [bps_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Partner] (
    [Id] int NOT NULL PRIMARY KEY,
    [IsEnabled] bit NOT NULL,
    [InterfaceTypeId] int
);

CREATE TABLE [PartnerProgramme] (
    [PartnerId] int NOT NULL PRIMARY KEY,
    [ProgrammeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [passwordhistory] (
    [pwh_id] int NOT NULL PRIMARY KEY,
    [pwh_use_id] uniqueidentifier NOT NULL,
    [pwh_password] varchar(255) NOT NULL,
    [pwh_passwordsalt] varchar(255) NOT NULL,
    [pwh_datechanged] datetime NOT NULL
);

CREATE TABLE [PastMedicalHistory] (
    [med_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [med_HideNegated] bit NOT NULL
);

CREATE TABLE [PastMedicalHistoryLog] (
    [med_act_ActivityId] int NOT NULL PRIMARY KEY,
    [med_ObjectId] uniqueidentifier NOT NULL,
    [med_DateAdded] datetime NOT NULL,
    [med_AddedBy] uniqueidentifier NOT NULL,
    [med_Transactionid] uniqueidentifier NOT NULL,
    [med_Action] char(1) NOT NULL,
    [med_HideNegated] bit NOT NULL
);

CREATE TABLE [PatchCategory] (
    [pct_id] int NOT NULL PRIMARY KEY,
    [pct_description] nvarchar(510) NOT NULL
);

CREATE TABLE [PatchingAudit] (
    [PatchAuditId] int NOT NULL PRIMARY KEY,
    [Messages] varchar(MAX) NOT NULL,
    [InsertDateTime] datetime NOT NULL,
    [PatchSyntax] nvarchar(MAX)
);

CREATE TABLE [PatchInstallation] (
    [pns_id] int NOT NULL PRIMARY KEY,
    [pns_pts_id] int NOT NULL,
    [pns_versiondisplay] nvarchar(400) NOT NULL,
    [pns_dateinstalled] datetime,
    [pns_datedatasource] datetime,
    [pns_error] nvarchar(MAX)
);

CREATE TABLE [PatchLocale] (
    [pce_id] int NOT NULL PRIMARY KEY,
    [pce_pty_id] int NOT NULL,
    [pce_locale] nvarchar(20) NOT NULL
);

CREATE TABLE [PatchState] (
    [pts_id] int NOT NULL PRIMARY KEY,
    [pts_description] nvarchar(510) NOT NULL
);

CREATE TABLE [PatchType] (
    [pty_id] int NOT NULL PRIMARY KEY,
    [pty_pct_id] int NOT NULL,
    [pty_description] nvarchar(510) NOT NULL
);

CREATE TABLE [Pathway] (
    [ppw_id] int NOT NULL PRIMARY KEY,
    [cpw_id] int NOT NULL PRIMARY KEY,
    [CarePathwayId] int NOT NULL PRIMARY KEY,
    [IsActive] bit NOT NULL,
    [cpw_name] nvarchar(100),
    [cpw_displayname] nvarchar(100),
    [ForReviewDefaultId] int NOT NULL,
    [DefaultReviewerUserId] uniqueidentifier,
    [cpw_spe_id_subspecialty] int NOT NULL,
    [cpw_use_id_leadclinician] uniqueidentifier,
    [DefaultReviewerUserGroupId] uniqueidentifier,
    [ClinicReviewerOverride] bit NOT NULL,
    [cpw_col_id] int NOT NULL,
    [cpw_active] bit
);

CREATE TABLE [PathwayAssessmentType] (
    [PathwayId] int NOT NULL PRIMARY KEY,
    [AssessmentTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PathwayAssessmentTypeLog] (
    [PathwayId] int NOT NULL PRIMARY KEY,
    [AssessmentTypeId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [PathwayLog] (
    [CarePathwayId] int NOT NULL PRIMARY KEY,
    [IsActive] bit NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ForReviewDefaultId] int NOT NULL,
    [DefaultReviewerUserId] uniqueidentifier,
    [DefaultReviewerUserGroupId] uniqueidentifier,
    [ClinicReviewerOverride] bit NOT NULL
);

CREATE TABLE [PathwayVersion] (
    [ppv_id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [StratificationSystemVersionId] int NOT NULL,
    [RiskScorePerEye] bit NOT NULL,
    [RedFlagsPlusFactors] bit NOT NULL,
    [GuidanceText] nvarchar(MAX),
    [DateModified] datetime NOT NULL,
    [Active] bit NOT NULL
);

CREATE TABLE [PathwayVersionDischargeReason] (
    [pcd_ppv_id] int NOT NULL PRIMARY KEY,
    [pcd_cdr_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PathwayVersionLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ppv_id] int NOT NULL PRIMARY KEY,
    [ppv_ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [ppv_DateAdded] datetime NOT NULL,
    [ppv_AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [ppv_TransactionId] uniqueidentifier NOT NULL,
    [ppv_Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [CarePathwayId] int NOT NULL,
    [ppv_versionEffectiveDate] datetime2 NOT NULL,
    [ppv_ppw_id] int NOT NULL,
    [StratificationSystemVersionId] int NOT NULL,
    [RiskScorePerEye] bit NOT NULL,
    [ppv_cpw_id] int NOT NULL,
    [ppv_pcs_id] int NOT NULL,
    [RedFlagsPlusFactors] bit NOT NULL,
    [GuidanceText] nvarchar(MAX),
    [ppv_use_id_responsible] uniqueidentifier,
    [ppv_comments] nvarchar(500),
    [DateModified] datetime NOT NULL,
    [Active] bit NOT NULL,
    [ppv_startDate] datetime,
    [ppv_dischargeDate] datetime,
    [ppv_dischargeComments] nvarchar(500),
    [ppv_rolledBack] bit NOT NULL,
    [ppv_use_id_editedBy] uniqueidentifier NOT NULL,
    [ppv_ect_id_editedFrom] uniqueidentifier,
    [ppv_ect_id_relatedWith] uniqueidentifier
);

CREATE TABLE [Patient] (
    [pcl_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [patient] (
    [pat_id] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [Patient] (
    [Id] int NOT NULL PRIMARY KEY,
    [PatientNumber] nvarchar(510) NOT NULL,
    [pcl_pat_id] uniqueidentifier NOT NULL,
    [pcl_pnt_id] int NOT NULL
);

CREATE TABLE [patient] (
    [pat_initials] nvarchar(510)
);

CREATE TABLE [Patient] (
    [Forename] nvarchar(510) NOT NULL,
    [Surname] nvarchar(510) NOT NULL
);

CREATE TABLE [patient] (
    [pat_forename] nvarchar(510)
);

CREATE TABLE [Patient] (
    [pcl_patientNumber] varchar(50),
    [pcl_dateOfConsent] datetime
);

CREATE TABLE [patient] (
    [pat_title] nvarchar(510)
);

CREATE TABLE [Patient] (
    [DateOfBirth] date(3) NOT NULL
);

CREATE TABLE [patient] (
    [pat_suffix] nvarchar(510)
);

CREATE TABLE [Patient] (
    [pcl_csw_id] int NOT NULL,
    [pcl_bod_id] int
);

CREATE TABLE [patient] (
    [pat_previoussurname] nvarchar(510),
    [pat_requestedname] nvarchar(510)
);

CREATE TABLE [Patient] (
    [pcl_comments] varchar(2000),
    [pcl_endDate] datetime,
    [pcl_lks_id] int
);

CREATE TABLE [patient] (
    [pat_dod] date(3),
    [pat_lks_id_gender] int,
    [pat_lks_id_ethnic] int,
    [pat_lks_id_religion] int,
    [pat_lks_id_language] int,
    [pat_lks_id_marital] int,
    [pat_deceased] tinyint(1),
    [pat_occupation] nvarchar(510),
    [pat_lastupdatedfromdemographicstore] datetime,
    [pat_blb_id] uniqueidentifier,
    [pat_lks_id_nationality] int,
    [pat_source] int NOT NULL,
    [pat_yearOfBirth] int,
    [pat_anonymisedAddedBy] uniqueidentifier
);

CREATE TABLE [patientaddress] (
    [pad_id] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [patientaddresslog] (
    [pad_ObjectId] uniqueidentifier NOT NULL,
    [pad_id] int NOT NULL PRIMARY KEY,
    [pad_pat_id] uniqueidentifier NOT NULL,
    [pad_address1] nvarchar(510),
    [pad_address2] nvarchar(510),
    [pad_address3] nvarchar(510),
    [pad_address4] nvarchar(510),
    [pad_address5] nvarchar(510),
    [pad_postcode] varchar(255),
    [pad_lks_id_type] int NOT NULL,
    [pad_DateAdded] datetime NOT NULL,
    [pad_AddedBy] uniqueidentifier NOT NULL,
    [pad_TransactionId] uniqueidentifier NOT NULL,
    [pad_Action] char(1) NOT NULL
);

CREATE TABLE [patientalert] (
    [plt_id] int NOT NULL PRIMARY KEY,
    [plt_lks_id_alertcategory] int NOT NULL,
    [plt_lks_id_alerttype] int NOT NULL,
    [plt_dategenerated] datetime NOT NULL,
    [plt_dateclosed] datetime,
    [plt_message] varchar(1024),
    [plt_bodypart] int
);

CREATE TABLE [patientalertlog] (
    [plt_ObjectId] int NOT NULL,
    [plt_id] int NOT NULL PRIMARY KEY,
    [plt_pat_id] uniqueidentifier NOT NULL,
    [plt_ect_id] uniqueidentifier,
    [plt_lks_id_alertcategory] int NOT NULL,
    [plt_lks_id_alerttype] int NOT NULL,
    [plt_dategenerated] datetime NOT NULL,
    [plt_dateclosed] datetime,
    [plt_message] varchar(1024),
    [plt_bodypart] int,
    [plt_DateAdded] datetime NOT NULL,
    [plt_AddedBy] uniqueidentifier NOT NULL,
    [plt_TransactionId] uniqueidentifier NOT NULL,
    [plt_Action] char(1) NOT NULL
);

CREATE TABLE [PatientAlertUserAcknowledgement] (
    [auk_Id] int NOT NULL PRIMARY KEY,
    [auk_plt_Id] int NOT NULL,
    [auk_DateTimeAcknowledged] datetime NOT NULL
);

CREATE TABLE [patientallergy] (
    [pll_id] int NOT NULL,
    [pll_pss_id] int NOT NULL PRIMARY KEY,
    [pll_ect_id] uniqueidentifier,
    [pll_ReasonNotRecorded] nvarchar(510),
    [pll_StatusConfirmed] bit,
    [pll_StatusCheckedDateTime] datetime
);

CREATE TABLE [patientallergyitem] (
    [pal_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientAllergyItemDuplicateMedicationRemovalBackup] (
    [pal_id] int NOT NULL PRIMARY KEY,
    [pal_pss_id] int NOT NULL,
    [pal_lks_id_allergytype] int,
    [pal_lks_id_status] int,
    [pal_substance] nvarchar(510),
    [pal_dmy_id] int,
    [pal_otherreactionsanddetails] nvarchar(510),
    [pal_dateupdated] datetime,
    [pal_use_id_recordedby] uniqueidentifier,
    [pal_lks_id_substance] int,
    [pal_dfy_id] int,
    [pal_oldpalid] int
);

CREATE TABLE [patientallergyitemhistory] (
    [pah_id] int NOT NULL PRIMARY KEY,
    [pah_lks_id_status] int NOT NULL,
    [pah_changed] nvarchar(510),
    [pah_use_id_recordedby] uniqueidentifier,
    [pah_datechanged] datetime
);

CREATE TABLE [patientallergyitemlog] (
    [pal_ObjectId] int NOT NULL,
    [pal_id] int NOT NULL PRIMARY KEY,
    [pal_pss_id] int NOT NULL,
    [pal_lks_id_allergytype] int,
    [pal_lks_id_status] int,
    [pal_substance] nvarchar(510),
    [pal_dmy_id] int,
    [pal_otherreactionsanddetails] nvarchar(510),
    [pal_dateupdated] datetime,
    [pal_use_id_recordedby] uniqueidentifier,
    [pal_lks_id_substance] int,
    [pal_dfy_id] int,
    [pal_oldpalid] int,
    [pal_DateAdded] datetime NOT NULL,
    [pal_AddedBy] uniqueidentifier NOT NULL,
    [pal_TransactionId] uniqueidentifier NOT NULL,
    [pal_Action] char(1) NOT NULL
);

CREATE TABLE [patientallergyitemsource] (
    [pis_id] int NOT NULL PRIMARY KEY,
    [pis_lks_id_source] int NOT NULL,
    [pis_othersource] nvarchar(510)
);

CREATE TABLE [patientallergyitemsourcelog] (
    [pis_ObjectId] int NOT NULL,
    [pis_id] int NOT NULL PRIMARY KEY,
    [pis_pal_id] int NOT NULL,
    [pis_lks_id_source] int NOT NULL,
    [pis_othersource] nvarchar(510),
    [pis_DateAdded] datetime NOT NULL,
    [pis_AddedBy] uniqueidentifier NOT NULL,
    [pis_TransactionId] uniqueidentifier NOT NULL,
    [pis_Action] char(1) NOT NULL
);

CREATE TABLE [PatientCarePathwayExtractState] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [patientclinicalplan] (
    [pln_id] int NOT NULL PRIMARY KEY,
    [pln_ect_id_created] uniqueidentifier,
    [pln_actiondate] datetime,
    [pln_expiredate] datetime,
    [pln_ect_id_actioned] uniqueidentifier,
    [pln_act_id_actioned] uniqueidentifier,
    [pln_cou_id] int,
    [pln_comment] nvarchar(MAX),
    [pln_addedasdefault] bit NOT NULL
);

CREATE TABLE [patientclinicalplan_Backup_Patch508] (
    [pln_id] int NOT NULL,
    [pln_pat_id] uniqueidentifier NOT NULL,
    [pln_pit_id] int,
    [pln_use_id_added] uniqueidentifier,
    [pln_ect_id_created] uniqueidentifier,
    [pln_actiondate] datetime,
    [pln_expiredate] datetime,
    [pln_ect_id_actioned] uniqueidentifier,
    [pln_act_id_actioned] uniqueidentifier,
    [pln_cou_id] int,
    [pln_status] int,
    [pln_datecreated] datetime,
    [pln_comment] nvarchar(4000),
    [pln_versionid] uniqueidentifier,
    [pln_oldplnid] int,
    [pln_versiondate] datetime,
    [pln_versionfrom] int NOT NULL,
    [pln_versionto] int NOT NULL,
    [pln_addedasdefault] bit NOT NULL,
    [pln_ect_id_completed] uniqueidentifier
);

CREATE TABLE [patientclinicalplanhistory] (
    [plh_id] int NOT NULL PRIMARY KEY,
    [plh_updatereason] varchar(255)
);

CREATE TABLE [PatientClinicalPlanHistoryRemovalBackup] (
    [plh_id] int NOT NULL PRIMARY KEY,
    [plh_pln_id] int,
    [plh_lks_id_status] int,
    [plh_use_id_updated] uniqueidentifier,
    [plh_dateupdated] datetime,
    [plh_loc_id] uniqueidentifier,
    [plh_updatereason] varchar(255),
    [plh_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [PatientClinicalPlanRemovalBackup] (
    [pln_id] int NOT NULL PRIMARY KEY,
    [pln_use_id_added] uniqueidentifier,
    [pln_ect_id_created] uniqueidentifier,
    [pln_actiondate] datetime,
    [pln_expiredate] datetime,
    [pln_ect_id_actioned] uniqueidentifier,
    [pln_act_id_actioned] uniqueidentifier,
    [pln_cou_id] int,
    [pln_status] int,
    [pln_datecreated] datetime,
    [pln_comment] nvarchar(MAX),
    [pln_versionid] uniqueidentifier,
    [pln_oldplnid] int,
    [pln_versiondate] datetime NOT NULL,
    [pln_versionfrom] int NOT NULL,
    [pln_versionto] int NOT NULL,
    [pln_addedasdefault] bit NOT NULL,
    [pln_ect_id_completed] uniqueidentifier,
    [pln_ppr_id] int NOT NULL,
    [pln_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [patientclinicalplanroot] (
    [ppr_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [patientcontact] (
    [pco_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [pco_value] nvarchar(510),
    [pco_lks_id_contact] int NOT NULL,
    [pco_preferred] tinyint(1) NOT NULL
);

CREATE TABLE [patientcontactlog] (
    [pco_ObjectId] uniqueidentifier NOT NULL,
    [pco_id] int NOT NULL PRIMARY KEY,
    [pco_pat_id] uniqueidentifier NOT NULL,
    [pco_value] nvarchar(510),
    [pco_lks_id_contact] int NOT NULL,
    [pco_preferred] tinyint(1) NOT NULL,
    [pco_DateAdded] datetime NOT NULL,
    [pco_AddedBy] uniqueidentifier NOT NULL,
    [pco_TransactionId] uniqueidentifier NOT NULL,
    [pco_Action] char(1) NOT NULL
);

CREATE TABLE [PatientDeceasedRequest] (
    [RequestId] int NOT NULL PRIMARY KEY,
    [IsPatientDeceased] bit NOT NULL,
    [DateOfDeath] date(3)
);

CREATE TABLE [PatientDeceasedStatusHistory] (
    [Id] int NOT NULL PRIMARY KEY,
    [PatientDemographicStoreId] int NOT NULL,
    [Deceased] bit NOT NULL,
    [DateOfDeath] date(3),
    [Source] int NOT NULL,
    [UpdatedOn] datetime2 NOT NULL
);

CREATE TABLE [patientdemographicstore] (
    [pdm_id] int NOT NULL PRIMARY KEY,
    [pdm_initials] nvarchar(510),
    [pdm_title] nvarchar(510),
    [pdm_suffix] nvarchar(510),
    [pdm_previoussurname] nvarchar(510),
    [pdm_requestedname] nvarchar(510),
    [pdm_occupation] nvarchar(510),
    [pdm_dod] date(3),
    [pdm_deceased] tinyint(1),
    [pdm_gender] nvarchar(510),
    [pdm_ethnic] nvarchar(510),
    [pdm_religion] nvarchar(510),
    [pdm_language] varchar(255),
    [pdm_marital] nvarchar(510),
    [pdm_address1] nvarchar(510),
    [pdm_address2] nvarchar(510),
    [pdm_address3] nvarchar(510),
    [pdm_address4] nvarchar(510),
    [pdm_address5] nvarchar(510),
    [pdm_phoneday] varchar(255),
    [pdm_phoneevening] varchar(255),
    [pdm_phonemobile] varchar(255),
    [pdm_email] nvarchar(510),
    [pdm_blb_id] uniqueidentifier,
    [pdm_nationality] nvarchar(510),
    [pdm_noksurname] nvarchar(510),
    [pdm_nokinitials] nvarchar(510),
    [pdm_nokforename] nvarchar(510),
    [pdm_noktitle] nvarchar(510),
    [pdm_nokrelation] nvarchar(510),
    [pdm_nokaddress1] nvarchar(510),
    [pdm_nokaddress2] nvarchar(510),
    [pdm_nokaddress3] nvarchar(510),
    [pdm_nokaddress4] nvarchar(510),
    [pdm_nokaddress5] nvarchar(510),
    [pdm_nokpostcode] varchar(255),
    [pdm_nokphoneday] varchar(255),
    [pdm_nokphoneevening] varchar(255),
    [pdm_nokphonemobile] varchar(255),
    [pdm_source] int NOT NULL,
    [pdm_nokrelationothertext] nvarchar(510),
    [pdm_yearOfBirth] int
);

CREATE TABLE [patientdemographicstore_bak_20200109] (
    [pdm_id] int NOT NULL,
    [pdm_surname] nvarchar(510),
    [pdm_initials] nvarchar(510),
    [pdm_forename] nvarchar(510),
    [pdm_title] nvarchar(510),
    [pdm_suffix] nvarchar(510),
    [pdm_previoussurname] nvarchar(510),
    [pdm_requestedname] nvarchar(510),
    [pdm_occupation] nvarchar(510),
    [pdm_dob] date(3),
    [pdm_dod] date(3),
    [pdm_deceased] tinyint(1),
    [pdm_gender] nvarchar(510),
    [pdm_ethnic] nvarchar(510),
    [pdm_religion] nvarchar(510),
    [pdm_language] varchar(255),
    [pdm_marital] nvarchar(510),
    [pdm_address1] nvarchar(510),
    [pdm_address2] nvarchar(510),
    [pdm_address3] nvarchar(510),
    [pdm_address4] nvarchar(510),
    [pdm_address5] nvarchar(510),
    [pdm_postcode] nvarchar(510),
    [pdm_phoneday] varchar(255),
    [pdm_phoneevening] varchar(255),
    [pdm_phonemobile] varchar(255),
    [pdm_email] nvarchar(510),
    [pdm_lastupdated] datetime,
    [pdm_pat_id] uniqueidentifier,
    [pdm_blb_id] uniqueidentifier,
    [pdm_nationality] nvarchar(510),
    [pdm_noksurname] nvarchar(510),
    [pdm_nokinitials] nvarchar(510),
    [pdm_nokforename] nvarchar(510),
    [pdm_noktitle] nvarchar(510),
    [pdm_nokrelation] nvarchar(510),
    [pdm_nokaddress1] nvarchar(510),
    [pdm_nokaddress2] nvarchar(510),
    [pdm_nokaddress3] nvarchar(510),
    [pdm_nokaddress4] nvarchar(510),
    [pdm_nokaddress5] nvarchar(510),
    [pdm_nokpostcode] varchar(255),
    [pdm_nokphoneday] varchar(255),
    [pdm_nokphoneevening] varchar(255),
    [pdm_nokphonemobile] varchar(255),
    [pdm_source] int NOT NULL,
    [pdm_isdeleted] bit NOT NULL,
    [pdm_nokrelationothertext] nvarchar(510)
);

CREATE TABLE [patientdemographicstorenumber] (
    [pdn_id] int NOT NULL PRIMARY KEY,
    [pdn_HospitalNumberSubtypeId] int
);

CREATE TABLE [PatientDemographicStoreNumber_Backup_183600] (
    [pdn_id] int NOT NULL,
    [pdn_pdm_id] int,
    [pdn_number] nvarchar(510),
    [pdn_numberstatus] varchar(255),
    [pdn_pnt_id] int NOT NULL,
    [pdn_active] bit NOT NULL,
    [pdn_HospitalNumberSubtypeId] int,
    [InsertDateUtc] datetime2
);

CREATE TABLE [patientdemographicstorenumber_bak_20200109] (
    [pdn_id] int NOT NULL,
    [pdn_pdm_id] int,
    [pdn_number] nvarchar(510),
    [pdn_numberstatus] varchar(255),
    [pdn_pnt_id] int NOT NULL,
    [pdn_active] bit NOT NULL
);

CREATE TABLE [patientdemographicstorepractitioner] (
    [dpr_id] int NOT NULL PRIMARY KEY,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [patientdiabetic] (
    [pdi_id] int NOT NULL,
    [pdi_pss_id] int NOT NULL PRIMARY KEY,
    [pdi_lks_id_diabetictype] int,
    [pdi_lks_id_diseasestatus] int,
    [pdi_agediagnosed] int,
    [pdi_pdt_id_datediagnosed] uniqueidentifier,
    [pdi_ect_id] uniqueidentifier,
    [pdi_pdt_diseasestatusdate] uniqueidentifier,
    [pdi_duration] int,
    [pdi_source] int
);

CREATE TABLE [patientdiabeticcontrolled] (
    [pdc_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [patientdischarge] (
    [pdh_id] int NOT NULL PRIMARY KEY,
    [pdh_interval] int,
    [pdh_lks_id_intervaltype] int,
    [pdh_openappointment] bit,
    [pdh_comment] nvarchar(8000)
);

CREATE TABLE [patientdischargereason] (
    [pdr_id] int NOT NULL PRIMARY KEY,
    [pdr_pdh_id] int,
    [pdr_lks_id_dischargereason] int
);

CREATE TABLE [patientdocumentlink] (
    [dpt_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientEncounterExamination] (
    [dpx_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientEncounterExaminationLog] (
    [dpx_ObjectId] int NOT NULL,
    [dpx_id] int NOT NULL PRIMARY KEY,
    [dpx_ect_id] uniqueidentifier NOT NULL,
    [dpx_dax_id] int NOT NULL,
    [dpx_DateAdded] datetime NOT NULL,
    [dpx_AddedBy] uniqueidentifier NOT NULL,
    [dpx_Transactionid] uniqueidentifier NOT NULL,
    [dpx_Action] char(1) NOT NULL
);

CREATE TABLE [PatientEncounterSection] (
    [dpe_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientEncounterSectionLog] (
    [dpe_ObjectId] int NOT NULL,
    [dpe_id] int NOT NULL PRIMARY KEY,
    [dpe_ect_id] uniqueidentifier NOT NULL,
    [dpe_das_id] int NOT NULL,
    [dpe_DateAdded] datetime NOT NULL,
    [dpe_AddedBy] uniqueidentifier NOT NULL,
    [dpe_Transactionid] uniqueidentifier NOT NULL,
    [dpe_Action] char(1) NOT NULL
);

CREATE TABLE [PatientExternalIdentifier] (
    [pei_id] int NOT NULL PRIMARY KEY,
    [pei_pet_id] int NOT NULL,
    [pei_identifier] nvarchar(400) NOT NULL
);

CREATE TABLE [PatientExternalIdentifierLog] (
    [pei_ObjectId] int NOT NULL,
    [pei_id] int NOT NULL PRIMARY KEY,
    [pei_pat_id] uniqueidentifier NOT NULL,
    [pei_pet_id] int NOT NULL,
    [pei_identifier] nvarchar(400) NOT NULL,
    [pei_DateAdded] datetime NOT NULL,
    [pei_AddedBy] uniqueidentifier NOT NULL,
    [pei_Transactionid] uniqueidentifier NOT NULL,
    [pei_Action] char(1) NOT NULL
);

CREATE TABLE [PatientExternalIdentifierType] (
    [pet_id] int NOT NULL PRIMARY KEY,
    [pet_description] nvarchar(200) NOT NULL
);

CREATE TABLE [patientfasting] (
    [pfs_id] int NOT NULL PRIMARY KEY,
    [pfs_instructionsgiven] bit,
    [pfs_nofoodfromapplicable] bit,
    [pfs_nofoodfrom] time(5),
    [pfs_nilbymouthapplicable] bit,
    [pfs_nilbymouthfrom] time(5)
);

CREATE TABLE [patientfastinglog] (
    [pfs_ObjectId] int NOT NULL,
    [pfs_id] int NOT NULL PRIMARY KEY,
    [pfs_act_id] uniqueidentifier NOT NULL,
    [pfs_instructionsgiven] bit,
    [pfs_nofoodfromapplicable] bit,
    [pfs_nofoodfrom] time(5),
    [pfs_nilbymouthapplicable] bit,
    [pfs_nilbymouthfrom] time(5),
    [pfs_DateAdded] datetime NOT NULL,
    [pfs_AddedBy] uniqueidentifier NOT NULL,
    [pfs_TransactionId] uniqueidentifier NOT NULL,
    [pfs_Action] char(1) NOT NULL
);

CREATE TABLE [patientfinding] (
    [pfd_id] int NOT NULL PRIMARY KEY,
    [pfd_bod_id] int,
    [pfd_cpy_id] int NOT NULL,
    [pfd_notes] nvarchar(4096),
    [pfd_parsedtext] nvarchar(4000),
    [pfd_value] decimal(18, 2),
    [pfd_active] bit,
    [pfd_datefrom] datetime,
    [pfd_dateto] datetime,
    [pfd_daterecorded] datetime,
    [pfd_principal] bit,
    [pfd_derived] bit,
    [pfd_source] bit,
    [pfd_cfd_id] int,
    [pfd_nad] bit NOT NULL,
    [pfd_comment] bit NOT NULL,
    [pfd_pdt_approxdate] int,
    [pfd_lks_id_status] int,
    [pfd_use_id_recordedby] uniqueidentifier,
    [pfd_lks_id_certainty] int,
    [pfd_negated] bit NOT NULL,
    [pfd_bsm_id] int,
    [pfd_eyeproblem] bit,
    [pfd_pfd_id_promotedproblem] int,
    [pfd_pdt_datefrom] uniqueidentifier,
    [pfd_pdt_dateto] uniqueidentifier,
    [pfd_type] int,
    [pfd_lks_id_measurement] int,
    [pfd_lks_id_machine] int,
    [pfd_measure_int] int,
    [pfd_measure_decimal] decimal(18, 2),
    [pfd_ccp_id] int
);

CREATE TABLE [patientfindinglog] (
    [pfd_ObjectId] int NOT NULL,
    [pfd_id] int NOT NULL PRIMARY KEY,
    [pfd_bod_id] int,
    [pfd_ect_id] uniqueidentifier,
    [pfd_cpt_id] int,
    [pfd_cpy_id] int NOT NULL,
    [pfd_notes] nvarchar(4096),
    [pfd_parsedtext] nvarchar(4000),
    [pfd_value] decimal(18, 2),
    [pfd_active] bit,
    [pfd_datefrom] datetime,
    [pfd_dateto] datetime,
    [pfd_daterecorded] datetime,
    [pfd_principal] bit,
    [pfd_derived] bit,
    [pfd_source] bit,
    [pfd_pat_id] uniqueidentifier NOT NULL,
    [pfd_cfd_id] int,
    [pfd_nad] bit NOT NULL,
    [pfd_comment] bit NOT NULL,
    [pfd_pdt_approxdate] int,
    [pfd_lks_id_status] int,
    [pfd_use_id_recordedby] uniqueidentifier,
    [pfd_lks_id_certainty] int,
    [pfd_negated] bit,
    [pfd_bsm_id] int,
    [pfd_eyeproblem] bit,
    [pfd_pfd_id_promotedproblem] int,
    [pfd_pdt_datefrom] uniqueidentifier,
    [pfd_pdt_dateto] uniqueidentifier,
    [pfd_type] int,
    [pfd_lks_id_measurement] int,
    [pfd_lks_id_machine] int,
    [pfd_measure_int] int,
    [pfd_measure_decimal] decimal(18, 2),
    [pfd_ccp_id] int,
    [pfd_DateAdded] datetime NOT NULL,
    [pfd_AddedBy] uniqueidentifier NOT NULL,
    [pfd_TransactionId] uniqueidentifier NOT NULL,
    [pfd_Action] char(1) NOT NULL
);

CREATE TABLE [patientfindingqualifier] (
    [pfq_id] int NOT NULL PRIMARY KEY,
    [pfq_cql_id] int,
    [pfq_cpt_id] int,
    [pfq_freetext] nvarchar(510),
    [pfd_number] int
);

CREATE TABLE [patientfindingqualifierlog] (
    [pfq_ObjectId] int NOT NULL,
    [pfq_id] int NOT NULL PRIMARY KEY,
    [pfq_pfd_id] int NOT NULL,
    [pfq_cql_id] int,
    [pfq_cpt_id] int,
    [pfq_freetext] nvarchar(510),
    [pfd_number] int,
    [pfq_DateAdded] datetime NOT NULL,
    [pfq_AddedBy] uniqueidentifier NOT NULL,
    [pfq_TransactionId] uniqueidentifier NOT NULL,
    [pfq_Action] char(1) NOT NULL
);

CREATE TABLE [PatientFindings] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL,
    [BodyPartId] int NOT NULL,
    [ClinicalConceptId] int,
    [Notes] nvarchar(4000),
    [ParsedText] nvarchar(4000),
    [PatientId] uniqueidentifier NOT NULL,
    [MappedFromFeature] bit NOT NULL
);

CREATE TABLE [PatientFindingsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL,
    [BodyPartId] int NOT NULL,
    [ClinicalConceptId] int,
    [Notes] nvarchar(4000),
    [ParsedText] nvarchar(4000),
    [PatientId] uniqueidentifier NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [MappedFromFeature] bit NOT NULL
);

CREATE TABLE [PatientFirstEncounter] (
    [pfe_ect_id] uniqueidentifier,
    [pfe_pat_id] uniqueidentifier,
    [pfe_ect_date] datetime
);

CREATE TABLE [PatientHistory] (
    [pfh_pss_id] int NOT NULL PRIMARY KEY,
    [pfh_comments] nvarchar(5000)
);

CREATE TABLE [PatientIdentification] (
    [clp_id] int NOT NULL PRIMARY KEY,
    [clp_temporaryIdentifier] varchar(255),
    [clp_surname] nvarchar(510),
    [clp_givenName] nvarchar(510),
    [clp_dateOfBirth] date(3)
);

CREATE TABLE [PatientIdentificationLog] (
    [clp_Id] int NOT NULL PRIMARY KEY,
    [clp_pat_id] uniqueidentifier,
    [clp_temporaryIdentifier] varchar(255),
    [clp_surname] nvarchar(510),
    [clp_givenName] nvarchar(510),
    [clp_dateOfBirth] date(3),
    [clp_ObjectId] int NOT NULL,
    [clp_DateAdded] datetime NOT NULL,
    [clp_AddedBy] uniqueidentifier NOT NULL,
    [clp_TransactionId] uniqueidentifier NOT NULL,
    [clp_Action] char(1) NOT NULL
);

CREATE TABLE [PatientIopTarget] (
    [pit_Id] int NOT NULL PRIMARY KEY,
    [pit_pss_Id] int NOT NULL,
    [pit_Target] int
);

CREATE TABLE [PatientIopTargetLog] (
    [pit_Id] int NOT NULL,
    [pit_ObjectId] int NOT NULL,
    [pit_DateAdded] datetime NOT NULL,
    [pit_AddedBy] uniqueidentifier NOT NULL,
    [pit_TransactionId] uniqueidentifier NOT NULL,
    [pit_Action] char(1) NOT NULL,
    [pit_pss_Id] int NOT NULL,
    [pit_Target] int
);

CREATE TABLE [patientlens] (
    [psl_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientList] (
    [plc_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientListLog] (
    [plc_id] int NOT NULL PRIMARY KEY,
    [plc_DateAdded] datetime NOT NULL,
    [plc_AddedBy] uniqueidentifier NOT NULL,
    [plc_Transactionid] uniqueidentifier NOT NULL,
    [plc_Action] char(1) NOT NULL,
    [plc_plt_id] int NOT NULL,
    [plc_loc_id] uniqueidentifier NOT NULL,
    [plc_date] date(3) NOT NULL,
    [plc_ObjectId] int NOT NULL
);

CREATE TABLE [PatientListResponse] (
    [ppf_id] int NOT NULL PRIMARY KEY,
    [ppf_responsevalue] nvarchar(510) NOT NULL,
    [ppf_questiontext] nvarchar(510) NOT NULL,
    [ppf_answertext] nvarchar(510) NOT NULL,
    [ppf_isdeleted] bit NOT NULL,
    [ppf_parsedtext] nvarchar(MAX),
    [ppf_timestamp] datetime NOT NULL,
    [ppf_use_id] uniqueidentifier NOT NULL
);

CREATE TABLE [PatientListResponseLog] (
    [ppf_ObjectId] int NOT NULL,
    [ppf_id] int NOT NULL PRIMARY KEY,
    [ppf_lqu_id] int NOT NULL,
    [ppf_pat_id] uniqueidentifier NOT NULL,
    [ppf_bod_id] int NOT NULL,
    [ppf_responsevalue] nvarchar(510) NOT NULL,
    [ppf_questiontext] nvarchar(510) NOT NULL,
    [ppf_answertext] nvarchar(510) NOT NULL,
    [ppf_isdeleted] bit NOT NULL,
    [ppf_parsedtext] nvarchar(MAX),
    [ppf_timestamp] datetime NOT NULL,
    [ppf_use_id] uniqueidentifier NOT NULL,
    [ppf_DateAdded] datetime NOT NULL,
    [ppf_AddedBy] uniqueidentifier NOT NULL,
    [ppf_TransactionId] uniqueidentifier NOT NULL,
    [ppf_Action] char(1) NOT NULL
);

CREATE TABLE [PatientListType] (
    [plt_id] int NOT NULL PRIMARY KEY,
    [plt_name] varchar(255) NOT NULL,
    [plt_displaybydefault] bit NOT NULL
);

CREATE TABLE [PatientLog] (
    [pcl_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [patientlog] (
    [pat_ObjectId] uniqueidentifier NOT NULL,
    [pat_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientLog] (
    [pcl_ObjectId] int NOT NULL,
    [pcl_DateAdded] datetime NOT NULL
);

CREATE TABLE [patientlog] (
    [pat_surname] nvarchar(510),
    [pat_initials] nvarchar(510)
);

CREATE TABLE [PatientLog] (
    [pcl_AddedBy] uniqueidentifier NOT NULL,
    [pcl_Transactionid] uniqueidentifier NOT NULL
);

CREATE TABLE [patientlog] (
    [pat_forename] nvarchar(510),
    [pat_title] nvarchar(510)
);

CREATE TABLE [PatientLog] (
    [pcl_Action] char(1) NOT NULL,
    [pcl_pat_id] uniqueidentifier NOT NULL
);

CREATE TABLE [patientlog] (
    [pat_suffix] nvarchar(510),
    [pat_previoussurname] nvarchar(510)
);

CREATE TABLE [PatientLog] (
    [pcl_pnt_id] int NOT NULL,
    [pcl_patientNumber] varchar(50)
);

CREATE TABLE [patientlog] (
    [pat_requestedname] nvarchar(510),
    [pat_dob] date(3)
);

CREATE TABLE [PatientLog] (
    [pcl_dateOfConsent] datetime,
    [pcl_csw_id] int NOT NULL
);

CREATE TABLE [patientlog] (
    [pat_dod] date(3),
    [pat_lks_id_gender] int
);

CREATE TABLE [PatientLog] (
    [pcl_bod_id] int,
    [pcl_comments] varchar(2000)
);

CREATE TABLE [patientlog] (
    [pat_lks_id_ethnic] int,
    [pat_lks_id_religion] int
);

CREATE TABLE [PatientLog] (
    [pcl_endDate] datetime,
    [pcl_lks_id] int
);

CREATE TABLE [patientlog] (
    [pat_lks_id_language] int,
    [pat_lks_id_marital] int
);

CREATE TABLE [PatientLog] (
    [pcl_WorkflowStatusLastUpdated] datetime
);

CREATE TABLE [patientlog] (
    [pat_deceased] tinyint(1),
    [pat_occupation] nvarchar(510),
    [pat_status] int,
    [pat_lastupdatedfromdemographicstore] datetime,
    [pat_blb_id] uniqueidentifier,
    [pat_lks_id_nationality] int,
    [pat_source] int NOT NULL,
    [pat_isdeleted] bit NOT NULL,
    [pat_DateAdded] datetime NOT NULL,
    [pat_AddedBy] uniqueidentifier NOT NULL,
    [pat_TransactionId] uniqueidentifier NOT NULL,
    [pat_Action] char(1) NOT NULL,
    [pat_yearOfBirth] int,
    [pat_anonymisedAddedBy] uniqueidentifier,
    [pat_pdm_id] int
);

CREATE TABLE [PatientMatch] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [patientmatch] (
    [ipm_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientMatch] (
    [PatientMatchId] int NOT NULL,
    [PatientId] int NOT NULL
);

CREATE TABLE [patientmatch] (
    [ipm_forename] nvarchar(510)
);

CREATE TABLE [PatientMatch] (
    [EmrPatientId] uniqueidentifier,
    [NumberOfAttempts] int NOT NULL
);

CREATE TABLE [patientmatch] (
    [ipm_yearofbirth] int,
    [ipm_monthofbirth] int
);

CREATE TABLE [PatientMatch] (
    [LatestAttempt] datetime NOT NULL
);

CREATE TABLE [patientmatch] (
    [ipm_dayofbirth] int,
    [ipm_lks_id_gender] int,
    [ipm_pml_id] int,
    [ipm_status] int,
    [ipm_resolvedtimestamp] datetime,
    [ipm_use_id_resolvedby] uniqueidentifier,
    [ipm_interfacesubtype] int
);

CREATE TABLE [PatientMatchLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PatientMatchId] int NOT NULL,
    [PatientId] int NOT NULL,
    [EmrPatientId] uniqueidentifier,
    [NumberOfAttempts] int NOT NULL,
    [LatestAttempt] datetime NOT NULL
);

CREATE TABLE [patientmatchnumber] (
    [ipn_id] int NOT NULL PRIMARY KEY,
    [ipn_number] varchar(255) NOT NULL,
    [ipn_pnt_id] int
);

CREATE TABLE [patientmatchpatientid] (
    [pmi_id] int NOT NULL PRIMARY KEY,
    [pmi_ipm_id] int NOT NULL,
    [pmi_pdm_id] int,
    [pmi_pat_id] uniqueidentifier
);

CREATE TABLE [patientmatchresult] (
    [pme_id] int NOT NULL PRIMARY KEY,
    [pme_ipm_id] int NOT NULL,
    [pme_pdm_id] int,
    [pme_pat_id] uniqueidentifier,
    [pme_exactpatientnumbermatch] bit,
    [pme_exactsurnamematch] bit,
    [pme_exactforenamematch] bit,
    [pme_exactyearofbirthmatch] bit,
    [pme_exactmonthofbirthmatch] bit,
    [pme_exactdayofbirthmatch] bit,
    [pme_transposednamesmatch] bit,
    [pme_transposedforenamesmatch] bit,
    [pme_transposeddaymonthmatch] bit,
    [pme_mispunctuatednamesmatch] bit,
    [pme_displacednamesmatch] bit,
    [pme_abbreviatedforenamematch] bit,
    [pme_partialforenamematch] bit,
    [pme_abbreviatedfamilynamematch] bit
);

CREATE TABLE [patientmedicationhistory] (
    [pmh_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [patientmedicationmaster] (
    [pmm_id] int NOT NULL PRIMARY KEY,
    [pmm_DateModified] datetime2 NOT NULL
);

CREATE TABLE [patientmedicationrecord] (
    [pmd_id] int NOT NULL PRIMARY KEY,
    [pmd_MigratedFromMophth] bit NOT NULL
);

CREATE TABLE [PatientMedicationRecordDuplicateMedicationRemovalBackup] (
    [pmd_id] int NOT NULL PRIMARY KEY,
    [pmd_pat_id] uniqueidentifier,
    [pmd_ect_id] uniqueidentifier,
    [pmd_mcn_id] int,
    [pmd_dro_id] int,
    [pmd_dco_id] int,
    [pmd_bod_id] int,
    [pmd_pdt_id_startdate] uniqueidentifier,
    [pmd_pdt_id_stopdate] uniqueidentifier,
    [pmd_daterecorded] datetime,
    [pmd_use_id_recordedby] uniqueidentifier,
    [pmd_use_id_consultant] uniqueidentifier,
    [pmd_addedbyprescription] bit,
    [pmd_medicationstatustype] int,
    [pmd_eyerelated] int,
    [pmd_additionalnotes] nvarchar(MAX),
    [pmd_loc_id] uniqueidentifier,
    [pmd_hos_id] uniqueidentifier,
    [pmd_startdateapprox] bit,
    [pmd_startdateapproxtimeperiod] int,
    [pmd_startdateapproxcontextflag] int,
    [pmd_order] int,
    [pmd_deleted] bit,
    [pmd_suspended] bit,
    [pmd_datelastupdated] datetime,
    [pmd_addedasdefault] bit NOT NULL,
    [pmd_oldpmdid] int,
    [pmd_versiondate] datetime,
    [pmd_initialstartdate] datetime,
    [pmd_versionfrom] int NOT NULL,
    [pmd_versionto] int NOT NULL,
    [pmd_datelastissued] datetime,
    [pmd_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [patientmedicationsideeffect] (
    [pms_id] int NOT NULL PRIMARY KEY,
    [pms_lks_id_sideeffect] int,
    [pms_eyerelated] bit NOT NULL
);

CREATE TABLE [patientmerge] (
    [pmg_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientMerge] (
    [opm_Id] int NOT NULL PRIMARY KEY,
    [opm_pat_PrimaryPatientId] uniqueidentifier NOT NULL
);

CREATE TABLE [patientmerge] (
    [pmg_EndTime] datetime,
    [pmg_pat_id_primary] uniqueidentifier NOT NULL
);

CREATE TABLE [PatientMerge] (
    [opm_pat_SecondaryPatientId] uniqueidentifier NOT NULL
);

CREATE TABLE [patientmerge] (
    [pmg_pat_id_secondary] uniqueidentifier NOT NULL,
    [pmg_pat_id_new] uniqueidentifier,
    [pmg_trigger] int NOT NULL
);

CREATE TABLE [PatientMerge] (
    [opm_MergedOphthalSuitePatientId] int,
    [opm_OphthalSuiteMergeError] nvarchar(MAX)
);

CREATE TABLE [patientmerge] (
    [pmg_exception] varchar(MAX),
    [pmg_StartTime] datetime
);

CREATE TABLE [PatientMergeLog] (
    [opm_Id] int NOT NULL PRIMARY KEY,
    [opm_pat_PrimaryPatientId] uniqueidentifier NOT NULL,
    [opm_pat_SecondaryPatientId] uniqueidentifier NOT NULL,
    [opm_pat_MergedPatientId] uniqueidentifier NOT NULL,
    [opm_DateTimeActioned] datetime2,
    [opm_MergedOphthalSuitePatientId] int,
    [opm_OphthalSuiteMergeError] nvarchar(MAX),
    [opm_ObjectId] int NOT NULL,
    [opm_DateAdded] datetime NOT NULL,
    [opm_AddedBy] uniqueidentifier NOT NULL,
    [opm_TransactionId] uniqueidentifier NOT NULL,
    [opm_Action] char(1) NOT NULL
);

CREATE TABLE [patientmrsa] (
    [pmr_id] int NOT NULL,
    [pmr_pss_id] int NOT NULL PRIMARY KEY,
    [pmr_lks_id_result] int,
    [pmr_screened] bit,
    [pmr_screenrequired] bit,
    [pmr_swabtaken] bit,
    [pmr_datescreened] datetime,
    [pmr_comments] nvarchar(4000)
);

CREATE TABLE [patientmrsaswab] (
    [psw_id] int NOT NULL PRIMARY KEY,
    [psw_lks_id_swabarea] int
);

CREATE TABLE [patientnumber] (
    [pnm_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [pnm_HospitalNumberSubtypeId] int
);

CREATE TABLE [PatientNumber_Backup_183600] (
    [pnm_id] uniqueidentifier NOT NULL,
    [pnm_pat_id] uniqueidentifier,
    [pnm_number] varchar(255),
    [pnm_lks_id_status] int,
    [pnm_pnt_id] int NOT NULL,
    [pnm_active] bit NOT NULL,
    [pnm_HospitalNumberSubtypeId] int,
    [InsertDateUtc] datetime2
);

CREATE TABLE [patientnumberlog] (
    [pnm_ObjectId] uniqueidentifier NOT NULL,
    [pnm_id] int NOT NULL PRIMARY KEY,
    [pnm_pat_id] uniqueidentifier,
    [pnm_number] varchar(255),
    [pnm_lks_id_status] int,
    [pnm_pnt_id] int NOT NULL,
    [pnm_DateAdded] datetime NOT NULL,
    [pnm_AddedBy] uniqueidentifier NOT NULL,
    [pnm_TransactionId] uniqueidentifier NOT NULL,
    [pnm_Action] char(1) NOT NULL,
    [pnm_active] bit,
    [pnm_HospitalNumberSubtypeId] int
);

CREATE TABLE [patientnumbertype] (
    [pnt_id] int NOT NULL PRIMARY KEY,
    [pnt_code] varchar(255) NOT NULL,
    [pnt_desc] nvarchar(510),
    [pnt_regexvalidinput] varchar(255) NOT NULL,
    [pnt_regexsearchinput] varchar(255) NOT NULL,
    [pnt_regexsearchoutput] varchar(255) NOT NULL,
    [pnt_regexdisplayinput] varchar(255) NOT NULL,
    [pnt_regexdisplayoutput] varchar(255) NOT NULL,
    [pnt_rank] int,
    [pnt_active] bit,
    [pnt_lkt_id_status] int,
    [pnt_display] bit NOT NULL,
    [pnt_uniqueacrosspatients] bit NOT NULL,
    [pnt_allowmultipleperpatient] bit NOT NULL,
    [pnt_abbreviation] nvarchar(510),
    [pnt_required] bit NOT NULL,
    [pnt_partialabbreviation] nvarchar(510),
    [pnt_pnc_id] int NOT NULL
);

CREATE TABLE [patientnumbertypecategory] (
    [pnc_id] int NOT NULL PRIMARY KEY,
    [pnc_description] varchar(50) NOT NULL
);

CREATE TABLE [patientoverview] (
    [pto_id] int NOT NULL PRIMARY KEY,
    [pto_overview] nvarchar(MAX),
    [pto_refresh_date] datetime NOT NULL,
    [pto_requires_refresh] tinyint(1) NOT NULL,
    [pto_last_updated] datetime NOT NULL
);

CREATE TABLE [patientpinstore] (
    [ppn_id] int NOT NULL PRIMARY KEY,
    [ppn_pin] varchar(50),
    [ppn_pinint] int,
    [ppn_status] int,
    [ppn_startdate] datetime,
    [ppn_stopdate] datetime,
    [ppn_stopreason] int,
    [ppn_flag] int,
    [ppn_scheme] int,
    [ppn_updated] datetime,
    [ppn_ect_id] uniqueidentifier,
    [ppn_ect_id_requested] uniqueidentifier,
    [ppn_cpw_CarePathwayTypeId] int,
    [ppn_ppr_PatientClinicalPlanRootId] int,
    [ppn_AutomaticallyCreated] bit NOT NULL
);

CREATE TABLE [patientpinstorelog] (
    [ppn_ObjectId] int NOT NULL,
    [ppn_id] int NOT NULL PRIMARY KEY,
    [ppn_pin] varchar(50),
    [ppn_pinint] int,
    [ppn_pat_id] uniqueidentifier,
    [ppn_status] int,
    [ppn_startdate] datetime,
    [ppn_stopdate] datetime,
    [ppn_stopreason] int,
    [ppn_flag] int,
    [ppn_scheme] int,
    [ppn_updated] datetime,
    [ppn_ect_id] uniqueidentifier,
    [ppn_ect_id_requested] uniqueidentifier,
    [ppn_DateAdded] datetime NOT NULL,
    [ppn_AddedBy] uniqueidentifier NOT NULL,
    [ppn_TransactionId] uniqueidentifier NOT NULL,
    [ppn_Action] char(1) NOT NULL,
    [ppn_cpw_CarePathwayTypeId] int,
    [ppn_ppr_PatientClinicalPlanRootId] int,
    [ppn_AutomaticallyCreated] bit NOT NULL
);

CREATE TABLE [patientplanitem] (
    [ppi_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [patientplanitemcomment] (
    [pan_id] int NOT NULL PRIMARY KEY,
    [pan_comment] nvarchar(MAX),
    [pan_useonletters] bit NOT NULL
);

CREATE TABLE [PatientPlanItemCommentLog] (
    [pan_Id] int NOT NULL PRIMARY KEY,
    [pan_ObjectId] int NOT NULL,
    [pan_DateAdded] datetime NOT NULL,
    [pan_AddedBy] uniqueidentifier NOT NULL,
    [pan_Transactionid] uniqueidentifier NOT NULL,
    [pan_Action] char(1) NOT NULL,
    [pan_ppi_Id] int NOT NULL,
    [pan_comment] nvarchar(MAX),
    [pan_useonletters] bit NOT NULL
);

CREATE TABLE [patientplanitemtype] (
    [pit_id] int NOT NULL PRIMARY KEY,
    [pit_description] varchar(255) NOT NULL,
    [pit_parent_id] int,
    [pit_order] int NOT NULL
);

CREATE TABLE [patientplanmaster] (
    [ppm_id] int NOT NULL PRIMARY KEY,
    [ppm_DateModified] datetime2 NOT NULL
);

CREATE TABLE [patientpractitionerlink] (
    [pap_id] int NOT NULL PRIMARY KEY,
    [pap_principaloftype] bit,
    [pap_dateassociated] datetime,
    [pap_datedisassociated] datetime,
    [pap_associationcontext] int,
    [pap_manualoverride] bit
);

CREATE TABLE [patientproblem] (
    [prb_id] int NOT NULL PRIMARY KEY,
    [prb_ect_id] uniqueidentifier,
    [prb_cpy_id] int NOT NULL,
    [prb_notes] nvarchar(4096),
    [prb_parsedtext] nvarchar(4000),
    [prb_value] decimal(18, 2),
    [prb_active] bit,
    [prb_datefrom] datetime,
    [prb_dateto] datetime,
    [prb_daterecorded] datetime,
    [prb_principal] bit,
    [prb_derived] bit,
    [prb_source] bit,
    [prb_cfd_id] int,
    [prb_nad] bit NOT NULL,
    [prb_comment] bit NOT NULL,
    [prb_pdt_approxdate] int,
    [prb_use_id_recordedby] uniqueidentifier,
    [prb_lks_id_certainty] int,
    [prb_negated] bit NOT NULL,
    [prb_bsm_id] int,
    [prb_eyeproblem] bit,
    [prb_prb_id_promotedproblem] int,
    [prb_pdt_datefrom] uniqueidentifier,
    [prb_pdt_dateto] uniqueidentifier,
    [prb_versionid] uniqueidentifier,
    [prb_oldprbid] int,
    [prb_drassessment] bit
);

CREATE TABLE [patientproblemhistory] (
    [pph_Id] int NOT NULL PRIMARY KEY,
    [pph_versiondate] datetime NOT NULL
);

CREATE TABLE [patientproblemhistorytype] (
    [pht_id] int NOT NULL PRIMARY KEY,
    [pht_description] varchar(100)
);

CREATE TABLE [patientproblemmaster] (
    [ppb_id] int NOT NULL PRIMARY KEY,
    [ppb_DateModified] datetime2 NOT NULL
);

CREATE TABLE [patientrelation] (
    [pre_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [pre_surname] nvarchar(510),
    [pre_initials] nvarchar(510),
    [pre_forename] nvarchar(510),
    [pre_title] nvarchar(510),
    [pre_lks_id_relationtype] int NOT NULL,
    [pre_lks_id_relation] int,
    [pre_add_id] uniqueidentifier,
    [pre_active] bit,
    [pre_relationothertext] nvarchar(510)
);

CREATE TABLE [patientrelationcontact] (
    [prc_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [prc_value] nvarchar(510),
    [prc_lks_id_contacttype] int NOT NULL,
    [prc_preferred] tinyint(1) NOT NULL
);

CREATE TABLE [patientrelationcontactlog] (
    [prc_ObjectId] uniqueidentifier NOT NULL,
    [prc_id] int NOT NULL PRIMARY KEY,
    [prc_pre_id] uniqueidentifier NOT NULL,
    [prc_value] nvarchar(510),
    [prc_lks_id_contacttype] int NOT NULL,
    [prc_preferred] tinyint(1) NOT NULL,
    [prc_DateAdded] datetime NOT NULL,
    [prc_AddedBy] uniqueidentifier NOT NULL,
    [prc_TransactionId] uniqueidentifier NOT NULL,
    [prc_Action] char(1) NOT NULL
);

CREATE TABLE [patientrelationlog] (
    [pre_ObjectId] uniqueidentifier NOT NULL,
    [pre_id] int NOT NULL PRIMARY KEY,
    [pre_pat_id] uniqueidentifier NOT NULL,
    [pre_surname] nvarchar(510),
    [pre_initials] nvarchar(510),
    [pre_forename] nvarchar(510),
    [pre_title] nvarchar(510),
    [pre_lks_id_relationtype] int NOT NULL,
    [pre_lks_id_relation] int,
    [pre_add_id] uniqueidentifier,
    [pre_active] bit,
    [pre_relationothertext] nvarchar(510),
    [pre_DateAdded] datetime NOT NULL,
    [pre_AddedBy] uniqueidentifier NOT NULL,
    [pre_TransactionId] uniqueidentifier NOT NULL,
    [pre_Action] char(1) NOT NULL
);

CREATE TABLE [patientsearchhistory] (
    [psh_id] int NOT NULL PRIMARY KEY,
    [psh_patientnumber] varchar(255),
    [psh_surname] nvarchar(510),
    [psh_forename] nvarchar(510),
    [psh_dob] datetime,
    [psh_postcode] varchar(255),
    [psh_timetaken] time(5),
    [psh_searchresults] nvarchar(MAX)
);

CREATE TABLE [patientstatus] (
    [pss_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PatientStatusExtractState] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [patientstatusmaster] (
    [psm_id] int NOT NULL PRIMARY KEY,
    [psm_DateModified] datetime2 NOT NULL
);

CREATE TABLE [patientstatustype] (
    [psp_id] int NOT NULL PRIMARY KEY,
    [psp_description] varchar(50)
);

CREATE TABLE [patienttransport] (
    [ptp_id] int NOT NULL PRIMARY KEY,
    [ptp_lks_id_transporttype] int,
    [ptp_lks_id_transport] int,
    [ptp_lks_id_transportcategory] int
);

CREATE TABLE [patienttransportlog] (
    [ptp_ObjectId] int NOT NULL,
    [ptp_id] int NOT NULL PRIMARY KEY,
    [ptp_act_id] uniqueidentifier NOT NULL,
    [ptp_lks_id_transporttype] int,
    [ptp_lks_id_transport] int,
    [ptp_lks_id_transportcategory] int,
    [ptp_DateAdded] datetime NOT NULL,
    [ptp_AddedBy] uniqueidentifier NOT NULL,
    [ptp_TransactionId] uniqueidentifier NOT NULL,
    [ptp_Action] char(1) NOT NULL
);

CREATE TABLE [patientupdatehistory] (
    [puh_id] int NOT NULL PRIMARY KEY,
    [puh_lks_id_areaupdated] int NOT NULL,
    [puh_use_id] uniqueidentifier NOT NULL,
    [puh_datetimeupdate] datetime NOT NULL
);

CREATE TABLE [patientviewedhistory] (
    [pvh_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PendingPackage] (
    [epp_Id] int NOT NULL PRIMARY KEY,
    [epp_MinimumSupportedReleaseVersion] int NOT NULL,
    [epp_PackageArtefactDefinitionPayload] nvarchar(MAX) NOT NULL
);

CREATE TABLE [PendingPackageLog] (
    [epp_Id] int NOT NULL PRIMARY KEY,
    [epp_ObjectId] int NOT NULL,
    [epp_DateAdded] datetime NOT NULL,
    [epp_AddedBy] uniqueidentifier NOT NULL,
    [epp_Transactionid] uniqueidentifier NOT NULL,
    [epp_Action] char(1) NOT NULL,
    [epp_UniqueKey] uniqueidentifier NOT NULL,
    [epp_MinimumSupportedReleaseVersion] int NOT NULL,
    [epp_PackageArtefactDefinitionPayload] nvarchar(MAX) NOT NULL
);

CREATE TABLE [PeripheralIridectomy] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ClockHourValue] int NOT NULL PRIMARY KEY,
    [ClockHourValue] int NOT NULL PRIMARY KEY,
    [BodyPartId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PeripheralIridectomyLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [ClockHourValue] int NOT NULL,
    [ClockHourValue] int NOT NULL,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [Peritomy] (
    [Id] int NOT NULL PRIMARY KEY,
    [PeritomyId] int NOT NULL
);

CREATE TABLE [PeritomyLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PreparationId] int NOT NULL,
    [PeritomyId] int NOT NULL,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [permission] (
    [per_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Permission] (
    [etp_Id] int NOT NULL PRIMARY KEY,
    [etp_Description] nvarchar(200) NOT NULL,
    [etp_Enabled] bit NOT NULL,
    [etp_Identifier] uniqueidentifier
);

CREATE TABLE [permission] (
    [per_description] nvarchar(510),
    [per_active] bit,
    [per_isdefault] bit NOT NULL
);

CREATE TABLE [permissionarea] (
    [par_id] int NOT NULL PRIMARY KEY,
    [par_description] varchar(255),
    [par_per_id] int
);

CREATE TABLE [PermittedDynamicActivitySection] (
    [tps_das_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [personneltype] (
    [acp_id] int NOT NULL PRIMARY KEY,
    [acp_desc] nvarchar(200)
);

CREATE TABLE [PhData] (
    [uph_id] int NOT NULL PRIMARY KEY,
    [uph_available] bit NOT NULL
);

CREATE TABLE [Plan] (
    [spp_id] int NOT NULL PRIMARY KEY,
    [ipl_id] int NOT NULL PRIMARY KEY,
    [ipl_activedate] datetime NOT NULL,
    [ipl_inactivedate] datetime
);

CREATE TABLE [PlanLog] (
    [ipl_id] int NOT NULL PRIMARY KEY,
    [spp_ObjectId] int NOT NULL,
    [spp_id] int NOT NULL PRIMARY KEY,
    [ipl_pat_id] uniqueidentifier,
    [ipl_bod_id] int,
    [spp_act_id] uniqueidentifier NOT NULL,
    [spp_pln_id] int,
    [ipl_ObjectId] int NOT NULL,
    [ipl_DateAdded] datetime NOT NULL,
    [spp_risksbenefitsdiscussed] bit NOT NULL,
    [spp_consentformgiven] bit NOT NULL,
    [ipl_AddedBy] uniqueidentifier NOT NULL,
    [ipl_TransactionId] uniqueidentifier NOT NULL,
    [spp_patientconsented] bit NOT NULL,
    [spp_comments] nvarchar(1000),
    [ipl_Action] char(1) NOT NULL,
    [ipl_activedate] datetime,
    [spp_DateAdded] datetime NOT NULL,
    [spp_AddedBy] uniqueidentifier NOT NULL,
    [ipl_inactivedate] datetime,
    [spp_TransactionId] uniqueidentifier NOT NULL,
    [spp_Action] char(1) NOT NULL
);

CREATE TABLE [planneddischarge] (
    [pld_id] int NOT NULL,
    [pld_pln_id] int NOT NULL PRIMARY KEY,
    [pld_interval] int,
    [pld_lks_id_intervaltype] int,
    [pld_openappointment] bit
);

CREATE TABLE [planneddischargereason] (
    [pdr_id] int NOT NULL PRIMARY KEY,
    [pdr_lks_id_dischargereason] int
);

CREATE TABLE [PlannedEvent] (
    [Id] int NOT NULL PRIMARY KEY,
    [PlanId] int NOT NULL,
    [ActionType] int NOT NULL,
    [EventType] int NOT NULL,
    [DateStaged] datetime2 NOT NULL,
    [IsDeleted] bit NOT NULL,
    [LocationCreatedAt] nvarchar(510),
    [LinkedClinicAppointment] int,
    [UserAddedBy] uniqueidentifier NOT NULL,
    [DateCreated] datetime2 NOT NULL,
    [EventTimeframe] int,
    [VisitTimeframeType] int,
    [EventDate] datetime2,
    [Priority] nvarchar(510),
    [Location] nvarchar(510),
    [LocationType] nvarchar(510),
    [HospitalLocation] nvarchar(510),
    [Clinic] nvarchar(510),
    [ResponsibleUser] uniqueidentifier,
    [BookingComments] nvarchar(4000),
    [CompletionStatus] int NOT NULL,
    [SeenBy] nvarchar(200)
);

CREATE TABLE [PlannedEventExtractState] (
    [Id] int NOT NULL PRIMARY KEY,
    [IsDeletedEvent] bit NOT NULL
);

CREATE TABLE [PlannedOperation] (
    [plo_act_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [apo_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [apo_ppr_id] int NOT NULL,
    [plo_ppr_id] int NOT NULL
);

CREATE TABLE [plannedoperation] (
    [pop_pln_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PlannedOperation] (
    [plo_lks_id_AnaesthesiaType] int,
    [apo_GeneralAnaesthetic] bit NOT NULL,
    [apo_LocalAnaesthetic] bit NOT NULL
);

CREATE TABLE [plannedoperation] (
    [pop_lks_id_intervaltype] int,
    [pop_interval] int
);

CREATE TABLE [PlannedOperation] (
    [apo_HasSedation] bit NOT NULL
);

CREATE TABLE [plannedoperation] (
    [pop_lks_id_visittype] int,
    [pop_lks_id_anaesthesiatype] int,
    [pop_use_id_enterby] uniqueidentifier,
    [pop_sedation] bit,
    [pop_lks_id_priority] int,
    [pop_op_admission_date] datetime,
    [pop_op_admission_time] time(5),
    [pop_arrivaltime] time(5),
    [pop_starttime] time(5),
    [pop_dayspreop] int,
    [pop_op_loc_id] uniqueidentifier,
    [pop_comments] nvarchar(MAX),
    [pop_pc_location_id] uniqueidentifier,
    [pop_pc_date] datetime,
    [pop_pc_use_id_consultant] uniqueidentifier,
    [pop_lks_id_asagrade] int,
    [pop_op_time] varchar(5),
    [pop_op_weeks] int,
    [pop_op_admit_lead] int,
    [pop_op_use_id_consultant] uniqueidentifier,
    [pop_op_daycase] bit,
    [pop_op_waitlistinitiative] bit,
    [pop_op_privatepatient] bit,
    [pop_op_directbooking] bit,
    [pop_unplanned] bit,
    [pop_duration] int,
    [pop_lks_id_suitable] int,
    [pop_cancelled] bit,
    [pop_theatretime] int
);

CREATE TABLE [plannedoperationanaesthesiatype] (
    [poa_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [plannedoperationanaesthesiatypelog] (
    [poa_ObjectId] int NOT NULL,
    [poa_id] int NOT NULL PRIMARY KEY,
    [poa_pln_id] int,
    [poa_lks_id_anaesthesiatype] int,
    [poa_DateAdded] datetime NOT NULL,
    [poa_AddedBy] uniqueidentifier NOT NULL,
    [poa_TransactionId] uniqueidentifier NOT NULL,
    [poa_Action] char(1) NOT NULL
);

CREATE TABLE [PlannedOperationAnaesthesiaTypeRemovalBackup] (
    [poa_id] int NOT NULL PRIMARY KEY,
    [poa_pln_id] int,
    [poa_lks_id_anaesthesiatype] int,
    [poa_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [plannedoperationindication] (
    [pli_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [plannedoperationindicationlog] (
    [pli_ObjectId] int NOT NULL,
    [pli_id] int NOT NULL PRIMARY KEY,
    [pli_pln_id] int,
    [pli_bod_id] int,
    [pli_cpt_id] int,
    [pli_DateAdded] datetime NOT NULL,
    [pli_AddedBy] uniqueidentifier NOT NULL,
    [pli_TransactionId] uniqueidentifier NOT NULL,
    [pli_Action] char(1) NOT NULL
);

CREATE TABLE [PlannedOperationIndicationRemovalBackup] (
    [pli_id] int NOT NULL PRIMARY KEY,
    [pli_pln_id] int,
    [pli_bod_id] int,
    [pli_cpt_id] int,
    [pli_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [PlannedOperationLocalAnaestheticRoute] (
    [par_LocalAnaestheticRouteId] int NOT NULL PRIMARY KEY,
    [par_PlannedOperationActivityId] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [PlannedOperationLocalAnaestheticRouteLog] (
    [par_PlannedOperationActivityId] int NOT NULL PRIMARY KEY,
    [par_ObjectId] uniqueidentifier NOT NULL,
    [par_DateAdded] datetime NOT NULL,
    [par_AddedBy] uniqueidentifier NOT NULL,
    [par_Transactionid] uniqueidentifier NOT NULL,
    [par_Action] char(1) NOT NULL,
    [par_LocalAnaestheticRouteId] int NOT NULL
);

CREATE TABLE [PlannedOperationLog] (
    [plo_act_id] int NOT NULL PRIMARY KEY,
    [apo_ActivityId] int NOT NULL,
    [apo_ObjectId] uniqueidentifier NOT NULL,
    [plo_ObjectId] uniqueidentifier NOT NULL,
    [plo_DateAdded] datetime NOT NULL,
    [apo_DateAdded] datetime NOT NULL,
    [apo_AddedBy] uniqueidentifier NOT NULL,
    [plo_AddedBy] uniqueidentifier NOT NULL,
    [plo_Transactionid] uniqueidentifier NOT NULL,
    [apo_Transactionid] uniqueidentifier NOT NULL,
    [apo_Action] char(1) NOT NULL,
    [plo_Action] char(1) NOT NULL,
    [plo_ppr_id] int NOT NULL,
    [apo_ppr_id] int NOT NULL,
    [apo_GeneralAnaesthetic] bit NOT NULL,
    [plo_lks_id_AnaesthesiaType] int,
    [apo_LocalAnaesthetic] bit NOT NULL,
    [apo_HasSedation] bit NOT NULL
);

CREATE TABLE [plannedoperationprocedure] (
    [plp_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PlannedOperationProcedure] (
    [Id] int NOT NULL PRIMARY KEY,
    [ProcedureId] int NOT NULL,
    [QualifierId] int,
    [ProcedureDescription] nvarchar(510),
    [ProcedureOpcsCode] nvarchar(510),
    [QualifierDescription] nvarchar(510),
    [QualifierOpcsCode] nvarchar(510),
    [Laterality] int
);

CREATE TABLE [plannedoperationproceduredefault] (
    [ppd_id] int NOT NULL PRIMARY KEY,
    [ppd_pro_id] int,
    [ppd_ant_id] int,
    [ppd_lks_id_anaesthesiatype] int
);

CREATE TABLE [plannedoperationprocedurelog] (
    [plp_ObjectId] int NOT NULL,
    [plp_id] int NOT NULL PRIMARY KEY,
    [plp_pln_id] int NOT NULL,
    [plp_pro_id] int NOT NULL,
    [plp_bod_id] int NOT NULL,
    [plp_narative] nvarchar(510),
    [plp_DateAdded] datetime NOT NULL,
    [plp_AddedBy] uniqueidentifier NOT NULL,
    [plp_TransactionId] uniqueidentifier NOT NULL,
    [plp_Action] char(1) NOT NULL
);

CREATE TABLE [plannedoperationprocedurequalifier] (
    [pnq_id] int NOT NULL PRIMARY KEY,
    [pnq_pqt_id] int,
    [pnq_order] int NOT NULL
);

CREATE TABLE [plannedoperationprocedurequalifierlog] (
    [pnq_ObjectId] int NOT NULL,
    [pnq_id] int NOT NULL PRIMARY KEY,
    [pnq_plp_id] int NOT NULL,
    [pnq_pqt_id] int,
    [pnq_pqi_id] int,
    [pnq_order] int NOT NULL,
    [pnq_DateAdded] datetime NOT NULL,
    [pnq_AddedBy] uniqueidentifier NOT NULL,
    [pnq_TransactionId] uniqueidentifier NOT NULL,
    [pnq_Action] char(1) NOT NULL
);

CREATE TABLE [PlannedOperationProcedureQualifierRemovalBackup] (
    [pnq_id] int NOT NULL PRIMARY KEY,
    [pnq_plp_id] int NOT NULL,
    [pnq_pqt_id] int,
    [pnq_pqi_id] int,
    [pnq_order] int NOT NULL,
    [pnq_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [PlannedOperationProcedureRemovalBackup] (
    [plp_id] int NOT NULL PRIMARY KEY,
    [plp_pln_id] int NOT NULL,
    [plp_pro_id] int NOT NULL,
    [plp_bod_id] int NOT NULL,
    [plp_narative] nvarchar(510),
    [plp_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [PlannedOperationRemovalBackup] (
    [pop_id] int NOT NULL PRIMARY KEY,
    [pop_pln_id] int NOT NULL,
    [pop_date_listed] datetime NOT NULL,
    [pop_lks_id_intervaltype] int,
    [pop_interval] int,
    [pop_op_date] datetime,
    [pop_lks_id_visittype] int,
    [pop_lks_id_anaesthesiatype] int,
    [pop_use_id_enterby] uniqueidentifier,
    [pop_sedation] bit,
    [pop_lks_id_priority] int,
    [pop_op_admission_date] datetime,
    [pop_op_admission_time] time(5),
    [pop_arrivaltime] time(5),
    [pop_starttime] time(5),
    [pop_dayspreop] int,
    [pop_op_loc_id] uniqueidentifier,
    [pop_comments] nvarchar(MAX),
    [pop_pc_location_id] uniqueidentifier,
    [pop_pc_date] datetime,
    [pop_pc_use_id_consultant] uniqueidentifier,
    [pop_lks_id_asagrade] int,
    [pop_op_time] varchar(5),
    [pop_op_weeks] int,
    [pop_op_admit_lead] int,
    [pop_op_use_id_consultant] uniqueidentifier,
    [pop_op_daycase] bit,
    [pop_op_waitlistinitiative] bit,
    [pop_op_privatepatient] bit,
    [pop_op_directbooking] bit,
    [pop_unplanned] bit,
    [pop_duration] int,
    [pop_lks_id_suitable] bit,
    [pop_cancelled] bit,
    [pop_theatretime] int,
    [pop_cpw_id] int,
    [pop_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [PlannedProcedureMedication] (
    [dpm_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PlannedProcedureMedicationItem] (
    [dmi_id] int NOT NULL PRIMARY KEY,
    [dmi_dpm_id] int NOT NULL,
    [dmi_bod_id] int,
    [dmi_mcn_id] int NOT NULL,
    [dmi_dro_id] int NOT NULL,
    [dmi_dco_id] int NOT NULL,
    [dmi_use_id_PrescribedBy] uniqueidentifier NOT NULL,
    [dmi_PrescribedDate] datetime NOT NULL,
    [dmi_AdditionalNotes] nvarchar(500),
    [dmi_StartDateDayAfterSurgery] bit NOT NULL
);

CREATE TABLE [PlannedProcedureMedicationItemLog] (
    [dmi_id] int NOT NULL PRIMARY KEY,
    [dmi_ObjectId] int NOT NULL,
    [dmi_DateAdded] datetime NOT NULL,
    [dmi_AddedBy] uniqueidentifier NOT NULL,
    [dmi_Transactionid] uniqueidentifier NOT NULL,
    [dmi_Action] char(1) NOT NULL,
    [dmi_dpm_id] int NOT NULL,
    [dmi_bod_id] int,
    [dmi_mcn_id] int NOT NULL,
    [dmi_dro_id] int NOT NULL,
    [dmi_dco_id] int NOT NULL,
    [dmi_use_id_PrescribedBy] uniqueidentifier NOT NULL,
    [dmi_PrescribedDate] datetime NOT NULL,
    [dmi_AdditionalNotes] nvarchar(500),
    [dmi_StartDateDayAfterSurgery] bit NOT NULL
);

CREATE TABLE [PlannedProcedureMedicationLog] (
    [dpm_id] int NOT NULL PRIMARY KEY,
    [dpm_ObjectId] int NOT NULL,
    [dpm_DateAdded] datetime NOT NULL,
    [dpm_AddedBy] uniqueidentifier NOT NULL,
    [dpm_Transactionid] uniqueidentifier NOT NULL,
    [dpm_Action] char(1) NOT NULL,
    [dpm_pln_id] int NOT NULL,
    [dpm_dsc_id] int NOT NULL,
    [dpm_NotRequired] bit NOT NULL
);

CREATE TABLE [plannedvisit] (
    [nvi_id] int NOT NULL PRIMARY KEY,
    [nvi_loc_id] uniqueidentifier,
    [nvi_visittime] time(5),
    [nvi_lks_id_followupby] int,
    [nvi_use_id_followupby] uniqueidentifier,
    [nvi_lks_id_visitstatus] int,
    [nvi_lks_id_intervaltype] int,
    [nvi_lks_id_visittype] int,
    [nvi_interval] int,
    [nvi_urgency] smallint(2),
    [nvi_repeatprocedure] bit,
    [nvi_clt_id] int,
    [nvi_flagvisit] int,
    [nvi_Instructions] varchar(2000),
    [nvi_clt_ClinicListClinicId] int,
    [nvi_csc_PlannedInClinicId] int,
    [nvi_IsSharedCare] bit NOT NULL,
    [nvi_SharedCarePortalSharingConsent] bit
);

CREATE TABLE [PlannedVisitInstructions] (
    [PatientClinicalPlanId] int NOT NULL PRIMARY KEY,
    [InstructionsLookupDataId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [planpersonnel] (
    [ppl_id] int NOT NULL PRIMARY KEY,
    [ppl_lks_id_personnel] uniqueidentifier NOT NULL
);

CREATE TABLE [PlanPersonnelRemovalBackup] (
    [ppl_id] int NOT NULL PRIMARY KEY,
    [ppl_pln_id] int NOT NULL,
    [ppl_use_id] uniqueidentifier NOT NULL,
    [ppl_lks_id_personnel] uniqueidentifier NOT NULL,
    [ppl_acp_id] int NOT NULL,
    [ppl_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [PlatePosition] (
    [pos_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [pos_lqu_Position] int NOT NULL PRIMARY KEY,
    [pos_bod_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PlatePositionLog] (
    [pos_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [pos_ObjectId] int NOT NULL,
    [pos_DateAdded] datetime NOT NULL,
    [pos_AddedBy] uniqueidentifier NOT NULL,
    [pos_TransactionId] uniqueidentifier NOT NULL,
    [pos_Action] char(1) NOT NULL,
    [pos_lqu_Position] int NOT NULL,
    [pos_bod_id] int NOT NULL
);

CREATE TABLE [Plication] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SutureId] int,
    [AmountOfSurgery] float(8) NOT NULL,
    [SutureId] int
);

CREATE TABLE [PlicationLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [SutureId] int,
    [AmountOfSurgery] float(8) NOT NULL,
    [SutureId] int
);

CREATE TABLE [Positioning] (
    [acp_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [acp_Comments] nvarchar(4000)
);

CREATE TABLE [PositioningLog] (
    [acp_act_ActivityId] int NOT NULL PRIMARY KEY,
    [acp_ObjectId] uniqueidentifier NOT NULL,
    [acp_DateAdded] datetime NOT NULL,
    [acp_AddedBy] uniqueidentifier NOT NULL,
    [acp_Transactionid] uniqueidentifier NOT NULL,
    [acp_Action] char(1) NOT NULL,
    [acp_Comments] nvarchar(4000)
);

CREATE TABLE [PositioningOptionItem] (
    [aps_acp_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [aps_lqu_Positioning] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PositioningOptionItemLog] (
    [aps_acp_ActivityId] int NOT NULL PRIMARY KEY,
    [aps_ObjectId] uniqueidentifier NOT NULL,
    [aps_DateAdded] datetime NOT NULL,
    [aps_AddedBy] uniqueidentifier NOT NULL,
    [aps_Transactionid] uniqueidentifier NOT NULL,
    [aps_Action] char(1) NOT NULL,
    [aps_lqu_Positioning] int NOT NULL
);

CREATE TABLE [PositionOfGaze] (
    [Id] int NOT NULL PRIMARY KEY,
    [PositionOfGaze] nvarchar(120) NOT NULL
);

CREATE TABLE [PostAdjustment] (
    [Id] int NOT NULL PRIMARY KEY,
    [DiplopiaPostAdjustment] bit NOT NULL,
    [DistanceHorizontalDeviationId] int,
    [NearHorizontalDeviationId] int,
    [DistanceVerticalDeviationId] int,
    [NearVerticalDeviationId] int
);

CREATE TABLE [PostAdjustmentLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [DiplopiaPostAdjustment] bit NOT NULL,
    [DistanceHorizontalDeviationId] int,
    [NearHorizontalDeviationId] int,
    [DistanceVerticalDeviationId] int,
    [NearVerticalDeviationId] int
);

CREATE TABLE [PostHorizontalDeviation] (
    [Id] int NOT NULL PRIMARY KEY,
    [HorizontalPostAdjustmentId] int,
    [PostAdjustmentDistanceId] int,
    [Deviation] int
);

CREATE TABLE [PostHorizontalDeviationLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [HorizontalPostAdjustmentId] int,
    [PostAdjustmentDistanceId] int,
    [Deviation] int
);

CREATE TABLE [PostOpSutureAdjustment] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [PreAdjustmentId] int NOT NULL,
    [OtherId] int NOT NULL,
    [AdjustmentId] int NOT NULL,
    [PostAdjustmentId] int,
    [SurgicalCompletionId] int
);

CREATE TABLE [PostOpSutureAdjustmentLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PreAdjustmentId] int NOT NULL,
    [OtherId] int NOT NULL,
    [AdjustmentId] int NOT NULL,
    [PostAdjustmentId] int,
    [SurgicalCompletionId] int
);

CREATE TABLE [Posture] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [PostureAtHome] (
    [Id] int NOT NULL PRIMARY KEY,
    [PosturesId] int NOT NULL,
    [PostureId] int,
    [Hours] int,
    [TimeOfDay] int,
    [Days] int
);

CREATE TABLE [PostureAtHomeLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PostureId] int,
    [Hours] int,
    [TimeOfDay] int,
    [Days] int,
    [PosturesId] int NOT NULL
);

CREATE TABLE [PostureItem] (
    [Id] int NOT NULL PRIMARY KEY,
    [PosturesId] int NOT NULL,
    [PostureId] int NOT NULL,
    [Duration] int,
    [TimeOfDay_LookupId] int,
    [Days] int,
    [DurationUnitId] int
);

CREATE TABLE [PostureItemLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PosturesId] int NOT NULL,
    [PostureId] int NOT NULL,
    [Duration] int,
    [TimeOfDay_LookupId] int,
    [Days] int,
    [DurationUnitId] int
);

CREATE TABLE [PostureOnWard] (
    [Id] int NOT NULL PRIMARY KEY,
    [PosturesId] int NOT NULL,
    [PostureId] int,
    [Duration] int,
    [DurationUnitId] int
);

CREATE TABLE [PostureOnWardLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PostureId] int,
    [Duration] int,
    [DurationUnitId] int,
    [PosturesId] int NOT NULL
);

CREATE TABLE [Postures] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [OnWardComments] varchar(256),
    [AtHomeComments] varchar(256),
    [Comments] nvarchar(512)
);

CREATE TABLE [PostureSetting] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL
);

CREATE TABLE [PosturesLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [OnWardComments] varchar(256),
    [ActivityId] uniqueidentifier NOT NULL,
    [PostureSettingId] int NOT NULL,
    [AtHomeComments] varchar(256),
    [Comments] nvarchar(512)
);

CREATE TABLE [PostVerticalDeviation] (
    [Id] int NOT NULL PRIMARY KEY,
    [VerticalPostAdjustmentId] int,
    [PostAdjustmentDistanceId] int,
    [Deviation] int
);

CREATE TABLE [PostVerticalDeviationLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [VerticalPostAdjustmentId] int,
    [PostAdjustmentDistanceId] int,
    [Deviation] int
);

CREATE TABLE [practice] (
    [pra_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [pra_name] nvarchar(510),
    [pra_type] int,
    [pra_OpenDate] datetime,
    [pra_CloseDate] datetime,
    [pra_UpdateDateTime] datetime NOT NULL,
    [pra_prd_PractitionerDataSourceId] int,
    [pra_Active] bit NOT NULL,
    [pra_LocalCode] nvarchar(510),
    [pra_CcgCode] nvarchar(510),
    [pra_Region] nvarchar(510)
);

CREATE TABLE [practiceaddresslink] (
    [pak_id] int NOT NULL PRIMARY KEY,
    [pak_addressno] tinyint(1) NOT NULL,
    [pak_main] bit NOT NULL
);

CREATE TABLE [PracticeAddressLinkBackup] (
    [pak_id] int NOT NULL,
    [pak_add_id] uniqueidentifier NOT NULL,
    [pak_pra_id] uniqueidentifier NOT NULL,
    [pak_addressno] tinyint(1) NOT NULL,
    [pak_main] bit NOT NULL,
    [InsertDateTime] datetime
);

CREATE TABLE [practiceaddresslinklog] (
    [pak_ObjectId] int NOT NULL,
    [pak_id] int NOT NULL PRIMARY KEY,
    [pak_add_id] uniqueidentifier NOT NULL,
    [pak_pra_id] uniqueidentifier NOT NULL,
    [pak_addressno] tinyint(1) NOT NULL,
    [pak_main] bit NOT NULL,
    [pak_DateAdded] datetime NOT NULL,
    [pak_AddedBy] uniqueidentifier NOT NULL,
    [pak_TransactionId] uniqueidentifier NOT NULL,
    [pak_Action] char(1) NOT NULL
);

CREATE TABLE [PracticeBackup] (
    [pra_id] uniqueidentifier NOT NULL,
    [pra_code] varchar(255) NOT NULL,
    [pra_name] varchar(255) NOT NULL,
    [pra_type] int,
    [pra_OpenDate] datetime,
    [pra_CloseDate] datetime,
    [pra_UpdateDateTime] datetime NOT NULL,
    [insertDateTime] datetime
);

CREATE TABLE [PracticeLink] (
    [PracticeId] uniqueidentifier NOT NULL PRIMARY KEY,
    [LinkedPracticeId] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [PracticeLinkImportHistory] (
    [Id] int NOT NULL PRIMARY KEY,
    [FileName] nvarchar(510) NOT NULL,
    [ImportSuccessful] bit NOT NULL,
    [DateImported] datetime2 NOT NULL,
    [ImportResults] nvarchar(MAX)
);

CREATE TABLE [practicelog] (
    [pra_ObjectId] uniqueidentifier NOT NULL,
    [pra_id] int NOT NULL PRIMARY KEY,
    [pra_code] varchar(255) NOT NULL,
    [pra_name] nvarchar(510),
    [pra_type] int,
    [pra_DateAdded] datetime NOT NULL,
    [pra_AddedBy] uniqueidentifier NOT NULL,
    [pra_TransactionId] uniqueidentifier NOT NULL,
    [pra_Action] char(1) NOT NULL,
    [pra_OpenDate] datetime,
    [pra_CloseDate] datetime,
    [pra_UpdateDateTime] datetime,
    [pra_prd_PractitionerDataSourceId] int,
    [pra_Active] bit,
    [pra_LocalCode] nvarchar(510),
    [pra_CcgCode] nvarchar(510),
    [pra_Region] nvarchar(510)
);

CREATE TABLE [PracticeRegion] (
    [prn_id] smallint(2) NOT NULL PRIMARY KEY,
    [prn_description] nvarchar(510) NOT NULL
);

CREATE TABLE [practicestopractitioners] (
    [practice_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [practitioner_id] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [PracticeType] (
    [pra_type] int NOT NULL PRIMARY KEY
);

CREATE TABLE [practitioner] (
    [ptr_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [ptr_title] nvarchar(510),
    [ptr_jobtitle] nvarchar(510),
    [ptr_pasid] int,
    [ptr_lks_id_specialty] int,
    [ptr_forename] nvarchar(510),
    [ptr_lks_id_gender] int,
    [ptr_prn_RegionId] smallint(2),
    [ptr_SpecialtyFreeText] nvarchar(MAX),
    [ptr_prd_PractitionerDataSourceId] int,
    [ptr_Active] bit NOT NULL
);

CREATE TABLE [practitionercontact] (
    [ptc_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [ptc_ptr_id] uniqueidentifier NOT NULL,
    [ptc_value] nvarchar(510),
    [ptc_lks_id_contact] int NOT NULL,
    [ptc_preferred] bit NOT NULL
);

CREATE TABLE [practitionercontactlog] (
    [ptc_ObjectId] uniqueidentifier NOT NULL,
    [ptc_id] int NOT NULL PRIMARY KEY,
    [ptc_ptr_id] uniqueidentifier NOT NULL,
    [ptc_value] nvarchar(510),
    [ptc_lks_id_contact] int NOT NULL,
    [ptc_preferred] bit NOT NULL,
    [ptc_DateAdded] datetime NOT NULL,
    [ptc_AddedBy] uniqueidentifier NOT NULL,
    [ptc_TransactionId] uniqueidentifier NOT NULL,
    [ptc_Action] char(1) NOT NULL
);

CREATE TABLE [PractitionerDataSource] (
    [prd_id] int NOT NULL PRIMARY KEY,
    [prd_description] varchar(255) NOT NULL
);

CREATE TABLE [practitionerlog] (
    [ptr_ObjectId] uniqueidentifier NOT NULL,
    [ptr_id] int NOT NULL PRIMARY KEY,
    [ptr_code] varchar(255) NOT NULL,
    [ptr_title] nvarchar(510),
    [ptr_surname] nvarchar(510),
    [ptr_jobtitle] nvarchar(510),
    [ptr_pasid] int,
    [ptr_typemembership] int,
    [ptr_lks_id_specialty] int,
    [ptr_forename] nvarchar(510),
    [ptr_lks_id_gender] int,
    [ptr_DateAdded] datetime NOT NULL,
    [ptr_AddedBy] uniqueidentifier NOT NULL,
    [ptr_TransactionId] uniqueidentifier NOT NULL,
    [ptr_Action] char(1) NOT NULL,
    [ptr_prn_RegionId] smallint(2),
    [ptr_SpecialtyFreeText] nvarchar(MAX),
    [ptr_prd_PractitionerDataSourceId] int,
    [ptr_Active] bit
);

CREATE TABLE [PractitionerPatchType] (
    [prp_id] int NOT NULL PRIMARY KEY,
    [prp_pty_id] int NOT NULL,
    [prp_prd_id] int NOT NULL,
    [prp_ptt_id] int NOT NULL,
    [prp_autoupdate] bit NOT NULL,
    [prp_datelastautoupdated] datetime
);

CREATE TABLE [PractitionerPracticeTypeMismatch] (
    [Id] int NOT NULL PRIMARY KEY,
    [EventDate] datetime2 NOT NULL,
    [PatientDemographicStorePractitionerId] int NOT NULL,
    [PatientId] uniqueidentifier,
    [PractitionerCode] varchar(255) NOT NULL,
    [PractitionerType] int NOT NULL,
    [PracticeCode] varchar(255) NOT NULL,
    [PracticeType] int NOT NULL
);

CREATE TABLE [PractitionersWithoutCode_BackUp_20191115] (
    [dpr_id] int,
    [dpr_pdm_id] int,
    [dpr_practitionercode] nvarchar(510),
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int,
    [dpr_email] nvarchar(510),
    [dpr_mobilephonenumber] nvarchar(510),
    [dpr_faxnumber] nvarchar(510),
    [dpr_specialtyfreetext] nvarchar(510)
);

CREATE TABLE [PractitionersWithoutCode_BackUp_20191115143957] (
    [dpr_id] int,
    [dpr_pdm_id] int,
    [dpr_practitionercode] nvarchar(510),
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int,
    [dpr_email] nvarchar(510),
    [dpr_mobilephonenumber] nvarchar(510),
    [dpr_faxnumber] nvarchar(510),
    [dpr_specialtyfreetext] nvarchar(510)
);

CREATE TABLE [practitionertype] (
    [ptt_id] int NOT NULL PRIMARY KEY,
    [ptt_description] nvarchar(510),
    [ptt_displayorder] int,
    [ptt_helpmessage] nvarchar(2048),
    [ptt_available] bit NOT NULL
);

CREATE TABLE [PreAdjustment] (
    [Id] int NOT NULL PRIMARY KEY,
    [DiplopiaPreAdjustmentId] int NOT NULL,
    [Comments] nvarchar(1000),
    [DistanceHorizontalDeviationId] int,
    [NearHorizontalDeviationId] int,
    [DistanceVerticalDeviationId] int,
    [NearVerticalDeviationId] int
);

CREATE TABLE [PreAdjustmentDistance] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PreAdjustmentLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [DiplopiaPreAdjustmentId] int NOT NULL,
    [Comments] nvarchar(1000),
    [DistanceHorizontalDeviationId] int,
    [NearHorizontalDeviationId] int,
    [DistanceVerticalDeviationId] int,
    [NearVerticalDeviationId] int
);

CREATE TABLE [PreConfiguration] (
    [epc_Id] int NOT NULL PRIMARY KEY,
    [epc_Name] nvarchar(510) NOT NULL,
    [epc_Label] nvarchar(50) NOT NULL,
    [epc_IconTooltip] nvarchar(2000) NOT NULL,
    [epc_CleanUpTimeSecondsReadOnly] bit NOT NULL,
    [epc_set_SettingId] int
);

CREATE TABLE [PreHorizontalDeviation] (
    [Id] int NOT NULL PRIMARY KEY,
    [HorizontalPreAdjustmentId] int,
    [PreAdjustmentDistanceId] int,
    [Deviation] int
);

CREATE TABLE [PreHorizontalDeviationLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [HorizontalPreAdjustmentId] int,
    [PreAdjustmentDistanceId] int,
    [Deviation] int
);

CREATE TABLE [Preparation] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [HorizontalTargetId] int,
    [HorizontalTargetId] int,
    [VerticalTargetId] int,
    [VerticalTargetId] int,
    [CycloTargetId] int,
    [CycloTargetId] int,
    [TargetConditionId] int,
    [TargetConditionId] int,
    [TargetConditionCorrectionId] int,
    [TargetConditionCorrectionId] int,
    [StaySutureId] int,
    [VasoconstrictiveAgentId] int,
    [FDT] nvarchar(1000),
    [StaySutureId] int,
    [PeritomyId] int
);

CREATE TABLE [PreparationLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [HorizontalTargetId] int,
    [HorizontalTargetId] int,
    [VerticalTargetId] int,
    [VerticalTargetId] int,
    [CycloTargetId] int,
    [CycloTargetId] int,
    [TargetConditionId] int,
    [TargetConditionId] int,
    [TargetConditionCorrectionId] int,
    [TargetConditionCorrectionId] int,
    [StaySutureId] int,
    [VasoconstrictiveAgentId] int,
    [FDT] nvarchar(1000),
    [StaySutureId] int,
    [PeritomyId] int
);

CREATE TABLE [PreVerticalDeviation] (
    [Id] int NOT NULL PRIMARY KEY,
    [VerticalPreAdjustmentId] int,
    [PreAdjustmentDistanceId] int,
    [Deviation] int
);

CREATE TABLE [PreVerticalDeviationLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [VerticalPreAdjustmentId] int,
    [PreAdjustmentDistanceId] int,
    [Deviation] int
);

CREATE TABLE [PrimaryIndication] (
    [pri_id] int NOT NULL PRIMARY KEY,
    [pri_description] nvarchar(160) NOT NULL,
    [pri_order] int NOT NULL,
    [pri_available] bit NOT NULL,
    [pri_cpt_id_defaultconcept] int
);

CREATE TABLE [PrimaryIndicationDrugLink] (
    [pdl_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [PrismVergence] (
    [prv_Id] int NOT NULL PRIMARY KEY,
    [prv_ActivityId] uniqueidentifier NOT NULL,
    [prv_PrismLookupDataId] int,
    [prv_Correction] int,
    [prv_ResultLookupDataId] int,
    [prv_RecoveryLookupDataId] int,
    [prv_Comments] nvarchar(5000)
);

CREATE TABLE [PrismVergenceLog] (
    [prv_Id] int NOT NULL PRIMARY KEY,
    [prv_ObjectId] int NOT NULL,
    [prv_DateAdded] datetime NOT NULL,
    [prv_AddedBy] uniqueidentifier NOT NULL,
    [prv_Transactionid] uniqueidentifier NOT NULL,
    [prv_Action] char(1) NOT NULL,
    [prv_ActivityId] uniqueidentifier NOT NULL,
    [prv_PrismLookupDataId] int,
    [prv_Correction] int,
    [prv_ResultLookupDataId] int,
    [prv_RecoveryLookupDataId] int,
    [prv_Comments] nvarchar(5000)
);

CREATE TABLE [ProblemsWithInstillation] (
    [Id] int NOT NULL PRIMARY KEY,
    [ProblemsWithInstillation_LookupDataId] int NOT NULL,
    [DropsComplianceActivityId] uniqueidentifier NOT NULL
);

CREATE TABLE [ProblemsWithInstillationLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ProblemsWithInstillation_LookupDataId] int NOT NULL,
    [DropsComplianceActivityId] uniqueidentifier
);

CREATE TABLE [Procedure] (
    [apr_Id] int NOT NULL PRIMARY KEY,
    [apr_ProcedureId] int NOT NULL
);

CREATE TABLE [procedureactivityrules] (
    [pru_id] int NOT NULL,
    [pru_aty_id] int NOT NULL PRIMARY KEY,
    [pru_useabbreviation] bit NOT NULL PRIMARY KEY,
    [pru_ApplyOrdering] bit NOT NULL
);

CREATE TABLE [procedureactivitytypegroup] (
    [pag_id] int NOT NULL PRIMARY KEY,
    [pag_description] varchar(200)
);

CREATE TABLE [procedureactivitytypegroupitem] (
    [ati_id] int NOT NULL,
    [ati_pag_id] int NOT NULL PRIMARY KEY,
    [ati_pro_id] int NOT NULL PRIMARY KEY,
    [ati_aty_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ProcedureActivityTypeQualifierItem] (
    [paq_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [procedureadditionalprocedures] (
    [pdp_id] int NOT NULL PRIMARY KEY,
    [pdp_pas_id] int NOT NULL,
    [pdp_pro_id] int NOT NULL,
    [pdp_order] int NOT NULL,
    [pdp_available] bit NOT NULL,
    [pdp_pqi_id] int
);

CREATE TABLE [procedureadditionalprocedureset] (
    [pas_id] int NOT NULL PRIMARY KEY,
    [pas_description] varchar(255) NOT NULL,
    [pas_pro_id] int NOT NULL,
    [pas_categorywide] bit NOT NULL
);

CREATE TABLE [ProcedureCode] (
    [hpc_hmm_ModalityId] int,
    [hpc_Code] nvarchar(200) NOT NULL,
    [hpc_Description] nvarchar(510) NOT NULL,
    [hpc_CodingSystem] nvarchar(200) NOT NULL,
    [hpc_ScheduledTimeInMinutes] int NOT NULL,
    [hpc_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ProcedureCodeClinicalStudyLink] (
    [psl_std_ClinicalStudyId] int NOT NULL PRIMARY KEY,
    [psl_hpc_ProcedureCodeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ProcedureFactorsIncreasingSurgicalDifficulty] (
    [osd_ListQuestionId] int NOT NULL PRIMARY KEY,
    [osd_ProcedureId] int NOT NULL PRIMARY KEY,
    [osd_Available] bit NOT NULL
);

CREATE TABLE [procedureindicationlimit] (
    [oin_id] int NOT NULL PRIMARY KEY,
    [oin_combination] int NOT NULL,
    [oin_oct_id] int NOT NULL,
    [oin_combinationlimit] int NOT NULL
);

CREATE TABLE [procedurelink] (
    [pkp_id] int NOT NULL PRIMARY KEY,
    [pkp_pro_id_linked] int NOT NULL,
    [pkp_pkt_id] int NOT NULL
);

CREATE TABLE [procedurelinktype] (
    [pkt_id] int NOT NULL PRIMARY KEY,
    [pkt_desc] varchar(100) NOT NULL
);

CREATE TABLE [procedureoptions] (
    [prq_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [procedureoptionslog] (
    [prq_ObjectId] int NOT NULL,
    [prq_id] int NOT NULL PRIMARY KEY,
    [prq_pro_id] int NOT NULL,
    [prq_lks_id_option] int,
    [prq_answer] tinyint(1) NOT NULL,
    [prq_DateAdded] datetime NOT NULL,
    [prq_AddedBy] uniqueidentifier NOT NULL,
    [prq_TransactionId] uniqueidentifier NOT NULL,
    [prq_Action] char(1) NOT NULL
);

CREATE TABLE [procedurepostopprescription] (
    [ppp_id] int NOT NULL PRIMARY KEY,
    [ppp_pro_id] int,
    [ppp_oct_id] int,
    [ppp_drs_id] int NOT NULL,
    [ppp_contextflag] int,
    [ppp_cfd_id] int,
    [ppp_pqi_id] int,
    [ppp_anyqualifier] bit NOT NULL
);

CREATE TABLE [procedureproblemresolution] (
    [ppc_id] int NOT NULL PRIMARY KEY,
    [ppc_cfd_id] int,
    [ppc_cpt_id] int,
    [ppc_action] tinyint(1) NOT NULL
);

CREATE TABLE [procedurequalifier] (
    [pql_id] int NOT NULL PRIMARY KEY,
    [pql_pro_id] int NOT NULL,
    [pql_pqt_id] int,
    [pql_flag] int NOT NULL
);

CREATE TABLE [procedurequalifiergroup] (
    [pqg_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ProcedureQualifierGroupChartConfiguration] (
    [Id] int NOT NULL PRIMARY KEY,
    [ProcedureQualifierGroupId] int NOT NULL,
    [ChartAxisDescription] nvarchar(512),
    [ChartColor] varchar(256)
);

CREATE TABLE [procedurequalifiergroupitem] (
    [pgi_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ProcedureQualifierGroupIVITypeMapping] (
    [Id] int NOT NULL PRIMARY KEY,
    [ProcedureQualifierGroupId] int NOT NULL,
    [IVITypeId] int NOT NULL
);

CREATE TABLE [procedurequalifieritem] (
    [pqi_id] int NOT NULL PRIMARY KEY,
    [pqi_pqt_id] int NOT NULL,
    [pqi_description] nvarchar(510),
    [pqi_code] varchar(30),
    [pqi_abbreviation] nvarchar(510),
    [pqi_descriptionex] nvarchar(510),
    [pqi_order] int NOT NULL,
    [pqi_flag] int NOT NULL,
    [pqi_available] bit,
    [pqi_procedurecodeoverride] varchar(255),
    [pqi_snomed] bigint(8)
);

CREATE TABLE [procedurequalifieritemdrug] (
    [pqd_id] int NOT NULL PRIMARY KEY,
    [pqd_dosenumericvalue] float(8) NOT NULL,
    [pqd_ddt_id] int,
    [pqd_dfm_id] int,
    [pqd_displaydose] bit,
    [pqd_opcscode] varchar(255),
    [pqd_trial] bit,
    [pqd_notes] nvarchar(510)
);

CREATE TABLE [ProcedureQualifierItemDrugDuplicateMedicationRemovalBackup] (
    [pqd_id] int NOT NULL PRIMARY KEY,
    [pqd_pqi_id] int NOT NULL,
    [pqd_dmy_id] int,
    [pqd_dbr_id] int,
    [pqd_dosenumericvalue] float(8),
    [pqd_ddt_id] int,
    [pqd_dfm_id] int,
    [pqd_displaydose] bit,
    [pqd_opcscode] varchar(255),
    [pqd_trial] bit,
    [pqd_lks_id_category] int,
    [pqd_notes] nvarchar(510),
    [pqd_moietydescriptionoverride] nvarchar(510),
    [pqd_branddescriptionoverride] nvarchar(510)
);

CREATE TABLE [procedurequalifieritemexclusion] (
    [pqx_id] int NOT NULL PRIMARY KEY,
    [pqx_pqi_id] int NOT NULL,
    [pqx_availableinsearch] bit NOT NULL,
    [pqx_fallback_pqi_id] int
);

CREATE TABLE [procedurequalifiertype] (
    [pqt_id] int NOT NULL PRIMARY KEY,
    [pqt_description] nvarchar(510),
    [pqt_lkt_id_list] int,
    [pqt_flag] int NOT NULL,
    [pqt_procedurequalifierseparator] nvarchar(200),
    [pqt_qualifierconcatenationtype] int NOT NULL,
    [pqt_abbreviationqualifieronly] bit NOT NULL,
    [pqt_procedurequalifierabbreviationseparator] nvarchar(200)
);

CREATE TABLE [procedurequestionmapping] (
    [pqm_id] int NOT NULL PRIMARY KEY,
    [pqm_pqi_id] int,
    [pqm_lkt_id] int,
    [pqm_lks_id] int,
    [pqm_lqs_id] int,
    [pqm_lqu_id] int,
    [pqm_mappingdirection] int NOT NULL,
    [pqm_active] bit NOT NULL,
    [pqm_aty_id] int
);

CREATE TABLE [procedures] (
    [pro_id] int NOT NULL PRIMARY KEY,
    [pro_abbreviation] nvarchar(510),
    [pro_description] nvarchar(510),
    [pro_snomedcode] varchar(255),
    [pro_readcode] varchar(255),
    [pro_opcscode] varchar(255),
    [pro_hrgcode] varchar(255),
    [pro_defaultduration] tinyint(1),
    [pro_oct_id] int,
    [pro_order] int,
    [pro_cpt_defaultindication] int,
    [pro_available] bit,
    [pro_flag] int,
    [pro_legacy] bit,
    [pro_lks_id_lensstatus] int,
    [pro_requiresqualifiers] bit,
    [pro_clinic] bit,
    [pro_theatre] bit,
    [pro_DisplayOrder] int
);

CREATE TABLE [procedureset] (
    [pst_id] int NOT NULL PRIMARY KEY,
    [pst_abbreviation] varchar(255),
    [pst_description] nvarchar(510),
    [pst_members] int,
    [pst_maxindications] int
);

CREATE TABLE [proceduresetitem] (
    [psi_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ProceduresGUID] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ProcedureSubSection] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [proceduresynonym] (
    [psy_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Programme] (
    [Id] int NOT NULL PRIMARY KEY,
    [IsActive] bit NOT NULL
);

CREATE TABLE [ProgrammeExtractDefinition] (
    [Id] int NOT NULL PRIMARY KEY,
    [ProgrammeId] int NOT NULL,
    [Name] nvarchar(200) NOT NULL
);

CREATE TABLE [ProteinData] (
    [upo_id] int NOT NULL PRIMARY KEY,
    [upo_available] bit NOT NULL
);

CREATE TABLE [Protocol] (
    [ipp_id] int NOT NULL PRIMARY KEY,
    [ipp_protocol] nvarchar(160) NOT NULL,
    [ipp_available] bit NOT NULL
);

CREATE TABLE [QuadrantType] (
    [Id] int NOT NULL PRIMARY KEY,
    [HfaReferenceDescription] nvarchar(510) NOT NULL
);

CREATE TABLE [Qualifier] (
    [pqs_Id] int NOT NULL PRIMARY KEY,
    [pqs_AntimetaboliteProcedureId] int NOT NULL,
    [pqs_ProcedureQualifierItemId] int NOT NULL
);

CREATE TABLE [QualifierStrength] (
    [pqa_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [QualifierType] (
    [bqt_id] int NOT NULL PRIMARY KEY,
    [bqt_description] nvarchar(510)
);

CREATE TABLE [Query] (
    [squ_Id] int NOT NULL PRIMARY KEY,
    [squ_OriginalValue] nvarchar(4000),
    [squ_sqs_StatusId] int NOT NULL,
    [squ_lks_TypeId] int,
    [squ_Text] nvarchar(500) NOT NULL,
    [squ_use_LastUpdatedUserId] uniqueidentifier NOT NULL,
    [squ_LastUpdatedDate] datetime NOT NULL
);

CREATE TABLE [QueryLog] (
    [squ_Id] int NOT NULL PRIMARY KEY,
    [squ_ObjectId] int NOT NULL,
    [squ_DateAdded] datetime NOT NULL,
    [squ_AddedBy] uniqueidentifier NOT NULL,
    [squ_Transactionid] uniqueidentifier NOT NULL,
    [squ_Action] char(1) NOT NULL,
    [squ_OriginalValue] nvarchar(4000),
    [squ_sqs_StatusId] int NOT NULL,
    [squ_lks_TypeId] int,
    [squ_Text] nvarchar(500) NOT NULL,
    [squ_use_LastUpdatedUserId] uniqueidentifier NOT NULL,
    [squ_LastUpdatedDate] datetime NOT NULL
);

CREATE TABLE [QueryResponse] (
    [sqr_Id] int NOT NULL PRIMARY KEY,
    [sqr_squ_QueryId] int NOT NULL,
    [sqr_use_LastUpdatedUserId] uniqueidentifier NOT NULL,
    [sqr_LastUpdatedDate] datetime NOT NULL,
    [sqr_Comment] nvarchar(500) NOT NULL,
    [sqr_IsAdditionalComment] bit NOT NULL
);

CREATE TABLE [QueryResponseLog] (
    [sqr_Id] int NOT NULL PRIMARY KEY,
    [sqr_ObjectId] int NOT NULL,
    [sqr_DateAdded] datetime NOT NULL,
    [sqr_AddedBy] uniqueidentifier NOT NULL,
    [sqr_Transactionid] uniqueidentifier NOT NULL,
    [sqr_Action] char(1) NOT NULL,
    [sqr_squ_QueryId] int NOT NULL,
    [sqr_use_LastUpdatedUserId] uniqueidentifier NOT NULL,
    [sqr_LastUpdatedDate] datetime NOT NULL,
    [sqr_Comment] nvarchar(500) NOT NULL,
    [sqr_IsAdditionalComment] bit NOT NULL
);

CREATE TABLE [QueryStatus] (
    [sqs_Id] int NOT NULL PRIMARY KEY,
    [sqs_Description] nvarchar(500) NOT NULL
);

CREATE TABLE [Question] (
    [qui_Id] int NOT NULL PRIMARY KEY,
    [qui_Description] nvarchar(510) NOT NULL,
    [qui_eci_ItemTypeId] int NOT NULL
);

CREATE TABLE [QuestionCheckList] (
    [dsq_lqu_id] int NOT NULL PRIMARY KEY,
    [dsq_lks_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [QuestionCheckListLog] (
    [dsq_lqu_id] int NOT NULL PRIMARY KEY,
    [dsq_ObjectId] int NOT NULL,
    [dsq_DateAdded] datetime NOT NULL,
    [dsq_AddedBy] uniqueidentifier NOT NULL,
    [dsq_Transactionid] uniqueidentifier NOT NULL,
    [dsq_Action] char(1) NOT NULL,
    [dsq_lks_id] int NOT NULL
);

CREATE TABLE [QuestionLog] (
    [qui_Id] int NOT NULL PRIMARY KEY,
    [qui_ObjectId] int NOT NULL,
    [qui_DateAdded] datetime NOT NULL,
    [qui_AddedBy] uniqueidentifier NOT NULL,
    [qui_Transactionid] uniqueidentifier NOT NULL,
    [qui_Action] char(1) NOT NULL,
    [qui_Description] nvarchar(510) NOT NULL,
    [qui_eci_ItemTypeId] int NOT NULL,
    [qui_UniqueKey] uniqueidentifier
);

CREATE TABLE [Questionnaire] (
    [cpq_Id] int NOT NULL PRIMARY KEY,
    [cpq_Pin] char(13) NOT NULL,
    [cpq_CreatedOn] datetime NOT NULL,
    [cpq_LastModifiedOn] datetime NOT NULL,
    [cpq_RawScore] int NOT NULL,
    [cpq_RaschMeasure] decimal(18, 2)
);

CREATE TABLE [QuestionnaireAnswer] (
    [cpa_Id] int NOT NULL PRIMARY KEY,
    [cpa_QuestionScore] int NOT NULL
);

CREATE TABLE [QuestionResponse] (
    [aqr_id] int NOT NULL PRIMARY KEY,
    [etq_Id] int NOT NULL PRIMARY KEY,
    [aqr_Description] nvarchar(400) NOT NULL,
    [aqr_IsDeleted] bit NOT NULL,
    [aqr_Order] int NOT NULL,
    [etq_FreeTextResponse] nvarchar(1000),
    [etq_NumericResponse] float(8),
    [etq_DateResponse] datetime,
    [etq_DatePrecisionTypeId] int,
    [etq_DecimalPlacesEntered] int
);

CREATE TABLE [QuestionResponseLog] (
    [aqr_id] int NOT NULL PRIMARY KEY,
    [etq_Id] int NOT NULL PRIMARY KEY,
    [etq_ObjectId] int NOT NULL,
    [aqr_ObjectId] int NOT NULL,
    [aqr_DateAdded] datetime NOT NULL,
    [etq_DateAdded] datetime NOT NULL,
    [etq_AddedBy] uniqueidentifier NOT NULL,
    [aqr_AddedBy] uniqueidentifier NOT NULL,
    [aqr_Transactionid] uniqueidentifier NOT NULL,
    [etq_Transactionid] uniqueidentifier NOT NULL,
    [etq_Action] char(1) NOT NULL,
    [aqr_Action] char(1) NOT NULL,
    [aqr_Description] nvarchar(400) NOT NULL,
    [etq_ets_SectionId] int NOT NULL,
    [etq_quv_QuestionVersionId] int NOT NULL,
    [aqr_IsDeleted] bit NOT NULL,
    [aqr_Order] int NOT NULL,
    [etq_qrv_ResponseVersionId] int,
    [etq_bod_BodyPartId] int NOT NULL,
    [aqr_UniqueKey] uniqueidentifier,
    [etq_FreeTextResponse] nvarchar(1000),
    [etq_NumericResponse] float(8),
    [etq_DateResponse] datetime,
    [etq_DatePrecisionTypeId] int,
    [etq_DecimalPlacesEntered] int
);

CREATE TABLE [QuestionResponseVersion] (
    [qrv_id] int NOT NULL PRIMARY KEY,
    [erv_Id] int NOT NULL PRIMARY KEY,
    [erv_etq_QuestionResponseId] int NOT NULL,
    [qrv_aqr_QuestionResponseId] int NOT NULL,
    [qrv_Version] int,
    [erv_qrv_ResponseVersionId] int NOT NULL,
    [qrv_Value] nvarchar(400) NOT NULL,
    [qrv_Order] int NOT NULL
);

CREATE TABLE [QuestionResponseVersionLog] (
    [erv_Id] int NOT NULL PRIMARY KEY,
    [qrv_id] int NOT NULL PRIMARY KEY,
    [qrv_ObjectId] int NOT NULL,
    [erv_ObjectId] int NOT NULL,
    [erv_DateAdded] datetime NOT NULL,
    [qrv_DateAdded] datetime NOT NULL,
    [qrv_AddedBy] uniqueidentifier NOT NULL,
    [erv_AddedBy] uniqueidentifier NOT NULL,
    [erv_Transactionid] uniqueidentifier NOT NULL,
    [qrv_TransactionId] uniqueidentifier NOT NULL,
    [qrv_Action] char(1) NOT NULL,
    [erv_Action] char(1) NOT NULL,
    [erv_etq_QuestionResponseId] int NOT NULL,
    [qrv_aqr_QuestionResponseId] int NOT NULL,
    [qrv_Version] int,
    [erv_qrv_ResponseVersionId] int NOT NULL,
    [qrv_Value] nvarchar(400) NOT NULL,
    [qrv_Order] int NOT NULL,
    [qrv_UniqueKey] uniqueidentifier NOT NULL
);

CREATE TABLE [QuestionsResponse] (
    [qqr_qui_QuestionId] int NOT NULL PRIMARY KEY,
    [qqr_aqr_QuestionResponseId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [QuestionsResponseVersion] (
    [qqr_quv_QuestionVersionId] int NOT NULL PRIMARY KEY,
    [qqr_qrv_QuestionResponseVersionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [QuestionVersion] (
    [quv_eiv_ItemVersionId] int NOT NULL PRIMARY KEY,
    [quv_qui_QuestionId] int NOT NULL,
    [quv_Mandatory] bit NOT NULL,
    [quv_qrv_TriggerQuestionResponseVersionId] int,
    [quv_qrv_DefaultQuestionResponseVersionId] int,
    [quv_DefaultNumeric] float(8),
    [quv_DefaultNumericDecimalPlaces] int,
    [quv_DefaultCurrentDate] bit,
    [quv_DefaultFreeText] nvarchar(510)
);

CREATE TABLE [QuestionVersionLog] (
    [quv_eiv_ItemVersionId] int NOT NULL PRIMARY KEY,
    [quv_ObjectId] int NOT NULL,
    [quv_DateAdded] datetime NOT NULL,
    [quv_AddedBy] uniqueidentifier NOT NULL,
    [quv_TransactionId] uniqueidentifier NOT NULL,
    [quv_Action] char(1) NOT NULL,
    [quv_qui_QuestionId] int NOT NULL,
    [quv_Mandatory] bit NOT NULL,
    [quv_qrv_TriggerQuestionResponseVersionId] int,
    [quv_qrv_DefaultQuestionResponseVersionId] int,
    [quv_DefaultNumeric] float(8),
    [quv_DefaultNumericDecimalPlaces] int,
    [quv_DefaultCurrentDate] bit,
    [quv_DefaultFreeText] nvarchar(510)
);

CREATE TABLE [Queue] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [QueuedTime] datetime2 NOT NULL,
    [PriorityId] int NOT NULL,
    [StatusId] int NOT NULL,
    [StatusId] int NOT NULL,
    [StatusChangedTime] datetime2 NOT NULL,
    [DateCreated] datetime NOT NULL,
    [LastModified] datetime NOT NULL,
    [QueueProcessorId] int,
    [AttemptedRetries] int
);

CREATE TABLE [QueueAudit] (
    [Id] int NOT NULL PRIMARY KEY,
    [QueueId] int NOT NULL,
    [ProcessingStartTime] datetime2 NOT NULL,
    [ProcessingEndTime] datetime2 NOT NULL,
    [QueueProcessorId] int NOT NULL,
    [FailureReason] varchar(MAX),
    [ErrorGroupId] int
);

CREATE TABLE [QueueLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PriorityId] int NOT NULL,
    [StatusId] int NOT NULL,
    [DateCreated] datetime NOT NULL,
    [LastModified] datetime NOT NULL,
    [AttemptedRetries] int,
    [HumphreyTestId] int NOT NULL
);

CREATE TABLE [QueuePatientNumber] (
    [Id] int NOT NULL PRIMARY KEY,
    [QueueId] int NOT NULL,
    [PatientNumber] varchar(255) NOT NULL,
    [IsPrimary] bit NOT NULL
);

CREATE TABLE [QueuePatientNumberAudit] (
    [Id] int NOT NULL PRIMARY KEY,
    [QueueAuditId] int NOT NULL,
    [PatientNumber] varchar(255) NOT NULL,
    [IsPrimary] bit NOT NULL
);

CREATE TABLE [QueuePriority] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(100) NOT NULL
);

CREATE TABLE [QueueProcessor] (
    [Id] int NOT NULL PRIMARY KEY,
    [Active] bit NOT NULL,
    [LastSeen] datetime NOT NULL
);

CREATE TABLE [QueueStatus] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(100) NOT NULL,
    [Name] varchar(20)
);

CREATE TABLE [ReasonsConfigurationItem] (
    [usi_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ReceivedPackage] (
    [rpk_Id] int NOT NULL PRIMARY KEY,
    [rpk_Description] nvarchar(500) NOT NULL,
    [rpk_ReceivedDate] datetime NOT NULL,
    [rpk_PublishedDate] datetime NOT NULL,
    [rpk_PublishedBy] nvarchar(200) NOT NULL,
    [rpk_PayloadHash] varchar(64) NOT NULL
);

CREATE TABLE [ReceivedPackageArtefact] (
    [rpa_Id] int NOT NULL PRIMARY KEY,
    [rpa_Identifier] uniqueidentifier NOT NULL,
    [rpk_PayloadHash] varchar(64) NOT NULL,
    [rpk_Installed] bit NOT NULL
);

CREATE TABLE [Recession] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [PseudotendonExcised] float(8),
    [MuscleFoundAt] float(8) NOT NULL,
    [AmountOfSurgery] float(8) NOT NULL,
    [TechniqueId] int,
    [SutureId] int
);

CREATE TABLE [RecessionLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PseudotendonExcised] float(8),
    [MuscleFoundAt] float(8) NOT NULL,
    [AmountOfSurgery] float(8) NOT NULL,
    [TechniqueId] int,
    [SutureId] int
);

CREATE TABLE [RecessionResection] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SutureId] int,
    [TechniqueId] int
);

CREATE TABLE [RecessionResectionLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [SutureId] int,
    [TechniqueId] int
);

CREATE TABLE [RecessionTechnique] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [RecipientExplanatorySentence] (
    [DocumentRecipientId] int NOT NULL PRIMARY KEY,
    [PrimaryRecipient] nvarchar(1000) NOT NULL,
    [Sender] nvarchar(1000) NOT NULL,
    [CopyFor] nvarchar(1000) NOT NULL
);

CREATE TABLE [RecipientExplanatorySentenceLog] (
    [DocumentRecipientId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PrimaryRecipient] nvarchar(1000) NOT NULL,
    [Sender] nvarchar(1000) NOT NULL,
    [CopyFor] nvarchar(1000) NOT NULL
);

CREATE TABLE [RecordedValues] (
    [urv_id] int NOT NULL PRIMARY KEY,
    [urv_ubl_id] int,
    [urv_ubd_id] int,
    [urv_ugl_id] int,
    [urv_ukt_id] int,
    [urv_uly_id] int,
    [urv_unt_id] int,
    [urv_uph_id] int,
    [urv_upo_id] int,
    [urv_usg_id] int,
    [urv_uub_id] int,
    [urv_utb_id] int,
    [urv_uco_id] int
);

CREATE TABLE [RecordedValuesLog] (
    [urv_id] int NOT NULL PRIMARY KEY,
    [urv_act_id] uniqueidentifier NOT NULL,
    [urv_ubl_id] int,
    [urv_ubd_id] int,
    [urv_ugl_id] int,
    [urv_ukt_id] int,
    [urv_uly_id] int,
    [urv_unt_id] int,
    [urv_uph_id] int,
    [urv_upo_id] int,
    [urv_usg_id] int,
    [urv_uub_id] int,
    [urv_utb_id] int,
    [urv_uco_id] int,
    [urv_DateAdded] datetime NOT NULL,
    [urv_AddedBy] uniqueidentifier NOT NULL,
    [urv_TransactionId] uniqueidentifier NOT NULL,
    [urv_Action] char(1) NOT NULL
);

CREATE TABLE [RecoveryOptions] (
    [Id] int NOT NULL PRIMARY KEY,
    [RecoveryName] nvarchar(50) NOT NULL
);

CREATE TABLE [Reference] (
    [brf_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ReferenceDataVersion] (
    [PackageTypeId] int NOT NULL PRIMARY KEY,
    [Name] nvarchar(512) NOT NULL,
    [Version] nvarchar(100) NOT NULL,
    [DateVersionReported] datetime NOT NULL
);

CREATE TABLE [ReferenceLog] (
    [brf_Id] int NOT NULL PRIMARY KEY,
    [brf_pat_id] uniqueidentifier,
    [brf_PatientNumber] nvarchar(60) NOT NULL,
    [brf_BillingReference] nvarchar(60) NOT NULL,
    [brf_CaseNumber] nvarchar(60),
    [brf_EventDate] datetime2 NOT NULL,
    [brf_VisitCategory] nvarchar(100),
    [brf_Class] nvarchar(60),
    [brf_Service] nvarchar(100),
    [brf_Location] nvarchar(100),
    [brf_ObjectId] int NOT NULL,
    [brf_DateAdded] datetime NOT NULL,
    [brf_AddedBy] uniqueidentifier NOT NULL,
    [brf_TransactionId] uniqueidentifier NOT NULL,
    [brf_Action] char(1) NOT NULL,
    [brf_pdm_PatientDemographicStoreId] int,
    [brf_Deleted] bit,
    [brf_LocationSegment] nvarchar(100),
    [brf_Movement] nvarchar(398),
    [brf_AdmissionDate] datetime2,
    [brf_DischargeDate] datetime2
);

CREATE TABLE [referral] (
    [rfl_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ReferralGUID] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [referrallog] (
    [rfl_ObjectId] int NOT NULL,
    [rfl_act_id] uniqueidentifier NOT NULL,
    [rfl_dateofreferral] datetime NOT NULL,
    [rfl_datereceived] datetime,
    [rfl_priority] int NOT NULL,
    [rfl_prf_id] int,
    [rfl_id] int NOT NULL PRIMARY KEY,
    [rfl_DateAdded] datetime NOT NULL,
    [rfl_AddedBy] uniqueidentifier NOT NULL,
    [rfl_TransactionId] uniqueidentifier NOT NULL,
    [rfl_Action] char(1) NOT NULL
);

CREATE TABLE [referralprimarilyreferredfortype] (
    [prf_description] nvarchar(1000),
    [prf_order] int NOT NULL,
    [prf_parent] int,
    [prf_available] bit NOT NULL,
    [prf_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ReferralPriority] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(40) NOT NULL
);

CREATE TABLE [ReferralRequest] (
    [RequestId] int NOT NULL PRIMARY KEY,
    [DateOfReferral] date(3) NOT NULL,
    [PriorityId] int NOT NULL,
    [SourceOfReferralId] int
);

CREATE TABLE [ReferralSource] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(100) NOT NULL
);

CREATE TABLE [referralsource] (
    [rfs_rft_id] int NOT NULL,
    [rfs_ptr_id] uniqueidentifier,
    [rfs_id] int NOT NULL PRIMARY KEY,
    [rfs_deleted] bit NOT NULL
);

CREATE TABLE [referralsourcelog] (
    [rfs_ObjectId] int NOT NULL,
    [rfs_rfl_id] int NOT NULL,
    [rfs_rft_id] int NOT NULL,
    [rfs_ptr_id] uniqueidentifier,
    [rfs_id] int NOT NULL PRIMARY KEY,
    [rfs_deleted] bit NOT NULL,
    [rfs_DateAdded] datetime NOT NULL,
    [rfs_AddedBy] uniqueidentifier NOT NULL,
    [rfs_TransactionId] uniqueidentifier NOT NULL,
    [rfs_Action] char(1) NOT NULL
);

CREATE TABLE [referralsourcetype] (
    [rft_id] int NOT NULL PRIMARY KEY,
    [rft_description] nvarchar(1000),
    [rft_order] int NOT NULL,
    [rft_parent] int,
    [rft_ptt_id] int
);

CREATE TABLE [referralsourcetypespecialty] (
    [sts_id] int NOT NULL PRIMARY KEY,
    [sts_rft_id] int NOT NULL,
    [sts_lks_specialty] int NOT NULL,
    [sts_include] bit NOT NULL
);

CREATE TABLE [refraction] (
    [ref_id] int NOT NULL PRIMARY KEY,
    [ref_bod_id] int,
    [ref_sphere] float(8),
    [ref_cylinder] float(8),
    [ref_axis] float(8),
    [ref_add] float(8),
    [ref_addat] int,
    [ref_pd] float(8),
    [ref_ipd] float(8),
    [ref_pdt_historicdate] uniqueidentifier,
    [ref_prismrange1] decimal(18, 2),
    [ref_prismrange2] decimal(18, 2),
    [ref_lks_id_prismbase1] int,
    [ref_lks_id_prismbase2] int,
    [ref_cycloplegiate] bit,
    [ref_lks_id_type] int,
    [ref_lks_id_glasses] int,
    [ref_lks_id_reflexclarity] int,
    [ref_lks_id_reflexshape] int,
    [ref_lks_id_orthophoric] int,
    [ref_wd] int,
    [ref_distancetype] int,
    [ref_maddoxhorizontal] decimal(18, 2),
    [ref_maddoxvertical] decimal(18, 2),
    [ref_bvd] int,
    [ref_binocularbalance] varchar(5),
    [ref_lks_id_wdincluded] int,
    [ref_lks_id_workingdistance] int,
    [ref_meridian1] decimal(18, 2),
    [ref_meridian2] decimal(18, 2),
    [ref_power1] float(8),
    [ref_power2] float(8),
    [ref_lks_id_wdcorrection] int,
    [ref_balance] int,
    [ref_deleted] bit NOT NULL,
    [ref_sphericalequivalent] float(8)
);

CREATE TABLE [refractionlog] (
    [ref_ObjectId] int NOT NULL,
    [ref_id] int NOT NULL PRIMARY KEY,
    [ref_act_id] uniqueidentifier,
    [ref_bod_id] int,
    [ref_sphere] float(8),
    [ref_cylinder] float(8),
    [ref_axis] float(8),
    [ref_add] float(8),
    [ref_addat] int,
    [ref_pd] float(8),
    [ref_ipd] float(8),
    [ref_pdt_historicdate] uniqueidentifier,
    [ref_prismrange1] decimal(18, 2),
    [ref_prismrange2] decimal(18, 2),
    [ref_lks_id_prismbase1] int,
    [ref_lks_id_prismbase2] int,
    [ref_cycloplegiate] bit,
    [ref_lks_id_type] int,
    [ref_lks_id_glasses] int,
    [ref_lks_id_reflexclarity] int,
    [ref_lks_id_reflexshape] int,
    [ref_lks_id_orthophoric] int,
    [ref_wd] int,
    [ref_distancetype] int,
    [ref_maddoxhorizontal] decimal(18, 2),
    [ref_maddoxvertical] decimal(18, 2),
    [ref_bvd] int,
    [ref_binocularbalance] varchar(5),
    [ref_lks_id_wdincluded] int,
    [ref_lks_id_workingdistance] int,
    [ref_meridian1] decimal(18, 2),
    [ref_meridian2] decimal(18, 2),
    [ref_power1] float(8),
    [ref_power2] float(8),
    [ref_lks_id_wdcorrection] int,
    [ref_balance] int,
    [ref_DateAdded] datetime NOT NULL,
    [ref_AddedBy] uniqueidentifier NOT NULL,
    [ref_TransactionId] uniqueidentifier NOT NULL,
    [ref_Action] char(1) NOT NULL,
    [ref_sphericalequivalent] float(8),
    [ref_deleted] bit
);

CREATE TABLE [RegressionLineSplit] (
    [rls_Id] int NOT NULL PRIMARY KEY,
    [rls_pmd_MedicationId] int,
    [rls_prl_OperationProcedureId] int,
    [rls_bod_BodyPartId] int NOT NULL,
    [rls_SplitDate] datetime2 NOT NULL,
    [rls_NotRecordedOnEmrReason] nvarchar(400)
);

CREATE TABLE [RegressionLineSplitLog] (
    [rls_Id] int NOT NULL PRIMARY KEY,
    [rls_pat_PatientId] uniqueidentifier NOT NULL,
    [rls_use_UserRecordedBy] uniqueidentifier NOT NULL,
    [rls_pmd_MedicationId] int,
    [rls_prl_OperationProcedureId] int,
    [rls_bod_BodyPartId] int NOT NULL,
    [rls_SplitDate] datetime2 NOT NULL,
    [rls_NotRecordedOnEmrReason] nvarchar(400),
    [rls_DateRecorded] datetime2 NOT NULL,
    [rls_ObjectId] int NOT NULL,
    [rls_DateAdded] datetime NOT NULL,
    [rls_AddedBy] uniqueidentifier NOT NULL,
    [rls_Transactionid] uniqueidentifier NOT NULL,
    [rls_Action] char(1) NOT NULL,
    [rls_Deleted] bit NOT NULL,
    [rls_DateDeleted] datetime2,
    [rls_use_UserDeletedBy] uniqueidentifier
);

CREATE TABLE [Relative] (
    [fhr_id] int NOT NULL PRIMARY KEY,
    [fhr_description] nvarchar(100),
    [fhr_frg_id] int NOT NULL,
    [fhr_order] int NOT NULL,
    [fhr_available] bit NOT NULL
);

CREATE TABLE [RelativeGroup] (
    [frg_id] int NOT NULL PRIMARY KEY,
    [frg_description] nvarchar(100)
);

CREATE TABLE [ReleaseVersion] (
    [etr_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ReliabilityThreshold] (
    [rlt_Id] int NOT NULL PRIMARY KEY,
    [rlt_Description] nvarchar(510) NOT NULL,
    [rlt_Threshold] int
);

CREATE TABLE [ReliabilityThresholdLog] (
    [rlt_ObjectId] int NOT NULL,
    [rlt_Id] int NOT NULL PRIMARY KEY,
    [rlt_Description] nvarchar(510) NOT NULL,
    [rlt_Threshold] int,
    [rlt_DateAdded] datetime NOT NULL,
    [rlt_AddedBy] uniqueidentifier NOT NULL,
    [rlt_TransactionId] uniqueidentifier NOT NULL,
    [rlt_Action] char(1) NOT NULL
);

CREATE TABLE [Request] (
    [Id] int NOT NULL PRIMARY KEY,
    [Json] nvarchar(MAX),
    [PatientId] int,
    [DateTimeReceived] datetime2 NOT NULL,
    [EncounterId] uniqueidentifier,
    [PartnerId] int
);

CREATE TABLE [RequestExternalPatient] (
    [RequestId] int NOT NULL PRIMARY KEY,
    [ExternalPatientId] nvarchar(510),
    [ExternalPatientIdDataTypeId] int,
    [ExternalPartnerCode] nvarchar(510)
);

CREATE TABLE [RequestLog] (
    [Id] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Json] nvarchar(MAX),
    [EndpointId] int NOT NULL,
    [StatusId] int NOT NULL,
    [PatientMatchId] int,
    [PatientId] int,
    [DateTimeReceived] datetime2 NOT NULL,
    [EncounterId] uniqueidentifier,
    [PartnerId] int
);

CREATE TABLE [RequestProcessFailure] (
    [RequestId] int NOT NULL PRIMARY KEY,
    [FailureReason] nvarchar(MAX),
    [StackTrace] varchar(MAX)
);

CREATE TABLE [RequestProcessWarning] (
    [RequestId] int NOT NULL PRIMARY KEY,
    [Warning] nvarchar(MAX) NOT NULL
);

CREATE TABLE [RequestResponseAudit] (
    [Id] int NOT NULL PRIMARY KEY,
    [RequestBody] nvarchar(MAX) NOT NULL,
    [RequestDateTime] datetime2 NOT NULL,
    [Payload] nvarchar(MAX),
    [PayloadDataType] varchar(100),
    [ErrorResponse] nvarchar(MAX),
    [PartnerKey] uniqueidentifier
);

CREATE TABLE [RequestStatus] (
    [Id] int NOT NULL PRIMARY KEY,
    [RequestStatus] nvarchar(200)
);

CREATE TABLE [Resource] (
    [rso_id] int NOT NULL PRIMARY KEY,
    [rso_description] nvarchar(2000) NOT NULL,
    [rso_available] bit NOT NULL
);

CREATE TABLE [ResourceLog] (
    [rso_Id] int NOT NULL PRIMARY KEY,
    [rso_description] nvarchar(2000) NOT NULL,
    [rso_available] bit NOT NULL,
    [rso_ObjectId] int NOT NULL,
    [rso_DateAdded] datetime NOT NULL,
    [rso_AddedBy] uniqueidentifier NOT NULL,
    [rso_TransactionId] uniqueidentifier NOT NULL,
    [rso_Action] char(1) NOT NULL
);

CREATE TABLE [ResourceUser] (
    [clu_id] int NOT NULL PRIMARY KEY,
    [clu_use_id] uniqueidentifier NOT NULL,
    [clu_rso_id] int NOT NULL,
    [clu_active] bit NOT NULL
);

CREATE TABLE [ResourceUserLog] (
    [clu_Id] int NOT NULL PRIMARY KEY,
    [clu_use_id] uniqueidentifier NOT NULL,
    [clu_rso_id] int NOT NULL,
    [clu_active] bit NOT NULL,
    [clu_ObjectId] int NOT NULL,
    [clu_DateAdded] datetime NOT NULL,
    [clu_AddedBy] uniqueidentifier NOT NULL,
    [clu_TransactionId] uniqueidentifier NOT NULL,
    [clu_Action] char(1) NOT NULL
);

CREATE TABLE [Response] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(200) NOT NULL
);

CREATE TABLE [Result] (
    [pre_Id] int NOT NULL PRIMARY KEY,
    [pre_PcrProbabilityPercentage] decimal(18, 2) NOT NULL,
    [pre_RiskMultiple] decimal(18, 2) NOT NULL
);

CREATE TABLE [ReviewOfPatientHistory] (
    [rph_act_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [rph_PatientMedicalRecordChecked] bit NOT NULL,
    [rph_Comments] nvarchar(4000),
    [rph_HistoryChangeAcknowledged] bit
);

CREATE TABLE [ReviewOfPatientHistoryLog] (
    [rph_act_id] int NOT NULL PRIMARY KEY,
    [rph_ObjectId] uniqueidentifier NOT NULL,
    [rph_DateAdded] datetime NOT NULL,
    [rph_AddedBy] uniqueidentifier NOT NULL,
    [rph_Transactionid] uniqueidentifier NOT NULL,
    [rph_Action] char(1) NOT NULL,
    [rph_PatientMedicalRecordChecked] bit NOT NULL,
    [rph_Comments] nvarchar(4000),
    [rph_HistoryChangeAcknowledged] bit
);

CREATE TABLE [ReviewOfSystems] (
    [ros_id] int NOT NULL PRIMARY KEY,
    [ros_act_id] uniqueidentifier NOT NULL,
    [ros_noRelevantFindings] bit NOT NULL,
    [ros_comments] nvarchar(MAX)
);

CREATE TABLE [ReviewOfSystemsLog] (
    [ros_ObjectId] int NOT NULL,
    [ros_id] int NOT NULL PRIMARY KEY,
    [ros_act_id] uniqueidentifier NOT NULL,
    [ros_noRelevantFindings] bit NOT NULL,
    [ros_comments] nvarchar(MAX),
    [ros_DateAdded] datetime NOT NULL,
    [ros_AddedBy] uniqueidentifier NOT NULL,
    [ros_TransactionId] uniqueidentifier NOT NULL,
    [ros_Action] char(1) NOT NULL
);

CREATE TABLE [ReviewType] (
    [smr_Id] int NOT NULL PRIMARY KEY,
    [smr_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [Riboflavin] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [TotalSoakTime] int,
    [TotalSoakTime] int,
    [Frequency] int,
    [Frequency] int,
    [FrequencyUnitId] int,
    [FrequencyUnitId] int,
    [IontophoresisUsed] bit NOT NULL,
    [IontophoresisUsed] bit,
    [IontophoresisCurrent] decimal(18, 2),
    [IontophoresisCurrent] decimal(18, 2),
    [IontophoresisDuration] int,
    [IontophoresisDuration] int
);

CREATE TABLE [RiboflavinFrequencyUnit] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [RiboflavinLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [TotalSoakTime] int,
    [TotalSoakTime] int,
    [Frequency] int,
    [Frequency] int,
    [FrequencyUnitId] int,
    [FrequencyUnitId] int,
    [IontophoresisUsed] bit,
    [IontophoresisUsed] bit NOT NULL,
    [IontophoresisCurrent] decimal(18, 2),
    [IontophoresisCurrent] decimal(18, 2),
    [IontophoresisDuration] int,
    [IontophoresisDuration] int
);

CREATE TABLE [RiboflavinPreparation] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL
);

CREATE TABLE [RiboflavinPreparationLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL,
    [StaticId] int
);

CREATE TABLE [RiboflavinPreparations] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [PreparationId] int NOT NULL PRIMARY KEY,
    [PreparationId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [RiboflavinPreparationsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [PreparationId] int NOT NULL,
    [PreparationId] int NOT NULL
);

CREATE TABLE [RiskFactorCoPathology] (
    [prc_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [RiskFactorCoPathologyRiskGroup] (
    [prg_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [RiskFactors] (
    [prf_Id] int NOT NULL PRIMARY KEY,
    [prf_Age] int,
    [prf_lks_GenderId] int,
    [prf_PostCode] nvarchar(40),
    [prf_AbleToLieFlat] bit,
    [prf_AlphaBlockers] bit
);

CREATE TABLE [RiskLevel] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(60) NOT NULL,
    [IsHighRisk] bit NOT NULL
);

CREATE TABLE [RiskLevelLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Description] nvarchar(60) NOT NULL,
    [IsHighRisk] bit NOT NULL
);

CREATE TABLE [RiskScoreActivity] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [PathwayVersionId] int NOT NULL,
    [PathwayRiskScoreId] int,
    [RedFlags] bit NOT NULL,
    [PlusFactors] bit NOT NULL,
    [Comments] nvarchar(4000)
);

CREATE TABLE [RiskScoreActivityLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PathwayVersionId] int NOT NULL,
    [PathwayRiskScoreId] int,
    [RedFlags] bit NOT NULL,
    [PlusFactors] bit NOT NULL,
    [Comments] nvarchar(4000)
);

CREATE TABLE [SavedExam] (
    [ose_ExamId] int NOT NULL,
    [ose_LogId] int NOT NULL,
    [ose_ExamTypeId] int NOT NULL,
    [ose_bod_BodyPartId] int NOT NULL,
    [ose_StudyDateTime] datetime2 NOT NULL,
    [ose_DeviceName] nvarchar(200),
    [ose_DeviceSerialNumber] nvarchar(200),
    [ose_StudyTitle] nvarchar(200),
    [ose_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SavedExamLog] (
    [ose_Id] int NOT NULL PRIMARY KEY,
    [ose_LogId] int NOT NULL,
    [ose_pei_PatientExternalIdentifierId] int NOT NULL,
    [ose_ect_EncounterId] uniqueidentifier NOT NULL,
    [ose_ExamTypeId] int NOT NULL,
    [ose_bod_BodyPartId] int NOT NULL,
    [ose_StudyDateTime] datetime2 NOT NULL,
    [ose_DeviceName] nvarchar(200),
    [ose_DeviceSerialNumber] nvarchar(200),
    [ose_StudyTitle] nvarchar(200),
    [ose_ObjectId] int NOT NULL,
    [ose_DateAdded] datetime NOT NULL,
    [ose_AddedBy] uniqueidentifier NOT NULL,
    [ose_Transactionid] uniqueidentifier NOT NULL,
    [ose_Action] char(1) NOT NULL,
    [ose_ExamId] int NOT NULL
);

CREATE TABLE [ScanNotification] (
    [hsn_Id] int NOT NULL PRIMARY KEY,
    [hsn_Device] nvarchar(80),
    [hsn_SeriesType] nvarchar(400) NOT NULL,
    [hsn_SeriesDescription] nvarchar(400),
    [hsn_DateTimeOfScan] datetime2 NOT NULL,
    [hsn_bod_BodyPartId] int NOT NULL,
    [hsn_SubjectId] nvarchar(50) NOT NULL,
    [hsn_AccessionNumber] nvarchar(44) NOT NULL,
    [hsn_StudyInstanceUid] nvarchar(400) NOT NULL,
    [hsn_ClusterId] uniqueidentifier,
    [hsn_ClusterDateTime] datetime2,
    [hsn_sns_ScanNotificationSourceId] int NOT NULL,
    [hsn_hst_ScanTypeId] int NOT NULL
);

CREATE TABLE [ScanNotificationSource] (
    [sns_Id] int NOT NULL PRIMARY KEY,
    [sns_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [ScanPattern] (
    [esp_id] int NOT NULL PRIMARY KEY,
    [esp_Description] nvarchar(500) NOT NULL
);

CREATE TABLE [ScanType] (
    [hst_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Schedule] (
    [csc_id] int NOT NULL PRIMARY KEY,
    [csc_newpatient] bit,
    [csc_manual] bit,
    [csc_appointmentid] varchar(255),
    [csc_dateAdded] datetime NOT NULL,
    [csc_rso_id] int,
    [csc_clp_id] int NOT NULL,
    [csc_use_AddedManuallyByUser] uniqueidentifier,
    [csc_lastupdated] datetime
);

CREATE TABLE [ScheduleLog] (
    [csc_Id] int NOT NULL PRIMARY KEY,
    [csc_clt_id] int,
    [csc_clinicdatetime] datetime,
    [csc_newpatient] bit,
    [csc_manual] bit,
    [csc_appointmentid] varchar(255),
    [csc_rso_id] int,
    [csc_clp_id] int NOT NULL,
    [csc_use_AddedManuallyByUser] uniqueidentifier,
    [csc_lastupdated] datetime,
    [csc_ObjectId] int NOT NULL,
    [csc_DateAdded] datetime NOT NULL,
    [csc_dateDeleted] datetime,
    [csc_AddedBy] uniqueidentifier NOT NULL,
    [csc_TransactionId] uniqueidentifier NOT NULL,
    [csc_Action] char(1) NOT NULL
);

CREATE TABLE [Schema] (
    [SchemaVersion] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Sclerostomy] (
    [sld_sft_id] int NOT NULL PRIMARY KEY,
    [sld_lks_Technique] int,
    [sld_Width] float(8),
    [sld_Height] float(8)
);

CREATE TABLE [SclerostomyLog] (
    [sld_sft_id] int NOT NULL PRIMARY KEY,
    [sld_ObjectId] int NOT NULL,
    [sld_DateAdded] datetime NOT NULL,
    [sld_AddedBy] uniqueidentifier NOT NULL,
    [sld_Transactionid] uniqueidentifier NOT NULL,
    [sld_Action] char(1) NOT NULL,
    [sld_lks_Technique] int,
    [sld_Width] float(8),
    [sld_Height] float(8)
);

CREATE TABLE [Screening] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [DateOfScreening] date(3) NOT NULL,
    [DateOfNotification] date(3),
    [DiabeticEyeScreeningPathwayId] int NOT NULL,
    [NoteForOphthalmologist] nvarchar(4000),
    [Comments] nvarchar(4000)
);

CREATE TABLE [ScreeningEye] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [BodyPartId] int NOT NULL PRIMARY KEY,
    [Retinopathy] int NOT NULL,
    [Maculopathy] int NOT NULL,
    [Photocoagulation] int,
    [Ungradable] bit NOT NULL,
    [ImageQuality] int
);

CREATE TABLE [ScreeningEyeLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [BodyPartId] int NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Retinopathy] int NOT NULL,
    [Maculopathy] int NOT NULL,
    [Photocoagulation] int,
    [Ungradable] bit NOT NULL,
    [ImageQuality] int
);

CREATE TABLE [ScreeningLog] (
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [DateOfScreening] date(3) NOT NULL,
    [DateOfNotification] date(3),
    [DiabeticEyeScreeningPathwayId] int NOT NULL,
    [NoteForOphthalmologist] nvarchar(4000),
    [Comments] nvarchar(4000),
    [ActivityId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Section] (
    [das_id] int NOT NULL PRIMARY KEY,
    [ets_Id] int NOT NULL PRIMARY KEY,
    [abs_id] int NOT NULL PRIMARY KEY,
    [abs_Name] nvarchar(200) NOT NULL,
    [ets_eta_ActivityId] uniqueidentifier NOT NULL,
    [das_DisplayName] nvarchar(200),
    [das_Description] nvarchar(1000),
    [ets_svr_SectionVersionId] int NOT NULL,
    [abs_Lateralised] bit NOT NULL,
    [abs_InvestigationsEnabled] bit NOT NULL,
    [ets_eip_InvestigationItemId] int,
    [ets_IsDeleted] bit NOT NULL
);

CREATE TABLE [SectionComment] (
    [etc_ets_SectionId] int NOT NULL PRIMARY KEY,
    [etc_bod_BodyPartId] int NOT NULL PRIMARY KEY,
    [etc_Comment] nvarchar(4000) NOT NULL
);

CREATE TABLE [SectionCommentLog] (
    [etc_ets_SectionId] int NOT NULL,
    [etc_ObjectId] int NOT NULL,
    [etc_DateAdded] datetime NOT NULL,
    [etc_AddedBy] uniqueidentifier NOT NULL,
    [etc_Transactionid] uniqueidentifier NOT NULL,
    [etc_Action] char(1) NOT NULL,
    [etc_bod_BodyPartId] int NOT NULL,
    [etc_Comment] nvarchar(4000) NOT NULL
);

CREATE TABLE [SectionItemVersion] (
    [sqv_svr_SectionVersionId] int NOT NULL PRIMARY KEY,
    [sqv_eiv_ItemVersionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SectionLog] (
    [ets_Id] int NOT NULL PRIMARY KEY,
    [abs_id] int NOT NULL PRIMARY KEY,
    [abs_ObjectId] int NOT NULL,
    [ets_ObjectId] int NOT NULL,
    [ets_DateAdded] datetime NOT NULL,
    [abs_DateAdded] datetime NOT NULL,
    [abs_AddedBy] uniqueidentifier NOT NULL,
    [ets_AddedBy] uniqueidentifier NOT NULL,
    [ets_Transactionid] uniqueidentifier NOT NULL,
    [abs_Transactionid] uniqueidentifier NOT NULL,
    [abs_Action] char(1) NOT NULL,
    [ets_Action] char(1) NOT NULL,
    [ets_eta_ActivityId] uniqueidentifier NOT NULL,
    [abs_Name] nvarchar(200) NOT NULL,
    [abs_Lateralised] bit NOT NULL,
    [ets_svr_SectionVersionId] int NOT NULL,
    [abs_UniqueKey] uniqueidentifier,
    [abs_InvestigationsEnabled] bit NOT NULL,
    [ets_eip_InvestigationItemId] int,
    [ets_IsDeleted] bit NOT NULL
);

CREATE TABLE [SectionVersion] (
    [svr_id] int NOT NULL PRIMARY KEY,
    [svr_Name] nvarchar(200) NOT NULL,
    [svr_PreviousSectionId] int,
    [svr_CommentsEnabled] bit NOT NULL,
    [svr_Repeatable] bit NOT NULL
);

CREATE TABLE [SectionVersionLog] (
    [svr_id] int NOT NULL PRIMARY KEY,
    [svr_ObjectId] int NOT NULL,
    [svr_DateAdded] datetime NOT NULL,
    [svr_AddedBy] uniqueidentifier NOT NULL,
    [svr_TransactionId] uniqueidentifier NOT NULL,
    [svr_Action] char(1) NOT NULL,
    [svr_abs_SectionId] int NOT NULL,
    [svr_Name] nvarchar(200),
    [svr_Version] int,
    [svr_PreviousSectionId] int,
    [svr_CommentsEnabled] bit NOT NULL,
    [svr_Repeatable] bit NOT NULL
);

CREATE TABLE [SelectedActivityOrder] (
    [sao_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SelectedLocationForDevice] (
    [sld_dev_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [sld_loc_id] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [SelectedLocationForDeviceLog] (
    [sld_dev_id] int NOT NULL PRIMARY KEY,
    [sld_ObjectId] uniqueidentifier NOT NULL,
    [sld_DateAdded] datetime NOT NULL,
    [sld_AddedBy] uniqueidentifier NOT NULL,
    [sld_Transactionid] uniqueidentifier NOT NULL,
    [sld_Action] char(1) NOT NULL,
    [sld_loc_id] uniqueidentifier NOT NULL
);

CREATE TABLE [SelectiveLaserTrabeculoplasty] (
    [sld_sdf_id] int NOT NULL PRIMARY KEY,
    [slt_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [slt_SpotSize] int,
    [sld_SpotSize] int,
    [sld_EnergyPerPulse] real(4),
    [slt_Variable] int NOT NULL,
    [slt_MinimumEnergyPerPulse] decimal(18, 2),
    [slt_MaximumEnergyPerPulse] decimal(18, 2),
    [slt_TotalEnergy] decimal(18, 2)
);

CREATE TABLE [SelectiveLaserTrabeculoplastyLog] (
    [slt_ActivityId] int NOT NULL PRIMARY KEY,
    [sld_sdf_id] int NOT NULL PRIMARY KEY,
    [sld_ObjectId] int NOT NULL,
    [slt_ObjectId] uniqueidentifier NOT NULL,
    [slt_DateAdded] datetime NOT NULL,
    [sld_DateAdded] datetime NOT NULL,
    [sld_AddedBy] uniqueidentifier NOT NULL,
    [slt_AddedBy] uniqueidentifier NOT NULL,
    [slt_Transactionid] uniqueidentifier NOT NULL,
    [sld_Transactionid] uniqueidentifier NOT NULL,
    [sld_Action] char(1) NOT NULL,
    [slt_Action] char(1) NOT NULL,
    [slt_SpotSize] int,
    [sld_SpotSize] int,
    [sld_EnergyPerPulse] real(4),
    [slt_Variable] int NOT NULL,
    [slt_MinimumEnergyPerPulse] decimal(18, 2),
    [slt_MaximumEnergyPerPulse] decimal(18, 2),
    [slt_TotalEnergy] decimal(18, 2)
);

CREATE TABLE [Sentence] (
    [cus_id] int NOT NULL PRIMARY KEY,
    [cus_description] nvarchar(MAX) NOT NULL,
    [cus_sentence] nvarchar(MAX) NOT NULL,
    [cus_use_id_editedBy] uniqueidentifier NOT NULL,
    [cus_editedDate] datetime2 NOT NULL,
    [cus_lastUsedDate] datetime2
);

CREATE TABLE [ServiceVersion] (
    [vsv_Id] int NOT NULL PRIMARY KEY,
    [vsv_Version] nvarchar(100) NOT NULL,
    [vsv_DateVersionReported] datetime2 NOT NULL
);

CREATE TABLE [sessiondefaults] (
    [sni_id] int NOT NULL PRIMARY KEY,
    [sni_use_id] uniqueidentifier,
    [sni_spe_id] int NOT NULL,
    [sni_use_id_consultant] uniqueidentifier
);

CREATE TABLE [Setting] (
    [set_id] int NOT NULL PRIMARY KEY,
    [set_value] nvarchar(4000),
    [set_description] nvarchar(2000),
    [set_context] int,
    [set_per_id] int,
    [set_sdt_id] int,
    [set_lookup] varchar(50),
    [set_defaultable] int,
    [set_public] bit,
    [set_valuenumeric] decimal(18, 2),
    [set_linkedsetting] int,
    [set_name] nvarchar(510),
    [set_snr_id] int,
    [set_valuetext] varchar(255),
    [set_blb_id] uniqueidentifier,
    [set_InitialisationVector] varbinary(32)
);

CREATE TABLE [SettingDataType] (
    [sdt_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SettingGroup] (
    [sgr_id] int NOT NULL PRIMARY KEY,
    [sgr_description] nvarchar(510) NOT NULL
);

CREATE TABLE [SettingInterval] (
    [bst_id] int NOT NULL PRIMARY KEY,
    [bst_type] tinyint(1) NOT NULL,
    [bst_intervalno] tinyint(1) NOT NULL,
    [bst_from] float(8),
    [bst_to] float(8),
    [bst_value] float(8)
);

CREATE TABLE [SettingIntervalLog] (
    [bst_ObjectId] int NOT NULL,
    [bst_id] int NOT NULL PRIMARY KEY,
    [bst_type] tinyint(1) NOT NULL,
    [bst_intervalno] tinyint(1) NOT NULL,
    [bst_from] float(8),
    [bst_to] float(8),
    [bst_value] float(8),
    [bst_DateAdded] datetime NOT NULL,
    [bst_AddedBy] uniqueidentifier NOT NULL,
    [bst_TransactionId] uniqueidentifier NOT NULL,
    [bst_Action] char(1) NOT NULL
);

CREATE TABLE [settinglog] (
    [set_ObjectId] int NOT NULL,
    [set_id] int NOT NULL PRIMARY KEY,
    [set_value] nvarchar(4000),
    [set_description] nvarchar(2000),
    [set_context] int,
    [set_per_id] int,
    [set_displaygroup] nvarchar(510),
    [set_lookup] varchar(50),
    [set_defaultable] int,
    [set_public] bit,
    [set_valuenumeric] decimal(18, 2),
    [set_linkedsetting] int,
    [set_name] nvarchar(510),
    [set_DateAdded] datetime NOT NULL,
    [set_AddedBy] uniqueidentifier NOT NULL,
    [set_TransactionId] uniqueidentifier NOT NULL,
    [set_Action] char(1) NOT NULL,
    [set_valuetext] varchar(255),
    [set_blb_id] uniqueidentifier,
    [set_sdt_id] int,
    [set_snr_id] int,
    [set_sgr_id] int,
    [set_InitialisationVector] varbinary(32)
);

CREATE TABLE [SettingNumericRange] (
    [snr_id] int NOT NULL PRIMARY KEY,
    [snr_min] float(8) NOT NULL,
    [snr_max] float(8) NOT NULL
);

CREATE TABLE [settings_backup] (
    [set_id] int NOT NULL,
    [set_value] varchar(255),
    [set_description] varchar(1000),
    [set_context] int,
    [set_per_id] int,
    [set_displaygroup] varchar(255),
    [set_datatype] int,
    [set_lookup] varchar(50),
    [set_defaultable] int,
    [set_public] bit,
    [set_valuenumeric] decimal(18, 2),
    [set_linkedsetting] int,
    [set_name] varchar(255)
);

CREATE TABLE [Severity] (
    [pfs_Id] int NOT NULL PRIMARY KEY,
    [pfs_Name] nvarchar(100) NOT NULL,
    [pfs_Order] int NOT NULL
);

CREATE TABLE [SeverityLevel] (
    [dcl_Id] int NOT NULL PRIMARY KEY,
    [dcl_Severity] nvarchar(512) NOT NULL
);

CREATE TABLE [ShadingGraph] (
    [Id] int NOT NULL PRIMARY KEY,
    [Errors] float(8),
    [ShadingGraphTypeId] int NOT NULL,
    [VisualFieldTestId] int NOT NULL
);

CREATE TABLE [ShadingGraphData] (
    [Id] int NOT NULL PRIMARY KEY,
    [QuadrantWidth] int NOT NULL,
    [QuadrantHeight] int NOT NULL,
    [QuadrantTypeId] int NOT NULL,
    [ShadingGraphId] int NOT NULL
);

CREATE TABLE [ShadingGraphDataPoint] (
    [Id] int NOT NULL PRIMARY KEY,
    [ShadingGraphDataId] int NOT NULL,
    [Value] int NOT NULL
);

CREATE TABLE [ShadingGraphType] (
    [Id] int NOT NULL PRIMARY KEY,
    [HfaReferenceDescription] nvarchar(510) NOT NULL
);

CREATE TABLE [ShortcutGroup] (
    [Id] int NOT NULL PRIMARY KEY,
    [Name] nvarchar(80) NOT NULL,
    [ShownOnWebUI] bit NOT NULL,
    [PreviousGroupId] int,
    [IsFavourite] bit NOT NULL
);

CREATE TABLE [ShortcutGroupClinicalConcept] (
    [ShortcutGroupId] int NOT NULL PRIMARY KEY,
    [ClinicalConceptId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ShortcutGroupClinicalConceptLog] (
    [ShortcutGroupId] int NOT NULL PRIMARY KEY,
    [ClinicalConceptId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [ShortcutGroupLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Name] nvarchar(80) NOT NULL,
    [ShownOnWebUI] bit NOT NULL,
    [PreviousGroupId] int,
    [IsFavourite] bit
);

CREATE TABLE [ShortcutUserFavourite] (
    [ShortcutGroupId] int NOT NULL PRIMARY KEY,
    [UserId] uniqueidentifier NOT NULL PRIMARY KEY,
    [IsFavourite] bit NOT NULL
);

CREATE TABLE [ShortcutUserFavouriteLog] (
    [ShortcutGroupId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    [IsFavourite] bit NOT NULL
);

CREATE TABLE [SiteConfiguration] (
    [daf_id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [SiteId] uniqueidentifier NOT NULL,
    [CarePathwayId] int NOT NULL
);

CREATE TABLE [SiteConfigurationItem] (
    [dae_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SiteConfigurationItemLog] (
    [dae_ObjectId] int NOT NULL,
    [dae_id] int NOT NULL PRIMARY KEY,
    [dae_daf_id] int NOT NULL,
    [dae_ety_id] int NOT NULL,
    [dae_das_id] int NOT NULL,
    [dae_DateAdded] datetime NOT NULL,
    [dae_AddedBy] uniqueidentifier NOT NULL,
    [dae_Transactionid] uniqueidentifier NOT NULL,
    [dae_Action] char(1) NOT NULL
);

CREATE TABLE [SiteConfigurationLog] (
    [daf_ObjectId] int NOT NULL,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [daf_id] int NOT NULL PRIMARY KEY,
    [daf_sit_id] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [daf_cpw_id] int NOT NULL,
    [daf_DateAdded] datetime NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [daf_AddedBy] uniqueidentifier NOT NULL,
    [daf_Transactionid] uniqueidentifier NOT NULL,
    [SiteId] uniqueidentifier NOT NULL,
    [CarePathwayId] int NOT NULL,
    [daf_Action] char(1) NOT NULL
);

CREATE TABLE [SiteDefault] (
    [ipd_id] int NOT NULL PRIMARY KEY,
    [ipd_ipp_id] int NOT NULL
);

CREATE TABLE [sitedefaultdrugoptionslink] (
    [sdg_id] int NOT NULL PRIMARY KEY,
    [sdg_source] int,
    [sdg_order] int,
    [sdg_required] int NOT NULL,
    [sdg_dsc_id] int,
    [sdg_drs_id] int,
    [sdg_StartDateDayAfterSurgery] bit NOT NULL
);

CREATE TABLE [sitedefaultdrugoptionslinklog] (
    [sdg_ObjectId] int NOT NULL,
    [sdg_id] int NOT NULL PRIMARY KEY,
    [sdg_sit_id] uniqueidentifier,
    [sdg_ddo_id] int,
    [sdg_source] int,
    [sdg_order] int,
    [sdg_DateAdded] datetime NOT NULL,
    [sdg_AddedBy] uniqueidentifier NOT NULL,
    [sdg_TransactionId] uniqueidentifier NOT NULL,
    [sdg_Action] char(1) NOT NULL,
    [sdg_required] int,
    [sdg_dsc_id] int,
    [sdg_drs_id] int,
    [sdg_StartDateDayAfterSurgery] bit NOT NULL
);

CREATE TABLE [SiteDefaultLog] (
    [ipd_ObjectId] int NOT NULL,
    [ipd_id] int NOT NULL PRIMARY KEY,
    [ipd_sit_id] uniqueidentifier NOT NULL,
    [ipd_pri_id] int NOT NULL,
    [ipd_pqi_drugqualifierid] int NOT NULL,
    [ipd_numberofvisits] int NOT NULL,
    [ipd_interval] int,
    [ipd_DateAdded] datetime NOT NULL,
    [ipd_AddedBy] uniqueidentifier NOT NULL,
    [ipd_TransactionId] uniqueidentifier NOT NULL,
    [ipd_Action] char(1) NOT NULL,
    [ipd_ipp_id] int NOT NULL
);

CREATE TABLE [SitePathway] (
    [ssp_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SiteStep] (
    [stp_id] int NOT NULL PRIMARY KEY,
    [stp_description] nvarchar(510),
    [stp_abbreviation] nvarchar(20) NOT NULL,
    [stp_ety_id] int,
    [stp_aet_EncounterTemplateId] int
);

CREATE TABLE [SiteStepLog] (
    [stp_Id] int NOT NULL PRIMARY KEY,
    [stp_description] nvarchar(510),
    [stp_abbreviation] nvarchar(20) NOT NULL,
    [stp_ety_id] int,
    [stp_aet_EncounterTemplateId] int,
    [stp_ObjectId] int NOT NULL,
    [stp_DateAdded] datetime NOT NULL,
    [stp_AddedBy] uniqueidentifier NOT NULL,
    [stp_TransactionId] uniqueidentifier NOT NULL,
    [stp_Action] char(1) NOT NULL
);

CREATE TABLE [sitetemplates] (
    [ste_id] int NOT NULL PRIMARY KEY,
    [ste_dte_id] int NOT NULL,
    [ste_sit_id] uniqueidentifier NOT NULL,
    [ste_ety_id] int NOT NULL,
    [ste_spe_id] int,
    [ste_printer] nvarchar(510),
    [ste_copies] int NOT NULL,
    [ste_batchcopies] int NOT NULL,
    [ste_ecopy] int NOT NULL,
    [ste_isfollowup] bit,
    [ste_esigningrequired] bit NOT NULL,
    [ste_othercopiesbatch] int,
    [ste_othercopieslocal] int,
    [ste_printersbatch] varchar(255),
    [ste_defaulttemplate] bit,
    [ste_cpw_id] int NOT NULL,
    [ste_aet_TemplateId] int,
    [ste_AutoGenerate] bit NOT NULL,
    [ste_Order] int NOT NULL
);

CREATE TABLE [sitetemplateslog] (
    [ste_ObjectId] int NOT NULL,
    [ste_id] int NOT NULL PRIMARY KEY,
    [ste_dte_id] int NOT NULL,
    [ste_sit_id] uniqueidentifier NOT NULL,
    [ste_ety_id] int NOT NULL,
    [ste_spe_id] int,
    [ste_printer] nvarchar(510),
    [ste_copies] int,
    [ste_batchcopies] int,
    [ste_ecopy] int,
    [ste_isfollowup] bit,
    [ste_esigningrequired] bit,
    [ste_othercopiesbatch] int,
    [ste_othercopieslocal] int,
    [ste_printersbatch] varchar(255),
    [ste_defaulttemplate] bit,
    [ste_DateAdded] datetime NOT NULL,
    [ste_AddedBy] uniqueidentifier NOT NULL,
    [ste_TransactionId] uniqueidentifier NOT NULL,
    [ste_Action] char(1) NOT NULL,
    [ste_cpw_id] int,
    [ste_aet_TemplateId] int,
    [ste_AutoGenerate] bit,
    [ste_Order] int
);

CREATE TABLE [Smoking] (
    [psk_pss_id] int NOT NULL PRIMARY KEY,
    [psk_lks_status] int NOT NULL,
    [psk_durationyears] int,
    [psk_stoppedyears] int,
    [psk_perday] int,
    [psk_comments] nvarchar(MAX)
);

CREATE TABLE [SocialServices] (
    [sss_pss_id] int NOT NULL PRIMARY KEY,
    [sss_lks_social_service] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SocialServicesStatus] (
    [ssv_pss_id] int NOT NULL PRIMARY KEY,
    [ssv_comments] nvarchar(MAX)
);

CREATE TABLE [specialty] (
    [spe_id] int NOT NULL PRIMARY KEY,
    [spe_name] nvarchar(256),
    [spe_order] int,
    [spe_licenseflag] int NOT NULL,
    [spe_available] bit NOT NULL,
    [spe_set_id_licensing] int
);

CREATE TABLE [SpecificGravityData] (
    [usg_id] int NOT NULL PRIMARY KEY,
    [usg_available] bit NOT NULL
);

CREATE TABLE [SpectralisInvestigationVersion] (
    [esv_iiv_InvestigationItemVersionId] int NOT NULL PRIMARY KEY,
    [esv_esp_ScanPatternId] int NOT NULL,
    [esv_etg_GranularityId] int NOT NULL
);

CREATE TABLE [SpectralisInvestigationVersionLog] (
    [esv_iiv_InvestigationItemVersionId] int NOT NULL PRIMARY KEY,
    [esv_esp_ScanPatternId] int NOT NULL,
    [esv_etg_GranularityId] int NOT NULL,
    [esv_ObjectId] int NOT NULL,
    [esv_DateAdded] datetime NOT NULL,
    [esv_AddedBy] uniqueidentifier NOT NULL,
    [esv_Transactionid] uniqueidentifier NOT NULL,
    [esv_Action] char(1) NOT NULL
);

CREATE TABLE [Stain] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL
);

CREATE TABLE [StainLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL,
    [StaticId] int
);

CREATE TABLE [State] (
    [sds_id] int NOT NULL PRIMARY KEY,
    [sds_description] nvarchar(200) NOT NULL
);

CREATE TABLE [Status] (
    [pcs_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [StepDefault] (
    [hcs_id] int NOT NULL PRIMARY KEY,
    [hcs_description] nvarchar(510) NOT NULL,
    [hcs_clt_id] int NOT NULL,
    [hcs_stp_id] int NOT NULL,
    [hcs_order] int NOT NULL,
    [hcs_status] int NOT NULL,
    [hcs_csw_ClinicalStudyWorkflowStatusId] int,
    [hcs_IsPreArrival] bit NOT NULL
);

CREATE TABLE [StepDefaultLog] (
    [hcs_Id] int NOT NULL PRIMARY KEY,
    [hcs_description] nvarchar(510) NOT NULL,
    [hcs_clt_id] int NOT NULL,
    [hcs_stp_id] int NOT NULL,
    [hcs_order] int NOT NULL,
    [hcs_status] int NOT NULL,
    [hcs_ObjectId] int NOT NULL,
    [hcs_DateAdded] datetime NOT NULL,
    [hcs_AddedBy] uniqueidentifier NOT NULL,
    [hcs_TransactionId] uniqueidentifier NOT NULL,
    [hcs_Action] char(1) NOT NULL,
    [hcs_csw_ClinicalStudyWorkflowStatusId] int,
    [hcs_IsPreArrival] bit
);

CREATE TABLE [StepStatus] (
    [sps_id] int NOT NULL PRIMARY KEY,
    [sps_description] nvarchar(40)
);

CREATE TABLE [StepType] (
    [sst_id] int NOT NULL PRIMARY KEY,
    [sst_description] nvarchar(40)
);

CREATE TABLE [Stereopsis] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL,
    [Comments] nvarchar(5000),
    [MethodLookupId] int,
    [Correction] int,
    [AngleCorrected] bit,
    [Result] int,
    [Inconclusive] bit,
    [Negative] bit
);

CREATE TABLE [StereopsisLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ActivityId] uniqueidentifier NOT NULL,
    [Comments] nvarchar(5000),
    [MethodLookupId] int,
    [Correction] int,
    [AngleCorrected] bit,
    [Result] int,
    [Inconclusive] bit,
    [Negative] bit
);

CREATE TABLE [StopBits] (
    [ssb_id] int NOT NULL PRIMARY KEY,
    [ssb_description] nvarchar(200) NOT NULL
);

CREATE TABLE [Strabismus] (
    [Id] int NOT NULL PRIMARY KEY,
    [PreparationId] int,
    [SutureId] int,
    [SurgicalCompletionId] int
);

CREATE TABLE [StrabismusLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PreparationId] int,
    [SutureId] int,
    [SurgicalCompletionId] int
);

CREATE TABLE [StratificationSystem] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(100) NOT NULL,
    [IsSystem] bit NOT NULL
);

CREATE TABLE [StratificationSystemLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Description] nvarchar(100) NOT NULL,
    [IsSystem] bit NOT NULL
);

CREATE TABLE [StratificationSystemVersion] (
    [Id] int NOT NULL PRIMARY KEY,
    [DateModified] datetime NOT NULL,
    [Active] bit NOT NULL
);

CREATE TABLE [StratificationSystemVersionLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [StratificationSystemId] int NOT NULL,
    [DateModified] datetime NOT NULL,
    [Active] bit NOT NULL
);

CREATE TABLE [StratificationSystemVersionRiskLevel] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Study] (
    [std_id] int NOT NULL PRIMARY KEY,
    [std_Name] varchar(500) NOT NULL,
    [std_Code] nvarchar(20),
    [std_IdName] nvarchar(510),
    [std_StartDate] datetime NOT NULL,
    [std_EndDate] datetime,
    [std_IdFormat] nvarchar(60),
    [std_flg_id] int NOT NULL,
    [std_use_PrincipalInvestigatorId] uniqueidentifier,
    [std_SubjectIdRequired] bit NOT NULL,
    [std_IsDateOfConsentRequired] bit NOT NULL,
    [std_GenderRequired] bit NOT NULL
);

CREATE TABLE [StudyAvailableGenders] (
    [sag_lks_id] int NOT NULL PRIMARY KEY,
    [sag_std_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [StudyLog] (
    [std_id] int NOT NULL PRIMARY KEY,
    [std_ObjectId] int NOT NULL,
    [std_DateAdded] datetime NOT NULL,
    [std_AddedBy] uniqueidentifier NOT NULL,
    [std_Transactionid] uniqueidentifier NOT NULL,
    [std_Action] char(1) NOT NULL,
    [std_Name] varchar(500) NOT NULL,
    [std_Code] nvarchar(20),
    [std_IdName] nvarchar(510),
    [std_StartDate] datetime NOT NULL,
    [std_EndDate] datetime,
    [std_IdFormat] nvarchar(60),
    [std_pnt_id] int NOT NULL,
    [std_flg_id] int NOT NULL,
    [std_use_PrincipalInvestigatorId] uniqueidentifier,
    [std_SubjectIdRequired] bit,
    [std_IsDateOfConsentRequired] bit NOT NULL,
    [std_GenderRequired] bit NOT NULL
);

CREATE TABLE [SubjectiveChange] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(20) NOT NULL
);

CREATE TABLE [SubscribedPublisherIdentifier] (
    [Identifier] uniqueidentifier NOT NULL PRIMARY KEY,
    [PackageTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SubSection] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ProcedureSubSectionId] int NOT NULL,
    [BodyPartId] int NOT NULL,
    [PerformedById] uniqueidentifier NOT NULL,
    [StrabismusDefaultId] int NOT NULL,
    [ProcedureSubSectionId] int NOT NULL,
    [MusclePreviouslyOperatedOn] bit NOT NULL,
    [Comments] nvarchar(1000),
    [ActivityId] uniqueidentifier NOT NULL
);

CREATE TABLE [SubSectionLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [BodyPartId] int NOT NULL,
    [StrabismusDefaultId] int NOT NULL,
    [ProcedureSubSectionId] int NOT NULL,
    [PerformedById] uniqueidentifier NOT NULL,
    [ProcedureSubSectionId] int NOT NULL,
    [MusclePreviouslyOperatedOn] bit NOT NULL,
    [Comments] nvarchar(1000),
    [ActivityId] uniqueidentifier NOT NULL
);

CREATE TABLE [SubSectionType] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SubstanceUse] (
    [ssu_pss_id] int NOT NULL PRIMARY KEY,
    [ssu_lks_status] int NOT NULL,
    [ssu_comments] nvarchar(MAX)
);

CREATE TABLE [Subtype] (
    [Id] int NOT NULL PRIMARY KEY,
    [Active] bit NOT NULL,
    [LongDescription] nvarchar(510) NOT NULL,
    [ShortDescription] nvarchar(60) NOT NULL,
    [Abbreviation] nvarchar(10) NOT NULL,
    [AssigningAuthority] nvarchar(20) NOT NULL,
    [IdentifierTypeCode] nvarchar(20) NOT NULL
);

CREATE TABLE [SubtypeCustomerSite] (
    [CustomerSiteId] uniqueidentifier NOT NULL PRIMARY KEY,
    [SubtypeId] int NOT NULL
);

CREATE TABLE [surgeondefault] (
    [sdf_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [surgeondefaultanaesthesia] (
    [san_id] int NOT NULL PRIMARY KEY,
    [san_use_id_anaesthetist] uniqueidentifier,
    [san_lks_id_blockmobility] int,
    [san_lks_id_blockocularpressure] int,
    [san_hyalase] bit,
    [san_generalanaesthesia] bit,
    [san_pro_code] varchar(4),
    [san_hassedations] bit NOT NULL
);

CREATE TABLE [surgeondefaultanaesthesiadrug] (
    [sad_id] int NOT NULL PRIMARY KEY,
    [sad_none] bit NOT NULL,
    [sad_mcn_id] int,
    [sad_dro_id] int,
    [sad_ant_id] int,
    [sad_order] int,
    [sad_sourceset] int,
    [sad_lks_id_type] int
);

CREATE TABLE [SurgeonDefaultAnaesthesiaDrugDuplicateMedicationRemovalBackup] (
    [sad_id] int NOT NULL PRIMARY KEY,
    [sad_san_id] int,
    [sad_adc_id] int NOT NULL,
    [sad_none] bit NOT NULL,
    [sad_mcn_id] int,
    [sad_dro_id] int,
    [sad_ant_id] int,
    [sad_order] int,
    [sad_sourceset] int,
    [sad_lks_id_type] int,
    [sad_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [surgeondefaultanaesthesiadruglog] (
    [sad_ObjectId] int NOT NULL,
    [sad_id] int NOT NULL PRIMARY KEY,
    [sad_san_id] int,
    [sad_adc_id] int NOT NULL,
    [sad_none] bit NOT NULL,
    [sad_mcn_id] int,
    [sad_dro_id] int,
    [sad_ant_id] int,
    [sad_order] int,
    [sad_sourceset] int,
    [sad_lks_id_type] int,
    [sad_DateAdded] datetime NOT NULL,
    [sad_AddedBy] uniqueidentifier NOT NULL,
    [sad_TransactionId] uniqueidentifier NOT NULL,
    [sad_Action] char(1) NOT NULL
);

CREATE TABLE [surgeondefaultanaesthesialog] (
    [san_ObjectId] int NOT NULL,
    [san_id] int NOT NULL PRIMARY KEY,
    [san_sdf_id] int,
    [san_use_id_anaesthetist] uniqueidentifier,
    [san_lks_id_blockmobility] int,
    [san_lks_id_blockocularpressure] int,
    [san_hyalase] bit,
    [san_generalanaesthesia] bit,
    [san_pro_code] varchar(4),
    [san_DateAdded] datetime NOT NULL,
    [san_AddedBy] uniqueidentifier NOT NULL,
    [san_TransactionId] uniqueidentifier NOT NULL,
    [san_Action] char(1) NOT NULL,
    [san_hassedations] bit
);

CREATE TABLE [surgeondefaultcataract] (
    [sud_id] int NOT NULL PRIMARY KEY,
    [sud_lks_id_iolposition] int,
    [sud_iollensinserted] bit,
    [sud_lks_id_corticalclearance] int,
    [sud_lks_id_nucleusdelivery] int,
    [sud_lks_id_capsulotomy] int,
    [sud_lks_id_woundclosure] int,
    [sud_lks_id_incisionsite] int,
    [sud_incisionlength] float(8),
    [sud_incisionmeridian] int,
    [sud_phacominutes] tinyint(1),
    [sud_phacoseconds] tinyint(1),
    [sud_phacopower] tinyint(1),
    [sud_lks_id_phacomachine] int,
    [sud_miochol] bit,
    [sud_predpostref] float(8),
    [sud_predpostrefcylinder] float(8),
    [sud_predpostrefaxis] float(8),
    [sud_nosutures] tinyint(1),
    [sud_lks_id_pupilsize] int,
    [sud_phacoeffectivetime] bit NOT NULL,
    [sud_viscoelasticremoved] bit,
    [sud_icdilation] bit,
    [sud_visionblue] bit,
    [sud_hydrodelamination] bit,
    [sud_hydrodissection] bit,
    [sud_lks_id_biometrynotusedreason] int,
    [sud_sideportsright] int,
    [sud_fillmeridian] int,
    [sud_fillmeridiandeltak] float(8),
    [sud_incisionmeridianright] float(8),
    [sud_incisionmeridianleft] float(8),
    [sud_lks_id_incisionplane] int,
    [sud_sideportsleft] int,
    [sud_lks_id_surgeonpositionleft] int,
    [sud_lks_id_surgeonpositionright] int
);

CREATE TABLE [SurgeonDefaultCataractDrugDuplicateMedicationRemovalBackup] (
    [sdd_id] int NOT NULL PRIMARY KEY,
    [sdd_sud_id] int NOT NULL,
    [sdd_drs_id] int,
    [sdd_adc_id] int NOT NULL,
    [sdd_mcn_id] int,
    [sdd_none] bit,
    [sdd_dro_id] int,
    [sdd_sourceset] int,
    [sdd_lks_id_type] int,
    [sdd_order] int,
    [sdd_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [surgeondefaultcataractlist] (
    [scl_id] int NOT NULL PRIMARY KEY,
    [scl_lqu_id] int NOT NULL,
    [scl_responsevalue] int NOT NULL
);

CREATE TABLE [surgeondefaultcataractlist_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [scl_id] int NOT NULL,
    [scl_sud_id] int NOT NULL,
    [scl_lqu_id] int NOT NULL,
    [scl_responsevalue] int NOT NULL
);

CREATE TABLE [surgeondefaultcataractlog] (
    [sud_ObjectId] int NOT NULL,
    [sud_id] int NOT NULL PRIMARY KEY,
    [sud_sdf_id] int,
    [sud_lks_id_iolposition] int,
    [sud_iollensinserted] bit,
    [sud_lks_id_corticalclearance] int,
    [sud_lks_id_nucleusdelivery] int,
    [sud_lks_id_capsulotomy] int,
    [sud_lks_id_woundclosure] int,
    [sud_lks_id_incisionsite] int,
    [sud_incisionlength] float(8),
    [sud_incisionmeridian] int,
    [sud_phacominutes] tinyint(1),
    [sud_phacoseconds] tinyint(1),
    [sud_phacopower] tinyint(1),
    [sud_lks_id_phacomachine] int,
    [sud_miochol] bit,
    [sud_predpostref] float(8),
    [sud_predpostrefcylinder] float(8),
    [sud_predpostrefaxis] float(8),
    [sud_nosutures] tinyint(1),
    [sud_lks_id_pupilsize] int,
    [sud_phacoeffectivetime] bit NOT NULL,
    [sud_viscoelasticremoved] bit,
    [sud_icdilation] bit,
    [sud_visionblue] bit,
    [sud_hydrodelamination] bit,
    [sud_hydrodissection] bit,
    [sud_lks_id_biometrynotusedreason] int,
    [sud_sideportsright] int,
    [sud_fillmeridian] int,
    [sud_fillmeridiandeltak] float(8),
    [sud_incisionmeridianright] float(8),
    [sud_incisionmeridianleft] float(8),
    [sud_lks_id_incisionplane] int,
    [sud_sideportsleft] int,
    [sud_lks_id_surgeonpositionleft] int,
    [sud_lks_id_surgeonpositionright] int,
    [sud_DateAdded] datetime NOT NULL,
    [sud_AddedBy] uniqueidentifier NOT NULL,
    [sud_TransactionId] uniqueidentifier NOT NULL,
    [sud_Action] char(1) NOT NULL
);

CREATE TABLE [surgeondefaultdrug] (
    [sdd_id] int NOT NULL PRIMARY KEY,
    [sdd_drs_id] int,
    [sdd_adc_id] int NOT NULL,
    [sdd_mcn_id] int,
    [sdd_none] bit,
    [sdd_dro_id] int,
    [sdd_sourceset] int,
    [sdd_lks_id_type] int,
    [sdd_order] int
);

CREATE TABLE [SurgeonDefaultDrugDuplicateMedicationRemovalBackup] (
    [sdd_id] int NOT NULL PRIMARY KEY,
    [sdd_sdf_id] int NOT NULL,
    [sdd_drs_id] int,
    [sdd_adc_id] int NOT NULL,
    [sdd_mcn_id] int,
    [sdd_none] bit,
    [sdd_dro_id] int,
    [sdd_sourceset] int,
    [sdd_lks_id_type] int,
    [sdd_order] int,
    [sdd_PatchVersion] varchar(256) NOT NULL PRIMARY KEY
);

CREATE TABLE [surgeondefaultdruglog] (
    [sdd_ObjectId] int NOT NULL,
    [sdd_id] int NOT NULL PRIMARY KEY,
    [sdd_sdf_id] int NOT NULL,
    [sdd_drs_id] int,
    [sdd_adc_id] int NOT NULL,
    [sdd_mcn_id] int,
    [sdd_none] bit,
    [sdd_dro_id] int,
    [sdd_sourceset] int,
    [sdd_lks_id_type] int,
    [sdd_order] int,
    [sdd_DateAdded] datetime NOT NULL,
    [sdd_AddedBy] uniqueidentifier NOT NULL,
    [sdd_TransactionId] uniqueidentifier NOT NULL,
    [sdd_Action] char(1) NOT NULL
);

CREATE TABLE [surgeondefaultfollowupvisit] (
    [spv_id] int NOT NULL PRIMARY KEY,
    [spv_sdf_id] int NOT NULL,
    [spv_order] int NOT NULL,
    [spv_loc_id] uniqueidentifier,
    [spv_lks_id_followupby] int,
    [spv_use_id_followupby] uniqueidentifier,
    [spv_lks_id_intervaltype] int,
    [spv_lks_id_visittype] int,
    [spv_interval] int
);

CREATE TABLE [surgeondefaultfollowupvisitlog] (
    [spv_ObjectId] int NOT NULL,
    [spv_id] int NOT NULL PRIMARY KEY,
    [spv_sdf_id] int NOT NULL,
    [spv_order] int NOT NULL,
    [spv_loc_id] uniqueidentifier,
    [spv_lks_id_followupby] int,
    [spv_use_id_followupby] uniqueidentifier,
    [spv_lks_id_intervaltype] int,
    [spv_lks_id_visittype] int,
    [spv_interval] int,
    [spv_DateAdded] datetime NOT NULL,
    [spv_AddedBy] uniqueidentifier NOT NULL,
    [spv_TransactionId] uniqueidentifier NOT NULL,
    [spv_Action] char(1) NOT NULL
);

CREATE TABLE [surgeondefaultinjection] (
    [sjp_id] int NOT NULL PRIMARY KEY,
    [sjp_lks_id_injectionlocationleft] int,
    [sjp_lks_id_injectionlocationright] int,
    [sjp_lks_id_preparationmethod] int,
    [sjp_conjunctivadisplaced] bit NOT NULL,
    [sjp_entryfromlimbusphakic] decimal(18, 2),
    [sjp_entryfromlimbuspseudophakic] decimal(18, 2),
    [sjp_lks_id_needleangle] int,
    [sjp_actap] bit,
    [sjp_craperfused] bit,
    [sjp_abletocf] bit,
    [sjp_entryfromlimbusunknownlensstatus] decimal(18, 2)
);

CREATE TABLE [surgeondefaultinjectionlog] (
    [sjp_ObjectId] int NOT NULL,
    [sjp_id] int NOT NULL PRIMARY KEY,
    [sjp_sdf_id] int NOT NULL,
    [sjp_lks_id_injectionlocationleft] int,
    [sjp_lks_id_injectionlocationright] int,
    [sjp_lks_id_preparationmethod] int,
    [sjp_conjunctivadisplaced] bit NOT NULL,
    [sjp_entryfromlimbusphakic] decimal(18, 2),
    [sjp_entryfromlimbuspseudophakic] decimal(18, 2),
    [sjp_lks_id_needleangle] int,
    [sjp_actap] bit,
    [sjp_craperfused] bit,
    [sjp_abletocf] bit,
    [sjp_DateAdded] datetime NOT NULL,
    [sjp_AddedBy] uniqueidentifier NOT NULL,
    [sjp_TransactionId] uniqueidentifier NOT NULL,
    [sjp_Action] char(1) NOT NULL,
    [sjp_entryfromlimbusunknownlensstatus] decimal(18, 2)
);

CREATE TABLE [surgeondefaultlasersurgery] (
    [sdl_id] int NOT NULL PRIMARY KEY,
    [sdl_sdf_id] int NOT NULL,
    [sdl_lat_id] int NOT NULL,
    [sdl_lks_id_instrument] int,
    [sdl_lks_id_color] int,
    [sdl_lks_id_lens] int,
    [sdl_wavelength] int,
    [sdl_power] int,
    [sdl_duration] int,
    [sdl_beamdiameter] int
);

CREATE TABLE [surgeondefaultlasersurgerylog] (
    [sdl_ObjectId] int NOT NULL,
    [sdl_sdf_id] int NOT NULL,
    [sdl_lat_id] int NOT NULL,
    [sdl_lks_id_instrument] int,
    [sdl_lks_id_color] int,
    [sdl_lks_id_lens] int,
    [sdl_wavelength] int,
    [sdl_power] int,
    [sdl_duration] int,
    [sdl_beamdiameter] int,
    [sdl_DateAdded] datetime NOT NULL,
    [sdl_AddedBy] uniqueidentifier NOT NULL,
    [sdl_TransactionId] uniqueidentifier NOT NULL,
    [sdl_Action] char(1) NOT NULL,
    [sdl_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [surgeondefaultlist] (
    [scl_id] int NOT NULL PRIMARY KEY,
    [scl_lqu_id] int NOT NULL,
    [scl_responsevalue] int NOT NULL,
    [scl_bod_id] int
);

CREATE TABLE [surgeondefaultlistlog] (
    [scl_ObjectId] int NOT NULL,
    [scl_id] int NOT NULL PRIMARY KEY,
    [scl_sdf_id] int NOT NULL,
    [scl_lqu_id] int NOT NULL,
    [scl_responsevalue] int NOT NULL,
    [scl_bod_id] int,
    [scl_DateAdded] datetime NOT NULL,
    [scl_AddedBy] uniqueidentifier NOT NULL,
    [scl_TransactionId] uniqueidentifier NOT NULL,
    [scl_Action] char(1) NOT NULL
);

CREATE TABLE [surgeondefaultlog] (
    [sdf_ObjectId] int NOT NULL,
    [sdf_id] int NOT NULL PRIMARY KEY,
    [sdf_type] int NOT NULL,
    [sdf_use_id] uniqueidentifier NOT NULL,
    [sdf_DateAdded] datetime NOT NULL,
    [sdf_AddedBy] uniqueidentifier NOT NULL,
    [sdf_TransactionId] uniqueidentifier NOT NULL,
    [sdf_Action] char(1) NOT NULL
);

CREATE TABLE [surgeondefaultproceduretype] (
    [sdt_id] int NOT NULL PRIMARY KEY,
    [sdt_description] nvarchar(400),
    [sdt_displayname] nvarchar(400),
    [sdt_isdefault] bit NOT NULL,
    [sdt_cfd_id] int,
    [sdt_sdg_id] int NOT NULL
);

CREATE TABLE [surgeondefaultproceduretypegroup] (
    [sdg_id] int NOT NULL PRIMARY KEY,
    [sdg_description] varchar(200) NOT NULL
);

CREATE TABLE [surgeondefaultrank] (
    [sdr_id] int NOT NULL PRIMARY KEY,
    [sdr_procedurecode] varchar(255) NOT NULL,
    [sdr_cfd_id] int,
    [sdr_proceduretype] int NOT NULL,
    [sdr_rankanaesthesia] int NOT NULL,
    [sdr_rankfollowup] int NOT NULL
);

CREATE TABLE [surgeondefaultvitreoretinal] (
    [sdv_id] int NOT NULL PRIMARY KEY,
    [sdv_cfd_id] int NOT NULL,
    [sdv_lks_id_conjincision] int,
    [sdv_chandelierat_left] int,
    [sdv_chandelierat_right] int,
    [sdv_lks_id_posthyaloidstatus] int,
    [sdv_sclerostomywidened] bit,
    [sdv_maxcutrate] int,
    [sdv_lks_id_heavyliquid] int,
    [sdv_retinectomyat] int,
    [sdv_lks_id_drainageofsrfmethod] int,
    [sdv_drainageofsrfat] int,
    [sdv_drainageofsrfcompletion] int,
    [sdv_residualfluidat] int,
    [sdv_irishooksat] int,
    [sdv_peripheraliridectomyat] int,
    [sdv_ividrugqualifierid] int,
    [sdv_lks_tamponadingagent] int,
    [sdv_tamponadeconcentration] int,
    [sdv_tamponadevolume] float(8),
    [sdv_tamponadefill] int,
    [sdv_acparacentesisat] int,
    [sdv_lks_id_cra] int,
    [sdv_numberofsclerostomysutures] int,
    [sdv_lks_id_sclerostomysuturematerial] int,
    [sdv_numberofconjunctivalsutures] int,
    [sdv_lks_id_conjunctivalsuturematerial] int,
    [sdv_patientpostures] bit,
    [sdv_posturesonwardcomment] nvarchar(510),
    [sdv_posturesathomecomment] nvarchar(510)
);

CREATE TABLE [surgeondefaultvitreoretinallog] (
    [sdv_ObjectId] int NOT NULL,
    [sdv_id] int NOT NULL PRIMARY KEY,
    [sdv_sdf_id] int NOT NULL,
    [sdv_cfd_id] int NOT NULL,
    [sdv_lks_id_conjincision] int,
    [sdv_chandelierat_left] int,
    [sdv_chandelierat_right] int,
    [sdv_lks_id_posthyaloidstatus] int,
    [sdv_sclerostomywidened] bit,
    [sdv_maxcutrate] int,
    [sdv_lks_id_heavyliquid] int,
    [sdv_retinectomyat] int,
    [sdv_lks_id_drainageofsrfmethod] int,
    [sdv_drainageofsrfat] int,
    [sdv_drainageofsrfcompletion] int,
    [sdv_residualfluidat] int,
    [sdv_irishooksat] int,
    [sdv_peripheraliridectomyat] int,
    [sdv_ividrugqualifierid] int,
    [sdv_lks_tamponadingagent] int,
    [sdv_tamponadeconcentration] int,
    [sdv_tamponadevolume] float(8),
    [sdv_tamponadefill] int,
    [sdv_acparacentesisat] int,
    [sdv_lks_id_cra] int,
    [sdv_numberofsclerostomysutures] int,
    [sdv_lks_id_sclerostomysuturematerial] int,
    [sdv_numberofconjunctivalsutures] int,
    [sdv_lks_id_conjunctivalsuturematerial] int,
    [sdv_patientpostures] bit,
    [sdv_posturesonwardcomment] nvarchar(510),
    [sdv_posturesathomecomment] nvarchar(510),
    [sdv_DateAdded] datetime NOT NULL,
    [sdv_AddedBy] uniqueidentifier NOT NULL,
    [sdv_TransactionId] uniqueidentifier NOT NULL,
    [sdv_Action] char(1) NOT NULL
);

CREATE TABLE [surgeondefaultvitreoretinalposture] (
    [sdp_id] int NOT NULL PRIMARY KEY,
    [sdp_displayorder] int,
    [sdp_posturesetting] int,
    [sdp_lks_id_posture] int,
    [sdp_duration] int,
    [sdp_lks_id_timeofday] int,
    [sdp_timeofdaydays] int,
    [sdp_isdeleted] bit,
    [sdp_durationunit] int,
    [sdp_comment] nvarchar(510),
    [sdp_sdf_id] int NOT NULL
);

CREATE TABLE [surgeondefaultvitreoretinalposturelog] (
    [sdp_ObjectId] int NOT NULL,
    [sdp_id] int NOT NULL PRIMARY KEY,
    [sdp_displayorder] int,
    [sdp_posturesetting] int,
    [sdp_lks_id_posture] int,
    [sdp_duration] int,
    [sdp_lks_id_timeofday] int,
    [sdp_timeofdaydays] int,
    [sdp_isdeleted] bit,
    [sdp_durationunit] int,
    [sdp_comment] nvarchar(510),
    [sdp_sdf_id] int NOT NULL,
    [sdp_DateAdded] datetime NOT NULL,
    [sdp_AddedBy] uniqueidentifier NOT NULL,
    [sdp_TransactionId] uniqueidentifier NOT NULL,
    [sdp_Action] char(1) NOT NULL
);

CREATE TABLE [surgeondefaultvitreoretinalsclerostomy] (
    [ssc_id] int NOT NULL PRIMARY KEY,
    [ssc_displayorder] int,
    [ssc_lks_id_gauge] int,
    [ssc_mmfromlimbus_phakic] decimal(18, 2),
    [ssc_mmfromlimbus_aphakic] decimal(18, 2),
    [ssc_sclerostomiesat_left] int,
    [ssc_sclerostomiesat_right] int,
    [ssc_isdeleted] bit,
    [ssc_lks_id_type] int,
    [ssc_sdf_id] int NOT NULL
);

CREATE TABLE [surgeondefaultvitreoretinalsclerostomylog] (
    [ssc_ObjectId] int NOT NULL,
    [ssc_id] int NOT NULL PRIMARY KEY,
    [ssc_displayorder] int,
    [ssc_lks_id_gauge] int,
    [ssc_mmfromlimbus_phakic] decimal(18, 2),
    [ssc_mmfromlimbus_aphakic] decimal(18, 2),
    [ssc_sclerostomiesat_left] int,
    [ssc_sclerostomiesat_right] int,
    [ssc_isdeleted] bit,
    [ssc_lks_id_type] int,
    [ssc_sdf_id] int NOT NULL,
    [ssc_DateAdded] datetime NOT NULL,
    [ssc_AddedBy] uniqueidentifier NOT NULL,
    [ssc_TransactionId] uniqueidentifier NOT NULL,
    [ssc_Action] char(1) NOT NULL
);

CREATE TABLE [SurgeonGrade] (
    [psg_Id] int NOT NULL PRIMARY KEY,
    [psg_Description] nvarchar(200)
);

CREATE TABLE [SurgicalCompletion] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ConjunctiveClosureId] int,
    [ConjunctiveClosureId] int,
    [DeviationAfterSurgeryId] int
);

CREATE TABLE [SurgicalCompletionDrugs] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [TypeId] int,
    [TypeId] int NOT NULL PRIMARY KEY,
    [RouteId] int NOT NULL PRIMARY KEY,
    [RouteId] int,
    [NameId] int,
    [NameId] int NOT NULL PRIMARY KEY,
    [SurgicalCompletionId] int NOT NULL
);

CREATE TABLE [SurgicalCompletionDrugsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [TypeId] int,
    [TypeId] int NOT NULL,
    [RouteId] int NOT NULL,
    [RouteId] int,
    [NameId] int,
    [NameId] int NOT NULL,
    [SurgicalCompletionId] int NOT NULL
);

CREATE TABLE [SurgicalCompletionLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [ConjunctiveClosureId] int,
    [ConjunctiveClosureId] int,
    [DeviationAfterSurgeryId] int
);

CREATE TABLE [SurgicalCompletionSuture] (
    [scd_sft_id] int NOT NULL PRIMARY KEY,
    [scs_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [scs_sct_id] int NOT NULL PRIMARY KEY,
    [scd_sct_id] int NOT NULL PRIMARY KEY,
    [scd_Number] int NOT NULL,
    [scs_lks_SutureMaterial] int,
    [scs_Number] int NOT NULL,
    [scd_lks_Material] int
);

CREATE TABLE [SurgicalCompletionSutureLog] (
    [scd_sft_id] int NOT NULL PRIMARY KEY,
    [scs_ActivityId] uniqueidentifier NOT NULL,
    [scs_ObjectId] uniqueidentifier NOT NULL,
    [scd_ObjectId] int NOT NULL,
    [scd_DateAdded] datetime NOT NULL,
    [scs_DateAdded] datetime NOT NULL,
    [scs_AddedBy] uniqueidentifier NOT NULL,
    [scd_AddedBy] uniqueidentifier NOT NULL,
    [scd_Transactionid] uniqueidentifier NOT NULL,
    [scs_Transactionid] uniqueidentifier NOT NULL,
    [scs_Action] char(1) NOT NULL,
    [scd_Action] char(1) NOT NULL,
    [scd_sct_id] int NOT NULL,
    [scs_sct_id] int NOT NULL,
    [scs_lks_SutureMaterial] int,
    [scd_Number] int NOT NULL,
    [scd_lks_Material] int,
    [scs_Number] int NOT NULL,
    [scs_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SurgicalCompletionSutureType] (
    [sct_id] int NOT NULL PRIMARY KEY,
    [sct_SingularDescription] nvarchar(200) NOT NULL,
    [sct_PluralDescription] nvarchar(200) NOT NULL
);

CREATE TABLE [SurgicalPlanningCataractPlanRemovalBackup] (
    [spc_id] int NOT NULL PRIMARY KEY,
    [spc_spp_id] int NOT NULL,
    [spc_bod_id] int NOT NULL,
    [spc_firsteye] bit NOT NULL,
    [spc_planforsecondeye_lks_id] int,
    [spc_iol_id] uniqueidentifier,
    [spc_targetrefraction] float(8),
    [spc_comments] nvarchar(1000),
    [spc_isdeleted] bit NOT NULL,
    [spc_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [SurgicalPlanningPlanRemovalBackup] (
    [spp_id] int NOT NULL PRIMARY KEY,
    [spp_act_id] uniqueidentifier NOT NULL,
    [spp_pln_id] int,
    [spp_risksbenefitsdiscussed] bit NOT NULL,
    [spp_consentformgiven] bit NOT NULL,
    [spp_patientconsented] bit NOT NULL,
    [spp_comments] nvarchar(1000),
    [spp_PatchVersion] varchar(256) NOT NULL
);

CREATE TABLE [SutureAdjustmentSurgicalCompletion] (
    [Id] int NOT NULL PRIMARY KEY,
    [ConjunctiveClosureId] int
);

CREATE TABLE [SutureAdjustmentSurgicalCompletionLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [ConjunctiveClosureId] int
);

CREATE TABLE [Sutures] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL
);

CREATE TABLE [SuturesLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL,
    [StaticId] int
);

CREATE TABLE [sysdiagrams] (
    [diagram_id] int NOT NULL PRIMARY KEY,
    [version] int,
    [definition] varbinary(-1)
);

CREATE TABLE [SystemActivity] (
    [aac_Id] int NOT NULL PRIMARY KEY,
    [aac_DisplayName] nvarchar(400) NOT NULL,
    [aac_Description] nvarchar(1000) NOT NULL
);

CREATE TABLE [SystemActivityEncounterType] (
    [sae_SystemActivityId] int NOT NULL PRIMARY KEY,
    [sae_EncounterTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [SystemActivitySection] (
    [aas_Id] int NOT NULL PRIMARY KEY,
    [aas_systemActivityId] int NOT NULL,
    [aas_DisplayName] nvarchar(1000),
    [aas_QuestionSetId] int NOT NULL,
    [aas_Lateralised] bit NOT NULL,
    [aas_CanAddQuestions] bit NOT NULL
);

CREATE TABLE [systemdatamaparea] (
    [dme_id] int NOT NULL PRIMARY KEY,
    [dme_name] nvarchar(510) NOT NULL
);

CREATE TABLE [systemdatamapdefinition] (
    [smd_id] int NOT NULL PRIMARY KEY,
    [smd_cpt_id] int,
    [smd_lks_id] int,
    [smd_numeric] float(8),
    [smd_boolean] bit,
    [smd_smi_id] int NOT NULL,
    [smd_bidirectional] bit NOT NULL,
    [smd_cfd_id] int
);

CREATE TABLE [systemdatamapitem] (
    [smi_id] int NOT NULL PRIMARY KEY,
    [smi_name] nvarchar(510) NOT NULL,
    [smi_aty_id] int NOT NULL,
    [smi_targetname] nvarchar(510) NOT NULL
);

CREATE TABLE [systemdatamaps] (
    [dmp_id] int NOT NULL PRIMARY KEY,
    [dmp_mpe_sourcetype] int NOT NULL,
    [dmp_sourceid] int NOT NULL,
    [dmp_mpe_targettype] int NOT NULL,
    [dmp_targetid] int NOT NULL,
    [dmp_bidirectional] bit,
    [dmp_smi_id] int,
    [dmp_target_detailid] int
);

CREATE TABLE [systemdocument] (
    [doc_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [doc_dateadded] datetime NOT NULL,
    [doc_requiresapproval] bit NOT NULL,
    [doc_description] nvarchar(510),
    [doc_dte_id] int,
    [doc_printedlocally] bit NOT NULL,
    [doc_skipdocumentgeneration] bit NOT NULL,
    [doc_cpw_id_templatePathway] int,
    [doc_externalidentifier] nvarchar(510),
    [doc_IsScanned] bit,
    [doc_DocumentReconstructed] bit
);

CREATE TABLE [systemdocumentlog] (
    [doc_ObjectId] uniqueidentifier NOT NULL,
    [doc_id] int NOT NULL PRIMARY KEY,
    [doc_status] int NOT NULL,
    [doc_currentversion] int NOT NULL,
    [doc_dcs_id] int NOT NULL,
    [doc_requiresapproval] bit NOT NULL,
    [doc_dtp_id] int,
    [doc_description] nvarchar(510),
    [doc_dte_id] int,
    [doc_responsibleclinician_id] uniqueidentifier,
    [doc_printedlocally] bit NOT NULL,
    [doc_printedinbatch] bit NOT NULL,
    [doc_available] bit NOT NULL,
    [doc_skipdocumentgeneration] bit NOT NULL,
    [doc_DateAdded] datetime NOT NULL,
    [doc_AddedBy] uniqueidentifier NOT NULL,
    [doc_TransactionId] uniqueidentifier NOT NULL,
    [doc_Action] char(1) NOT NULL,
    [doc_datemodified] datetime,
    [doc_actioned] bit,
    [doc_cpw_id_templatePathway] int,
    [doc_deleted] bit,
    [doc_externalidentifier] nvarchar(510),
    [doc_IsScanned] bit,
    [doc_DocumentReconstructed] bit
);

CREATE TABLE [SystemEncounterLicenseSetting] (
    [ael_EncounterTypeId] int NOT NULL PRIMARY KEY,
    [ael_LicenseSettingId] int NOT NULL
);

CREATE TABLE [systemid] (
    [MasterID] uniqueidentifier NOT NULL PRIMARY KEY,
    [SourceTableName] varchar(255)
);

CREATE TABLE [systemid_Backup] (
    [InsertDateTime] datetime,
    [ProcessIdentifier] uniqueidentifier,
    [MasterID] uniqueidentifier NOT NULL,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [SourceTypeId] uniqueidentifier,
    [SourceTableName] varchar(255)
);

CREATE TABLE [TargetCondition] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [TargetConditionCorrection] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [tempdataneil] (
    [itq_id] int NOT NULL,
    [itq_interfacetype] int NOT NULL,
    [itq_datecreated] datetime,
    [itq_status] int,
    [itq_lastupdated] datetime,
    [itq_use_id] uniqueidentifier,
    [itq_loc_id] uniqueidentifier,
    [itq_ect_id] uniqueidentifier,
    [itq_ipm_id] int,
    [itq_encountervalidationresult] varchar(2000),
    [itq_devicename] varchar(255),
    [itd_id] int NOT NULL,
    [itd_itq_id] int NOT NULL,
    [itd_mim_id] int NOT NULL,
    [itd_data] varbinary(-1),
    [ect_id] uniqueidentifier NOT NULL,
    [ect_pat_id] uniqueidentifier,
    [ect_loc_id] uniqueidentifier,
    [ect_date] datetime,
    [ect_daterecorded] datetime,
    [ect_datesaved] datetime,
    [ect_ety_id] int,
    [ect_mode] int NOT NULL,
    [ect_csc_id] int,
    [ect_private] bit,
    [ect_status] int,
    [ect_lks_id_visitreason] int,
    [ect_interpreter] bit,
    [ect_lks_id_language] int,
    [ect_lks_id_transport] int,
    [ect_title] nvarchar(400),
    [ect_source] int,
    [ect_visittype] int,
    [ect_remotelocationid] uniqueidentifier,
    [ect_remotelocation] varchar(255),
    [ect_readonly] bit,
    [ect_lks_id_communicationtype] int,
    [ect_plannedoperation] int,
    [ect_operation] uniqueidentifier,
    [ect_containsprescription] bit NOT NULL,
    [ect_isdeleted] bit,
    [ect_datedeleted] datetime,
    [ect_use_id_lastsaved] uniqueidentifier,
    [ect_pdh_id] int,
    [pnm_id] uniqueidentifier NOT NULL,
    [pnm_pat_id] uniqueidentifier,
    [pnm_number] varchar(255) NOT NULL,
    [pnm_lks_id_status] int,
    [pnm_pnt_id] int NOT NULL
);

CREATE TABLE [Template] (
    [dte_id] int NOT NULL PRIMARY KEY,
    [drt_Id] int NOT NULL PRIMARY KEY,
    [dte_dts_id] tinyint(1) NOT NULL,
    [dte_dtp_id] int NOT NULL,
    [drt_DisplayName] nvarchar(400),
    [dte_available] bit NOT NULL,
    [dte_guid] uniqueidentifier,
    [drt_Deleted] bit NOT NULL,
    [drt_bod_BodyPartId] int NOT NULL,
    [drt_ParsPlanaRadius] decimal(18, 2),
    [dte_ForceAddExplanatorySentence] bit NOT NULL,
    [drt_OraSerrataRadius] decimal(18, 2),
    [drt_EquatorRadius] decimal(18, 2),
    [drt_CenterX] decimal(18, 2),
    [drt_CenterY] decimal(18, 2),
    [drt_ArcadesPolygon] varchar(1000),
    [drt_Radius] decimal(18, 2),
    [drt_dtt_TemplateTypeId] int NOT NULL,
    [drt_InnerRadius] decimal(18, 2)
);

CREATE TABLE [templateblock] (
    [tbk_id] int NOT NULL PRIMARY KEY,
    [tbk_name] nvarchar(1024) NOT NULL,
    [tbk_contents] varbinary(-1) NOT NULL,
    [tbk_tfm_id] int NOT NULL,
    [tbk_tbt_id] int NOT NULL
);

CREATE TABLE [templateblockinclude] (
    [tbi_id] int NOT NULL PRIMARY KEY,
    [tbi_tbk_id_parent] int NOT NULL,
    [tbi_tbk_id_child] int NOT NULL,
    [tbi_orderingkey] int NOT NULL,
    [tbi_tit_id] int NOT NULL
);

CREATE TABLE [templateBlockParameter] (
    [tbp_id] int NOT NULL PRIMARY KEY,
    [tbp_tbk_id] int NOT NULL,
    [tbp_tpt_id] int NOT NULL,
    [tbp_intValue] int,
    [tbp_stringValue] nvarchar(510)
);

CREATE TABLE [templateblocktype] (
    [tbt_id] int NOT NULL PRIMARY KEY,
    [tbt_name] nvarchar(510) NOT NULL
);

CREATE TABLE [templatedatafield] (
    [tdf_id] int NOT NULL PRIMARY KEY,
    [tdf_name] nvarchar(510) NOT NULL,
    [tdf_providerName] nvarchar(510) NOT NULL,
    [tdf_dataAddress] varchar(2048) NOT NULL,
    [tdf_tfm_id] int NOT NULL
);

CREATE TABLE [templateformat] (
    [tfm_id] int NOT NULL PRIMARY KEY,
    [tfm_name] nvarchar(510) NOT NULL
);

CREATE TABLE [templateIncludeParameter] (
    [tip_id] int NOT NULL PRIMARY KEY,
    [tip_tpt_id] int NOT NULL,
    [tip_intValue] int,
    [tip_tbi_id] int NOT NULL,
    [tip_stringValue] nvarchar(510)
);

CREATE TABLE [templateIncludeParameterType] (
    [tpt_id] int NOT NULL PRIMARY KEY,
    [tpt_name] varchar(255)
);

CREATE TABLE [templateincludetype] (
    [tit_id] int NOT NULL PRIMARY KEY,
    [tit_name] nvarchar(510) NOT NULL
);

CREATE TABLE [TemplateLanguage] (
    [tla_dte_id] int NOT NULL PRIMARY KEY,
    [tla_languageCodeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [templaterecipienttypes] (
    [trt_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [TemplateSource] (
    [dts_id] tinyint(1) NOT NULL PRIMARY KEY,
    [dts_description] nvarchar(200) NOT NULL
);

CREATE TABLE [TemplateType] (
    [dtt_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [templatevalidcontents] (
    [tvc_tfm_id_owner] int NOT NULL,
    [tvc_tfm_id_validcontent] int NOT NULL
);

CREATE TABLE [TemplateVersion] (
    [dtv_id] int NOT NULL PRIMARY KEY,
    [dtv_use_id_createdBy] uniqueidentifier NOT NULL
);

CREATE TABLE [TemplateVersionData] (
    [tvd_dtv_id] int NOT NULL PRIMARY KEY,
    [tvd_dtd_id] int NOT NULL PRIMARY KEY,
    [tvd_dtl_id] tinyint(1) NOT NULL
);

CREATE TABLE [Tenotomy] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [Tenotomy] int,
    [Tenotomy] int NOT NULL
);

CREATE TABLE [TenotomyLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [Tenotomy] int NOT NULL,
    [Tenotomy] int
);

CREATE TABLE [Term] (
    [rst_id] int NOT NULL PRIMARY KEY,
    [rst_cpt_id] int NOT NULL,
    [rst_parsedText] nvarchar(4000) NOT NULL,
    [rst_negated] bit NOT NULL,
    [rst_comments] nvarchar(MAX),
    [rst_order] tinyint(1)
);

CREATE TABLE [TermLog] (
    [rst_ObjectId] int NOT NULL,
    [rst_id] int NOT NULL PRIMARY KEY,
    [rst_ros_id] int NOT NULL,
    [rst_cpt_id] int NOT NULL,
    [rst_parsedText] nvarchar(4000) NOT NULL,
    [rst_negated] bit NOT NULL,
    [rst_comments] nvarchar(MAX),
    [rst_order] tinyint(1),
    [rst_DateAdded] datetime NOT NULL,
    [rst_AddedBy] uniqueidentifier NOT NULL,
    [rst_TransactionId] uniqueidentifier NOT NULL,
    [rst_Action] char(1) NOT NULL
);

CREATE TABLE [Test] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [TestActivityId] uniqueidentifier NOT NULL,
    [TestConditionsId] int NOT NULL,
    [TestName] nvarchar(60),
    [ApplicableTestTypeId] int NOT NULL,
    [TestNumber] int NOT NULL,
    [IncludeOnChart] bit NOT NULL,
    [TestMethodId] int NOT NULL,
    [DistanceId] int,
    [TestTypeId] int NOT NULL,
    [DistanceValue] float(8),
    [CorrectionId] int,
    [AddLensId] int,
    [EyeTargetId] int,
    [FixingEyeId] int,
    [DiagnosticOcclusion] bit
);

CREATE TABLE [TestActivity] (
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ChartContent] varbinary(-1)
);

CREATE TABLE [TestActivityLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [ChartContent] varbinary(-1),
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [TestConditions] (
    [Id] int NOT NULL PRIMARY KEY,
    [DiagnosticOcclusion] bit,
    [TestMethodId] int,
    [DistanceId] int,
    [DistanceValue] float(8),
    [CorrectionId] int,
    [PrismIncorporated] bit,
    [AddLensId] int,
    [RightFresnelPrismValue] int,
    [RightFresnelPrismHorizontalBaseId] int,
    [RightFresnelPrismVerticalBaseId] int,
    [LeftFresnelPrismValue] int,
    [LeftFresnelPrismHorizontalBaseId] int,
    [LeftFresnelPrismVerticalBaseId] int,
    [EyeTargetId] int,
    [FixingEyeId] int,
    [HeadPostureStatusId] int,
    [ChinPostureSeverityId] int,
    [ChinPostureDirectionId] int,
    [ChinPostureDegrees] int,
    [FacePostureSeverityId] int,
    [FacePostureDirectionId] int,
    [FacePostureDegrees] int,
    [HeadPostureSeverityId] int,
    [HeadPostureDirectionId] int,
    [HeadPostureDegrees] int,
    [Comments] nvarchar(2000)
);

CREATE TABLE [TestConditionsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [DiagnosticOcclusion] bit,
    [TestMethodId] int,
    [ExcursionId] int,
    [DistanceId] int,
    [DistanceValue] float(8),
    [CorrectionId] int,
    [PrismIncorporated] bit,
    [AddLensId] int,
    [RightFresnelPrismValue] int,
    [RightFresnelPrismHorizontalBaseId] int,
    [RightFresnelPrismVerticalBaseId] int,
    [LeftFresnelPrismValue] int,
    [LeftFresnelPrismHorizontalBaseId] int,
    [LeftFresnelPrismVerticalBaseId] int,
    [EyeTargetId] int,
    [FixingEyeId] int,
    [HeadPostureStatusId] int,
    [ChinPostureSeverityId] int,
    [ChinPostureDirectionId] int,
    [ChinPostureDegrees] int,
    [FacePostureSeverityId] int,
    [FacePostureDirectionId] int,
    [FacePostureDegrees] int,
    [HeadPostureSeverityId] int,
    [HeadPostureDirectionId] int,
    [HeadPostureDegrees] int,
    [Comments] nvarchar(2000),
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [TestEntry] (
    [TestActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [AlphabetOverlayPatternId] int,
    [AppearsGrosslyFull] bit,
    [AlphabetPatternCalculated] bit NOT NULL
);

CREATE TABLE [TestEntryEye] (
    [Id] int NOT NULL PRIMARY KEY,
    [TestActivityId] uniqueidentifier NOT NULL,
    [Eye] int NOT NULL,
    [Comments] nvarchar(2000),
    [TopLeftDuctionId] int,
    [BottomLeftDuctionId] int,
    [MiddleLeftDuctionId] int,
    [TopRightDuctionId] int,
    [BottomRightDuctionId] int,
    [MiddleRightDuctionId] int,
    [TopLeftVersionId] int,
    [BottomLeftVersionId] int,
    [MiddleLeftVersionId] int,
    [TopRightVersionId] int,
    [BottomRightVersionId] int,
    [MiddleRightVersionId] int,
    [BottomLeftOverActionId] int,
    [BottomRightOverActionId] int,
    [TopLeftOverActionId] int,
    [TopRightOverActionId] int
);

CREATE TABLE [TestEntryEyeLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [TestActivityId] uniqueidentifier NOT NULL,
    [Eye] int NOT NULL,
    [Comments] nvarchar(2000),
    [TopLeftDuctionId] int,
    [BottomLeftDuctionId] int,
    [MiddleLeftDuctionId] int,
    [TopRightDuctionId] int,
    [BottomRightDuctionId] int,
    [MiddleRightDuctionId] int,
    [TopLeftVersionId] int,
    [BottomLeftVersionId] int,
    [MiddleLeftVersionId] int,
    [TopRightVersionId] int,
    [BottomRightVersionId] int,
    [MiddleRightVersionId] int,
    [BottomLeftOverActionId] int,
    [BottomRightOverActionId] int,
    [TopLeftOverActionId] int,
    [TopRightOverActionId] int,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [TestEntryLog] (
    [TestActivityId] int NOT NULL PRIMARY KEY,
    [AlphabetOverlayPatternId] int,
    [AppearsGrosslyFull] bit,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [AlphabetPatternCalculated] bit NOT NULL
);

CREATE TABLE [TestLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [TestActivityId] uniqueidentifier NOT NULL,
    [TestConditionsId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TestNumber] int NOT NULL,
    [IncludeOnChart] bit NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TestTypeId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [TestNumber] int NOT NULL,
    [TestName] nvarchar(60),
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [ApplicableTestTypeId] int NOT NULL,
    [TestMethodId] int NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [DistanceId] int,
    [DistanceValue] float(8),
    [CorrectionId] int,
    [AddLensId] int,
    [EyeTargetId] int,
    [FixingEyeId] int,
    [DiagnosticOcclusion] bit
);

CREATE TABLE [TestType] (
    [Id] int NOT NULL PRIMARY KEY,
    [Name] nvarchar(200) NOT NULL
);

CREATE TABLE [Thumbnail] (
    [ebt_doc_SystemDocumentId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ebt_Binary] varbinary(-1),
    [ebt_FailedGeneration] bit NOT NULL
);

CREATE TABLE [ticket#195840_DupPathwayLog_bak] (
    [DUP_ID] int NOT NULL,
    [ppv_versionEffectiveDate] datetime2 NOT NULL,
    [ppv_ppw_id] int NOT NULL,
    [ppv_id] int NOT NULL
);

CREATE TABLE [ticket#195840_pwayBAK] (
    [ppv_id] int NOT NULL,
    [ppv_versionEffectiveDate] datetime2 NOT NULL,
    [ppv_ppw_id] int NOT NULL,
    [ppv_cpw_id] int NOT NULL,
    [ppv_pcs_id] int NOT NULL,
    [ppv_use_id_responsible] uniqueidentifier,
    [ppv_comments] nvarchar(500),
    [ppv_startDate] datetime,
    [ppv_dischargeDate] datetime,
    [ppv_dischargeComments] nvarchar(500),
    [ppv_rolledBack] bit NOT NULL,
    [ppv_use_id_editedBy] uniqueidentifier NOT NULL,
    [ppv_ect_id_editedFrom] uniqueidentifier,
    [ppv_ect_id_relatedWith] uniqueidentifier
);

CREATE TABLE [ticket#205077_dprBAK1] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#205077_dprBAK2] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBAK10] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBAK11] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBak12] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBak13] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBAK3] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBAK4] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBAK5] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBAK6] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBAK7] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBAK8] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_dprBAK9] (
    [dpr_id] int NOT NULL,
    [dpr_pdm_id] int NOT NULL,
    [dpr_practitionercode] nvarchar(510) NOT NULL,
    [dpr_title] nvarchar(510),
    [dpr_forename] nvarchar(510),
    [dpr_surname] nvarchar(510),
    [dpr_practicecode] nvarchar(510),
    [dpr_address1] nvarchar(510),
    [dpr_address2] nvarchar(510),
    [dpr_address3] nvarchar(510),
    [dpr_address4] nvarchar(510),
    [dpr_address5] nvarchar(510),
    [dpr_postcode] nvarchar(510),
    [dpr_landlinephonenumber] nvarchar(510),
    [dpr_practicename] nvarchar(510),
    [dpr_addresscode] nvarchar(510),
    [dpr_addressname] nvarchar(510),
    [dpr_gender] nvarchar(510),
    [dpr_specialty] int,
    [dpr_ptt_id] int NOT NULL,
    [dpr_email] varchar(255),
    [dpr_mobilephonenumber] varchar(255),
    [dpr_faxnumber] varchar(255),
    [dpr_specialtyfreetext] varchar(255),
    [dpr_prd_PractitionerDataSourceId] int
);

CREATE TABLE [ticket#206213_pakBAK] (
    [pak_id] int NOT NULL,
    [pak_add_id] uniqueidentifier NOT NULL,
    [pak_pra_id] uniqueidentifier NOT NULL,
    [pak_addressno] tinyint(1) NOT NULL,
    [pak_main] bit NOT NULL
);

CREATE TABLE [Ticket194284_encounter] (
    [ect_id] uniqueidentifier NOT NULL,
    [ect_pat_id] uniqueidentifier,
    [ect_loc_id] uniqueidentifier,
    [ect_date] datetime,
    [ect_daterecorded] datetime,
    [ect_datesaved] datetime NOT NULL,
    [ect_ety_id] int NOT NULL,
    [ect_mode] int NOT NULL,
    [ect_csc_id] int,
    [ect_private] bit,
    [ect_status] int,
    [ect_lks_id_visitreason] int,
    [ect_interpreter] bit,
    [ect_lks_id_language] int,
    [ect_lks_id_transport] int,
    [ect_title] nvarchar(400),
    [ect_lastsavedsource] int,
    [ect_visittype] int,
    [ect_remotelocationid] uniqueidentifier,
    [ect_remotelocation] varchar(255),
    [ect_readonly] bit,
    [ect_lks_id_communicationtype] int,
    [ect_plannedoperation] int,
    [ect_operation] uniqueidentifier,
    [ect_containsprescription] bit NOT NULL,
    [ect_isdeleted] bit NOT NULL,
    [ect_datedeleted] datetime,
    [ect_use_id_lastsaved] uniqueidentifier,
    [ect_pdh_id] int,
    [ect_skiplettergeneration] bit NOT NULL,
    [ect_ity_InterfaceTypeId_CreatedBy] int,
    [ect_etv_EncounterTemplateVersionId] int,
    [ect_HasApplicableBillingReference] bit,
    [ect_brf_BillingReferenceId] int,
    [ect_EncounterTime] time(4)
);

CREATE TABLE [Ticket194284_encounter20] (
    [ect_id] uniqueidentifier NOT NULL,
    [ect_pat_id] uniqueidentifier,
    [ect_loc_id] uniqueidentifier,
    [ect_date] datetime,
    [ect_daterecorded] datetime,
    [ect_datesaved] datetime NOT NULL,
    [ect_ety_id] int NOT NULL,
    [ect_mode] int NOT NULL,
    [ect_csc_id] int,
    [ect_private] bit,
    [ect_status] int,
    [ect_lks_id_visitreason] int,
    [ect_interpreter] bit,
    [ect_lks_id_language] int,
    [ect_lks_id_transport] int,
    [ect_title] nvarchar(400),
    [ect_lastsavedsource] int,
    [ect_visittype] int,
    [ect_remotelocationid] uniqueidentifier,
    [ect_remotelocation] varchar(255),
    [ect_readonly] bit,
    [ect_lks_id_communicationtype] int,
    [ect_plannedoperation] int,
    [ect_operation] uniqueidentifier,
    [ect_containsprescription] bit NOT NULL,
    [ect_isdeleted] bit NOT NULL,
    [ect_datedeleted] datetime,
    [ect_use_id_lastsaved] uniqueidentifier,
    [ect_pdh_id] int,
    [ect_skiplettergeneration] bit NOT NULL,
    [ect_ity_InterfaceTypeId_CreatedBy] int,
    [ect_etv_EncounterTemplateVersionId] int,
    [ect_HasApplicableBillingReference] bit,
    [ect_brf_BillingReferenceId] int,
    [ect_EncounterTime] time(4)
);

CREATE TABLE [Ticket211996_documentrecipient] (
    [dor_id] int NOT NULL,
    [dor_doc_id] uniqueidentifier NOT NULL,
    [dor_version] int NOT NULL,
    [dor_lks_id_recipient] int NOT NULL,
    [dor_address1] nvarchar(510),
    [dor_address2] nvarchar(510),
    [dor_address3] nvarchar(510),
    [dor_address4] nvarchar(510),
    [dor_postcode] varchar(255),
    [dor_initials] nvarchar(510),
    [dor_surname] nvarchar(510),
    [dor_title] nvarchar(510),
    [dor_firstname] nvarchar(510),
    [dor_source] int NOT NULL,
    [dor_copies] int NOT NULL,
    [dor_signoff] varchar(255),
    [dor_includeaddresspage] bit NOT NULL,
    [dor_batchcopies] int NOT NULL,
    [dor_localcopies] int NOT NULL,
    [dor_edoc] bit NOT NULL,
    [dor_lks_id_recipienttype] int,
    [dor_organisation] nvarchar(510),
    [dor_includeaddresspagebatch] bit,
    [dor_jobtitle] nvarchar(510),
    [dor_recipient_id] uniqueidentifier,
    [dor_address5] nvarchar(510),
    [dor_addressname] nvarchar(510),
    [dor_forename] nvarchar(510),
    [dor_lks_id_gender] int,
    [dor_drg_GroupId] int NOT NULL,
    [dor_includeInAllFutureCorrespondence] bit,
    [dor_add_AddressId] uniqueidentifier,
    [dor_LargePrint] bit NOT NULL,
    [dor_UniqueDocumentRecipientKey] uniqueidentifier NOT NULL
);

CREATE TABLE [Time] (
    [tim_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [tim_Time] time(5) NOT NULL
);

CREATE TABLE [TimeLog] (
    [tim_act_ActivityId] int NOT NULL PRIMARY KEY,
    [tim_ObjectId] uniqueidentifier NOT NULL,
    [tim_DateAdded] datetime NOT NULL,
    [tim_AddedBy] uniqueidentifier NOT NULL,
    [tim_TransactionId] uniqueidentifier NOT NULL,
    [tim_Action] char(1) NOT NULL,
    [tim_Time] time(5) NOT NULL
);

CREATE TABLE [TorsionDeviation] (
    [Id] int NOT NULL PRIMARY KEY,
    [TorsionDeviationName] nvarchar(100) NOT NULL
);

CREATE TABLE [TorsionTestFindings] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [TorsionDeviationId] int,
    [MeasurementStartValue] float(8),
    [MeasurementEndValue] float(8),
    [MeasurementRange] bit,
    [Comments] nvarchar(1000),
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [TorsionTestFindingsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [TorsionDeviationId] int,
    [MeasurementStartValue] float(8),
    [MeasurementEndValue] float(8),
    [MeasurementRange] bit,
    [Comments] nvarchar(1000),
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [Trabeculectomy] (
    [trb_act_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [sft_sdf_id] int NOT NULL PRIMARY KEY,
    [sft_PositionRight] int,
    [trb_BodyPartId] int NOT NULL,
    [trb_NumberOfPreviousTrabs] int NOT NULL,
    [sft_PositionLeft] int,
    [sft_ScleralFlapSizeX] float(8),
    [sft_ScleralFlapSizeY] float(8),
    [trb_Position] int NOT NULL,
    [trb_lks_ConjunctivalFlap] int NOT NULL,
    [sft_ScleralFlapShape] int,
    [sft_ScleralFlapThickness] int,
    [trb_ScleralFlapSizeX] float(8),
    [trb_ScleralFlapSizeY] float(8),
    [sft_PeripheralIridectomyPerformed] bit,
    [sft_lks_ConjunctivalFlap] int,
    [trb_ScleralFlapShape] int NOT NULL,
    [trb_ScleralFlapThickness] int,
    [sft_ViscoelasticLeftInSitu_LookupDataId] int,
    [sft_ACMaintainerUsed] bit,
    [trb_ScleralFlapShapeOtherText] nvarchar(1000),
    [trb_ScleralFlapThicknessComments] nvarchar(1000),
    [sft_CollagenMatrixImplant] bit,
    [trb_ParacentesisNone] bit NOT NULL,
    [trb_ViscoelasticLeftInSitu_LookupDataId] int,
    [trb_ACMaintainerUsed] bit NOT NULL,
    [trb_SclerostomyTechnique] int NOT NULL,
    [trb_SclerostomyTechniqueOther] nvarchar(1000),
    [trb_SclerostomyHeight] decimal(18, 2),
    [trb_SclerostomyWidth] decimal(18, 2),
    [trb_PeripheralIridectomyPerformed] bit NOT NULL,
    [trb_CollagenMatrixImplant] bit NOT NULL
);

CREATE TABLE [TrabeculectomyLog] (
    [sft_sdf_id] int NOT NULL PRIMARY KEY,
    [trb_act_id] int NOT NULL PRIMARY KEY,
    [trb_ObjectId] uniqueidentifier NOT NULL,
    [sft_ObjectId] int NOT NULL,
    [sft_DateAdded] datetime NOT NULL,
    [trb_DateAdded] datetime NOT NULL,
    [trb_AddedBy] uniqueidentifier NOT NULL,
    [sft_AddedBy] uniqueidentifier NOT NULL,
    [sft_Transactionid] uniqueidentifier NOT NULL,
    [trb_Transactionid] uniqueidentifier NOT NULL,
    [trb_Action] char(1) NOT NULL,
    [sft_Action] char(1) NOT NULL,
    [sft_PositionRight] int,
    [trb_BodyPartId] int NOT NULL,
    [trb_NumberOfPreviousTrabs] int NOT NULL,
    [sft_PositionLeft] int,
    [sft_ScleralFlapSizeX] float(8),
    [trb_tss_TractionSuture] int,
    [trb_Position] int NOT NULL,
    [sft_ScleralFlapSizeY] float(8),
    [sft_ScleralFlapShape] int,
    [trb_lks_ConjunctivalFlap] int NOT NULL,
    [trb_ScleralFlapSizeX] float(8),
    [sft_ScleralFlapThickness] int,
    [sft_PeripheralIridectomyPerformed] bit,
    [trb_ScleralFlapSizeY] float(8),
    [trb_ScleralFlapShape] int NOT NULL,
    [sft_lks_ConjunctivalFlap] int,
    [sft_ViscoelasticLeftInSitu_LookupDataId] int,
    [trb_ScleralFlapThickness] int,
    [trb_ScleralFlapShapeOtherText] nvarchar(1000),
    [sft_ACMaintainerUsed] bit,
    [sft_CollagenMatrixImplant] bit,
    [trb_ScleralFlapThicknessComments] nvarchar(1000),
    [trb_ParacentesisNone] bit NOT NULL,
    [trb_ViscoelasticLeftInSitu_LookupDataId] int,
    [trb_ACMaintainerUsed] bit NOT NULL,
    [trb_SclerostomyTechnique] int,
    [trb_SclerostomyTechniqueOther] nvarchar(1000),
    [trb_SclerostomyHeight] decimal(18, 2),
    [trb_SclerostomyWidth] decimal(18, 2),
    [trb_PeripheralIridectomyPerformed] bit NOT NULL,
    [trb_CollagenMatrixImplant] bit NOT NULL
);

CREATE TABLE [TrabeculectomyOther] (
    [tdo_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [tbo_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [tbo_lks_Value] int NOT NULL PRIMARY KEY,
    [tdo_lks_Value] int NOT NULL PRIMARY KEY
);

CREATE TABLE [TrabeculectomyOtherLog] (
    [tdo_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [tbo_ActivityId] int NOT NULL PRIMARY KEY,
    [tbo_ObjectId] uniqueidentifier NOT NULL,
    [tdo_ObjectId] int NOT NULL,
    [tdo_DateAdded] datetime NOT NULL,
    [tbo_DateAdded] datetime NOT NULL,
    [tbo_AddedBy] uniqueidentifier NOT NULL,
    [tdo_AddedBy] uniqueidentifier NOT NULL,
    [tdo_Transactionid] uniqueidentifier NOT NULL,
    [tbo_Transactionid] uniqueidentifier NOT NULL,
    [tbo_Action] char(1) NOT NULL,
    [tdo_Action] char(1) NOT NULL,
    [tdo_lks_Value] int NOT NULL,
    [tbo_lks_Value] int NOT NULL
);

CREATE TABLE [TractionSuture] (
    [tsd_sft_id] int NOT NULL PRIMARY KEY,
    [tss_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [tss_lks_SutureType] int,
    [tsd_lks_Position] int NOT NULL,
    [tsd_lks_Material] int,
    [tss_lks_SutureMaterial] int,
    [tss_other] nvarchar(500)
);

CREATE TABLE [TractionSutureLog] (
    [tss_act_ActivityId] int NOT NULL PRIMARY KEY,
    [tsd_sft_id] int NOT NULL PRIMARY KEY,
    [tsd_ObjectId] int NOT NULL,
    [tsd_DateAdded] datetime NOT NULL,
    [tss_lks_SutureType] int,
    [tss_lks_SutureMaterial] int,
    [tsd_AddedBy] uniqueidentifier NOT NULL,
    [tsd_Transactionid] uniqueidentifier NOT NULL,
    [tss_other] nvarchar(500),
    [tss_DateAdded] datetime NOT NULL,
    [tsd_Action] char(1) NOT NULL,
    [tsd_lks_Position] int NOT NULL,
    [tss_AddedBy] uniqueidentifier NOT NULL,
    [tss_Transactionid] uniqueidentifier NOT NULL,
    [tsd_lks_Material] int,
    [tss_Action] char(1) NOT NULL,
    [tss_ObjectId] uniqueidentifier NOT NULL
);

CREATE TABLE [TransferRequestIdentifier] (
    [tri_Identifier] uniqueidentifier NOT NULL PRIMARY KEY,
    [tri_hom_MessageId] int NOT NULL
);

CREATE TABLE [TransferResponseLink] (
    [trl_Id] int NOT NULL PRIMARY KEY,
    [trl_trs_TransferResponseStatusId] int,
    [trl_IsVoid] bit NOT NULL
);

CREATE TABLE [TransferResponseStatus] (
    [trs_Id] int NOT NULL PRIMARY KEY,
    [trs_Description] nvarchar(200) NOT NULL
);

CREATE TABLE [Transposed] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [Transposition] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [TechniqueId] int,
    [TechniqueId] int NOT NULL,
    [TransposedId] int,
    [SutureId] int,
    [AmountId] int,
    [SutureId] int
);

CREATE TABLE [TranspositionAmount] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [TranspositionLog] (
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [SubSectionId] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [TechniqueId] int NOT NULL,
    [TechniqueId] int,
    [SutureId] int,
    [TransposedId] int,
    [AmountId] int,
    [SutureId] int
);

CREATE TABLE [TranspositionTechnique] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [TransScleralCyclodiode] (
    [tsc_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [tsc_sdf_id] int NOT NULL PRIMARY KEY,
    [tsc_PowerOfLaser] int,
    [tsc_Variable] bit NOT NULL,
    [tsc_MinimumPowerOflaser] int NOT NULL,
    [tsc_Duration] int,
    [tsc_MaximumPowerOflaser] int,
    [tsc_MinimumDuration] int NOT NULL,
    [tsc_MaximumDuration] int,
    [tsc_TotalEnergy] decimal(18, 2),
    [tsc_AudiblePops] bit,
    [tsc_TransScleralRetinalDiode] bit NOT NULL,
    [tsc_TotalEnergyCalculated] bit
);

CREATE TABLE [TransScleralCyclodiodeLog] (
    [tsc_act_ActivityId] int NOT NULL PRIMARY KEY,
    [tsc_sdf_id] int NOT NULL PRIMARY KEY,
    [tsc_ObjectId] int NOT NULL,
    [tsc_Variable] bit,
    [tsc_MinimumPowerOflaser] int,
    [tsc_DateAdded] datetime NOT NULL,
    [tsc_AddedBy] uniqueidentifier NOT NULL,
    [tsc_MaximumPowerOflaser] int,
    [tsc_MinimumDuration] int,
    [tsc_Transactionid] uniqueidentifier NOT NULL,
    [tsc_Action] char(1) NOT NULL,
    [tsc_MaximumDuration] int,
    [tsc_TotalEnergy] decimal(18, 2),
    [tsc_PowerOfLaser] int,
    [tsc_Duration] int,
    [tsc_ObjectId] uniqueidentifier NOT NULL,
    [tsc_DateAdded] datetime NOT NULL,
    [tsc_AddedBy] uniqueidentifier NOT NULL,
    [tsc_Transactionid] uniqueidentifier NOT NULL,
    [tsc_Action] char(1) NOT NULL,
    [tsc_AudiblePops] bit,
    [tsc_TransScleralRetinalDiode] bit NOT NULL,
    [tsc_TotalEnergyCalculated] bit
);

CREATE TABLE [TransScleralMicropulseCyclodiode] (
    [tsm_sdf_id] int NOT NULL PRIMARY KEY,
    [tsm_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [tsm_MinimumPowerOfLaser] int NOT NULL,
    [tsm_PowerOfLaser] int,
    [tsm_Duration] int,
    [tsm_MaximumPowerOfLaser] int,
    [tsm_MinimumDuration] int,
    [tsm_Continuous] bit,
    [tsm_TotalDuration] int,
    [tsm_MaximumDuration] int,
    [tsm_Continuous] bit NOT NULL,
    [tsm_DutyCycle] decimal(18, 2),
    [tsm_Variable] bit NOT NULL,
    [tsm_DutyCycle] decimal(18, 2),
    [tsm_TotalEnergy] decimal(18, 2),
    [tsm_TotalDuration] int,
    [tsm_TotalEnergyCalculated] bit
);

CREATE TABLE [TransScleralMicropulseCyclodiodeLog] (
    [tsm_act_ActivityId] int NOT NULL PRIMARY KEY,
    [tsm_sdf_id] int NOT NULL PRIMARY KEY,
    [tsm_ObjectId] int NOT NULL,
    [tsm_ObjectId] uniqueidentifier NOT NULL,
    [tsm_DateAdded] datetime NOT NULL,
    [tsm_DateAdded] datetime NOT NULL,
    [tsm_AddedBy] uniqueidentifier NOT NULL,
    [tsm_AddedBy] uniqueidentifier NOT NULL,
    [tsm_Transactionid] uniqueidentifier NOT NULL,
    [tsm_Transactionid] uniqueidentifier NOT NULL,
    [tsm_Action] char(1) NOT NULL,
    [tsm_Action] char(1) NOT NULL,
    [tsm_MinimumPowerOfLaser] int,
    [tsm_PowerOfLaser] int,
    [tsm_Duration] int,
    [tsm_MaximumPowerOfLaser] int,
    [tsm_MinimumDuration] int,
    [tsm_Continuous] bit,
    [tsm_TotalDuration] int,
    [tsm_MaximumDuration] int,
    [tsm_Continuous] bit NOT NULL,
    [tsm_DutyCycle] decimal(18, 2),
    [tsm_Variable] bit NOT NULL,
    [tsm_DutyCycle] decimal(18, 2),
    [tsm_TotalEnergy] decimal(18, 2),
    [tsm_TotalDuration] int,
    [tsm_TotalEnergyCalculated] bit
);

CREATE TABLE [TreatmentPlan] (
    [itp_id] int NOT NULL PRIMARY KEY,
    [itp_activedate] datetime NOT NULL,
    [itp_inactivedate] datetime,
    [itp_pri_id] int NOT NULL,
    [itp_pro_id] int NOT NULL,
    [itp_pqi_id] int,
    [itp_cpw_id] int,
    [itp_planstartdate] datetime,
    [itp_planstartinterval] int,
    [itp_planstartscope] int NOT NULL,
    [itp_lks_id_planstartintervaltype] int
);

CREATE TABLE [TreatmentPlanLog] (
    [itp_ObjectId] int NOT NULL,
    [itp_id] int NOT NULL PRIMARY KEY,
    [itp_status] int NOT NULL,
    [itp_activedate] datetime NOT NULL,
    [itp_inactivedate] datetime,
    [itp_pri_id] int NOT NULL,
    [itp_pro_id] int NOT NULL,
    [itp_pqi_id] int,
    [itp_cpw_id] int,
    [itp_DateAdded] datetime NOT NULL,
    [itp_AddedBy] uniqueidentifier NOT NULL,
    [itp_TransactionId] uniqueidentifier NOT NULL,
    [itp_Action] char(1) NOT NULL,
    [itp_planstartdate] datetime,
    [itp_planstartinterval] int,
    [itp_planstartscope] int,
    [itp_lks_id_planstartintervaltype] int,
    [itp_ipl_id] int
);

CREATE TABLE [TreatmentPlanProtocol] (
    [tpp_id] int NOT NULL PRIMARY KEY,
    [tpp_ipp_id] int NOT NULL,
    [tpp_protocolnumber] int NOT NULL,
    [tpp_numberofvisits] int NOT NULL,
    [tpp_intervalweeks] int NOT NULL
);

CREATE TABLE [TreatmentPlanProtocolLog] (
    [tpp_ObjectId] int NOT NULL,
    [tpp_id] int NOT NULL PRIMARY KEY,
    [tpp_itp_id] int NOT NULL,
    [tpp_ipp_id] int NOT NULL,
    [tpp_protocolnumber] int NOT NULL,
    [tpp_numberofvisits] int NOT NULL,
    [tpp_intervalweeks] int NOT NULL,
    [tpp_DateAdded] datetime NOT NULL,
    [tpp_AddedBy] uniqueidentifier NOT NULL,
    [tpp_TransactionId] uniqueidentifier NOT NULL,
    [tpp_Action] char(1) NOT NULL
);

CREATE TABLE [Tube] (
    [tub_act_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [tub_BodyPartId] int NOT NULL,
    [tub_lks_TubeName] int NOT NULL,
    [tub_ConjunctivalIncision] nvarchar(500),
    [tub_DistanceFromLimbus] int,
    [tub_ParacentesisNone] bit NOT NULL,
    [tub_ACMaintainerUsed] bit NOT NULL,
    [tub_TubeEntryDegrees] int NOT NULL,
    [tub_TubeEntryGauge] int,
    [tub_ScleralFlap] bit NOT NULL,
    [tub_lks_DonorMaterialType] int,
    [tub_DonorMaterialTypeOther] nvarchar(500),
    [tub_TubePosition] int,
    [tub_TubeSlits] bit,
    [tub_PeripheralIridectomyPerformed] bit,
    [tub_SurgicalIridotomyPerformed] bit,
    [tub_OtherDetails] nvarchar(4000),
    [tub_FibrinGlueApplied] bit
);

CREATE TABLE [TubeImplant] (
    [tft_sdf_id] int NOT NULL PRIMARY KEY,
    [tft_TractionSuturePosition] int,
    [tft_TractionSutureMaterial] int,
    [tft_ConjunctivalIncision] nvarchar(500),
    [tft_AcMaintainerUsed] bit,
    [tft_TubeEntryRDegrees] int,
    [tft_TubeEntryLDegrees] int,
    [tft_TubeEntryGauge] int,
    [tft_TubeAnchorSutureNumber] int,
    [tft_TubeAnchorSutureMaterial] int,
    [tft_ScleralFlap] bit,
    [tft_DonorMaterial] int,
    [tft_PeripheralIridectomy] bit,
    [tft_SurgicalIridotomy] bit,
    [tft_OtherDetails] nvarchar(4000),
    [tft_PlateAnchorSutureNumber] int,
    [tft_PlateAnchorSutureMaterial] int,
    [tft_DistanceFromLimbus] int,
    [tft_Position] int,
    [tft_TubeSlits] bit,
    [tft_FibrinGlue] bit
);

CREATE TABLE [TubeImplantLog] (
    [tft_sdf_id] int NOT NULL PRIMARY KEY,
    [tft_ObjectId] int NOT NULL,
    [tft_DateAdded] datetime NOT NULL,
    [tft_AddedBy] uniqueidentifier NOT NULL,
    [tft_Transactionid] uniqueidentifier NOT NULL,
    [tft_Action] char(1) NOT NULL,
    [tft_TractionSuturePosition] int,
    [tft_TractionSutureMaterial] int,
    [tft_ConjunctivalIncision] nvarchar(500),
    [tft_AcMaintainerUsed] bit,
    [tft_TubeEntryRDegrees] int,
    [tft_TubeEntryLDegrees] int,
    [tft_TubeEntryGauge] int,
    [tft_TubeAnchorSutureNumber] int,
    [tft_TubeAnchorSutureMaterial] int,
    [tft_ScleralFlap] bit,
    [tft_DonorMaterial] int,
    [tft_PeripheralIridectomy] bit,
    [tft_SurgicalIridotomy] bit,
    [tft_OtherDetails] nvarchar(4000),
    [tft_PlateAnchorSutureNumber] int,
    [tft_PlateAnchorSutureMaterial] int,
    [tft_DistanceFromLimbus] int,
    [tft_Position] int,
    [tft_TubeSlits] bit,
    [tft_FibrinGlue] bit
);

CREATE TABLE [TubeLog] (
    [tub_act_id] int NOT NULL PRIMARY KEY,
    [tub_BodyPartId] int NOT NULL,
    [tub_ObjectId] uniqueidentifier NOT NULL,
    [tub_DateAdded] datetime NOT NULL,
    [tub_AddedBy] uniqueidentifier NOT NULL,
    [tub_Transactionid] uniqueidentifier NOT NULL,
    [tub_Action] char(1) NOT NULL,
    [tub_lks_TubeName] int NOT NULL,
    [tub_ConjunctivalIncision] nvarchar(500),
    [tub_DistanceFromLimbus] int,
    [tub_ParacentesisNone] bit NOT NULL,
    [tub_ACMaintainerUsed] bit NOT NULL,
    [tub_TubeEntryDegrees] int NOT NULL,
    [tub_TubeEntryGauge] int,
    [tub_ScleralFlap] bit NOT NULL,
    [tub_lks_DonorMaterialType] int,
    [tub_DonorMaterialTypeOther] nvarchar(500),
    [tub_TubePosition] int,
    [tub_TubeSlits] bit,
    [tub_PeripheralIridectomyPerformed] bit,
    [tub_SurgicalIridotomyPerformed] bit,
    [tub_OtherDetails] nvarchar(4000),
    [tub_FibrinGlueApplied] bit
);

CREATE TABLE [TubeOcclusion] (
    [sdo_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [toc_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [toc_lks_Type] int NOT NULL PRIMARY KEY,
    [sdo_TypeId] int NOT NULL PRIMARY KEY,
    [sdo_Number] int,
    [toc_number] int,
    [toc_lks_Material] int,
    [sdo_MaterialId] int,
    [sdo_ExtentId] int,
    [toc_lks_Extent] int
);

CREATE TABLE [TubeOcclusionLog] (
    [sdo_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [toc_act_ActivityId] int NOT NULL PRIMARY KEY,
    [toc_ObjectId] uniqueidentifier NOT NULL,
    [sdo_ObjectId] int NOT NULL,
    [sdo_DateAdded] datetime NOT NULL,
    [toc_DateAdded] datetime NOT NULL,
    [toc_AddedBy] uniqueidentifier NOT NULL,
    [sdo_AddedBy] uniqueidentifier NOT NULL,
    [sdo_Transactionid] uniqueidentifier NOT NULL,
    [toc_Transactionid] uniqueidentifier NOT NULL,
    [toc_Action] char(1) NOT NULL,
    [sdo_Action] char(1) NOT NULL,
    [sdo_TypeId] int,
    [toc_lks_Type] int,
    [toc_number] int,
    [sdo_Number] int,
    [sdo_MaterialId] int,
    [toc_lks_Material] int,
    [toc_lks_Extent] int,
    [sdo_ExtentId] int
);

CREATE TABLE [TubeProcedureSutures] (
    [tpa_act_ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [tpa_number] int NOT NULL,
    [tpa_lks_SutureMaterial] int,
    [tpa_TubeProcedureSutureType] int NOT NULL PRIMARY KEY
);

CREATE TABLE [TubeProcedureSuturesLog] (
    [tpa_act_ActivityId] int NOT NULL PRIMARY KEY,
    [tpa_ObjectId] uniqueidentifier NOT NULL,
    [tpa_DateAdded] datetime NOT NULL,
    [tpa_AddedBy] uniqueidentifier NOT NULL,
    [tpa_Transactionid] uniqueidentifier NOT NULL,
    [tpa_Action] char(1) NOT NULL,
    [tpa_number] int,
    [tpa_lks_SutureMaterial] int,
    [tpa_TubeProcedureSutureType] int
);

CREATE TABLE [TubeProcedureSutureType] (
    [tps_id] int NOT NULL PRIMARY KEY,
    [tps_SingularDescription] nvarchar(200) NOT NULL,
    [tps_PlauralDescription] nvarchar(200) NOT NULL
);

CREATE TABLE [TubeSurgicalCompletionSuture] (
    [scs_ActivityId] uniqueidentifier NOT NULL,
    [sut_id] int NOT NULL PRIMARY KEY,
    [sut_SurgeonDefaultId] int NOT NULL,
    [scs_sct_id] int NOT NULL,
    [scs_lks_SutureMaterial] int,
    [sut_sct_SutureType] int NOT NULL,
    [sut_Number] int,
    [scs_Number] int NOT NULL,
    [scs_id] int NOT NULL PRIMARY KEY,
    [sut_lks_SutureMaterial] int
);

CREATE TABLE [TubeSurgicalCompletionSutureLog] (
    [sut_id] int NOT NULL PRIMARY KEY,
    [scs_ActivityId] uniqueidentifier NOT NULL,
    [sut_ObjectId] int NOT NULL,
    [sut_DateAdded] datetime NOT NULL,
    [scs_DateAdded] datetime NOT NULL,
    [scs_AddedBy] uniqueidentifier NOT NULL,
    [sut_AddedBy] uniqueidentifier NOT NULL,
    [sut_TransactionId] uniqueidentifier NOT NULL,
    [scs_Transactionid] uniqueidentifier NOT NULL,
    [scs_Action] char(1) NOT NULL,
    [sut_Action] char(1) NOT NULL,
    [sut_SurgeonDefaultId] int NOT NULL,
    [scs_sct_id] int NOT NULL,
    [scs_lks_SutureMaterial] int,
    [sut_sct_SutureType] int NOT NULL,
    [sut_Number] int,
    [scs_Number] int NOT NULL,
    [scs_id] int NOT NULL PRIMARY KEY,
    [sut_lks_SutureMaterial] int,
    [scs_ObjectId] int
);

CREATE TABLE [TurbidityData] (
    [utb_id] int NOT NULL PRIMARY KEY,
    [utb_available] bit NOT NULL
);

CREATE TABLE [Type] (
    [Id] int NOT NULL PRIMARY KEY,
    [pft_Id] int NOT NULL PRIMARY KEY,
    [pft_Name] nvarchar(200) NOT NULL,
    [Description] nvarchar(510) NOT NULL,
    [pft_IsCustomisable] bit NOT NULL
);

CREATE TABLE [unknownpatients] (
    [pdm_id] int NOT NULL,
    [pdm_gender] nvarchar(510),
    [pdm_lastupdated] datetime
);

CREATE TABLE [UrobilinogenData] (
    [uub_id] int NOT NULL PRIMARY KEY,
    [uub_available] bit NOT NULL
);

CREATE TABLE [User] (
    [use_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [use_domainsid] int,
    [use_prefix] nvarchar(510),
    [use_givenname] nvarchar(510),
    [use_middlename] nvarchar(510),
    [use_familyname] nvarchar(510),
    [use_suffix] nvarchar(510),
    [use_passwordsalt] varchar(255) NOT NULL,
    [use_password] nvarchar(510),
    [use_secretquestion] nvarchar(510),
    [use_secretresponse] nvarchar(510),
    [use_initials] nvarchar(20),
    [use_fullname] nvarchar(510),
    [use_qualifications] nvarchar(510),
    [use_email] nvarchar(510),
    [use_telephone] varchar(255),
    [use_description] nvarchar(510),
    [use_ust_id] int NOT NULL,
    [use_use_id_secretary] uniqueidentifier,
    [use_emplyomentstatus] tinyint(1),
    [use_status] tinyint(1),
    [use_passwordlastupdated] datetime NOT NULL,
    [use_failedlogincount] tinyint(1),
    [use_gra_id] int,
    [use_blb_id_signature] uniqueidentifier,
    [use_signoff] varchar(255),
    [use_fax] varchar(255),
    [use_nationalcode] varchar(255),
    [use_ntncode] varchar(255),
    [use_passwordstatus] int,
    [use_lks_id_gender] int NOT NULL,
    [use_changepasswordonnextlogin] bit NOT NULL,
    [use_uas_id] int NOT NULL,
    [use_BillingCode] nvarchar(40),
    [use_InformationSystemsUsername] nvarchar(200),
    [use_NumberOfChangePasswordAttemptsSinceLastLogin] int NOT NULL
);

CREATE TABLE [UserAccountStatus] (
    [uas_id] int NOT NULL PRIMARY KEY,
    [uas_description] nvarchar(40) NOT NULL
);

CREATE TABLE [userdefaultdrugoptionslink] (
    [udd_id] int NOT NULL PRIMARY KEY,
    [udd_source] int,
    [udd_order] int,
    [udd_required] int NOT NULL,
    [udd_dsc_id] int,
    [udd_drs_id] int,
    [udd_StartDateDayAfterSurgery] bit NOT NULL
);

CREATE TABLE [userdefaultdrugoptionslinklog] (
    [udd_ObjectId] int NOT NULL,
    [udd_id] int NOT NULL PRIMARY KEY,
    [udd_use_id] uniqueidentifier,
    [udd_ddo_id] int,
    [udd_source] int,
    [udd_order] int,
    [udd_DateAdded] datetime NOT NULL,
    [udd_AddedBy] uniqueidentifier NOT NULL,
    [udd_TransactionId] uniqueidentifier NOT NULL,
    [udd_Action] char(1) NOT NULL,
    [udd_required] int,
    [udd_dsc_id] int,
    [udd_drs_id] int,
    [udd_StartDateDayAfterSurgery] bit NOT NULL
);

CREATE TABLE [userdefaultgroups] (
    [udg_id] int NOT NULL PRIMARY KEY,
    [udg_ust_id] int NOT NULL,
    [udg_gra_id] int,
    [udg_grp_id] uniqueidentifier NOT NULL
);

CREATE TABLE [usergradehistory] (
    [ugh_id] int NOT NULL PRIMARY KEY,
    [ugh_use_id] uniqueidentifier NOT NULL,
    [ugh_gra_id] int NOT NULL,
    [ugh_datefrom] datetime NOT NULL,
    [ugh_dateto] datetime
);

CREATE TABLE [UserGroup] (
    [rug_Id] uniqueidentifier NOT NULL PRIMARY KEY,
    [Id] uniqueidentifier NOT NULL PRIMARY KEY,
    [GroupName] nvarchar(100) NOT NULL,
    [rug_GroupName] nvarchar(100) NOT NULL,
    [rug_Available] bit NOT NULL,
    [Available] bit NOT NULL
);

CREATE TABLE [UserGroupLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [rug_Id] int NOT NULL,
    [rug_ObjectId] uniqueidentifier NOT NULL,
    [GroupName] nvarchar(100) NOT NULL,
    [Available] bit NOT NULL,
    [rug_DateAdded] datetime NOT NULL,
    [rug_AddedBy] uniqueidentifier NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [rug_TransactionId] uniqueidentifier NOT NULL,
    [rug_Action] char(1) NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [rug_GroupName] nvarchar(100) NOT NULL,
    [rug_Available] bit NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [UserGroupUser] (
    [GroupId] uniqueidentifier NOT NULL PRIMARY KEY,
    [ugu_rug_Id] uniqueidentifier NOT NULL PRIMARY KEY,
    [ugu_use_Id] uniqueidentifier NOT NULL PRIMARY KEY,
    [UserId] uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE [UserGroupUserLog] (
    [GroupId] int NOT NULL PRIMARY KEY,
    [UserId] uniqueidentifier NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL
);

CREATE TABLE [userlog] (
    [use_ObjectId] uniqueidentifier NOT NULL,
    [use_id] int NOT NULL PRIMARY KEY,
    [use_username] nvarchar(510),
    [use_domainuser] nvarchar(510),
    [use_domainsid] int,
    [use_prefix] nvarchar(510),
    [use_givenname] nvarchar(510),
    [use_middlename] nvarchar(510),
    [use_familyname] nvarchar(510),
    [use_suffix] nvarchar(510),
    [use_passwordsalt] varchar(255) NOT NULL,
    [use_password] nvarchar(510),
    [use_secretquestion] nvarchar(510),
    [use_secretresponse] nvarchar(510),
    [use_initials] nvarchar(20),
    [use_fullname] nvarchar(510),
    [use_qualifications] nvarchar(510),
    [use_email] nvarchar(510),
    [use_telephone] varchar(255),
    [use_description] nvarchar(510),
    [use_ust_id] int NOT NULL,
    [use_use_id_secretary] uniqueidentifier,
    [use_emplyomentstatus] tinyint(1),
    [use_status] tinyint(1),
    [use_failedlogincount] tinyint(1),
    [use_adnativeguid] uniqueidentifier,
    [use_gra_id] int,
    [use_blb_id_signature] uniqueidentifier,
    [use_signoff] varchar(255),
    [use_fax] varchar(255),
    [use_nationalcode] varchar(255),
    [use_ntncode] varchar(255),
    [use_passwordstatus] int,
    [use_DateAdded] datetime NOT NULL,
    [use_AddedBy] uniqueidentifier NOT NULL,
    [use_TransactionId] uniqueidentifier NOT NULL,
    [use_Action] char(1) NOT NULL,
    [use_passwordlastupdated] datetime,
    [use_lks_id_gender] int,
    [use_changepasswordonnextlogin] bit,
    [use_uas_id] int NOT NULL,
    [use_BillingCode] nvarchar(40),
    [use_InformationSystemsUsername] nvarchar(200),
    [use_NumberOfChangePasswordAttemptsSinceLastLogin] int
);

CREATE TABLE [UserMappings] (
    [SourceID] uniqueidentifier NOT NULL PRIMARY KEY,
    [DestinationID] uniqueidentifier NOT NULL,
    [DestinationIDInt] int,
    [IsStaticEnum] bit NOT NULL,
    [MedisoftMigrationTypeId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [UserPathway] (
    [sup_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [userpermission] (
    [upe_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [upe_deny] bit NOT NULL,
    [upe_active] bit
);

CREATE TABLE [userpermissionlog] (
    [upe_ObjectId] uniqueidentifier NOT NULL,
    [upe_id] int NOT NULL PRIMARY KEY,
    [upe_use_id] uniqueidentifier NOT NULL,
    [upe_per_id] int NOT NULL,
    [upe_deny] bit NOT NULL,
    [upe_active] bit,
    [upe_DateAdded] datetime NOT NULL,
    [upe_AddedBy] uniqueidentifier NOT NULL,
    [upe_TransactionId] uniqueidentifier NOT NULL,
    [upe_Action] char(1) NOT NULL
);

CREATE TABLE [UserSectionFavourite] (
    [dau_id] int NOT NULL PRIMARY KEY,
    [dau_use_id] uniqueidentifier NOT NULL,
    [dau_sit_id] uniqueidentifier NOT NULL,
    [dau_ety_id] int NOT NULL,
    [dau_cpw_id] int NOT NULL,
    [dau_das_id] int NOT NULL
);

CREATE TABLE [UserSectionFavouriteLog] (
    [dau_ObjectId] int NOT NULL,
    [dau_id] int NOT NULL PRIMARY KEY,
    [dau_use_id] uniqueidentifier NOT NULL,
    [dau_sit_id] uniqueidentifier NOT NULL,
    [dau_ety_id] int NOT NULL,
    [dau_cpw_id] int NOT NULL,
    [dau_das_id] int NOT NULL,
    [dau_DateAdded] datetime NOT NULL,
    [dau_AddedBy] uniqueidentifier NOT NULL,
    [dau_Transactionid] uniqueidentifier NOT NULL,
    [dau_Action] char(1) NOT NULL
);

CREATE TABLE [userspecialty] (
    [usp_id] uniqueidentifier NOT NULL PRIMARY KEY,
    [usp_use_id] uniqueidentifier NOT NULL,
    [usp_spe_id] int NOT NULL
);

CREATE TABLE [userspecialtylog] (
    [usp_ObjectId] uniqueidentifier NOT NULL,
    [usp_id] int NOT NULL PRIMARY KEY,
    [usp_use_id] uniqueidentifier NOT NULL,
    [usp_spe_id] int NOT NULL,
    [usp_DateAdded] datetime NOT NULL,
    [usp_AddedBy] uniqueidentifier NOT NULL,
    [usp_TransactionId] uniqueidentifier NOT NULL,
    [usp_Action] char(1) NOT NULL
);

CREATE TABLE [usertype] (
    [ust_id] int NOT NULL PRIMARY KEY,
    [ust_desc] nvarchar(510),
    [ust_valid] bit,
    [ust_showonwebui] bit NOT NULL,
    [ust_FeminineDescription] nvarchar(450)
);

CREATE TABLE [UserWarning] (
    [euw_Id] int NOT NULL PRIMARY KEY,
    [euw_use_UserId] uniqueidentifier NOT NULL,
    [euw_eaa_ApplicationId] int NOT NULL,
    [euw_TimesShown] int NOT NULL,
    [euw_DoNotShowAgain] bit NOT NULL
);

CREATE TABLE [UVDetails] (
    [Id] int NOT NULL PRIMARY KEY,
    [ActivityId] uniqueidentifier NOT NULL PRIMARY KEY,
    [DeviceId] int,
    [DeviceId] int,
    [UVPower] int,
    [UVPower] int NOT NULL,
    [Duration] int,
    [Duration] int,
    [ExposureId] int,
    [ExposureId] int,
    [ExposureSeconds] decimal(18, 2),
    [ExposureSeconds] decimal(18, 2),
    [TopographyGuided] bit,
    [TopographyGuided] bit,
    [UVTotalEnergy] decimal(18, 2) NOT NULL,
    [UVTotalEnergy] decimal(18, 2),
    [OtherDetails] nvarchar(4000)
);

CREATE TABLE [UVDetailsLog] (
    [ActivityId] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] uniqueidentifier NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [DeviceId] int,
    [DeviceId] int,
    [UVPower] int,
    [UVPower] int NOT NULL,
    [Duration] int,
    [Duration] int,
    [ExposureId] int,
    [ExposureId] int,
    [ExposureSeconds] decimal(18, 2),
    [ExposureSeconds] decimal(18, 2),
    [TopographyGuided] bit,
    [TopographyGuided] bit,
    [UVTotalEnergy] decimal(18, 2) NOT NULL,
    [UVTotalEnergy] decimal(18, 2),
    [OtherDetails] nvarchar(4000)
);

CREATE TABLE [UVDevice] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL
);

CREATE TABLE [UVDeviceLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Description] nvarchar(510) NOT NULL,
    [Available] bit NOT NULL,
    [Order] int NOT NULL,
    [StaticId] int
);

CREATE TABLE [ValidationResult] (
    [ecv_id] int NOT NULL PRIMARY KEY,
    [ecv_validationtarget_id] uniqueidentifier,
    [ecv_isvalid] bit NOT NULL,
    [ecv_validationtype] int NOT NULL,
    [ecv_datevalidation] datetime NOT NULL
);

CREATE TABLE [ValidationResultItem] (
    [vri_id] int NOT NULL PRIMARY KEY,
    [vri_ecv_id] int NOT NULL,
    [vri_validationkey] varchar(1000),
    [vri_validationmessage] varchar(4000)
);

CREATE TABLE [VasoconstrictiveAgent] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [VasoconstrictiveAgentId] int NOT NULL
);

CREATE TABLE [VasoconstrictiveAgentLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [PreparationId] int NOT NULL,
    [VasoconstrictiveAgentId] int NOT NULL,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [VasoconstrictiveAgentOther] (
    [Id] int NOT NULL PRIMARY KEY,
    [OtherId] int NOT NULL,
    [VasoconstrictiveAgentId] int NOT NULL,
    [BodyPartId] int NOT NULL
);

CREATE TABLE [VasoconstrictiveAgentOtherLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [BodyPartId] int NOT NULL,
    [VasoconstrictiveAgentId] int NOT NULL,
    [OtherId] int NOT NULL
);

CREATE TABLE [version] (
    [ver_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [versiondb] (
    [vdb_id] int NOT NULL PRIMARY KEY,
    [vdb_versiondb] varchar(20) NOT NULL,
    [vdb_major] int NOT NULL,
    [vdb_minor] int NOT NULL,
    [vdb_build] int NOT NULL,
    [vdb_versionapi] varchar(255)
);

CREATE TABLE [versionfile] (
    [fil_id] int NOT NULL PRIMARY KEY,
    [fil_filename] varchar(100) NOT NULL,
    [fil_filepath] varchar(250) NOT NULL,
    [fil_filehash] varchar(50) NOT NULL
);

CREATE TABLE [VersionOptions] (
    [VersionValue] float(8) NOT NULL,
    [VersionDescription] nvarchar(8) NOT NULL,
    [VersionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [versionstofiles] (
    [version_id] int NOT NULL PRIMARY KEY,
    [versionfile_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [versionworkstation] (
    [wks_id] int NOT NULL PRIMARY KEY,
    [wks_friendlyid] varchar(255) NOT NULL,
    [wks_ver_id_latest] int,
    [wks_ver_id_current] int
);

CREATE TABLE [VerticalDeviation] (
    [Id] int NOT NULL PRIMARY KEY,
    [VerticalDeviationName] nvarchar(100) NOT NULL
);

CREATE TABLE [VerticalPreAdjustment] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [VerticalTarget] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [VerticalTargetId] int,
    [VerticalTargetId] int NOT NULL,
    [RangeFrom] tinyint(1),
    [RangeFrom] tinyint(1),
    [RangeTo] tinyint(1),
    [RangeTo] tinyint(1)
);

CREATE TABLE [VerticalTargetLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [VerticalTargetId] int NOT NULL,
    [VerticalTargetId] int,
    [RangeFrom] tinyint(1),
    [RangeFrom] tinyint(1),
    [RangeTo] tinyint(1),
    [RangeTo] tinyint(1)
);

CREATE TABLE [VerticalTestFindings] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [VerticalDeviationId] int,
    [MeasurementStartValue] float(8),
    [MeasurementEndValue] float(8),
    [MeasurementRange] bit,
    [MeasurementUnitId] int NOT NULL,
    [Comments] nvarchar(1000),
    [FresnelPrismBaseVerticalDirectionId] int,
    [NoDeviation] bit NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [VerticalTestFindingsLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [FindingEyeId] int,
    [VerticalDeviationId] int,
    [MeasurementStartValue] float(8),
    [MeasurementEndValue] float(8),
    [MeasurementRange] bit,
    [MeasurementUnitId] int NOT NULL,
    [Comments] nvarchar(1000),
    [FresnelPrismBaseVerticalDirectionId] int,
    [NoDeviation] bit NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TestId] int NOT NULL,
    [PositionOfGazeId] int NOT NULL
);

CREATE TABLE [Viscoelastic] (
    [Id] int NOT NULL PRIMARY KEY,
    [svd_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [svd_lqu_id] int NOT NULL PRIMARY KEY,
    [ListQuestionId] int NOT NULL PRIMARY KEY
);

CREATE TABLE [ViscoelasticLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [svd_SurgeonDefaultId] int NOT NULL PRIMARY KEY,
    [svd_ObjectId] int NOT NULL,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [svd_DateAdded] datetime NOT NULL,
    [svd_AddedBy] uniqueidentifier NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [Transactionid] uniqueidentifier NOT NULL,
    [svd_Transactionid] uniqueidentifier NOT NULL,
    [svd_Action] char(1) NOT NULL,
    [Action] char(1) NOT NULL,
    [ListQuestionId] int NOT NULL,
    [svd_lqu_id] int
);

CREATE TABLE [Visit] (
    [clv_id] int NOT NULL PRIMARY KEY,
    [clv_18week] varchar(5),
    [clv_18weekpas] varchar(5),
    [clv_pasupdated] varchar(500),
    [clv_pasupdatedtime] datetime,
    [clv_autoupdate] bit NOT NULL
);

CREATE TABLE [VisitLog] (
    [clv_Id] int NOT NULL PRIMARY KEY,
    [clv_csc_id] int,
    [clv_arrivaldatetime] datetime,
    [clv_flags] int NOT NULL,
    [clv_18week] varchar(5),
    [clv_lks_id_transport] int,
    [clv_comment] nvarchar(1000),
    [clv_18weekpas] varchar(5),
    [clv_pasupdated] varchar(500),
    [clv_pasupdatedtime] datetime,
    [clv_updateddatetime] datetime,
    [clv_autoupdate] bit,
    [clv_lks_id_dnareason] int,
    [clv_dnacomment] nvarchar(1000),
    [clv_changeNumber] int NOT NULL,
    [clv_departuretime] datetime,
    [clv_ObjectId] int NOT NULL,
    [clv_DateAdded] datetime NOT NULL,
    [clv_AddedBy] uniqueidentifier NOT NULL,
    [clv_TransactionId] uniqueidentifier NOT NULL,
    [clv_Action] char(1) NOT NULL
);

CREATE TABLE [VisitNumber] (
    [dvn_Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [VisitNumberLog] (
    [dvn_Id] int NOT NULL PRIMARY KEY,
    [dvn_ObjectId] int NOT NULL,
    [dvn_DateAdded] datetime NOT NULL,
    [dvn_AddedBy] uniqueidentifier NOT NULL,
    [dvn_TransactionId] uniqueidentifier NOT NULL,
    [dvn_Action] char(1) NOT NULL,
    [dvn_doc_DocumentId] uniqueidentifier NOT NULL,
    [dvn_Date] date(3) NOT NULL,
    [dvn_Value] nvarchar(40) NOT NULL
);

CREATE TABLE [VisitStep] (
    [cst_id] int NOT NULL PRIMARY KEY,
    [cst_stopclockcolor] int,
    [cst_IsPreArrival] bit NOT NULL
);

CREATE TABLE [VisitStepHistory] (
    [csh_id] int NOT NULL PRIMARY KEY,
    [csh_step_id] int NOT NULL,
    [csh_status_id] int NOT NULL,
    [csh_user_id] uniqueidentifier NOT NULL,
    [csh_update_timestamp] datetime NOT NULL
);

CREATE TABLE [VisitStepHistoryLog] (
    [csh_Id] int NOT NULL PRIMARY KEY,
    [csh_step_id] int NOT NULL,
    [csh_status_id] int NOT NULL,
    [csh_user_id] uniqueidentifier NOT NULL,
    [csh_update_timestamp] datetime NOT NULL,
    [csh_ObjectId] int NOT NULL,
    [csh_DateAdded] datetime NOT NULL,
    [csh_AddedBy] uniqueidentifier NOT NULL,
    [csh_TransactionId] uniqueidentifier NOT NULL,
    [csh_Action] char(1) NOT NULL
);

CREATE TABLE [VisitStepLog] (
    [cst_Id] int NOT NULL PRIMARY KEY,
    [cst_clv_id] int NOT NULL,
    [cst_hcs_id] int,
    [cst_use_id] uniqueidentifier,
    [cst_order] int NOT NULL,
    [cst_status] int NOT NULL,
    [cst_stopclockcolor] int,
    [cst_timestamp] datetime,
    [cst_updated] datetime,
    [cst_stp_manual_id] int,
    [cst_deleted] bit NOT NULL,
    [cst_changeNumber] int NOT NULL,
    [cst_stepName] nvarchar(510),
    [cst_ObjectId] int NOT NULL,
    [cst_DateAdded] datetime NOT NULL,
    [cst_AddedBy] uniqueidentifier NOT NULL,
    [cst_TransactionId] uniqueidentifier NOT NULL,
    [cst_Action] char(1) NOT NULL,
    [cst_IsPreArrival] bit
);

CREATE TABLE [VisualAcuity] (
    [Id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [visualacuity] (
    [evl_id] int NOT NULL PRIMARY KEY
);

CREATE TABLE [VisualAcuity] (
    [ReferralRequestId] int NOT NULL,
    [Date] date(3) NOT NULL
);

CREATE TABLE [visualacuity] (
    [evl_RecordedOn] date(3)
);

CREATE TABLE [VisualAcuityCorrection] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(60) NOT NULL
);

CREATE TABLE [visualacuitylog] (
    [evl_ObjectId] int NOT NULL,
    [evl_id] int NOT NULL PRIMARY KEY,
    [evl_act_id] uniqueidentifier NOT NULL,
    [evl_bod_id] int,
    [evl_vav_id] int,
    [evl_lks_id_correction] int,
    [evl_lks_id_type] int,
    [evl_prosthesis] bit,
    [evl_source] int,
    [evl_lks_id_notation] int,
    [evl_lks_id_measurementtype] int,
    [evl_measurementdistance] int,
    [evl_status] int,
    [evl_displayset] int,
    [evl_DateAdded] datetime NOT NULL,
    [evl_AddedBy] uniqueidentifier NOT NULL,
    [evl_TransactionId] uniqueidentifier NOT NULL,
    [evl_Action] char(1) NOT NULL,
    [evl_deleted] bit,
    [evl_RecordedOn] date(3)
);

CREATE TABLE [VisualAcuityMapping] (
    [Id] int NOT NULL PRIMARY KEY,
    [sva_id] int NOT NULL PRIMARY KEY,
    [VisualAcuityId] int NOT NULL,
    [sva_vav_id_mappedValue] int NOT NULL
);

CREATE TABLE [VisualAcuityNotation] (
    [Id] int NOT NULL PRIMARY KEY,
    [Description] nvarchar(60) NOT NULL
);

CREATE TABLE [visualacuitytest] (
    [vat_id] int NOT NULL PRIMARY KEY,
    [vat_test] varchar(255) NOT NULL,
    [vat_use_id] uniqueidentifier NOT NULL,
    [vat_lks_id_correction] int NOT NULL,
    [vat_score] int NOT NULL,
    [vat_lks_id_chart] int NOT NULL,
    [vat_lks_id_distance] int NOT NULL,
    [vat_lks_id_chartsize] int
);

CREATE TABLE [VisualAcuityUnit] (
    [svu_id] int NOT NULL PRIMARY KEY,
    [svu_name] nvarchar(200) NOT NULL,
    [svu_enabled] bit NOT NULL
);

CREATE TABLE [visualacuityvalue] (
    [vav_id] int NOT NULL PRIMARY KEY,
    [vav_value] nvarchar(510),
    [vav_lks_id_format] int NOT NULL,
    [vav_lks_id_type] int NOT NULL,
    [vav_rank] int NOT NULL,
    [vav_overallrank] float(8)
);

CREATE TABLE [visualacuityvalueconversion] (
    [vvc_id] int NOT NULL PRIMARY KEY,
    [vvc_exact] bit
);

CREATE TABLE [visualacuityValueConversiontest] (
    [vvc_id] int NOT NULL,
    [vvc_vav_id_from] int NOT NULL,
    [vvc_vav_id_to] int NOT NULL
);

CREATE TABLE [VisualFieldTest] (
    [Id] int NOT NULL PRIMARY KEY,
    [TestDuration] time(3) NOT NULL,
    [FoveaStatus] varchar(255) NOT NULL,
    [FoveaValue] nvarchar(510),
    [BackgroundIllumination] nvarchar(510) NOT NULL
);

CREATE TABLE [VisualFieldTestLog] (
    [Id] int NOT NULL PRIMARY KEY,
    [ObjectId] int NOT NULL,
    [DateAdded] datetime NOT NULL,
    [AddedBy] uniqueidentifier NOT NULL,
    [TransactionId] uniqueidentifier NOT NULL,
    [Action] char(1) NOT NULL,
    [TestDuration] time(3) NOT NULL,
    [FoveaStatus] varchar(255) NOT NULL,
    [FoveaValue] nvarchar(510),
    [BackgroundIllumination] nvarchar(510) NOT NULL,
    [HumphreyTestId] int NOT NULL
);

CREATE TABLE [vitreoretinal] (
    [vit_id] int NOT NULL PRIMARY KEY,
    [vit_bod_id] int NOT NULL,
    [vit_lks_id_conjincision] int,
    [vit_chandelierat] int,
    [vit_lks_id_posthyaloidstatus] int,
    [vit_sclerostomywidened] bit NOT NULL,
    [vit_maxcutrate] int,
    [vit_lks_id_heavyliquid] int,
    [vit_retinectomyat] int,
    [vit_lks_id_drainageofsrfmethod] int,
    [vit_drainageofsrfat] int,
    [vit_drainageofsrfcompletion] int,
    [vit_residualfluidat] int,
    [vit_irishooksat] int,
    [vit_peripheraliridectomyat] int,
    [vit_ividrugqualifierid] int,
    [vit_scleralbuckle] bit NOT NULL,
    [vit_lks_tamponadingagent] int,
    [vit_tamponadeconcentration] int,
    [vit_tamponadevolume] float(8),
    [vit_tamponadefill] int,
    [vit_acparacentesisat] int,
    [vit_lks_id_cra] int,
    [vit_numberofsclerostomysutures] int,
    [vit_lks_id_sclerostomysuturematerial] int,
    [vit_numberofconjunctivalsutures] int,
    [vit_lks_id_conjunctivalsuturematerial] int,
    [vit_patientpostures] bit NOT NULL
);

CREATE TABLE [vitreoretinallog] (
    [vit_ObjectId] int NOT NULL,
    [vit_id] int NOT NULL PRIMARY KEY,
    [vit_act_id] uniqueidentifier NOT NULL,
    [vit_bod_id] int NOT NULL,
    [vit_lks_id_conjincision] int,
    [vit_chandelierat] int,
    [vit_lks_id_posthyaloidstatus] int,
    [vit_sclerostomywidened] bit NOT NULL,
    [vit_maxcutrate] int,
    [vit_lks_id_heavyliquid] int,
    [vit_retinectomyat] int,
    [vit_lks_id_drainageofsrfmethod] int,
    [vit_drainageofsrfat] int,
    [vit_drainageofsrfcompletion] int,
    [vit_residualfluidat] int,
    [vit_irishooksat] int,
    [vit_peripheraliridectomyat] int,
    [vit_ividrugqualifierid] int,
    [vit_scleralbuckle] bit NOT NULL,
    [vit_lks_tamponadingagent] int,
    [vit_tamponadeconcentration] int,
    [vit_tamponadevolume] float(8),
    [vit_tamponadefill] int,
    [vit_acparacentesisat] int,
    [vit_lks_id_cra] int,
    [vit_numberofsclerostomysutures] int,
    [vit_lks_id_sclerostomysuturematerial] int,
    [vit_numberofconjunctivalsutures] int,
    [vit_lks_id_conjunctivalsuturematerial] int,
    [vit_patientpostures] bit NOT NULL,
    [vit_DateAdded] datetime NOT NULL,
    [vit_AddedBy] uniqueidentifier NOT NULL,
    [vit_TransactionId] uniqueidentifier NOT NULL,
    [vit_Action] char(1) NOT NULL
);

CREATE TABLE [vitreoretinalposture] (
    [vtp_id] int NOT NULL PRIMARY KEY,
    [vtp_displayorder] int NOT NULL,
    [vtp_posturesetting] int NOT NULL,
    [vtp_lks_id_posture] int,
    [vtp_duration] int,
    [vtp_lks_id_timeofday] int,
    [vtp_timeofdaydays] int,
    [vtp_isdeleted] bit NOT NULL,
    [vtp_durationunit] int
);

CREATE TABLE [vitreoretinalposturelog] (
    [vtp_ObjectId] int NOT NULL,
    [vtp_id] int NOT NULL PRIMARY KEY,
    [vtp_vit_id] int NOT NULL,
    [vtp_displayorder] int NOT NULL,
    [vtp_posturesetting] int NOT NULL,
    [vtp_lks_id_posture] int,
    [vtp_duration] int,
    [vtp_lks_id_timeofday] int,
    [vtp_timeofdaydays] int,
    [vtp_isdeleted] bit NOT NULL,
    [vtp_durationunit] int,
    [vtp_DateAdded] datetime NOT NULL,
    [vtp_AddedBy] uniqueidentifier NOT NULL,
    [vtp_TransactionId] uniqueidentifier NOT NULL,
    [vtp_Action] char(1) NOT NULL
);

CREATE TABLE [vitreoretinalscleralbuckle] (
    [vsb_id] int NOT NULL PRIMARY KEY,
    [vsb_displayorder] int NOT NULL,
    [vsb_lks_id_type] int,
    [vsb_lks_id_size] int,
    [vsb_at] int,
    [vsb_lks_id_indent] int,
    [vsb_numberofsutures] int,
    [vsb_lks_id_suturematerial] int,
    [vsb_isdeleted] bit NOT NULL
);

CREATE TABLE [vitreoretinalscleralbucklelog] (
    [vsb_ObjectId] int NOT NULL,
    [vsb_id] int NOT NULL PRIMARY KEY,
    [vsb_vit_id] int NOT NULL,
    [vsb_displayorder] int NOT NULL,
    [vsb_lks_id_type] int,
    [vsb_lks_id_size] int,
    [vsb_at] int,
    [vsb_lks_id_indent] int,
    [vsb_numberofsutures] int,
    [vsb_lks_id_suturematerial] int,
    [vsb_isdeleted] bit NOT NULL,
    [vsb_DateAdded] datetime NOT NULL,
    [vsb_AddedBy] uniqueidentifier NOT NULL,
    [vsb_TransactionId] uniqueidentifier NOT NULL,
    [vsb_Action] char(1) NOT NULL
);

CREATE TABLE [vitreoretinalsclerostomy] (
    [vts_id] int NOT NULL PRIMARY KEY,
    [vts_displayorder] int NOT NULL,
    [vts_lks_id_gauge] int,
    [vts_mmfromlimbus] decimal(18, 2),
    [vts_sclerostomiesat] int,
    [vts_isdeleted] bit NOT NULL,
    [vts_lks_id_type] int
);

CREATE TABLE [vitreoretinalsclerostomylog] (
    [vts_ObjectId] int NOT NULL,
    [vts_id] int NOT NULL PRIMARY KEY,
    [vts_vit_id] int NOT NULL,
    [vts_displayorder] int NOT NULL,
    [vts_lks_id_gauge] int,
    [vts_mmfromlimbus] decimal(18, 2),
    [vts_sclerostomiesat] int,
    [vts_isdeleted] bit NOT NULL,
    [vts_lks_id_type] int,
    [vts_DateAdded] datetime NOT NULL,
    [vts_AddedBy] uniqueidentifier NOT NULL,
    [vts_TransactionId] uniqueidentifier NOT NULL,
    [vts_Action] char(1) NOT NULL
);

CREATE TABLE [vitreoretinalsclerostomywidened] (
    [vsw_id] int NOT NULL PRIMARY KEY,
    [vsw_sclerostomyat] int,
    [vsw_from] time(5),
    [vsw_to] time(5),
    [vsw_isdeleted] bit NOT NULL
);

CREATE TABLE [vitreoretinalsclerostomywidenedlog] (
    [vsw_ObjectId] int NOT NULL,
    [vsw_id] int NOT NULL PRIMARY KEY,
    [vsw_vit_id] int NOT NULL,
    [vsw_sclerostomyat] int,
    [vsw_from] time(5),
    [vsw_to] time(5),
    [vsw_isdeleted] bit NOT NULL,
    [vsw_DateAdded] datetime NOT NULL,
    [vsw_AddedBy] uniqueidentifier NOT NULL,
    [vsw_TransactionId] uniqueidentifier NOT NULL,
    [vsw_Action] char(1) NOT NULL
);

CREATE TABLE [WorkflowStatus] (
    [csw_Id] int NOT NULL PRIMARY KEY,
    [csw_std_Id] int NOT NULL,
    [csw_Status] nvarchar(100) NOT NULL,
    [csw_Order] int NOT NULL,
    [csw_FinalStepTransferData] bit NOT NULL,
    [csw_IsReadonly] bit NOT NULL,
    [csw_StaticId] int,
    [csw_IsDeletable] int NOT NULL,
    [csw_TriggerEncounterLock] bit,
    [csw_dcs_DataCompletenessCheckId] int
);

CREATE TABLE [WorkflowStatusLog] (
    [csw_id] int NOT NULL PRIMARY KEY,
    [csw_ObjectId] int NOT NULL,
    [csw_DateAdded] datetime NOT NULL,
    [csw_AddedBy] uniqueidentifier NOT NULL,
    [csw_Transactionid] uniqueidentifier NOT NULL,
    [csw_Action] char(1) NOT NULL,
    [csw_std_Id] int,
    [csw_Status] nvarchar(100),
    [csw_Order] int,
    [csw_FinalStepTransferData] bit NOT NULL,
    [csw_IsReadonly] bit NOT NULL,
    [csw_StaticId] int,
    [csw_IsDeletable] int NOT NULL,
    [csw_TriggerEncounterLock] bit,
    [csw_dcs_DataCompletenessCheckId] int
);

CREATE TABLE [x_correctedconcepts] (
    [cpt_id] float(8),
    [cpt_description] nvarchar(510),
    [cpt_cpy_id] float(8),
    [cpt_snomedid] nvarchar(510),
    [cpt_searchable] float(8),
    [cpt_status] float(8),
    [cpt_action] float(8),
    [cpt_mustqualify] float(8),
    [cpt_clinicfinding] float(8),
    [cpt_diagnosis] float(8),
    [cpt_history] float(8),
    [cpt_investigation] float(8),
    [cpt_flag] float(8),
    [cpt_bsm_id] float(8),
    [cpt_negated] float(8),
    [cpt_negationcomment] nvarchar(510),
    [cpt_cpt_idpositive] nvarchar(510),
    [cpt_eyerelated] float(8),
    [cpt_ccy_id] float(8),
    [cpt_icd10] nvarchar(510)
);

CREATE TABLE [x_diagnosisactual] (
    [cpt_id] float(8),
    [cpt_description] nvarchar(510),
    [cpt_diagnosis] float(8)
);

CREATE TABLE [x_duplicates] (
    [cpt_keep] float(8),
    [cpt_id] float(8),
    [cpt_description] nvarchar(510)
);

CREATE TABLE [x_logmarmapping] (
    [lks_descshort] nvarchar(510),
    [vavIDFrom] nvarchar(510),
    [vav_value] nvarchar(510),
    [lks_descshort1] nvarchar(510),
    [vavIDTo] nvarchar(510),
    [vav_value1] nvarchar(510),
    [CorrectID] nvarchar(510),
    [Correct value] nvarchar(510)
);

CREATE TABLE [x_Mergeconcepts] (
    [ParentID] float(8),
    [ParentName] nvarchar(510),
    [ChildID] float(8),
    [ChildName] nvarchar(510)
);

CREATE TABLE [x_MergeConcepts2] (
    [ParentID] float(8),
    [ParentName] nvarchar(510),
    [ChildID] float(8),
    [ChildName] nvarchar(510)
);

CREATE TABLE [x_MergeConcepts3] (
    [ParentID] float(8),
    [ParentName] nvarchar(510),
    [ChildID] float(8) NOT NULL PRIMARY KEY,
    [ChildName] nvarchar(510)
);

CREATE TABLE [x_Misspelledduplicates] (
    [ParentID] float(8),
    [ParentName] nvarchar(510),
    [ChildID] float(8),
    [ChildName] nvarchar(510)
);

CREATE TABLE [x_settings] (
    [set_id] float(8),
    [set_value] float(8),
    [set_description] nvarchar(510),
    [set_context] float(8),
    [set_per_id] float(8),
    [set_displaygroup] nvarchar(510),
    [set_datatype] float(8),
    [set_lookup] nvarchar(510),
    [set_defaultable] float(8),
    [set_public] float(8),
    [set_valuenumeric] nvarchar(510),
    [set_linkedsetting] nvarchar(510),
    [set_name] nvarchar(510)
);

CREATE TABLE [x_snellenmapping] (
    [lks_descshort] nvarchar(510),
    [vavIDFrom] nvarchar(510),
    [vav_value] nvarchar(510),
    [lks_descshort1] nvarchar(510),
    [vavIDTo] nvarchar(510),
    [vav_value1] nvarchar(510),
    [CorrectID] nvarchar(510),
    [Correct value] nvarchar(510)
);

CREATE TABLE [x_usergrades] (
    [UserType] float(8),
    [grade] nvarchar(510),
    [Long description] nvarchar(510),
    [gradeid] float(8)
);

CREATE TABLE [x_VaMappingInexact] (
    [lks_descshort] nvarchar(510),
    [vavIDFrom] nvarchar(510),
    [vav_value] nvarchar(510),
    [lks_descshort1] nvarchar(510),
    [vavIDTo] nvarchar(510),
    [vav_value1] nvarchar(510),
    [vvc_exact] nvarchar(510)
);

CREATE TABLE [XMLStore] (
    [XMLStoreId] int NOT NULL PRIMARY KEY,
    [XMLValue] xml(-1) NOT NULL
);
