
SELECT * FROM `brownliving-test`.city;
use `brownliving-test`;
SELECT *  from city   LEFT JOIN state as s  ON state_id=s.id;

SELECT c.id,city_name, state_id  , s.state_name as state_name FROM city as c, state s where c.state_id =s.id;

SELECT 
    c.id, 
    c.city_name, 
    c.abbr AS city_abbr, 
    s.state_name 
FROM 
    city AS c
JOIN 
    state AS s 
ON 
    c.state_id = s.id;
