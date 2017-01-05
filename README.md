####Ruby, SQL and Sinatra

##Pub of the Year

The Edinburgh pub of the year vote is underway! The Campaign for Real Ale would like an administration website to track the votes for the best pub as voted by the pubs themselves. Unfortunately, it’s a postal ballot :( and CAMRA need to enter the results into a web based application.

The rules are: 
*  Pubs can vote for other pubs but not themselves
*  Each pub has 3 votes to cast
*  Pubs can vote for each pub once

As an MVP CAMRA would like to: 
*  Enter pubs into their database 
*  Enter the votes for each pub 
*  Display the results in a league table

###Installing and Running App

* Ruby with Sinatra and PG Gems
* PostgreSQL

1. Clone repo using `git clone https://github.com/DianaM10/assignment1_pub_of_the_year.git`
2. Create psql database using `psql` then `create database pub_of_the_year`
3. Create database tables using `psql -d pub_of_the_year -f db/pub_of_the_year.sql`
4. Add seed data from root project folder using `ruby db/seed.rb` 
5. Start server from root project folder using 'ruby god_controller.rb'
6. Localhost:4567 on web browser





