DROP TABLE IF EXISTS pres_states;

CREATE TABLE pres_states (
    state TEXT,
    year INTEGER,
    democrat DECIMAL,
    republican DECIMAL,
    winning_party TEXT,
    winning_margin DECIMAL
);

CREATE INDEX pres_states_on_state_year ON pres_states(state, year);
CREATE INDEX pres_states_on_year_state ON pres_states(year, state);

UPDATE pres_states set winning_party = 'R' WHERE winning_party = 'rep';
UPDATE pres_states set winning_party = 'D' WHERE winning_party = 'dem';



DROP TABLE IF EXISTS pres_districts;
CREATE TABLE pres_districts (
    district TEXT,
    year INTEGER,
    democrat DECIMAL,
    republican DECIMAL,
    winning_party TEXT,
    winning_margin DECIMAL
);

CREATE INDEX pres_districts_on_district_year ON pres_districts(district, year);
CREATE INDEX pres_districts_on_year_district ON pres_districts(year, district);


DROP TABLE IF EXISTS legislators;

CREATE TABLE legislators (
    bioguide_id TEXT,
    last_name TEXT,
    first_name TEXT,
    type TEXT,
    party TEXT,
    state TEXT,
    district TEXT,
    gender TEXT,
    birthday TEXT,
    twitter TEXT,
    facebook TEXT,
    url TEXT
);



CREATE INDEX legislators_index_on_bioguide_id ON legislators(bioguide_id);
CREATE INDEX legislators_index_on_state_district ON legislators(state, district);


DROP TABLE IF EXISTS disbursements;
CREATE TABLE disbursements (
    "BIOGUIDE_ID" TEXT,
    "OFFICE" TEXT,
    "YEAR" INTEGER,
    "QUARTER" TEXT,
    "CATEGORY" TEXT,
    "PAYEE" TEXT,
    "PURPOSE" TEXT,
    "AMOUNT" DECIMAL
);


CREATE INDEX disbursementsindex_on_bioguideid ON disbursements(bioguide_id);
CREATE INDEX disbursementsindex_on_category ON disbursements(category);
CREATE INDEX disbursementsindex_on_purpose ON disbursements(purpose);
CREATE INDEX disbursementsindex_on_payee ON disbursements(payee);
