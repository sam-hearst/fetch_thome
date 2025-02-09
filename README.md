# Overview

This is my project for the take home assessment for fetch. I am using Google Cloud Platform and BigQuery as my SQL dialect. All information around my processes and the answers to the take home can be found here.

# Loading data into BigQuery

In order to write queries against the data provided for the second and third question, I need to load the data into BigQuery. For the purpose of time I just used the cloud shell and put the json data into google cloud storage. In a production setting I'd want to build or use an ETL tool for loading the data. Here is the command I used to load the data:

```bash
bq load --autodetect --source_format=NEWLINE_DELIMITED_JSON \
take_home.raw_{{ json_file_name }} \
gs://json_fetch/{{ json_file_name }}.json
```

Loading the data was pretty straightforward however I did need to run a find and replace for all "$". BigQuery categorizes it as a special character and I was not able to load the data with that symbol. In a production setting, that symbol should be removed before even going through the load stage.

# Building Structured Relational Data Model (Question #1)

Please find the link to my relational data model here. I will speak a little bit about each table and general overview. Firstly this problem seems like a somewhat common pattern of fact vs dimension tables. The Receipts table is the fact table while the Users and Brands are the dimension tables.
 After taking a look at the data I realized that one more table needed to be created. That table is all the information present within the 'rewardsReceiptItemList' key for each receipt. Additionally, the `barcode` column seems to be the way to join brands table into all the others. Therefore, my final data model will have 4 tables: Receipts, Users, Receipt_Items, and Brands.

Built those tables in BigQuery and please find my SQL to create those tables in the `transformed` directory.

