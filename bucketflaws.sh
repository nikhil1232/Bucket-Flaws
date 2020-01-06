#!/bin/bash

RED='\e[41;97m'
WHITE='\033[0;37m'
RESET='\033[0m'
YELLOW='\033[0;93m'
TEST='\e[45m'
YEL='\e[38;5;226m'

if [[ $(ls ~/.aws/config 2>&1) == *"No such file"* ]] && [[ $(ls ~/.aws/credentials 2>&1) == *"No such file"* ]];
then
  echo -e "\nPlease configure your AWS CLI by typing in the following in your terminal: \e[40;38;5;82maws configure${RESET}\n"
  exit 1		
fi



if [ -z "$1" ] || [ $1 == "-h" ] || [ $1 == "--help" ]
then
  echo "Usage: -u for single url"
  echo "-f for file containing the list of all the buckets"
  echo "-h for help"
  echo "Eg: ./bucketflaw.sh -u bucketname"
  echo "    ./bucketflaw.sh -f filepath" 	
	
  exit 1
fi




echo -e "${YEL} 	  								              "
echo -e "${YEL}             ____             _        _     _____ _                            "
echo -e "${YEL}            | __ ) _   _  ___| | _____| |_  |  ___| | ___ __      _____         "
echo -e "${YEL}            |  _ \| | | |/ __| |/ / _ \ __| | |_  | |/ _ \  \ /\ / / __|        "
echo -e "${YEL}            | |_) | |_| | (__|   <  __/ |_  |  _| | | (_| |\ V  V /\__ \        "
echo -e "${YEL}            |____/ \__,_|\___|_|\_\___|\__| |_|   |_|\__,_| \_/\_/ |___/        "
echo -e "\n"
echo -e "                                 \e[44;97mBY NIKHIL SAHOO${RESET}                                 "
echo -e "\n\n"
echo -e "   \e[38;5;159mA Simple Lightweight Script to Check for Common S3 Bucket Misconfigurations${RESET}\n"



Msg()
{
bucket=$1
echo -e "${YEL}=======================================================================================${RESET}\n"
echo -e "$c- \e[1;4m$bucket${RESET}"

echo -e "\n\n\e[40;38;5;82m>>UNAUTHENTICATED ACCESS CHECK<<${RESET}\n"
open=$(curl -s "$bucket.s3.amazonaws.com" | xmllint --format -)
if [[ $open == *"<Message>Access Denied</Message>"* ]]; then
  echo -e "\e[41;97mFailed!!!${RESET}\n"
elif [[ $open == *"<Message>The specified bucket does not exist</Message>"* ]]; then
  echo -e "\e[41;97mFailed!!!${RESET}\n"
else
  temp=$(echo -e "$open" | grep -oP '(?<=<Key>).*?(?=</Key>)')
  echo -e "${WHITE}$temp${RESET}"	  
fi

echo -e "\n\n\e[40;38;5;82m>>AUTHENTICATED ACCESS CHECK<<${RESET}\n"

echo -e "\n\e[30;48;5;82mTesting for Diectory Listing . . .${RESET}\n"
a=$(aws s3 ls s3://$bucket --recursive 2>&1)
if [[ $a == *"An error"* ]]; then
  echo -e "${RED}Failed!!!${RESET}\n"
else
  echo -e "${WHITE}$a${RESET}"
  juicy "$a"  
fi


echo -e "\n\e[30;48;5;82mTrying to fetch Bucket Access Control List . . .${RESET}\n"
x=$(aws s3api get-bucket-acl --bucket $bucket 2>&1)
if [[ $x == *"An error"* ]]; then
  echo -e "${RED}Failed!!!${RESET}\n"
else
  echo -e "${WHITE}$x${RESET}"  
fi


echo -e "\n\e[30;48;5;82mTesting for file upload . . .${RESET}\n"
y=$(aws s3 cp upload.png s3://$bucket 2>&1)
if [[ $y == *"upload failed"* ]]; then
  echo -e "${RED}Failed!!!${RESET}\n"
else
  echo -e "${WHITE}$y${RESET}"
fi


}

list()
{
len=$(wc -l $url_list | cut -d " " -f 1)
c=1
while [ $c -le $len ]
do
bucket_f=$(head -$c $url_list | tail -1)
Msg $bucket_f
((c+=1))
done
}

site()
{
Msg $url
}

juicy()
{
echo -e "\n\e[30;48;5;82mPossible Interesting Files/Folders${RESET}\n"
j="$(echo "$1" | grep -i -f sensitive.txt)"
echo -e "${YELLOW}$j${RESET}"
}


while getopts :f:u:sh name; do
    case $name in
        f) url_list=${OPTARG}
	   list
	   echo -e "\n${YEL}=======================================================================================${RESET}\n";;
	u) url=${OPTARG}
	   site
	   echo -e "\n${YEL}=======================================================================================${RESET}\n";;	
    esac
done
echo $OPT






