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


-- K??rpergewicht
select * from icu_copra.python_match pm where profiles = 'K??rpergewicht' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'K??rpergewicht' and name not in (
  'Patient_Gewicht'
);


-- K??rpertemperatur Generisch
select * from icu_copra.python_match pm where profiles = 'K??rpertemperatur Generisch' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'K??rpertemperatur Generisch' and name not in (
  'T_K', 'T_K2'
);


-- Linksventrikulaeres Schlagvolumen
select * from icu_copra.python_match pm where profiles = 'Linksventrikulaeres Schlagvolumen' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Linksventrikulaeres Schlagvolumen';


-- Linksventrikul??rer Herzindex
select * from icu_copra.python_match pm where profiles = 'Linksventrikul??rer Herzindex' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Linksventrikul??rer Herzindex';


-- Puls
select * from icu_copra.python_match pm where profiles = 'Puls' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Puls' and "name" not in (
  'Puls'
);


-- Sauerstoffs??ttigung im art. Blut durch Pulsoxymetrie
select * from icu_copra.python_match pm where profiles = 'Sauerstoffs??ttigung im art. Blut durch Pulsoxymetrie' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Sauerstoffs??ttigung im art. Blut durch Pulsoxymetrie';


-- Sauerstoffs??ttigung im Blut preduktal durch Pulsoxymetrie
select * from icu_copra.python_match pm where profiles = 'Sauerstoffs??ttigung im Blut preduktal durch Pulsoxymetrie' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Sauerstoffs??ttigung im Blut preduktal durch Pulsoxymetrie';


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


-- Ven??ser Druck
select * from icu_copra.python_match pm where profiles = 'Ven??ser Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Ven??ser Druck' and "name" not in (
  'Nierenverfahren_MS_Multi_venDruck'
);


-- Zentralven??ser Druck
select * from icu_copra.python_match pm where profiles = 'Zentralven??ser Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Zentralven??ser Druck' and "name" not in (
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


-- Pulmonalvaskul??rer Widerstandsindex
select * from icu_copra.python_match pm where profiles = 'Pulmonalvaskul??rer Widerstandsindex' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Pulmonalvaskul??rer Widerstandsindex' and "name" not in (
  'VigilanceC_PVRI', 'PVRI'
);


-- Positiv-endexpiratorischer Druck
select * from icu_copra.python_match pm where profiles = 'Positiv-endexpiratorischer Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Positiv-endexpiratorischer Druck' and "name" not in (
  'Beatmung_Einstellung_PEEP', 'Beatmung_MS_Evita4_PEEP', 'Beatmung_MS_Evita2_Ppeep', 'Beatmung_Anordnung_PEEP', 'Beatmung_MS_VisionA_PEEP', 'Beatmung_ES_Leoni_PEEP', 'Beatmung_ES_Servoi_PEEP'
);


-- Pulmonalvaskul??rer Widerstandsindex
select * from icu_copra.python_match pm where profiles = 'Pulmonalvaskul??rer Widerstandsindex' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Pulmonalvaskul??rer Widerstandsindex' and "name" not in (
  'VigilanceC_PVRI', 'PVRI'
);


-- Pulmonalarterieller Blutdruck
select * from icu_copra.python_match pm where profiles = 'Pulmonalarterieller Blutdruck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Pulmonalarterieller Blutdruck' and "name" not in (
  'PAP'
);


-- Linksventrikul??rer Druck
select * from icu_copra.python_match pm where profiles = 'Linksventrikul??rer Druck' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Linksventrikul??rer Druck' and "name" not in (
  'LVP'
);


-- K??rpertemperatur rektal
select * from icu_copra.python_match pm where profiles = 'K??rpertemperatur rektal' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'K??rpertemperatur rektal' and "name" not in (
  'P_Temperatur_Rektal'
);


-- Unterst??tzungsdruck Beatmung
select * from icu_copra.python_match pm where profiles = 'Unterst??tzungsdruck Beatmung' order by score_set desc;
--select * from icu_copra.python_match pm where "name" like '%Psupport%'
update icu_copra.python_match set deleted = true where profiles = 'Unterst??tzungsdruck Beatmung' and "name" not in (
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


select * from icu_copra.python_match pm where profiles = 'Blutfluss extrakorporaler Gasaustausch';

-- Atemzugvolumen-Einstellung
select * from icu_copra.python_match pm where profiles = 'Atemzugvolumen-Einstellung' order by score_set desc;

update icu_copra.python_match set deleted = true where profiles = 'Blutfluss extrakorporaler Gasaustausch';-- and "name" not in (
  'Beatmung_ES_Heimbeatmung_Vt', 'Beatmung_ES_T1_Vt', 'Beatmung_Einstellung_VT', 'Beatmung_ES_G5_Vt', 'Beatmung_ES_Evita4_Vt', 'Beatmung_ES_Evita2_Vt'
  'Beatmung_ES_VisionA_Vt'
);


-- Substituatfluss
update icu_copra.python_match set deleted = true where profiles = 'Substituatfluss' and "name" not in (
  'Nierenverfahren_VO_Multi_Substituat', 'Nierenverfahren_ES_Multi_Substituat', 'Nierenverfahren_ES_BM25_Umsatz'
);

update icu_copra.python_match set deleted = true where profiles = 'Spontane-Mechanische-Atemfrequenz-Beatmet';



select * from icu_copra.python_match pm where profiles = 'K??rpertemperatur Generisch' order by score_set desc;

update icu_copra.python_match set deleted = false where profiles = 'K??rpertemperatur Generisch' and name in (
  'P_Temperatur_generic', 'T_K', 'P_Temperatur_Naso', 'P_Temperatur_Venoes', 'P_Temperatur_Haut', 'P_Temperatur_Kern', 'P_Temperatur_Oesophagial', 'P_Temperatur_Arteriell'
);


update icu_copra.fhir_profiles_all set analyzed = false;




select count(*) from icu_copra.python_match pm where not deleted;

select profiles, loinc_short_name, name, description into icu_copra.matched_0 from icu_copra.python_match pm where not deleted order by profiles ;

select * from icu_copra.thesis_matched;



-- Arterieller Druck
select name, description from icu_copra.copra_config_vars ccv 
where (name ~* 'arterieller druck' or description ~* 'arterieller druck');

-- Atemfrequenz
select name, description from icu_copra.copra_config_vars ccv 
where (name ~* 'atemfrequenz | res.+ate' or description ~* 'atemfrequenz | res.+ate');


-- Atemwegsdruck bei mittlerem expiratorischem Gasfluss
select 'Atemwegsdruck bei mittlerem expiratorischem Gasfluss' profil, name, description from icu_copra.copra_config_vars ccv 
where (name ~* 'druck|pres|expir|ausat|flu|flow' or description ~* 'druck|pres|expir|ausat|flu|flow');

-- Atemwegsdruck bei null expiratorischem Gasfluss
select 'Atemwegsdruck bei null expiratorischem Gasfluss' profil, name, description from icu_copra.copra_config_vars ccv 
where (name ~* 'druck|pres|expir|ausat|flu|flow|null' or description ~* 'druck|pres|expir|ausat|flu|flow|null');


-- Atemzugvolumen-Einstellung
select 'Atemzugvolumen-Einstellung' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'atem|volu|einst' or description ~* 'atem|volu|einst')
order by description, name;


