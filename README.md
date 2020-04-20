# Bucket Flaws (S3 Bucket Mass Scanner)
## Bucket Flaws: A Simple Lightweight Script that can take a list of bucket names and check for Common S3 Bucket Misconfigurations

![Image of BucketFlaws](https://github.com/nikhil1232/Bucket-Flaws/blob/master/images/upload.png)


This is a very small and light bash script that can take both a list of buckets as well a single bucket and perform some basic security checks.

## Misconfigurations

### 1) Unauthenticated Bucket Access

- Checks for Directory Listing
- Tries to upload a file (upload.png)

### 2) Authenticated Bucket Access (This means being authenticated to any aws account)

#### Bucket Level Checks

- Checks for Directory Listing
- Checks for some interesting files/folders based on the keywords provided in the sensitive.txt
- Tries to fetch the Bucket ACL
- Tries to upload a file (bucket.png)
- Tries to dump the whole bucket (optional -d flag)
- Tries to modify the Bucket ACL (optional -p flag)

#### Object Level Checks

- Tries to fetch object ACL
- Tries to fetch object metadata
- Tries to dump the object (optional)
- Tries to modify the object ACL

## Usage

### Install Reqirements:
<code>**pip install -r requirements.txt**</code>

Usage:
-u for single bucket
-f for file containing the list of all the buckets
-o for performing object level analysis
-p for changing the bucket ACL if allowed
-d for dumping the whole bucket if allowed
-h for help

Eg:</br> <code>**./bucketflaws.sh -u bucketname**</code></br>
   <code> **./bucketflaws.sh -f filepath**</code></br>

For performing object level checks as well:<br/>
   <code>**./bucketflaws.sh -u bucketname -o**</code></br>

For modifying Bucket ACL if possible:<br/>
    <code>**./bucketflaws.sh -u bucketname -o -p**</code></br>

Performs all the checks as well as tries to dump the whole bucket(Recommended way):<br/>
  <code>**./bucketflaws.sh -u bucketname -o -p -d**</code></br>

Same as above but for a list of buckets:<br/>
 <code>**./bucketflaws.sh -f filepath -o -p -d**</code></br>
 
For storing the output to a txt file:<br/>
 <code>**./bucketflaws.sh -f filepath -o -p -d | tee output.txt && sed -i 's/\x1B\[[0-9;]\+[A-Za-z]//g' output.txt** </code></br>



![Image of BucketFlaws -u](https://raw.githubusercontent.com/nikhil1232/Bucket-Flaws/master/images/bucket.png)

![Image of BucketFlaws -f](https://raw.githubusercontent.com/nikhil1232/Bucket-Flaws/master/images/bucket-list.png)

## Walkthrough

[![Bucket-Flaws](https://i.ibb.co/ZS8YtG8/https-drive-google.jpg)](https://drive.google.com/file/d/1C56TP4ZB99b6vMcEI8vLxyfCHE-kCUgR/preview "Bucket-Flaws")

**NOTE: For Authenticated Check you need to make sure you have configured your aws cli.**

Refer this link for configuring AWS CLI:
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html





