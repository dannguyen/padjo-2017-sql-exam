UPDATE legislators
SET district = '0' || district
WHERE CAST(district AS INTEGER) < 10
    AND district IS NOT NULL
    AND SUBSTR(district, 1, 1) != '0';
