DBNAME=padjo-2017-exam.sqlite

sqlite3 ${DBNAME} < schemas.sql


cat data/pres_states.csv \
    | csvsql --no-create --insert \
         --no-inference \
         --db sqlite:///${DBNAME} \
         --tables pres_states

cat data/pres_districts.csv \
    | csvsql --no-create --insert \
         --no-inference \
         --db sqlite:///${DBNAME} \
         --tables pres_districts

cat data/legislators.csv \
    | csvsql --no-create --insert \
         --no-inference \
         --db sqlite:///${DBNAME} \
         --tables legislators

cat data/disbursements.csv \
    | csvsql --no-create --insert \
         --db sqlite:///${DBNAME} \
         --tables disbursements


sqlite3 ${DBNAME} < updates.sql
