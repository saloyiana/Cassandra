cluster:
	k3d cluster create labs \
	    -p 80:80@loadbalancer \
	    -p 443:443@loadbalancer \
	    -p 30000-32767:30000-32767@server[0] \
	    -v /etc/machine-id:/etc/machine-id:ro \
	    -v /var/log/journal:/var/log/journal:ro \
	    -v /var/run/docker.sock:/var/run/docker.sock \
		--k3s-server-arg '--no-deploy=traefik' \
	    --agents 3
cass-operator:
	kubectl apply -f https://raw.githubusercontent.com/datastax/cass-operator/v1.4.1/docs/user/cass-operator-manifests-$$K8S_VER.yaml
