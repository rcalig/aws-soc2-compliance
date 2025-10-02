# Week 1 – Access Controls (SOC 2 CC 6.x)

## 🎯 Objectives
This week focuses on **access controls**.  
We want to generate repeatable evidence for the following SOC 2 controls:

- **CC 6.1.2** – MFA enforced (IAM_USER_MFA_ENABLED)  
- **CC 6.1.3** – Strong password policy (IAM_PASSWORD_POLICY)  
- **CC 6.1.9** – RBAC via groups (IAM_USER_GROUP_MEMBERSHIP_CHECK)  
- **CC 6.2.1** – Admin access limited (AdministratorAccess policy check)  
- **CC 6.1.7 (Root Account MFA)** – Extra check for root MFA + no access keys  

All evidence is collected in the **S3 evidence bucket** created in Week -1 under the `cc6/` prefix.

---

## 🛠 Prerequisites
- AWS CLI configured with `grc-sandbox` profile  
- AWS Config recorder and delivery channel (from Week 0) **running**  
- boto3 installed for Python scripts  
  ```bash
  pip3 install boto3
