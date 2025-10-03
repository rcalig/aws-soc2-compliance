import boto3, json, datetime

elbv2 = boto3.client("elbv2")
bad = []

for lb in elbv2.describe_load_balancers()["LoadBalancers"]:
    if lb["Type"] != "application": continue
    listeners = elbv2.describe_listeners(LoadBalancerArn=lb["LoadBalancerArn"])["Listeners"]
    has443, port80_ok = False, True
    for l in listeners:
        if l["Port"]==443 and not l.get("Certificates"):
            bad.append({"lb": lb["LoadBalancerName"], "issue": "443-no-cert"})
            has443=True
        if l["Port"]==80 and "redirect" not in [a["Type"] for a in l["DefaultActions"]]:
            port80_ok=False
    if not has443 or not port80_ok:
        bad.append({"lb": lb["LoadBalancerName"], "issue": "https-missing-or-no-redirect"})

out = {"generated_utc": datetime.datetime.utcnow().isoformat(), "violations": bad}

with open("alb_tls_check.json","w") as f:
    json.dump(out,f,indent=2)

print(f"✅ ALB TLS check complete. Found {len(bad)} issues. File alb_tls_check.json created.")