-- Atemzugvolumen-Waehrend-Beatmung
select 'Atemzugvolumen-Waehrend-Beatmung' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'atem|vol' or description ~* 'atem|vol')
and (name !~* 'einst|einges' or description !~* 'einst|einges')
and (unit isnull or unit ~* 'l')
order by description, name;


-- Beatmungsvolumen-Pro-Minute-Machineller-Beatmung
select 'Beatmungsvolumen-Pro-Minute-Machineller-Beatmung' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'machi|minu|vol' or description ~* 'machi|minu|vol')
and (name !~* 'einst|einges' or description !~* 'einst|einges')
and (unit isnull or unit ~* 'l|min')
order by description, name;

-- Beatmung_MS_Evita2_AMV, Beatmung_MS_Evita4_MV, Beatmung_MS_Pallas_MV
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_MS_Evita2_AMV', 'Beatmung_MS_Evita4_MV', 'Beatmung_MS_Pallas_MV') and fpa.id = '37'



-- Beatmungszeit auf hohem Druck
select 'Beatmungszeit auf hohem Druck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'time|zeit|hei|hoc|press|druc' or description ~* 'time|zeit|hei|hoc|press|druc')
and (name !~* 'niere|sicher|ernae|tabell|dekanu|praem|patient|score|nev' or description !~* 'niere')
and (unit isnull or unit ~* 'min|s')
order by description, name;

--Beatmung_ES_Avea_ZeitHoch, Beatmung_ES_Evita4_Thoch, Beatmung_ES_Servoi_Thoch

-- Beatmungszeit auf hohem Druck
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_ES_Avea_ZeitHoch', 'Beatmung_ES_Evita4_Thoch', 'Beatmung_ES_Servoi_Thoch') and fpa.id = 35



-- Beatmungszeit auf niedrigem Druck
select 'Beatmungszeit auf niedrigem Druck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'time|zeit|low|nied|press|druc' or description ~* 'time|zeit|low|nied|press|druc')
and (name !~* 'niere|sicher|ernae|tabell|dekanu|praem|patient|score|nev' or description !~* 'niere')
and (unit isnull or unit ~* 'min|s')
order by description, name;

-- Beatmungszeit auf niedrigem Druck
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_ES_Evita4_Ttief', 'Beatmung_ES_Avea_ZeitNiedrig', 'Beatmung_ES_Servoi_Tpeep') and fpa.id = 34



-- Blutfluss durch cardiovascul??res Ger??t
select 'Blutfluss durch cardiovascul??res Ger??t' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'blod|blut|flus|flow|card' or description ~* 'blod|blut|flus|flow|card')
and (name !~* 'beatmun|druck' or description !~* 'beatmu|druck')
and (unit isnull or unit ~* 'l|min|s')
order by description, name;

-- Blutfluss durch cardiovascul??res Ger??t
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('CardioHelpMaquet_MS_Blutfluss', 'CardioHelpMaquet_VO_Blutfluss') and fpa.id = 4



-- Blutfluss extrakorporaler Gasaustausch
select 'Blutfluss extrakorporaler Gasaustausch' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'blod|blut|flus|flow' or description ~* 'blod|blut|flus|flow')
and (name !~* 'druck' or description !~* 'druck')
and (unit isnull or unit ~* 'l|min|s')
order by description, name;

-- Blutfluss extrakorporaler Gasaustausch
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Hemolung_MS_Blutfluss', 'Hemolung_VO_Blutfluss', 'Lungenersatzverfahren_ES_ILAactivve_Blutfluss') and fpa.id = 12



-- Dynamische Kompliance
select 'Dynamische Kompliance' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'plian' or description ~* 'plian')
--and (name !~* 'druck' or description !~* 'druck')
--and (unit isnull or unit ~* 'l|min|s')
order by description, name;

-- Dynamische Kompliance
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_Messung_Compliance', 'Beatmung_MS_Pallas_Cpat', 'Beatmung_MS_Evita2_Compliance', 'Beatmung_MS_Evita4_Compliance') and fpa.id = 25


-- Herzfrequenz
select 'Herzfrequenz' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'hear|herz|freq|rate' or description ~* 'hear|herz|freq|rate')
and (name !~* 'beat|praem|beha|klinik')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'min' or ccv.unit isnull)
order by description, name;




-- Herzzeitvolumen
select 'Herzzeitvolumen' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'hear|herz|lv|time|vol|zeit|hzv' or description ~* 'hear|herz|lv|time|zeit|vol|hzv')
and (name !~* 'beat|praem|beha|klinik|niere|dekan|verl|bele|aufn')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'min' or ccv.unit isnull)
order by description, name;

-- Herzzeitvolumen
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('HZVGeraet_Auswahl', 'HZV_PICCOGeraet', 'HZV_VigilanceCGeraet', 'HZV_VigileoGeraet', 'p-CO') and fpa.id = 69


