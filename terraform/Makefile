.PHONY: terraform

terraform:
	docker run --rm -it \
		-v ~/.ssh/terraform_keys/terraform.pub:/root/.ssh/id_rsa.pub \
		-v ${CURDIR}:/go/src/github.com/hashicorp/terraform \
		-w /go/src/github.com/hashicorp/terraform \
		hashicorp/terraform:latest \
		${cmd}

terraform_apply:
	docker run --rm -it \
		-v ~/.ssh/terraform_keys/terraform.pub:/root/.ssh/id_rsa.pub \
		-v ${CURDIR}:/go/src/github.com/hashicorp/terraform \
		-w /go/src/github.com/hashicorp/terraform \
		hashicorp/terraform:latest \
		apply -auto-approve

terraform_destroy:
	docker run --rm -it \
		-v ~/.ssh/terraform_keys/terraform.pub:/root/.ssh/id_rsa.pub \
		-v ${CURDIR}:/go/src/github.com/hashicorp/terraform \
		-w /go/src/github.com/hashicorp/terraform \
		hashicorp/terraform:latest \
		destroy -auto-approve
