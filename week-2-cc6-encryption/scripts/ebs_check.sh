set -e

echo "Checking EBS encryption..."

aws ec2 get-ebs-encryption-by-default > ebs_default.json || echo '{"EbsEncryptionByDefault":false}' > ebs_default.json
aws ec2 describe-volumes --query 'Volumes[].{Id:VolumeId,Encrypted:Encrypted,State:State}' > ebs_volumes.json || echo '[]' > ebs_volumes.json

echo "✅ EBS encryption check complete. Files ebs_default.json and ebs_volumes.json created."
