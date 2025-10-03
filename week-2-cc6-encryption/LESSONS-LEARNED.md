# Week 2 – Lessons Learned

## Technical
- AWS Config rules require valid `SourceIdentifier`; incorrect names (e.g., `CLOUDFRONT_NO_HTTP`) cause errors.
- Python scripts must **always write JSON**, even if empty, to prevent upload failures.
- Bash scripts also needed patching to create placeholder files when no resources exist.
- `$EVIDENCE_BUCKET` must be exported, otherwise uploads fail.

## Troubleshooting
- **Missing boto3** → fixed with `pip3 install boto3 --user`.
- **File not found errors** → fixed by forcing scripts to always generate evidence files.
- **Invalid bucket name error** → caused by missing `EVIDENCE_BUCKET` variable.
- **Config recorder errors** → must create AWS Config recorder and delivery channel before rules.

## Process Improvements
- Added `upload-evidence.sh` with placeholder logic to make evidence uploads resilient.
- Plan to extend uploader across all weeks for consistency.

## Next Steps
- Extend automation to trigger evidence generation weekly.
- Add GitHub Actions to automatically run checks and push outputs.
