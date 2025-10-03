set -e

echo "Checking KMS key rotation..."

> kms_rotation.txt

KEYS=$(aws kms list-keys --query 'Keys[].KeyId' --output text 2>/dev/null || echo "")

if [ -z "$KEYS" ]; then
  echo "No KMS keys found." >> kms_rotation.txt
else
  for KEY in $KEYS; do
    STATUS=$(aws kms get-key-rotation-status --key-id "$KEY" --query KeyRotationEnabled --output text 2>/dev/null || echo "N/A")
    echo -e "$KEY\trotation=$STATUS" >> kms_rotation.txt
  done
fi

echo "✅ KMS rotation report complete. File kms_rotation.txt created."
