/*
alter table icu_copra.vital_parameter_no_pulsatil  
  drop column analyzed,
  drop column loinc_short_name;

alter table icu_copra.vital_parameter_no_pulsatil
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
   
update icu_copra.vital_parameter_no_pulsatil  
set unit_code = unit; 

   
update icu_copra.vital_parameter_no_pulsatil
  set loinc_system = null where loinc isnull; 
 
update icu_copra.vital_parameter_no_pulsatil
  set snomed_system = null where snomed isnull;
 
update icu_copra.vital_parameter_no_pulsatil
  set ieee_system = null where ieee isnull; 




select distinct unit, unit_code from icu_copra.vital_parameter_no_pulsatil v order by unit ; 

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'percent'
where unit = '%';

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'centimeter'
where unit = 'cm';

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'liter per minute'
where unit = 'L/min';


update icu_copra.vital_parameter_no_pulsatil  
set unit = 'per minute'
where unit = '/min';


update icu_copra.vital_parameter_no_pulsatil  
set unit = 'milliliter'
where unit = 'mL';

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'millimeter of mercury'
where unit = 'mm[Hg]';

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'liter per minute per square meter'
where unit = 'L/(min.m2)';

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'kilogram'
where unit = 'kg';

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'Celsius'
where unit = 'Cel';

update icu_copra.vital_parameter_no_pulsatil
set unit = 'dyne second per centimeter5 and square meter'
where unit = 'dyn.s/cm5/m2';

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'per milliliter'
where unit = '/mL';

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'liter per minute per sqaure meter'
where unit = 'L/min/m2';

update icu_copra.vital_parameter_no_pulsatil  
set unit = 'milliliter per square meter'
where unit = 'mL/m2';
*/
 
 
select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 49;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'pulmonalarterieller-wedge-druck',
  loinc_display = 'Pulmonary artery wedge pressure',
  snomed_display = 'Pulmonary artery wedge pressure (observable entity)',
  ieee_display = 'Pulmonary artery wedge pressure'
where id = 49;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 50;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'intrakranieller-druck-icp',
  loinc_display = 'Intracranial pressure (ICP)',
  snomed_display = 'Intracranial pressure (observable entity)',
  ieee_display = 'Intracranial pressure'
where id = 50;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 51;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'atemfrequenz',
  loinc_display = '"Respiratory Rate',
  snomed_display = 'Respiratory rate (observable entity)'--,
  --ieee_display = ''
where id = 51;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 52;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'kopfumfang',
  loinc_display = 'Head Occipital-frontal circumference',
  snomed_display = 'Head circumference measure (observable entity)'--,
  --ieee_display = ''
where id = 52;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 53;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'koerpergroesse',
  loinc_display = 'Body height',
  snomed_display = 'Body height (observable entity)'--,
  --ieee_display = ''
where id = 53;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 54;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'koerpergewicht',
  loinc_display = 'Body weight',
  snomed_display = 'Body weight (observable entity)'--,
  --ieee_display = ''
where id = 54;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 55;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'koerpergewicht-percentil-altersabhaengig',
  loinc_display = 'Body weight [Percentile] Per age',
  snomed_display = 'Weight for age percentile (observable entity)'--,
  --ieee_display = ''
where id = 55;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 56;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'koerpergroesse-percentil',
  loinc_display = 'Body height [Percentile]',
  snomed_display = 'Body height for age percentile (observable entity)'--,
  --ieee_display = ''
where id = 56;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 57;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'ideales-koerpergewicht',
  loinc_display = 'Ideal body weight',
  snomed_display = 'Ideal body weight (observable entity)'--,
  --ieee_display = ''
where id = 57;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 58;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'koerpertemperatur-kern',
  loinc_display = 'Body temperature - Core',
  snomed_display = 'Core body temperature (observable entity)',
  ieee_display = 'Body temperature - Core'
where id = 58;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 59;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'sauerstoffsaettigung-im-blut-preduktal-durch-pulsoxymetrie',
  loinc_display = 'Oxygen saturation in Blood Preductal by Pulse oximetry',
  --snomed_display = '',
  ieee_display = 'Preductal SpO2'
