create or replace view icu_copra.v_python_match
as
select distinct 
  p.profiles, 
  p.loinc_short_name,
  v."name",
  v.description,
  c.score_set
from icu_copra.fhir_profiles_all p
join icu_copra.python_match c
  on p.profiles = c.profile_names_loinc_short_names or p.loinc_short_name = c.profile_names_loinc_short_names 
join icu_copra.copra_config_vars v
  on v.description = c.copra_names_descriptions or v."name" = c.copra_names_descriptions
where v.parent in (1, 20)
and v.co6_config_variabletypes_id in (3, 6, 12)
order by c.score_set desc, 
p.profiles
;

select * from icu_copra.v_python_match vpm where vpm.score_set = 100;

select * from icu_copra.copra_config_vars ccv order by id_syst;

