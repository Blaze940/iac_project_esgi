# Infrastructure as code project

## Local dev with Docker 
Could be found in the folder `docker/config_local_dev`

### Docker build
In the folder where the Dockerfile is located, run the following command =>

`./docker-build.sh`


### Docker start 
Should be launch with followed with the path to your scripts location like this =>

`./docker-start.sh "path\to\your\volumes"`

### Docker exec 
Run the following command to enter in the container =>
`docker exec -it esgi-iac /bin/zsh`


## Terraform

Go to the folder project `terraform` to use terraform command

### Terraform init
Run the following command to init terraform =>
`terraform init`

### Terraform plan
Run the following command to plan terraform =>
`terraform plan` or 
`terraform plan -out plan.tfplan` if you want to save the plan in a file

### Terraform apply
Run the following command to apply terraform =>
`terraform apply`
