cat > scripts/upload_guardduty_evidence.sh <<'EOF'
#!/bin/bash
set -e
: "${EVIDENCE_BUCKET:?Set EVIDENCE_BUCKET first}"

TODAY=$(date -u +%F)
aws s3 cp guardduty-findings.json "s3://$EVIDENCE_BUCKET/cc6/guardduty/guardduty-findings-$TODAY.json"
aws s3 cp export_findings.json "s3://$EVIDENCE_BUCKET/cc6/guardduty/export-findings-$TODAY.json"
echo "Evidence uploaded to s3://$EVIDENCE_BUCKET/cc6/guardduty/"
EOF

chmod +x scripts/upload_guardduty_evidence.sh
scripts/upload_guardduty_evidence.sh
