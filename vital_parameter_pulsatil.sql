/*
alter table icu_copra.vital_parameter_pulsatil  
  drop column analyzed,
  drop column loinc_short_name;
 
alter table icu_copra.vital_parameter_pulsatil 
  drop column unit;

alter table icu_copra.vital_parameter_pulsatil
   add column profil_canonical varchar default 'https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/',
   add column category_coding_system varchar default 'http://terminology.hl7.org/CodeSystem/observation-category',
   add column category_coding_code varchar default 'vital-signs',
   add column category_coding_display varchar,
   add column loinc_system varchar default 'http://loinc.org',
   add column loinc_display varchar default 'Blood pressure panel with all children optional',
   add column snomed_system varchar default 'http://snomed.info/sct',
   add column snomed_display varchar default 'Blood pressure (observable entity)',
   add column ieee_system varchar,
   add column ieee_display varchar,   
   add column component_sistol_unit_code varchar default 'mm[Hg]',
   add column component_sistol_unit varchar default 'millimeter of mercury',   
   add column component_sistol_loinc varchar,
   add column component_sistol_loinc_system varchar default 'http://loinc.org',
   add column component_sistol_loinc_display varchar,   
   add column component_sistol_loinc_detailed varchar,
   add column component_sistol_loinc_detaile_system varchar default 'http://loinc.org',
   add column component_sistol_loinc_detaile_display varchar,   
   add column component_sistol_snomed varchar,
   add column component_sistol_snomed_system varchar default 'http://snomed.info/sct',
   add column component_sistol_snomed_display varchar,   
   add column component_sistol_ieee varchar,
   add column component_sistol_ieee_system varchar default 'urn:iso:std:iso:11073:10101',
   add column component_sistol_ieee_display varchar,   
   add column component_mean_unit_code varchar default 'mm[Hg]',
   add column component_mean_unit varchar default 'millimeter of mercury',  
   add column component_mean_loinc varchar,
   add column component_mean_loinc_system varchar default 'http://loinc.org',
   add column component_mean_loinc_display varchar,   
   add column component_mean_loinc_detailed varchar,
   add column component_mean_loinc_detaile_system varchar default 'http://loinc.org',
   add column component_mean_loinc_detaile_display varchar,   
   add column component_mean_snomed varchar,
   add column component_mean_snomed_system varchar default 'http://snomed.info/sct',
   add column component_mean_snomed_display varchar,   
   add column component_mean_ieee varchar,
   add column component_mean_ieee_system varchar default 'urn:iso:std:iso:11073:10101',
   add column component_mean_ieee_display varchar,   
   add column component_diastol_unit_code varchar default 'mm[Hg]',
   add column component_diastol_unit varchar default 'millimeter of mercury',   
   add column component_diastol_loinc varchar,
   add column component_diastol_loinc_system varchar default 'http://loinc.org',
   add column component_diastol_loinc_display varchar,   
   add column component_diastol_loinc_detailed varchar,
   add column component_diastol_loinc_detaile_system varchar default 'http://loinc.org',
   add column component_diastol_loinc_detaile_display varchar,   
   add column component_diastol_snomed varchar,
   add column component_diastol_snomed_system varchar default 'http://snomed.info/sct',
   add column component_diastol_snomed_display varchar,   
   add column component_diastol_ieee varchar,
   add column component_diastol_ieee_system varchar default 'urn:iso:std:iso:11073:10101',
   add column component_diastol_ieee_display varchar   
; 
*/ 
 
select * from icu_copra.vital_parameter_pulsatil v 
where id = 74;

update icu_copra.vital_parameter_pulsatil  
set profil_canonical = profil_canonical||'blutdruck-generisch'
where id = 74;


select * from icu_copra.vital_parameter_pulsatil v 
where id = 75;

