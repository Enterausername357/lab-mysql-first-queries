SELECT * FROM lab_mysql_applestore.applestore2;
/*1. Which are the different genres?*/
SELECT  distinct prime_genre FROM applestore2;
/*this query returns us 23 distinct(unique)rows which says we have 23 uniaque genres*/

/*2. Which is the genre with more apps rated?*/
SELECT prime_genre, SUM(rating_count_tot) AS total_ratings
FROM applestore2
GROUP BY prime_genre;
/*this shows us a Social Networking genre which is rated 2974676 times! AFter this I looked at the table and saw, that there are lots of duplicated Games genre. 
So I foudn out it`s not as plain as I expected! The new query show the correct result: GAmes genre has the most ratings */

/*3. Which is the genre with more apps?*/
SELECT prime_genre, COUNT(*) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count DESC
LIMIT 5;
/*Games genre has the most apps*/

/*4. Which is the one with less?*/
SELECT prime_genre, COUNT(*) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count ASC
LIMIT 5;
/*Catalogs genre has the least apps*/

/*5. Take the 10 apps most rated. */
SELECT *
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;
/*Facebook
Instagram
Clash of Clans
Temple Run
Pandora - Music & Radio
Pinterest
Bible
Candy Crush Saga
Spotify Music
Angry Birds*/

/*6. Take the 10 apps best rated by users.*/
SELECT track_name, rating_count_tot, user_rating, prime_genre
FROM applestore2
ORDER BY rating_count_tot DESC, user_rating DESC  
LIMIT 10
/*there are many apps with max ratings, though an pp with 1 comment and an app with a 1000 comments cannot be equally estimated. 
I firstly find apps with the most number of reviews and afterwards filter them by user_rating. Pls, tell me if this is the correct approach here*/

/*7. Take a look on the data you retrieved in the question 5. Give some insights.
Insights: 
1) top apps are free, but have in-app purchases: price is 0, but there`s currency mentioned. 
2) currency USD shows us that developing companies are registered if not also located in USA. 
3) Bible app benefits severly from the faith of religious people - user_rating ver is 5 which is max. No other app can boast to have the same. 
4) Having lots of reviews isnt benefitable for Facebook: user_rating is 3.5. 
5) All top apps are appropriate for youg people: cont_rating is in range 4-12 yrs. 
6) The genres are Social Networking, Photo & Video, Games,Music - everything for entertainment! This might be tricky: 
show a category to compete (and lose) or to stay away from this categories and move into other. One won`t develop a new IG or FB, this market is already occupied. 
7) All the apps are well adapted to different devices: sup_devices.num is 37-43  */

/*8. Take a look on the data you retrieved in the question 6. Give some insights.
1) Accorfding to my method of counting the best ratings: FB is the leader again! Having not the best score of 3.5 but realy many reviews kepps its leadership
2) Top apps are Social media apps whic serve to communicate in context of any purpose: people are social creatures and these apps help to do it easier! 
3) Surprisingly, Pandora - Music & Radio has more reviews (rating_count_tot) than even Spotify! I`ve never heard of this app tbh. 
*/

/*9. Now compare the data from questions 5 and 6. What do you see?
I see, that the most rated are not always the best rated. */

/*10. How could you take the top 3 regarding the user ratings but also the number of votes?*/

FROM applestore2

SELECT track_name, rating_count_tot, user_rating
FROM applestore2
ORDER BY rating_count_tot DESC, user_rating DESC
LIMIT 3;
/*I`ve already implemented this approach in question 6. The top 3 is Facebook, Instagram, Clash of Clans. Top 3 apps are the same) 
In row 75 is just a text I can`t delete: otherwise there`s an error: SELECT is not valid atthis position, expect, expecting EOF, ';'. Would be great if you helped me to fix it as I couldnt*/

/*11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/
SELECT track_name, price, user_rating, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC, price ASC
LIMIT 10
/*AS the data shows, people dont care about the price as top apps are  usually free*/
SELECT 

SELECT track_name, price, user_rating, rating_count_tot
FROM applestore2
ORDER BY price DESC
LIMIT 10
/*The paid apps almost have no users, even though they`re relatively good by ratings. I`d say best things are free and there are plenty examples in tables above. 
At least, at the start and only some additional premium features could be charged*/




