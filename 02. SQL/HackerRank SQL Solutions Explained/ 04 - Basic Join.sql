-- ================================================
-- 6. OLLIVANDER'S INVENTORY 
-- ================================================ 

-- ========================
-- Problem
-- ========================

-- Hermione decides to help Ron, who is shopping for a new wand at Ollivander's, by identifying the best options. The goal is to determine:
-- 1. The id, age, coins_needed, and power of wands that are:
-- -  Non-evil (is_evil = 0).
-- -  The least expensive (minimum coins_needed) for each combination of power and age.
-- 2. The results should be sorted:
-- -  First by power in descending order.
-- -  If multiple wands have the same power, by age in descending order.

-- ========================
-- Plan
-- ========================

-- Step 1: Filter Non-Evil Wands
-- 1. Join Tables:
-- - Combine the Wands table with the Wands_Property table using the common column code. This will allow us to access age and is_evil for each wand.
-- 2. Filter Non-Evil Wands:
-- - Use a condition (is_evil = 0) to exclude wands meant for the dark arts.

-- Step 2: Find the Minimum Coins Needed for Each Power and Age
-- 1. Group Wands by Power and Age:
-- - Use GROUP BY power, age to group wands with the same power and age.
-- 2. Select the Minimum Coins Needed:
-- - Use the MIN(coins_needed) aggregate function to identify the wand requiring the least number of gold galleons for each power and age.

-- Step 3: Identify Wands with Minimum Coins Needed
-- 1. Rejoin the Filtered Data:
-- - Join the filtered wands data with the grouped result from Step 2 on power, age, and coins_needed to fetch details of wands that match the minimum coins_needed criteria for each power and age.

-- Step 4: Sort the Result
-- 1. Sort by Power (Descending):
-- - Use ORDER BY power DESC to prioritize wands with higher power.
-- 2. Sort by Age (Descending):
-- - Add age DESC to the sorting clause to prioritize older wands when powers are equal.

-- Step 5: Select the Required Columns
-- - Include the following columns in the final output:
--   - id: Unique identifier for the wand.
--   - age: Age of the wand.
--   - coins_needed: Cost in gold galleons.
--   - power: Quality of the wand.

-- ========================
-- Solution
-- ========================

SELECT w.id,            
       wp.age,
       w.coins_needed,
       w.power          
FROM Wands w
-- Step 1: Join Wands with Wands_Property to access wand properties
JOIN Wands_Property wp 
    ON w.code = wp.code
-- Filter Non-Evil Wands
WHERE wp.is_evil = 0    -- Include only wands that are not meant for the dark arts
  AND w.coins_needed = (
    -- Step 2: Subquery to find the minimum coins_needed for each combination of power and age
    SELECT MIN(w1.coins_needed)  -- Select the minimum cost for a given power and age
    FROM Wands w1
    --  Join Wands with Wands_Property again for filtering by properties
    JOIN Wands_Property wp1 
        ON w1.code = wp1.code
    WHERE wp1.is_evil = 0       -- Include only non-evil wands
      AND w1.power = w.power    -- Match power with the outer query
      AND wp1.age = wp.age      -- Match age with the outer query
  )
-- Step 4: Sort the results
ORDER BY w.power DESC,          -- Sort the results by power in descending order (higher power first)
         wp.age DESC;           -- If powers are equal, sort by age in descending order (older wands first)