-- Horowitz-In-Arteriellem-Blut
select 'Horowitz-In-Arteriellem-Blut' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'horo|BldA|IhG|Rto' or description ~* 'hro|BldA|IhG|Rto')
--and (name !~* 'beat|praem|beha|klinik|niere|dekan|verl|bele|aufn')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'hg' or ccv.unit isnull)
order by description, name;


-- Kopfumfang
select 'Kopfumfang' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'kopf|head|circ|ofc' or description ~* 'kopf|head|circ|ofc')
--and (name !~* 'beat|praem|beha|klinik|niere|dekan|verl|bele|aufn')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'cm' or ccv.unit isnull)
order by description, name;


-- K??rpergewicht
select 'K??rpergewicht' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'weight|gewicht' or description ~* 'weight|gewicht')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'kg|g' or ccv.unit isnull)
order by description, name;

-- K??rpergewicht
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Patient_AufnGewicht', 'COPRA_Patient_Bezugsgewicht') and fpa.id = 54



-- Puls
select 'Puls' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'puls' or description ~* 'puls|Herzrhythmus')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'min|s' or ccv.unit isnull)
order by description, name;


-- puls
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Herzrhythmus') and fpa.id = 81

-- Substituatfluss
select 'Substituatfluss' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'sub.+flow|sub.+flus' or description ~* 'sub.+flow|sub.+flus')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l|h|min' or ccv.unit isnull)
order by description, name;


-- Substituatvolumen
select 'Substituatvolumen' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'sub.+vo|sub.+vo' or description ~* 'sub.+vo|sub.+vo')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l' or ccv.unit isnull)
order by description, name;

-- Substituatvolumen
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Nierenersatzverfahren_Einstell_SubstituatVolumen') and fpa.id = 10



-- Linksatrialer Druck
select 'Linksatrialer Druck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'link|left|atri' or description ~* 'link|left|atri')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'l' or ccv.unit isnull)
order by description, name;


-- Sauerstoffgasfluss
select 'Sauerstoffgasfluss' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'o2|sauerst|flow|flus' or description ~* 'o2|sauerst|flow|flus')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l|min|s' or ccv.unit isnull)
order by description, name;

-- Sauerstoffgasfluss
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_Einstellung_SauerstoffFlow', 'Beatmung_ES_Optiflow_O2Flow') and fpa.id = 6
--and ccv.name not in (select name from icu_copra.matched_0 m)



-- Intrakranieller Druck ICP
select 'Intrakranieller Druck ICP' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'intra|cra|kran|icp' or description ~* 'inta|kra|cra|icp')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'l|min|s' or ccv.unit isnull)
order by description, name;

-- Intrakranieller Druck ICP
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Score_TISS10_ICPMessung', 'Score_TISS28_ICPMessung', 'TISS28_TS_ICPMessung') and fpa.id = 50
--and ccv.name not in (select name from icu_copra.matched_0 m)


-- Ven??ser Druck
select 'Ven??ser Druck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'ven' or description ~* 'ven.+dru|ven.+pres')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'hg' or ccv.unit isnull)
order by description, name;

-- Ven??ser Druck
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Nierenverfahren_MS_Multi_venDruck', 'CardioHelpMaquet_MS_DruckVenoes', 'NEV_Apherese_MS_Multil_venDruck', 'NEV_CRRT_MS_Multi_venDruck', 
  'NEV_HD_MS_4008HS_venDruck', 'NEV_HD_MS_4008onl_venDruck', 'Nierenersatzverfahren_Mess_VenDruck', 'Nierenersatzverfahren_Mess_VenoeserDruck'
  , 'Nierenverfahren_MS', 'Nierenverfahren_MS_4008onl_venDruck', 'Nierenverfahren_MS_BM25_venDruck', 'P_ADVOS_MS_ADVOS_venDruck', 'P_NEV_HD_MS_5008onl_venDruck'
  ) and fpa.id = 14;
 
 -- Zentralven??ser Druck
select 'Zentralven??ser Druck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'ven|cvp|zvp' or description ~* 'zent.*ven.+dru|ven.+pres|cvp|zvp')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'hg' or ccv.unit isnull)
order by description, name;



-- K??rpertemperatur Blut
select 'K??rpertemperatur Blut' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'temp' or description ~* 'temp.+blut|blut.+temp')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;

--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('TempBT') and fpa.id = 92;


-- K??rpertemperatur Kern
select 'K??rpertemperatur Kern' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'temp' or description ~* 'temp.+kern|kern.+temp')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;

-- K??rpertemperatur Kern
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('KlinikNervensys_Kerntemperatur_Temp', 'KlinikTemperaturstatus_Kerntemperatur_Kerntemp', 'VerlegPfl_Atm_Koerperkerntemp') and fpa.id = 58;


-- K??rpergroesse
select 'K??rpergroesse' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'body|height|gro|gr??' or description ~* 'body|height|gro|gr??')
--and (name !~* '')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'cm' or ccv.unit isnull)
order by description, name;

-- K??rpergroesse
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Patient_Groesse', 'Patient_AufnGroesse') and fpa.id = 53;



-- Linksventrikul??rer Druck
select 'Linksventrikul??rer Druck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'lin|left|ven|pres|druc' or description ~* 'lin.+ven|left|ven|pres|druc')
and (name !~* 'archiv|beat|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'cm' or ccv.unit isnull)
order by description, name;


-- Linksventrikul??rer Herzindex
select 'Linksventrikul??rer Herzindex' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'lin|left|ventr|inde|hear|herz|lv' or description ~* 'lin.+ven|left|ventr|index|herz|hear')
and (name !~* 'archiv|beat|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'cm' or ccv.unit isnull)
order by description, name;



-- Linksventrikulaeres Schlagvolumen
select 'Linksventrikul??rer Herzindex' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'lin|left|ventr|schla|vol|lv|sv' or description ~* 'lin.+ven|left|ventr|schlagvol|lv|sv')
and (name !~* 'archiv|beat|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'cm' or ccv.unit isnull)
order by description, name;



-- Linksventrikulaeres Schlagvolumenindex
select 'Linksventrikulaeres Schlagvolumenindex' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'lin|left|ventr|schla|vol|lv|svi|ndex' or description ~* 'lin.+ven|left|ventr|schlagvol|lv|svi|dex')
and (name !~* 'archiv|beat|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'cm' or ccv.unit isnull)
order by description, name;


-- Zeitverh??ltnis-Ein-Ausatmung
select 'Zeitverh??ltnis-Ein-Ausatmung' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'time|zeit|ausa|eina|insp|expi' or description ~* 'time|zeit|ausa|eina|insp|expi')
and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul|dekan|hausa')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'cm' or ccv.unit isnull)
order by description, name;


