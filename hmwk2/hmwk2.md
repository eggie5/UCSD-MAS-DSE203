# Denial Constraints

## Countries


Multiple keys in the country table violate the  `Key Dependency Violation` constraint.

```
15,Pakistan
15,Austria
28,Bosnia
28,Yemen
```

Correct Values:
```
15, Austria
28, Bosnia
153, Pakistan
228, Yemen
```

```
∀¬ (Country (country, country_txt) ∧
 Country(country', country_txt')) ∧
 (country == country') ∧
 (country_txt ≠ country_txt'))
```

---

## GTD (Main table)

`approxdate` date format is not consistent, which is classified `Taxonomy (Heterogeneous Measurement Unit)`. 

```
Heterogeneous measurement unit holds iff  ∃ t ∈ GTD t[approxdate] ∉ Ω
Ω = set of columns that have same format
```


---

##Duplicate Eventids

Two primary keys cannot be the same. Two keys have eventid: `201409030053` which is a `Key Dependency Violation`

```
∀¬ (gtd (event_id, others) ∧
 gtd(event_id', others')) ∧
 (event_id == event_id') ∧
 (other ≠ other'))
```

##Duplicate Key Violation

Multiple rows starting w/ `eventid: 2012` - `2015` have duplicate content which violates the `Duplicate Tuple Violation`

Duplicate keys examples:

```
201201040017
201201060009
201201190022
201201190023
```

```
∀¬ (gtd (event_id, all_columns) ∧
 gtd(event_id', all_columns')) ∧
 (all_columns == all_columns') ∧
 (event_id ≠ event_id'))
```

NOTE: `all_columns` is a macro shortcut to represent all the columns of the row


---


## Regions table

3 duplicates of id: 9 which viloate the `Key Dependency Violation` constraint

```
9,Eastern Europe
9,Europe
9,Russia
```

```
∀¬ (Region (region, region_txt) ∧
 Region(region', region_txt')) ∧
 (region == region') ∧
 (region_txt ≠ region_txt'))
```

---

## Cities

Baghdad is spelled wrong in the GTD table


---

##Lat/Lng

There is an `Atypical Value` in the lat/lng values

True is std dev > 6




