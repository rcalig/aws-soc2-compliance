set -e
echo "Enabling Week 2 AWS Config rules..."

aws configservice put-config-rule --config-rule '{"ConfigRuleName":"restricted-incoming-traffic","Source":{"Owner":"AWS","SourceIdentifier":"RESTRICTED_INCOMING_TRAFFIC"}}'
aws configservice put-config-rule --config-rule '{"ConfigRuleName":"alb-http-to-https-redirection-check","Source":{"Owner":"AWS","SourceIdentifier":"ALB_HTTP_TO_HTTPS_REDIRECTION_CHECK"}}'
aws configservice put-config-rule --config-rule '{"ConfigRuleName":"cloudfront-custom-ssl-certificate","Source":{"Owner":"AWS","SourceIdentifier":"CLOUDFRONT_CUSTOM_SSL_CERTIFICATE"}}'
aws configservice put-config-rule --config-rule '{"ConfigRuleName":"rds-storage-encrypted","Source":{"Owner":"AWS","SourceIdentifier":"RDS_STORAGE_ENCRYPTED"}}'
aws configservice put-config-rule --config-rule '{"ConfigRuleName":"s3-bucket-server-side-encryption-enabled","Source":{"Owner":"AWS","SourceIdentifier":"S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"}}'
aws configservice put-config-rule --config-rule '{"ConfigRuleName":"ec2-ebs-encryption-by-default","Source":{"Owner":"AWS","SourceIdentifier":"EC2_EBS_ENCRYPTION_BY_DEFAULT"}}'

echo "✅ Week 2 Config rules created"
