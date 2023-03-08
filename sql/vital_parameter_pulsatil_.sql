/*
alter table icu_copra.vital_parameter_pulsatil  
  drop column analyzed,
  drop column loinc_short_name;

alter table icu_copra.vital_parameter_pulsatil
   add column unit_code varchar,
   add column profil_canonical varchar default 'https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/',
   add column category_coding_system varchar default 'http://terminology.hl7.org/CodeSystem/observation-category',
   add column category_coding_code varchar default 'vital-signs',
   add column category_coding_display varchar,
   add column loinc_system varchar default 'http://loinc.org',
   add column loinc_display varchar,
   add column snomed_system varchar default 'http://snomed.info/sct',
   add column snomed_display varchar,
   add column ieee_system varchar default 'urn:iso:std:iso:11073:10101',
   add column ieee_display varchar;
   
update icu_copra.vital_parameter_pulsatil  
set unit_code = unit; 

   
update icu_copra.vital_parameter_pulsatil
  set loinc_system = null where loinc isnull; 
 
update icu_copra.vital_parameter_pulsatil
  set snomed_system = null where snomed isnull;
 
update icu_copra.vital_parameter_pulsatil
  set ieee_system = null where ieee isnull; 


select distinct unit, unit_code from icu_copra.vital_parameter_pulsatil v order by unit ; 

update icu_copra.vital_parameter_pulsatil  
set unit = 'percent'
where unit = '%';

update icu_copra.vital_parameter_pulsatil  
set unit = 'centimeter'
where unit = 'cm';
*/
 
 
select * from icu_copra.vital_parameter_pulsatil v 
where id = ;

update icu_copra.vital_parameter_pulsatil  
set profil_canonical = profil_canonical||'p',
  loinc_display = '',
  snomed_display = '',
  ieee_display = ''
where id = 49;
