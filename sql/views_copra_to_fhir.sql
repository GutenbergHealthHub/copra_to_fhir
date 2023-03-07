
CREATE OR REPLACE VIEW copra.v_profil_body_temperature
AS 
SELECT 'bd_'::text || md5(((( SELECT tables.table_name
           FROM information_schema.tables
          WHERE tables.table_schema::name = 'copra'::name AND tables.table_name::name = 'co6_data_decimal_6_3'::name))::text || cdd.id) || mmc.profiles::text) AS id,
    mmc.profil_canonical,
    'final'::text AS status,
    mmc.category_coding_system,
    mmc.category_coding_code,
    --mmc.category_coding_display,
    mmc.snomed_system,
    mmc.snomed ,
    mmc.snomed_display,
    mmc.loinc_system ,
    mmc.loinc,
    mmc.loinc_display,
    mmc.ieee_system ,
    mmc.ieee,
    mmc.ieee_display,
    'p_'::text || md5(cmdp.id::character varying::text) AS subject_reference,
    cdd.val * mmc.unit_transform AS "valueQuantity_value",
    'http://unitsofmeasure.org' AS "valueQuantity_system",
    mmc.unit_code  AS "valueQuantity_code",
    mmc.unit as "valueQuantity_display",
    cdd.datetimeto AS "effectiveDataTime",
    mmc.body_site_coding_system,
    mmc.body_site_coding_code,
    mmc.body_site_coding_display
   FROM copra.co6_data_decimal_6_3 cdd
     JOIN copra.co6_config_variables ccv ON cdd.varid = ccv.id
     JOIN copra.matched_body_temperatur mmc ON mmc.id_syst = ccv.id
     JOIN copra.co6_medic_data_patient cmdp ON cmdp.id = cdd.parent_id
  WHERE cdd.validated AND NOT cdd.deleted AND cdd.flagcurrent
 ;

CREATE OR REPLACE VIEW copra.v_profil_parameter_ecmo
AS 
SELECT 'ecmo_'::text || md5(((( SELECT tables.table_name
           FROM information_schema.tables
          WHERE tables.table_schema::name = 'copra'::name AND tables.table_name::name = 'co6_data_decimal_6_3'::name))::text || cdd.id) || mmc.profiles::text) AS id,
    mmc.profil_canonical,
    'final'::text AS status,
    mmc.category_coding_system,
    mmc.category_coding_code,
    mmc.category_coding_display,
    mmc.snomed_system,
    mmc.snomed ,
    mmc.snomed_display,
    mmc.loinc_system ,
    mmc.loinc,
    mmc.loinc_display,
    mmc.ieee_system ,
    mmc.ieee,
    mmc.ieee_display,
    'p_'::text || md5(cmdp.id::character varying::text) AS subject_reference,
    cdd.val * mmc.unit_transform AS "valueQuantity_value",
    'http://unitsofmeasure.org' AS "valueQuantity_system",
    mmc.unit_code  AS "valueQuantity_code",
    mmc.unit as "valueQuantity_display",
    cdd.datetimeto AS "effectiveDataTime"    
   FROM copra.co6_data_decimal_6_3 cdd
     JOIN copra.co6_config_variables ccv ON cdd.varid = ccv.id
     JOIN copra.matched_parameter_ecmo mmc ON mmc.id_syst = ccv.id
     JOIN copra.co6_medic_data_patient cmdp ON cmdp.id = cdd.parent_id
  WHERE cdd.validated AND NOT cdd.deleted AND cdd.flagcurrent
 ;

CREATE OR REPLACE VIEW copra.v_profil_ventilation
AS 
SELECT 'ven_'::text || md5(((( SELECT tables.table_name
           FROM information_schema.tables
          WHERE tables.table_schema::name = 'copra'::name AND tables.table_name::name = 'co6_data_decimal_6_3'::name))::text || cdd.id) || mmc.profiles::text) AS id,
    mmc.profil_canonical,
    'final'::text AS status,
    mmc.category_coding_system,
    mmc.category_coding_code,
    mmc.category_coding_display,
    mmc.snomed_system,
    mmc.snomed ,
    mmc.snomed_display,
    mmc.loinc_system ,
    mmc.loinc,
    mmc.loinc_display,
    mmc.ieee_system ,
    mmc.ieee,
    mmc.ieee_display,
    'p_'::text || md5(cmdp.id::character varying::text) AS subject_reference,
    cdd.val * mmc.unit_transform AS "valueQuantity_value",
    'http://unitsofmeasure.org' AS "valueQuantity_system",
    mmc.unit_code  AS "valueQuantity_code",
    mmc.unit as "valueQuantity_display",
    cdd.datetimeto AS "effectiveDataTime"    
   FROM copra.co6_data_decimal_6_3 cdd
     JOIN copra.co6_config_variables ccv ON cdd.varid = ccv.id
     JOIN copra.matched_ventilation mmc ON mmc.id_syst = ccv.id
     JOIN copra.co6_medic_data_patient cmdp ON cmdp.id = cdd.parent_id
  WHERE cdd.validated AND NOT cdd.deleted AND cdd.flagcurrent
 ;


CREATE OR REPLACE VIEW copra.v_profil_vital_parameter_no_pulsatil
AS 
SELECT 'vpnp_'::text || md5(((( SELECT tables.table_name
           FROM information_schema.tables
          WHERE tables.table_schema::name = 'copra'::name AND tables.table_name::name = 'co6_data_decimal_6_3'::name))::text || cdd.id) || mmc.profiles::text) AS id,
    mmc.profil_canonical,
    'final'::text AS status,
    mmc.category_coding_system,
    mmc.category_coding_code,
    --mmc.category_coding_display,
    mmc.snomed_system,
    mmc.snomed ,
    mmc.snomed_display,
    mmc.loinc_system ,
    mmc.loinc,
    mmc.loinc_display,
    mmc.ieee_system ,
    mmc.ieee,
    mmc.ieee_display,
    'p_'::text || md5(cmdp.id::character varying::text) AS subject_reference,
    cdd.val * mmc.unit_transform AS "valueQuantity_value",
    'http://unitsofmeasure.org' AS "valueQuantity_system",
    mmc.unit_code  AS "valueQuantity_code",
    mmc.unit as "valueQuantity_display",
    cdd.datetimeto AS "effectiveDataTime"    
   FROM copra.co6_data_decimal_6_3 cdd
     JOIN copra.co6_config_variables ccv ON cdd.varid = ccv.id
     JOIN copra.matched_vital_parameter_no_pulsatil mmc ON mmc.id_syst = ccv.id
     JOIN copra.co6_medic_data_patient cmdp ON cmdp.id = cdd.parent_id
  WHERE cdd.validated AND NOT cdd.deleted AND cdd.flagcurrent
 ;
