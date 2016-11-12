Homework 2
Please find a file called "GTD with errors" in the "Data Sets" folder. This is the almost the same as the original GTD file with some unnecessary columns removed. Some of the data items have errors. Your homework is:

(a) identify erroneous data

(b) write down the integrity constraints they violate - specify the type of constraint violation, and the express the constraint in Datalog syntax. Remember that one error can violate multiple integrity constraints. 

(c) use your ETL tool to convert the single-table schema to the normalized schema you defined in HW 1. Make sure that only the error-free tuples are placed into the normalized schema. If in the process you *correct* (i.e., repair) some errors, demonstrate how you corrected the data.


The desired result that you will be handing over would be like-

1. Find the errors in clover etl.

2. In a separate word file/ pdf/ scan of hand written statements-

list the error

for each error, specify the type of constraint violation, and the express the constraint in Datalog syntax

Normalize the tables, the final data should be error free

that will be a demo in clover.


***

Some thoughts on Homework 2
What are some of the possible errors-

Errors are typically values that do not comply with some obvious constraints in the table like-

Are primary key values unique?

Is the City actually inside the state that is mentioned?

Is no. of people killed in us less than no. of people killed overall?

These are some lines on which you should think.


How to read data from 1 file and distribute it among different components so that they execute it parallelly?

Try exploring  SimpleCopy option.   you can read more here.  


2. How to split 1 data file into two and creating foreign keys. For example, I have a Table Person(Name, Gender Code, Gender Type) where gender code in 1 or 0 and gender type is M or F. Where M =0 and F =1. I want to split the gender code and type fields into a separate table, so that it has only two records 0 --- M and 1---F . How to do this?. This is the third normal form. Currently, the normalizer transformer only splits a row into multiple rows. 

Answer:

Use the Aggregate components, you can read more here.  The following is the steps you need to take to accomplish your use case:

Sort the input based on  Gender Code and Gender Key

The output metadata of the Aggregate should be the Gender Code and Gender Key

In the Aggregate key property choose both the Gender Code and Gender Key

In the Aggregate mapping under the Function tab choose fisrtnonnull for both Gender Code and Gender Type. In the mapping tab, connect corresponding inputs and outputs.

***

Homework Hints- Columns to look for
Lat longs covering a city

country and its text are ok?

are there different variations of spellings for same thing in cities

primary key

even if primary key is different, but the content of rows is exactly the same, is this an error?


relationships between things that happened in us and things that happened worldwide, like nkills and also their values


coountry city zipcodes state relationships


does event id have a pattern?


parent child columns like attacktypes should follow parent child hirearchy. 


region_text and country

org names can refer to more than 1 thing

is there any relation of summary with the location of attack?

***

Definitions for Constraints in the homework 2
page 312 in the book-

http://download.springer.com/static/pdf/970/bok%253A978-3-319-32055-7.pdf?originUrl=http%3A%2F%2Flink.springer.com%2Fbook%2F10.1007%2F978-3-319-32055-7&token2=exp=1477195740~acl=%2Fstatic%2Fpdf%2F970%2Fbok%25253A978-3-319-32055-7.pdf%3ForiginUrl%3Dhttp%253A%252F%252Flink.springer.com%252Fbook%252F10.1007%252F978-3-319-32055-7*~hmac=8f3892eba3e5f3a53e86bd5af859b6b049a352788cefba79faa65f31a4d00d20


this is referred to in the slides