-- database creation

create database social_media;

-- table creation

CREATE TABLE social_media_posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    username VARCHAR(50),
    platform VARCHAR(20),
    post_id VARCHAR(20),
    post_text TEXT,
    post_timestamp DATETIME,
    likes_reactions INT,
    comments INT,
    shares_retweets INT,
    hashtags TEXT,
    media_type VARCHAR(20),
    media_url VARCHAR(255),
    post_url VARCHAR(255),
    location VARCHAR(100),
    privacy_settings VARCHAR(20),
    user_followers INT,
    user_following INT,
    account_creation_date DATE,
    account_verification VARCHAR(20),
    user_engagement INT,
    user_interactions INT,
    user_activity VARCHAR(50),
    user_bio TEXT,
    user_description_1 VARCHAR(255),
    user_description_2 VARCHAR(255),
    server_post VARCHAR(100),
    user_language VARCHAR(20)
);

-- Create indexes
CREATE INDEX idx_username ON social_media_posts(username);
CREATE INDEX idx_platform ON social_media_posts(platform);
CREATE INDEX idx_post_timestamp ON social_media_posts(post_timestamp);

-- Insert all data into the social_media_posts table
INSERT INTO social_media_posts (user_id, username, platform, post_id, post_text, post_timestamp, likes_reactions, comments, shares_retweets, hashtags, media_type, media_url, post_url, location, privacy_settings, user_followers, user_following, account_creation_date, account_verification, user_engagement, user_interactions, user_activity, user_bio, user_description_1, user_description_2, server_post, user_language)
VALUES 
(101, '@adventureSeeker', 'Instagram', '82036', 'Experiencing the thrill of a lifetime! #AdventureTime', '2023-07-30 14:45:00', 1500, 250, 120, '#AdventureTime', 'Image', 'http://example.com/adventure.jpg', 'http://instagram.com/adventureSeeker/82036', 'Yosemite National Park', 'Public', 15000, 500, '2019-05-10', 'Verified', 1870, 15700, '3 posts per week', 'Adventure enthusiast', 'Nature lover', 'Seeker of wanderlust ??', 'California, USA', 'English'),
(303, '@wellnessJourney', 'Facebook', '45982', 'Finding peace and balance in nature!', '2023-07-30 08:15:00', 680, 80, 40, '#WellnessJourney', 'Image', 'http://example.com/wellness.jpg', 'http://facebook.com/wellnessJourney/45982', 'Bali, Indonesia', 'Public', 6000, 200, '2020-03-02', 'Not verified', 800, 6200, '2 posts per week', 'Wellness enthusiast', 'Yogi in training', 'Mindfulness advocate', 'San Francisco, USA', 'English'),
(404, '@fitnessFreak', 'Instagram', '16572', 'Pushing my limits in the gym!', '2023-07-30 12:30:00', 1850, 350, 180, '#FitnessGoals', 'Image', 'http://example.com/fitness.jpg', 'http://instagram.com/fitnessFreak/16572', 'Los Angeles, USA', 'Public', 32000, 400, '2016-08-12', 'Verified', 2380, 32750, '4 posts per week', 'Fitness enthusiast', 'Health is wealth', 'Workout addict', 'Los Angeles, USA', 'English'),
(609, '@wanderlustSoul', 'Facebook', '24680', 'Embracing the beauty of nature!', '2023-07-30 09:45:00', 1200, 110, 50, '#Wanderlust', 'Image', 'http://example.com/wanderlust.jpg', 'http://facebook.com/wanderlustSoul/24680', 'Bali, Indonesia', 'Friends Only', 9500, 650, '2019-09-05', 'Not verified', 1360, 10850, '2 posts per week', 'Traveler at heart ??', 'Nature lover', 'Free spirit', 'Bali, Indonesia', 'English'),
(825, '@petWhisperer', 'Instagram', '98342', 'Connecting with furry friends!', '2023-07-30 15:55:00', 2200, 320, 200, '#PetLove', 'Image', 'http://example.com/pet.jpg', 'http://instagram.com/petWhisperer/98342', 'New York City, USA', 'Public', 18500, 1000, '2022-03-29', 'Verified', 2720, 21600, '2 posts per week', 'Animal lover', 'Cat whisperer', 'Pet advocate', 'New York City, USA', 'English'),
(926, '@bookwormLife', 'Facebook', '57481', 'Diving into the magical world of books!', '2023-07-30 17:30:00', 780, 60, 40, '#BookNerd', 'Image', 'http://example.com/book.jpg', 'http://facebook.com/bookwormLife/57481', 'London, UK', 'Public', 8200, 700, '2018-09-20', 'Not verified', 880, 9620, '4 posts per week', 'Bibliophile', 'Literature lover', 'Word devourer', 'London, UK', 'English'),
(104, '@foodPhotog', 'Instagram', '20589', 'Capturing delicious moments!', '2023-07-30 12:15:00', 1100, 120, 80, '#FoodPhotography', 'Image', 'http://example.com/food.jpg', 'http://instagram.com/foodPhotog/20589', 'Paris, France', 'Friends Only', 5000, 400, '2017-12-05', 'Verified', 1300, 5700, '3 posts per week', 'Foodie by heart', 'Gastronomy explorer', 'Cuisine critic', 'Paris, France', 'English'),
(427, '@petRescuer', 'Instagram', '14236', 'Giving furry friends a second chance!', '2023-07-30 11:50:00', 1350, 280, 150, '#AdoptDontShop', 'Image', 'http://example.com/pet_rescue.jpg', 'http://instagram.com/petRescuer/14236', 'San Francisco, USA', 'Public', 11000, 900, '2016-11-19', 'Verified', 1780, 12900, '3 posts per week', 'Animal advocate', 'Pet rescuer', 'Compassionate soul', 'San Francisco, USA', 'English'),
(598, '@natureLover', 'Instagram', '95641', 'Finding serenity in the beauty of nature!', '2023-07-30 18:50:00', 1220, 180, 100, '#NatureLove', 'Image', 'http://example.com/nature.jpg', 'http://instagram.com/natureLover/95641', 'Vancouver, Canada', 'Friends Only', 7500, 300, '2018-06-15', 'Not verified', 1500, 9100, '2 posts per week', 'Nature admirer', 'Wanderlust seeker', 'Outdoor enthusiast', 'Vancouver, Canada', 'English'),
(943, '@fashionIcon', 'Instagram', '30420', 'Setting trends with style!', '2023-07-30 11:40:00', 1750, 320, 220, '#Fashionista', 'Image', 'http://example.com/fashion.jpg', 'http://instagram.com/fashionIcon/30420', 'New York City, USA', 'Public', 28000, 400, '2016-07-10', 'Verified', 2290, 28400, '4 posts per week', 'Fashion enthusiast', 'Style influencer', 'Trendsetter', 'New York City, USA', 'English'),
(158, '@gamerGeek', 'Twitch', '74859', 'Leveling up in the gaming world!', '2023-07-30 13:25:00', 1120, 180, 100, '#GamerLife', 'Video', 'http://example.com/gaming_stream.mp4', 'http://twitch.tv/gamerGeek/74859', 'Seattle, USA', 'Public', 6500, 600, '2020-02-28', 'Not verified', 1400, 7700, '2 posts per week', 'Gaming enthusiast', 'RPG fanatic', 'Virtual world explorer', 'Seattle, USA', 'English'),
(405, '@petLover', 'Instagram', '12543', 'Spreading love, one paw at a time!', '2023-07-30 19:20:00', 1080, 190, 80, '#PetAdventures', 'Image', 'http://example.com/pet2.jpg', 'http://instagram.com/petLover/12543', 'Sydney, Australia', 'Public', 8200, 450, '2019-10-10', 'Verified', 1350, 9580, '3 posts per week', 'Animal lover', 'Pet parent', 'Adopt, don''t shop', 'Sydney, Australia', 'English'),
(711, '@foodJunkie', 'Instagram', '69274', 'Savoring every delectable bite!', '2023-07-30 16:00:00', 970, 80, 60, '#FoodHeaven', 'Image', 'http://example.com/food2.jpg', 'http://instagram.com/foodJunkie/69274', 'New York City, USA', 'Public', 19800, 250, '2016-03-12', 'Verified', 1110, 20050, '4 posts per week', 'Food lover', 'Culinary explorer', 'Taste tester', 'New York City, USA', 'English'),
(903, '@adrenalineJunkie', 'Instagram', '27549', 'Chasing thrills and adventure!', '2023-07-30 11:20:00', 780, 150, 100, '#AdrenalineRush', 'Image', 'http://example.com/adrenaline.jpg', 'http://instagram.com/adrenalineJunkie/27549', 'Sydney, Australia', 'Public', 15200, 500, '2017-12-19', 'Not verified', 1030, 16300, '4 posts per week', 'Adventure seeker', 'Risk-taker', 'Thrill addict', 'Sydney, Australia', 'English'),
(210, '@globeTrotter', 'Facebook', '67482', 'Discovering the world''s wonders! ?? #Wanderlust', '2023-07-30 15:40:00', 1150, 140, 70, '#Wanderlust', 'Image', 'http://example.com/travel.jpg', 'http://facebook.com/globeTrotter/67482', 'Barcelona, Spain', 'Public', 12500, 300, '2019-05-08', 'Verified', 1360, 13900, '3 posts per week', 'Adventurer', 'Culture seeker', 'Passport stamp collector', 'Barcelona, Spain', 'English'),
(522, '@natureExplorer', 'Facebook', '27684', 'Immersed in nature''s beauty!', '2023-07-30 19:00:00', 680, 70, 40, '#NatureWanderer', 'Image', 'http://example.com/nature2.jpg', 'http://facebook.com/natureExplorer/27684', 'Sydney, Australia', 'Friends Only', 8400, 600, '2017-09-15', 'Not verified', 790, 8990, '2 posts per week', 'Nature lover', 'Wilderness seeker', 'Nature''s companion', 'Sydney, Australia', 'English'),
(618, '@petAdvocate', 'Instagram', '94728', 'Giving a voice to the voiceless!', '2023-07-30 09:55:00', 1450, 250, 120, '#AnimalRights', 'Image', 'http://example.com/animal.jpg', 'http://instagram.com/petAdvocate/94728', 'London, UK', 'Friends Only', 6400, 500, '2018-11-10', 'Not verified', 1820, 8400, '1 post per day', 'Animal advocate', 'Pet lover', 'Compassion is key', 'London, UK', 'English'),
(725, '@gameChanger', 'Twitch', '12462', 'Redefining the gaming experience!', '2023-07-30 14:00:00', 880, 90, 50, '#GameChanger', 'Video', 'http://example.com/gaming.mp4', 'http://twitch.tv/gameChanger/12462', 'San Francisco, USA', 'Public', 5800, 800, '2020-12-15', 'Not verified', 1020, 6720, '4 posts per week', 'Gaming visionary', 'VR explorer', 'Next-level gamer', 'San Francisco, USA', 'English'),
(817, '@fashionGuru', 'YouTube', '23879', 'Unlocking the secrets of style!', '2023-07-30 12:10:00', 520, 70, 40, '#FashionInsider', 'Video', 'http://example.com/fashion.mp4', 'http://youtube.com/watch23879', 'Paris, France', 'Public', 7400, 300, '2021-07-25', 'Not verified', 630, 5540, '3 posts per week', 'Fashionista', 'Trend spotter', 'Runway observer', 'Paris, France', 'English'),
(201, '@foodieJourney', 'Instagram', '80347', 'Embarking on a culinary journey!', '2023-07-30 18:25:00', 590, 80, 50, '#FoodExplorer', 'Image', 'http://example.com/food4.jpg', 'http://instagram.com/foodieJourney/80347', 'Barcelona, Spain', 'Friends Only', 4700, 450, '2019-01-28', 'Not verified', 720, 6230, '3 posts per week', 'Foodie at heart', 'Tasting cultures', 'Culinary storyteller', 'Barcelona, Spain', 'English');



select * from social_media_posts;