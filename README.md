# aidetic-de-assignment

Ingestion Code Overview

Define Schema:
A schema is defined for the JSON data to be ingested. This schema outlines the structure of the data as provided in the requirement sheet, including nested fields for click data, geo data, and user agent data.

Read Stream from Kafka:
The code reads streaming data from a Kafka topic using the readStream method. The Kafka server details and topic name are specified.

Convert Data:
The Kafka message value, which is in binary format, is converted to a string format for further processing.

Parse JSON Data:
The JSON string is parsed into a structured DataFrame using the defined schema. This makes it easier to work with the data in a tabular format.

Define Batch Processing Function:
A function (process_batch) is defined to process each micro-batch of data. This function performs the following steps:
Flatten Nested Fields: The nested JSON fields are flattened into a tabular format.
Calculate Time Spent: A new column (time_spent) is added, which represents the session duration. In this example, a fixed value is used for simplicity.
Perform Aggregations: Aggregations are performed to calculate the number of clicks, number of unique users, and average time spent for each URL and country combination.
Write to MySQL: The aggregated data is written to a MySQL database using JDBC.

Apply Batch Processing Function:
The foreachBatch method is used to apply the batch processing function to each micro-batch of data. This ensures that the transformations and actions defined in the function are applied to each micro-batch as it arrives.


Seperate code is provided to create stored procedures for the below use-cases:
1. Retrieving the number of clicks for a given URL and country.
2. Retrieving the number of unique users for a given URL and country.
3. Retrieving the average time spent by users on a specific URL for a given country

once the stored procedures are created, they can be invoked by CALL procedure_name(args)