-- Druckdifferenz Beatmung
select 'Druckdifferenz Beatmung' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'press|druck|diffe' or description ~* 'press|druck|diffe')
and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul|dekan|hausa')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'cm|mm' or ccv.unit isnull)
order by description, name;



-- Eingestellter inspiratorischer Gasfluss
select 'Eingestellter inspiratorischer Gasfluss' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'einst|insp|eina|flow|gas|einges|rate' or description ~* 'einst|einges|insp|eina|flow|gas|rate')
and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul|dekan|hausa')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l|min|s' or ccv.unit isnull)
order by description, name;


-- Eingestellter inspiratorischer Gasfluss
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_ES_Evita2_InspFlow', 'Beatmung_Einstellung_Flow') and fpa.id = 33;


--Inspiratorischer Gasfluss 
select 'Inspiratorischer Gasfluss' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'insp|eina|flow|gas|einges|rate' or description ~* 'insp|eina|flow|gas|rate')
and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul|dekan|hausa|einstell')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l|min|s' or ccv.unit isnull)
order by description, name;


--K??rpertemperatur rektal
select 'K??rpertemperatur rektal' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'rect|rekt' or description ~* 'rect|rekt')
--and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul|dekan|hausa|einstell')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;


--K??rpertemperatur vaginal
select 'K??rpertemperatur vaginal' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'vag' or description ~* 'vag')
--and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul|dekan|hausa|einstell')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;


--K??rpertemperatur nasal
select 'K??rpertemperatur nasal' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'naso|nasal' or description ~* 'naso|nasal')
--and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul|dekan|hausa|einstell')
--and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;

-- K??rpertemperatur nasal
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('P_Temperatur_Naso') and fpa.id = 89;



--Maximaler Beatmungsdruck
select 'Maximaler Beatmungsdruck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'max|pres|druck' or description ~* 'max|druck|pres')
and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|^pt_|insul|dekan|hausa|einstell')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'cm|mm' or ccv.unit isnull)
order by description, name;


--K??rpertemperatur Nasen-Rachen-Raum
select 'K??rpertemperatur Nasen-Rachen-Raum' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'temp' or description ~* 'temp')
and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|insul|dekan|hausa|einstell|atmenk|hypot|waerm')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;


--K??rpertemperatur Speiseroehre
select 'K??rpertemperatur Speiseroehre' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'temp' or description ~* 'temp')
and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|insul|dekan|hausa|einstell|atmenk|hypot|waerm')
--and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;

-- K??rpertemperatur Speiseroehre
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('P_Temperatur_Oesophagial') and fpa.id = 99;


--K??rpergewicht Percentil altersabh??ngig
select 'K??rpergewicht Percentil altersabh??ngig' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'perc|perz|gewi|weig' or description ~* 'perc|perz|gewi|weig')
and (name !~* 'archiv|praem|klinik|niere|score|therap|pupill|mikrob|pflege|^nev|befi|behan|insul|dekan|hausa|einstell|atmenk|hypot|waerm|beat')
--and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;


-- K??rpertemperatur Harnblase
select 'K??rpergewicht Percentil altersabh??ngig' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'temp' or description ~* 'temp')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|pflege|befi|behan|insul|dekan|hausa|einstell|atmenk|hypot|waerm')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;



-- K??rpertemperatur Trommelfell
select 'K??rpertemperatur Trommelfell' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'temp' or description ~* 'temp')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|pflege|befi|behan|insul|dekan|hausa|einstell|atmenk|hypot|waerm')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;

-- K??rpertemperatur Trommelfell
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('P_Temperatur_Tympanal') and fpa.id = 101;


-- K??rpertemperatur Leiste
select 'K??rpertemperatur Leiste' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'temp|leiste|ingi' or description ~* 'temp|ingi|leiste')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|pflege|befi|behan|insul|dekan|hausa|einstell|atmenk|hypot|waerm|beat|abrech|einste')
--and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;


-- Ideales K??rpergewicht
select 'Ideales K??rpergewicht' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'ideal' or description ~* 'ideal')
--and (name !~* 'archiv|praem|score|therap|pupill|mikrob|pflege|befi|behan|insul|dekan|hausa|einstell|atmenk|hypot|waerm|beat|abrech|einste')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'kg' or ccv.unit isnull)
order by description, name;


-- Exspiratorischer Gasfluss
select 'Exspiratorischer Gasfluss' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'exps|flow|flus|gas' or description ~* 'exsp|flow|flus|gas')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|pflege|befi|behan|insul|dekan|hausa|nier|hypot|waerm|abrech|^nev|insp|einst')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l|min|s' or ccv.unit isnull)
order by description, name;


-- Inspiratorischer Gasfluss
select 'Inspiratorischer Gasfluss' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'insp|flow|flus|gas' or description ~* 'insp|flow|flus|gas')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|pflege|befi|behan|insul|dekan|hausa|nier|hypot|waerm|abrech|^nev|exsp|einst')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l|min|s' or ccv.unit isnull)
order by description, name;


-- Inspiratorischer Gasfluss
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_Anordnung_Flow') and fpa.id = 32;


-- Unterst??tzungsdruck Beatmung
select 'Unterst??tzungsdruck Beatmung' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'supp|unte.+druc|pres|beat' or description ~* 'unte.+druc|pres|beat|supp')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|pflege|befi|behan|insul|dekan|hausa|nier|hypot|waerm|abrech|^nev|exsp')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'cm|mm' or ccv.unit isnull)
order by description, name;


