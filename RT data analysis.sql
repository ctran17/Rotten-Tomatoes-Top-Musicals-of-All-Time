-- Top-rated movies by critics with average user ratings 
SELECT m.movieTitle, m.critic_score, AVG(u.rating) AS avg_user_rating
FROM movies m
JOIN user_reviews u ON m.movieId = u.movieId
GROUP BY m.movieTitle, m.critic_score
ORDER BY CAST(m.critic_score AS INTEGER) DESC
LIMIT 10

-- Top-rated movies by audience with average critic ratings
SELECT m.movieTitle, m.audience_score, AVG(CAST(c.originalScore AS INTEGER)) AS avg_critic_rating
FROM movies m
JOIN critic_reviews c ON m.movieId = c.movieId
GROUP BY m.movieTitle, m.audience_score
ORDER BY CAST(m.audience_score AS INTEGER) DESC
LIMIT 10

--Distribution of user ratings with count and average
SELECT rating, COUNT(*) AS count, AVG(score) AS avg_score
FROM user_reviews
GROUP BY rating
ORDER BY rating;

-- Distribution of Verified and Non-Verified User Reviews 
SELECT isVerified, AVG(rating) as avg_rating, COUNT(*) as count
FROM user_reviews
GROUP BY isVerified

--Analysis of Reviews with Spoilers and Profanity
SELECT hasSpoilers,
	COUNT(*) AS count,
	AVG(rating) AS avg_rating,
	COUNT(*) * 100 / (SELECT COUNT(*) FROM user_reviews) AS perc_of_total_rating
FROM user_reviews
GROUP BY hasSpoilers;

SELECT hasProfanity,
	COUNT(*) AS count,
	AVG(rating) AS avg_rating,
	COUNT(*) * 100 / (SELECT COUNT(*) FROM user_reviews) AS perc_of_total_rating
FROM user_reviews
GROUP BY hasProfanity

-- Sentiment analysis of critic reviews 
SELECT scoreSentiment,
	COUNT(*) AS count,
	AVG(CAST(originalScore AS INTEGER)) AS avg_score
FROM critic_reviews
GROUP BY scoreSentiment
ORDER BY count DESC;

-- Time series analysis of user and critic reviews over the years
SELECT strftime('%Y', creationDate) AS review_year,
	COUNT(*) AS review_count,
	AVG(rating) AS avg_rating
FROM user_reviews
GROUP BY review_year
ORDER BY review_year DESC

SELECT strftime('%Y', creationDate) AS review_year,
	COUNT(*) AS review_count,
	AVG(CAST(originalScore AS INTEGER)) AS avg_score
FROM critic_reviews
GROUP BY review_year
ORDER BY review_year DESC