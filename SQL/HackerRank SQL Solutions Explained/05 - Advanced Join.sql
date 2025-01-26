-- ##########
-- ### 5. 15 DAYS OF LEARNING SQL ###

-- Problem
-- For each day of a contest (March 1, 2016 - March 15, 2016), we want to find:
-- 1. The total number of unique hackers who made at least one submission each day.
-- 2. The hacker with the most submissions on each day. If multiple hackers have the same number of submissions, we choose the one with the smallest hacker_id.
-- Our results should be sorted by the date.

-- Plan

-- Step 1: Count Unique Hackers Who Submitted Each Day
-- 1. Rank Each Hacker's Submissions by Date:
-- - Use the DENSE_RANK() window function to rank each hacker's submission dates sequentially.
-- - Partition the ranking by hacker_id and order it by submission_date. This will allow us to track a hacker's activity across different days and determine how many days they've participated.
-- 2. Filter for Consecutive Days of Participation Starting from March 1, 2016:
-- - Use the DATEDIFF() function to calculate the difference (in days) between the submission_date and the contest start date (March 1, 2016).
-- - Compare the day difference to the rank calculated earlier to ensure the hacker has participated every day starting from March 1 without skipping any days.
-- 3. Count Unique Hackers Per Day:
-- - Group the filtered results by submission_date.
-- - Use COUNT(DISTINCT hacker_id) to calculate the total number of unique hackers who made submissions on that day.
-- Alias for this subquery: unique_hacker_participation.

-- Step 2: Find the Hacker with the Maximum Submissions Each Day
-- 1. Count Submissions Per Hacker Per Day:
-- - Group the Submissions table by submission_date and hacker_id.
-- - Use COUNT(*) to count the total submissions made by each hacker on each day.
-- 2. Rank Hackers by Submissions:
-- - Use the DENSE_RANK() window function to rank hackers based on their submission count for each day.
-- - Partition by submission_date and order the results by COUNT(*) in descending order. For hackers with the same submission count, break ties by ordering their hacker_id in ascending order.
-- 3. Select the Hacker with the Maximum Submissions:
-- - Filter the results where the rank is 1, ensuring that only the hacker(s) with the most submissions for each day are selected.
-- Alias for this subquery: top_hacker_per_day.

-- Step 3: Join Results to Form the Final Output
-- 1. Combine Unique Hacker Counts and Top Hacker Data:
-- - Join the results of the two subqueries (unique_hacker_participation and top_hacker_per_day) on the submission_date.
-- - This will ensure that for each day, we have both the count of unique hackers and the details of the top hacker.
-- 2. Fetch Hacker Names:
-- - Perform a LEFT JOIN with the Hackers table to retrieve the name of the hacker with the most submissions each day.

-- Step 4: Sorting
-- - Sort the final output by submission_date in ascending order to ensure the data is displayed chronologically.

-- Solution

SELECT participation_data.submission_date, participation_data.hacker_cnt, top_hacker.hacker_id, h.name
FROM (
    -- Step 1: Count the number of unique hackers who made submissions each day
    SELECT submission_date, COUNT(DISTINCT hacker_id) AS hacker_cnt
    FROM (
        -- Here, we rank each hacker based on the day they submitted.
        -- We use DENSE_RANK to give a rank to each hacker per day.
        SELECT hacker_id, submission_date,
            DENSE_RANK() OVER (PARTITION BY hacker_id ORDER BY submission_date) AS day_cnt
        FROM Submissions
    ) hacker_daily_ranking
    -- We filter the ranks to ensure we're only considering hackers who have made submissions
    -- on each day starting from March 1, 2016.
    WHERE DATEDIFF(day, '2016-03-01', submission_date) + 1 = hacker_daily_ranking.day_cnt
    GROUP BY submission_date
) participation_data
JOIN (
    -- Step 2: Find the hacker with the maximum submissions each day
    SELECT submission_date, hacker_id, sub_cnt
    FROM (
        -- Count the number of submissions per hacker per day
        SELECT submission_date, hacker_id, COUNT(*) AS sub_cnt,
            -- Rank hackers by the number of submissions they made on each day.
            -- In case of a tie, we order by hacker_id in ascending order.
            DENSE_RANK() OVER (PARTITION BY submission_date ORDER BY COUNT(*) DESC, hacker_id ASC) AS rank_result
        FROM Submissions
        GROUP BY submission_date, hacker_id
    ) hacker_submission_ranking
    -- We filter to get the hacker with the maximum submissions (rank 1).
    WHERE hacker_submission_ranking.rank_result = 1
) top_hacker
-- Step 3: Join with Hackers table to get the hacker's name
ON participation_data.submission_date = top_hacker.submission_date
LEFT JOIN Hackers h ON top_hacker.hacker_id = h.hacker_id
-- Sorting the final result by submission_date to display in chronological order
ORDER BY participation_data.submission_date;
