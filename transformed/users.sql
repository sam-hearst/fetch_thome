CREATE OR REPLACE TABLE `fetch-take-home.take_home.transformed_users` AS
SELECT
    _id.oid AS user_id,                               
    state AS state,                                   
    TIMESTAMP_MILLIS(createdDate.date) AS created_date,  
    TIMESTAMP_MILLIS(lastLogin.date) AS last_login,      
    role AS role,                                    
    active AS active,                                 
    signUpSource AS sign_up_source                   
FROM
    `fetch-take-home.take_home.raw_users`; 