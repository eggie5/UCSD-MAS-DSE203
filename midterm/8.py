import swalign
a = "US President Barak Obama"
b = "Obama, Barak Hussein, President"

# a= "Alex Egg"
# b=" Alexander David Egg"

# a="CGTGAATTCAT"
# b="GACTTAC"

match = 5
mismatch = -3
gap_penalty=-4

scoring = swalign.NucleotideScoringMatrix(match, mismatch)
sw = swalign.LocalAlignment(scoring, gap_penalty)  # you can also choose gap penalties, etc...
alignment = sw.align(a,b)
alignment.dump()