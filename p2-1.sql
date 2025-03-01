with d as (
 select Entity, Code, count(*) AS cnt 
 from infectious_cases 
 group by 1,2
 )
select 
  count(*) AS all_uniq, 
  count(distinct Code) AS cnt_code, 
  sum(cnt) AS `all`
from d;