csvcut -c BIOGUIDE_ID,OFFICE,YEAR,QUARTER,CATEGORY,PURPOSE,PAYEE,AMOUNT \
      data/temps/all-disbursements.csv \
    | csvgrep -c BIOGUIDE_ID -r '\w' \
    > data/disbursements.csv


csvcut -c bioguide_id,last_name,first_name,type,party,state,district,gender,birthday,twitter,facebook,url \
    data/temps/legislators-current.csv \
    | csvgrep -c type -r 'rep|sen' \
    | csvgrep -i -c state -r 'PR|GU|MP|DC|AS' \
    > data/legislators.csv


csvjoin -c state,full_name data/temps/presidential_state_results.csv \
                          data/temps/statelookups.csv \
    | csvcut -c postal_code,year,dem,rep,winner,winner_margin \
    | sed '1s/postal_code/state/' \
    | sed '1s/dem/democrat/' \
    | sed '1s/rep/republican/' \
    | sed '1s/winner,/winning_party,/' \
    | sed '1s/winner_margin/winning_margin/' \
    | sed 's/,dem,/,D,/' \
    | sed 's/,rep,/,R,/' \
    | csvgrep -c year -r '2012|2016' \
    > data/pres_states.csv
