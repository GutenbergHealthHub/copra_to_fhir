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
   
update icu_copra.parameter_ecmo
  set loinc_system = null where loinc isnull; 
 
update icu_copra.parameter_ecmo
  set snomed_system = null where snomed isnull;
 
update icu_copra.parameter_ecmo
  set ieee_system = null where ieee isnull; 
  
  alter table icu_copra.parameter_ecmo 
rename snomed_dysplay to snomed_display;

alter table icu_copra.parameter_ecmo 
  drop column loinc_short_name;
 */


select * from icu_copra.parameter_ecmo pe
where id = 4 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'blutfluss-cardiovasculaeres-geraet',
  code_coding_display = 'Rate of blood flow through cardiovascular device (observable entity)'
where id = 4;

update icu_copra.parameter_ecmo 
set snomed_dysplay = 'Rate of blood flow through cardiovascular device (observable entity)'
where id = 4;


select * from icu_copra.parameter_ecmo pe
where id = 5 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'ionisiertes-kalzium-nierenersatzverfahren',
  code_coding_display = 'Calcium.ionized [Moles/volume] in Blood drawn from CRRT circuit'
where id = 5;

update icu_copra.parameter_ecmo 
set loinc_display = 'Calcium.ionized [Moles/volume] in Blood drawn from CRRT circuit'
where id = 5;


select * from icu_copra.parameter_ecmo pe
where id = 6 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'sauerstoffgasfluss',
  snomed_dysplay = 'Gas flow rate (v) (observable entity)',
  loinc_display = 'Oxygen gas flow Oxygen delivery system'
where id = 6;


select * from icu_copra.parameter_ecmo pe
where id = 7 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'dauer-haemodialysesitzung',
  snomed_dysplay = 'Duration of hemodialysis session (observable entity)'
where id = 7;


select * from icu_copra.parameter_ecmo pe
where id = 8 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'haemodialyse-blutfluss',
  snomed_dysplay = 'Hemodialysis blood flow (observable entity)'
where id = 8;


select * from icu_copra.parameter_ecmo pe
where id = 9 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'substituatfluss',
  snomed_display = 'Substitution flow rate (observable entity)'
where id = 9;


select * from icu_copra.parameter_ecmo pe
where id = 10 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'substituatvolumen',
  snomed_display = 'Substitution volume (observable entity)'
where id = 10;


select * from icu_copra.parameter_ecmo pe
where id = 11 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'dauer-extrakorporaler-gasaustausch',
  snomed_display = 'Extracorporeal gas exchange duration (observable entity)'
where id = 11;


select * from icu_copra.parameter_ecmo pe
where id = 12 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'blutfluss-extrakorporaler-gasaustausch',
  snomed_display = 'Extracorporeal gas exchange flow rate (observable entity)'
where id = 12;


select * from icu_copra.parameter_ecmo pe
where id = 13 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'blutflussindex-extrakorporaler-gasaustausch',
  snomed_display = 'Extracorporeal gas exchange flow index (observable entity)'
where id = 13;

select * from icu_copra.parameter_ecmo pe
where id = 14 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'venoeser-druck',
  snomed_display = 'Venous pressure (observable entity)'
where id = 14;


select * from icu_copra.parameter_ecmo pe
where id = 15 ;

update icu_copra.parameter_ecmo 
set profil_canonical = profil_canonical||'arterieller-druck',
  snomed_display = 'Arterial blood pressure (observable entity)'
where id = 15;


select distinct unit from icu_copra.parameter_ecmo pe; 

update icu_copra.parameter_ecmo 
  set unit = 'hour' where unit = 'h';
  
update icu_copra.parameter_ecmo 
  set unit = 'liter' where unit = 'L';
  
update icu_copra.parameter_ecmo 
  set unit = 'liter per minute' where unit = 'L/min'; 
  
update icu_copra.parameter_ecmo 
  set unit = 'liter per minute per square meter' where unit = 'L/(min.m2)'; 
  
update icu_copra.parameter_ecmo 
  set unit = 'milliliter per hour' where unit = 'mL/h';
  
update icu_copra.parameter_ecmo 
  set unit = 'millimeter of mercury' where unit = 'mm[Hg]'; 
  
update icu_copra.parameter_ecmo 
  set unit = 'millimole per liter' where unit = 'mmol/L'; 