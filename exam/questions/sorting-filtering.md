# Section A: Sorting and Filtering

No `GROUP BY` or `JOIN`, just worry primarily about `WHERE`, `ORDER BY`, and `LIMIT`, as well as how to select columns and alias them.

(Return to the [exam homepage](https://github.com/dannguyen/padjo-2017-sql-exam/blob/master/README.md))



<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [The legislators table](#the-legislators-table)
  - [A01. List the 5 youngest legislators](#a01-list-the-5-youngest-legislators)
    - [Expected results](#expected-results)
  - [A02. List the entire Montana delegation in alphabetical order of last name](#a02-list-the-entire-montana-delegation-in-alphabetical-order-of-last-name)
    - [Expected results](#expected-results-1)
  - [A03. List the 10 legislators with the longest last names, using age as a tie-breaker](#a03-list-the-10-legislators-with-the-longest-last-names-using-age-as-a-tie-breaker)
    - [Expected results](#expected-results-2)
- [The `pres_states` table](#the-pres_states-table)
  - [A04. List the 5 states in the 2016 election that skewed most Republican](#a04-list-the-5-states-in-the-2016-election-that-skewed-most-republican)
    - [Expected results](#expected-results-3)
  - [A05. List the 5 states in the 2012 election with the most 3rd-party vote](#a05-list-the-5-states-in-the-2012-election-with-the-most-3rd-party-vote)
    - [Expected results](#expected-results-4)
- [The `pres_districts` table](#the-pres_districts-table)
  - [A06. List the 5 House districts in 2016 that went Republican, in order of smallest Republican vote percentage](#a06-list-the-5-house-districts-in-2016-that-went-republican-in-order-of-smallest-republican-vote-percentage)
    - [Expected results](#expected-results-5)
- [The `disbursements` table](#the-disbursements-table)
  - [A07. List the top 10 most expensive expenditures made by legislators](#a07-list-the-top-10-most-expensive-expenditures-made-by-legislators)
    - [Expected results](#expected-results-6)
  - [A08. List the 5 most expensive non-salary related expenditures made by Rep. Duncan Hunter's (CA-50) office in the first quarter of 2017](#a08-list-the-5-most-expensive-non-salary-related-expenditures-made-by-rep-duncan-hunters-ca-50-office-in-the-first-quarter-of-2017)
    - [Expected results](#expected-results-7)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->




## The legislators table

This table consists of some basic biographical information about the current members of Congress.


### A01. List the 5 youngest legislators

Use the `legislators` table. Make sure your result set has the exact same rows and columns (and ordering) as the expected result below:



#### Expected results

| type | first_name | last_name     | party      | state | district | birthday   |
| ---- | ---------- | ------------- | ---------- | ----- | -------- | ---------- |
| rep  | Elise      | Stefanik      | Republican | NY    | 21       | 1984-07-02 |
| rep  | Mike       | Gallagher     | Republican | WI    | 08       | 1984-03-03 |
| rep  | Trey       | Hollingsworth | Republican | IN    | 09       | 1983-09-12 |
| rep  | Matt       | Gaetz         | Republican | FL    | 01       | 1982-05-07 |
| rep  | Tulsi      | Gabbard       | Democrat   | HI    | 02       | 1981-04-12 |








### A02. List the entire Montana delegation in alphabetical order of last name


#### Expected results

| type | first_name | last_name |   party    | district |
|------|------------|-----------|------------|----------|
| sen  | Steve      | Daines    | Republican |          |
| rep  | Greg       | Gianforte | Republican |       00 |
| sen  | Jon        | Tester    | Democrat   |          |







### A03. List the 10 legislators with the longest last names, using age as a tie-breaker

Although we use the length of the last name, i.e. the use of the `LENGTH()` function, as the primary sorting condition, we **do not** derive and include that column showing the number of characters in the result set.

We use age, i.e. `birthday`, as a tie-breaker between last names of equal length.





#### Expected results


| type | first_name | last_name         | gender | party      | state | district | birthday   |
| ---- | ---------- | ----------------- | ------ | ---------- | ----- | -------- | ---------- |
| rep  | Debbie     | Wasserman Schultz | F      | Democrat   | FL    | 23       | 1966-09-27 |
| rep  | Cathy      | McMorris Rodgers  | F      | Republican | WA    | 05       | 1969-05-22 |
| rep  | Lisa       | Blunt Rochester   | F      | Democrat   | DE    | 00       | 1962-02-10 |
| rep  | Jaime      | Herrera Beutler   | F      | Republican | WA    | 03       | 1978-11-03 |
| rep  | Bonnie     | Watson Coleman    | F      | Democrat   | NJ    | 12       | 1945-02-06 |
| rep  | Raja       | Krishnamoorthi    | M      | Democrat   | IL    | 08       | 1973-07-19 |
| rep  | Lucille    | Roybal-Allard     | F      | Democrat   | CA    | 40       | 1941-06-12 |
| rep  | F.         | Sensenbrenner     | M      | Republican | WI    | 05       | 1943-06-14 |
| rep  | C.         | Ruppersberger     | M      | Democrat   | MD    | 02       | 1946-01-31 |
| rep  | Rodney     | Frelinghuysen     | M      | Republican | NJ    | 11       | 1946-04-29 |




## The `pres_states` table

The `pres_states` table contains presidential election results at the state level, for 2012 and 2016. 


### A04. List the 5 states in the 2016 election that skewed most Republican

"Skewed most Republican" is basically the rows in which `winning_party` is `R` and in descending order of `winning_margin` (which is just `republican` - `democrat` if you needed to calculate it yourself).




#### Expected results

| state | winning_margin | democrat | republican |
| ----- | -------------- | -------- | ---------- |
| WY    | 46.3           | 21.9     | 68.2       |
| WV    | 41.7           | 26.2     | 67.9       |
| OK    | 36.4           | 28.9     | 65.3       |
| ND    | 35.8           | 27.2     | 63         |
| ID    | 31.8           | 27.5     | 59.3       |






### A05. List the 5 states in the 2012 election with the most 3rd-party vote

There's no column for 3rd-party vote, but you can calculate it using the existing `democrat` and `republican` columns.

Round the `third_party_vote` column to the nearest tenth.


~~~sql
SELECT
  state
  , ROUND(100 - (democrat + republican), 1) 
      AS third_party_vote
  , winning_party
  , winning_margin
FROM pres_states
WHERE year = 2012
ORDER BY 
   third_party_vote DESC
LIMIT 5;
~~~


#### Expected results

| state | third_party_vote | winning_party | winning_margin |
| ----- | ---------------- | ------------- | -------------- |
| AK    | 4.4              | R             | 14             |
| NM    | 4.2              | D             | 10.2           |
| OR    | 3.7              | D             | 12.1           |
| WY    | 3.6              | R             | 40.8           |
| ID    | 3.5              | R             | 31.7           |


## The `pres_districts` table

This is similar to `pres_states`, except that the presidential vote is calculated by House district. Note that this table does not contain the vote results for the actual House race. Instead, it tells us how voters in a given House district voted for president, which is often but *not always*  the same party as the elected House member.



### A06. List the 5 House districts in 2016 that went Republican, in order of smallest Republican vote percentage

In other words, the 5 districts with the smallest Republican vote percentage that still voted in the majority for the Republican presidential candidate, for the 2016 race. 





#### Expected results
| district | winning_margin | republican | democrat |
| -------- | -------------- | ---------- | -------- |
| UT-04    | 6.7            | 39.1       | 32.4     |
| UT-02    | 14             | 46         | 32       |
| MN-02    | 1.2            | 46.5       | 45.3     |
| UT-03    | 23.9           | 47.2       | 23.3     |
| IL-17    | 0.7            | 47.4       | 46.7     |



## The `disbursements` table


### A07. List the top 10 most expensive expenditures made by legislators

The `disbursements` table includes expenditures from legislators' offices as well as for other entities, such as Congressional committees. For the latter -- i.e. expenses not associated with any individual member of Congress -- the `bioguide_id` column will be `NULL`.





#### Expected results

| BIOGUIDE_ID | QUARTER | OFFICE                       | CATEGORY                  | PAYEE                        | PURPOSE                 | AMOUNT   |
| ----------- | ------- | ---------------------------- | ------------------------- | ---------------------------- | ----------------------- | -------- |
| P000596     | 2017Q1  | HON. PEDRO R. PIERLUISI      | PRINTING AND REPRODUCTION | MEDIA MANAGEMENT&PARTNERS    | PRINTING & REPRODUCTION | 79413.88 |
| P000596     | 2017Q1  | HON. PEDRO R. PIERLUISI      | PRINTING AND REPRODUCTION | MEDIA MANAGEMENT&PARTNERS    | PRINTING & REPRODUCTION | 68584.57 |
| E000290     | 2017Q1  | HON. DONNA F. EDWARDS        | PRINTING AND REPRODUCTION | TRU-BLU POLITICS LLC         | PRINTING & REPRODUCTION | 64056.2  |
| D000614     | 2017Q1  | HON. SEAN P. DUFFY           | FRANKED MAIL              | UNITED STATES POSTAL SERVICE | FRANKED MAIL            | 63146.67 |
| D000614     | 2017Q1  | HON. SEAN P. DUFFY           | PRINTING AND REPRODUCTION | THE FRANKING GROUP           | PRINTING & REPRODUCTION | 52652    |
| D000533     | 2017Q1  | HON. JOHN J. DUNCAN  JR.     | FRANKED MAIL              | UNITED STATES POSTAL SERVICE | FRANKED MAIL            | 47581.16 |
| P000034     | 2017Q1  | HON. FRANK PALLONE  JR.      | FRANKED MAIL              | UNITED STATES POSTAL SERVICE | FRANKED MAIL            | 47560.84 |
| B001292     | 2017Q1  | HON. DONALD S. BEYER  JR.    | FRANKED MAIL              | UNITED STATES POSTAL SERVICE | FRANKED MAIL            | 43608.09 |
| R000603     | 2017Q1  | HON. DAVID ROUZER            | PRINTING AND REPRODUCTION | CAPITOL FRANKING GROUP LLC   | PRINTING & REPRODUCTION | 42396    |
| A000055     | 2017Q2  | 2017 HON. ROBERT B. ADERHOLT | PERSONNEL COMPENSATION    | RELL BRIAN E                 | CHIEF OF STAFF          | 42102.75 |


### A08. List the 5 most expensive non-salary related expenditures made by Rep. Duncan Hunter's (CA-50) office in the first quarter of 2017

First, look at the various values for `CATEGORY` and figure out which category has something to do with paying salaries. Hint: the word "PERSONNEL" is part of it.

Second, you'll want to manually look up Rep. Duncan Hunter's bioguide ID and use that in the `WHERE` condition, i.e. do not attempt this:

```
WHERE OFFICE LIKE '%DUNCAN HUNTER%'
```

-- because you don't know if that field is consistent.




#### Expected results

| BIOGUIDE_ID | OFFICE             | YEAR | QUARTER | CATEGORY                       | PAYEE                                | PURPOSE                        | AMOUNT  |
| ----------- | ------------------ | ---- | ------- | ------------------------------ | ------------------------------------ | ------------------------------ | ------- |
| H001048     | HON. DUNCAN HUNTER | 2018 | 2017Q1  | SUPPLIES AND MATERIALS         | POLITICO LLC                         | PUBLICATIONS/REFERENCE MAT'L   | 10990   |
| H001048     | HON. DUNCAN HUNTER | 2016 | 2017Q1  | SUPPLIES AND MATERIALS         | SANTANDER CONSUMER USA INC           | AUTO EXPENSES                  | 4410.38 |
| H001048     | HON. DUNCAN HUNTER | 2017 | 2017Q1  | TRAVEL                         | CITIBANK GOV CARD SERVICE            | COMMERCIAL TRANSPORTATION      | 4267.8  |
| H001048     | HON. DUNCAN HUNTER | 2017 | 2017Q1  | RENT  COMMUNICATION  UTILITIES | SECURITIES REAL ESTATE FUND 2012 LLC | DISTRICT OFFICE RENT (PRIVATE) | 3927    |
| H001048     | HON. DUNCAN HUNTER | 2017 | 2017Q1  | RENT  COMMUNICATION  UTILITIES | SECURITIES REAL ESTATE FUND 2012 LLC | DISTRICT OFFICE RENT (PRIVATE) | 3927    |






