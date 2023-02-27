/*
alter table icu_copra.ventilation  
  drop column analyzed,
  drop column loinc_short_name;

alter table icu_copra.ventilation  
   add column unit_code varchar,
   add column profil_canonical varchar default 'https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/',
   add column category_coding_system varchar default 'http://snomed.info/sct',
   add column category_coding_code varchar default '40617009',
   add column category_coding_display varchar default 'Artificial respiration (procedure)',
   add column loinc_system varchar default 'http://loinc.org',
   add column loinc_display varchar,
   add column snomed_system varchar default 'http://snomed.info/sct',
   add column snomed_display varchar,
   add column ieee_system varchar default 'urn:iso:std:iso:11073:10101',
   add column ieee_display varchar;
   
update icu_copra.ventilation 
set unit_code = unit; 

   
update icu_copra.ventilation
  set loinc_system = null where loinc isnull; 
 
update icu_copra.ventilation
  set snomed_system = null where snomed isnull;
 
update icu_copra.ventilation
  set ieee_system = null where ieee isnull; 




select distinct unit, unit_code from icu_copra.ventilation v order by unit ; 


update icu_copra.ventilation 
set unit = 'percent'
where unit = '%';

update icu_copra.ventilation 
set unit = 'breaths per minute'
where unit = '{Breaths}/min';


update icu_copra.ventilation 
set unit = 'centimeter of water'
where unit = 'cm[H2O]';

update icu_copra.ventilation 
set unit = 'liter per minute'
where unit = 'L/min';


update icu_copra.ventilation 
set unit = 'per minute'
where unit = '/min';


update icu_copra.ventilation 
set unit = 'milliliter'
where unit = 'mL';


update icu_copra.ventilation 
set unit = 'centimeter of mercury'
where unit = 'cm[Hg]';

update icu_copra.ventilation 
set unit = 'millimeter of mercury'
where unit = 'mm[Hg]';

update icu_copra.ventilation 
set unit = 'ratio'
where unit = '{ratio}';

update icu_copra.ventilation 
set unit = 'milliliter per centimeter of water'
where unit = 'mL/cm[H2O]';

update icu_copra.ventilation 
set unit = 'second'
where unit = 's';
 */
 
 
select * from icu_copra.ventilation v 
where id = 18;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'parameter-von-beatmung'--,
  --loinc_display = '',
  --snomed_display = '',
  --ieee_display = ''
where id =  18;


select * from icu_copra.ventilation v 
where id = 19;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'unterstuetzungsdruck-beatmung',
  loinc_display = 'Pressure support setting Ventilator'--,
  --snomed_display = '',
  --ieee_display = ''
where id =  19;


select * from icu_copra.ventilation v 
where id = 20;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'endexpiratorischer-kohlendioxidpartialdruck',
  loinc_display = 'Carbon dioxide [Partial pressure] in Exhaled gas --at end expiration',
  snomed_display = 'End tidal carbon dioxide concentration (observable entity)',
  ieee_display = 'End tidal carbon dioxide concentration (or partial pressure) in airway gas'
where id =  20;


select * from icu_copra.ventilation v 
where id = 21;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'atemwegsdruck-bei-null-expiratorischem-gasfluss',
  loinc_display = 'Airway pressure --at zero inspiratory flow on ventilator'--,
  --snomed_display = '',
  --ieee_display = ''
where id = 21;


select * from icu_copra.ventilation v 
where id = 22;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'atemwegsdruck-bei-mittlerem-expiratorischem-gasfluss',
  loinc_display = 'Airway pressure --at mean expiratory flow on ventilator'--,
  --snomed_display = '',
  --ieee_display = ''
where id = 22;


select * from icu_copra.ventilation v 
where id = 23;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'druckdifferenz-beatmung',
  loinc_display = 'Airway pressure delta --on ventilator',
  --snomed_display = '',
  ieee = '152720',
  ieee_display = 'Inspiratory airway pressure relative to PEEP or BAP'
where id =  23;


select * from icu_copra.ventilation v 
where id = 24;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'positiv-endexpiratorischer-druck',
  loinc_display = 'PEEP Respiratory system --on ventilator',
  snomed_display = 'Positive end expiratory pressure (observable entity)',
  ieee_display = 'Applied PEEP'
where id = 24;


select * from icu_copra.ventilation v 
where id = 25;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'dynamische-kompliance',
  loinc_display = 'Dynamic lung compliance',
  snomed_display = 'Total dynamic compliance (observable entity)',
  ieee_display = 'Thoracic compliance'
where id = 25;


select * from icu_copra.ventilation v 
where id = 26;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'maximaler-beatmungsdruck',
  loinc_display = 'Pressure.max Respiratory system airway --on ventilator',
  snomed_display = 'Maximum inspiratory pressure (observable entity)',
  ieee_display = 'Pressure.max Respiratory system airway --on ventilator'
where id = 26 ;


