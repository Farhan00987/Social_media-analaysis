--  1. Most popular platforms by post engagement (using window function)

SELECT 
    platform,
    AVG(engagement_rate) AS avg_engagement_rate,
    RANK() OVER (ORDER BY AVG(engagement_rate) DESC) AS platform_rank
FROM (
    SELECT 
        platform,
        (likes_reactions + comments + shares_retweets) AS total_engagement,
        user_followers,
        (CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) AS engagement_rate
    FROM social_media_posts
) AS engagement_data
GROUP BY platform;


-- 2. Top 5 users with highest engagement rate (using subquery and window function)

select username, platform, engagement_rate, user_rank
from ( select username,platform,
	(CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) AS engagement_rate,
    rank() over (order by(CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) desc) as user_rank
from social_media_posts 
) as ranked_users
where user_rank <= 5;

-- 3. Comparison of verified vs non-verified accounts (using subquery)

select account_verification, avg(user_followers) as average_followers , avg(engagement_rate) as average_engagement_rate
from ( select account_verification, user_followers, 
	(CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) AS engagement_rate
from social_media_posts 
) as users_data
group by account_verification;

-- 4. Most used hashtags 

select hashtags , count(*) as usage_count
from social_media_posts
group by hashtags
order by usage_count desc
limit 10;

-- 5. User activity correlation with followers

select username, user_activity,user_followers,avg(user_followers) over (partition by user_activity) as average_follower_by_activity
from social_media_posts;

-- 6. cross platform engagement ananlysis

WITH platform_stats AS (
    SELECT 
        platform,
        AVG(CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) AS avg_engagement_rate,
        STDDEV(CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) AS stddev_engagement_rate
    FROM social_media_posts
    GROUP BY platform
)
SELECT 
    p.username,
    p.platform,
    (CAST(p.likes_reactions + p.comments + p.shares_retweets AS FLOAT) / p.user_followers) AS user_engagement_rate,
    ps.avg_engagement_rate AS platform_avg_engagement_rate,
    (((CAST(p.likes_reactions + p.comments + p.shares_retweets AS FLOAT) / p.user_followers) - ps.avg_engagement_rate) / ps.stddev_engagement_rate) AS engagement_z_score
FROM social_media_posts p
JOIN platform_stats ps ON p.platform = ps.platform
ORDER BY engagement_z_score DESC;


-- 7. Content type analysis

SELECT 
    CASE 
        WHEN LOWER(post_text) LIKE '%question%' THEN 'Question'
        WHEN LOWER(post_text) LIKE '%giveaway%' THEN 'Giveaway'
        WHEN media_type = 'Image' THEN 'Image Post'
        WHEN media_type = 'Video' THEN 'Video Post'
        ELSE 'Other'
    END AS content_type,
    AVG(engagement_rate) AS avg_engagement_rate,
    COUNT(*) AS post_count
FROM (
    SELECT 
        post_text,
        media_type,
        (CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) AS engagement_rate
    FROM social_media_posts
) AS post_data
GROUP BY 
    CASE 
        WHEN LOWER(post_text) LIKE '%question%' THEN 'Question'
        WHEN LOWER(post_text) LIKE '%giveaway%' THEN 'Giveaway'
        WHEN media_type = 'Image' THEN 'Image Post'
        WHEN media_type = 'Video' THEN 'Video Post'
        ELSE 'Other'
    END
ORDER BY avg_engagement_rate DESC;


-- 8. User growth analysis (using window function)

SELECT 
     username,
     account_creation_date,
     user_followers,
     user_following,
     DATEDIFF('2023-07-30', account_creation_date) AS account_age_days,
     user_followers / NULLIF(DATEDIFF('2023-07-30', account_creation_date), 0) AS followers_growth_rate_per_day,
     RANK() OVER (ORDER BY user_followers / NULLIF(DATEDIFF('2023-07-30', account_creation_date), 0) DESC) AS growth_rate_rank
 FROM social_media_posts
 ORDER BY growth_rate_rank;

-- 9. Geographical analysis of user base 

SELECT 
    server_post AS country,
    COUNT(DISTINCT username) AS user_count,
    SUM(user_followers) AS total_followers,
    AVG(CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) AS avg_engagement_rate,
    RANK() OVER (ORDER BY COUNT(DISTINCT username) DESC) AS country_rank
FROM social_media_posts
GROUP BY server_post
ORDER BY user_count DESC;


-- 10. Time-based engagement analysis

SELECT 
    EXTRACT(HOUR FROM post_timestamp) AS post_hour,
    AVG(CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) AS avg_engagement_rate,
    COUNT(*) AS post_count,
    RANK() OVER (ORDER BY AVG(CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) DESC) AS hour_rank
FROM social_media_posts
GROUP BY EXTRACT(HOUR FROM post_timestamp)
ORDER BY avg_engagement_rate DESC;

-- 11. Engagement rate trends over time 

SELECT 
    username,
    platform,
    post_timestamp,
    (CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) AS engagement_rate,
    AVG(CAST(likes_reactions + comments + shares_retweets AS FLOAT) / user_followers) OVER (
        PARTITION BY username 
        ORDER BY post_timestamp
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_engagement_rate
FROM social_media_posts
ORDER BY username, post_timestamp;

-- 12. Hashtag co-occurrence analysis 

WITH hashtag_pairs AS (
    SELECT 
        a.hashtags AS hashtag1,
        b.hashtags AS hashtag2
    FROM social_media_posts a
    JOIN social_media_posts b ON a.post_id < b.post_id
    WHERE a.hashtags <> b.hashtags
)
SELECT 
    hashtag1,
    hashtag2,
    COUNT(*) AS co_occurrence_count
FROM hashtag_pairs
GROUP BY hashtag1, hashtag2
ORDER BY co_occurrence_count DESC
LIMIT 20;
    
-- 13. Top 10 Accounts with Most Posts

SELECT 
    username, 
    COUNT(post_id) AS post_count 
FROM 
    social_media_posts 
GROUP BY 
    username 
ORDER BY 
    post_count DESC 
LIMIT 10;

-- 14. Growth in Followers Over Time

SELECT 
    YEAR(account_creation_date) AS year, 
    AVG(user_followers) AS average_followers 
FROM 
    social_media_posts 
GROUP BY 
    YEAR(account_creation_date) 
ORDER BY 
    year;



