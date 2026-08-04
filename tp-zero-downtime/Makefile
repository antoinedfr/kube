pods:
	kubectl get pods

delete-one:
	kubectl delete pod $(shell kubectl get pods -o name | head -n 1 | cut -d/ -f2)

status:
	kubectl get pods