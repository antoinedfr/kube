.PHONY: kyverno-test checkov trivy tflint security

kyverno-test:
	powershell -ExecutionPolicy Bypass -File scripts/kyverno-test.ps1

checkov:
	checkov.cmd -d infra

trivy:
	trivy config infra

tflint:
	cd infra && tflint

security: kyverno-test checkov trivy tflint