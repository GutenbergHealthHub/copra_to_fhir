/*
alter table icu_copra.body_temperatur  
  drop column analyzed,
  drop column loinc_short_name;

alter table icu_copra.body_temperatur   
   add column unit_code varchar,
   add column profil_canonical varchar default 'https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/',
   add column category_coding_system varchar default 'http://terminology.hl7.org/CodeSystem/observation-category',
   add column cotegory_cding_display varchar default 'vital-signs',
   add column category_coding_code varchar default '40617009';

alter table icu_copra.body_temperatur  
   add column loinc_system varchar default 'http://loinc.org',
   add column loinc_display varchar,
   add column snomed_system varchar default 'http://snomed.info/sct',
   add column snomed_display varchar,
   add column ieee_system varchar default 'urn:iso:std:iso:11073:10101',
   add column ieee_display varchar;
   
update icu_copra.body_temperatur 
set unit_code = unit; 

update icu_copra.body_temperatur 
set unit = 'degree Celsius'; 
 

   
update icu_copra.body_temperatur
  set loinc_system = null where loinc isnull; 
 
update icu_copra.body_temperatur
  set snomed_system = null where snomed isnull;
 
update icu_copra.body_temperatur
  set ieee_system = null where ieee isnull; 
  
  alter table icu_copra.body_temperatur 
rename snomed_dysplay to snomed_display;

alter table icu_copra.body_temperatur
  drop column loinc_short_name;
  
  update icu_copra.body_temperatur
set category_coding_system = 'http://terminology.hl7.org/CodeSystem/observation-category',
  category_coding_code = 'vital-signs',
  cotegory_cding_display = null;
 
alter table icu_copra.body_temperatur
  rename cotegory_cding_display to category_coding_display;
 */

alter table icu_copra.body_temperatur
  add column body_site_coding_system varchar default 'http://snomed.info/sct',
  add column body_site_coding_code varchar,
  add column body_site_coding_display varchar
;
  
  
select * from icu_copra.body_temperatur bt
where id = 82;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-generisch',
  loinc_display = 'Body temperatur'
where id = 82 ;

select * from icu_copra.body_temperatur bt
where id = 83;

update icu_copra.body_temperatur 
set --profil_canonical = profil_canonical||'koerpertemperatur-brustwirbelsaeule',
  loinc_display = 'Body temperature',
  snomed_display = 'Temperature of thoracic spine (observable entity)',
  b---
where id = 83 ;


select * from icu_copra.body_temperatur bt
where id = 84;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-lendenwirbelsaeule',
  loinc_display = 'Body temperature',
  snomed_display = 'Temperature of lumbar spine (observable entity)'
where id = 84 ;

update icu_copra.body_temperatur 
set loinc_display = 'Body temperatur'
where loinc = '8310-5' ;

