--create or replace view icu_copra.v_python_match
--as
select distinct 
  p.profiles, 
  p.loinc_short_name,
  v."name",
  v.description,
  c.score_set
  --into icu_copra.python_match
from icu_copra.fhir_profiles_all p
join icu_copra.python_match_tmp c
  on p.profiles = c.profile_names_loinc_short_names or p.loinc_short_name = c.profile_names_loinc_short_names 
join icu_copra.copra_config_vars v
  on v.description = c.copra_names_descriptions or v."name" = c.copra_names_descriptions
where v.parent in (1, 20)
and v.co6_config_variabletypes_id in (3, 6, 12)
and not c.deleted
order by c.score_set desc, 
p.profiles
;

--truncate icu_copra.python_match;

-- Procedure

-- update icu_copra.python_match set deleted = true where profile_names_loinc_short_names = 'Extrakorporale Verfahren';
-- update icu_copra.python_match set deleted = true where profile_names_loinc_short_names = 'Beatmung';

-- DeviceMetric
-- update icu_copra.python_match set deleted = true where profile_names_loinc_short_names = 'Eingestellte und gemessene Parameter';


select * from icu_copra.v_python_match vpm where vpm.score_set > 89;


-- Arterieller Druck
select * from icu_copra.python_match where profiles = 'Arterieller Druck';

update icu_copra.python_match set deleted = true where profiles = 'Arterieller Druck' and ("name" <> 'PICCO_ABP' or name not like '%artDruck');
update icu_copra.python_match set deleted = true where name = 'PICCO_ABP' and score_set <> 100; 


-- Atemfrequenz
select * from icu_copra.python_match pm where profiles = 'Atemfrequenz' order by score_set desc;

update icu_copra.python_match 
set deleted = true where profiles = 'Atemfrequenz' and name not in ('Beatmung_MS_Pallas_Frequenz', 'Beatmung_MS_BiPAPV_AF', 
  'Beatmung_MS_Evita2_frequenz', 'Beatmung_MS_VisionA_BreathRate', 'Beatmung_MS_Avea_Frequenz', 'P_Beatmung_MS_C3_fTotal', 
  'Beatmung_MS_T1_fTotal', 'AF');

-- Blutdruck
select * from icu_copra.python_match pm where profiles = 'Blutdruck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Blutdruck' and name not in ('P_NBP_reArm',
  'P_NBP_reBein', 'NBP_1', 'NBP', 'P_NBP_liBein', 'P_NBP_liArm');
 

-- Dynamische Kompliance
select * from icu_copra.python_match pm where profiles = 'Dynamische Kompliance' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Dynamische Kompliance' and name not in (
  'Beatmung_Messung_Compliance', 'Beatmung_MS_Evita2_Compliance', 'Beatmung_MS_Evita4_Compliance'
);


-- Herzfrequenz
select * from icu_copra.python_match pm where profiles = 'Herzfrequenz' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Herzfrequenz' and name not in (
  'HF', 'PICCO_HF'
);



-- Herzzeitvolumen
select * from icu_copra.python_match pm where profiles = 'Herzzeitvolumen' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Herzzeitvolumen' and name not in (
  'HZV', 'PICCO_HZV', 'VigilanceC_HZV'
);


-- Inspiratorische Sauerstofffraktion gemessen
select * from icu_copra.python_match pm where profiles = 'Inspiratorische Sauerstofffraktion gemessen' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Inspiratorische Sauerstofffraktion gemessen' and name not in (
  'Beatmung_Messung_FiO2', 'Beatmung_MS_Avea_FiO2', 'Beatmung_MS_Evita4_FiO2', 'Beatmung_MS_Pallas_O2_insp'
);


-- Intrakranieller Druck ICP
select * from icu_copra.python_match pm where profiles = 'Intrakranieller Druck ICP' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Intrakranieller Druck ICP' and name not in (
  'ICP', 'ICP1'
);


-- Kopfumfang
select * from icu_copra.python_match pm where profiles = 'Kopfumfang' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Kopfumfang' and name not in (
  'COPRA_Patient_Kopfumfang', 'Patient_Kopfumfang', 'Patient_Kopfumfang_Aufnahme', 'Patient_Kopfumfang_bit'
);


-- Körpergewicht
select * from icu_copra.python_match pm where profiles = 'Körpergewicht' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Körpergewicht' and name not in (
  'Patient_Gewicht'
);


-- Körpertemperatur Generisch
select * from icu_copra.python_match pm where profiles = 'Körpertemperatur Generisch' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Körpertemperatur Generisch' and name not in (
  'T_K', 'T_K2'
);


-- Linksventrikulaeres Schlagvolumen
select * from icu_copra.python_match pm where profiles = 'Linksventrikulaeres Schlagvolumen' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Linksventrikulaeres Schlagvolumen';


