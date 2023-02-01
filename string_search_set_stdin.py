#! /usr/bin/python3

profiles = input('File from: \n')
config_vars = input('File to: \n')
output_file = input('Output file: \n')

from thefuzz import process, fuzz

with open(profiles) as fp:
    prn = fp.readlines()

prn = [x.strip() for x in prn]

with open(config_vars) as fc:
    cvn = fc.readlines()

cvn = [x.strip() for x in cvn]

result = open(output_file, 'w')

for profil in prn:
    match_ratios = process.extract(profil, cvn, scorer=fuzz.token_set_ratio, limit = 1)
    #print(profil,';', match_ratios)
    result.write(profil + ';' + str(match_ratios) + '\n')

