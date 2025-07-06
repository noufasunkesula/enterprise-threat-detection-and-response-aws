# Create EC2 Role
aws iam create-role --role-name EC2SecurityRole --assume-role-policy-document file://ec2-trust-policy.json
aws iam attach-role-policy --role-name EC2SecurityRole --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
aws iam attach-role-policy --role-name EC2SecurityRole --policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy

# Create Lambda Role
aws iam create-role --role-name LambdaRemediationRole --assume-role-policy-document file://lambda-trust-policy.json
aws iam put-role-policy --role-name LambdaRemediationRole --policy-name LambdaRemediationPolicy --policy-document file://lambda-remediation-policy.json

# Create Inspector Role
aws iam create-role --role-name InspectorAssessmentRole --assume-role-policy-document file://inspector-trust-policy.json
aws iam attach-role-policy --role-name InspectorAssessmentRole --policy-arn arn:aws:iam::aws:policy/AmazonInspectorFullAccess

# List IAM Users for MFA check
aws iam list-users

# Access Analyzer creation
aws accessanalyzer create-analyzer --analyzer-name MyIAMAnalyzer --type ACCOUNT
aws accessanalyzer list-findings --analyzer-name MyIAMAnalyzer
