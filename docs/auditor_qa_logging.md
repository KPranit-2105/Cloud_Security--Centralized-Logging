# Auditor Challenge Q&A: Centralized Audit Logging
**GRC Domain:** Logging Governance, Forensic Integrity, Compliance Retention  
**Framework Mapping:** PCI-DSS v4.0 Req 10, SOC 2 CC7.2, NIST SP 800-92  

---

### Q1: How do you guarantee that an AWS Root account or rogue Cloud Administrator cannot delete historical security logs to cover their tracks?
**Answer:** We enforce multi-layered defense-in-depth immutability controls:
1. **S3 Object Lock in Compliance Mode:** In Compliance Mode, no user (including the AWS account root user) can overwrite or delete an object during the retention period (365 days). AWS Support cannot override this lock.
2. **Dedicated Logging Account Architecture:** Log files are immediately forwarded to an isolated, dedicated Security Audit Account. Production administrators have zero write or delete permissions in the Audit Account.
3. **MFA Delete Enforcement:** Deleting bucket versions requires a hardware MFA token managed exclusively by the Compliance Officer.

---

### Q2: How does your log validation process satisfy PCI-DSS Requirement 10.5?
**Answer:** PCI-DSS Requirement 10.5 mandates securing audit trails so they cannot be altered. CloudTrail generates cryptographic digest files (SHA-256 with RSA signature) every hour. Using `aws cloudtrail validate-logs`, we verify that the hash of log files matches the digest signed by AWS KMS. Any modification, missing log file, or tampering triggers an immediate verification failure.