-- Ionisiertes Kalzium aus Nierenersatzverfahren
select 'Ionisiertes Kalzium aus Nierenersatzverfahren' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'ca|nier|ioni|ka' or description ~* 'ka|ca|nier|ioni')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|pflege|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|o2|citr|flus|beat|medika')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'ol|l' or ccv.unit isnull)
order by description, name;



-- Positiv-endexpiratorischer Druck
select 'Positiv-endexpiratorischer Druck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'ende|peep' or description ~* 'endex|peep')
and (name ~* '^beat')
and ("name" !~* 'cpap|auto|back|dk|du|mac|opti|ppeepi')
--and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'cm|mm' or ccv.unit isnull)
order by description, name;


-- Positiv-endexpiratorischer Druck
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_ES_Avea_PEEP', 'Beatmung_MS_Avea_PEEP', 'Beatmung_MS_VisionA_PEEP',
  'Beatmung_ES_Servoi_PEEP', 'Beatmung_MS_Servoi_PEEP', 'Beatmung_ES_Leoni_PEEP', 'Beatmung_ES_Leoni_PEEP', 
  'Beatmung_Proc_PEEP', 'Beatmung_VO_PEEP') 
and fpa.id = 24;



-- H??modialyse Blutfluss
select 'H??modialyse Blutfluss' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'dialy|flow|flu|blod|blut' or description ~* 'dialy|flow|flu|blod|blut')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|pflege|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|o2|citr|beat|medika|kons|lung')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l|min|s' or ccv.unit isnull)
order by description, name;


-- K??rpertemperatur unter der Zunge
select 'K??rpertemperatur unter der Zunge' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'temp|zung|lingu' or description ~* 'temp|zung|lingu')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|o2|citr|beat|medika|kons|lung|arzt|^nev')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;


-- K??rpertemperatur Myokard
select 'K??rpertemperatur Myokard' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'card|temp|kard|hear|herz' or description ~* 'temp|card|kard|hear|herz')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|o2|citr|beat|medika|kons|lung|arzt|^nev')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;


-- Dauer extrakorporaler Gasaustausch
select 'Dauer extrakorporaler Gasaustausch' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'gas|zeit|dau|extra' or description ~* 'gas|zeit|dau|extra')
--and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|o2|citr|beat|medika|kons|lung|arzt|^nev')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'h' or ccv.unit isnull)
order by description, name;


-- Systemischer vaskul??rer Widerstandsindex
select 'Systemischer vaskul??rer Widerstandsindex' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'sys|svri|dex|resis|widerst' or description ~* 'sys|dex|resis|widerst')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|o2|citr|beat|medika|kons|lung|arzt|^nev|sicher|^klinik|koerp')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'm|s' or ccv.unit isnull)
order by description, name;

-- Systemischer vaskul??rer Widerstandsindex
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('SVRI', 'p-SVRI', 'PICCO_SVRI') and fpa.id = 67;


-- Endexpiratorischer Kohlendioxidpartialdruck
select 'Endexpiratorischer Kohlendioxidpartialdruck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'co2|endex|kohl' or description ~* 'co2|kohl|endex')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|^nev|sicher|^klinik|koerp')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'mm|cm' or ccv.unit isnull)
order by description, name;


-- Exspiratorischer Sauerstoffpartialdruck
select 'Exspiratorischer Sauerstoffpartialdruck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'o2|exs|sauer' or description ~* 'o2|sauer|exsp')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|^nev|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'mm|cm' or ccv.unit isnull)
order by description, name;


-- Sauerstoffs??ttigung im art. Blut durch Pulsoxymetrie
select 'Sauerstoffs??ttigung im art. Blut durch Pulsoxymetrie' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'o2|sao2|oxy' or description ~* 'o2|sao2|oxy')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|^nev|sicher|^klinik|koerp|co2|beat')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'mm|cm' or ccv.unit isnull)
order by description, name;

-- Sauerstoffs??ttigung im art. Blut durch Pulsoxymetrie
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('SaO2') and fpa.id = 61;


-- Sauerstoffs??ttigung im Blut postduktal durch Pulsoxymetrie
select 'Sauerstoffs??ttigung im Blut postduktal durch Pulsoxymetrie' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'o2|sao2|oxy|postd' or description ~* 'o2|sauer|oxy|postdu')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|^nev|sicher|^klinik|koerp|co2|beat')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'mm|cm' or ccv.unit isnull)
order by description, name;


-- Spontanes-Plus-Mechanisches-Atemzugvolumen
select 'Spontanes-Plus-Mechanisches-Atemzugvolumen' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'spon|mech|vol|vt' or description ~* 'spon|mech|volu')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|^nev|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l' or ccv.unit isnull)
order by description, name;

-- Mechanische-Atemfrequenz-Beatmet
select 'Mechanische-Atemfrequenz-Beatmet' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'mech' or description ~* 'mech')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|^nev|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;


-- Rechtsatrialer Druck
select 'Rechtsatrialer Druck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'atri' or description ~* 'atri')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|^nev|sicher|^klinik|koerp|co2|beat')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;


--Rechtsventrikul??rer Druck
select 'Rechtsventrikul??rer Druck' profil, name, description, unit  from icu_copra.copra_config_vars ccv 
where (name ~* 'right|recht|vent|pres|druck' or description ~* 'right|recht|vent|pres|druck')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|nier|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|^nev|sicher|^klinik|koerp|co2|beat')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;


-- Blutflussindex extrakorporaler Gasaustausch
select 'Blutflussindex extrakorporaler Gasaustausch' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'blod|blut|ndex|gas' or description ~* 'blod|blut|ndex|gas')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'm|l' or ccv.unit isnull)
order by description, name;


-- Dauer H??modialysesitzung
select 'Dauer H??modialysesitzung' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'dialy' or description ~* 'dialy')
--and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'h|m' or ccv.unit isnull)
order by description, name;

