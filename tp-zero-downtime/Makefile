.PHONY: pods pod-id delete-one test-zero-downtime

pods:
	kubectl get pods

pod-id:
	kubectl get pods -o jsonpath="{.items[0].metadata.name}"
	@echo

delete-one:
	kubectl delete pod $$(kubectl get pods -o jsonpath="{.items[0].metadata.name}")

test-zero-downtime:
	@echo "===== Pods avant suppression ====="
	kubectl get pods

	@echo ""
	@echo "===== Pod sélectionné ====="
	kubectl get pods -o jsonpath="{.items[0].metadata.name}"
	@echo ""

	@echo "===== Suppression du pod ====="
	kubectl delete pod $$(kubectl get pods -o jsonpath="{.items[0].metadata.name}")

	@echo ""
	@echo "===== Etat des pods ====="
	kubectl get pods