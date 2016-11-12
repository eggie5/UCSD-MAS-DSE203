Mid Term Exam
All questions except Q8 are worth 5 points each. Please provide short answers (4-6 sentences) for each. Q8 is worth 10 points.


1. What is virtual data integration? When is virtual data integration undesirable?

There are a variety of possible architectures for data integration: warehousing and virtual integration. In virtual integration, the data remains in the sources and are accessed as needed at query time.

If the data is volatile, the warehousing method would incur a lot of overhead: not optimal. Warehouse/materialization is good when you want historical data — in order to do analytics. Virtual table is more vulnerable to network delays or source failures. 


2. What is data exchange in the context of data integration? Where is data exchange used?

The main advantage of data warehousing is that it can support complex queries more efficiently. Data exchange is an architecture in which we have a source database and our goal is to translate the data and store them in a target database that has a different schema, and answer queries over the target database. 

The process of data exchange results in a materialized central database, much like the data warehouse, except that the data transformations are specified declaratively as in our prior discussions of virtual data integration. 

3. When should Affine Gap Measure be used in preference to the Smith-Waterman Method for string comparison? Give examples.

It depends on your goals. If your data has large gaps, then SW would penalize more heavily than Affine Gap Measure b/c it extension of the Needleman-Wunch measure that handles longer gaps more gracefully. Affine considers global alignments while SW works well when you want to match on arbitrary substrings in your data or local alignments.

An score function using an Affine Gap Measure would excel w/ the scenario below w/ a long gap between David and Smith.
David Smith
David Richardson Smith


4. Give an example of conditional inclusion dependency and its use in data cleaning.

Example from the credit card account holder example in the class slides: An disjoint constraint prohibits that holder and joint holder roles be exerted by the same customer. However, there are a customer (c2) with both roles on the same card (cc4 and cc10). This will help in data cleaning b/c it ensures that a relation is not in two mutually exclusive states at the same time. For example, the user in the credit card example cant be the holder and not the holder at the same time (as is the case in the class slides).

5. How is query unfolding used in data integration?

It is used to rewrite a mediated query into their reduced form to query the source relations. In the context of data integration, query unfolding will be used to reformulate a query posed over a mediated schema into a query referring to data sources.

6. Give an example of semantic heterogeneity in the context of data integration.

The difference between two schemas, the mediator and source: Data from multiple sources can only be integrated if we bridge this so-called semantic heterogeneity. In fact, semantic heterogeneity turns out to be a major bottleneck for data integration. Here are some more detailed examples from the text: 

The underlying reason for semantic heterogeneity is that schemas are created by different people whose tastes and styles are likely to be different. We see the same phenomenon when comparing computer programs written by different programmers. Even if two programmers write programs that behave exactly the same, it is likely that they will structure the programs differently, and certainly name variables in different ways. Another fundamental source of heterogeneity is that disparate databases are rarely created for the exact same purpose. In our example, even though both schemas model movies, the DVD vendor is managing its inventory, while the aggregator is concerned only with customer-facing attributes. (125)

Finally, the representation of the data can be significantly different as well. For example, in FullServe’s Employee database, the company records the first, middle, and last name of every employee in a separate field. In the Training database, it only records the full name of the employee in a single field, and as a result, names often occur in various formats, such as (First, Last) or (Last, First Initial). Consequently, it may be hard to match records from these two databases. The same problem occurs between the Sales and Services databases. While the Sales database only records a field for the name and a field for the address, the Services database records much finer-grained information about each subscriber. Of course, the units of measure will differ as well: FullServe uses American dollars for prices, while EuroCard uses Euros. Since the exchange rate between the currencies constantly changes, the correspondence between the values cannot be set a priori.

(8)



7. Consider two tables T1 and T2 where T1 contains two columns for latitude and longitude and T2 has one column containing latitude and longitude separated by a comma (,). What would be your data matching strategy for this information?

First we would merge the columns of T1 into 1 full_name column. Then we can do data matching on the two columns. A good technique for measuring similarity between latitude and longitude would be Euclidean distance measure with a more significant weight on the characters to the left of the "." in the GPS string, eg: "-117.23423" b/c they are more significant than the fraction part.


8. Consider the strings "US President Barak Obama" and "Obama, Barak Hussein, President". Use a suitable string matching method to find their similarity and justify your choice of algorithm.

The Smith-Waterman Measure
The previous measures consider global alignments between the input strings. That is, they attempt to match all characters of x with all characters of y.

Global alignments may not be well suited for some cases. For example, consider the two strings Prof. John R. Smith, Univ of Wisconsin and John R. Smith, Professor. The similarity score based on global alignments will be relatively low. In such a case, what we really want is to find two substrings of x and y that are most similar, and then return the score between the substrings as the score for x and y. For example, here we would want to identify John R. Smith to be the most similar substrings of the above two strings. This means matching the above two strings by ignoring certain prefixes (e.g., Prof.) and suffixes (e.g., Univ of Wisconsin in x and Professor in y). We call this local alignment.

