import boto3
import json
import os

sns_client = boto3.client('sns')
sns_topic_arn = os.environ.get('SNS_TOPIC_ARN')

def lambda_handler(event, context):
    print("Received event:", json.dumps(event))
    
    message = {
        "alert": "High severity event detected",
        "event_detail": event
    }
    
    sns_client.publish(
        TopicArn=sns_topic_arn,
        Message=json.dumps(message),
        Subject="Incident Response Alert"
    )
    
    print("Incident alert published to SNS.")
    return {"status": "success"}