-- Dauer H??modialysesitzung
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Nierenverfahren_ES_4008HS_DialyseZeit', 'Nierenverfahren_ES_4008onl_Dialysezeit', 'Nierenverfahren_VO_4008HS_Dialysezeit',
'Nierenverfahren_VO_4008onl_Dialysezeit', 'Nierenvwerfahren_ES_4008onl_Dialysezeit') and fpa.id = 7;


-- Sauerstoffs??ttigung im Blut preduktal durch Pulsoxymetrie
select 'Sauerstoffs??ttigung im Blut preduktal durch Pulsoxymetrie' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'predu' or description ~* 'predu')
--and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'h|m' or ccv.unit isnull)
order by description, name;


-- Linksv. Schlagvolumen durch Indikatorverd??nnung
select 'Linksv. Schlagvolumen durch Indikatorverd??nnung' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'schla|lv|sv' or description ~* 'schla')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2|beat')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'l' or ccv.unit isnull)
order by description, name;


-- Pulmonalvaskul??rer Widerstandsindex
select 'Pulmonalvaskul??rer Widerstandsindex' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'pulm|wide|pvri' or description ~* 'pulm|wide|vas')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;


-- Pulmonalarterieller Blutdruck
select 'Pulmonalarterieller Blutdruck' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'pulm|arter|druck' or description ~* 'pulm.+arte.+druck')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;


-- Pulmonalarterieller wedge Blutdruck
select 'Pulmonalarterieller Blutdruck' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'pulm|wedg|druck|paw' or description ~* 'pulm.+wedg.+druck|paw')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;

-- Pulmonalarterieller wedge Blutdruck
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('PWP') and fpa.id = 49;


-- Mittlerer Beatmungsdruck
select 'Mittlerer Beatmungsdruck' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'mitt|mean|druck' or description ~* 'mitt.+druc')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;

-- Mittlerer Beatmungsdruck
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_Messung_Pmean') and fpa.id = 27;


-- Mittlerer Beatmungsdruck
select 'Mittlerer Beatmungsdruck' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'mitt|mean|druck' or description ~* 'mitt.+druc')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;

-- Linksv. Herzindex durch Indikatorverd??nnung
select 'Linksv. Herzindex durch Indikatorverd??nnung' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'lv' or description ~* 'linksv|zeit')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;


-- Einstellung-Ausatmungszeit-Beatmung
select 'Einstellung-Ausatmungszeit-Beatmung' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'einst|exps|ausat' or description ~* 'einges|einst|ausat|exspi|zeit|time')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2|niere|^f')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'm|s' or ccv.unit isnull)
order by description, name;


-- Einstellung-Einatmungszeit-Beatmung
select 'Einstellung-Ausatmungszeit-Beatmung' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'einst|insp|eina' or description ~* 'einges|einst|eina|insp|zeit|time')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2|niere|^f')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'm|s' or ccv.unit isnull)
order by description, name;


-- Einstellung-Einatmungszeit-Beatmung
--insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_ES_VisionA_Ti', 'Beatmung_ES_G5_Ti', 'Beatmung_ES_T1_Ti',
'Beatmung_Einstellung_InspirationszeitIE') and fpa.id = 43;


-- Inspiratorische Sauerstofffraktion gemessen
select 'Inspiratorische Sauerstofffraktion gemessen' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'fio2' or description ~* 'fio2')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2|niere|^f')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'm|s' or ccv.unit isnull)
order by description, name;

-- Inspiratorische Sauerstofffraktion gemessen
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_ES_Zephyros_FIO2') and fpa.id = 29;


-- Inspiratorische Sauerstofffraktion eingestellt
select 'Inspiratorische Sauerstofffraktion gemessen' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'fio2|einst' or description ~* 'fio2|einstel|eingest')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2|niere|^f')
and (name not in (select distinct name from icu_copra.matched_0 m))
--and (ccv.unit ~* 'm|s' or ccv.unit isnull)
order by description, name;

-- Inspiratorische Sauerstofffraktion gemessen
insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('Beatmung_ES_Evita4_O2Konzentration', 'Beatmung_ES_Evita2_O2Konzentration', 'Beatmung_ES_BiPAPV_O2Konzentration',
'Beatmung_ES_F120_O2Konzentration', 'Beatmung_Einstellung_FiO2', 'Beatmung_ES_CF800_O2Konzentration', 'Beatmung_Einstellung_O2Konzentration') and fpa.id = 30;


-- K??rpertermperatur
select 'K??rpertemperatur' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'temp' or description ~* 'temp')
and (name !~* 'praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|co2|niere|^f|beat|^nev|lungen|delta')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'c' or ccv.unit isnull)
order by description, name;


-- Blutdruck
select 'Blutdruck' profil, name, description, unit from icu_copra.copra_config_vars ccv 
where (name ~* 'druck|pres' or description ~* 'blutdru')
and (name !~* 'archiv|praem|score|therap|pupill|mikrob|befi|behan|insul|dekan|hausa|hypot|waerm|abrech|citr|medika|kons|arzt|sicher|^klinik|koerp|o2|gas|^f|beat|lungen|delta')
and (name not in (select distinct name from icu_copra.matched_0 m))
and (ccv.unit ~* 'm' or ccv.unit isnull)
order by description, name;


insert into icu_copra.matched_0 
select fpa.profiles, fpa.loinc_short_name, ccv.name, ccv.description from icu_copra.fhir_profiles_all fpa, icu_copra.copra_config_vars ccv
where ccv.name in ('ABP', 'ABP_1', 'P_NBP_reArm', 'NBP', 'NBP_1', 'P_NBP_liArm', 'P_NBP_liBein', 'P_NBP_reBein', 'ABP_2', 'NBP_2') and fpa.id = 74;

update icu_copra.fhir_profiles_all set analyzed = true where id <= 80;

select * from icu_copra.fhir_profiles_all fpa where not analyzed order by profiles;


select count(*) from icu_copra.matched_0 m;
select count(distinct (profiles, loinc_short_name, "name", description)) from icu_copra.matched_0 m;

select * from icu_copra.matched_0 m limit 1;

-- ecmo
select * into icu_copra.parameter_ecmo from icu_copra.fhir_profiles_all fpa where id < 16 and "type" = 'Observation' order by id ;