select * from icu_copra.ventilation v 
where id = 27;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'mittlerer-beatmungsdruck',
  loinc_display = 'Mean pressure Respiratory system airway --on ventilator',
  snomed_display = 'Mean inspiratory airway pressure (observable entity)',
  ieee_display = 'Mean pressure Respiratory system airway --on ventilator'
where id =  27;


select * from icu_copra.ventilation v 
where id = 28;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'exspiratorischer-sauerstoffpartialdruck',
  loinc_display = 'Oxygen [Partial pressure] in Exhaled gas',
  snomed_display = 'Expired oxygen tension (observable entity)',
  ieee_display = 'Expired oxygen concentration (or partial pressure) in airway gas'
where id =  28;


select * from icu_copra.ventilation v 
where id = 29;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'inspiratorische-sauerstofffraktion',
  loinc_display = 'Oxygen/Gas total [Pure volume fraction] Inhaled gas',
  snomed_display = 'Inspired oxygen concentration (observable entity)'--,
  --ieee_display = ''
where id =  29;


select * from icu_copra.ventilation v 
where id = 30;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'inspiratorisch-sauerstofffraktion-eingestellt',
  loinc_display = 'Oxygen/Total gas setting [Volume Fraction] Ventilator',
  snomed_display = 'Inspired oxygen concentration (observable entity)'--,
  --ieee_display = ''
where id =  30;


select * from icu_copra.ventilation v 
where id = 31;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'exspiratorischer-gasfluss',
  loinc_display = 'Expiratory gas flow Respiratory system airway --on ventilator',
  --snomed_display = '',
  ieee_display = 'Ventilation expiratory flow'
where id =  31;


select * from icu_copra.ventilation v 
where id = 32;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'inspiratorischer-gasfluss',
  loinc_display = 'Inspiratory gas flow Respiratory system airway --on ventilator',
  --snomed_display = '',
  ieee_display = 'Ventilation inspiratory flow'
where id =  32;


select * from icu_copra.ventilation v 
where id = 33;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'eingestellter-inspiratorischer-gasfluss',
  loinc_display = 'Inspiratory flow setting Ventilator'--,
  --snomed_display = '',
  --ieee_display = ''
where id =  33;


select * from icu_copra.ventilation v 
where id = 34;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'beatmungszeit-niedrigem-druck',
  loinc_display = 'Low pressure hold time setting Ventilator',
  --snomed_display = '',
  ieee_display = 'Low pressure hold time setting Ventilator'
where id =  34;


select * from icu_copra.ventilation v 
where id = 35;

update icu_copra.ventilation 
set --profil_canonical = profil_canonical||'beatmungszeit-hohem-druck',
  loinc_display = 'High pressure hold time setting Ventilator',
  --snomed_display = '',
  ieee_display = 'High pressure hold time setting Ventilator'
where id =  35;


select * from icu_copra.ventilation v 
where id = 36;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'spontanes-mechanisches-atemzugvolumen-waehrend-beatmung',
  loinc_display = 'Tidal volume.spontaneous+mechanical --on ventilator'--,
  --snomed_display = '',
  --ieee_display = ''
where id =  36;


select * from icu_copra.ventilation v 
where id = 37;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'beatmungsvolumen-pro-minute-maschineller-beatmung',
  loinc_display = 'Inspired minute Volume during Mechanical ventilation',
  snomed_display = 'Ventilator delivered minute volume (observable entity)',
  ieee_display = 'Ventilation inspiratory minute volume'
where id = 37;


select * from icu_copra.ventilation v 
where id = 38;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'spontanes-atemzugvolumen',
  loinc_display = 'Tidal volume.spontaneous --on ventilator',
  snomed_display = 'Spontaneous tidal volume (observable entity)'--,
  --ieee_display = ''
where id = 38 ;


select * from icu_copra.ventilation v 
where id = 39;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'atemzugvolumen-waehrend-beatmung',
  loinc_display = 'Tidal volume Ventilator --on ventilator',
  snomed_display = 'Ventilator delivered tidal volume (observable entity)',
  ieee_display = 'Ventilation tidal volume'
where id = 39 ;


select * from icu_copra.ventilation v 
where id = 40;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'atemzugvolumen-einstellung',
  loinc_display = 'Tidal volume setting Ventilator',
  snomed_display = 'Tidal volume setting (observable entity)',
  ieee_display = 'Tidal volume setting'
where id = 40 ;


select * from icu_copra.ventilation v 
where id = ;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'',
  loinc_display = '',
  snomed_display = '',
  ieee_display = ''
where id =  ;


select * from icu_copra.ventilation v 
where id = ;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'',
  loinc_display = '',
  snomed_display = '',
  ieee_display = ''
where id =  ;


select * from icu_copra.ventilation v 
where id = ;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'',
  loinc_display = '',
  snomed_display = '',
  ieee_display = ''
where id =  ;


select * from icu_copra.ventilation v 
where id = ;

update icu_copra.ventilation 
set profil_canonical = profil_canonical||'',
  loinc_display = '',
  snomed_display = '',
  ieee_display = ''
where id =  ;
