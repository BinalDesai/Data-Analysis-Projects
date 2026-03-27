create schema games;
select * from games_revenue;
alter table games_revenue drop column Total_Revenue;
-- Total_revenue
select 
	games_description.game_id,
    games_description.game_name,
    games_revenue.Number_of_Purchases * games_revenue.Unit_Price as Total_Revenue 
from games_description 
join games_revenue 
	on games_description.game_id=games_revenue.game_id;
-- Top 5 games by Total_revenue
select 
	games_description.game_name,
    games_revenue.Number_of_Purchases * games_revenue.Unit_Price as Total_Revenue 
from games_description 
join games_revenue 
	on games_description.game_id=games_revenue.game_id 
order by Total_Revenue desc 
limit 5;
-- Top 3 genre by Total_revenue
select games_description.genre,
	games_revenue.Number_of_Purchases * games_revenue.Unit_Price as Total_Revenue 
from games_description 
join games_revenue on games_description.game_id=games_revenue.game_id 
order by Total_Revenue desc 
limit 3;
select games_description.genre,
	sum(games_revenue.Number_of_Purchases * games_revenue.Unit_Price) as Total_Revenue 
from games_description 
join games_revenue 
	on games_description.game_id=games_revenue.game_id 
group by games_description.genre 
order by Total_Revenue desc 
limit 3;
-- Which year generated most of the revenue in the company
select games_description.year_released,
	sum(games_revenue.Number_of_Purchases * games_revenue.Unit_Price) as Total_Revenue 
from games_description 
join games_revenue 
	on games_description.game_id=games_revenue.game_id 
group by games_description.year_released 
order by Total_Revenue desc
limit 1;

-- Calculate the percentage of customers who left reviews out of the total purchase.
SELECT
    d.game_id,
    d.game_name,
    r.Number_of_Purchases,
    rv.number_of_reviews_from_purchased_people AS total_reviews,
    round((100 * rv.number_of_reviews_from_purchased_people / r.Number_of_Purchases),2) as review_percentage
           FROM games_description d
JOIN games_revenue r
    ON d.game_id = r.game_id
JOIN games_reviews rv
    ON d.game_id = rv.game_id
ORDER BY review_percentage DESC;
-- Determine the percentage of reviews written in English for each game
select game_id,game_name,round((number_of_english_reviews * 100/number_of_reviews_from_purchased_people),2) as English_review_percentage from games_reviews order by English_review_percentage;

-- Find the top 5 publishers by total revenue.
select games_description.publisher,
	   sum(games_revenue.Number_of_Purchases * games_revenue.Unit_Price) as Total_Revenue 
from games_description join games_revenue
on games_description.game_id = games_revenue.game_id
group by games_description.publisher
order by Total_Revenue desc
limit 5;

-- Engagement Ratios
select d.game_id,
	   d.game_name,
       d.genre,
       round((r.Helpful * 100/r.number_of_reviews_from_purchased_people),2)as Helpful_review_percentage,
       round((r.Funny * 100/number_of_reviews_from_purchased_people),2)as Funny_review_percentage
from games_reviews r
join games_description d
     on d.game_id = r.game_id;

-- Highest & Lowest Helpful and Funny % by Genre
select 
    max(Helpful_review_percentage) as Highest_Helpful,
    min(Helpful_review_percentage) as Lowest_Helpful,
    max(Funny_review_percentage) as Highest_Funny,
    min(Funny_review_percentage) as Lowest_Funny
from (
    select 
        g.genre,
        round((sum(r.Helpful) * 100.0 / sum(r.number_of_reviews_from_purchased_people)),2) as Helpful_review_percentage,
        round((sum(r.Funny) * 100.0 / sum(r.number_of_reviews_from_purchased_people)),2) as Funny_review_percentage
    from games_reviews r
    join games_description g on g.game_id = r.game_id
    where r.number_of_reviews_from_purchased_people > 0
    group by g.genre
) as genre_stats;

select 'Highest Helpful Game' as category, game_name as name, percentage from (
    select g.game_name,
           round((r.Helpful * 100.0 / r.number_of_reviews_from_purchased_people),2) as percentage
    from games_reviews r
    join games_description g on g.game_id = r.game_id
    where r.number_of_reviews_from_purchased_people > 0
    order by percentage desc
    limit 1
) as t

