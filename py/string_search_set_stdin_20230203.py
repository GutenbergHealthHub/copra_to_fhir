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
    to_split = profil.split('_')
    to_split_as_str = str(to_split)
    to_split_as_str = to_split_as_str.replace('[', '')
    to_split_as_str = to_split_as_str.replace(']', '')
    to_split_as_str = to_split_as_str.replace("'", "")
    to_split_as_str = to_split_as_str.replace(',', '')
    #print(to_split_as_str)
    match_ratios = process.extract(to_split_as_str, cvn, scorer=fuzz.token_set_ratio, limit = 1)
    #print(profil,';', match_ratios)
    result.write(profil + ';' + str(match_ratios) + '\n')

