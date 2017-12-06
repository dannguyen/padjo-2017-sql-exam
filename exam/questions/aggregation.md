# Section B. Aggregation

These questions test your grasp of `GROUP BY` and aggregation functions (e.g. `MAX`, `MIN`, `AVG`, `SUM`, `COUNT`). There are a couple questions that require the `HAVING` clause; to make things a little easier, these questions specifically mention `HAVING`.

As before, pay attention to column arrangement, sort order, and the use of aliases to get the desired column names for the expected results. 

Add these answers to the Google Doc you created for the previous section, i.e. `padjo-2017-final-sql-exam-your_sunet_id`.




Previous related work:

- [SQL practice with SFPD incidents and group by aggregation ](https://gist.github.com/dannguyen/7e4fcfc6b91dd7749a23560912ee4e1e#file-03-grouping-md)
- [SQL practice with SFPD incidents and the HAVING clause](https://gist.github.com/dannguyen/7e4fcfc6b91dd7749a23560912ee4e1e#sql-practice-with-sfpd-incidents-and-the-having-clause-4-of-4)


<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [`legislators` table](#legislators-table)
  - [B01. Count the number of men and women currently in Congress](#b01-count-the-number-of-men-and-women-currently-in-congress)
    - [Expected results](#expected-results)
  - [B02. List the days of the year in which more than one Republican House rep has a birthday](#b02-list-the-days-of-the-year-in-which-more-than-one-republican-house-rep-has-a-birthday)
    - [Expected results](#expected-results-1)
  - [B03. Count the number of men and women, and get their average age, by political party and type (i.e. Senators vs. Representatives)](#b03-count-the-number-of-men-and-women-and-get-their-average-age-by-political-party-and-type-ie-senators-vs-representatives)
    - [Expected results](#expected-results-2)
- [`pres_states` table](#pres_states-table)
  - [B04. The number of states won by each respective party, as well as the minimum, average, and maximum margins of victory, in 2016](#b04-the-number-of-states-won-by-each-respective-party-as-well-as-the-minimum-average-and-maximum-margins-of-victory-in-2016)
    - [Expected results](#expected-results-3)
- [`pres_districts` table](#pres_districts-table)
  - [B05. The number of districts, by winning party and election year, in which the margin of victory was less than 5 percent](#b05-the-number-of-districts-by-winning-party-and-election-year-in-which-the-margin-of-victory-was-less-than-5-percent)
    - [Expected results](#expected-results-4)
- [`disbursements` table](#disbursements-table)
  - [B06. List the 5 legislators who had the highest total expenditures for second quarter of 2017](#b06-list-the-5-legislators-who-had-the-highest-total-expenditures-for-second-quarter-of-2017)
    - [Expected results](#expected-results-5)
  - [B07. List the frequency and total amount (in millions) of legislators' expenditures by category, for categories with at least $1M in total amount](#b07-list-the-frequency-and-total-amount-in-millions-of-legislators-expenditures-by-category-for-categories-with-at-least-1m-in-total-amount)
    - [Expected results](#expected-results-6)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->



## `legislators` table


### B01. Count the number of men and women currently in Congress

Order the results by `gender`, i.e. the count for `'F'` should come before `'M'`.


In the expected results below, note the *alias* used as the column name for the aggregate count values. 








#### Expected results
| gender | count |
| ------ | ----- |
| F      | 106   |
| M      | 429   |


-------------


### B02. List the days of the year in which more than one Republican House rep has a birthday

This exercise requires using the `HAVING` clause, which is used to filter an aggregate value, which you can't with just `WHERE`.

Order the days in descending order of `birthdays`, and then in chronological order.









#### Expected results
| day   | birthdays |
| ----- | --------- |
| 03-01 | 6         |
| 08-24 | 5         |
| 02-16 | 4         |
| 03-03 | 4         |







### B03. Count the number of men and women, and get their average age, by political party and type (i.e. Senators vs. Representatives)

Order the results by `type`, then `party`, then `gender`.

Round the average age to the nearest tenth of a year (with the `ROUND` function).

While there is a "proper" way to do date calculations, that's not necessary here. The "age" for any given legislator can be calculated with arithmetic, using `2017` as the reference year (i.e. their age, roughly, in the year 2017) and subtracting the *year* component of their `birthday`.

For example, here's how to get a list of birthdays and their ages for 2017:

~~~sql
SELECT birthday,
  (2017 - SUBSTR(birthday, 1, 4)) AS age
FROM legislators;
~~~



#### Expected results
| type | party       | gender | average_age | count |
| ---- | ----------- | ------ | ----------- | ----- |
| rep  | Democrat    | F      | 63.1        | 63    |
| rep  | Democrat    | M      | 59.9        | 132   |
| rep  | Republican  | F      | 54.4        | 22    |
| rep  | Republican  | M      | 56.8        | 218   |
| sen  | Democrat    | F      | 61.8        | 16    |
| sen  | Democrat    | M      | 62.6        | 30    |
| sen  | Independent | M      | 74.5        | 2     |
| sen  | Republican  | F      | 60.4        | 5     |
| sen  | Republican  | M      | 62.9        | 47    |


## `pres_states` table

### B04. The number of states won by each respective party, as well as the minimum, average, and maximum margins of victory, in 2016

Round the average to the nearest tenth. List the results in descending order of states won.






#### Expected results
| winning_party | states_won | smallest_margin | average_margin | biggest_margin |
| ------------- | ---------- | --------------- | -------------- | -------------- |
| R             | 30         | 0.3             | 18.9           | 46.3           |
| D             | 21         | 0.3             | 17.7           | 86.8           |



## `pres_districts` table

### B05. The number of districts, by winning party and election year, in which the margin of victory was less than 5 percent






#### Expected results
| year | winning_party | district_count |
| ---- | ------------- | -------------- |
| 2012 | D             | 19             |
| 2016 | D             | 20             |
| 2012 | R             | 26             |
| 2016 | R             | 20             |




## `disbursements` table






### B06. List the 5 legislators who had the highest total expenditures for second quarter of 2017

Remember that expenditures by legislators' offices (as opposed to committees) means that the `bioguide_id` column is not `NULL`.






#### Expected results
| BIOGUIDE_ID | total_amount |
| ----------- | ------------ |
| G000571     | 400013.72    |
| M000087     | 390346.68    |
| H001045     | 358931.15    |
| E000215     | 357237.84    |
| B001295     | 353784.77    |




### B07. List the frequency and total amount (in millions) of legislators' expenditures by category, for categories with at least $1M in total amount


List the results in descending order of amount spent. 

For `total_millions`, round to the nearest tenth of a million. To get the amount in millions, do some arithmetic (i.e. divide by `1000000`)

This exercise requires the `HAVING` clause.




#### Expected results
| CATEGORY                       | total_things | total_millions |
| ------------------------------ | ------------ | -------------- |
| PERSONNEL COMPENSATION         | 33018        | 332.6          |
| PERSONNEL BENEFITS             | 14833        | 121.8          |
| OTHER SERVICES                 | 11166        | 37.0           |
| RENT  COMMUNICATION  UTILITIES | 42293        | 33.6           |
| EQUIPMENT                      | 6812         | 25.4           |
| SUPPLIES AND MATERIALS         | 37661        | 15.9           |
| TRAVEL                         | 42597        | 11.9           |
| PRINTING AND REPRODUCTION      | 7972         | 4.5            |
| FRANKED MAIL                   | 5316         | 3.4            |
| BENEFITS TO FORMER PERSONNEL   | 6            | 1.1            |

