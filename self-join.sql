## TABLE 1 -> stops(id, name)
## TAVLE 2 -> route(num, company, pos, stop)
# LINK -> https://sqlzoo.net/wiki/Edinburgh_Buses.

#--1. How many stops are in the database.

SELECT COUNT(*)
FROM stops

#--2. Find the id value for the stop 'Craiglockhart'

SELECT id
FROM stops
WHERE name='Craiglockhart'

#--3. Give the id and the name for the stops on the '4' 'LRT' service.

