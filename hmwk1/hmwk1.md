#HMWK 1

Re-write the following queries from the schema you created in part 1

##Q1

```
select eventid, iyear
from GTD
where region_text like '%Africa'
```

Normalized Query:

```
select gtd.id, year
from GTD
join regions on regions.id = gtd.region
where regions.name like '%Africa'
```

##Q2
```
select iday, imonth, iyear, city, country_txts
from GTD
where nkill > 5 and weapdetail like '%bomb%'
```

Normalized Query:

```
select day, month, year, city, country
from GTD
where gtd.nkill > 5 and gtd.weapdetail like '%bomb%'
```


##Q3

```
select G1.eventid, G2.eventid
from GTD G1, GTD G2
where
G1.eventid <> G2.eventid and
G1.iday = G2.iday and
G1.imonth = G2.imonth and
G1.iyear = G2.iyear and
G1.country = G2.country and
G1.weaptype1 = G2.weaptype1
```

Normalized Query:

```
select G1.id, G2.id
from GTD G1, GTD G2
where
G1.id <> G2.id and
G1.day = G2.day and
G1.month = G2.month and
G1.year = G2.year and
G1.country = G2.country and
G1.weaptype1 = G2.weaptype1
```

##Q4
 
```
select eventid
from GTD where
targtype1 = 2 or targtype2 = 2
```

Normalized Query:

```
select gtd.id
from GTD where
targtype1 = 2 or targtype2 = 2
```
 
##Q5

```
select summary
from GTD
where
country_txt = 'Afghanistan' and
motive is not null
```

Normalized Query:

```
select gtd.summary
from GTD
join countries on countries.id = gtd.country
where
countries.name = 'Afghanistan' and
motive is not null
```