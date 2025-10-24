# Week 5: Security Monitoring & Alerting

**Controls Covered**
- CC 6.6 Incident response alerting (CloudWatch → Lambda)
- CC 6.6 Alert delivery (SNS)
- CC 6.6 Ticket creation (Jira integration placeholder)

**Learning Objectives**
- AWS CLI: Configure CloudWatch metrics, alarms, and SNS topics.
- Lambda: Trigger an automated incident response function.
- Python: Log alerts and simulate ticket creation.

**Evidence Produced**
- incident-alerts.json
- sns-topic-details.json
- CloudWatch alarm evidence

**Architecture Overview**
CloudWatch monitors events.  
When a high-severity event occurs, it triggers Lambda via EventBridge.  
Lambda publishes a message to an SNS topic.  
SNS delivers the message to the incident response team.

