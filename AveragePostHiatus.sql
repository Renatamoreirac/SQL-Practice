-- Question:
-- Given a table of Facebook posts, for each user who posted at least twice in 2021,
-- write a query to find the number of days between each user’s first post of the year
-- and last post of the year in the year 2021. Output the user and the number of days
-- between each user's first and last post.

SELECT 
    user_id,  -- Selecting the user_id to identify the user for whom we are calculating the date difference.
    
    -- Calculating the difference in days between the maximum and minimum post_date for each user.
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
    -- MAX(post_date::DATE) retrieves the most recent post date for each user.
    -- MIN(post_date::DATE) retrieves the earliest post date for each user.
    -- The subtraction gives the total number of days between the first and last posts for the year 2021.
    
FROM 
    posts  -- Specifying the table from which we are retrieving the data.
    
WHERE 
    DATE_PART('year', post_date::DATE) = 2021  -- Filtering records to only include posts made in the year 2021.
    
GROUP BY 
    user_id  -- Grouping the results by user_id to calculate the date difference for each user independently.
    
HAVING 
    COUNT
