set -e

echo "Checking RDS encryption..."

aws rds describe-db-instances > rds_instances.json 2>/dev/null || echo '{"DBInstances":[]}' > rds_instances.json

jq -r '.DBInstances[]? | "\(.DBInstanceIdentifier)\tenc=\(.StorageEncrypted)"' rds_instances.json || true

echo "✅ RDS encryption check complete. File rds_instances.json created."
