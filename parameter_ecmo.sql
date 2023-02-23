/*
alter table icu_copra.parameter_ecmo 
  drop column analyzed;

 alter table icu_copra.parameter_ecmo   
   add column unit_code varchar,
   add column profil_canonical varchar default 'https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/',
   add column code_coding_display varchar,
   add column category_coding_system varchar default 'http://snomed.info/sct',
   add column cotegory_cding_display varchar default 'Extracorporeal circulation procedure (procedure)',
   add column category_coding_code varchar default '182744004'; 
   
update icu_copra.parameter_ecmo 
set unit_code = unit;  

alter table icu_copra.parameter_ecmo 
  add column loinc_system varchar default 'http://loinc.org',
  add column loinc_display varchar,
  add column snomed_system varchar default 'http://snomed.info/sct',
  add column snomed_dysplay varchar,
  add column ieee_system varchar default 'urn:iso:std:iso:11073:10101',
  add column ieee_display varchar;
  
  
alter table icu_copra.parameter_ecmo 
  drop column code_coding_display;
 */

 
  

select * from icu_copra.parameter_ecmo pe
where id = 4 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'blutfluss-cardiovasculaeres-geraet',
  code_coding_display = 'Rate of blood flow through cardiovascular device (observable entity)'
where id = 4;


select * from icu_copra.parameter_ecmo pe
where id = 5 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'ionisiertes-kalzium-nierenersatzverfahren',
  code_coding_display = 'Calcium.ionized [Moles/volume] in Blood drawn from CRRT circuit'
where id = 5;


select * from icu_copra.parameter_ecmo pe
where id = 6 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'sauerstoffgasfluss',
  code_coding_display = ''
where id = 6;