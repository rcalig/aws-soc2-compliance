import boto3, json, datetime

cf = boto3.client("cloudfront")
bad = []
dists = cf.list_distributions().get("DistributionList",{}).get("Items",[])

for d in dists:
    pol = d["DefaultCacheBehavior"]["ViewerProtocolPolicy"]
    if pol not in ("https-only","redirect-to-https"):
        bad.append({"distribution": d["DomainName"], "issue": pol})

out = {"generated_utc": datetime.datetime.utcnow().isoformat(), "violations": bad}

with open("cloudfront_tls_check.json","w") as f:
    json.dump(out,f,indent=2)

print(f"✅ CloudFront TLS check complete. Found {len(bad)} issues. File cloudfront_tls_check.json created.")
