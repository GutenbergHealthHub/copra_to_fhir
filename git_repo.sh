
dbpass=`pass db/her11a_admin`
export PGPASSWORD=$dbpass
pg_dump > /home/ahodelin/git_repos/copra_to_fhir/sql/copra_to_fhir.sql -U her11a_admin -d copra_to_fhir -O -x -w
git add *
d=`date`
git commit -m "Last update $d"
git fetch origin
git push origin main
