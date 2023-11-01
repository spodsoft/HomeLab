Test
#/bin/bash

DATE=$(date +%H-%M-%S)
BACKUP=db-$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIAJRWZWY3CPV3F3JPQ && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading your $BACKUP backup" && \
aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME/$BACKUP
 

# Ansible
hosts file

[all:vars]

ansible_connection = ssh

[test]

test1 ansible_host=remote_host ansible_user=remote_user ansible_private_key_file=/var/jenkins_home/ansible/remote-key
web1 ansible_host=web ansible_user=remote_user ansible_private_key_file=/var/jenkins_home/ansible/remote-key
 