union all

select 'Lowest Helpful Game', game_name, percentage from (
    select g.game_name,
           round((r.Helpful * 100.0 / r.number_of_reviews_from_purchased_people),2) as percentage
    from games_reviews r
    join games_description g on g.game_id = r.game_id
    where r.number_of_reviews_from_purchased_people > 0
    order by percentage asc
    limit 1
) as t

union all

select 'Highest Funny Game', game_name, percentage from (
    select g.game_name,
           round((r.Funny * 100.0 / r.number_of_reviews_from_purchased_people),2) as percentage
    from games_reviews r
    join games_description g on g.game_id = r.game_id
    where r.number_of_reviews_from_purchased_people > 0
    order by percentage desc
    limit 1
) as t

union all

select 'Lowest Funny Game', game_name, percentage from (
    select g.game_name,
           round((r.Funny * 100.0 / r.number_of_reviews_from_purchased_people),2) as percentage
    from games_reviews r
    join games_description g on g.game_id = r.game_id
    where r.number_of_reviews_from_purchased_people > 0
    order by percentage asc
    limit 1
) as t

union all

select 'Highest Helpful Genre', genre, percentage from (
    select g.genre,
           round((sum(r.Helpful) * 100.0 / sum(r.number_of_reviews_from_purchased_people)),2) as percentage
    from games_reviews r
    join games_description g on g.game_id = r.game_id
    group by g.genre
    order by percentage desc
    limit 1
) as t

union all

select 'Lowest Helpful Genre', genre, percentage from (
    select g.genre,
           round((sum(r.Helpful) * 100.0 / sum(r.number_of_reviews_from_purchased_people)),2) as percentage
    from games_reviews r
    join games_description g on g.game_id = r.game_id
    group by g.genre
    order by percentage asc
    limit 1
) as t

union all

select 'Highest Funny Genre', genre, percentage from (
    select g.genre,
           round((sum(r.Funny) * 100.0 / sum(r.number_of_reviews_from_purchased_people)),2) as percentage
    from games_reviews r
    join games_description g on g.game_id = r.game_id
    group by g.genre
    order by percentage desc
    limit 1
) as t

union all

select 'Lowest Funny Genre', genre, percentage from (
    select g.genre,
           round((sum(r.Funny) * 100.0 / sum(r.number_of_reviews_from_purchased_people)),2) as percentage
    from games_reviews r
    join games_description g on g.game_id = r.game_id
    group by g.genre
    order by percentage asc
    limit 1
) as t;

select 
    d.genre,
    d.game_name,
    r.Number_of_Purchases * r.Unit_Price as total_revenue,
    RANK() over (partition by d.genre order by r.Number_of_Purchases * r.Unit_Price desc) as revenue_rank
from games_description d
join games_revenue r on d.game_id = r.game_id;


select 
    d.genre,
    d.game_name,
    r.number_of_reviews_from_purchased_people as total_reviews,
    RANK() over (partition by d.genre order by r.number_of_reviews_from_purchased_people desc) as review_rank
from games_description d
join games_reviews r on d.game_id = r.game_id;

select 
    d.game_name,
    d.genre,
    r.Number_of_Purchases * r.Unit_Price as total_revenue,
    rev.Hours_Played,
    round((rev.Hours_Played / r.Number_of_Purchases),2) as avg_hours_per_purchase
from games_description d
join games_revenue r on d.game_id = r.game_id
join games_reviews rev on d.game_id = rev.game_id
order by total_revenue desc;

select 
    d.genre,
    round(avg(rev.number_of_reviews_from_purchased_people),2) as avg_reviews_per_game,
    count(d.game_id) as total_games
from games_description d
join games_reviews rev on d.game_id = rev.game_id
group by d.genre
order by avg_reviews_per_game desc;

select 
    publisher,
    count(distinct genre) as genre_count,
    count(game_id) as total_games
from games_description
group by publisher
order by genre_count desc, total_games desc;

select 
    d.year_released,
    sum(r.Number_of_Purchases * r.Unit_Price) as total_revenue,
    sum(rev.number_of_reviews_from_purchased_people) as total_reviews,
    count(d.game_id) as total_games
from games_description d
join games_revenue r on d.game_id = r.game_id
join games_reviews rev on d.game_id = rev.game_id
group by d.year_released
order by d.year_released;

















