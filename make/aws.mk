.PHONY: aws.id
aws.id:
	@aws sts get-caller-identity | jq .

.PHONY: aws.instances
aws.instances:
	@aws ec2 describe-instances | jq .

.PHONY: aws.subnets.ids
aws.subnets.ids:
	@aws ec2 describe-subnets --query "Subnets[*].SubnetId"

.PHONY: aws.vpcs.ids
aws.vpcs.ids:
	@aws ec2 describe-vpcs --query "Vpcs[*].VpcId"
