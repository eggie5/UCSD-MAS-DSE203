#Homework 3

* Use string matching (levenstein etc) to find matching tuples between tables (GTD & GDELT)
* write some sort of rules based technique based on similarities. figure out if there are priorities involved w/ columns matched, so choose columns wisely


1) Start with a smaller sample of something like 200-300 tuples. Increase it incrementally to full later when you are sure about the code.
2) Input will be the two files- GTD and Gdelt.
3) Characterize which columns are of importance. Use only important columns for similarity comparison.
4)  Calculate weights for similarity measure based on  some assumptions, state them clearly.
5) Expected output is top 200 tuples of Gtd table and the corresponding tuple which each of them matches to in the Gdelt file, with the similarity score.

In other words, for each tuple in GTD, find the most similar one from Gdelt. Then output the matches with highest similarity score.

6) Figure out what similarity measure fits best for each column pair. Some of the python libraries to consider are- numpy, scikit-learn, scipy, editdistance 0.3.1, etc. You can use other measure of your choice. Some other helpful links are-

http://dataaspirant.com/2015/04/11/five-most-popular-similarity-measures-implementation-in-python/

http://chairnerd.seatgeek.com/fuzzywuzzy-fuzzy-string-matching-in-python/


The homework is due 2 weeks from now.