update icu_copra.vital_parameter_pulsatil  
set profil_canonical = profil_canonical||'linksatrialer-druck',
  snomed_display = 'Direct left atrial pressure (observable entity)',
  component_sistol_loinc = '8480-6',
  component_sistol_loinc_display = 'Systolic blood pressure',
  component_sistol_loinc_detailed = '60989-1',
  component_sistol_loinc_detaile_display = 'Left atrial pressure Systolic',
  component_sistol_ieee = '150065',
  component_sistol_ieee_display = 'Systolic left atrial pressure',
  component_mean_loinc = '8478-0',
  component_mean_loinc_display = 'Mean blood pressure',
  component_mean_loinc_detailed = '8399-8',
  component_mean_loinc_detaile_display = 'Left atrial Intrachamber mean pressure',
  component_mean_ieee = '150067',
  component_mean_ieee_display = 'Mean left atrial pressure',
  component_diastol_loinc = '8462-4',
  component_diastol_loinc_display = 'Diastolic blood pressure',
  component_diastol_loinc_detailed = '75933-2',
  component_diastol_loinc_detaile_display = 'Left atrial pressure Diastolic',
  component_diastol_ieee = '150066',
  component_diastol_ieee_display = 'Diastolic left atrial pressure'
where id = 75;

select * from icu_copra.vital_parameter_pulsatil v 
where id = 76;

update icu_copra.vital_parameter_pulsatil  
set profil_canonical = profil_canonical||'rechtsatrialer-druck',
  snomed_display = 'Right atrial pressure (observable entity)',
  component_sistol_loinc = '8480-6',
  component_sistol_loinc_display = 'Systolic blood pressure',
  component_sistol_loinc_detailed = '60998-2',
  component_sistol_loinc_detaile_display = 'Right atrial pressure Systolic',
  component_sistol_ieee = '150069',
  component_sistol_ieee_display = 'Systolic right atrial pressure',
  component_mean_loinc = '8478-0',
  component_mean_loinc_display = 'Mean blood pressure',
  component_mean_loinc_detailed = '8400-4',
  component_mean_loinc_detaile_display = 'Right atrial Intrachamber mean pressure',
  component_mean_ieee = '150071',
  component_mean_ieee_display = 'Mean right atrial pressure',
  component_diastol_loinc = '8462-4',
  component_diastol_loinc_display = 'Diastolic blood pressure',
  component_diastol_loinc_detailed = '60997-4',
  component_diastol_loinc_detaile_display = 'Right atrial pressure Diastolic',
  component_diastol_ieee = '150070',
  component_diastol_ieee_display = 'Diastolic right atrial pressure'
where id = 76;


select * from icu_copra.vital_parameter_pulsatil v 
where id = 77;

update icu_copra.vital_parameter_pulsatil  
set profil_canonical = profil_canonical||'rechtsventrikulaerer-druck',
 -- snomed_display = 'Right atrial pressure (observable entity)',
  component_sistol_loinc = '8480-6',
  component_sistol_loinc_display = 'Systolic blood pressure',
  component_sistol_loinc_detailed = '8432-7',
  component_sistol_loinc_detaile_display = 'Right ventricular Intrachamber systolic pressure',
  component_sistol_ieee = '150105',
  component_sistol_ieee_display = 'Systolic right ventricular pressure',
  component_mean_loinc = '8478-0',
  component_mean_loinc_display = 'Mean blood pressure',
  component_mean_loinc_detailed = '8406-1',
  component_mean_loinc_detaile_display = 'Right ventricular Intrachamber mean pressure',
  component_mean_ieee = '150107',
  component_mean_ieee_display = 'Mean right ventricular pressure',
  component_diastol_loinc = '8462-4',
  component_diastol_loinc_display = 'Diastolic blood pressure',
  component_diastol_loinc_detailed = '8377-4',
  component_diastol_loinc_detaile_display = 'Right ventricular Intrachamber diastolic pressure',
  component_diastol_ieee = '150106',
  component_diastol_ieee_display = 'Diastolic right ventricular pressure'
where id = 77;


select * from icu_copra.vital_parameter_pulsatil v 
where id = 78;

