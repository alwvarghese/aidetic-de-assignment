-- Databricks notebook source
DELIMITER //

CREATE PROCEDURE GetNumberOfClicks(IN url VARCHAR(255), IN country VARCHAR(255))
BEGIN
    SELECT 
        url, 
        country, 
        number_of_clicks 
    FROM 
        aggregated_clickstream 
    WHERE 
        url = url AND country = country;
END //

DELIMITER ;


-- COMMAND ----------

DELIMITER //

CREATE PROCEDURE GetNumberOfUniqueUsers(IN url VARCHAR(255), IN country VARCHAR(255))
BEGIN
    SELECT 
        url, 
        country, 
        number_of_unique_users 
    FROM 
        aggregated_clickstream 
    WHERE 
        url = url AND country = country;
END //

DELIMITER ;


-- COMMAND ----------

DELIMITER //

CREATE PROCEDURE GetAverageTimeSpent(IN url VARCHAR(255), IN country VARCHAR(255))
BEGIN
    SELECT 
        url, 
        country, 
        average_time_spent 
    FROM 
        aggregated_clickstream 
    WHERE 
        url = url AND country = country;
END //

DELIMITER ;


-- COMMAND ----------

CALL GetNumberOfClicks('http://example.com', 'USA');
CALL GetNumberOfUniqueUsers('http://example.com', 'USA');
CALL GetAverageTimeSpent('http://example.com', 'USA');
