# Centralized Logging & Regulatory Audit Trails

**GRC Domain:** Logging Governance, Forensic Integrity, Audit Trail Compliance  
**Role Simulated:** Cloud Security Architect / Lead GRC Compliance Officer  
**Framework/Regulation:** PCI-DSS v4.0 Req 10, NIST SP 800-92, SOC 2 CC7.2  
**Project Type:** Fictional Portfolio Case Study  

> **Scenario Context:** Apex Cloud Financial Systems (ApexPay) – Central Log Governance  

## Project Deliverables Index
- 🏗️ **Terraform Log Infrastructure:** [`terraform/logging_bucket.tf`](./terraform/logging_bucket.tf)
- 📋 **Log Governance & Retention Standard:** [`docs/log_governance_standard.md`](./docs/log_governance_standard.md)
- 🔎 **Log Integrity Verification Proof:** [`evidence/LOG_INTEGRITY_VERIFICATION.md`](./evidence/LOG_INTEGRITY_VERIFICATION.md)
- 💬 **Auditor Challenge Q&A (PCI-DSS):** [`docs/auditor_qa_logging.md`](./docs/auditor_qa_logging.md)

---

## Overview

Many candidates say they "enabled logging." Very few show that they understand logging as an architectural problem. This project designs centralised logging properly—with immutability, access control, and tamper detection at its core.


## Architecture Diagram


<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/d3d510c9-2d39-4cb5-b323-bf8d043b028d" />



## Log Flow and Protection


<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/a15537e6-3275-4b11-875e-42f280fa139d" />



## Why Logging Matters in Incidents


<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/bac2d7a6-1320-40bc-984b-a7ccdf1449ea" />



## What to Log


<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/950b8780-16e2-4f2d-b052-a7425b8cac88" />



## S3 Bucket Policy (Log Archive)


<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/decc5e84-f14e-4799-8299-f21b2ee16ae1" />



## Tamper Detection


<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/21464934-5540-4160-b38d-032bbde58e96" />



## Monitoring and Alerting


<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/1294e125-ecf8-4568-ae54-222388c295bd" />



## Project Structure

```
05-centralized-logging/
├── README.md
├── terraform/
│   ├── main.tf                     # Provider config
│   ├── log-archive-bucket.tf       # S3 bucket with Object Lock
│   ├── cloudtrail.tf               # Organization trail
│   ├── vpc-flow-logs.tf            # Flow log configuration
│   ├── kms.tf                      # CMK for log encryption
│   ├── iam.tf                      # Cross-account roles
│   ├── cloudwatch-alarms.tf        # Monitoring configuration
│   └── variables.tf
└── docs/
    ├── architecture.md             # Detailed architecture
    ├── incident-response.md        # How to use logs in IR
    └── compliance-mapping.md       # Regulatory requirements
```

## Deliverables Checklist

- [ ] Centralized log bucket with Object Lock
- [ ] Organization CloudTrail configuration
- [ ] VPC Flow Logs to central location
- [ ] KMS key for log encryption
- [ ] Cross-account write access
- [ ] Restricted read access
- [ ] No delete access for anyone
- [ ] CloudWatch alarms for logging failures
- [ ] Log validation enabled
- [ ] Documentation of design decisions


## Further Reading

- [AWS CloudTrail Best Practices](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/best-practices-security.html)
- [S3 Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html)
- [CloudTrail Log File Validation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-log-file-validation-intro.html)

---

**Remember:** This demonstrates that you understand security from an incident response and forensics perspective, not just compliance. In real incidents, attackers often try to disable or erase logs first.
