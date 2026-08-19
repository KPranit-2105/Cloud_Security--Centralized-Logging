# Organization Standard: Centralized Log Governance & Retention
**Document ID:** STD-SEC-LOG-02  
**Organization:** Apex Cloud Financial Systems (ApexPay)  
**Compliance Standard:** PCI-DSS v4.0 Req 10, NIST SP 800-92, SOC 2 CC7.2  

---

## Log Classification & Mandatory Retention Schedule

| Log Source | Primary Information Recorded | Minimum Retention | Encryption | Immutability Mode | Compliance Justification |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **AWS CloudTrail (Management Events)** | API calls, IAM role assumptions, resource modifications | 365 Days | AWS KMS CMK | S3 Object Lock (Compliance) | PCI-DSS Req 10.2 / SOC 2 CC7.2 |
| **VPC Flow Logs** | Ingress/Egress IP, ports, accepted/rejected network packets | 180 Days | AWS KMS CMK | S3 Object Lock (Governance) | PCI-DSS Req 10.3 / NIST AU-12 |
| **Application Transaction Logs** | Payment tokenization requests, API status codes | 365 Days | AWS KMS CMK | S3 Object Lock (Compliance) | PCI-DSS Req 10.2.1 |
| **WAF / Web Logs** | HTTP requests, URI parameters, blocked exploit payloads | 90 Days | AES-256 | S3 Lifecycle Glacier | SOC 2 CC7.1 |
