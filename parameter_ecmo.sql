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
 */

select * from icu_copra.parameter_ecmo pe
where profiles in ;