The Smith-Waterman measure is designed to find matching substrings by introducing two key changes to the Needleman-Wunch measure.

US President Barak Obama
Obama, Barak Hussein, President

Python code to match the substrings using Smith-Waterman:

```
match = 2
mismatch = -1
gap_penalty= -1
In [21]: alignment = sw.align('US President Barak Obama','Obama, Barak Hussein, President')

In [22]: alignment.dump()
Query: 22  President 31
          ||||||||||
Ref  :  3  President 12

Score: 20
Matches: 10 (100.0%)
Mismatches: 0
```


OR if I tweak the parameters:

```
match = 5
mismatch = -3
gap_penalty=-4

Query: 22  President 31
          ||||||||||
Ref  :  3  President 12

Score: 50
Matches: 10 (100.0%)
Mismatches: 0
CIGAR: 10M
```

(102)


9. Give a practical example where binding patterns are used for querying a data source.

A query system that lets you check where your paper was cited. But you can't check the inverse where, given a citation, check what papers use it.

10. Illustrate with an example how sorting can help the scaling up of rule based data matching.

Sorting: We use a key to sort the tuples, then scan the sorted list and match each tuple with only the previous (w − 1) tuples, where w is a prespecified “window size.” The key should be strongly discriminative, in that using it to sort “brings together” tuples that are likely to match and “pushes apart” tuples that are not likely to match. 

For example, we may hash houses into buckets using zip codes, then sort houses within each bucket using street names, before matching them using a sliding window. As another example, we can use hashing, sorting, or indexing to speed up the application of the cheap similarity measure in the canopy technique.(204)

11. When should the generalized Jaccard similarity measure be used for string matching?

Jaccard measure is useful when words are drawn form some finite domain or set. For example: movie ratings, book titles or country names. 



12. Suppose we know that source S1 with table T1(eventID, eventType, eventDate, eventCountry, eventCity, responsibleParty, eventDescription) is complete for the countries 'USA', 'Iraq', and 'Germany'. How does this knowledge help us in the integration of this source with another data source on organizations that claim responsibility for an event?


If we know that data sources are complete for USA, Iraq and Germany, the system can save work by not accessing other datasources that have overlapping data. This means that we don’t have to access any sources that have only USA, only Iraq and only Germany data. Additionally, We can use this heuristic (knowing certain countries have missing data) to do the join w/ s2 more intelligently. For example, knowing that a join using s1 and s2 w/ a country outside of the approved list might fail b/c of missing data.


13. Suppose we have a source schema:

```
Patient(pid, name, healthplan, date) 
Doctor(pid, docid) 
```

and a target schema

```
History(pid, plan, date, docid) 
Physician(docid, name, office)
```

and the mapping Patient(x,y,z,u), Doctor(x,v) → History(x,z,u,v)

What kind of schema mapping is this? Explain your reasoning.


This is an example of GLAV schema mapping because the source is a subset of the target.


14. Write the query
 
```
select e.name, e.salary, p.title 
from employees e, projects p 
where e.works_in = p.title and e.salary > 100000" 
```

in Datalog.


```
Ans(name, works_title) :- Employee(name, salary, title, works_title), Project(works_title), salary > 100000
```

15. Explain the concept of producing "certain answers" against a mediated schema.

This describes the obvious constraint that you must put on your mediated schema that says: any relation defined in your mediated schema must exist in some form in the source schemas. In other words: the mediated schema can't specify data, the source schema doesn't define.

16. Is TF-TDF a good measure to match tweets? If so, explain why. If not, how would you match them?

It depends on what your goals are. If you are looking for a method that puts heavy weight on unique tokens in the corpus of documents, then yes, TF/IDF would be a good solution, b/c it is designed to work on a large number of documents which could be considered tweets. 

17. With an example show how a conditional functional dependency can be expressed as a denial constraint for data cleaning.

Example: The Customer relation has a conditional functional dependency between State, City and Zipcode, denoted by [State, City → ZipCode, Tp]. Pattern Tableau Tp specifies that state “SP” and city “SP” uses the zipcode range between 08000 and 08499, while the same state and city “SJC” has a zipcode range from 12200 to 12248. However, the tuples c7 and c11 violate these patterns

Conditional functional Dependency
Let R(A, B, C) be a relation
If C = c1, A→B, not otherwise
If country = 'us', zip→city

18. Give an example where a logistic regression rule should be used for data matching between two relational tables.

High dimensionality (# of columns) would favor a rule-based logistical regression, b/c the a decision tree would be too deep and the computational cost would be too expensive. 

19. What is "semantic match" in the context of data integration?

It's when you match something w/ the same meaning but it is represented by a different column. Users use different identifiers in different systems. Can we match the identities of users by comparing the rest of their data records? For example Hospital A's record vs Hospital B's record the names are close but not exact.