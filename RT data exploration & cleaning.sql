-- Count the Record Numbers in Each Table 
SELECT COUNT(*) FROM movies;
SELECT COUNT(*) FROM user_reviews;
SELECT COUNT(*) FROM critic_reviews;

-- Get a Sample of Records from each TABLE
SELECT * from movies limit 10
SELECT * from user_reviews LIMIT 10
SELECT * from critic_reviews LIMIT 10

-- Check for missing values 
-- From movies 
SELECT
	SUM(CASE WHEN movieId is NULL THEN 1 ELSE 0 END) AS missing_movieID,
	SUM(CASE WHEN movieTitle is NULL THEN 1 ELSE 0 END) AS missing_movieTitle,
	SUM(CASE WHEN movieYear is NULL THEN 1 ELSE 0 END) AS missing_movieYear,
	SUM(CASE WHEN movieURL is NULL THEN 1 ELSE 0 END) AS missing_movieURL,
	SUM(CASE WHEN critic_score is NULL THEN 1 ELSE 0 END) AS missing_critic_score,
	SUM(CASE WHEN audience_score is NULL THEN 1 ELSE 0 END) AS missing_audience_score
FROM movies;

-- From user_reviews 
SELECT 
    SUM(CASE WHEN movieId IS NULL THEN 1 ELSE 0 END) AS missing_movieId,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_rating,
    SUM(CASE WHEN quote IS NULL THEN 1 ELSE 0 END) AS missing_quote,
    SUM(CASE WHEN reviewId IS NULL THEN 1 ELSE 0 END) AS missing_reviewId,
    SUM(CASE WHEN isVerified IS NULL THEN 1 ELSE 0 END) AS missing_isVerified,
    SUM(CASE WHEN isSuperReviewer IS NULL THEN 1 ELSE 0 END) AS missing_isSuperReviewer,
    SUM(CASE WHEN hasSpoilers IS NULL THEN 1 ELSE 0 END) AS missing_hasSpoilers,
    SUM(CASE WHEN hasProfanity IS NULL THEN 1 ELSE 0 END) AS missing_hasProfanity,
    SUM(CASE WHEN score IS NULL THEN 1 ELSE 0 END) AS missing_score,
    SUM(CASE WHEN creationDate IS NULL THEN 1 ELSE 0 END) AS missing_creationDate,
    SUM(CASE WHEN userDisplayName IS NULL THEN 1 ELSE 0 END) AS missing_userDisplayName,
    SUM(CASE WHEN userRealm IS NULL THEN 1 ELSE 0 END) AS missing_userRealm,
    SUM(CASE WHEN userId IS NULL THEN 1 ELSE 0 END) AS missing_userId
FROM user_reviews;

-- From critic_reviews
SELECT 
    SUM(CASE WHEN reviewId IS NULL THEN 1 ELSE 0 END) AS missing_reviewId,
    SUM(CASE WHEN movieId IS NULL THEN 1 ELSE 0 END) AS missing_movieId,
    SUM(CASE WHEN creationDate IS NULL THEN 1 ELSE 0 END) AS missing_creationDate,
    SUM(CASE WHEN criticName IS NULL THEN 1 ELSE 0 END) AS missing_criticName,
    SUM(CASE WHEN criticPageUrl IS NULL THEN 1 ELSE 0 END) AS missing_criticPageUrl,
    SUM(CASE WHEN reviewState IS NULL THEN 1 ELSE 0 END) AS missing_reviewState,
    SUM(CASE WHEN isFresh IS NULL THEN 1 ELSE 0 END) AS missing_isFresh,
    SUM(CASE WHEN isRotten IS NULL THEN 1 ELSE 0 END) AS missing_isRotten,
    SUM(CASE WHEN isRtUrl IS NULL THEN 1 ELSE 0 END) AS missing_isRtUrl,
    SUM(CASE WHEN isTopCritic IS NULL THEN 1 ELSE 0 END) AS missing_isTopCritic,
    SUM(CASE WHEN publicationUrl IS NULL THEN 1 ELSE 0 END) AS missing_publicationUrl,
    SUM(CASE WHEN publicationName IS NULL THEN 1 ELSE 0 END) AS missing_publicationName,
    SUM(CASE WHEN reviewUrl IS NULL THEN 1 ELSE 0 END) AS missing_reviewUrl,
    SUM(CASE WHEN quote IS NULL THEN 1 ELSE 0 END) AS missing_quote,
    SUM(CASE WHEN scoreSentiment IS NULL THEN 1 ELSE 0 END) AS missing_scoreSentiment,
    SUM(CASE WHEN originalScore IS NULL THEN 1 ELSE 0 END) AS missing_originalScore
FROM critic_reviews;

-- Update missing values 
-- Critic reviews
UPDATE critic_reviews SET criticName = 'Unknown Critic' WHERE criticName IS NULL;
UPDATE critic_reviews SET criticPageUrl = 'No URL' WHERE criticPageUrl IS NULL;
UPDATE critic_reviews SET isRtUrl = 'No URL' WHERE isRtUrl IS NULL;
UPDATE critic_reviews SET reviewUrl = 'No URL' WHERE reviewUrl IS NULL;
UPDATE critic_reviews SET quote = 'No quote available' WHERE quote IS NULL;
UPDATE critic_reviews SET originalScore = 'Not Available' WHERE originalScore IS NULL;

-- User reviews
UPDATE user_reviews SET reviewId = 'Unknown' WHERE reviewId IS NULL;
UPDATE user_reviews SET userDisplayName = 'Anonymous' WHERE userDisplayName IS NULL;
