#TABLE 1 -> movie (id, title,	yr,	director,	budget,	gross )
#TABLE 2 -> actor (id,	name )
#TABLE 3 -> casting (movieid,	actorid,	ord)

#1. List the films where the yr is 1962 [Show id, title]

SELECT id, title
 FROM movie
 WHERE yr=1962
 
#2. When was Citizen Kane released?

SELECT yr
FROM movie
WHERE title='Citizen Kane'

#3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id,title,yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

#4. What id number does the actor 'Glenn Close' have?

SELECT id
FROM actor
WHERE name='Glenn Close'

#5. What is the id of the film 'Casablanca'

SELECT id
FROM movie
WHERE title = 'Casablanca'

#6. Obtain the cast list for 'Casablanca'.
what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question)

SELECT name
FROM actor JOIN casting ON casting.actorid = actor.id
WHERE movieid=11768

**OR**

SELECT name
FROM actor 
JOIN casting ON casting.actorid = actor.id
WHERE movieid = (SELECT id 
                  FROM movie 
                    WHERE title='Casablanca')
                    
 #7. Obtain the cast list for the film 'Alien'

SELECT name
FROM actor 
JOIN casting ON casting.actorid = actor.id
WHERE movieid = (SELECT id 
FROM movie 
WHERE title='Alien')

#8. List the films in which 'Harrison Ford' has appeared

SELECT title
FROM movie
JOIN casting ON id=movieid
WHERE actorid = (SELECT id 
                  FROM actor 
                  WHERE name='Harrison Ford')
                  
 #9. List the films where 'Harrison Ford' has appeared - but not in the starring role. 
 [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
 
SELECT title
FROM movie
JOIN casting ON id=movieid
WHERE actorid = (SELECT id 
                  FROM actor 
                  WHERE name='Harrison Ford') 
AND ord <> 1

#10. 

                 
