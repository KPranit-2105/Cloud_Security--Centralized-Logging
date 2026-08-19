# Evidence Item EVD-LOG-01: CloudTrail Digest File Verification
**Audit Context:** PCI-DSS v4.0 Requirement 10.5 Audit Proof  
**Target Log File:** `123456789012_CloudTrail_us-east-1_20260810T1400Z_abcdef.json.gz`  
**Classification:** **SIMULATED EVIDENCE FOR PORTFOLIO DEMONSTRATION**  

---

## 1. CloudTrail Log File Integrity Validation Output

### AWS CLI Validation Command
```bash
aws cloudtrail validate-logs \
    --trail-name apexpay-global-audit-trail \
    --start-time 20260810T000000Z \
    --end-time 20260810T235959Z \
    --verbose
```

### Command Execution Log
```
Results requested for 2026-08-10T00:00:00Z to 2026-08-10T23:59:59Z
Digest file: s3://apexpay-central-audit-logs-prod/AWSLogs/123456789012/CloudTrail-Digest/us-east-1/2026/08/10/123456789012_CloudTrail-Digest_us-east-1_20260810T230000Z.json
Validating log files...

[SUCCESS] 48/48 log files verified successfully.
Digest signature match: TRUE
KMS Key Signature Validation: PASSED (arn:aws:kms:us-east-1:123456789012:key/log-key-id)
Log File Modification Detected: FALSE
```
> **Audit Finding:** Proves log immutability and anti-tampering verification operating effectively.
