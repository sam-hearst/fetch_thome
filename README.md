# Overview

This is my project for the take home assessment for fetch. I am using Google Cloud Platform and BigQuery as my SQL dialect. All information around my pocesses and the answers to the take home can be found here.

# Loading data into BigQuery

In order to write queries against the data provided for the second and third question, I need to load the data into BigQuery. For the purpose of time I just used the cloud shell and put the json data into google cloud storage. In a production setting I'd want to build or use an ETL tool for loading the data. Here is the command I used to load the data:

```bash
bq load --autodetect --source_format=NEWLINE_DELIMITED_JSON \
take_home.raw_{{ json_file_name }} \
gs://json_fetch/{{ json_file_name }}.json
```

bq load --autodetect --source_format=NEWLINE_DELIMITED_JSON \
take_home.raw_brands \
gs://json_fetch/brands.json

Loading the data was pretty straightforward however I did need to run a find and replace for all "$". BigQuery categorizes it as a special character and I was not able to load the data with that symbol. 

# Building Structured Relational Data Model

Please find the link to my relational data model here. I will speak a little bit about each table and general overview. Firstly this problem seems like a somewhat common pattern of fact vs dimension tables. The Receipts table is the fact table while the Users and Brands are the dimension tables. 

After loading the data in, I wanted to clean the receipts table so that it would match the data model. Here is my SQL for that process