where id = 59;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 60;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'sauerstoffsaettigung-im-blut-postduktal-durch-pulsoxymetrie',
  loinc_display = 'Oxygen saturation in Blood Postductal by Pulse oximetry',
  --snomed_display = '',
  ieee_display = 'Postductal SpO2'
where id = 60;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 61;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'sauerstoffsaettigung-im-arteriellen-blutl-durch-pulsoxymetrie',
  loinc_display = 'Oxygen saturation in Arterial blood by Pulse oximetry',
  loinc = '59408-5',
  snomed_display = 'Arterial oxygen saturation (observable entity)',
  ieee_display = 'Oxygen saturation in Arterial blood by Pulse oximetry'
where id = 61;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 62;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'linksventrikulaeres-schlagvolumenindex',
  loinc_display = 'Left ventricular Stroke volume index',
  snomed_display = 'Stroke index (observable entity)'--,
  --ieee_display = ''
where id = 62;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 63;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'linksventrikulaeres-schlagvolumen',
  loinc_display = 'Left ventricular Stroke volume',
  snomed = '90096001',
  snomed_display = 'Stroke volume (observable entity)',
  ieee_display = 'Ventricular stroke'
where id = 63;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 64;

update icu_copra.vital_parameter_no_pulsatil  
set profil_canonical = profil_canonical||'linksventrikulaerer-schlagvolumenindex-durch-indikatorverduennung',
  loinc_display = 'Left ventricular Stroke volume index by Indicator dilution'--,
  --snomed_display = '',
  --ieee_display = ''
where id = 64;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 65;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'linksventrikulaeres-schlagvolumen-durch-indikatorverduennung',
  loinc_display = 'Left ventricular Stroke volume by Indicator dilution'--,
  --snomed_display = '',
  --ieee_display = ''
where id = 65;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 66;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'pulmonalvaskulaerer-widerstandsindex',
  loinc_display = 'Pulmonary vascular Resistance index',
  snomed_display = 'Pulmonary vascular Resistance index (observable entity)',
  ieee_display = 'Pulmonary Vascular Resistance Index'
where id = 66;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 67;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'systemischer-vaskulaerer-widerstandsindex',
  loinc_display = 'Systemic vascular Resistance index',
  snomed_display = 'Systemic vascular Resistance index (observable entity)',
  ieee_display = 'Systemic vascular resistance indexed'
where id = 67;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 68;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'linksventrikulaerer-herzindex',
  loinc_display = 'Left ventricular Cardiac index',
  snomed_display = 'Cardiac index (observable entity)',
  ieee_display = 'Cardiac index'
where id = 68;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 69;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'herzzeitvolumen',
  loinc_display = 'Left ventricular Cardiac output',
  snomed_display = 'Cardiac output (observable entity)',
  ieee_display = 'Cardiac output'
where id = 69;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 70;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'linksventrikulaerer-herzindex-durch-indikatorverduennung',
  loinc_display = 'Left ventricular Cardiac index by Indicator dilution'--,
  --snomed_display = '',
  --ieee_display = ''
where id = 70;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 71;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'linksventrikulaeres-herzzeitvolumen-durch-indikatorverduennung',
  loinc_display = 'Left ventricular Cardiac output by Indicator dilution'--,
  --snomed_display = '',
  --ieee_display = ''
where id = 71;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 72;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'herzfrequenz',
  loinc_display = 'Heart Rate',
  snomed_display = 'Heart rate (observable entity)',
  ieee_display = 'Heart Rate'
where id = 72;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 73;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'zentralvenoeser-blutdruck',
  loinc_display = 'Central venous pressure (CVP)',
  snomed_display = 'Central venous pressure (observable entity)',
  ieee_display = 'Central venous pressure'
where id = 73;

select * from icu_copra.vital_parameter_no_pulsatil v 
where id = 81;

update icu_copra.vital_parameter_no_pulsatil 
set profil_canonical = profil_canonical||'puls',
  --loinc_display = '',
  snomed_display = 'Pulse, function (observable entity)',
  ieee_display = 'Pulse rate'
where id = 81;
