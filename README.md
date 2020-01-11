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
**pip install -r requirements.txt**

Usage:
-u for single bucket
-f for file containing the list of all the buckets
-o for performing object level analysis
-p for changing the bucket ACL if allowed
-d for dumping the whole bucket if allowed
-h for help

Eg: **./bucketflaws.sh -u bucketname**\
    **./bucketflaws.sh -f filepath**

For performing object level checks as well:<br/>
    **./bucketflaws.sh -u bucketname -o**

For modifying Bucket ACL if possible:<br/>
    **./bucketflaws.sh -u bucketname -o -p**

Performs all the checks as well as tries to dump the whole bucket(Recommended way):<br/>
    **./bucketflaws.sh -u bucketname -o -p -d**

Same as above but for a list of buckets:<br/>
    **./bucketflaws.sh -f filepath -o -p -d**



![Image of BucketFlaws -u](https://raw.githubusercontent.com/nikhil1232/Bucket-Flaws/master/images/bucket.png)

![Image of BucketFlaws -f](https://raw.githubusercontent.com/nikhil1232/Bucket-Flaws/master/images/bucket-list.png)

**NOTE: For Authenticated Check you need to make sure you have configured your aws cli.**

Refer this link for configuring AWS CLI:
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html

[![Bucket-Flaws](https://i.ibb.co/ZS8YtG8/https-drive-google.jpg)](https://drive.google.com/file/d/1C56TP4ZB99b6vMcEI8vLxyfCHE-kCUgR/preview "Bucket-Flaws")

<figure class="video_container">
  <iframe src="https://drive.google.com/file/d/1C56TP4ZB99b6vMcEI8vLxyfCHE-kCUgR/preview" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

```html

  
  <iframe src="https://drive.google.com/file/d/1C56TP4ZB99b6vMcEI8vLxyfCHE-kCUgR/preview" ></iframe>
  
  <!--aloow full screen add tag -->
  
<iframe allowfullscreen="allowfullscreen" src="your_page_url/preview" ></iframe>
```

