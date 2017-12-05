curl https://projects.propublica.org/congress/assets/staffers/2017Q2-house-disburse-detail.csv \
    -o data/house-disbursements-2017q2.csv

curl https://projects.propublica.org/congress/assets/staffers/2017Q1-house-disburse-detail.csv \
    -o data/house-disbursements-2017q1.csv

csvstack -e latin1 \
    data/house-disbursements-2017q1.csv \
    data/house-disbursements-2017q2.csv \
    > data/all-disbursements.csv


curl -o data/legislators-current.csv \
    https://theunitedstates.io/congress-legislators/legislators-current.csv
