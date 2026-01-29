import boto3
import logging
import os

logger=logging.getLogger()
logger.setLevel(logging.INFO)

ec2= boto3.client('ec2')
sns= boto3.client('sns')


INSTANCE_ID = os.environ[INSTANCE_ID]
SNS_TOPIC_ARN = os.environ[SNS_TOPIC_ARN]

def lambda_handler(event context);


try:
    logger.info(f"Rebooting EC2 instance:{INSTANCE_ID}")

ec2.reboot_instances(Instanceleds=[INSTANCE_ID])

sns.publish(TopicArn=SNS_TOPIC_ARN, Subject="Aumotated rEMEDATION Triggered",
            Message=f"EC2 instance [INSTANCE_ID] rebooted due to latency alert"


            )


return{"statusCode":200}


expect Exception as e:
    logger.error(str(e))
    raise
