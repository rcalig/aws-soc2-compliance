import boto3, json, os, datetime

ec2 = boto3.client("ec2")
allow = set(int(p) for p in os.getenv("ALLOW_PUBLIC_PORTS","80,443").split(","))
bad = []

for sg in ec2.describe_security_groups()["SecurityGroups"]:
    sid = sg["GroupId"]
    sname = sg.get("GroupName","")
    for perm in sg.get("IpPermissions",[]):
        from_p, to_p = perm.get("FromPort"), perm.get("ToPort")
        if from_p is None or to_p is None:
            continue
        for rng in perm.get("IpRanges",[]):
            if rng.get("CidrIp")=="0.0.0.0/0":
                for p in range(from_p, to_p+1):
                    if p not in allow:
                        bad.append({"group_id":sid,"group_name":sname,"port":p,"cidr":"0.0.0.0/0"})

out = {"generated_utc": datetime.datetime.utcnow().isoformat(), "violations": bad}

with open("sg_public_ports.json","w") as f:
    json.dump(out,f,indent=2)

print(f"✅ SG public ports check complete. Found {len(bad)} violations. File sg_public_ports.json created.")