-- ventilation
select * into icu_copra.ventilation from icu_copra.fhir_profiles_all fpa where (id between 17 and 47) and "type" = 'Observation' order by id ;

-- vital parameter
select * into icu_copra.vital_parameter_no_pulsatil from icu_copra.fhir_profiles_all fpa where (id between 49 and 73) and "type" = 'Observation' order by id ;
insert into icu_copra.vital_parameter_no_pulsatil select * from icu_copra.fhir_profiles_all fpa where id = 81 ;

-- vital parameter pulsatil
select * into icu_copra.vital_parameter_pulsatil from icu_copra.fhir_profiles_all fpa where (id between 74 and 80) and "type" = 'Observation' order by id ;

-- body temperatur
select * into icu_copra.body_temperatur from icu_copra.fhir_profiles_all fpa where id > 81 and "type" = 'Observation' order by id ;


select * from icu_copra.thesis_matched where conf_var_name not in (select distinct name from icu_copra.matched_0);

insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name = 'SpO2'
and id = 61
;

--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name = 'Beatmung_Messung_MV'
and id = 37
;

insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name in ('IABP_DatascopeCS300_MS_Systole_Mittel_Diastole', 'IABP_CARDIOSAVE_MS_Systole_Mittel_Diastole')
and id = 74
;


--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name = 'Beatmung_ES_Evita4_Tinsp'
and id = 43
;


--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name = 'Beatmung_MS_G5_ExspFlow'
and id = 31
;

--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name = 'NEV_CRRT_ES_Multi_CalciumFiltrat'
and id = 5
;

--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name = 'p-SVI'
and id = 62
;

--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name = 'Beatmung_MS_Evita4_frequenz'
and id = 46
;

insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name in ('Beatmung_MS_Servoi_Pmean')
and id = 27
;


--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name in ('Beatmung_Messung_AFSpontan', 'Beatmung_MS_Evita4_fspn')
and id = 45
;


--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name in ('Beatmung_ES_Heimbeatmung_Peep', 'Beatmung_Messung_PEEP', 
'Beatmung_MS_Pallas_PEEP')
and id = 24
;


--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name in ('p-SV', 'Beatmung_ES_VisionA_Schlagvolumen', 'SV')
and id = 63
;


--insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name in ('Beatmung_MS_Evita4_fspn')
and id = 44
;

insert into icu_copra.matched_0
select profiles, loinc_short_name, name, description
from icu_copra.fhir_profiles_all,
  icu_copra.copra_config_vars
where name in ('Beatmung_Messung_Pmax')
and id = 26
;



select description, regexp_replace(description, '"', '', 'g')  from icu_copra.matched_0 m
where description ~'"';

update icu_copra.matched_0 
set description = regexp_replace(description, '"', '', 'g')
where description ~'"';




update icu_copra.copra_config_vars ccv
set unit = conf_var_unit 
from icu_copra.thesis_matched tm
where ccv."name" = tm.conf_var_name
and unit isnull;
  

-- ventilation
select 
  c.id_syst,
  c.name, 
  m.description,
  c.co6_config_variabletypes_id,
  c.parent,
  c.unit copra_unit,
  v.*
  into icu_copra.matched_ventilation 
from icu_copra.matched_0 m
join icu_copra.ventilation v
  on v.profiles = m.profiles
join icu_copra.copra_config_vars c
  on c."name" = m."name"
where c.unit notnull
and c.co6_config_variabletypes_id <> 12


-- vital parameter not pulsatil
select 
  c.id_syst,
  c.name, 
  m.description,
  c.co6_config_variabletypes_id,
  c.parent,
  c.unit copra_unit,
  v.* 
 -- into icu_copra.matched_vital_parameter_no_pulsatil
from icu_copra.matched_0 m
join icu_copra.vital_parameter_no_pulsatil v
  on v.profiles = m.profiles
join icu_copra.copra_config_vars c
  on c."name" = m."name"
where c.unit notnull
and c.co6_config_variabletypes_id <> 12;

-- body temperatur
select 
  c.id_syst,
  c.name, 
  m.description,
  c.co6_config_variabletypes_id,
  c.parent,
  c.unit copra_unit,
  v.*
  into icu_copra.matched_body_temperatur
from icu_copra.matched_0 m
join icu_copra.body_temperatur v
  on v.profiles = m.profiles
join icu_copra.copra_config_vars c
  on c."name" = m."name"
where c.unit notnull;


-- vital parameter pulsatil
select 
  c.id_syst,
  c.name, 
  m.description,
  c.co6_config_variabletypes_id,
  c.parent,
  c.unit copra_unit,
  v.* 
  into icu_copra.matched_vital_parameter_pulsatil
from icu_copra.matched_0 m
join icu_copra.vital_parameter_pulsatil v
  on v.profiles = m.profiles
join icu_copra.copra_config_vars c
  on c."name" = m."name"
where c.unit notnull
and c.co6_config_variabletypes_id = 12;


-- ecmo parameter
select 
  c.id_syst,
  c.name, 
  m.description,
  c.co6_config_variabletypes_id,
  c.parent,
  c.unit copra_unit,
  v.* 
  into icu_copra.matched_parameter_ecmo
from icu_copra.matched_0 m
join icu_copra.parameter_ecmo v
  on v.profiles = m.profiles
join icu_copra.copra_config_vars c
  on c."name" = m."name"
where c.unit notnull;

select distinct 
  copra_unit, 
  unit_code 
from icu_copra.matched_body_temperatur mbt;

alter table icu_copra.matched_body_temperatur 
  add column unit_transform decimal default 1.0;
 
 
select distinct 
  copra_unit, 
  unit_code,
  unit_transform
from icu_copra.matched_parameter_ecmo mpe;

alter table icu_copra.matched_parameter_ecmo  
  add column unit_transform decimal default 1.0;
 
update icu_copra.matched_parameter_ecmo 
set unit_transform = null where copra_unit = 'h:min';


select distinct 
  copra_unit, 
  unit_code,
  unit_transform
from icu_copra.matched_ventilation mv 
;

