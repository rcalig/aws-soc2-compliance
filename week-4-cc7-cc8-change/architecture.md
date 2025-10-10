            +-------------------------+
            |       Developer Repo    |
            |  (GitLab / GitHub)      |
            +-----------+-------------+
                        |
                 Semgrep Pipeline
                        |
                        v
      +--------------------------------+
      |  Static Scan Artifacts (JSON)  |
      +--------------------------------+
                        |
             gitlab_artifact_upload.py
                        |
                        v
     +-----------------------------------+
     |     Evidence Bucket (S3 cc7/)     |
     |  ecr-scan.json | deploy-alarms.json |
     +-----------------------------------+
                        ^
             ECR & CloudWatch Exports
