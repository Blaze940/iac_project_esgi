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
