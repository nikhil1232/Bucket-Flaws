# Bucket Flaws (S3 Bucket Mass Scanner)
## Bucket Flaws: A Simple Lightweight Script to Check for Common S3 Bucket Misconfigurations

![Image of BucketFlaws](https://github.com/nikhil1232/Bucket-Flaws/blob/master/images/upload.png)


This is a very small and light bash script that can basically take a list of bucket names as well a single bucket and perform some common security checks.

## Misconfigurations

1) Unauthenticated Bucket Access (Directory Listing)

2) Authenticated Bucket Access (This means being authenticated to your own aws account)

- Checks for Directory Listing
- If Directory Listing is present it also checks for some interesting files/folders based on the keywords provided in the sensitive.txt
- Tries to fetch Bucket Access Control List
- Tries to upload a file (sample.png)

## Usage

### Install Reqirements:
**pip install -r requirements.txt**

Usage: -u for single url
-f for file containing the list of all the buckets
-h for help

Eg: 

**./bucketflaw.sh -u bucketname**
**./bucketflaw.sh -f filepath**

![Image of BucketFlaws -u](https://github.com/nikhil1232/Bucket-Flaws/blob/master/images/url.png)

![Image of BucketFlaws -f](https://github.com/nikhil1232/Bucket-Flaws/blob/master/images/target-file.png)

NOTE: For Authenticated Check you need to make sure you have configured your aws cli.
