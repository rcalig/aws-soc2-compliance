#!/usr/bin/env python3
import boto3, json, datetime

gd = boto3.client("guardduty")
detector = open("detector_id.txt").read().strip()
out_list = []

findings = gd.list_findings(DetectorId=detector)["FindingIds"]

if not findings:
    data = {"Findings": [], "note": "No findings available"}
else:
    data = gd.get_findings(DetectorId=detector, FindingIds=findings)

for f in data.get("Findings", []):
    out_list.append({
        "id": f["Id"],
        "type": f["Type"],
        "severity": f["Severity"],
        "title": f.get("Title", ""),
        "resource": f.get("Resource", {}).get("ResourceType", ""),
        "time": f.get("UpdatedAt", "")
    })

output = {
    "generated_utc": datetime.datetime.utcnow().isoformat(),
    "findings_count": len(out_list),
    "findings": out_list
}

with open("export_findings.json", "w") as f:
    json.dump(output, f, indent=2)

print(f"export_findings.json created with {len(out_list)} records")