-- Linksventrikulärer Herzindex
select * from icu_copra.python_match pm where profiles = 'Linksventrikulärer Herzindex' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Linksventrikulärer Herzindex';


-- Puls
select * from icu_copra.python_match pm where profiles = 'Puls' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Puls' and "name" not in (
  'Puls'
);


-- Sauerstoffsättigung im art. Blut durch Pulsoxymetrie
select * from icu_copra.python_match pm where profiles = 'Sauerstoffsättigung im art. Blut durch Pulsoxymetrie' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Sauerstoffsättigung im art. Blut durch Pulsoxymetrie';


-- Sauerstoffsättigung im Blut preduktal durch Pulsoxymetrie
select * from icu_copra.python_match pm where profiles = 'Sauerstoffsättigung im Blut preduktal durch Pulsoxymetrie' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Sauerstoffsättigung im Blut preduktal durch Pulsoxymetrie';


-- Spontane-Atemfrequenz-Beatmet
select * from icu_copra.python_match pm where profiles = 'Spontane-Atemfrequenz-Beatmet' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Spontane-Atemfrequenz-Beatmet' and "name" not in (
  'Beatmung_MS_G5_fspontan', 'Beatmung_MS_T1_fSpontan', 'P_Beatmung_MS_C3_fSpontan'
);


--Substituatvolumen
select * from icu_copra.python_match pm where profiles = 'Substituatvolumen' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Substituatvolumen' and "name" not in (
  'Nierenersatzverfahren_VO_SubstituatVolumen', 'Nierenersatzverfahren_Mess_SubstituatVolumen'
);


-- Venöser Druck
select * from icu_copra.python_match pm where profiles = 'Venöser Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Venöser Druck' and "name" not in (
  'Nierenverfahren_MS_Multi_venDruck'
);


-- Zentralvenöser Druck
select * from icu_copra.python_match pm where profiles = 'Zentralvenöser Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Zentralvenöser Druck' and "name" not in (
  'ZVD', 'PICCO_ZVD'
);


-- Rechtsatrialer Druck
select * from icu_copra.python_match pm where profiles = 'Rechtsatrialer Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Rechtsatrialer Druck' and "name" not in (
  'RAP1', 'RAP'
);


-- Linksatrialer Druck
select * from icu_copra.python_match pm where profiles = 'Linksatrialer Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Linksatrialer Druck' and "name" not in (
  'LAP1', 'LAP'
);


-- Pulmonalvaskulärer Widerstandsindex
select * from icu_copra.python_match pm where profiles = 'Pulmonalvaskulärer Widerstandsindex' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Pulmonalvaskulärer Widerstandsindex' and "name" not in (
  'VigilanceC_PVRI', 'PVRI'
);


-- Positiv-endexpiratorischer Druck
select * from icu_copra.python_match pm where profiles = 'Positiv-endexpiratorischer Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Positiv-endexpiratorischer Druck' and "name" not in (
  'Beatmung_Einstellung_PEEP', 'Beatmung_MS_Evita4_PEEP', 'Beatmung_MS_Evita2_Ppeep', 'Beatmung_Anordnung_PEEP', 'Beatmung_MS_VisionA_PEEP', 'Beatmung_ES_Leoni_PEEP', 'Beatmung_ES_Servoi_PEEP'
);


-- Pulmonalvaskulärer Widerstandsindex
select * from icu_copra.python_match pm where profiles = 'Pulmonalvaskulärer Widerstandsindex' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Pulmonalvaskulärer Widerstandsindex' and "name" not in (
  'VigilanceC_PVRI', 'PVRI'
);


-- Pulmonalarterieller Blutdruck
select * from icu_copra.python_match pm where profiles = 'Pulmonalarterieller Blutdruck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Pulmonalarterieller Blutdruck' and "name" not in (
  'PAP'
);


-- Linksventrikulärer Druck
select * from icu_copra.python_match pm where profiles = 'Linksventrikulärer Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Linksventrikulärer Druck' and "name" not in (
  'LVP'
);


-- Körpertemperatur rektal
select * from icu_copra.python_match pm where profiles = 'Körpertemperatur rektal' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Körpertemperatur rektal' and "name" not in (
  'P_Temperatur_Rektal'
);


-- Unterstützungsdruck Beatmung
select * from icu_copra.python_match pm where profiles = 'Unterstützungsdruck Beatmung' order by score_set desc;
--select * from icu_copra.python_match pm where "name" like '%Psupport%'
update icu_copra.python_match set deleted = true where profiles = 'Unterstützungsdruck Beatmung' and "name" not in (
  'Beatmung_ES_T1_Psupport', 'Beatmung_ES_G5_Psupport', 'Beatmung_ES_Servoi_Psupport', 'Beatmung_Einstellung_Psupport', 'Beatmung_ES_Heimbeatmung_Psupport'
);


