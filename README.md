# nginx-config

- Change ips for prod for manual deployment.

- In order to dockerize nodejs angular app. Build custom image:
    docker build -t cloudlite-typescript-docker .

- Adjust nginx.conf for logs, create logs folder in /etc/nginx/

- docker run -p 8000:80 -d cloudlite-typescript-docker

# Map host volume with docker directory

- docker run -d -p 3000:3000 -p 8000:80 -v cloudlite-typescript-volume:/root cloudlite-typescript-docker

# AWS Credentials

 - copy .aws read-only folder in /root/

 - add environment variables to bashrc:

    set AWS_SDK_LOAD_CONFIG=1
    set AWS_ACCESS_KEY_ID=
    set AWS_SECRET_ACCESS_KEY=