alter table icu_copra.matched_ventilation  
  add column unit_transform decimal;
 
update icu_copra.matched_ventilation 
set unit_transform = 1.0
where regexp_replace(copra_unit, '\W', '', 'g') ~* regexp_replace(unit_code, '\W', '', 'g') 
and copra_unit !~ ':';


update icu_copra.matched_ventilation 
set unit_transform = 1.0197
where copra_unit ~* 'mbar'
and unit_code ~* 'cm\[H2O\]' 
;


update icu_copra.matched_ventilation 
set unit_transform = 1.3595
where copra_unit ~* 'mmHg'
and unit_code ~* 'cm\[H2O\]' 
;


update icu_copra.matched_ventilation 
set unit_transform = 1000
where copra_unit = 'L'
and unit_code ~* 'mL' 
;

update icu_copra.matched_ventilation 
set unit_transform = 0.01
where copra_unit = '%'
and unit_code ~* '1' 
;

update icu_copra.matched_ventilation 
set unit_transform = 0.01
where copra_unit = 'Vol%'
and unit_code ~* '1' 
;

update icu_copra.matched_ventilation 
set unit_transform = 1.0
where copra_unit = 'bpm'
and unit_code = '/min' 
;

update icu_copra.matched_parameter_ecmo 
set unit_transform = 1
where copra_unit = 'h:min'
and unit_code = 'h' 
;

delete from icu_copra.matched_ventilation where co6_config_variabletypes_id = 3;

delete from icu_copra.matched_parameter_ecmo where id_syst = 103174; -- no validated values

delete from icu_copra.matched_parameter_ecmo where id_syst = 103218; -- not enought values


select distinct 
  copra_unit, 
  unit_code,
  unit_transform
from icu_copra.matched_vital_parameter_no_pulsatil mvpnp 
;

alter table icu_copra.matched_vital_parameter_no_pulsatil  
  add column unit_transform decimal;

update icu_copra.matched_vital_parameter_no_pulsatil 
set unit_transform = 1.0;

alter table icu_copra.matched_vital_parameter_pulsatil  
  add column unit_transform decimal;

update icu_copra.matched_vital_parameter_pulsatil 
set unit_transform = 1.0;


select  id, profiles,  loinc_system, component_sistol_loinc_system, component_sistol_loinc_detaile_system, component_sistol_loinc_detaile_display, component_sistol_ieee, component_sistol_ieee_system, component_sistol_ieee_display, component_mean_unit_code, component_mean_unit, component_mean_loinc, component_mean_loinc_system, component_mean_loinc_display, component_mean_loinc_detailed, component_mean_loinc_detaile_system, component_mean_loinc_detaile_display, component_mean_snomed, component_mean_snomed_system, component_mean_snomed_display, component_mean_ieee, component_mean_ieee_system, component_mean_ieee_display, component_diastol_unit_code, component_diastol_unit, component_diastol_loinc, component_diastol_loinc_system, component_diastol_loinc_display, component_diastol_loinc_detailed, component_diastol_loinc_detaile_system, component_diastol_loinc_detaile_display, component_diastol_snomed, component_diastol_snomed_system, component_diastol_snomed_display, component_diastol_ieee, component_diastol_ieee_system, component_diastol_ieee_display  
from icu_copra.matched_vital_parameter_pulsatil mvpp 
where profiles = 'Blutdruck Generisch'

select component_sistol_loinc, component_sistol_loinc_system
from icu_copra.matched_vital_parameter_pulsatil mvpp 
where component_sistol_loinc isnull 
and component_sistol_loinc_system notnull;

update icu_copra.matched_vital_parameter_pulsatil 
set component_sistol_loinc_system = null 
where component_sistol_loinc isnull;


select component_sistol_loinc_detailed, component_sistol_loinc_detaile_system 
from icu_copra.matched_vital_parameter_pulsatil mvpp 
where component_sistol_loinc_detailed isnull 
and component_sistol_loinc_detaile_system notnull;


update icu_copra.matched_vital_parameter_pulsatil 
set component_sistol_loinc_detaile_system = null 
where component_sistol_loinc_detailed isnull;


select component_sistol_ieee , component_sistol_ieee_system  
from icu_copra.matched_vital_parameter_pulsatil mvpp 
where component_sistol_ieee  isnull 
and component_sistol_ieee_system  notnull;


update icu_copra.matched_vital_parameter_pulsatil 
set component_sistol_ieee_system = null 
where component_sistol_ieee isnull;



update icu_copra.matched_vital_parameter_pulsatil 
set component_diastol_loinc_system = null 
where component_diastol_loinc isnull;


update icu_copra.matched_vital_parameter_pulsatil 
set component_diastol_loinc_detaile_system = null 
where component_diastol_loinc_detailed isnull;



update icu_copra.matched_vital_parameter_pulsatil 
set component_mean_loinc_system = null 
where component_mean_loinc isnull;


update icu_copra.matched_vital_parameter_pulsatil 
set component_mean_loinc_detaile_system = null 
where component_mean_loinc_detailed isnull;


update icu_copra.matched_vital_parameter_pulsatil 
set component_mean_ieee_system = null 
where component_mean_ieee isnull;


update icu_copra.matched_vital_parameter_pulsatil 
set component_diastol_ieee_system = null 
where component_diastol_ieee isnull;

--copy icu_copra.matched_body_temperatur to '/media/db/cdw_database/matched/body_temperatur.csv' with delimiter E';' header csv;
--copy icu_copra.matched_parameter_ecmo to '/media/db/cdw_database/matched/parameter_ecmo.csv' with delimiter E';' header csv;
--copy icu_copra.matched_ventilation to '/media/db/cdw_database/matched/ventilation.csv' with delimiter E';' header csv;
--copy icu_copra.matched_vital_parameter_no_pulsatil to '/media/db/cdw_database/matched/vital_parameter_no_pulsatil.csv' with delimiter E';' header csv;
--copy icu_copra.matched_vital_parameter_pulsatil to '/media/db/cdw_database/matched/vital_parameter_pulsatil.csv' with delimiter E';' header csv;