-- Intrakranieller Druck ICP
select * from icu_copra.python_match pm where profiles = 'Intrakranieller Druck ICP' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Intrakranieller Druck ICP' and "name" not in (
  'ICP1', 'P_CSF_MS_LiqouGuard_ICP', 'ICP'
);


-- Ionisiertes Kalzium aus Nierenersatzverfahren
select * from icu_copra.python_match pm where profiles = 'Ionisiertes Kalzium aus Nierenersatzverfahren' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Ionisiertes Kalzium aus Nierenersatzverfahren' and "name" not in (
  'Nierenersatzverfahren_Mess_CalciumFluss', 'Nierenersatzverfahren_VO_Calcium', 'Nierenersatzverfahren_VO_CalciumLoesung', 'Nierenverfahren_ES_Multi_CalciumFiltrat', 
  'Nierenverfahren_MS_Multi_Calciumfluss', 'Nierenverfahren_VO_Multi_Calcium'
);


-- Inspiratorische Sauerstofffraktion gemessen
select * from icu_copra.python_match pm where profiles = 'Inspiratorische Sauerstofffraktion gemessen' order by score_set desc;

update icu_copra.python_match set deleted = false where profiles = 'Inspiratorische Sauerstofffraktion gemessen' and "name" in (
  'CardioHelpMaquet_VO_FiO2', 'Beatmung_ES_Zephyros_FIO2', 'CardioHelpMaquet_ES_FiO2'
);



-- Arterieller Druck
select * from icu_copra.python_match pm where profiles = 'Arterieller Druck' order by score_set desc;

update icu_copra.python_match set deleted = false where profiles = 'Arterieller Druck' and "name" in (
  'Nierenverfahren_MS_Multi_artDruck'
);


-- Intrakranieller Druck ICP
select * from icu_copra.python_match pm where profiles = 'Intrakranieller Druck ICP' order by score_set desc;

update icu_copra.python_match set deleted = false where profiles = 'Intrakranieller Druck ICP' and "name" in (
  'P_CSF_MS_LiqouGuard_ICP'
);


-- Atemwegsdruck bei mittlerem expiratorischem Gasfluss
select * from icu_copra.python_match pm where profiles = 'Atemwegsdruck bei mittlerem expiratorischem Gasfluss' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Atemwegsdruck bei mittlerem expiratorischem Gasfluss';


-- Atemwegsdruck bei null expiratorischem Gasfluss
select * from icu_copra.python_match pm where profiles = 'Atemwegsdruck bei null expiratorischem Gasfluss' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Atemwegsdruck bei mittlerem expiratorischem Gasfluss';



select * from icu_copra.python_match pm where profiles = 'Arterieller Druck';
update icu_copra.fhir_profiles_all set analyzed = true where id = 15;

select * from icu_copra.python_match pm where profiles = 'Atemfrequenz';
update icu_copra.fhir_profiles_all set analyzed = true where id = 51;

select * from icu_copra.python_match pm where profiles = 'Atemwegsdruck bei mittlerem expiratorischem Gasfluss';
update icu_copra.fhir_profiles_all set analyzed = true where id = 22;


select * from icu_copra.python_match pm where profiles = 'Atemwegsdruck bei null expiratorischem Gasfluss';
update icu_copra.fhir_profiles_all set analyzed = true where id = 21;


select * from icu_copra.python_match pm where profiles = 'Atemzugvolumen-Einstellung';

-- Atemzugvolumen-Einstellung
select * from icu_copra.python_match pm where profiles = 'Atemzugvolumen-Einstellung' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Atemzugvolumen-Einstellung' and "name" not in (
  'Beatmung_ES_Heimbeatmung_Vt', 'Beatmung_ES_T1_Vt', 'Beatmung_Einstellung_VT', 'Beatmung_ES_G5_Vt', 'Beatmung_ES_Evita4_Vt', 'Beatmung_ES_Evita2_Vt'
  'Beatmung_ES_VisionA_Vt'
);


-- Atemzugvolumen-Waehrend-Beatmung
select * from icu_copra.python_match pm where profiles = 'Atemzugvolumen-Waehrend-Beatmung' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Atemzugvolumen-Waehrend-Beatmung';


-- Beatmungsvolumen-Pro-Minute-Machineller-Beatmung
select * from icu_copra.python_match pm where profiles = 'Beatmungsvolumen-Pro-Minute-Machineller-Beatmung' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Atemzugvolumen-Einstellung' and "name" not in (
  'Beatmung_ES_Heimbeatmung_Vt', 'Beatmung_ES_T1_Vt', 'Beatmung_Einstellung_VT', 'Beatmung_ES_G5_Vt', 'Beatmung_ES_Evita4_Vt', 'Beatmung_ES_Evita2_Vt'
  'Beatmung_ES_VisionA_Vt'
);



update icu_copra.fhir_profiles_all set analyzed = true where id = 16;


select * from icu_copra.fhir_profiles_all fpa where not analyzed order by profiles ;

