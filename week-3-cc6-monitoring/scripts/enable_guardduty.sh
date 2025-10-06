cat > scripts/enable_guardduty.sh <<'EOF'
#!/bin/bash
set -e
echo "Enabling GuardDuty detector..."
DETECTOR_ID=$(aws guardduty create-detector --enable --query 'DetectorId' --output text 2>/dev/null || true)
if [ -z "$DETECTOR_ID" ]; then
  DETECTOR_ID=$(aws guardduty list-detectors --query 'DetectorIds[0]' --output text)
fi
echo "GuardDuty enabled with Detector ID: $DETECTOR_ID"
echo "$DETECTOR_ID" > detector_id.txt
EOF

chmod +x scripts/enable_guardduty.sh
scripts/enable_guardduty.sh
