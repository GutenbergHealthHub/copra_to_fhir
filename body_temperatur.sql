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
  
alter table icu_copra.body_temperatur
  add column body_site_coding_system varchar default 'http://snomed.info/sct',
  add column body_site_coding_code varchar,
  add column body_site_coding_display varchar
;
 */


  
  
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
  body_site_coding_code = '122495006',
  body_site_coding_display = 'Structure of thoracic vertebral column (body structure)'
where id = 83 ;


select * from icu_copra.body_temperatur bt
where id = 84;

update icu_copra.body_temperatur 
set --profil_canonical = profil_canonical||'koerpertemperatur-lendenwirbelsaeule',
  loinc_display = 'Body temperature',
  snomed_display = 'Temperature of lumbar spine (observable entity)',
  body_site_coding_code = '122496007',
  body_site_coding_display = 'Structure of lumbar vertabral column (body structure)'
where id = 84 ;


select * from icu_copra.body_temperatur bt
where id = 85;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-gelenk',
  --loinc_display = 'Body temperature',
  snomed_display = 'Temperature of joint (observable entity)',
  body_site_coding_code = '39352004',
  body_site_coding_display = 'Joint structure (body structure)'
where id = 85 ;


select * from icu_copra.body_temperatur bt
where id = 86;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-stirn',
  --loinc_display = 'Body temperature',
  snomed_display = 'Temperature of forehead (observable entity)',
  body_site_coding_code = '52795006',
  body_site_coding_display = 'Forehead structure (body structure)'
where id = 86 ;


select * from icu_copra.body_temperatur bt
where id = 87;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-halswirbelsaeule',
  --loinc_display = 'Body temperature',
  snomed_display = 'Temperature of cervical spine (observable entity)',
  body_site_coding_code = '122494005',
  body_site_coding_display = 'Structure of cervical vertebral column (body structure)'
where id = 87;


select * from icu_copra.body_temperatur bt
where id = 88;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-brust',
  --loinc_display = 'Body temperature',
  snomed_display = 'Temperature of breast (observable entity)',
  body_site_coding_code = '76752008',
  body_site_coding_display = 'Breast structure (body structure)'
where id = 88;

update icu_copra.body_temperatur
set profil_canonical = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/koerpertemperatur-brust'
where id = 88;


select * from icu_copra.body_temperatur bt
where id = 89;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-nasal',
  loinc_display = 'Nasal temperature',
  ieee_display = 'Nasal temperature',
  --snomed_display = '',
  body_site_coding_code = '45206002',
  body_site_coding_display = 'Nasal structure (body structure)'
where id = 89;


select * from icu_copra.body_temperatur bt
where id = 90;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-myokard',
  loinc_display = 'Myocardial temperature',
  ieee_display = 'Myocardial temperature',
  --snomed_display = '',
  body_site_coding_code = '74281007',
  body_site_coding_display = 'Myocardium structure (body structure)'
where id = 90;


select * from icu_copra.body_temperatur bt
where id = 91;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-atemwege',
  loinc_display = 'Airway temperature',
  body_site_coding_code = '89187006',
  body_site_coding_display = 'Airway structure (body structure)'
where id = 91;

select * from icu_copra.body_temperatur bt
where id = 92;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-blut',
  loinc_display = 'Blood temperature',
  ieee_display = 'Blood temperature',
  snomed_display = 'Temperature of blood (observable entity)'
  --body_site_coding_code = '',
  --body_site_coding_display = ''
where id = 92;


select * from icu_copra.body_temperatur bt
where id = 93;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-leiste',
  --loinc_display = 'Body temperature',
  snomed_display = 'Estimated core body temperature measured in inguinal region (observable entity)',
  body_site_coding_code = '26893007',
  body_site_coding_display = 'Inguinal region structure (body structure)'
where id = 93;


select * from icu_copra.body_temperatur bt
where id = 94;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-achsel',
  loinc_display = 'Axillary temperature',
  snomed_display = 'Estimated core body temperature measured in axillary region (observable entity)',
  ieee_display = 'Axillary temperature',
  body_site_coding_code = '91470000',
  body_site_coding_display = 'Axillary region structure (body structure)'
where id = 94;


select * from icu_copra.body_temperatur bt
where id = 95;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-unter-der-zunge',
  loinc_display = 'Oral temperature',
  snomed_display = 'Core body temperature measured in sublingual space (observable entity)',
  ieee_display = 'Oral temperature',
  body_site_coding_code = '123851003',
  body_site_coding_display = 'Mouth region structure (body structure)'
where id = 95;


select * from icu_copra.body_temperatur bt
where id = 96;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-vaginal',
  --loinc_display = '',
  snomed_display = 'Core body temperature measured vaginally (observable entity)',
  --ieee_display = '',
  body_site_coding_code = '76784001',
  body_site_coding_display = 'Vaginal structure (body structure)'
where id = 96;

select * from icu_copra.body_temperatur bt
where id = 97;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-harnblase',
  loinc_display = 'Body temperature - Urinary bladder',
  snomed_display = 'Core body temperature measured at urinary bladder (observable entity)',
  --ieee_display = '',
  body_site_coding_code = '89837001',
  body_site_coding_display = 'Urinary bladder structure (body structure)'
where id = 97;

select * from icu_copra.body_temperatur bt
where id = 98;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-nasen-rachen-raum',
  --loinc_display = '',
  snomed_display = '"Core body temperature measured in nasopharynx (observable entity)',
  --ieee_display = '',
  body_site_coding_code = '71836000',
  body_site_coding_display = 'Nasopharyngeal structure (body structure)'
where id = 98;

update icu_copra.body_temperatur 
set snomed_display = 'Core body temperature measured in nasopharynx (observable entity)'
where id = 98;

select * from icu_copra.body_temperatur bt
where id = 99;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-speiseroehre',
  loinc_display = 'Esophageal temperature',
  snomed_display = 'Core body temperature measured in esophagus (observable entity)',
  --ieee_display = '',
  body_site_coding_code = '32849002',
  body_site_coding_display = 'Esophageal structure (body structure)'
where id = 99;

select * from icu_copra.body_temperatur bt
where id = 100;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-rektal',
  loinc_display = 'Rectal temperature',
  snomed_display = 'Core body temperature measured in rectum (observable entity)',
  ieee_display = 'Rectal temperature',
  body_site_coding_code = '34402009',
  body_site_coding_display = 'Rectum structure (body structure)'
where id = 100;

select * from icu_copra.body_temperatur bt
where id = 101;

update icu_copra.body_temperatur 
set profil_canonical = profil_canonical||'koerpertemperatur-trommelfell',
  loinc_display = 'Tympanic membrane temperature',
  snomed_display = 'Core body temperature measured at tympanic membrane (observable entity)',
  --ieee_display = '',
  body_site_coding_code = '42859004',
  body_site_coding_display = 'Tympanic membrane structure (body structure)'
where id = 101;

