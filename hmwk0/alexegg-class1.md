#Integration Issues: Write down the integration challenges for the 3 use cases

Alex Egg

##Usecase 1 Bank

The company wants a unified global view of all customers across both legacy databases, so we need to find out which individuals are common between the two databases.

The first issue is matching a customer from the bank to the ins company, names may not be identical and SSN is not stored in the ins company.

Some issues w/ identifing common users:

* people in both
* people in the bank b/c they have loan and used to be in the insurance company, but not anymore



## Usecase 2 CDC

The CDC wants to integrate disparate databases from hospitals/labs/etc from all around the country into 1 database.

Some issues that may arrise w/ this integration is identifying common medical terms. For example, some language might say "skin cancer" while another might say "carcinoma" and while both mean the same thing, it's not possible for a computer to make the connection. There would need to be some type of global lookup table to map varous terms used across the country to a common name.

Another major issue would be the integration of hospital system w/ the central CDC system regarding data transmission. The goal of the CDC is a continous health monitoring system so local hospitals have an electronic method must push data to the central system. So a standardized method would need to be proposed and all the local agencies would need to adopt the standard.


## Usecase 3 CRM

The company would like a way to integrate all the sources of customer information into a central repository. For example, notes from customer service calls, notes from service reps in the field and also online reviews from 3rd parties (social networks) that customers use.

I think the unique issue here (asside from the first 2 use cases) is integration w/ the 3rd parties especially the social networks. First of all the 3rd parites may not have any official (API) methods of pulling out the data or querying. Another issue is the unique structure of social networks (graphs) may not fit will into the standard relational model that the company probably uses. Also, how do we match an internal customer w/ a profile on a 3rd party, this is a Entity Matching problem. Then to make any good use of the social media posts/reviews there would have to be some system to analyize the human language and structure it which is not trivial.