update icu_copra.vital_parameter_pulsatil  
set profil_canonical = profil_canonical||'linksventrikulaerer-druck',
  --snomed_display = 'Right atrial pressure (observable entity)',
  component_sistol_loinc = '8480-6',
  component_sistol_loinc_display = 'Systolic blood pressure',
  component_sistol_loinc_detailed = '8430-1',
  component_sistol_loinc_detaile_display = 'Left ventricular Intrachamber systolic pressure',
  component_sistol_ieee = '150101',
  component_sistol_ieee_display = 'Systolic left ventricular pressure',
  component_mean_loinc = '8478-0',
  component_mean_loinc_display = 'Mean blood pressure',
  component_mean_loinc_detailed = '8404-6"',
  component_mean_loinc_detaile_display = 'Left ventricular Intrachamber mean pressure',
  component_mean_ieee = '150103',
  component_mean_ieee_display = 'Mean left ventricular pressure',
  component_diastol_loinc = '8462-4',
  component_diastol_loinc_display = 'Diastolic blood pressure',
  component_diastol_loinc_detailed = '8375-8',
  component_diastol_loinc_detaile_display = 'Left ventricular Intrachamber diastolic pressure',
  component_diastol_ieee = '150102',
  component_diastol_ieee_display = 'Diastolic left ventricular pressure'
where id = 78;


select * from icu_copra.vital_parameter_pulsatil v 
where id = 79;

update icu_copra.vital_parameter_pulsatil  
set profil_canonical = profil_canonical||'pulmonalarterieller-blutdruck',
  component_sistol_loinc = '8480-6',
  component_sistol_loinc_display = 'Systolic blood pressure',
  component_sistol_loinc_detailed = '8440-0',
  component_sistol_loinc_detaile_display = 'Pulmonary artery Systolic blood pressure',
  component_sistol_ieee = '150045',
  component_sistol_ieee_display = 'Systolic pulmonary arterial pressure',
  component_mean_loinc = '8478-0',
  component_mean_loinc_display = 'Mean blood pressure',
  component_mean_loinc_detailed = '8414-5',
  component_mean_loinc_detaile_display = 'Pulmonary artery Mean blood pressure',
  component_mean_ieee = '150047',
  component_mean_ieee_display = 'Mean pulmonary arterial pressure',
  component_diastol_loinc = '8462-4',
  component_diastol_loinc_display = 'Diastolic blood pressure',
  component_diastol_loinc_detailed = '8385-7',
  component_diastol_loinc_detaile_display = 'Pulmonary artery Diastolic blood pressure',
  component_diastol_ieee = '150046',
  component_diastol_ieee_display = 'Diastolic pulmonary arterial pressure'
where id = 79;


select * from icu_copra.vital_parameter_pulsatil v 
where id = 80;

update icu_copra.vital_parameter_pulsatil  
set profil_canonical = profil_canonical||'blutdruck',
  component_sistol_loinc = '8480-6',
  component_sistol_loinc_display = 'Systolic blood pressure',
  component_sistol_loinc_detailed = '8480-6',
  component_sistol_loinc_detaile_display = 'Systolic blood pressure',
  component_sistol_ieee = '150017',
  component_sistol_snomed = '271649006',
  component_sistol_snomed_display = 'Systolic blood pressure (observable entity)',
  component_sistol_ieee_display = 'Systolic blood pressure',
  component_mean_loinc = '8478-0',
  component_mean_loinc_display = 'Mean blood pressure',
  component_mean_loinc_detailed = '8478-0',
  component_mean_loinc_detaile_display = 'Mean blood pressure',
  component_mean_ieee = '150019',
  component_mean_ieee_display = 'Mean blood pressure',
  component_mean_snomed = '6797001',
  component_mean_snomed_display = 'Mean blood pressure (observable entity)',
  component_diastol_loinc = '8462-4',
  component_diastol_loinc_display = 'Diastolic blood pressure',
  component_diastol_loinc_detailed = '8462-4',
  component_diastol_loinc_detaile_display = 'Diastolic blood pressure',
  component_diastol_ieee = '150018',
  component_diastol_ieee_display = 'Diastolic blood pressure',
  component_diastol_snomed = '271650006',
  component_diastol_snomed_display = 'Diastolic blood pressure (observable entity)'
where id = 80;

update icu_copra.vital_parameter_pulsatil 
set component_sistol_snomed_system = null,
component_mean_snomed_system = null,
component_diastol_snomed_system = null
where component_mean_snomed isnull;