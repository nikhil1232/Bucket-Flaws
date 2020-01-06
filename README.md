# Bucket Flaws (S3 Bucket Mass Scanner)
## Bucket Flaws: A Simple Lightweight Script that can take a list of bucket names and check for Common S3 Bucket Misconfigurations

![Image of BucketFlaws](https://github.com/nikhil1232/Bucket-Flaws/blob/master/images/upload.png)


This is a very small and light bash script that can take both a list of buckets as well a single bucket and perform some basic security checks.

## Misconfigurations

1) Unauthenticated Bucket Access (Directory Listing)

2) Authenticated Bucket Access (This means being authenticated to your own aws account)

- Checks for Directory Listing
- If Directory Listing is present then it will also check for some interesting files/folders based on the keywords provided in the sensitive.txt
- Tries to fetch Bucket Access Control List
- Tries to upload a file (sample.png)

## Usage

### Install Reqirements:
**pip install -r requirements.txt**

Usage: -u for single url
-f for file containing the list of all the buckets
-h for help

Eg: 

**./bucketflaw.sh -u bucketname**&nbsp;
**./bucketflaw.sh -f filepath**&nbsp;

![Image of BucketFlaws -u](https://github.com/nikhil1232/Bucket-Flaws/blob/master/images/url.png)

![Image of BucketFlaws -f](https://github.com/nikhil1232/Bucket-Flaws/blob/master/images/target-file.png)

**NOTE: For Authenticated Check you need to make sure you have configured your aws cli.**

Refer this link for configuring AWS CLI:
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html
